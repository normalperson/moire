<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'tmp_dailysalereport.conf.php');

# customization
function dbo_tmp_dailysalereport_customize(&$dbo){
}


# final rendering
$dbo->render();
?>