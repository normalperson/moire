<?php
class DBO_InputType_BootstrapDateRange extends DBO_InputType{
	var $inputTypeNature = 'rangedate';
	function getHTML($param){
		global $HTML, $DATEFORMAT;
		$ret = "";
		extract($param);
		// if ($value) $datetime = new DateTime($value);
		// else $datetime = false;
		$values = explode(' - ', $value);
		if(count($values)==1) $values[] = '';
		$formattedValues = array();
		foreach($values as $v){
			if(strlen($v)){
				if(!empty($DATEFORMAT['date']['php'])){
					// $f = str_replace('yyyy', 'Y', $DATEFORMAT['date']['datepicker']);
					$formattedValues[] = date($DATEFORMAT['date']['php'], strtotime($v));
					// $formattedValues[] = $v;
				}
			}else{
				$formattedValues[] = '';
			}
		}
		$ret = $HTML->genInput('text',$name, $value , 'style="display:none"')."
			<div class='input-daterange input-group' id='{$name}-range'>
				<input type='text' class='input-sm form-control' name='start' placeholder='Start date' value='".$formattedValues[0]."'>
				<span class='input-group-addon'>to</span>
				<input type='text' class='input-sm form-control' name='end' placeholder='End date' value='".$formattedValues[1]."'>
			</div>";
			
		$ret .= 
"<script type='text/javascript'>
(function () {
	var \$actualInput = $('#{$name}'),
		\$dateInput = $('#{$name}-range');
	
	\$dateInput.datepicker({
		".(!empty($DATEFORMAT['date']['datepicker']) ?  "format: '{$DATEFORMAT['date']['datepicker']}'," : "")."
		todayBtn: 'linked',
		todayHighlight: true
	}).on('changeDate', function (e) {
		setActualInput();
	}).on('clearDate', function (e) {
		setActualInput();
	})
	
	function setActualInput() {
		var fromdt = \$dateInput.find('[name=start]').val(),
			todt = \$dateInput.find('[name=end]').val();
		
		var fromdt = moment(fromdt ".(!empty($DATEFORMAT['date']['moment']) ? ", '{$DATEFORMAT['date']['moment']}'" : "" ).");
		var todt = moment(todt ".(!empty($DATEFORMAT['date']['moment']) ? ", '{$DATEFORMAT['date']['moment']}'" : "" ).");
		//var fromdt = moment(fromdt, 'YYYY-MM-DD');
		//var todt = moment(todt, 'YYYY-MM-DD');
		var fromstr = fromdt.format('YYYY-MM-DD');
		var tostr = todt.format('YYYY-MM-DD');
		
		var retstr = ((fromstr == 'Invalid date') ? '' : fromstr ) + ' - ' + ((tostr == 'Invalid date') ? '' : tostr );
		if (retstr == ' - ') retstr = '';
		\$actualInput.val(retstr)
		\$actualInput.keyup();
	}
	
	\$actualInput.on('disable', function (e) {
		\$dateInput.find(':input').prop('disabled', true).val('');
	}).on('enable', function (e) {
		\$dateInput.find(':input').prop('disabled', false);
	})
	
})();
</script>";
		
		return $ret;
		
	}
}
?>