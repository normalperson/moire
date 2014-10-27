<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'testing.conf.php');

# customization
function dbo_testing_customize(&$dbo){
}


# final rendering
$dbo->render();
?>