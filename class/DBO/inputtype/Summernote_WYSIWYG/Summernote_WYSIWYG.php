<?php
class DBO_InputType_Summernote_WYSIWYG extends DBO_InputType{
	function getHTML($param){
		global $HTML;
		
		$ret = "";
		extract($param);
		$ret = $HTML->genTextarea($name, $value, $ext);
		$ret .= 
"<script type='text/javascript'>
(function () {
	if (! $('html').hasClass('ie8')) {
		$('#{$name}').summernote({
			height: 200,
			tabsize: 2
		});
	}
})();
</script>";
		
		return $ret;
		
	}
}
?>