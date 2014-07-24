<?php
define('ANONYMOUS', true);
require_once(dirname(__FILE__).'/../../init.inc.php');
require_once(dirname(__FILE__).'/Moire.php');
html_header();
global $USER, $DB;
$orgRS = $DB->getRowAssoc("select org_external from fcorg where org_id = :0", array($USER->orgid));
if($orgRS['org_external']=='Y'){
	$moire = new Moire();
	$html = $moire->soa_as_html($USER->orgid);
}else{
	echo '<div id="soaorg_container">';
	dbo_include('soaorg');
	echo '</div><script type="text/javascript">
	document.getElementById("dbo_soaorg").style.display = "";
	</script><div>&nbsp;</div>';
	if(isset($_GET['orgid'])){
		$moire = new Moire();
		$moire->soa_as_html($_GET['orgid']);
	}
}
?>