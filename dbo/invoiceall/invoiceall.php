<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'invoiceall.conf.php');

# customization
function dbo_invoiceall_customize(&$dbo){
	global $USER, $DB;
	// vd($USER);
	$orgRS = $DB->getRowAssoc("select org_external from fcorg where org_id = :0", array($USER->orgid));
	if($orgRS['org_external']=='Y'){
		$dbo->whereSQL = 'iv_orgid = '.$USER->orgid;
		$dbo->cols['iv_orgid']->option->default = 'select org_id, org_name from fcorg where org_external = \'Y\' and org_id = '.$USER->orgid;
		$dbo->canEdit=false;
	}
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

function invoiceall_button($ivid, $orgid, $unpaidamount, $paid){
	global $USER, $DB;
	$ret = "<button form=\"noform\" class=\"btn btn-labeled btn-primary\" style=\"min-width:85px;\" onclick=\"printInvoicePreview({$ivid});\"><span class=\"btn-label icon fa fa-print\"></span>Print</button>";
	$isExternal = $DB->getOne("select org_external from fcorg where org_id = :0", array($USER->orgid));
	if($isExternal=='N'){
		$ret .= " <button form=\"noform\" class=\"btn btn-labeled btn-primary\" style=\"min-width:85px;\" onclick=\"document.location='paymentadm?dboid=paymentall&dbostate=new&orgid={$orgid}&amount={$unpaidamount}';\"".($paid=='Y'?' disabled':'')."><span class=\"btn-label icon fa fa-money\"></span>Pay</button>";
	}
	return $ret;
}

# final rendering
$dbo->render();
?>