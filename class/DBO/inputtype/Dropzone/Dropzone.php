<?php
class DBO_InputType_Dropzone extends DBO_InputType{
	function getHTML($param){
		global $HTML;
		$ret = "";
		extract($param);
		include_once(CLASS_DIR.DS.'DocManUI'.DS.'DocManUI.php');
		$dm = new DocManUI();
		$maxfilesize = false;
		$maxfiles = 5;
		$acceptFiles = array();
		$limit = trim($dbo->cols[$col]->size);
		if ($limit) {
			$limitarr = explode('/', $limit); // eg. 5M/3 : can upload up to 3 files and each file must not exceed 5MB
			if (!empty($limitarr[0])) $maxfilesize = $limitarr[0];
			if (!empty($limitarr[1])) $maxfiles = $limitarr[1];
		}
		if (trim($dbo->cols[$col]->format)) {
			$acceptFiles = $dbo->cols[$col]->format;
		}

		$ret = $dm->dropzoneInput($name, $maxfilesize, $maxfiles, $acceptFiles);
		return $ret;
	}
}
?>