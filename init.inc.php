/*<?php
require_once(dirname(__FILE__).'/inc/constant.inc.php');
require_once(dirname(__FILE__).'/../../fcore/init.inc.php');
require_once(dirname(__FILE__).'/header.inc.php');
require_once(dirname(__FILE__).'/inc/generalFunc.php');
require_once(dirname(__FILE__).'/inc/appFunc.php');
$User->requireLogin();
/*$User->group[] = 'ADMIN';*/
if ($USER->role == 'Customer') {
	$accepted = $DB->getOne("select count(*) from mtncacceptance where tca_userid=:0 and 
	tca_tcid in (select max(tc_id) from mtnc) and tca_result='AGREE'", array($USER->userid));
	if (!$accepted) {
		
		if(isset($_GET['logout'])){
			$User->logout();
		}
		if (!empty($_POST['tnc_agree'])) {
			$data = array(
				'tca_tcid'=>$_POST['tnc_agree'],
				'tca_userid'=>$User->userid,
				'tca_date'=>$DB->getOne('select now()'),
				'tca_result'=>'AGREE',
			);
			$DB->doInsert('mtncacceptance', $data);
		}
		else {
			$rs = $DB->getRow("select * from mtnc order by tc_id desc", array(), PDO::FETCH_ASSOC);
			$smarty = new Smarty();
			$smarty->caching = false;
			$smarty->setTemplateDir(DOC_DIR.DS.'smarty'.DS.'templates');
			$smarty->setCompileDir(DOC_DIR.DS.'smarty'.DS.'templates_c');
			$smarty->setCacheDir(DOC_DIR.DS.'smarty'.DS.'cache');
			$smarty->setConfigDir(DOC_DIR.DS.'smarty'.DS.'configs');
			$smarty->assign('appurl',APP_HREF);
			$smarty->assign('title',"Pnd's Moire Portal");
			$smarty->assign('rs', $rs);
			$smarty->display('tnc.html');
			die();
		}
	}
}

global $PUSHSOCKET;
if (class_exists('ZMQContext')) {
	$dsn = "tcp://127.0.0.1:5555";
	$context = new ZMQContext();
	$socket = $context->getSocket(ZMQ::SOCKET_PUSH, 'app pusher');
	$endpoints = $socket->getEndpoints();
	/* Check if the socket is connected */
	if (!in_array($dsn, $endpoints['connect'])) {
		$socket->connect($dsn);
	}
	$PUSHSOCKET = $socket;
}
?>*/