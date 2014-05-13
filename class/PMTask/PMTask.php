<?php
class PMTask {

	function initSmarty($headerTmpl = "header.html"){
		$smarty = new Smarty();
		$smarty->caching = false;
		$smarty->setTemplateDir(dirname(__FILE__).DS.'templates');
		$smarty->setCompileDir(DOC_DIR.DS.'smarty'.DS.'templates_c');
		$smarty->setCacheDir(DOC_DIR.DS.'smarty'.DS.'cache');
		$smarty->setConfigDir(DOC_DIR.DS.'smarty'.DS.'configs');
		if ($headerTmpl) html_header($headerTmpl);
		return $smarty;
	}

	function home() {
		global $HTML;
		$smarty = $this->initSmarty();
		$HTML->addCSS('css/css.php?c=PMTask&css=home.css');
		$HTML->addJS('js/jquery.autosize.min.js');
		$smarty->display('home.html');
	}
	
	function renderTaskList() {
		global $DB, $USER;
		
		$html = '<ul id="sidebarListing" class="nav nav-pills nav-stacked">';
		$rs = $DB->getArray("select pmwf_id workflowid, max(pmwf_name) workflowname, pmat_id activityid, max(pmat_name) activityname, 
		sum(case when pmf_id is not null then 1 else 0 end) totalcount,
		sum(case when pmf_id is not null and pmf_end_date is null then 1 else 0 end) totalpendingcount,
		sum(case when pmf_id is not null and pmf_end_date is null and pmf_due_date < now() then 1 else 0 end) totaloverduecount,
		min(case when pmf_id is not null and pmf_end_date is null then pmf_due_date  else null end) earliestduedate
		from fcpmworkflow join fcpmactivity on pmwf_id = pmat_pmwfid 
		left join fcpmcaseflow on pmf_obj_type = 'PM_Activity' and pmat_type = 'USER' and pmat_id = pmf_obj_id and pmf_end_date is null
		where pmf_specific_userid is null or (pmf_specific_userid is not null and pmf_specific_userid = :0)
		group by pmwf_id, pmat_id
		order by 2,4", array($USER->userid), PDO::FETCH_ASSOC);
		
		$data = array();
		foreach ($rs as $row) {
			if (!isset($data[$row['workflowid']])) {
				$data[$row['workflowid']] = array(
					'id' => $row['workflowid'],
					'name' => $row['workflowname'],
					'totalpendingcount' => 0,
					'totaloverduecount' => 0,
					'activities' => array(),
				);
			}
			$data[$row['workflowid']]['activities'][$row['activityid']] = array(
				'id' => $row['activityid'],
				'name' => $row['activityname'],
				'totalpendingcount' => $row['totalpendingcount'],
				'totaloverduecount' => $row['totaloverduecount'],
			);
			$data[$row['workflowid']]['totalpendingcount'] += $row['totalpendingcount'];
			$data[$row['workflowid']]['totaloverduecount'] += $row['totaloverduecount'];
		}
		
		foreach ($data as $wfid=>$d) {
			$expand = true;
			$pendingBadge = ($d['totalpendingcount'] > 0) ? "<span ".($d['totaloverduecount'] > 0 ? "class='badge pull-right urgent' title='{$d['totaloverduecount']} overdue task(s)'" : "class='badge pull-right normal'").">{$d['totalpendingcount']}</span>" : "";
			$html .= "<li class='list-workflow'>
						<a href='#collapse{$wfid}' data-toggle='collapse'>
							<span class='fa fa-chevron-left fa-lg list-icon-collapse pull-right'></span>
							<span class='fa fa-chevron-down fa-lg list-icon-expand pull-right'></span>
							{$pendingBadge}
							<i class='fa fa-sitemap fa-fw fa-lg'></i>
							<span>{$d['name']}</span>

						</a>
						<ul id='collapse{$wfid}' class='nav nav-pills nav-stacked collapse ".($expand ? 'in' : '')."'>";
			foreach ($d['activities'] as $atvid=>$a){
				$pendingBadge = ($a['totalpendingcount'] > 0) ? "<span ".($a['totaloverduecount'] > 0 ? "class='badge pull-right urgent ' title='{$a['totaloverduecount']} overdue task(s)'" : "class='badge pull-right normal'").">{$a['totalpendingcount']}</span>" : "";
				$html .= "<li class='list-activity'>
					<a href='#' data-atid='{$a['id']}'>{$pendingBadge}<i class='fa fa-tasks fa-fw fa-lg'></i> <span>{$a['name']}</span></a>
				</li>";
			}
			$html .= "</ul></li>";
		}
		$html .="</ul>";
		
		echo $html;
	}
	
	function renderCaseFlowList() {
		global $HTML, $GLOBAL, $DB;
		$HTML->showFooter = false;
		$HTML->addCSS('css/css.php?c=PMTask&css=caseflowList.css');
		$smarty = $this->initSmarty('header.nh.html');
		if (!empty($_REQUEST['atid'])) {
			$GLOBAL['PMTask_atid'] = $_REQUEST['atid'];
		}
		if (empty($GLOBAL['PMTask_atid'])) return;
		$rs = $DB->getRow("select pmat_name, pmwf_name from fcpmactivity join fcpmworkflow on pmat_pmwfid = pmwf_id where pmat_id = :0", array($GLOBAL['PMTask_atid']));
		if ($rs) {
			echo
			"<ul class='page-breadcrumb breadcrumb' style='border-bottom:1px solid black'>
				<li>
					<i class='fa fa-sitemap fa-fw fa-lg'></i>
					{$rs['pmwf_name']}
				</li>
				<li>
					<i class='fa fa-tasks fa-fw fa-lg'></i> {$rs['pmat_name']}
				</li>
			</ul>";
		}
		dbo_include('pmtask_caseflow_list');
	}
	
	
	function renderActivityPerform() {
		global $HTML, $GLOBAL, $DB;
		$HTML->showFooter = false;
		$smarty = $this->initSmarty('header.nh.html');
		if (!empty($_REQUEST['fid'])) {
			$GLOBAL['PMTask_flowid'] = $_REQUEST['fid'];
		}
		if (empty($GLOBAL['PMTask_flowid'])) return;
		$rs = $DB->getRow("select *
				from fcpmactivity join fcpmworkflow on pmat_pmwfid = pmwf_id 
				join fcpmcaseflow on pmf_obj_type = 'PM_Activity' and pmf_obj_id = pmat_id
				join fcpmcase on pmf_pmcid = pmc_id
				where pmf_id = :0", array($GLOBAL['PMTask_flowid']), PDO::FETCH_ASSOC);
				
		if ($rs) {
			$casedesc = "{$rs['pmc_casetype']}::{$rs['pmc_casekey']}";
			$s = $DB->getRow("select pmct_table, pmct_desc_col, pmct_key_col from fcpmcasetype where pmct_code=:0", array($rs['pmc_casetype']), PDO::FETCH_ASSOC);
			if ($s) $cd = $DB->getOne("select {$s['pmct_desc_col']} from {$s['pmct_table']} where {$s['pmct_key_col']} = :0", array($rs['pmc_casekey']));
			if ($cd) $casedesc = $cd;

			echo
			"<ul class='page-breadcrumb breadcrumb' style='border-bottom:1px solid black'>
				<li>
					<i class='fa fa-sitemap fa-fw fa-lg'></i>
					{$rs['pmwf_name']}
				</li>
				<li>
					<i class='fa fa-tasks fa-fw fa-lg'></i> {$rs['pmat_name']}
				</li>
				<li>
					<i class='fa fa-pencil-square-o fa-fw fa-lg'></i> CASE ID : {$rs['pmc_id']} <i>({$casedesc})</i>
				</li>
			</ul>";
			require_once(CORE_DIR.DS.'inc'.DS.'ProcessManager'.DS.'ProcessManager.class.inc.php');
			$case = new PM_Case($rs['pmc_id']);
			$case->performFlow($GLOBAL['PMTask_flowid'], true);
		}
		else return;
	}

	
	
	// case comment start 
	function getCommentData($caseid, $afterCommID = null, &$lastCommID = null) {
		global $DB, $USER;
	
		if (!$afterCommID) {
			$data = $DB->getArray("select a.*, case when b.usr_name is not null then b.usr_name when pmcc_created_by is not null then pmcc_created_by
			else 'Anonymous' end pmcc_created_name, case when pmcr_id is null then 'unread' else 'read' end read_status
			from fcpmcasecomment a left join fcuser b on usr_userid = pmcc_created_by
			left join fcpmcasecommentread on pmcr_pmccid = pmcc_id and pmcr_read_by = :1
			where pmcc_pmcid = :0 order by pmcc_id", array($caseid, $USER->userid), PDO::FETCH_ASSOC);
		}
		else {
			$data = $DB->getArray("select a.*, case when b.usr_name is not null then b.usr_name when pmcc_created_by is not null then pmcc_created_by
			else 'Anonymous' end pmcc_created_name, case when pmcr_id is null then 'unread' else 'read' end read_status
			from fcpmcasecomment a left join fcuser b on usr_userid = pmcc_created_by
			left join fcpmcasecommentread on pmcr_pmccid = pmcc_id and pmcr_read_by = :1
			where pmcc_pmcid = :0 and pmcc_id > :2 order by pmcc_id", array($caseid, $USER->userid, $afterCommID), PDO::FETCH_ASSOC);
		}
		
		$lastrow = end($data);
		if (!empty($lastrow)) $lastCommID = $lastrow['pmcc_id'];
		
		return $data;
	}
	
	function renderSingleComment($row, $renderReplies = true) {
		global $USER;
		$createdDate = new DateTime($row['pmcc_created_date']);
		
		$html = 
		"<div class='comment".(($row['read_status'] == 'unread') ? ' unread' : '')."' data-commid='{$row['pmcc_id']}' data-parentid='{$row['pmcc_parentid']}'>
			<span class='comment-avatar glyphicon glyphicon-user' title=\"{$row['pmcc_created_name']}\"></span>
			<div class='comment-body'>
				<div class='comment-text'>
					<div class='comment-heading'>
						<a href='javascript:void(0)' title='{$row['pmcc_created_by']}' ".
						(($USER->userid == $row['pmcc_created_by']) ? "class='self'" : "")." >{$row['pmcc_created_name']}".
						(($USER->userid == $row['pmcc_created_by']) ? " (Me)" : "")
						."</a><span title='{$createdDate->format('d-M-Y g:i:s A')}'>".time_different_string($row['pmcc_created_date'])."</span>
					</div>".nl2br(htmlentities($row['pmcc_comment']))."
				</div>
				<div class='comment-footer'>
					<a href='javascript:void(0)' class='comment-reply'>Reply</a>
				</div>
			</div>";
		
		if ($renderReplies && !empty($row['REPLIES'])) {
			foreach ($row['REPLIES'] as $r) {
				$html .= $this->renderSingleComment($r);
			}
		}
		$html .=
			"<div class='comment-reply-area clearfix'>
				<textarea class='comment-reply-textarea' placeholder='Reply comment'></textarea>
				<div style='margin-top: 10px;'>
					<button class='btn btn-sm btn-primary pull-right comment-reply-button' data-parentid='{$row['pmcc_id']}'>Reply</button>
					<button type='button' class='close pull-right comment-reply-close' >&times;</button>
				</div>
			</div>
		</div>";
		return $html;
	}
	
	function renderCommentList() {
		global $HTML, $GLOBAL, $DB;
		if (!empty($_REQUEST['caseid'])) {
			$GLOBAL['PMTask_comment_caseid'] = $_REQUEST['caseid'];
		}
		if (!empty($_REQUEST['flowid'])) {
			$GLOBAL['PMTask_comment_flowid'] = $_REQUEST['flowid'];
		}
		if (empty($GLOBAL['PMTask_comment_caseid'])) return;
		if (empty($GLOBAL['PMTask_comment_flowid'])) $GLOBAL['PMTask_comment_flowid'] = null;
		$lastcommid = null;
		
		$data = $this->getCommentData($GLOBAL['PMTask_comment_caseid'], null, $lastcommid);
		$treedata = arr2tree($data, 'pmcc_id', 'pmcc_parentid', 'REPLIES');
		$commenthtml = $pincommenthtml = '';
		foreach ($treedata as $row) {
			$commenthtml .= $this->renderSingleComment($row);
		}
		
		$smarty = $this->initSmarty(false);
		$smarty->assign('caseid', $GLOBAL['PMTask_comment_caseid']);
		$smarty->assign('flowid', $GLOBAL['PMTask_comment_flowid']);
		$smarty->assign('lastcommid', $lastcommid);
		$smarty->assign('comments', $commenthtml);
		$smarty->assign('pincomments', $pincommenthtml);
		$smarty->display('comment.html');
	}
	
	function createNewComment() {
		global $DB, $USER, $GLOBAL;
		$txt = !empty($_REQUEST['comment']) ?  $_REQUEST['comment'] : '';
		$parentid = !empty($_REQUEST['parentid']) ?  $_REQUEST['parentid'] : null;
		$caseid = !empty($_REQUEST['caseid']) ?  $_REQUEST['caseid'] : false;
		$flowid = !empty($_REQUEST['flowid']) ?  $_REQUEST['flowid'] : null;
		$lastcommid = !empty($_REQUEST['lastcommid']) ?  $_REQUEST['lastcommid'] : null;
		
		if ($txt && $caseid) {
			$now = new DateTime();
			$data = array(
				'pmcc_pmcid' => $caseid,
				'pmcc_pmfid' => $flowid,
				'pmcc_parentid' => $parentid,
				'pmcc_created_date' => $now->format('Y-m-d H:i:s'),
				'pmcc_created_by' => $USER->userid,
				'pmcc_comment' => $txt,
				'pmcc_delete' => 'N',
			);
			$ok = $DB->doInsert('fcpmcasecomment', $data);
			$pmccid = $DB->lastInsertId('fcpmcasecomment_pmcc_id_seq');
			$data2 = array(
				'pmcr_pmccid'=>$pmccid,
				'pmcr_read_by'=>$USER->userid,
				'pmcr_read_date'=>$now->format('Y-m-d H:i:s'),
			);
			$ok = $DB->doInsert('fcpmcasecommentread', $data2);
			$data = $this->getCommentData($caseid, $lastcommid, $lastcommid);
			
			$treedata = arr2tree($data, 'pmcc_id', 'pmcc_parentid', 'REPLIES');
			$commenthtml = '';
			foreach ($treedata as $row) {
				$commenthtml .= $this->renderSingleComment($row);
			}
			
			echo json_encode(array(
				'result'=>true,
				'lastcommid'=>$lastcommid,
				'html'=>$commenthtml
			));
		}
	}
	
	function readComment() {
		global $DB, $USER;
		$caseid = !empty($_REQUEST['caseid']) ?  $_REQUEST['caseid'] : false;
		$tillcommid = !empty($_REQUEST['tillcommid']) ?  $_REQUEST['tillcommid'] : false;
		$now = new DateTime();
		if ($caseid && $tillcommid) {
			$toreadid = $DB->getCol("select pmcc_id from fcpmcasecomment left join fcpmcasecommentread on pmcc_id = pmcr_pmccid and pmcr_read_by = :2
			where pmcc_pmcid=:0 and pmcc_id <= :1 order by pmcc_id", array($caseid, $tillcommid, $USER->userid));
			foreach ($toreadid as $pmccid) {
				$data = array(
					'pmcr_pmccid'=>$pmccid,
					'pmcr_read_by'=>$USER->userid,
					'pmcr_read_date'=>$now->format('Y-m-d H:i:s'),
				);
				$ok = $DB->doInsert('fcpmcasecommentread', $data);
			}
			
			echo json_encode($toreadid);
		}
	}
	// case comment end
	
	
	function jobinfo(){
		global $HTML;

		$HTML->showFooter = false;
		html_header('header.nh.html');
		dbo_include('jobinfo');	
	}
	function jobcolor(){
		global $HTML;

		$HTML->showFooter = false;
		html_header('header.nh.html');
		dbo_include('jobcolor');	
	}
	function jobother(){
		global $HTML;
		
		$HTML->showFooter = false;
		html_header('header.nh.html');
		dbo_include('jobother');	
	}
	function getCartonInfo(){
		global $DB;

		// include document class
		require_once(CORE_DIR.DS.'inc'.DS.'Document.inc.php');		

		$carid = $_POST['carid'];

		// get image location
		$doc = new Document();
		$imageinfo = $doc->getSingleDocInfo($carid,'car_id');


		$sql = "select * from mcartonvariable where carv_carid = :0";
		$var = $DB->GetArray($sql,array($carid), PDO::FETCH_ASSOC);

		$ret = array('imageinfo' => $imageinfo, 'var' => $var);

		echo json_encode($ret);
	}
}
?>