<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'jobcolor.conf.php');

# customization
function dbo_jobcolor_customize(&$dbo){
}


# final rendering
$dbo->render();
?>