<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'custmermachine.conf.php');

# customization
function dbo_custmermachine_customize(&$dbo){
}


# final rendering
$dbo->render();
?>