<?php
/**Class Name: phi_ExcelFunction
  *Description: This is a generic excel function that consists multiple function to help programmer read / write into excel
  *Version: 0.1
  *Last modified on: 21 April 2014
  *Author: Eng
  *Available Features:  
  - __construct 	    // Read the excel and store into an array.
  - genColKey		    // Get the first row of excel and store in an array.
  - genData      		// Get the 2nd row onwards of excel and store in an array.
  - genDataByChunk      // Get the data by chunk
  * Features yet to develop :  
*/

set_include_path(get_include_path() . PATH_SEPARATOR . '/ExcelClasses/');
require_once(CORE_DIR.DS.'inc'.DS.'PHPExcel'.DS.'Classes'.DS.'PHPExcel'.DS.'IOFactory.php');		

class phi_ExcelFunction {

	protected $objWorksheet;
	protected $objPHPExcel;
	protected $maxRow;
	protected $maxCol;
	protected $objReader;
	protected $inputFileName;
	protected $benchmark = 1; /*1 to enable benchmark; 0 to disable*/
	protected $startRow =1;


	/**
	* Read the excel and store inside an array.
	* @param string $inputFileName
	* @param ext $ext // to identified using excel 5 or excel 2007 class
	* @return void
	*/	
	public function __construct($inputFileName,$ext){
		
		if(!$inputFileName || $inputFileName =='')  return 'INVALID FILENAME';
		else $this->inputFileName = $inputFileName;

		if(!$ext || $ext =='') return 'INVALID FILE EXTENSION';

		if($ext==="xls")
			$this->objReader = PHPExcel_IOFactory::createReader('Excel5');  // for excel 2003
		else
			$this->objReader = PHPExcel_IOFactory::createReader('Excel2007'); // for excel 2007 

		

	}
	public function init($startRow=1, $chunkSize=0){
		$callStartTime = microtime(true);
		$this->objReader->setReadDataOnly(true);

		if($chunkSize!=0){
			$chunkFilter = new chunkReadFilter();
			$chunkFilter->setRows($startRow,$chunkSize);
			$this->objReader->setReadFilter( $chunkFilter );
			$this->startRow = $startRow;
		}
		$this->objPHPExcel = $this->objReader->load($this->inputFileName);
		$this->objWorksheet = $this->objPHPExcel->getActiveSheet();
		$this->maxRow = $this->objWorksheet->getHighestRow();
		$this->maxCol = $this->objWorksheet->getHighestColumn();
		$callEndTime = microtime(true);
		$callTime = $callEndTime - $callStartTime;

		// Echo memory peak usage
		if($this->benchmark) {
			echo date('H:i:s') , " Peak memory usage: " , (memory_get_peak_usage(true) / 1024 / 1024) , " MB" , "<br>";
			echo 'Time to load the workbook with filter ' , sprintf('%.4f',$callTime) , " seconds" , "<br>";
		}


	}

	/**
	* Get the excel first row and generate column name array
	* @return Array
	*/	
	public function genColKey(){
		$row = 1; // first row in the excel
		$retArray = array();
		for ($col = 'A'; $col <= $this->maxCol; ++$col){
			if($this->objWorksheet->getCell("$col$row")->getValue() . "" == "")
				$retArray[] = null;
			else
				$retArray[] = $this->objWorksheet->getCell("$col$row")->getValue();
		}
		return $retArray;
	}
	/**
	* Get the 2nd row onwards and generate the data array
	* @return Array
	*/	
	public function genData(){
		$retArray = array();
		$i=0;
		for ($row = 2; $row <= $this->maxRow; ++$row){   
			$colArray = array();
			for ($col = 'A'; $col <= $this->maxCol; ++$col){
				if($this->objWorksheet->getCell("$col$row")->getValue() . "" == "")
					$colArray[] = null;
				else
					$colArray[] = $this->objWorksheet->getCell("$col$row")->getValue();
			}
			$retArray[$i] = $colArray;
			$i++;
		}
		return $retArray;
	}
	public function genDataByChunk(){
		$retArray = array();
		$i=0;
		for ($row = $this->startRow; $row <= $this->maxRow; ++$row){   
			$colArray = array();
			for ($col = 'A'; $col <= $this->maxCol; ++$col){
				if($this->objWorksheet->getCell("$col$row")->getValue() . "" == "")
					$colArray[] = null;
				else
					$colArray[] = $this->objWorksheet->getCell("$col$row")->getValue();
			}
			$retArray[$i] = $colArray;
			$i++;
		}
		return $retArray;

	}
	public function checkCellData(){
		$col = 'A';
		$row = $this->startRow;
		print 'col = '.$col.'<br>';
		print 'row = '.$row.'<br>';
		print 'cell value = '.$this->objWorksheet->getCell("$col$row")->getValue(). "";
		if($this->objWorksheet->getCell("$col$row")->getValue() . "" == "")
			return false;
		else 
			return true;
	}
	public function disconnect(){
		//    Free up some of the memory 
	    $this->objPHPExcel->disconnectWorksheets(); 
	    unset($this->objPHPExcel); 
	    if($this->benchmark) {
			echo date('H:i:s') , " After diconnect Peak memory usage: " , (memory_get_peak_usage(true) / 1024 / 1024) , " MB" , "<br>";
		}

	}

}

