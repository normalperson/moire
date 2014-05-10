<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'jobcatsetup.conf.php');

# customization
function dbo_jobcatsetup_customize(&$dbo){
}


# final rendering
$dbo->render();
?>