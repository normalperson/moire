<?php
class DBO_InputType_MultiSelect2 extends DBO_InputType{
	function getHTML($param){
		global $HTML;
		$ret = "";
		extract($param);
		$options = array();
		$optionMethod = $dbo->cols[$col]->option->getMethod($state);
		$optionString = $dbo->cols[$col]->option->get($state);
		if(strlen($optionString)) $options = $dbo->genOption($optionMethod, $optionString, $data);
		$ext .= " multiple ";
		$name .= "[]";
		$val = explode(',', $value);
		$val = array_map('trim', $val);
		$ret .= $HTML->genInput("select", $name, $options, $val, $ext);
		$option = ($dbo->cols[$col]->format) ? $dbo->cols[$col]->format : false;
		$ret .= 
"<script type='text/javascript'>
(function () {
	var name = '#{$name}';
	if(name.indexOf('[') !== -1) name = name.replace(/(\[|\])/g, '\\\\$1');
	$(name).select2(".(($option)? $option : '').");
})();
</script>";

		return $ret;
		
	}
}
?>