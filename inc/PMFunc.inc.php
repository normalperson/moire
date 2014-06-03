<?php
class PMFunc{
	
	function testScriptActivity($flowid, $o) {
		dbo_include('user');
	}
	function initSmarty(){
		$smarty = new Smarty();
		$smarty->caching = false;
		$smarty->setTemplateDir(DOC_DIR.DS.'smarty'.DS.'PMfunctemplates');
		$smarty->setCompileDir(DOC_DIR.DS.'smarty'.DS.'templates_c');
		$smarty->setCacheDir(DOC_DIR.DS.'smarty'.DS.'cache');
		$smarty->setConfigDir(DOC_DIR.DS.'smarty'.DS.'configs');
		
		return $smarty;
	}
	function testEng($flowid,$o){
		echo '1234';
	}
	function reqVerification($flowid,$o){
		$_GET['dboid']='reqverification';
		$_GET['js_id']=$flowid;
		$_GET['dbostate']='edit';
		dbo_include('reqverification');
		
		//$this->viewJobInfo($o->casekey);
	}
	function viewJobInfo($caseobj){
		global $DB;
		$jsid = $caseobj->casekey;
		$smarty = $this->initSmarty();
		$sql = "select * from mcarton";
		$carton = $DB->GetArray($sql,null, PDO::FETCH_ASSOC);
		$smarty->assign('carton',$carton);
		$smarty->assign('jsid',$jsid);
		$smarty->display('viewjob.html');
	}
	function pendingRevert($flowid,$o){
		global $DB;
		$smarty = $this->initSmarty();
		$jsid = $o->casekey;
		$sql = "select * from mcarton";
		$carton = $DB->GetArray($sql,null, PDO::FETCH_ASSOC);
		$smarty->assign('carton',$carton);
		$smarty->assign('jsid',$jsid);
		$smarty->display('editjob.html');

	}
	function pendingAcknowledge($flowid,$o){
		global $DB;
		$smarty = $this->initSmarty();
		$jsid = $o->casekey;
		$sql = "select * from mcarton";
		$carton = $DB->GetArray($sql,null, PDO::FETCH_ASSOC);
		$smarty->assign('carton',$carton);
		$smarty->assign('jsid',$jsid);
		$smarty->display('acknowledgejob.html');

	}
	function wip($flowid, $o){
		$_GET['dboid']='wip';
		$_GET['js_id']=$flowid;
		$_GET['dbostate']='edit';
		dbo_include('wip');
		
		// $this->viewJobInfo($o->casekey);

	}
	function pendingQC($flowid, $o){
		$_GET['dboid']='pendingQC';
		$_GET['js_id']=$flowid;
		$_GET['dbostate']='edit';
		dbo_include('pendingQC');
		
		// $this->viewJobInfo($o->casekey);

	}
	function pendingCust($flowid,$o){
		$_GET['dboid']='customeracceptance';
		$_GET['js_id']=$flowid;
		$_GET['dbostate']='edit';
		dbo_include('customeracceptance');
		
		// $this->viewJobInfo($o->casekey);

	}
	
	function testActivity($flowid, $o) {
		global $DB;
		$DB->debug=1;
		if (!empty($_POST['PROCEED'])) {
			return true;
		}
		echo "<form method='post'><input type='submit' value='MOVE' name='PROCEED' /></form>";
	}	
	function testScript() {
		return true;
	}
}


?>
