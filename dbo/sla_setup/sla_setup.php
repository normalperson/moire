<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'sla_setup.conf.php');

# customization
function dbo_sla_setup_customize(&$dbo){
}


# final rendering
$dbo->render();
?>