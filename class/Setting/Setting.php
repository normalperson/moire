<?php
require_once(dirname(__FILE__).'/../../init.inc.php');
require_once(dirname(__FILE__).'/../../inc/generalFunc.php');

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
	function testMove(){
		vd('inside this function');
		vd($_POST);

	}
	function testUpload(){
		html_header();
		dbo_include('testUpload');
	}
	function customUpload(){
		html_header();
		$smarty = new Smarty();
		$smarty->caching = false;
		$smarty->setTemplateDir(DOC_DIR.DS.'smarty'.DS.'templates');
		$smarty->setCompileDir(DOC_DIR.DS.'smarty'.DS.'templates_c');
		$smarty->setCacheDir(DOC_DIR.DS.'smarty'.DS.'cache');
		$smarty->setConfigDir(DOC_DIR.DS.'smarty'.DS.'configs');

		$smarty->display('customupload.html');
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
	function cartonSetup(){
		html_header();
		$dbo = dbo_include('cartonsetup');
	}
	function lookupSetup(){
		html_header();
		$dbo = dbo_include('lookup');
	}
	function jobcatsetup(){
		html_header();
		$dbo = dbo_include('jobcatsetup');
	}
	function joboutputsetup(){
		html_header();
		$dbo = dbo_include('joboutputsetup');
	}
	function User(){
		html_header();
		$dbo = dbo_include('user');
	}
	function Role(){
		html_header();
		$dbo = dbo_include('role');
	}
	function Permission(){
		html_header();
		$dbo = dbo_include('permission');
	}
	function getrole(){
		global $DB;
		$rolepermarr = $DB->GetArray("select rp_pmscode from fcroleperm join fcrole on rp_rolid = rol_id where rol_id = :0",array($_POST['rolid']));
		echo json_encode($rolepermarr);
	}
	function usersetting(){
		html_header();
		$dbo = dbo_include('user');
	}
	function rolesetting(){
		html_header();
		$dbo = dbo_include('role');
	}
	function permsetting(){
		html_header();
		$dbo = dbo_include('permission');
	}
	function menusetup(){
		html_header();
		$dbo = dbo_include('menu');	
	}
	function showDBO(){
		html_header();
		$dbo = dbo_include('jobsheet');	

	}
	function showDBO2(){
		html_header();
		$dbo = dbo_include('flowsummary');	

	}
	function machinesetup(){
		html_header();
		$dbo = dbo_include('machinesetup');
	}
	
	function testlocale() {
		global $LOCALE;
		html_header();
		
		echo "<div>";
		//pr($LOCALE);
		echo "<form method='post'>";
		echo "Date<input type='text' name='datetime' value='".(!empty($_POST['datetime']) ? $_POST['datetime'] : '')."' />";
		echo "Interval<input type='text' name='interval' value='".(!empty($_POST['interval']) ? $_POST['interval'] : '')."' />";
		echo "<input type='submit'>";
		echo "</form>";
		echo "</div>";
		if (!empty($_POST['datetime'])) {
			$dt = new DateTime($_POST['datetime']);
			$di = new DateInterval($_POST['interval']);
			$LOCALE->dateTimeAdd($dt, $di);
			vd($dt);
		}
	}
	
	
	function localesetup() {
		html_header();
		dbo_include('locale_setup');
	}
	
	function mailtemplatesetup() {
		html_header();
		dbo_include('mail_template');
	}
}

$Setting = new Setting();
?>