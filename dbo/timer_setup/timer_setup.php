<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'timer_setup.conf.php');

# customization
function dbo_timer_setup_customize(&$dbo){
}


# final rendering
$dbo->render();
?>