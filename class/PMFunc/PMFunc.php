<?php
class PMFunc{
	
	function testScriptActivity($flowid, $o) {
		dbo_include('user');
	}
	function initSmarty(){
		$smarty = new Smarty();
		$smarty->caching = false;
		$smarty->setTemplateDir(DOC_DIR.DS.'smarty'.DS.'PMfunctemplates');
		$smarty->setCompileDir(DOC_DIR.DS.'smarty'.DS.'templates_c');
		$smarty->setCacheDir(DOC_DIR.DS.'smarty'.DS.'cache');
		$smarty->setConfigDir(DOC_DIR.DS.'smarty'.DS.'configs');
		
		return $smarty;
	}
	function testEng($flowid,$o){
		echo '1234';
	}
	function testnew() {
		echo 123456;
		if (!empty($_POST['PROCEED'])) {
			return array('casekey'=>144, 'casetype'=>'jobsheet');
		}
		echo "<form method='post'><input type='submit' value='MOVE' name='PROCEED' /></form>";
	}
	function reassign($flowid,$o){
		global $FLOWDECISION,$REMARK,$DB;
		$_GET['dboid']='reassign';
		$_GET['js_id']=$o->casekey;
		$_GET['dbostate']='edit';

		dbo_include('reassign');
		if(isset($FLOWDECISION) && $FLOWDECISION==true) {
			// insert comment
			if(trim($REMARK) != '')	$o->insertComment($REMARK, $flowid);

			return true;
		}
	}
	function reqVerification($flowid,$o){
		global $FLOWDECISION,$REMARK,$DB;
		$_GET['dboid']='reqverification';
		$_GET['js_id']=$o->casekey;
		$_GET['dbostate']='edit';
		
		dbo_include('reqverification');
		if(isset($FLOWDECISION) && $FLOWDECISION==true) {
			// insert comment
			if(trim($REMARK) != '')	$o->insertComment($REMARK, $flowid);

			return true;
		}
		
	}
	function viewJobInfo($caseobj){
		global $DB;
		$_GET['dboid']='jobsheet';
		$_GET['dbostate']='detail';
		$_GET['js_id']=$caseobj->casekey;
		dbo_include('jobsheet');
	}
	function pendingRevert($flowid,$o){
		global $DB,$REMARK,$FLOWDECISION;
		$_GET['dboid']='jobsheet';
		$_GET['dbostate']='edit';
		$_GET['js_id']=$o->casekey;
		dbo_include('jobsheet');
		if (!empty($_POST['canceljob'])) {
			$data = array(
				'js_status'=>'CANCELLED',
				'js_decision'=>'Cancel',
			);
			if (!empty($_POST['cancelremark']) && trim($_POST['cancelremark']) != '') {
				$o->insertComment($_POST['cancelremark'], $flowid);
				$cremark = array('js_cancelremark' => $_POST['cancelremark']);
				$data = array_merge($data, $cremark);
			}
			return $DB->doUpdate('mjobsheet', $data, array('js_id'=>$o->casekey));
		}
		echo 
"<script type='text/javascript'>
$(function () {
	$('#dbo_jobsheet_edit_cancel').removeAttr('onclick').removeClass('button').addClass('btn btn-danger').click(function (e) {
		e.stopPropagation();
		e.preventDefault();
		bootbox.prompt({
			title: '".tl('Please enter cancellation remark?', false, 'PMFunc')."',
			callback: function(result) {
				if (result === null) return;
				postData({'canceljob':1, 'cancelremark':result});
			},
			className: 'bootbox-sm',
			buttons : {
				'cancel': {
		            label: '".tl('Cancel', false, 'PMFunc')."',
		            className: 'btn-default'
		        },
		        'confirm': {
		            label: '".tl('OK', false, 'PMFunc')."',
		            className: 'btn-primary'
		        }
			}
		});
	})
})
</script>";
		if(isset($FLOWDECISION) && $FLOWDECISION==true) {
			// insert comment
			if(trim($REMARK) != '')	$o->insertComment($REMARK, $flowid);

			return true;
		}

	}
	function updPullBackStatus($flowid,$o){
		global $DB;
		return true;
	}
	function updAcknowdgeJobStatus($flowid,$o){
		global $DB;
		$sql = "update mjobsheet set js_status = :0 where js_id = :1";
		$ok = $DB->Execute($sql,array('WORK IN PROGRESS',$o->casekey));

		if($ok) return true;

	}
	function pendingAcknowledge($flowid,$o){
		global $DB;
		$smarty = $this->initSmarty();
		$jsid = $o->casekey;
		$sql = "select * from mcarton";
		$carton = $DB->GetArray($sql,null, PDO::FETCH_ASSOC);
		$smarty->assign('carton',$carton);
		$smarty->assign('jsid',$jsid);
		$smarty->display('acknowledgejob.html');

	}
	function wip($flowid, $o){
		global $FLOWDECISION,$REMARK;
		$_GET['dboid']='wip';
		$_GET['js_id']=$o->casekey;
		$_GET['dbostate']='edit';
		dbo_include('wip');

		if(isset($FLOWDECISION) && $FLOWDECISION==true) {
			// insert comment
			if(trim($REMARK) != '')	$o->insertComment($REMARK, $flowid);

			return true;
		}
	}
	function pendingQC($flowid, $o){
		global $FLOWDECISION,$REMARK;
		$_GET['dboid']='pendingQC';
		$_GET['js_id']=$o->casekey;
		$_GET['dbostate']='edit';
		dbo_include('pendingQC');
		
		if(isset($FLOWDECISION) && $FLOWDECISION==true) {
			// insert comment
			if(trim($REMARK) != '')	$o->insertComment($REMARK, $flowid);

			return true;
		}

	}
	function pendingCust($flowid,$o){
		global $FLOWDECISION,$REMARK;
		$_GET['dboid']='customeracceptance';
		$_GET['js_id']=$o->casekey;
		$_GET['dbostate']='edit';
		dbo_include('customeracceptance');
		
		if(isset($FLOWDECISION) && $FLOWDECISION==true) {
			// insert comment
			if(trim($REMARK) != '')	$o->insertComment($REMARK, $flowid);

			return true;
		}

	}
	function newJob(){
		global $JOBARRAY,$DB;
		$_GET['dboid']='jobsheet';
		$_GET['dbostate']='new';
		dbo_include('jobsheet');
		return $JOBARRAY;
	}
	function getCartonInfo(){
		require_once(INCLUDE_DIR.DS.'Image.inc.php'); // include image class
		global $DB;

		$value = 0;
		$carid = $_POST['carid'];
		$jobid = $_POST['jobid'];

		
		// get image location
		$img = new Image();
		$imageinfo = $img->getImage('boxtype',$carid);


		$sql = "select * from mcartonvariable where carv_carid = :0 order by carv_seq";
		$var = $DB->GetArray($sql,array($carid), PDO::FETCH_ASSOC);

		if($jobid != 0){
			$sql = "select * from mjscartonvalue
					join mcartonvariable on carval_carcode = carv_code and carval_carid = carv_carid
					where carval_carid = :0
					and carval_jsid = :1
					order by carv_seq";
			$value = $DB->GetArray($sql,array($carid,$jobid), PDO::FETCH_ASSOC);				
		}

		$ret = array('imageinfo' => $imageinfo, 'variable' => $var, 'boxsize' => $value);
	
		echo json_encode($ret);
	}
	
