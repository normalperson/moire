<?php


class Accounting {

	
	function __construct () {
	}
	/**
	* Insert journal entry
	* @param character $cat
	* @param numeric $amt
	* @param date $journaldate (date-format:yyyy-mm-dd)
	* @param character $createdby
	* @param character $desc
	* @param character $foreign key
	* @return date $checkoutdate
	*/	
	// 	
	function journalEntry($cat, $amt, $journaldate,$createdby, $desc, $ref2){
		global $DB;

		// error handling, if amt || journaldate || createdby is empty return error
		if($amt == 0 || $amt =='' || $journaldate == '' || $createdby == '' ||$cat ==''||$ref2 =='') 
			return 'Insufficient Info';

		// get the data from mapping table
		$sql = "select * from acjournalmapping where jm_cat = :0";
		$journalinfo = $DB->GetRow($sql,array($cat),PDO::FETCH_ASSOC);

		// insert debit journal
	   $drinfo = array(
	   	'aj_date'         => $journaldate,
	   	'aj_createdby'    => $createdby, 
	   	'aj_dramt'        => $amt,
	   	'aj_description'  => (trim($desc))==''?$journalinfo['jm_description']:trim($desc),
	   	'aj_cstid'        => $journalinfo['jm_cstid'],
	   	'aj_actid'        => $journalinfo['jm_dracct']
	   	);
	   	$ok = $DB->doInsert("acjournal", $drinfo);


		// insert credit journal		
	   	$crinfo = array(
	   		'aj_date'         => $journaldate,
		   	'aj_createdby'    => $createdby, 
		   	'aj_cramt'        => $amt,
		   	'aj_description'  =>(trim($desc))==''?$journalinfo['jm_description']:trim($desc),
		   	'aj_cstid'        => $journalinfo['jm_cstid'],
		   	'aj_ref1'         => $journalinfo['jm_transactiontype'],
		   	'aj_ref2'         => $ref2,
		   	'aj_actid'        => $journalinfo['jm_dracct']
	   	);		   	
		$ok = $DB->doInsert("acjournal", $crinfo);

		return $ok;

	}
	
	/**
	* Membership subscription journal entry default costcenter ISP general admin
	* @param numeric $amt
	* @param date $journaldate
	* @param character $createdby
	* @param character $desc
	* @param character $ref1
	* @param character $ref2
	* @param int $costcenter default 5
	* @return character 
	*/	
	function membershipsub($amt, $journaldate, $createdby, $desc, $ref1='Membership Subscription',$ref2,$costcenter=5){
		global $DB;
		// error handling, if amt || journaldate || createdby is empty return error
		if($amt == 0 || $amt =='' || $journaldate == '' || $createdby == '' ||$ref1 ==''||$ref2 =='') 
			return 'Insufficient Info';

		// insert debit journal
	   $drinfo = array(
	   	'aj_date'         => $journaldate,
	   	'aj_createdby'    => $createdby, 
	   	'aj_dramt'        => $amt,
	   	'aj_description'  => (trim($desc))==''?null:trim($desc),
	   	'aj_cstid'        => $costcenter,
	   	'aj_actid'        => 7
	   	);
	   	$ok = $DB->doInsert("acjournal", $drinfo);

		// insert credit journal		
	   	$crinfo = array(
	   		'aj_date'         => $journaldate,
		   	'aj_createdby'    => $createdby, 
		   	'aj_cramt'        => $amt,
		   	'aj_description'  => (trim($desc))==''?null:trim($desc),
		   	'aj_cstid'        => $costcenter,
		   	'aj_ref1'         => $ref1,
		   	'aj_ref2'         => $ref2,
		   	'aj_actid'        => 1
	   	);		   	
		$ok = $DB->doInsert("acjournal", $crinfo);

		return $ok;

	}

	/**
	* Exam payment journal entry default costcenter ISP general admin
	* @param numeric $amt
	* @param date $journaldate
	* @param character $createdby
	* @param character $desc
	* @param character $ref1
	* @param character $ref2
	* @param int $costcenter default 8
	* @return character 
	*/	
	function exampayment($amt, $journaldate, $createdby, $desc, $ref1='Exam Payment',$ref2,$costcenter=8){
		global $DB;
		// error handling, if amt || journaldate || createdby is empty return error
		if($amt == 0 || $amt =='' || $journaldate == '' || $createdby == '' ||$ref1 ==''||$ref2 =='') 
			return 'Insufficient Info';

		// insert debit journal
	   $drinfo = array(
	   	'aj_date'         => $journaldate,
	   	'aj_createdby'    => $createdby, 
	   	'aj_dramt'        => $amt,
	   	'aj_description'  => (trim($desc))==''?null:trim($desc),
	   	'aj_cstid'        => $costcenter,
	   	'aj_actid'        => 7
	   	);
	   	$ok = $DB->doInsert("acjournal", $drinfo);

		// insert credit journal		
	   	$crinfo = array(
	   		'aj_date'         => $journaldate,
		   	'aj_createdby'    => $createdby, 
		   	'aj_cramt'        => $amt,
		   	'aj_description'  => (trim($desc))==''?null:trim($desc),
		   	'aj_cstid'        => $costcenter,
		   	'aj_ref1'         => $ref1,
		   	'aj_ref2'         => $ref2,
		   	'aj_actid'        => 3
	   	);		   	
		$ok = $DB->doInsert("acjournal", $crinfo);

		return $ok;

	}
	
	/**
	* Dinner journal entry default costcenter ISP general admin
	* @param numeric $amt
	* @param date $journaldate
	* @param character $createdby
	* @param character $desc
	* @param character $ref1
	* @param character $ref2
	* @param int $costcenter default 7
	* @return character 
	*/	
	function dinnerfee($amt, $journaldate, $createdby, $desc, $ref1='Dinner Fee',$ref2,$costcenter=7){
		global $DB;
		// error handling, if amt || journaldate || createdby is empty return error
		if($amt == 0 || $amt =='' || $journaldate == '' || $createdby == '' ||$ref1 ==''||$ref2 =='') 
			return 'Insufficient Info';

		// insert debit journal
	   $drinfo = array(
	   	'aj_date'         => $journaldate,
	   	'aj_createdby'    => $createdby, 
	   	'aj_dramt'        => $amt,
	   	'aj_description'  => (trim($desc))==''?null:trim($desc),
	   	'aj_cstid'        => $costcenter,
	   	'aj_actid'        => 7
	   	);
	   	$ok = $DB->doInsert("acjournal", $drinfo);

		// insert credit journal		
	   	$crinfo = array(
	   		'aj_date'         => $journaldate,
		   	'aj_createdby'    => $createdby, 
		   	'aj_cramt'        => $amt,
		   	'aj_description'  => (trim($desc))==''?null:trim($desc),
		   	'aj_cstid'        => $costcenter,
		   	'aj_ref1'         => $ref1,
		   	'aj_ref2'         => $ref2,
		   	'aj_actid'        => 9
	   	);		   	
		$ok = $DB->doInsert("acjournal", $crinfo);

		return $ok;

	}

	
}
?>