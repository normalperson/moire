<?php
require_once(CORE_DIR.DS.'inc'.DS.'DocumentManager.inc.php');
class DocManUI{
	
	static $anonymous_page = array('outputimage','processDropzone');
	var $classurl;
	var $fileListCols;
	var $filelistpreID = 'docList_';
	var $downloadChunk = 10485760; // bytes per chunk (10 MB)
	
	function __construct() {
		$this->classurl = WEB_HREF.'/'.__CLASS__;
		$this->fileListCols = array(
			'fd_created_date'=>'Created Date',
			'fd_created_by'=>'Created By',
			'fd_description'=>'File Description',
			'fd_file_name'=>'File Name',
			'fd_file_size'=>'File Size',
		);
	}

	function initSmarty(){
		$smarty = new Smarty();
		$smarty->caching = false;
		$smarty->setTemplateDir(dirname(__FILE__).DS.'templates');
		$smarty->setCompileDir(DOC_DIR.DS.'smarty'.DS.'templates_c');
		$smarty->setCacheDir(DOC_DIR.DS.'smarty'.DS.'cache');
		$smarty->setConfigDir(DOC_DIR.DS.'smarty'.DS.'configs');
		return $smarty;
	}

	function genDownloadLink($refid, $reftype, $canDelete=false, $sep=" ") {
		$doc = new DocumentManager();
		$docinfo = $doc->getDocInfo($refid,$reftype);
		if ($docinfo && is_array($docinfo)) {
			$linkarr = array();
			foreach ($docinfo as $d) {
				$dlurl = WEB_HREF.'/'.__CLASS__."/download?docid={$d['fd_id']}&reftype={$d['fd_reftype']}";
				$linkarr[] = "<span class='doc_download_tag'><a href='{$dlurl}'><i class='fa fa-download'></i> {$d['fd_file_name']} ({$d['fd_file_size']})</a>
				".($canDelete ? "<button type='button' class='close text-danger' data-fdid='{$d['fd_id']}'>&times;</button>":"")."</span>";
			}
			$js = "";
			if ($canDelete) {
				$js = 
"<script type='text/javascript'>
$(function() {
	$('.doc_download_tag .close').click(function(e) {
		e.preventDefault();
		var \$this = $(this),
			docid = \$this.data('fdid');
		bootbox.confirm({
			message: 'Are you sure you want to remove this file?',
			callback: function(result) {
				if (result) {
					ajaxGetJSON('DocManUI::delete', [docid], function (ret) {
						\$this.closest('.doc_download_tag').fadeOut();
					});
				}
			},
			className: 'bootbox-sm'
		});
	})
})
</script>";
			}
			return implode($sep, $linkarr).$js;
		}
		return false;
	}
	
	var $allowImageOutput = array(
		'jpg'=>'image/jpg',
		'jpeg'=>'image/jpg',
		'jpe'=>'image/jpg',
		'png'=>'image/png',
		'gif'=>'image/gif',
		'bmp'=>'image/bmp',
	);
	
	var $notFoundImage = "image-missing.png";
	
	function outputImage() {
		$docid = (!empty($_REQUEST['docid'])) ? $_REQUEST['docid'] : false;
		$thumbnail = (!empty($_REQUEST['thumbnail'])) ? $_REQUEST['thumbnail'] : false;
		$file = $contenttype = false;
		if ($docid) {
			$ret = $this->generateFileName($docid);
			if ($ret && file_exists($ret['filelocation'])) {
				$ext = strtolower(pathinfo($ret['filelocation'], PATHINFO_EXTENSION));
				$contenttype = (!empty($this->allowImageOutput[$ext])) ? $this->allowImageOutput[$ext] : false;
				$file = $ret['filelocation'];
			}
		}
		
		if (!$contenttype || !$file) {
			$file = DOC_DIR.DS.'image'.DS.$this->notFoundImage;
			$contenttype = 'image/png';
		}
		if ($thumbnail) $this->genThumbnail($file, $thumbnail);
		else {
			$expires= 60 * 60 * 24;
			header('Pragma: public');
			header('Cache-Control: max-age=' . $expires);
			header("Expires: ".date('D, d M Y H:i:s', time() + $expires) . ' GMT');
			header("Content-Type: ".$contenttype); 
			header("Content-Length: ".filesize($file));
			readfile($file);
		}
	}
	

