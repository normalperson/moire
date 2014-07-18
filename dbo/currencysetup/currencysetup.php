<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'currencysetup.conf.php');

# customization
function dbo_currencysetup_customize(&$dbo){
}


# final rendering
$dbo->render();
?>