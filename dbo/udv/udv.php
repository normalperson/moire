<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'udv.conf.php');

# customization
function udv_customize(&$dbo){
}


# final rendering
$dbo->render();
?>