<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'invoiceall.conf.php');

# customization
function dbo_invoiceall_customize(&$dbo){
	$dbo->editModifier = 'dbo_invoiceall_custom_edit';
}

function dbo_invoiceall_custom_edit($table, $cols, $wheres){
	global $DB;
	$ret = array();
	$oldRS = $DB->getRowAssoc("select * from minvoice where iv_id = :0", array($wheres['iv_id']));
	if($oldRS['iv_paid']!=$cols['iv_paid'] && $cols['iv_paid']=='Y'){
		$cols['iv_paydate'] = date('Y-m-d H:i:s');
	}
	
	$ok = $DB->doUpdateAudit($table, $cols, $wheres, array('iv_paid'));
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

# final rendering
$dbo->render();
?>