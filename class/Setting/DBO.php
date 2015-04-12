<?php
html_header();
global $DB;
echo '<div style="margin:auto;width:500px;padding-top:50px;">';
$dbo = new DBOBuilder();
$dbo->run();
echo '</div>';

if(isset($_GET['dboid']) && file_exists(DOC_DIR.DS.'dbo'.DS.$_GET['dboid']) && isset($_GET['dboconfig'])){
	redirect('DBOList?load='.$_GET['dboid']);
}

?>