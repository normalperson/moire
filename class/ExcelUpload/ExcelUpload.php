<?php
require_once(dirname(__FILE__).'/../../init.inc.php');
require_once(dirname(__FILE__).'/ExcelFunction.php');
class ExcelUpload{

	function __construct(){
		global $HTML, $GLOBAL, $DB, $USER;
		
	}
	function initSmarty($headerTmpl = "header.html"){
		$smarty = new Smarty();
		$smarty->caching = false;
		$smarty->setTemplateDir(dirname(__FILE__).DS.'templates');
		$smarty->setCompileDir(DOC_DIR.DS.'smarty'.DS.'templates_c');
		$smarty->setCacheDir(DOC_DIR.DS.'smarty'.DS.'cache');
		$smarty->setConfigDir(DOC_DIR.DS.'smarty'.DS.'configs');
		html_header($headerTmpl);
		
		return $smarty;
	}
	function index(){
		$smarty = $this->initSmarty();
		$smarty->display('excelupload.html');

	}
	function impExcelData(){

		header( 'Cache-Control: no-store, no-cache, must-revalidate' ); 
		header( 'Cache-Control: post-check=0, pre-check=0', false ); 
		header( 'Pragma: no-cache' ); 
		set_time_limit(0);

		// file type and extentsion array
		$val = new phi_ExcelValidation();

	    // file type validation
	    if($_FILES){
	    	$extension = (false === $pos = strrpos($_FILES['file']['name'], '.')) ? '' : substr($_FILES['file']['name'], $pos);
	    	if ($_FILES["file"]["error"] > 0 || 
	    		!in_array($extension, $val->valFileExtension()) ||
	    		!in_array($_FILES["file"]["type"],  $val->valFileType()))
	    	{
				echo 'INVALID FILE TYPE OR FORMAT. ONLY ACCEPT .xls or .xlsx';
				return ;	
			}
	    }
		$inputFileName = $_FILES["file"]["tmp_name"];

		// take off the . for the extension
		$extension =  substr($extension, 1);
		$upExcel = new phi_ExcelFunction($inputFileName, $extension);
		$rowstart = 1;
		$chunksize = 10000;
		$upExcel->init($rowstart,$chunksize);

		// while the first cell has data
		while($upExcel->checkCellData()){
			$onlydata = $upExcel->genDataByChunk();
			print 'startrow = '.$rowstart.'<br>';
			print 'chunksize = '.$chunksize.'<br>';
			vd($onlydata);
			unset($onlydata);
			$rowstart += $chunksize;
			$upExcel->disconnect();
			// reinitialize with new rowstart
			$upExcel->init($rowstart,$chunksize);

		}


	}
	
}
?>
