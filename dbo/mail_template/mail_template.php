<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'mail_template.conf.php');

# customization
function dbo_mail_template_customize(&$dbo){
}


# final rendering
$dbo->render();
?>