<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'table_setup.conf.php');

# customization
function table_setup_customize(&$dbo){
}


# final rendering
$dbo->render();
?>