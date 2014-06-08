<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'customersetup.conf.php');

# customization
function dbo_customersetup_customize(&$dbo){
}


# final rendering
$dbo->render();
?>