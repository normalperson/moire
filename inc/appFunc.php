<?php
function getUserAvatarImage($userid) {

	$imgfile = IMAGE_HREF.'/default_avatar.png';
	if (file_exists(DOC_DIR.DS.'image'.DS.'avatar'.DS.$userid.'.png')) $imgfile = IMAGE_HREF.'/avatar/'.$userid.'.png';
	if (file_exists(DOC_DIR.DS.'image'.DS.'avatar'.DS.$userid.'.jpg')) $imgfile = IMAGE_HREF.'/avatar/'.$userid.'.jpg';
	return $imgfile;
	
}
function getHighestPriorityCat($catstring){
	if($catstring == '') return 'Cat string cannot be empty';

	global $DB;


	$sql = "select jcl_id from mjobcatlookup
			where jcl_id in ($catstring)
			order by jcl_sequence desc
			limit 1";

	return $DB->GetOne($sql,null, PDO::FETCH_ASSOC);

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
			$recipientArr = array(array('emailadd'=>$recp, 'name'=>''));
			if($recpcc)
				$recipientArr[] = array('emailadd'=>$recpcc, 'name'=>'');
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



?>