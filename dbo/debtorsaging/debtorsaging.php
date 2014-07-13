<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'debtorsaging.conf.php');

# customization
function dbo_debtorsaging_customize(&$dbo){
}


# final rendering
$dbo->render();
?>