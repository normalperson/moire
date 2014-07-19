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
		$DB->showsql=1;
		// $DB->beginTrans();
		$invoiceRS = $DB->getRowAssoc("select minvoice.* from minvoice where iv_jsid = :0", array($jsid));
		
		if(!$invoiceRS){
			// $DB->execute("insert into minvoice (iv_invoicedate, iv_orgid, iv_jsid, iv_amount, iv_currency) values (:0, iv_orgid, iv_jsid, iv_amount, iv_currency)", array(date('Y-m-d H:i:s'), $jobRS['org_id'], $jsid, $jobRS['js_finalprice'], $jobRS['js_finalprice']));
			$DB->execute("insert into minvoice (iv_invoicedate, iv_orgid, iv_jsid, iv_amount, iv_currency) select now(), js_orgid, js_id, js_finalprice, js_currency from mjobsheet where js_id = :0", array($jsid));
			$ivID = $DB->lastID();
		}else{
			$DB->execute("update minvoice set iv_invoicedate = now(), iv_orgid = :0, iv_amount = :1, iv_currency = :2 where iv_id = :3", array($jobRS['js_orgid'], $jobRS['js_finalprice'], $jobRS['js_currency'], $invoiceRS['iv_id']));
			$ivID = $invoiceRS['iv_id'];
		}
		
		$this->allocate_payment($jobRS['js_orgid']);
		
		// $DB->rollbackTrans();
		$DB->showsql=0;
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
	}
	
	// to allocate unallocated payment
	function allocate_payment($orgID){
		global $DB;
		
		$invoiceRS = $DB->getArrayAssoc("select * from minvoice where iv_orgid = :0 and iv_paid != 'Y' order by iv_invoicedate asc, iv_id asc", array($orgID));
		$paymentRS = $DB->getArrayAssoc("select pay_id, pay_amount, pay_allocatedamount, pay_amount - pay_allocatedamount as extraamount from mpayment 
where pay_orgid = :0 and pay_allocatedamount < pay_amount order by pay_created asc, pay_id asc", array($orgID));

		# check if has unpaid invoice previous extra payment not allocated yet
		if($invoiceRS && $paymentRS){
			foreach($paymentRS as $paymentRow){
				$this->allocate_payment_by_payment($paymentRow['pay_id']);
			}
		}
	}
	
	// function allocate_payment_by_invoice($invoiceID){
		// global $DB;
		// $invoiceRS = $DB->getArrayAssoc("select * from minvoice where iv_id = :0 and iv_paid != 'Y' order by iv_invoicedate asc, iv_id asc", array($invoiceID));
		// if(!$invoiceRS) return false;
		
	// }
	
	function allocate_payment_by_payment($paymentID){
		global $DB;
		$paymentRS = $DB->getRowAssoc("select * from mpayment where pay_allocatedamount < pay_amount and pay_id = :0", array($paymentID));
		if(!$paymentRS) return false;
		$invoiceRS = $DB->getArrayAssoc("select iv_id, iv_invoicedate, sum(iv_amount) as invamount, sum(COALESCE(pi_amount, 0)) as paidamount, sum(iv_amount)-sum(COALESCE(pi_amount, 0)) as oweamount from minvoice left join mpaymentinvoice on iv_id = pi_ivid 
	where iv_orgid = :0 and iv_paid = 'N' 
	group by iv_id, iv_invoicedate
	order by iv_invoicedate, iv_id", array($paymentRS['pay_orgid']));
		$payLeft = $paymentRS['pay_amount']-$paymentRS['pay_allocatedamount'];
		$payID = $paymentRS['pay_id'];

		if($invoiceRS){
			$allocatedAmount = $paymentRS['pay_allocatedamount']?$paymentRS['pay_allocatedamount']:0;
			foreach($invoiceRS as $invoiceRow){
				if(!$payLeft)
					break;
				$ivID = $invoiceRow['iv_id'];
				if($payLeft>=($invoiceRow['oweamount'])){
					$payAmount = min($payLeft, $invoiceRow['oweamount']);
					$payLeft = $payLeft - $invoiceRow['oweamount'];
					$DB->execute("update minvoice set iv_paid = 'Y', iv_paydate = now() where iv_id = :0", array($invoiceRow['iv_id']));
				}else{
					$payAmount = $payLeft;
					$payLeft = 0;
				}
				$allocatedAmount += $payAmount;
				$sql = "insert into mpaymentinvoice (pi_payid, pi_amount, pi_ivid) values (:0, :1, :2)";
				$bind = array($payID, $payAmount, $ivID);
				$DB->execute($sql, $bind);
			}
			$DB->execute("update mpayment set pay_allocatedamount = :0 where pay_id = :1", array($allocatedAmount, $payID));
		}
		if($payLeft){
			$sql = "insert into mpaymentinvoice (pi_payid, pi_amount) values (:0, :1)";
			$bind = array($payID, $payLeft);
			$DB->execute($sql, $bind);
			$payLeft = 0;
		}
	}
/*
minvoice : iv_id, iv_invoicedate, iv_created, iv_orgid, iv_amount, iv_paid, iv_paydate, iv_currency, iv_jsid
mpayment : pay_id, pay_created, pay_amount, pay_allocatedamount, pay_orgid
mpaymentinvoice : pi_id, pi_created, pi_payid, pi_ivid, pi_amount
*/	
	function pi_addInvoice($data){
		global $DB;
		
		# check required data
		foreach(array('iv_amount', 'iv_jsid') as $col){
			if(!isset($data[$col])){
				return false;
			}
		}
		if(!isset($data['iv_invoicedate'])) $data['iv_invoicedate'] = date('Y-m-d H:i:s');
		
		$jobsheetRS = $DB->getRowAssoc("select js_orgid, js_price, js_currency, js_finalprice, js_rate from mjobsheet where js_id = :0", array($data['iv_jsid']));
		$data['iv_orgid'] = $jobsheetRS['js_orgid'];
		$data['iv_currency'] = $jobsheetRS['js_currency'];
		
		# insert invoice
		$DB->doInsert("minvoice", $data);
		$invoiceID = $DB->lastID();
	}
	
	function pi_addPayment($data){
		global $DB;
		# check required data
		foreach(array('pay_amount', 'pay_orgid') as $col){
			if(!isset($data[$col])){
				return false;
			}
		}
	}
	
	function pi_editInvoice($data){
	}
	
	function pi_editPayment($data){
	}
}
?>