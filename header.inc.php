<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'init.inc.php');
function html_header($headerTemplate='header.html'){
	global $HTML,$THEME,$DB,$USER;
	if($HTML->smarty){
		require_once('inc/AppMenu.inc.php');
		$Menu = new AppMenu();
		$HTML->addJS('js/jquery-1.10.0.js');
		$HTML->addJS('js/bootstrap.min.js');
		$HTML->addJS('js/moment.min.js');
		$HTML->addJS('js/popup.js');
		$HTML->addJS('js/select2.js');
		$HTML->addJS('js/accounting.js');
		$HTML->addJS('js/init.js');
		$HTML->addCSS('css/'.$THEME.'/css/bootstrap.min.css');
		$HTML->addCSS('css/'.$THEME.'/css/bootstrap-theme.min.css');
		$HTML->addCSS('css/font-awesome/css/font-awesome.min.css');
		$HTML->addCSS('css/'.$THEME.'/dbo.css');
		$HTML->addCSS('css/'.$THEME.'/custom.css');
		$HTML->addCSS('css/'.$THEME.'/select2.css');
		$HTML->addCSS('css/'.$THEME.'/select2-bootstrap.css');
		$HTML->smarty->assign('Menu', $Menu);
		$serverdate = new DateTime() ;
		/*get the notifiction for this user*/
		$sql = "select di_subject from fcuserdiary
				where di_cat = :0
				and di_userid = :1
				and di_status = :2 order by di_id desc";			
		$alertdata = $DB->GetArray($sql,array('Notice',$USER->userid,'ACTIVE'), PDO::FETCH_ASSOC);
		foreach ($alertdata as $key => $value) {
			$string = $value['di_subject'];
			$alertdata[$key]['di_subject'] = wordwrap($string,$stringwidth,"<br>\n");
		}

		$HTML->smarty->assign('alertdata', $alertdata);
		$HTML->smarty->assign('serverdate', $serverdate);
		$HTML->smarty->assign('name', $USER->name);
		$HTML->genHeader($headerTemplate);
	}
}

?>