<?php
class DBO_InputType_TextareaAutosize extends DBO_InputType{
	function getHTML($param){
		global $HTML;
		$ret = "";
		extract($param);
		$ret = $HTML->genTextarea($name, $value, $ext);
		$ret .= 
"<script type='text/javascript'>
(function () {
	$('#{$name}').autosize();
})();
</script>";
		
		return $ret;
		
	}
}
?>