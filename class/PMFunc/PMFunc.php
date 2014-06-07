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
	function testnew() {
		echo 123456;
		if (!empty($_POST['PROCEED'])) {
			return array('casekey'=>144, 'casetype'=>'jobsheet');
		}
		echo "<form method='post'><input type='submit' value='MOVE' name='PROCEED' /></form>";
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
	function newJob(){
		global $JOBARRAY;
		$_GET['dboid']='jobsheet';
		$_GET['dbostate']='new';
		dbo_include('jobsheet');
		return $JOBARRAY;
	}
	function getCartonInfo(){
		require_once(INCLUDE_DIR.DS.'Image.inc.php'); // include image class
		global $DB;

		$value = 0;
		$carid = $_POST['carid'];
		$jobid = $_POST['jobid'];

		
		// get image location
		$img = new Image();
		$imageinfo = $img->getImage('boxtype',$carid);


		$sql = "select * from mcartonvariable where carv_carid = :0";
		$var = $DB->GetArray($sql,array($carid), PDO::FETCH_ASSOC);

		if($jobid != 0){
			$sql = "select * from mjscartonvalue
					where carval_carid = :0
					and carval_jsid = :1";
			$value = $DB->GetArray($sql,array($carid,$jobid), PDO::FETCH_ASSOC);				
		}

		$ret = array('imageinfo' => $imageinfo, 'variable' => $var, 'boxsize' => $value);

		echo json_encode($ret);
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