	function genThumbnail($file, $final_width_of_image = 100, $savefile = null) {
		$filename = basename($file);
		$im = false;
		if(preg_match('/[.](jpg)$/', strtolower($filename))) {
			$im = imagecreatefromjpeg($file);
		} else if (preg_match('/[.](gif)$/', strtolower($filename))) {
			$im = imagecreatefromgif($file);
		} else if (preg_match('/[.](png)$/', strtolower($filename))) {
			$im = imagecreatefrompng($file);
		} 
		if (!$im) return false;
		
		$ox = imagesx($im);
		$oy = imagesy($im);
		 
		$nx = $final_width_of_image;
		$ny = floor($oy * ($final_width_of_image / $ox));

		$nm = imagecreatetruecolor($nx, $ny);
		imagecopyresized($nm, $im, 0,0,0,0,$nx,$ny,$ox,$oy);
		
		ob_start();
		imagejpeg($nm, $savefile);
		$output = ob_get_clean();
		if (!$savefile) {
			$expires= 60 * 60 * 24;
			header('Pragma: public');
			header('Cache-Control: max-age=' . $expires);
			header("Expires: ".date('D, d M Y H:i:s', time() + $expires) . ' GMT');
			header("Content-Type: image/jpg"); 
			header("Content-Length: ".strlen($output));
			echo $output;
		}
	}
	
	function getFileList($refid, $reftype, $candelete = false, $cols = false){
		if (!$cols) $cols = $this->fileListCols;
		$doc = new DocumentManager();
		static $DocListCount;
		if($DocListCount) ++$DocListCount;
		else $DocListCount = 1;
		$id= $this->filelistpreID.$DocListCount;
		$docinfo = $doc->getDocInfo($refid,$reftype);
		$smarty = $this->initSmarty();
		$smarty->assign('reftype',$reftype);
		$smarty->assign('id',$id);
		$smarty->assign('downloadurl',WEB_HREF.'/'.__CLASS__.'/download');
		$smarty->assign('docinfo',$docinfo);
		$smarty->assign('candelete',$candelete);
		$smarty->assign('cols',$cols);
		$html = $smarty->fetch('documentlist.html');

		return $html;

	}
	function singleFileDownload($filelocation,$displayname){
		if(!is_file($filelocation)) return 'It is not a file';
		// make sure it's a file before doing anything!

		// required for IE
		if(ini_get('zlib.output_compression')) { ini_set('zlib.output_compression', 'Off');	}

		// get the file mime type using the file extension
		switch(strtolower(substr(strrchr($filelocation, '.'), 1))) {
			case 'pdf': $mime = 'application/pdf'; break;
			case 'zip': $mime = 'application/zip'; break;
			case 'jpeg':
			case 'jpg': $mime = 'image/jpg'; break;
			default: $mime = 'application/force-download';
		}
		header('Pragma: public'); 	// required
		header('Expires: 0');		// no cache
		header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
		header('Last-Modified: '.gmdate ('D, d M Y H:i:s', filemtime ($filelocation)).' GMT');
		header('Cache-Control: private',false);
		header('Content-Type: '.$mime);
		header('Content-Disposition: attachment; filename="'.basename($displayname).'"');
		header('Content-Transfer-Encoding: binary');
		header('Content-Length: '.filesize($filelocation));	// provide file size
		header('Connection: close');
		// readfile($filelocation);		// push it out
		$fh = fopen($filelocation, "r");
		while (!feof($fh)) { 
			echo fread($fh, $this->downloadChunk);
			ob_flush();
			flush();
		}
		exit();
	}
	
	function generateFileName($docid){
		global $DB;
		$sql = "select * from fcdoc where fd_id = :0";
		$data = $DB->GetRow($sql,array($docid), PDO::FETCH_ASSOC);
		if (!$data) return false;
		
		$filelocation = FILEUPLOAD_DIR.DS.APP.DS.$data['fd_reftype'].DS.$docid.".".$data['fd_file_ext'];
		$filename = $data['fd_file_name'];
		return array('filelocation' => $filelocation, 'filename' => $filename);
	}	
	function multiFileDownload($filelist,$destination='DEFAULT/'){
	
		$files = array();
		// generate files array
		foreach ($filelist as $key => $value) {
			$file = $this->generateFileName($value);
			array_push($files,$file);
		}
		$zipname=$destination."_".date('Ymd');
		$zip = new ZipArchive;
		$zip->open($zipname, ZipArchive::CREATE);
		foreach ($files as $singlefile) {
			if(is_file($singlefile['filelocation'])){
				$zip->addFile($singlefile['filelocation'],$singlefile['filename']);
			}
		}
		$zip->close();
		header('Pragma: public'); 	// required
		header('Expires: 0');		// no cache
		header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
		header('Last-Modified: '.gmdate ('D, d M Y H:i:s', filemtime ($zipname)).' GMT');
		header('Cache-Control: private',false);
		header('Content-Type: application/zip');
		header('Content-Disposition: attachment; filename="'.$zipname.'"');
		header('Content-Transfer-Encoding: binary');
		header('Content-Length: '.filesize($zipname));	// provide file size
		header('Connection: close');
		// readfile($zipname);
		$fh = fopen($zipname, "r");
		while (!feof($fh)) { 
			echo fread($fh, $this->downloadChunk);
			ob_flush();
			flush();
		}
		unlink($zipname);
		exit();
	}

