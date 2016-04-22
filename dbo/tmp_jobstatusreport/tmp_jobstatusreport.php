<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'tmp_jobstatusreport.conf.php');

# customization
function dbo_tmp_jobstatusreport_customize(&$dbo){
}


# final rendering
$dbo->render();
?>