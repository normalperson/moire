<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'ackjob.conf.php');
function timer($colname,$colval,$rowinfo){

	$now = date('d-M-Y H:i:s');
	// convert to date
	$requesttime = strtotime($rowinfo['js_request_date']);
	$currentime = strtotime($now);
	$diffinmin = floor(abs($currentime - $requesttime) / 60);

	$div = '<div id="timer_"'.$rowinfo['js_id'].'">'.$diffinmin.' </div>';

	return $div;

}


# customization
function dbo_ackjob_customize(&$dbo){
}


# final rendering
$dbo->render();
?>
<script type="text/javascript">
	window.setInterval(function(){
	  /// call your function here
	  recalculatetime();
	}, 60000);
function recalculatetime(){
	$('div[id^="timer_"]').each(function(){
		$this = $(this);
		newmin = parseFloat($this.text()) + 1;
		$this.animate({ backgroundColor: "#007FFF"}, 100)
			 .animate({ backgroundColor: "#FFFFFF"}, 100);
		$this.text(newmin);
	});
}	
</script>
