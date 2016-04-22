<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'tmp_monthsalesbycategory.conf.php');

# customization
function dbo_tmp_monthsalesbycategory_customize(&$dbo){
}


# final rendering
$dbo->render();
?>