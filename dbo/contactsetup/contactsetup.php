<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'contactsetup.conf.php');

# customization
function dbo_contactsetup_customize(&$dbo){
}


# final rendering
$dbo->render();
?>