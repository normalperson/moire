<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'jobcolor.conf.php');

# customization
function dbo_jobcolor_customize(&$dbo){
}


# final rendering
$dbo->render();
?>
<script type="text/javascript">
$('#dbo_jobcolor_newform > fieldset > legend').css('display','none');
</script>
