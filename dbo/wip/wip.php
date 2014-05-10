<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'wip.conf.php');

# customization
function dbo_wip_customize(&$dbo){
}


# final rendering
$dbo->render();
?>
<script type="text/javascript">
$('#dbo_wip_editform > fieldset > legend').css({'background-color': '#D8D8D8',
                                                            'padding-left': '8px'});

</script>