<?php
require_once(dirname(__FILE__).'/../../init.inc.php');
/*
Moire class will handle invoicing, payment and billing here because moire is not using standard method.
*/
class Moire{
	function __construct(){
	}
	/*
	// to support 1 invoice multiple jobsheet
	create table mjobinvoice(
		jv_id serial,
		jv_jsid integer,
		jv_ivid integer
	)
	
	*/
	// generate invoice by job (mjobsheet)
	// currently every job should has 1 invoice generated on client accepting or auto accepting
	function invoice_generate($jsid=false){
		global $DB;
		$jobRS = $DB->getRowAssoc("select js_orgid, js_currency, js_finalprice from mjobsheet where js_id = :0", array($jsid));
		if(!$jobRS) return false;
		
		$invoiceRS = $DB->getRowAssoc("select minvoice.* from minvoice where iv_jsid = :0", array($jsid));
		
		if(!$invoiceRS){
			// $DB->execute("insert into minvoice (iv_invoicedate, iv_orgid, iv_jsid, iv_amount, iv_currency) values (:0, iv_orgid, iv_jsid, iv_amount, iv_currency)", array(date('Y-m-d H:i:s'), $jobRS['org_id'], $jsid, $jobRS['js_finalprice'], $jobRS['js_finalprice']));
			$DB->execute("insert into minvoice (iv_invoicedate, iv_orgid, iv_jsid, iv_amount, iv_currency) select now(), js_orgid, js_id, js_finalprice, js_currency from mjobsheet where js_id = :0", array($jsid));
			$ivID = $DB->lastID();
		}else{
			$DB->execute("update minvoice set iv_invoicedate = now(), iv_orgid = :0, iv_amount = :1, iv_currency = :2 where iv_id = :3", array($jobRS['js_orgid'], $jobRS['js_finalprice'], $jobRS['js_currency'], $invoiceRS['iv_id']));
			$ivID = $invoiceRS['iv_id'];
		}
	}
	
	function invoice_as_html($ivID){
		global $DB;
		$smarty = new Smarty();
		$smarty->caching = false;
		// die(DOC_DIR.DS.'smarty'.DS.'templates');
		$smarty->setTemplateDir(DOC_DIR.DS.'smarty'.DS.'templates');
		$smarty->setCompileDir(DOC_DIR.DS.'smarty'.DS.'templates_c');
		$smarty->setCacheDir(DOC_DIR.DS.'smarty'.DS.'cache');
		$smarty->setConfigDir(DOC_DIR.DS.'smarty'.DS.'configs');
		$smarty->assign('APP', APP);
		
		// invoice, jobsheet
		$dataRS = $DB->getRowAssoc("select * from minvoice join mjobsheet on iv_jsid = js_id join fcpmcase on pmc_casekey = js_id and pmc_casetype = 'jobsheet'");
		$smarty->assign('data', $dataRS);
		$smarty->assign('jobData', array($dataRS));
		$smarty->assign('total_price', $dataRS['iv_amount']);
		
		// customer
		$customerRS = $DB->getRowAssoc("select * from fcorg where org_id = :0", array($dataRS['iv_orgid']));
		$smarty->assign('customerData', $customerRS);

		$ret = $smarty->fetch('printInvoice.html');
		echo $ret;
		return $ret;
	
if(!isset($_GET['invoiceid'])) die("Invalid job");
// $DB->showsql=1;
$smarty = new Smarty();
$smarty->caching = false;
// die(DOC_DIR.DS.'smarty'.DS.'templates');
$smarty->setTemplateDir(DOC_DIR.DS.'smarty'.DS.'templates');
$smarty->setCompileDir(DOC_DIR.DS.'smarty'.DS.'templates_c');
$smarty->setCacheDir(DOC_DIR.DS.'smarty'.DS.'cache');
$smarty->setConfigDir(DOC_DIR.DS.'smarty'.DS.'configs');
$smarty->assign('APP', APP);
$invoiceid = $_GET['invoiceid'];
list($currentOrgId, $currentOrgExternal) = $DB->getRow("select org_id, org_external from fcuserorgrole join fcorg on uor_orgid = org_id where uor_id = :0 and uor_rolid = :1", array($USER->userorgroleid, $USER->roleid));
$sql = "select * from minvoice where iv_id = :0";
$bind = array($invoiceid);
if($currentOrgExternal=='Y'){
	$sql .= " and iv_orgid = :1";
	$bind[] = $currentOrgId;
}
$rs = $DB->getRowAssoc($sql, $bind);
if(!$rs) die('Invoice not found!');
// customer
$customerRS = $DB->getRowAssoc("select * from fcorg where org_id = :0", array($rs['iv_orgid']));
$jobRS = $DB->getArrayAssoc("select js_description, js_price, pmc_id from mjobsheet join fcpmcase on pmc_casekey = js_id and pmc_casetype = 'jobsheet' where js_completiondate between :0 and :1 and js_orgid = :2", array(date('Y-m-01', strtotime($rs['iv_invoicedate'])), date('Y-m-t', strtotime($rs['iv_invoicedate'])), $rs['iv_orgid']));
$total_price = 0;
foreach($jobRS as $row){
	$total_price += $row['js_price'];
}
// pr($customerRS);
// pr($jobRS);
$smarty->assign('data', $rs);
$smarty->assign('customerData', $customerRS);
$smarty->assign('jobData', $jobRS);
$smarty->assign('total_price', $total_price);
// pr($rs);
$smarty->display('printInvoice.html');
	}
}
?>