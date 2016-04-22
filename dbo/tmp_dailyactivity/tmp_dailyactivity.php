<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'tmp_dailyactivity.conf.php');

# customization
function dbo_tmp_dailyactivity_customize(&$dbo){
}


# final rendering
$dbo->render();
?>