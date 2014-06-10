<?php
class DBO_InputType_TextareaAutosize extends DBO_InputType{
	function getHTML($param){
		global $HTML;
		$ret = "";
		extract($param);
		$size = $dbo->cols[$col]->size;
		
		$ret = $HTML->genTextarea($name, $value, $ext);
		
		$ret .= 
"<script type='text/javascript'>
(function () {
	$('#{$name}')".(($size) ? ".attr('rows', {$size})" : "").".autosize();
})();
</script>";
		
		return $ret;
		
	}
}
?>