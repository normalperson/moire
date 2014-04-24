<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'jobinfo.conf.php');

# customization
function dbo_jobinfo_customize(&$dbo){
}


# final rendering
$dbo->render();
?>
<script type="text/javascript">
$('#dbo_jobinfo_newform > fieldset > legend').css('display','none');
</script>