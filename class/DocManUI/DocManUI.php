<?php
require_once(CORE_DIR.DS.'inc'.DS.'DocumentManager.inc.php');
class DocManUI {

	var $classurl;
	function __construct() {
		$this->classurl = WEB_HREF.'/'.__CLASS__;
	}

	function initSmarty(){
		$smarty = new Smarty();
		$smarty->caching = false;
		$smarty->setTemplateDir(dirname(__FILE__).DS.'templates');
		$smarty->setCompileDir(DOC_DIR.DS.'smarty'.DS.'templates_c');
		$smarty->setCacheDir(DOC_DIR.DS.'smarty'.DS.'cache');
		$smarty->setConfigDir(DOC_DIR.DS.'smarty'.DS.'configs');
		return $smarty;
	}

	function getFileList($refid, $reftype){
		$doc = new DocumentManager();
		static $DocListCount;
		if($DocListCount) ++$DocListCount;
		else $DocListCount = 1;
		$id="docList_".$DocListCount;
		$docinfo = $doc->getDocInfo($refid,$reftype);
		$smarty = $this->initSmarty();
		$smarty->assign('reftype',$reftype);
		$smarty->assign('id',$id);
		$smarty->assign('downloadurl',WEB_HREF.'/DocManUI/download');
		$smarty->assign('docinfo',$docinfo);
		
		$html = $smarty->fetch('documentlist.html');

		return $html;

	}
	function download(){
		print 'inside download in UI';
		vd($_POST);
		// user $_REQUEST
	}
	
}
?>