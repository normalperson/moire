<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'fongoption.conf.php');

# customization
function dbo_fongoption_customize(&$dbo){
}


# final rendering
$dbo->render();
?>