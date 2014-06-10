<?php
require_once(CORE_DIR.DS.'inc'.DS.'DocumentManager.inc.php');
class DocManUI {

	var $classurl;
	function __construct() {
		$this->classurl = WEB_HREF.'/'.__CLASS__;
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

	function getFileList($refid, $reftype){
		$doc = new DocumentManager();
		static $DocListCount;
		if($DocListCount) ++$DocListCount;
		else $DocListCount = 1;
		$id="docList_".$DocListCount;
		$docinfo = $doc->getDocInfo($refid,$reftype);
		$smarty = $this->initSmarty();
		$smarty->assign('reftype',$reftype);
		$smarty->assign('id',$id);
		$smarty->assign('downloadurl',WEB_HREF.'/DocManUI/download');
		$smarty->assign('docinfo',$docinfo);
	
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
		readfile($filelocation);		// push it out
		exit();


	}
	function generateFileName($docid,$reftype){
		global $DB;
		$sql = "select * from fcdoc where fd_id = :0";
		$data = $DB->GetRow($sql,array($docid), PDO::FETCH_ASSOC);
		$filelocation = FILEUPLOAD_DIR.DS.APP.DS.$reftype.DS.$docid.".".$data['fd_file_ext'];
		$filename = $data['fd_file_name'];

		return array('filelocation' => $filelocation, 'filename' => $filename);

	}	
	function multiFileDownload($filelist,$reftype){
		$files = array();
		// generate files array
		foreach ($filelist as $key => $value) {
			$file = $this->generateFileName($value,$reftype);
			array_push($files,$file);
		}
		static $zipCount;
		if($zipCount) ++$zipCount;
		else $zipCount = 1;
		$zipname="MOIREZIP_".$zipCount;

		$zip = new ZipArchive;
		$zip->open($zipname, ZipArchive::CREATE);
		foreach ($files as $singlefile) {
		  if(is_file($singlefile['filelocation'])){
		  	//explode(DS, $singlefile['filelocation']);
		  	$tmp = explode(DS, $singlefile['filelocation']);
            $newfilename = end($tmp);     
		  	$zip->addFile($singlefile['filelocation'],'/MOIRE/'.$newfilename);
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
		readfile($zipname);
		unlink($zipname);
		exit();


	}
	function download(){
		$listofdoc = $_REQUEST['docid'];
		$reftype = $_REQUEST['reftype'];

		
		if( in_array('0', $listofdoc) )	array_shift($listofdoc);

		// if only 1 no zip..
		if(count($listofdoc) <= 1){
			// generate the file name
			$fileinfo = $this->generateFileName($listofdoc[0],$reftype);
			$this->singleFileDownload($fileinfo['filelocation'],$fileinfo['filename']);
		}else{
			$this->multiFileDownload($listofdoc,$reftype);				
		}


		// if more than 1 then zip..



	}
	
	function processDropzone() {
		$tmpfile = dirname($_FILES['file']['tmp_name']).DS.'dz_tmp_'.basename($_FILES['file']['tmp_name']);
		
		rename($_FILES['file']['tmp_name'], $tmpfile);
		$_FILES['file']['tmp_name'] = $tmpfile;
		echo json_encode($_FILES['file']);
		
		// clean up old upload files
		$time  = time();
		$oldtmpfiles = glob(dirname($_FILES['file']['tmp_name']).DS.'dz_tmp_*');
		foreach ($oldtmpfiles as $file) {
			if(is_file($file))
				if($time - filemtime($file) >= 60*60) // 1 hour
					unlink($file);
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
	function dropzoneInput($inputname, $maxfilesize = false /*eg. 5M, 500K*/, $maxfiles = 5, $acceptFiles = array()) {
		if (!$maxfilesize) $maxfilesize = ini_get( 'upload_max_filesize' );
		$maxMB = convertBytes($maxfilesize) / 1048576;
		
		$acceptFileString = "";
		if ($acceptFiles) {
			if (is_array($acceptFiles)) $acceptFiles = implode(", ", $acceptFiles);
			$acceptFileString = "acceptedFiles : '{$acceptFiles}', ";
		}
		
		$html = "
		<div id='dropzone-{$inputname}' class='dropzone-box'>
			<input type='hidden' class='dropzone-actual-input' name='{$inputname}' value=''>
			<div class='dz-default dz-message'>
				<i class='fa fa-cloud-upload'></i>
				Drop files in here<br><span class='dz-text-small'>or click to pick manually</span>
			</div>
		</div>";
		
		$js = 
"<script type='text/javascript'>
(function () {
	var \$dropzoneDiv = $('#dropzone-{$inputname}');
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
					\$dropzoneInput.val(JSON.stringify(uploaded));
				})
				\$dropzoneInput.val(JSON.stringify(uploaded));
			}
		}
	});
})();
</script>";
		return $html.$js;
	}
}
?>