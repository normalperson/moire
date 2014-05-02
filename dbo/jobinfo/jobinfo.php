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
$('.dbo_container_detail > fieldset > legend').css('display','none');
$('#dbo_jobinfo_detail_cancel').css('display','none');
</script>