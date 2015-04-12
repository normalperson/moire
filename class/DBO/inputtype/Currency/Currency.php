<?php
class DBO_InputType_Currency extends DBO_InputType{
	function getHTML($param){
		global $HTML;
		extract($param);
		$o = $dbo->cols[$col];
		$option = ($o->format) ? $o->format : false;
		$namedisp = $name."_disp";
		$ret = $HTML->genInput('text', $name, $value, 'style="display:none"');
		$ret .= $HTML->genInput('text', $namedisp, $value, $ext);
		$ret .= 
"<script type='text/javascript'>
(function () {
	var \$actualinp = $('#{$name}');
	$('#{$namedisp}').on('blur change',function () {
		var currval = $(this).val(),
			formatted = (currval) ? accounting.formatMoney(currval ".($option ? ",".$option : '').") : '';
		$(this).val(formatted);
		\$actualinp.val(formatted.replace(/[^0-9.]/g, '')).keyup(); //keyup for jquery validation
	}).change();
})();
</script>";
		return $ret;
	}
}
?>