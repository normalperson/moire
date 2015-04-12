<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'jobother.conf.php');

function downloadlink($colname,$colval,$rowinfo){
	$ret = "<a href='#'><span class='glyphicon glyphicon-download-alt'></span>Download</a>";

	return $ret;
}
# customization
function dbo_jobother_customize(&$dbo){
}


# final rendering
$dbo->render();
?>
<script type="text/javascript">
$('#dbo_jobother_newform > fieldset > legend').css('display','none');
$('.dbo_container_detail > fieldset > legend').css('display','none');
</script>