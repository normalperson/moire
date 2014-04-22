<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'jobinfo.conf.php');

# customization
function dbo_jobinfo_customize(&$dbo){
}


# final rendering
$dbo->render();
?>