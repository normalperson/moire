<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'jobother.conf.php');

# customization
function dbo_jobother_customize(&$dbo){
}


# final rendering
$dbo->render();
?>
<script type="text/javascript">
$('#dbo_jobother_newform > fieldset > legend').css('display','none');
</script>