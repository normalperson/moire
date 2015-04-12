<?php
class DBO_InputType_BootstrapDateTime extends DBO_InputType{
	function getHTML($param){
		global $HTML, $DATEFORMAT;
		$ret = "";
		extract($param);
		if ($value) $datetime = new DateTime($value);
		else $datetime = false;
		$ret = "
		<div class='clearfix'>
			<div class='col-sm-7 no-padding'>
				<div class='input-group date' id='{$name}-datepicker-component'>
					<input type='text' class='form-control' id='{$name}-datepicker-input' value='".(($datetime) ? $datetime->format($DATEFORMAT['date']['php']) : '')."'>
					<span class='input-group-addon'><i class='fa fa-calendar'></i></span>
				</div>
			</div>
			<div class='col-sm-5 no-padding'>
				<div class='input-group date' id='{$name}-timepicker-component'>
					<input type='text' class='form-control' id='{$name}-timepicker-input' value='".(($datetime) ? $datetime->format('g:i A') : '')."'>
					<span class='input-group-addon'><i class='fa fa-clock-o'></i></span>
				</div>
			</div>
		</div>
		<div class='clearfix'>".$HTML->genInput('text',$name, $value, "style='display:none'")."</div>";
		$ret .= 
"<script type='text/javascript'>
(function () {
	var \$actualInput = $('#{$name}'),
		\$dateInput = $('#{$name}-datepicker-input'),
		\$timeInput = $('#{$name}-timepicker-input');
	
	var \$dpc = $('#{$name}-datepicker-component').datepicker({
		".(!empty($DATEFORMAT['date']['datepicker']) ?  "format: '{$DATEFORMAT['date']['datepicker']}'," : "")."
		todayBtn: 'linked',
		todayHighlight: true,
	}).on('changeDate', function (e) {
		setActualInput();
	}).on('clearDate', function (e) {
		setActualInput();
	});
	
	var \$dpcaddon = \$dpc.find('.input-group-addon').on('click', $.proxy(function (e) {
		var isdisabled = $(this).siblings('#{$name}-datepicker-input').prop('disabled');
		if (isdisabled) e.stopImmediatePropagation();
	}))
	$._data(\$dpcaddon[0],'events').click.reverse();
	
	\$timeInput.timepicker({
		defaultTime: false,
		disableMousewheel : true
	}).on('changeTime.timepicker', function(e) {
		setActualInput();
	}).on('change', function (e) {
		if (this.value == '') {
			setActualInput();
		}
	})
	function setActualInput() {
		var oritime = \$timeInput.val();
		var newdt = \$dateInput.val() + ' ' + oritime;
		var dt = moment(newdt".(!empty($DATEFORMAT['datetime']['moment']) ? ", '{$DATEFORMAT['datetime']['moment']}'" : "" ).");
		var newval = dt.format('YYYY-MM-DD HH:mm:ss');
		if (newval == 'Invalid date') \$actualInput.val('')
		else {
			if (!oritime) \$timeInput.val(dt.format('h:mm A'));
			\$actualInput.val(newval);
		}
		\$actualInput.keyup();
		\$actualInput.change();
	}
	\$actualInput.on('setval', function (e) {
		if (this.value) {
			var dt = moment(this.value);
			\$dateInput.val(dt.format('{$DATEFORMAT['date']['moment']}'));
			\$dpc.data('datepicker').update();
			\$timeInput.timepicker('setTime', dt.format('h:mm A'));
		}
	})
	
	if (!\$timeInput.val()) \$timeInput.timepicker('clear');
	
	\$actualInput.on('disable', function (e) {
		\$dateInput.prop('disabled', true).val('');
		\$timeInput.prop('disabled', true).val('');
	}).on('enable', function (e) {
		\$dateInput.prop('disabled', false);
		\$timeInput.prop('disabled', false);
	})
	
})();
</script>";
		
		return $ret;
		
	}
}
?>