<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'locale_setup.conf.php');

# customization
function dbo_locale_setup_customize(&$dbo){
}


# final rendering
$dbo->render();
?>