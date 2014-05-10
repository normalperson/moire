<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'pendingQC.conf.php');

# customization
function dbo_pendingQC_customize(&$dbo){
}

function downloadlink($colname,$colval,$rowinfo){
	$ret = "<a href='#'><span class='glyphicon glyphicon-download-alt'></span>Download</a>";

	return $ret;
}

# final rendering
$dbo->render();
?>
<script type="text/javascript">
$('#dbo_pendingQC_editform > fieldset > legend').css({'background-color': '#D8D8D8',
                                                            'padding-left': '8px'});
</script>