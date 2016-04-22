<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'tmp_customersalesbycategory.conf.php');

# customization
function dbo_tmp_customersalesbycategory_customize(&$dbo){
}


# final rendering
$dbo->render();
?>