	function download(){
		$listofdoc = $_REQUEST['docid'];
		$destination = strtoupper (APP);
		if (is_string($listofdoc)) $listofdoc = array($listofdoc);
		if(!$listofdoc) die('No File to download');

		// if only 1 no zip..
		if(count($listofdoc) <= 1){
			// generate the file name
			$fileinfo = $this->generateFileName($listofdoc[0]);
			$this->singleFileDownload($fileinfo['filelocation'],$fileinfo['filename']);
		}else{
			$this->multiFileDownload($listofdoc,$destination);				
		}
	}
	
	function delete($doclist) {
		if (is_string($doclist)) $doclist = array($doclist);
		$doc = new DocumentManager();
		$result = ($doclist) ? true : false;
		foreach ($doclist as $docid) {
			$ok = $doc->deleteFile($docid);
			if (!$ok) $result = false;
		}
		return $result;
	}
	
	function fallbackDropzone($param=array()) {
		return call_user_func_array(array($this, 'uploader'), $param);
	}
	
	function uploader($inputname, $maxfilesize = false /*eg. 5M, 500K*/, $maxfiles = 5, $acceptFiles = array(), $addattr = '') {
		if (!$maxfilesize || $maxfilesize == 'false') $maxfilesize = ini_get( 'upload_max_filesize' );
		$maxBytes = convertBytes($maxfilesize);
		$acceptFileString = "";
		if ($acceptFiles) {
			if (is_array($acceptFiles)) $acceptFileString = implode(", ", $acceptFiles);
			else $acceptFileString = $acceptFiles;
		}
		$html = "<div class='uploader-container' id='{$inputname}Div'>
					<input type='hidden' class='uploader-actual-input' name='{$inputname}' value='' {$addattr} >
					<span class='btn btn-success uploader-button'>
						<i class='glyphicon glyphicon-plus'></i>
						<span>Select files...</span>
						<input class='uploader-input' type='file' name='file' multiple />
					</span>
					<ul class='list-group uploader-detail' style='margin-top:10px'></ul>
				</div>";
		$js = "
<script type='text/javascript'>
(function () {
	var \$div = $('#{$inputname}Div');
	var \$actual = \$div.find('.uploader-actual-input');
	var uploaded = [];
	var maxsize = {$maxBytes};
	var acceptFiles = ".json_encode($acceptFileString).";
	var validateFiletype = (typeof Dropzone.isValidFile == 'function') ? Dropzone.isValidFile : function(file, acceptedFiles) {
		var baseMimeType, mimeType, validType, _i, _len;
		if (!acceptedFiles) {
		  return true;
		}
		acceptedFiles = acceptedFiles.split(',');
		mimeType = file.type;
		baseMimeType = mimeType.replace(/\/.*$/, '');
		for (_i = 0, _len = acceptedFiles.length; _i < _len; _i++) {
		  validType = acceptedFiles[_i];
		  validType = validType.trim();
		  if (validType.charAt(0) === '.') {
			if (file.name.toLowerCase().indexOf(validType.toLowerCase(), file.name.length - validType.length) !== -1) {
			  return true;
			}
		  } else if (/\/\*$/.test(validType)) {
			if (baseMimeType === validType.replace(/\/.*$/, '')) {
			  return true;
			}
		  } else {
			if (mimeType === validType) {
			  return true;
			}
		  }
		}
		return false;
	};
	
    \$div.find('.uploader-input').fileupload({
		url: '{$this->classurl}/processUploader',
        dataType: 'json',
		add: function (e, data) {
            data.context = $('<li class=\"list-group-item\"/>').html('<div class=\"screen-loader static small\" >').appendTo(\$div.find('.uploader-detail'));
            data.submit();
        },
        done: function (e, data) {
			// validate 
			var errormsg;
			if (data.result.error) {
				errormsg = 'File upload error ('+data.result.error+')';
			}
			if (data.result.size > maxsize) {
				errormsg = 'File is too big ('+humanFileSize(data.result.size)+'). Max filesize : '+humanFileSize(maxsize);
			}
			if (!validateFiletype(data.result, acceptFiles)) {
				errormsg = 'Invalid file type';
			}
			if (errormsg) {
				data.context.html('<span class=\"text-danger\">'+errormsg+'</span>').fadeOut(3000, function () {
					$(this).remove();
				});
				return false;
			}
			var ct = data.result.name+' ('+humanFileSize(data.result.size)+')';
			var \$removeButt = $(\"<button type='button' class='close' title='Remove File'>×</button>\").click(function () {
				var i =	uploaded.indexOf(data.result);
				if (i > -1) uploaded.splice(i, 1);
				data.context.remove();
				\$actual.val((uploaded && uploaded.length>0) ? JSON.stringify(uploaded) : '');
			});
			uploaded.push(data.result);
            data.context.html(ct).prepend(\$removeButt);
			\$actual.val((uploaded && uploaded.length>0) ? JSON.stringify(uploaded) : '');
        },
		fail: function (e, data) {
			data.context.html('<span class=\"text-danger\">Upload Failed</span>').fadeOut(3000, function () {
				$(this).remove();
			});
		}
    })
})();
</script>";
		return $html.$js;
	}
	
	function processUploader() {
		if (!empty($_FILES)) {
			$tmpfile = dirname($_FILES['file']['tmp_name']).DS.'upl_tmp_'.basename($_FILES['file']['tmp_name']);
			move_uploaded_file($_FILES['file']['tmp_name'], $tmpfile);
			$_FILES['file']['tmp_name'] = $tmpfile;
			echo json_encode($_FILES['file']);
			
			// clean up old tmp upload files
			$time  = time();
			$oldtmpfiles = glob(dirname($_FILES['file']['tmp_name']).DS.'upl_tmp_*');
			foreach ($oldtmpfiles as $file) {
				if(is_file($file))
					if($time - filemtime($file) >= 60*60) // 1 hour
						unlink($file);
			}
		}
	}
	
	function processDropzone() {
		if (!empty($_FILES)) {
			$tmpfile = dirname($_FILES['file']['tmp_name']).DS.'dz_tmp_'.basename($_FILES['file']['tmp_name']);
			move_uploaded_file($_FILES['file']['tmp_name'], $tmpfile);
			$_FILES['file']['tmp_name'] = $tmpfile;
			echo json_encode($_FILES['file']);
			
			// clean up old tmp upload files
			$time  = time();
			$oldtmpfiles = glob(dirname($_FILES['file']['tmp_name']).DS.'dz_tmp_*');
			foreach ($oldtmpfiles as $file) {
				if(is_file($file))
					if($time - filemtime($file) >= 60*60) // 1 hour
						unlink($file);
			}
		}
	}
	
	/*
		$maxfilesize : Maximum file size per file , eg. 5M, 500K, 1G
		$maxfiles : Number of files can be uploaded through this drop box
		$acceptFiles : mime types or extensions 
			eg. array(
					'image/*',
					'application/pdf',
					'.psd'
				)
	*/

	function dropzoneInput($inputname, $maxfilesize = false /*eg. 5M, 500K*/, $maxfiles = 5, $acceptFiles = array(), $addattr = '') {
		if (!$maxfilesize) $maxfilesize = ini_get( 'upload_max_filesize' );
		$maxMB = convertBytes($maxfilesize) / 1048576;
		$acceptFileString = "";
		if ($acceptFiles) {
			if (is_array($acceptFiles)) $acceptFiles = implode(", ", $acceptFiles);
			$acceptFileString = "acceptedFiles : '{$acceptFiles}', ";
		}
		
		$html = "
		<div id='dropzone-{$inputname}' class='dropzone-box'>
			<input type='hidden' class='dropzone-actual-input' id='{$inputname}' name='{$inputname}' value='' {$addattr} >
			<div class='dz-default dz-message'>
				<i class='fa fa-cloud-upload'></i>
				<div class='hidden-xs'>Drop files in here<br><span class='dz-text-small'>or click to pick manually</span></div>
			</div>
		</div>";
		
		$js = 
"<script type='text/javascript'>
(function () {
	var \$dropzoneDiv = $('#'+escapeSelectorStr('dropzone-{$inputname}'));
	var \$dropzoneInput = \$dropzoneDiv.find('.dropzone-actual-input');
	var uploaded = [];
	\$dropzoneDiv.dropzone({
		url: '{$this->classurl}/processDropzone',
		paramName: 'file', // The name that will be used to transfer the file
		maxFilesize: {$maxMB}, // MB
		maxFiles: {$maxfiles},
		addRemoveLinks : true,
		dictResponseError: 'Cannot upload file!',
		thumbnailWidth: 138,
		thumbnailHeight: 120,
		method : 'post',
		fallback : function () {
			\$dropzoneDiv.html(\"<div class='screen-loader static'></div>\");
			ajaxRenderHTML('{$this->classurl}::fallbackDropzone', [".json_encode(func_get_args())."], \$dropzoneDiv, 'replaceWith');
		},
		{$acceptFileString}
		previewTemplate: '<div class=\"dz-preview dz-file-preview\"><div class=\"dz-details\"><div class=\"dz-filename\"><span data-dz-name></span></div><div class=\"dz-size\">File size: <span data-dz-size></span></div><div class=\"dz-thumbnail-wrapper\"><div class=\"dz-thumbnail\"><img data-dz-thumbnail><span class=\"dz-nopreview\">No preview</span><div class=\"dz-success-mark\"><i class=\"fa fa-check-circle-o\"></i></div><div class=\"dz-error-mark\"><i class=\"fa fa-times-circle-o\"></i></div><div class=\"dz-error-message\"><span data-dz-errormessage></span></div></div></div></div><div class=\"progress progress-striped active\"><div class=\"progress-bar progress-bar-success\" data-dz-uploadprogress></div></div></div>',

		resize: function(file) {
			var info = { srcX: 0, srcY: 0, srcWidth: file.width, srcHeight: file.height },
				srcRatio = file.width / file.height;
			if (file.height > this.options.thumbnailHeight || file.width > this.options.thumbnailWidth) {
				info.trgHeight = this.options.thumbnailHeight;
				info.trgWidth = info.trgHeight * srcRatio;
				if (info.trgWidth > this.options.thumbnailWidth) {
					info.trgWidth = this.options.thumbnailWidth;
					info.trgHeight = info.trgWidth / srcRatio;
				}
			} else {
				info.trgHeight = file.height;
				info.trgWidth = file.width;
			}
			return info;
		},
		success : function (file, response) {
			if (file.status == Dropzone.SUCCESS) {
				$(file.previewElement).find('.progress').removeClass('progress-striped').removeClass('active');
				var fileObj = JSON.parse(response);
				uploaded.push(fileObj);
				$(file.previewElement).find('.dz-remove').click(function (e) {
					var i =	uploaded.indexOf(fileObj);
					if (i > -1) uploaded.splice(i, 1);
					\$dropzoneInput.val((uploaded && uploaded.length>0) ? JSON.stringify(uploaded) : '').trigger('change');
				})
				\$dropzoneInput.val((uploaded && uploaded.length>0) ? JSON.stringify(uploaded) : '').trigger('change');
			}
		}
	});
	
	\$dropzoneInput.data('dropzone', Dropzone.forElement(\$dropzoneDiv[0]));
	\$dropzoneInput.on('disable', function() {
		var \$t = $(this).val('').prop('disabled', true);
			dz = \$t.data('dropzone');
		dz.removeAllFiles(true);
		dz.disable();
		\$dropzoneDiv.addClass('disabled');
	}).on('enable', function() {
		$(this).prop('disabled', false);
		$(this).data('dropzone').enable();
		\$dropzoneDiv.removeClass('disabled');
	})
	
})();
</script>";
		return $html.$js;
	}	
	/**
    * Insert single record inside fcdoc
    * @param file $file 
    * @param array $imageproperties
    * @param integer $iJpgQuality
    * @param string $retmsg
    * @return boolean
    */  
	function jcropImage($file,$imageproperties,$iJpgQuality=90,&$retmsg=''){

		// control image size && $cols['image']['file']['size'] < 250 * 1024

		// if no width, just return the entire file
		if($imageproperties['w'] != ''){
	        // create image
	        $vImg = $this->imagecreatefromfile($file['tmp_name']);
	        
	        // create a new true color image
	        $vDstImg = @imagecreatetruecolor( $imageproperties['w'], $imageproperties['h'] );
	        imagecopyresampled($vDstImg, $vImg, 0, 0, (int)$imageproperties['x1'], (int)$imageproperties['y1'], $imageproperties['w'], $imageproperties['h'] , (int)$imageproperties['w'], (int)$imageproperties['h']);

	        imagejpeg($vDstImg, $file['tmp_name'], $iJpgQuality);
		}


        return $file;

	}
	function imagecreatefromfile($imagepath=false) { 
	    if(!$imagepath || !is_readable($imagepath) ) return false; 
	    return @imagecreatefromstring(file_get_contents($imagepath)); 
	} 
}
?>