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
		$ret .= $HTML->genInput("select", $name, $options, $value, $ext);
		$ret .= 
"<script type='text/javascript'>
(function () {
	var name = '#{$name}';
	if(name.indexOf('[') !== -1) name = name.replace(/(\[|\])/g, '\\\\$1');
	$(name).select2();
})();
</script>";

		return $ret;
		
	}
}
?>