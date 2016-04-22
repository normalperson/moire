<?php
require_once(dirname(__FILE__).'/../../init.inc.php');
	class fake {
			var $casekey;
		}
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
	
	function generateInvoice(){
		global $DB;
		$sql = "select js_id from mjobsheet where js_status = :0";
		$jsidarr = $DB->GetArray($sql,array('COMPLETED'), PDO::FETCH_ASSOC);
		foreach ($jsidarr as $key => $value) {
			$this->invoice_generate($value['js_id']);
		}
	}
	// generate invoice by job (mjobsheet)
	// currently every job should has 1 invoice generated on client accepting or auto accepting
	function invoice_generate($jsid=false){
		global $DB;
		// $DB->showsql=1;
		$jobRS = $DB->getRowAssoc("select js_orgid, js_currency, js_finalprice from mjobsheet where js_id = :0", array($jsid));
		if(!$jobRS) return false;
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
	
	function invoice_as_html($ivID, $showprint = true){
		global $DB;
		$smarty = new Smarty();
		$smarty->caching = false;
		$smarty->setTemplateDir(DOC_DIR.DS.'smarty'.DS.'templates');
		$smarty->setCompileDir(DOC_DIR.DS.'smarty'.DS.'templates_c');
		$smarty->setCacheDir(DOC_DIR.DS.'smarty'.DS.'cache');
		$smarty->setConfigDir(DOC_DIR.DS.'smarty'.DS.'configs');
		$smarty->assign('APP', APP);
		
		// invoice, jobsheet
		$dataRS = $DB->getRowAssoc("select * from minvoice join mjobsheet on iv_jsid = js_id join fcpmcase on pmc_casekey = js_id and pmc_casetype = 'jobsheet' where iv_id = :0", array($ivID));
		if(!$dataRS) return false;
		$smarty->assign('data', $dataRS);
		$smarty->assign('jobData', array($dataRS));
		$smarty->assign('total_price', $dataRS['iv_amount']);
		$smarty->assign('showprint', $showprint);
		// customer
		$customerRS = $DB->getRowAssoc("select * from fcorg join mregion on org_region = rg_code where org_id = :0", array($dataRS['iv_orgid']));
		$smarty->assign('customerData', $customerRS);
		$ret = $smarty->fetch('printInvoice.html');
		return $ret;
	}
	
	function soa_as_html($orgID){
		global $DB;
		$smarty = new Smarty();
		$smarty->caching = false;
		$smarty->setTemplateDir(DOC_DIR.DS.'smarty'.DS.'templates');
		$smarty->setCompileDir(DOC_DIR.DS.'smarty'.DS.'templates_c');
		$smarty->setCacheDir(DOC_DIR.DS.'smarty'.DS.'cache');
		$smarty->setConfigDir(DOC_DIR.DS.'smarty'.DS.'configs');
		$smarty->assign('APP', APP);
		
		$pndRS = $DB->getRowAssoc("select org_id, org_name, org_address, org_contactno from fcorg where org_external = 'N' and org_parentid = 0");
		$smarty->assign('pndData', $pndRS);
		
		$orgRS = $DB->getRowAssoc("select org_id, org_name, org_address, org_contactno, rg_currency, curr_code, curr_name from fcorg left join mregion on org_region = rg_code left join fccurrency on rg_currency = curr_code where org_id = :0", array($orgID));
		if(!$orgRS) return false;
		$smarty->assign('customerData', $orgRS);
		$smarty->assign('date', date('d/m/Y'));
		$smarty->assign('soa_date', date('M Y'));
		$selected_yearmonth = isset($_GET['yearmonth'])?$_GET['yearmonth']:'*ALL';
		$smarty->assign('selected_yearmonth', $selected_yearmonth);
		
		$yearmonthArray = array();
		$minmaxMonthRS = $DB->getRowAssoc("select min(iv_invoicedate) as min_iv_invoicedate, max(iv_invoicedate) as max_iv_invoicedate from minvoice join mjobsheet on iv_jsid = js_id where iv_orgid = :0 and iv_paid != 'Y'", array($orgID));
		// pr($minmaxMonthRS);
		if($minmaxMonthRS && $minmaxMonthRS['min_iv_invoicedate']){
			$minMonthDate = date('Y-m-01', strtotime($minmaxMonthRS['min_iv_invoicedate']));
			$maxMonthDate = date('Y-m-01', strtotime($minmaxMonthRS['max_iv_invoicedate']));
			$minMonthTime = strtotime($minMonthDate);
			$maxMonthTime = strtotime($maxMonthDate);
			// pr(array($minMonthDate, $maxMonthDate));
			// pr(array($minMonthTime, $maxMonthTime));
			$datetime = $datetime1 = new DateTime($minMonthDate);
			$datetime2 = new DateTime($maxMonthDate);
			$interval = $datetime1->diff($datetime2);
			$monthDiff = $interval->format('%y')*12 + $interval->format('%m');
			// d($monthDiff);
			$yearmonthArray = array(array($datetime->format('Y-m'), $datetime->format('M Y')));
			for($i=0;$i<$monthDiff;$i++){
				$datetime->add(new DateInterval('P1M'));
				$yearmonthArray[] = array($datetime->format('Y-m'), $datetime->format('M Y'));
			}
		}
		$smarty->assign('yearmonthArray', $yearmonthArray);
		// pr($yearmonthArray);
		
		$wheres = array("iv_paid != 'Y'");
		if($selected_yearmonth && $selected_yearmonth!= '*ALL'){
			$date = new DateTime($selected_yearmonth.'-01');
			$from = $date->format('Y-m-d');
			$date->add(new DateInterval('P1M'));
			$wheres[] = "iv_invoicedate >= '{$from}' and iv_invoicedate < '".$date->format('Y-m-d')."'";
		}
		// pr($wheres);
		$invoiceRS = $DB->getArrayAssoc("select iv_id, 'INV'||lpad(iv_id::text, 8, '0') as invoice_no, iv_invoicedate, iv_amount, 0 as credit, js_description 
from minvoice join mjobsheet on iv_jsid = js_id where iv_orgid = :0 and ".(implode(" and ", $wheres))." order by iv_invoicedate asc, iv_id asc", array($orgID));
		$smarty->assign('invoiceData', $invoiceRS);
		$totalAmount = 0;
		foreach($invoiceRS as $row){
			$totalAmount += $row['iv_amount'];
		}
		$smarty->assign('total_amount_word', $this->convertNumberToCurrency($totalAmount).' ONLY');
		
		$arrearsArray = array();
		for($i=12;$i>0;$i--){
			$time = strtotime("-".$i." month");
			$startDate = date('Y-m-01', $time);
			$endDate = date('Y-m-t', $time);
			$sum = $DB->getOne("select coalesce(sum(coalesce(iv_amount, 0)), 0) from minvoice where iv_orgid = :0 and iv_paid !='Y' and iv_invoicedate between :1 and :2", array($orgID, $startDate, $endDate));
			$arrearsArray[] = array('month'=>date('F', $time), 'amount'=>$sum);
		}
		$smarty->assign('arrearData', $arrearsArray);

		$ret = $smarty->fetch('soa.html');
		echo $ret;
		return $ret;
	}
	
	function invoicemonth_as_html($orgID, $invoiceID){
		global $DB;
		$smarty = new Smarty();
		$smarty->caching = false;
		$smarty->setTemplateDir(DOC_DIR.DS.'smarty'.DS.'templates');
		$smarty->setCompileDir(DOC_DIR.DS.'smarty'.DS.'templates_c');
		$smarty->setCacheDir(DOC_DIR.DS.'smarty'.DS.'cache');
		$smarty->setConfigDir(DOC_DIR.DS.'smarty'.DS.'configs');
		$smarty->assign('APP', APP);
		
		$pndRS = $DB->getRowAssoc("select org_id, org_name, org_address, org_contactno from fcorg where org_external = 'N' and org_parentid = 0");
		$smarty->assign('pndData', $pndRS);
		
		$orgRS = $DB->getRowAssoc("select org_id, org_name, org_address, org_contactno, rg_currency, curr_code, curr_name from fcorg left join mregion on org_region = rg_code left join fccurrency on rg_currency = curr_code where org_id = :0", array($orgID));
		if(!$orgRS) return false;
		$smarty->assign('customerData', $orgRS);
		$smarty->assign('invoiceNo', 'INV'.$this->genInvoiceNumber($invoiceID));
		
		$invoiceRS = $DB->getArrayAssoc("select im_id, 'INV'||lpad(im_id::text, 8, '0') as invoice_no, im_invoicedate, js_completiondate, js_finalprice, js_code, js_description 
from minvoicemonth join minvoicemonthjobsheet on ij_imid = im_id join mjobsheet on ij_jsid = js_id where im_orgid = :0 and im_id = :1 and js_completiondate is not null order by im_invoicedate asc, js_id asc", array($orgID, $invoiceID));
		$smarty->assign('invoiceData', $invoiceRS);
		$totalAmount = 0;
		foreach($invoiceRS as $row){
			$totalAmount += $row['js_finalprice'];
		}
		$smarty->assign('total_amount_word', $this->convertNumberToCurrency($totalAmount).' ONLY');
		
		$arrearsArray = array();
		for($i=12;$i>0;$i--){
			$time = strtotime("-".$i." month");
			$startDate = date('Y-m-01', $time);
			$endDate = date('Y-m-t', $time);
			$sum = $DB->getOne("select coalesce(sum(coalesce(iv_amount, 0)), 0) from minvoice where iv_orgid = :0 and iv_paid !='Y' and iv_invoicedate between :1 and :2", array($orgID, $startDate, $endDate));
			$arrearsArray[] = array('month'=>date('F', $time), 'amount'=>$sum);
		}
		$smarty->assign('arrearData', $arrearsArray);

		$ret = $smarty->fetch('invoicemonth.html');
		echo $ret;
		return $ret;
	}
	
	function genInvoiceNumber($invID){
		return sprintf('%08d', $invID);
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
	
	function convertNumberToCurrency($number)
	{
		if(strpos($number, '.')===false) $number = $number.'.00';
		list($integer, $fraction) = explode(".", (string) $number);

		$output = "";

		if ($integer{0} == "-")
		{
			$output = "negative ";
			$integer    = ltrim($integer, "-");
		}
		else if ($integer{0} == "+")
		{
			$output = "positive ";
			$integer    = ltrim($integer, "+");
		}

		if ($integer{0} == "0")
		{
			$output .= "zero";
		}
		else
		{
			$integer = str_pad($integer, 36, "0", STR_PAD_LEFT);
			$group   = rtrim(chunk_split($integer, 3, " "), " ");
			$groups  = explode(" ", $group);

			$groups2 = array();
			foreach ($groups as $g)
			{
				$groups2[] = $this->convertThreeDigit($g{0}, $g{1}, $g{2});
			}

			for ($z = 0; $z < count($groups2); $z++)
			{
				if ($groups2[$z] != "")
				{
					$output .= $groups2[$z] . $this->convertGroup(11 - $z) . (
							$z < 11
							&& !array_search('', array_slice($groups2, $z + 1, -1))
							&& $groups2[11] != ''
							&& $groups[11]{0} == '0'
								// ? " and "
								? " "
								: " "
						);
				}
			}

			$output = rtrim($output, ", ");
		}

		if ($fraction > 0)
		{
			$output .= " and";
			if(strlen($fraction)>2) $fraction = (string) round(substr($fraction,0, 2).'.'.substr($fraction, 2), 0);
			else if(strlen($fraction)==1) $fraction = (string) $fraction.'0';
			if($fraction{0}=='0'){
				$output .= " " . $this->convertDigit($fraction{1});
			}else{
				$output .= " " . $this->convertTwoDigit($fraction{0}, $fraction{1});
			}
		}

		return $output;
	}

	function convertGroup($index)
	{
		switch ($index)
		{
			case 11:
				return " decillion";
			case 10:
				return " nonillion";
			case 9:
				return " octillion";
			case 8:
				return " septillion";
			case 7:
				return " sextillion";
			case 6:
				return " quintrillion";
			case 5:
				return " quadrillion";
			case 4:
				return " trillion";
			case 3:
				return " billion";
			case 2:
				return " million";
			case 1:
				return " thousand";
			case 0:
				return "";
		}
	}

	function convertThreeDigit($digit1, $digit2, $digit3)
	{
		$buffer = "";

		if ($digit1 == "0" && $digit2 == "0" && $digit3 == "0")
		{
			return "";
		}

		if ($digit1 != "0")
		{
			$buffer .= $this->convertDigit($digit1) . " hundred";
			if ($digit2 != "0" || $digit3 != "0")
			{
				// $buffer .= " and ";
				$buffer .= " ";
			}
		}

		if ($digit2 != "0")
		{
			$buffer .= $this->convertTwoDigit($digit2, $digit3);
		}
		else if ($digit3 != "0")
		{
			$buffer .= $this->convertDigit($digit3);
		}

		return $buffer;
	}

	function convertTwoDigit($digit1, $digit2)
	{
		if ($digit2 == "0")
		{
			switch ($digit1)
			{
				case "1":
					return "ten";
				case "2":
					return "twenty";
				case "3":
					return "thirty";
				case "4":
					return "forty";
				case "5":
					return "fifty";
				case "6":
					return "sixty";
				case "7":
					return "seventy";
				case "8":
					return "eighty";
				case "9":
					return "ninety";
			}
		} else if ($digit1 == "1")
		{
			switch ($digit2)
			{
				case "1":
					return "eleven";
				case "2":
					return "twelve";
				case "3":
					return "thirteen";
				case "4":
					return "fourteen";
				case "5":
					return "fifteen";
				case "6":
					return "sixteen";
				case "7":
					return "seventeen";
				case "8":
					return "eighteen";
				case "9":
					return "nineteen";
			}
		} else
		{
			$temp = $this->convertDigit($digit2);
			switch ($digit1)
			{
				case "2":
					return "twenty $temp";
				case "3":
					return "thirty $temp";
				case "4":
					return "forty $temp";
				case "5":
					return "fifty $temp";
				case "6":
					return "sixty $temp";
				case "7":
					return "seventy $temp";
				case "8":
					return "eighty $temp";
				case "9":
					return "ninety $temp";
			}
		}
	}

	function convertDigit($digit)
	{
		switch ($digit)
		{
			case "0":
				return "zero";
			case "1":
				return "one";
			case "2":
				return "two";
			case "3":
				return "three";
			case "4":
				return "four";
			case "5":
				return "five";
			case "6":
				return "six";
			case "7":
				return "seven";
			case "8":
				return "eight";
			case "9":
				return "nine";
		}
	}
}
?>