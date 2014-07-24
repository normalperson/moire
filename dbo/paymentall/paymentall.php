<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'paymentall.conf.php');

# customization
function dbo_paymentall_customize(&$dbo){
	$dbo->newModifier = 'dbo_paymentall_custom_new';
	$dbo->deleteModifier = 'dbo_paymentall_custom_delete';
}

function dbo_paymentall_custom_new($table, $cols){
	global $DB;
	// $DB->showsql=1;
	// pr($cols);
	$ret = array();
	
	$ok = $DB->doInsert($table, $cols);
	$payID = $DB->lastID();
	
	$orgID = $cols['pay_orgid'];
	$payLeft = $cols['pay_amount'];
	
	$moire = new Moire();
	$moire->allocate_payment_by_payment($payID);
	
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	
	// return array('dev');
	return $ret;
}

function dbo_paymentall_custom_delete($table, $wheres){
	global $DB;
	$ret = array();
	
	$DB->doUpdateAudit($table, array('pay_status'=>'D'), $wheres, array('pay_status'));
	$DB->execute("update minvoice set iv_paid = 'N', iv_paydate = null where iv_id in (select pi_ivid from mpaymentinvoice where pi_payid = :0)", array($wheres['pay_id']));
	$ok = $DB->doDelete('mpaymentinvoice', array('pi_payid'=>$wheres['pay_id']));
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

function lookup_org_with_amount(){
	global $DB;
	$rs = $DB->getArrayNum("select org_id, org_name||' ['||org_id||']' from fcorg");
	foreach($rs as $key=>$row){
		$currency = $DB->getOne("select rg_currency from fcorg join mregion on org_region = rg_code");
		$amount = $DB->getOne("select sum(iv_amount)-sum(COALESCE(pi_amount, 0)) 
from minvoice left join mpaymentinvoice on iv_id = pi_ivid 
where iv_orgid = :0 and iv_paid != 'Y'", array($row[0]));
		$rs[$key][1] = $rs[$key][1].' ('.$currency.' '.number_format($amount, 2).')';
	}
	return $rs;
}

# final rendering
$dbo->render();

// global $DB, $HTML;
// $sql = "select * from minvoice where iv_orgid = 9 order by iv_invoicedate asc, iv_id asc";
// $rs = $DB->getArrayAssoc($sql);
// echo $HTML->array_to_table($rs, '', $sql);
?>