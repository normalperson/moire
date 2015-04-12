<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'Report.conf.php');

# customization
function dbo_Report_customize(&$dbo){
}


# final rendering
$dbo->render();
?>