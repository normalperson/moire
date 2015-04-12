<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'permission.conf.php');

# customization
function permission_customize(&$dbo){
}


# final rendering
$dbo->render();
?>