<?php
class DBO_InputType_BootstrapDate extends DBO_InputType{
	function getHTML($param){
		global $HTML;
		$ret = "";
		extract($param);
		if ($value) {
			try {
				$datetime = new DateTime($value);
			}
			catch (Exception $e) {
				$datetime = false;
			}
		}
		else $datetime = false;
		$ret = $HTML->genInputHidden($name, $value, $ext)."
			<div class='input-group date' id='{$name}-datepicker-component'>
				<input type='text' class='form-control' id='{$name}-datepicker-input' value='".(($datetime) ? $datetime->format('d-M-Y') : '')."'>
				<span class='input-group-addon'><i class='fa fa-calendar'></i></span>
			</div>";
		$ret .= 
"<script type='text/javascript'>
(function () {
	var \$actualInput = $('#{$name}'),
		\$dateInput = $('#{$name}-datepicker-input');
	$('#{$name}-datepicker-component').datepicker({
		format: 'dd-M-yyyy',
		todayBtn: 'linked',
		todayHighlight: true
	}).on('changeDate', function (e) {
		setActualInput();
	}).on('clearDate', function (e) {
		setActualInput();
	})
	
	function setActualInput() {
		var newdt = \$dateInput.val();
		var dt = moment(newdt, 'DD-MMM-YYYY');
		var newval = dt.format('YYYY-MM-DD');
		if (newval == 'Invalid date') \$actualInput.val(newdt.trim())
		else \$actualInput.val(newval)
	}
	
})();
</script>";
		
		return $ret;
		
	}
}
?>