<?php
class DBO_InputType_BootstrapDateTime extends DBO_InputType{
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
		<div class='col-sm-7 no-padding'>
			<div class='input-group date' id='{$name}-datepicker-component'>
				<input type='text' class='form-control' id='{$name}-datepicker-input' value='".(($datetime) ? $datetime->format('d-M-Y') : '')."'>
				<span class='input-group-addon'><i class='fa fa-calendar'></i></span>
			</div>
		</div>
		<div class='col-sm-5 no-padding'>
			<div class='input-group date' id='{$name}-timepicker-component'>
				<input type='text' class='form-control' id='{$name}-timepicker-input' value='".(($datetime) ? $datetime->format('g:i A') : '')."'>
				<span class='input-group-addon'><i class='fa fa-clock-o'></i></span>
			</div>
		</div>";
		$ret .= 
"<script type='text/javascript'>
(function () {
	var \$actualInput = $('#{$name}'),
		\$dateInput = $('#{$name}-datepicker-input'),
		\$timeInput = $('#{$name}-timepicker-input');
	
	$('#{$name}-datepicker-component').datepicker({
		format: 'dd-M-yyyy',
		todayBtn: 'linked',
		todayHighlight: true
	}).on('changeDate', function (e) {
		setActualInput();
	}).on('clearDate', function (e) {
		setActualInput();
	})
	$('#{$name}-timepicker-input').timepicker({
		defaultTime: false
	}).on('changeTime.timepicker', function(e) {
		setActualInput();
	}).on('change', function (e) {
		if (this.value == '') {
			setActualInput();
		}
	})
	function setActualInput() {
		var newdt = \$dateInput.val() + ' ' + \$timeInput.val();
		var dt = moment(newdt, 'DD-MMM-YYYY hh:mm A');
		var newval = dt.format('YYYY-MM-DD HH:mm:ss');
		if (newval == 'Invalid date') \$actualInput.val(newdt.trim())
		else \$actualInput.val(newval)
	}
	if (!\$timeInput.val()) \$timeInput.timepicker('clear');
	
})();
</script>";
		
		return $ret;
		
	}
}
?>