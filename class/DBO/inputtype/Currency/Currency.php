<?php
class DBO_InputType_Currency extends DBO_InputType{
	function getHTML($param){
		global $HTML;
		extract($param);
		$o = $dbo->cols[$col];
		$option = ($o->format) ? $o->format : false;
		$namedisp = $name."_disp";
		$ret = $HTML->genInput('hidden', $name, $value, $ext);
		$ret .= $HTML->genInput('text', $namedisp, $value, $ext);
		$ret .= 
"<script type='text/javascript'>
(function () {
	var \$actualinp = $('#{$name}');
	$('#{$namedisp}').on('blur change',function () {
		var formatted = accounting.formatMoney($(this).val() ".($option ? ",".$option : '').");
		$(this).val(formatted);
		\$actualinp.val(formatted.replace(/[^0-9.]/g, ''));
	}).change();
})();
</script>";
		return $ret;
	}
}
?>