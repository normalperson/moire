<?php
define('ANONYMOUS', true);
require_once(dirname(__FILE__).'/../../init.inc.php');
require_once(dirname(__FILE__).'/Moire.php');

function generate_monthly_soa(){
	global $DB;
	$rs = $DB->getArrayAssoc("select distinct iv_orgid from minvoice where iv_paid != 'Y' order by iv_orgid");
	if(!$rs) return false;
			
	$sql = "select ms_hostname,ms_port,ms_username,ms_password from fcemailsetting
	where ms_hostname = :0";
	$emailSetting = $DB->GetRow($sql,array('202.190.181.92'), PDO::FETCH_ASSOC);
		
	$moire = new Moire();
	foreach($rs as $row){
		$contenthtml = $moire->soa_as_html($row['iv_orgid']);
		$userRS = $DB->getArray("select distinct usr_email from fcuser join fcuserorgrole on usr_userid = uor_usrid where uor_orgid = :0", array($row['iv_orgid']));
		$emailArr = array();
		foreach($userRS as $row2){
			if($row2['usr_email']) $emailArr[] = array('emailadd'=>$row2['usr_email'], 'name'=>'');
		}
		if(!empty($emailSetting)){
			$mail = new Email();
			$ret = $mail->sendEmail_bySMTP(
				$fromarr=array('emailadd'=>'noreply@moiregc.com.my', 'name'=>'no-reply-moire'),
				$replytoarr='',
				$toaddarr=$emailArr,
				$subject='Moire SOA',	
				$content=$contenthtml,
				$altbody='',
				$attachmentpath='',
				$smtpauth=true,
				$host=$emailSetting['ms_hostname'],
				$port=$emailSetting['ms_port'],
				$username=$emailSetting['ms_username'],
				$password=$emailSetting['ms_password']);
		}
	}
}

generate_monthly_soa();
?>