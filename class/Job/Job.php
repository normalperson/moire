<?php
class Job {

	var $classurl;
	function __construct() {
		$this->classurl = WEB_HREF.'/'.__CLASS__;
	}

	function startJob($jobname){
		global $DB;
		if($jobname == '') return 'Must have jobname';
		$data = array('js_jobname' =>$jobname,
			          'js_jobcnt' => 0);
		$ok = $DB->doInsert('fcjobstate',$data);
		if(!$ok) return 'Insert fail';

		return true;
	}
	function updateJob($jobname,$cnt=0,$lastprimarykey=''){
		if($jobname == '') return 'Must have jobname';

		$data = array('js_jobcnt' => $cnt,
			          'js_lastjobprimarykey' => $lastprimarykey,
			          'js_lastupdate' => $DB->GetOne("select now()") );
		$ok = $DB->doUpdate('fcjobstate',$data, array('js_jobname'=>$jobname));
		if(!$ok) return 'Job not found!';

		return true;

	}
	function endJob($jobname,$cnt=0,$lastprimarykey=''){
		if($jobname == '') return 'Must have jobname';

		$data = array('js_jobcnt' => $cnt,
			          'js_lastjobprimarykey' => $lastprimarykey,
			          'js_lastupdate' => $DB->GetOne("select now()"),
			          'js_jobend' => $DB->GetOne("select now()") );
		$ok = $DB->doUpdate('fcjobstate',$data, array('js_jobname'=>$jobname));
		if(!$ok) return 'Job not found!';

		return true;



	}

}
?>