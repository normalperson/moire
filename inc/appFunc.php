<?php
function getUserAvatarImage($userid) {

	$imgfile = IMAGE_HREF.'/default_avatar.png';
	if (file_exists(DOC_DIR.DS.'image'.DS.'avatar'.DS.$userid.'.png')) $imgfile = IMAGE_HREF.'/avatar/'.$userid.'.png';
	if (file_exists(DOC_DIR.DS.'image'.DS.'avatar'.DS.$userid.'.jpg')) $imgfile = IMAGE_HREF.'/avatar/'.$userid.'.jpg';
	return $imgfile;
	
}
function getPrimaryCat($color, $catstring){
	if(!$catstring || !$color) return false;
	global $DB;
	$maxmin = 0;
	$primcat = false;
	$sql = "select * from mjobcatlookup where jcl_id in ($catstring)";
	$rs = $DB->GetArray($sql,null, PDO::FETCH_ASSOC);
	if (!$rs) return false;
	foreach ($rs as $r) {
		if (!empty($r['jcl_requiretime_color_'.$color]) && $r['jcl_requiretime_color_'.$color] > $maxmin) {
			$maxmin = $r['jcl_requiretime_color_'.$color];
			$primcat = $r['jcl_id'];
		}
	}
	return $primcat;
}
function showPrinterInfo($col, $colVal, $data=array(), $html=null){	
	$content = showDBO('machinesetup', 'detail', array('mc_id' => $colVal) );
	$modal = '
				<style type="text/css">#dbo_machinesetup_detail_cancel {
					display:none
				}
				</style>
				<div class="modal modal-large fade" id="spinfo">
			    <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
			        <h4 class="modal-title">Printer info</h4>
			      </div>
			      <div class="modal-body">
			        '.$content.'
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			      </div>
			    </div><!-- /.modal-content -->
			  </div><!-- /.modal-dialog -->
			</div><!-- /.modal -->';
	$newhtml = '<a href="#" id="showPrinterInfo" data-mcid="'.$colVal.'">'.trim($html).'</a>'.$modal.'
	            <script type="text/javascript">
	            $("#showPrinterInfo").click(function(event){
	            	event.preventDefault();
	            	$("#spinfo").modal("show");
	            });
	            </script>';

	return $newhtml;

}

function userTopOrgID(){
	global $USER, $DB;
	$topID = $USER->orgid;
	$parentID = $DB->getOne("select org_parentid from ".$DB->prefix."org where org_id = :0", array($topID));
	while($parentID && $topID!=$parentID){
		$topID = $parentID;
		$parentID = $DB->getOne("select org_parentid from ".$DB->prefix."org where org_id = :0", array($parentID));
	}
	return $topID;
}
function orgTopOrgID($orgID){
	global $DB;
	$topID = $orgID;
	$parentID = $DB->getOne("select org_parentid from ".$DB->prefix."org where org_id = :0", array($topID));
	while($parentID && $topID!=$parentID){
		$topID = $parentID;
		$parentID = $DB->getOne("select org_parentid from ".$DB->prefix."org where org_id = :0", array($parentID));
	}
	return $topID;
}

function sendMailFromTemplate($mtcode) {
	global $DB;
	$rs = $DB->getRow("select * from mmailtemplate where mt_code = :0 and mt_status = 'ACTIVE'", array($mtcode), PDO::FETCH_ASSOC);
	if ($rs) {
		$udv = new UDV();
		$recp = $udv->parse($rs['mt_recipient_to']);
		$recpcc = $udv->parse($rs['mt_recipient_cc']);
		$subject = $udv->parse($rs['mt_subject']);
		$content = $udv->parse($rs['mt_content']);
		
		$emailSettingRS = $DB->getArray("select set_code, set_val from fcsetting where set_code in ('EMAILHOST', 'EMAILPORT', 'EMAILUSERNAME', 'EMAILPASSWORD')");
		$emailSetting = array();
		if($emailSettingRS){
			foreach($emailSettingRS as $row){
				$emailSetting[$row['set_code']] = $row['set_val'];
			}
			$mail = new Email();
			// vd($mail); $fromarr['emailadd'], $fromarr['name']
			
			$recparr = explode(',',$recp);
			$recparr = array_map('trim', $recparr);
			$recparr = array_filter($recparr);
			$recpccarr = explode(',',$recpcc);
			$recpccarr = array_map('trim', $recpccarr);
			$recpccarr = array_filter($recpccarr);
			
			// combine recp and cc, since do not support cc yet
			$recparr = array_merge($recparr, $recpccarr);
			if ($recparr) {
				$recipientArr = array();
				foreach ($recparr as $r) {
					$er = explode(':',$r);
					if (count($er) == 2) list($ignoreid,$r) = $er;
					$recipientArr[] = array('emailadd'=>$r, 'name'=>'');
				}
					
				$ret = $mail->sendEmail_bySMTP(
					$fromarr=array('emailadd'=>'noreply@moiregc.com.my', 'name'=>'no-reply-moire'),
					$replytoarr='',
					$toaddarr=$recipientArr,
					$subject,
					$content,
					$altbody='',
					$attachmentpath='',
					$smtpauth=true,
					$host=$emailSetting['EMAILHOST'],
					$port=$emailSetting['EMAILPORT'],
					$username=$emailSetting['EMAILUSERNAME'],
					$password=$emailSetting['EMAILPASSWORD']);
				// vd($ret);
			}
		}
		
		$rs['mt_internal_userid'] = $udv->parse($rs['mt_internal_userid']);
		if (!empty($rs['mt_internal_userid'])) {
			$userlist = explode(',', $rs['mt_internal_userid']);
			$userlist = array_map('trim', $userlist);
			$userlist = array_filter($userlist);
			include_once(CLASS_DIR.DS.'Notification'.DS.'Notification.php');
			Notification::send($userlist, $subject, $content);
		}
		return true;
	}
	else return false;
}

function calculateCompletion($jsid) {
	global $DB,$LOCALE;
	$due = new DateTime();
	$requiremin = $DB->getOne("select js_requiretime from mjobsheet where js_id = :0", array($jsid));
	$interval = new DateInterval('PT'.$requiremin.'M');
	
	$LOCALE->dateTimeAdd($due, $interval);
	return $due->format('j-M-Y g:i A');
}

function generateInvoiceHTML($jsid) {
	global $DB;
	$ivid = $DB->getOne("select * from minvoice where iv_jsid = :0", array($jsid));
	require_once(CLASS_DIR.DS.'Moire'.DS.'Moire.php');
	$m = new Moire();
	return $m->invoice_as_html($ivid, false);
}

?>