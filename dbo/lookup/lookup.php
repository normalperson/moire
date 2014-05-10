<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'lookup.conf.php');

# customization
function dbo_lookup_customize(&$dbo){
}


# final rendering
$dbo->render();
?>