/**  Define a Read Filter class implementing PHPExcel_Reader_IReadFilter  */
# Example
/**  Define how many rows we want to read for each "chunk"  **/
/*$chunkSize = 20;*/
/**  Create a new Instance of our Read Filter  **/
/*$chunkFilter = new chunkReadFilter();*/
/**  Tell the Reader that we want to use the Read Filter that we've Instantiated  **/
/*$objReader->setReadFilter($chunkFilter);*/

/**  Loop to read our worksheet in "chunk size" blocks  **/
/**  $startRow is set to 2 initially because we always read the headings in row #1  **/
class chunkReadFilter implements PHPExcel_Reader_IReadFilter
{
    private $_startRow = 0;

    private $_endRow = 0;

    /**  Set the list of rows that we want to read  */
    public function setRows($startRow, $chunkSize) {
        $this->_startRow    = $startRow;
        $this->_endRow        = $startRow + $chunkSize;
    }

    public function readCell($column, $row, $worksheetName = '') {
        //  Only read the heading row, and the rows that are configured in $this->_startRow and $this->_endRow
        if (($row == 1) || ($row >= $this->_startRow && $row < $this->_endRow)) {
            return true;
        }
        return false;
    }
}

//echo 'Loading file ',pathinfo($inputFileName,PATHINFO_BASENAME),' using IOFactory with a defined reader type of ',$inputFileType,'<br />';
/**  Create a new Reader of the type defined in $inputFileType  **/

/*$objReader = PHPExcel_IOFactory::createReader($inputFileType);*/

/**  Define how many rows we want to read for each "chunk"  **/
/*$chunkSize = 20;*/
/**  Create a new Instance of our Read Filter  **/
/*$chunkFilter = new chunkReadFilter();*/

/**  Tell the Reader that we want to use the Read Filter that we've Instantiated  **/
/*$objReader->setReadFilter($chunkFilter);*/

/**  Loop to read our worksheet in "chunk size" blocks  **/
/**  $startRow is set to 2 initially because we always read the headings in row #1  **/

/*for ($startRow = 2; $startRow <= 240; $startRow += $chunkSize) {
    echo 'Loading WorkSheet using configurable filter for headings row 1 and for rows ',$startRow,' to ',($startRow+$chunkSize-1),'<br />';*/
    /**  Tell the Read Filter, the limits on which rows we want to read this iteration  **/
/*    $chunkFilter->setRows($startRow,$chunkSize);*/
    /**  Load only the rows that match our filter from $inputFileName to a PHPExcel Object  **/
/*    $objPHPExcel = $objReader->load($inputFileName);*/

    //    Do some processing here

/*    $sheetData = $objPHPExcel->getActiveSheet()->toArray(null,true,true,true);
    var_dump($sheetData);
    echo '<br /><br />';
}*/

class phi_ExcelValidation{
	
	protected $filetype = array("application/vnd.ms-excel", "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
	protected $fileextension = array(".xls", ".xlsx");

	public function __construct(){

	}
	public function valFileType(){
		return $this->filetype;
	}
	public function valFileExtension(){
		return $this->fileextension;
	}

}
?>