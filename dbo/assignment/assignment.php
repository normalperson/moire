<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'assignment.conf.php');

# customization
function dbo_assignment_customize(&$dbo){
}


# final rendering
$dbo->render();
?>