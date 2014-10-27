<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'soaorg.conf.php');

# customization
function dbo_soaorg_customize(&$dbo){
}

// statementButton({org_id}, {invoicedate})
function statementButton($orgID, $invoiceID){
	if(!$invoiceID) return '';
	$ret = '<button form="noform" class="btn btn-labeled btn-primary" style="min-width:85px;" onclick="window.open(\'?nosoaorg=1&orgid='.$orgID.'&invoiceid='.$invoiceID.'\', \'\', \'width=1024,height=700,scrollbar=1\')"><span class="btn-label icon fa-file-text"></span>Statement</button>';
	return $ret;
}

# final rendering
$dbo->render();
?>