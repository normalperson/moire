<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'tmp_monthsalesbycustomer.conf.php');

# customization
function dbo_tmp_monthsalesbycustomer_customize(&$dbo){
}


# final rendering
$dbo->render();
?>