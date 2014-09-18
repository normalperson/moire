<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'jobwip.conf.php');

# customization
function dbo_jobwip_customize(&$dbo){
}


# final rendering
$dbo->render();
?>