	function testActivity($flowid, $o) {
		global $DB;
		$DB->debug=1;
		if (!empty($_POST['PROCEED'])) {
			return true;
		}
		echo "<form method='post'><input type='submit' value='MOVE' name='PROCEED' /></form>";
	}	
	function testScript() {
		return true;
	}


	function notifyLateVerification() {
		sendMailFromTemplate('NOTIFY_LATE_REQ_VER');
		return true;
	}
	
	function notifyLateAcknowledgement() {
		sendMailFromTemplate('NOTIFY_LATE_ACKNOWLEDGE');
		return true;
	}
	
	function notifyLateWIP() {
		sendMailFromTemplate('NOTIFY_LATE_WIP');
		return true;
	}
	function notifyLateQC() {
		sendMailFromTemplate('NOTIFY_LATE_QC');
		return true;
	}
	
	function notifyCustomerAcceptance() {
		sendMailFromTemplate('NOTIFY_CUST_ACCEPTANCE');
		return true;
	}
	
	function autoCustomerAccept($flowid, $case) {
		global $DB;
		$data = array(
			'js_status'=>'COMPLETED',
			'js_decision'=>'Auto Accept',
			'js_completiondate' => $DB->GetOne("select now()")
		);
		return $DB->doUpdate('mjobsheet', $data, array('js_id'=>$case->casekey));
	}
	
	function notifyCustomerAck($flowid, $case) {
		sendMailFromTemplate('NOTIFY_CUSTOMER_ACK');
		return true;
	}
	
	function emailInvoice($flowid, $case) {
		require_once(CLASS_DIR.DS.'Moire'.DS.'Moire.php');
		$m = new Moire();
		$m->invoice_generate($case->casekey);
		sendMailFromTemplate('EMAIL_JOB_INVOICE');
		return true;
	}
	
	function autoCancelJob($flowid, $o) {	
		global $DB;
		$data = array(
			'js_status'=>'CANCELLED',
		);
		return $DB->doUpdate('mjobsheet', $data, array('js_id'=>$o->casekey));
	}
	
}


?>
