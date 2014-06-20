<?php
class DBO_InputType_Select2 extends DBO_InputType{
	function getHTML($param){
		global $HTML;
		$ret = "";
		extract($param);
		$options = array();
		$optionMethod = $dbo->cols[$col]->option->getMethod($state);
		$optionString = $dbo->cols[$col]->option->get($state);
		if(strlen($optionString)) $options = $dbo->genOption($optionMethod, $optionString, $data);
			
		$ret .= $HTML->genInput("select", $name, $options, $value, $ext);
		$ret .= 
"<script type='text/javascript'>
(function () {
	$('#{$name}').select2();
})();
</script>";

		return $ret;
		
	}
}
?>