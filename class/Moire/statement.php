<?php
define('ANONYMOUS', true);
require_once(dirname(__FILE__).'/../../init.inc.php');
require_once(dirname(__FILE__).'/Moire.php');
if(!isset($_GET['nosoaorg'])){
	html_header();
}
global $USER, $DB;
$orgRS = $DB->getRowAssoc("select org_external from fcorg where org_id = :0", array($USER->orgid));
if($orgRS['org_external']=='Y'){
	$moire = new Moire();
	$html = $moire->soa_as_html($USER->orgid);
}else{
	if(!isset($_GET['nosoaorg'])){
		echo '<div id="soaorg_container">';
		dbo_include('soaorg');
		echo '</div><script type="text/javascript">
		document.getElementById("dbo_soaorg").style.display = "";
		</script><div>&nbsp;</div>';
	}
	if(isset($_GET['orgid']) && !isset($_GET['invoiceid'])){
		$moire = new Moire();
		$moire->soa_as_html($_GET['orgid']);
	}else if(isset($_GET['orgid']) && isset($_GET['invoiceid'])){
		$moire = new Moire();
		$moire->invoicemonth_as_html($_GET['orgid'], $_GET['invoiceid']);
	}
}
?>