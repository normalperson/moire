<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'jobwip.conf.php');

# customization
function dbo_jobwip_customize(&$dbo){
}


function showActionButtons($col, $colVal, $data=array(), $html=null) {
	
	$ret = '<div style="white-space:nowrap"><button class="btn" form="noform" title="'.tl('Print',false).'" onclick="printJobPreview('.$data['js_id'].');"><span class="btn-label icon fa fa-print"></span></button>';
	global $USER;
	if ($USER->inGroup('REQUEST_NEWJOB')) 
		$ret.= "<a class='btn' title='".tl('Create New Jobsheet',false)."' href='../PMTask/startEvent?id=1&type=PM_Event&referjs={$data['js_id']}'><span class='btn-label icon fa fa-file-text-o'></span></a>";

	if (!empty($data['pmc_id'])) {	
		include_once(CLASS_DIR.DS.'PMTask'.DS.'PMTask.php');	
		$ret .= PMTask::showTimelineButton($data['pmc_id']);
		$ret .= PMTask::showCommentButton($data['pmc_id']);
	}
	return $ret."</div>";
}
# final rendering
$dbo->render();
?>