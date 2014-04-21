<?php
require_once(dirname(__FILE__).'/../../init.inc.php');

class Setting{
	function __construct(){
		global $HTML, $GLOBAL, $DB, $USER;
		$curdir = dirname(__FILE__);

		// $list = glob($curdir.DS.'*.php');
		// pr($list);

		if(!isset($_GET['webf']) || empty($_GET['webf'])) return;
		$func = $_GET['webf'];
		if(file_exists($curdir.DS.$func.'.php')){
			//include($curdir.DS.$func.'.php');
		}else{
			//html_header();
			// echo '<!-- function not found -->';
		}
	}
	
	
	function gensetting(){
		global $HTML,$DB;
		$HTML->showPageTime = false;

		$smarty = new Smarty();
		$smarty->caching = false;
		// $smarty->debugging = true;
		$smarty->setTemplateDir(DOC_DIR.DS.'smarty'.DS.'templates');
		$smarty->setCompileDir(DOC_DIR.DS.'smarty'.DS.'templates_c');
		$smarty->setCacheDir(DOC_DIR.DS.'smarty'.DS.'cache');
		$smarty->setConfigDir(DOC_DIR.DS.'smarty'.DS.'configs');
			
		html_header();

		// get default check in time
		$checkin = $DB->GetOne("select set_val from fcsetting where set_code = :0 and set_user = :1",array('DEFCHECKIN','VHOTEL'));
		$checkout = $DB->GetOne("select set_val from fcsetting where set_code = :0 and set_user = :1",array('DEFCHECKOUT','VHOTEL'));
		$eicharge = $DB->GetOne("select set_val from fcsetting where set_code = :0 and set_user = :1",array('EICHARGE','VHOTEL'));
		$locharge = $DB->GetOne("select set_val from fcsetting where set_code = :0 and set_user = :1",array('LOCHARGE','VHOTEL'));
		$hotelname = $DB->GetOne("select set_val from fcsetting where set_code = :0 and set_user = :1",array('HOTELNAME','VHOTEL'));
		$hoteladd = $DB->GetOne("select set_val from fcsetting where set_code = :0 and set_user = :1",array('HOTELADD','VHOTEL'));
		$sessiontime = $DB->GetOne("select set_val from fcsetting where set_code = :0",array('MAXLIFETIME'));

		$checkinarr = explode(":", $checkin);
		$checkinmin = $checkinarr[0] * 60 + $checkinarr[1];
		$checkoutarr = explode(":", $checkout);
		$checkoutmin = $checkoutarr[0] * 60 + $checkoutarr[1];

		$smarty->assign('checkinmin',$checkinmin);
		$smarty->assign('checkinstr',$checkin);
		$smarty->assign('checkoutmin',$checkoutmin);
		$smarty->assign('checkoutstr',$checkout);
		$smarty->assign('sessiontime',$sessiontime);
		$smarty->assign('eicharge',$eicharge);
		$smarty->assign('locharge',$locharge);
		$smarty->assign('hotelname',$hotelname);
		$smarty->assign('hoteladd',$hoteladd);
		$smarty->display('gensetting.html');
		$HTML->addJS('js/js.php?c=Setting&js=gensetting');
	}
	function getTheme(){
		global $DB;
		$sql = "select lu_code as id ,lu_title as text from fclookup where lu_cat = :0 and lu_status = :1";
		$themearr = $DB->GetArray($sql,array('THEME','ACTIVE'),PDO::FETCH_ASSOC);

		echo json_encode($themearr);
	}
	function getLanguage(){
		global $DB;
		$sql = "select lu_code as id ,lu_title as text from fclookup where lu_cat = :0 and lu_status = :1";
		$langarr = $DB->GetArray($sql,array('LANGUAGE','ACTIVE'),PDO::FETCH_ASSOC);

		echo json_encode($langarr);	
	}
	function defaultTheme(){
		global $DB;
		$sql = "select set_val as id, set_description as text from fcsetting where set_user = :0 and set_code = :1";
		$defTheme = $DB->GetRow($sql,array('VHOTEL','THEME'),PDO::FETCH_ASSOC);

		echo json_encode($defTheme);	
	}
	function defaultLang(){
		global $DB;
		$sql = "select set_val as id, set_description as text from fcsetting where set_user = :0 and set_code = :1";
		$defLang = $DB->GetRow($sql,array('VHOTEL','LANG'),PDO::FETCH_ASSOC);

		echo json_encode($defLang);	
	}
	function updSetting(){
		global $DB;


		extract($_POST);
		$themecol = array('set_val' => $theme, 'set_description' => $themetitle);
		$langcol = array('set_val' => $language, 'set_description' => $languagetitle);
		$sessioncol = array('set_val' => $sessiontime);
		$checkincol = array('set_val' => $checkintime);
		$checkoutcol = array('set_val' => $checkouttime);
		$eicharge = array('set_val' => $eicharge);
		$locharge = array('set_val' => $locharge);
		$hoteladd = array('set_val' => $hoteladdress);
		$hotelname = array('set_val' => $hotelname);

    	$ok = $DB->doUpdate("fcsetting",$themecol, array("set_code"=>'THEME'));
		$ok = $DB->doUpdate("fcsetting",$langcol, array("set_code"=>'LANG'));
		$ok = $DB->doUpdate("fcsetting",$sessioncol, array("set_code"=>'MAXLIFETIME'));
		$ok = $DB->doUpdate("fcsetting",$checkincol, array("set_code"=>'DEFCHECKIN'));
		$ok = $DB->doUpdate("fcsetting",$checkoutcol, array("set_code"=>'DEFCHECKOUT'));
		$ok = $DB->doUpdate("fcsetting",$eicharge, array("set_code"=>'EICHARGE'));
		$ok = $DB->doUpdate("fcsetting",$locharge, array("set_code"=>'LOCHARGE'));
		$ok = $DB->doUpdate("fcsetting",$hoteladd, array("set_code"=>'HOTELADD'));
		$ok = $DB->doUpdate("fcsetting",$hotelname, array("set_code"=>'HOTELNAME'));

	}
	function resetDefault(){
		global $DB;

		$DB->Execute("select resetfcsetting()");
		
	}
	function rtypesetting(){
		global $HTML,$DB;
		$HTML->addJS('js/js.php?c=DBO&js=DBO');
		
		html_header();
		$dbo = dbo_include('setup_roomtype');
	}
	function roomsetting(){
		global $HTML;
		$HTML->addJS('js/js.php?c=DBO&js=DBO');
		html_header();
		$dbo = dbo_include('setup_roomno');
	}
	function dursetting(){
		global $HTML,$DB;
		$HTML->addJS('js/js.php?c=DBO&js=DBO');
		
		html_header();
		$dbo = dbo_include('setup_durationchargebyhour');	
	}
	function onightsetting(){
		global $HTML,$DB;

		html_header();
		$dbo = dbo_include('setup_durationchargebynight');
	}
	function holsetting(){
		global $HTML,$DB;
		$HTML->addJS('js/js.php?c=DBO&js=DBO');

		html_header();
		$dbo = dbo_include('setup_publicholiday');

	}
	function menudemo(){
		global $HTML,$DB;
		$HTML->addJS('js/js.php?c=DBO&js=DBO');

		$dbo = dbo_include('menutable');

	}
	function weekdaysetting(){
		global $HTML,$DB;
		$HTML->addJS('js/js.php?c=DBO&js=DBO');

		html_header();	
		$dbo = dbo_include('setup_weekday');

	}
	function User(){
		global $HTML;
		$HTML->addJS('js/js.php?c=DBO&js=DBO');
		html_header();
		$dbo = dbo_include('user');
	}
	function Role(){
		global $HTML;
		$HTML->addJS('js/js.php?c=DBO&js=DBO');
		html_header();
		$dbo = dbo_include('role');
	}
	function Permission(){
		global $HTML;
		$HTML->addJS('js/js.php?c=DBO&js=DBO');
		html_header();
		$dbo = dbo_include('permission');
	}
	function getrole(){
		global $DB;
		$rolepermarr = $DB->GetArray("select rp_pmsid from fcroleperm join fcrole on rp_rolid = rol_id where rol_code = :0",array($_POST['rolecode']));
		echo json_encode($rolepermarr);
	}
	function usersetting(){
		global $HTML;
		html_header();
		$dbo = dbo_include('user');
	}
	function rolesetting(){
		global $HTML;
		html_header();
		$dbo = dbo_include('role');
	}
	function permsetting(){
		global $HTML;
		html_header();
		$dbo = dbo_include('permission');
	}
	function journalMapping(){
		global $HTML;
		html_header();
		$dbo = dbo_include('journalmapping');	
	}
	function menusetup(){
		global $HTML;
		html_header();
		$dbo = dbo_include('menu');	
	}
	function tutsetup(){
		html_header();
		$dbo = dbo_include('tutorial_setup');	

	}
	
}

$Setting = new Setting();
?>