<?php
require_once(dirname(__FILE__).'/../../init.inc.php');
global $DB, $GLOBAL, $USER, $LOCALE;
// html_header();
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
$customerRS = $DB->getRowAssoc("select * from fcorg left join mregion on org_region = rg_code where org_id = :0", array($rs['iv_orgid']));
$jobRS = $DB->getArrayAssoc("select js_description, js_price, js_finalprice, pmc_id from mjobsheet join fcpmcase on pmc_casekey = js_id and pmc_casetype = 'jobsheet' where js_id = :0", array($rs['iv_jsid']));
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
?>