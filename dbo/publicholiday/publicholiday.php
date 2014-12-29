<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'publicholiday.conf.php');

# customization
function dbo_publicholiday_customize(&$dbo){
}


# final rendering
$dbo->render();
?>