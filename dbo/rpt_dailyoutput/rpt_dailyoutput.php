<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'rpt_dailyoutput.conf.php');

# customization
function dbo_rpt_dailyoutput_customize(&$dbo){
}


# final rendering
$dbo->render();
?>