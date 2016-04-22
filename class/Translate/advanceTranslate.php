<?php
global $HTML, $DB, $LANG, $GLOBAL;
$smarty = new Smarty();
$smarty->caching = false;
$smarty->setTemplateDir(dirname(__FILE__).DS.'templates');
$smarty->setCompileDir(DOC_DIR.DS.'smarty'.DS.'templates_c');
html_header();

$exLang = scandir(LANG_DIR);
$exLangQ = array();
foreach ($exLang as $i=>$f) {
	if (in_array($f,array('.','..')) || !is_dir(LANG_DIR.DS.$f)) {
		unset($exLang[$i]);
	}
	else {
		$exLangQ[$i] = $DB->quote($f);
	}
}

$langclause = ($exLangQ) ? implode(", ",$exLangQ) : "''";
$langRS = $DB->GetArray("select lang_code, lang_name,
								case when lang_code in (".$langclause.") then 'Existing'
								else 'Other' end cat
							from ".$DB->prefix."lang where lang_status='ACTIVE' order by 3, 2");
$langList = array();
foreach ($langRS as $l) {
	$langList[$l['cat']][] = array("langName"=>$l['lang_name'], "langCode"=>$l['lang_code']);
}

$langFiles = array();
foreach ($langRS as $cl) {
	if (file_exists(LANG_DIR.DS.$cl['lang_code'])) {
		$cLangFiles = scandir(LANG_DIR.DS.$cl['lang_code']);
		foreach ($cLangFiles as $li=>&$lf) {
			if (in_array($lf,array('.','..')))	unset($cLangFiles[$li]);
			else {
				$lf = array (
						"lang_file"=>str_replace(Translate::$langFileExt, "", $lf),
						"lang_file_lang"=>$cl['lang_code'],
				);
			}
		}
		$langFiles[$cl['lang_name']] = $cLangFiles;
	}
}

$smarty->assign('langlist',$langList);
$smarty->assign('langfiles',$langFiles);
$smarty->display('translate_advance.html');

?>