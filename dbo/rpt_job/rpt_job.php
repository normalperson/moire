<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'rpt_job.conf.php');

# customization
function dbo_rpt_job_customize(&$dbo){
}


# final rendering
$dbo->render();
?>