<?php
class DBO_InputType_BootstrapTime extends DBO_InputType{
	function getHTML($param){
		global $HTML;
		$ret = "";
		extract($param);

		$ret = "<div class='input-group date'>
					<input type='text' class='form-control' id='{$name}' name='{$name}' value='{$value}'>
					<span class='input-group-addon'><i class='fa fa-clock-o'></i></span>
				</div>";
		$ret .= 
"<script type='text/javascript'>
(function () {
	var \$timeInput = $('#{$name}').timepicker({
		defaultTime: false
	})
	//if (!\$timeInput.val()) \$timeInput.timepicker('clear');
})();
</script>";
		
		return $ret;
		
	}
}
?>