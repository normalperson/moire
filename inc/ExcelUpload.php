<?php
/**Class Name: phi_ExcelUpload
  *Description: This is a custom excel upload class to handle for vpos table 
  *Version: 0.1
  *Last modified on: 30 July 2013
  *Author: Eng
  *Available Features:  
  - __construct 	    // Read the excel and store into an array.
  - genColKey		    // Get the first row of excel and store in an array.
  - genData      		// Get the 2nd row onwards of excel and store in an array.
  - imp_VITEM           // Import item into vitem and it handle FIFO or LILO. 
                        // Currently only support for create new item but does not support update inventory through upload excel
  * Features yet to develop :  
   -  Upload excel to update inventory information.
   -  Import category
   -  Import measurement
   -  Import vendor
*/

set_include_path(get_include_path() . PATH_SEPARATOR . '/ExcelClasses/');
require_once(dirname(__FILE__).'/ExcelClasses/PHPExcel/IOFactory.php');

class phi_ExcelUpload {

	protected $objWorksheet;
	protected $maxRow;
	protected $maxCol;

	/**
	* Read the excel and store inside an array.
	* @param string $inputFileName
	* @param ext $ext // to identified using excel 5 or excel 2007 class
	* @return void
	*/	
	public function __construct($inputFileName,$ext){
		if(!$inputFileName || $inputFileName =='')  return 'INVALID FILENAME';

		if(!$ext || $ext =='') return 'INVALID FILE EXTENSION';

		if($ext==="xls")
			$objReader = PHPExcel_IOFactory::createReader('Excel5');  // for excel 2003
		else
			$objReader = PHPExcel_IOFactory::createReader('Excel2007'); // for excel 2007 

		$objReader->setReadDataOnly(true);
		$objPHPExcel = $objReader->load($inputFileName);
		$this->objWorksheet = $objPHPExcel->getActiveSheet();
		$this->maxRow = $this->objWorksheet->getHighestRow();
		$this->maxCol = $this->objWorksheet->getHighestColumn();

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
	public function genDataByChunk($startRow,$chunkSize){
		$chunkFilter = new chunkReadFilter();
		$objReader->setReadFilter($chunkFilter);
		$chunkFilter->setRows($startRow,$chunkSize);

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
?>