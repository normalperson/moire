<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'alljob.conf.php');

# customization
function dbo_alljob_customize(&$dbo){
}


# final rendering
$dbo->render();
?>