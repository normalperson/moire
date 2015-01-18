<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'rpt_monthsalebycustomer.conf.php');
require_once(INCLUDE_DIR.'\generalFunc.php');

# customization
function dbo_rpt_monthsalebycustomer_customize(&$dbo){
}


# final rendering
$dbo->render();
?>