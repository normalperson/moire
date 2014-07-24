<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'soaorg.conf.php');

# customization
function dbo_soaorg_customize(&$dbo){
}


# final rendering
$dbo->render();
?>