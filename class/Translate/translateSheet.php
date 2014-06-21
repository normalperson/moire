<?php

function saveLangFile (&$retmsg) {
	if (!empty($_POST['translate_file']) && !empty($_POST['translate_lang'])) {
		$langFile = $_POST['translate_file'];
		$langArr = $_POST['translate_lang'];
		$langKey = (empty($_POST['translate_key'])) ? array() : $_POST['translate_key'];

		if (strpbrk($langFile, "\\/?%*:.|\"<>") !== FALSE) {
			$retmsg = "Invalid File Name : $langFile";
			return false;
		}
		$langData = array();
		$transData = (empty($_POST['translate_text'])) ? array() : $_POST['translate_text'];
		foreach ($transData as $i=>$tl) {
			foreach ($tl as $j=>$txt) {
				if (!empty($langArr[$i]) && !empty($langKey[$j])) {
					$langData[$langArr[$i]][$langKey[$j]] = $txt;
				}
			}
		}

		if (!$langData) {
			$retmsg = "No data to save";
			return false;
		}
		$retmsg = "";
		foreach ($langData as $lang=>$tldata) {
			$ok = Translate::_tl_gen_file ($lang, $langFile, $tldata);
			$retmsg .= "<p class='".(($ok) ? "text-success" : "text-error")." text-left'>Write Translate Data to <strong>".
							LANG_DIR.DS.$lang.DS.$langFile.Translate::$langFileExt."</strong> : ".(($ok) ? "SUCCESS" : "FAILED")."</p>";
		}
		return true;
	}
}

global $GLOBAL, $DB;
$messagecat = 'alert-error';
$message = '';
if (!empty($_POST['load_submit'])) {
	$GLOBAL['customtranslatelang'] = $GLOBAL['customtranslatefile'] = false;
	if (!empty($_POST['load_type'])) {
		$GLOBAL['customtranslatemode'] = $_POST['load_type'];
		if ($_POST['load_type'] == 'EXIST') {
			$GLOBAL['customtranslatefile'] = $_POST['load_file'];
		}
		else if ($_POST['load_type'] == 'NEW') {
			$GLOBAL['customtranslatefile'] = $_POST['load_name'];
		}
		else $GLOBAL['customtranslatefile'] = false;

		if (!empty($_POST['load_translate'])) {
			$GLOBAL['customtranslatelang'] = $_POST['load_translate'];
		}
		else $GLOBAL['customtranslatelang'] = false;
	}
}

$smarty = new Smarty();
$smarty->caching = false;
$smarty->setTemplateDir(dirname(__FILE__).DS.'templates');
$smarty->setCompileDir(DOC_DIR.DS.'smarty'.DS.'templates_c');
html_header('header.nh.html');

if (isset($_POST['translate_cancel']) || isset($_POST['load_cancel'])) {
	$GLOBAL['customtranslatelang'] = $GLOBAL['customtranslatefile'] = false;
}

if (isset($_POST['translate_submit'])) {
	$ok = saveLangFile($message);
	if ($ok) {
		$messagecat = 'alert-success';
		$GLOBAL['customtranslatelang'] = $_POST['translate_lang'];
		$GLOBAL['customtranslatefile'] = $_POST['translate_file'];
	}
}

$doTranslate = false;
$translateFile = (!empty($GLOBAL['customtranslatefile'])) ? $GLOBAL['customtranslatefile'] : false;
$translateLang = (!empty($GLOBAL['customtranslatelang'])) ? $GLOBAL['customtranslatelang'] : false;
$translateData = array();

if ($translateFile  && $translateLang) {
	$doTranslate = true;
	$langOrder = "order by case ";
	foreach ($translateLang as $i=>&$lg) {
		$lg = $DB->quote($lg);
		$langOrder .= " when lang_code = $lg then $i ";
	}
	$langOrder .= " end";
	$langWhere = implode(', ',$translateLang);
	$translateLang = array();
	$langRS = $DB->GetArray("select lang_code, lang_name from ".$DB->prefix."lang where lang_code in ($langWhere) $langOrder");
	if ($langRS) {
		foreach ($langRS as $l) {
			$translateLang[$l['lang_code']] = $l['lang_name'];

		}
		foreach ($translateLang as $lang=>$langdesc) {
			$langfullpath = LANG_DIR.DS.$lang.DS.$translateFile.Translate::$langFileExt;
			if (file_exists($langfullpath)) {
				include($langfullpath);
				if (!empty($translate))	{
					foreach ($translate as $k=>$v) {
						if (!isset($translateData[$k][$lang]))
							$translateData[$k][$lang] = htmlentities($v, ENT_QUOTES, "UTF-8");
					}
				}
			}
		}
	}
	else $message = "Please select valid language";
}
else if (!$translateFile) $message = "Please select file";
else if (!$translateLang) $message = "Please select language";


$colspan = (($translateLang) ? count($translateLang) : 0 ) + 2;
$smarty->assign('message',$message);
$smarty->assign('messagecat',$messagecat);
$smarty->assign('translatefile',$translateFile);
$smarty->assign('translatedata',$translateData);
$smarty->assign('translatelang',$translateLang);
$smarty->assign('colspan',$colspan);
$smarty->assign('dotranslate',$doTranslate);
$smarty->display('translate_sheet.html');

?>