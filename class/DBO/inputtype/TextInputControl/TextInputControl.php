<?php
class DBO_InputType_TextInputControl extends DBO_InputType{
	function getHTML($param){
		global $HTML;
		extract($param);
		$o = $dbo->cols[$col];
		$datatype = ($o->displayDataType) ? $o->displayDataType : $o->datatype;
		$mask = false;
		$length = ($o->maxlength >= 0) ? $o->maxlength : 0;
		$precision = ($o->precision >= 0) ? $o->precision : 0;
		$maxlength = ($o->size) ? $o->size : $length+$precision;
		
		if ($o->format) $mask = "'".$o->format."'";
		else {
			if (strpos($datatype, 'int')!==false) {
				$mask = "'integer', { rightAlign: false }";
			}
			else if (strpos($datatype, 'num')!==false || strpos($datatype, 'float')!==false || strpos($datatype, 'currency')!==false){ // number
				$mask = "'decimal', { rightAlign: false , digits: 2 }";
				$maxlength = $maxlength + 1; // for the decimal point
			}
		}
		$ext .= " maxlength={$maxlength} ";
		$ret = $HTML->genInput('text', $name, $value, $ext);
		if ($mask) {
			$ret .= "<script type='text/javascript'>$('#{$name}').inputmask({$mask})</script>";
		}
	
		return $ret;
	}
}
?>