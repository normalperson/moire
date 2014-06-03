<?php
require_once(INCLUDE_DIR.DS.'PMFunc.inc.php');
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

	function renderNavi() {
		global $DB, $USER;

		$html = '<ul id="taskListing" class="navigation">
					<li class="mm-dropdown mm-dropdown-root"><a href="#"><i class="menu-icon fa fa-tasks"></i><span class="mm-text mmc-dropdown-delay animated fadeIn">Task</span></a>
						<ul class="mmc-dropdown-delay animated fadeInLeft">';

		// USER ACTIVITIES
		$rs = $DB->getArray("select pmwf_id workflowid, max(pmwf_name) workflowname, 'PM_Activity' as object_type, pmat_id activityid, max(pmat_name) activityname, 
		sum(case when pmf_id is not null then 1 else 0 end) totalcount,
		sum(case when pmf_id is not null and pmf_end_date is null then 1 else 0 end) totalpendingcount,
		sum(case when pmf_id is not null and pmf_end_date is null and pmf_due_date < now() then 1 else 0 end) totaloverduecount,
		min(case when pmf_id is not null and pmf_end_date is null then pmf_due_date  else null end) earliestduedate
		from fcpmworkflow join fcpmactivity on pmwf_id = pmat_pmwfid and pmat_type = 'USER'
		left join fcpmcaseflow on pmf_obj_type = 'PM_Activity' and pmat_id = pmf_obj_id and pmf_end_date is null
		group by pmwf_id, pmat_id
		order by 2,4", array(), PDO::FETCH_ASSOC);

		// INTERMEDIATE EVENTS SHOW AS TASK
		$rs2 = $DB->getArray("select pmwf_id workflowid, max(pmwf_name) workflowname, 'PM_Event' as object_type, pmev_id eventid, max(pmev_name) eventname, 
		sum(case when pmf_id is not null then 1 else 0 end) totalcount,
		sum(case when pmf_id is not null and pmf_end_date is null then 1 else 0 end) totalpendingcount,
		sum(case when pmf_id is not null and pmf_end_date is null and pmf_due_date < now() then 1 else 0 end) totaloverduecount,
		min(case when pmf_id is not null and pmf_end_date is null then pmf_due_date  else null end) earliestduedate
		from fcpmworkflow join fcpmevent on pmwf_id = pmev_pmwfid and pmev_type = 'INTERMEDIATE' and pmev_intermediate_show_task = 'Y'
		left join fcpmcaseflow on pmf_obj_type = 'PM_Event' and pmev_id = pmf_obj_id and pmf_end_date is null
		group by pmwf_id, pmev_id
		order by 2,4", array(), PDO::FETCH_ASSOC);

		$rs = array_merge($rs, $rs2);
		$data = array();
		foreach ($rs as $row) {
			if (!isset($data[$row['workflowid']])) {
				$data[$row['workflowid']] = array(
					'id' => $row['workflowid'],
					'name' => $row['workflowname'],
					'totalpendingcount' => 0,
					'totaloverduecount' => 0,
					'activities' => array(),
					'events' => array(),
				);
			}
			if ($row['object_type'] == 'PM_Activity') {
				$data[$row['workflowid']]['activities'][$row['activityid']] = array(
					'id' => $row['activityid'],
					'name' => $row['activityname'],
					'totalpendingcount' => $row['totalpendingcount'],
					'totaloverduecount' => $row['totaloverduecount'],
				);
			}
			else if ($row['object_type'] == 'PM_Event') {
				$data[$row['workflowid']]['events'][$row['eventid']] = array(
					'id' => $row['eventid'],
					'name' => $row['eventname'],
					'totalpendingcount' => $row['totalpendingcount'],
					'totaloverduecount' => $row['totaloverduecount'],
				);
			}
			$data[$row['workflowid']]['totalpendingcount'] += $row['totalpendingcount'];
			$data[$row['workflowid']]['totaloverduecount'] += $row['totaloverduecount'];
		}

		foreach ($data as $wfid=>$d) {

			$pendingBadge = ($d['totalpendingcount'] > 0) ? "<span ".($d['totaloverduecount'] > 0 ? 
				"class='label label-danger' title='{$d['totaloverduecount']} overdue task(s)'" : 
				"class='label label-info'").">{$d['totalpendingcount']}</span>" : "";
			$html .= "<li class='mm-dropdown'>
						<a tabindex='-1' href='#'>
							<span class='mm-text'>{$d['name']}</span>
							{$pendingBadge}
						</a>
						<ul>";
			foreach ($d['activities'] as $atvid=>$a){
				$pendingBadge = ($a['totalpendingcount'] > 0) ? "<span ".($a['totaloverduecount'] > 0 ? 
					"class='label label-danger' title='{$a['totaloverduecount']} overdue task(s)'" : 
					"class='label label-info'").">{$a['totalpendingcount']}</span>" : "";
				$html .= "
							<li>
								<a tabindex='-1' href='?atid={$a['id']}'><i class='menu-icon fa fa-pencil-square-o' title='Activity Task'></i><span class='mm-text'>{$a['name']}</span>{$pendingBadge}</a>
							</li>";
			}
			foreach ($d['events'] as $evid=>$e){
				$pendingBadge = ($e['totalpendingcount'] > 0) ? "<span ".($e['totaloverduecount'] > 0 ? 
					"class='label label-danger' title='{$e['totaloverduecount']} overdue task(s)'" : 
					"class='label label-info'").">{$e['totalpendingcount']}</span>" : "";
				$html .= "
							<li>
								<a tabindex='-1' href='?evid={$e['id']}'><i class='menu-icon fa fa-play-circle-o' title='Intermediate Event'></i><span class='mm-text'>{$e['name']}</span>{$pendingBadge}</a>
							</li>";
			}
			$html .= "</ul></li>";
		}
		$html .="</ul>";

		echo $html;
	}


	function simulateStart() {
		$s = new PM_Event(1);
		$s->start(152, 'jobsheet');
	}

	function runAllTimer() { // temp
		global $DB;
		$DB->showSQL=true;
		$dueArr = $DB->getArray("select * from fcpmcaseflow where pmf_end_date is null and pmf_timer_due_date <= now()");
		foreach($dueArr as $d) {
			$case = new PM_Case($d['pmf_pmcid']);
			$case->performFlow($d['pmf_id'], false, true);
		}
	}

	function home() {
		global $HTML, $DB;

		$smarty = $this->initSmarty();
		$HTML->addCSS('css/css.php?c=PMTask&css=home.css');
		$HTML->addJS('js/jquery.autosize.min.js');
		$casetype = $DB->getArray("select pmct_code, pmct_desc from fcpmcasetype order by pmct_desc");
		$smarty->assign('casetype', $casetype);
		$smarty->display('home.html');

	}

	var $caseTypeLabel = array(
		'label-primary',
		'label-success',
		'label-info',
		'label-warning',
		'label-danger',
	);

	function renderCaseSearch() {
		global $DB;
		$query = $_REQUEST['q'];
		$casetype = $_REQUEST['ct'];
		$data = array();
		$maxresult = 10;
		if ($query) {
			$query = "%{$query}%";
			$setup = $DB->getArray("select * from fcpmcasetype where :0 = 'all' or (:0 != 'all' and :0 = pmct_code) order by pmct_desc", array($casetype), PDO::FETCH_ASSOC);
			foreach ($setup as $si=>$s) {
				$rs = $DB->getAll("select pmc_id caseid, {$s['pmct_desc_col']} as casedesc, pmc_closed from fcpmcase join {$s['pmct_table']} on pmc_casekey = {$s['pmct_key_col']} 
				where pmc_id::varchar ilike :0 or {$s['pmct_desc_col']} ilike :0 order by pmc_id", array($query));
				foreach ($rs as $r) {
					$data[] = array(
						'casetype'=>$s['pmct_desc'],
						'caseid'=>$r['caseid'],
						'casedesc'=>$r['casedesc'],
						'closed'=>($r['pmc_closed'] == 'Y') ? true : false,
						'label'=>!empty($this->caseTypeLabel[$si]) ? $this->caseTypeLabel[$si] : 'label-default'
					);
					if (count($data) >= 10) break;
				}
				if (count($data) >= 10) break;
			}
		}
		$html = '<ul id="caseListing" class="nav nav-pills nav-stacked">';
		for ($i=0;$i<((count($data) < $maxresult) ? count($data) : $maxresult);$i++) {
			$c = $data[$i];
			$html .= 
			"<li class='list-case'><a href='#' data-caseid='{$c['caseid']}'>
				".((!$c['closed']) ? "<i title='Active Case' class='fa fa-file-text-o fa-fw fa-lg'></i>" : "<i title='Closed Case' class='fa fa-file-o fa-fw fa-lg'></i>")."
				<span class='label {$c['label']} pull-right'>{$c['casetype']}</span>
				<span>#{$c['caseid']} : <i>{$c['casedesc']}</i></span></a>
			</li>";
		}
		$html .= '</ul>';

		echo $html;
	}

	function renderTaskList() {
		global $DB, $USER;

		$html = '<ul id="taskListing" class="nav nav-pills nav-stacked">';
		// USER ACTIVITIES
		$rs = $DB->getArray("select pmwf_id workflowid, max(pmwf_name) workflowname, 'PM_Activity' as object_type, pmat_id activityid, max(pmat_name) activityname, 
		sum(case when pmf_id is not null then 1 else 0 end) totalcount,
		sum(case when pmf_id is not null and pmf_end_date is null then 1 else 0 end) totalpendingcount,
		sum(case when pmf_id is not null and pmf_end_date is null and pmf_due_date < now() then 1 else 0 end) totaloverduecount,
		min(case when pmf_id is not null and pmf_end_date is null then pmf_due_date  else null end) earliestduedate
		from fcpmworkflow join fcpmactivity on pmwf_id = pmat_pmwfid and pmat_type = 'USER'
		left join fcpmcaseflow on pmf_obj_type = 'PM_Activity' and pmat_id = pmf_obj_id and pmf_end_date is null
		where pmf_specific_userid is null or (pmf_specific_userid is not null and pmf_specific_userid = :0)
		group by pmwf_id, pmat_id
		order by 2,4", array($USER->userid), PDO::FETCH_ASSOC);

		// INTERMEDIATE EVENTS SHOW AS TASK
		$rs2 = $DB->getArray("select pmwf_id workflowid, max(pmwf_name) workflowname, 'PM_Event' as object_type, pmev_id eventid, max(pmev_name) eventname, 
		sum(case when pmf_id is not null then 1 else 0 end) totalcount,
		sum(case when pmf_id is not null and pmf_end_date is null then 1 else 0 end) totalpendingcount,
		sum(case when pmf_id is not null and pmf_end_date is null and pmf_due_date < now() then 1 else 0 end) totaloverduecount,
		min(case when pmf_id is not null and pmf_end_date is null then pmf_due_date  else null end) earliestduedate
		from fcpmworkflow join fcpmevent on pmwf_id = pmev_pmwfid and pmev_type = 'INTERMEDIATE' and pmev_intermediate_show_task = 'Y'
		left join fcpmcaseflow on pmf_obj_type = 'PM_Event' and pmev_id = pmf_obj_id and pmf_end_date is null
		where pmf_specific_userid is null or (pmf_specific_userid is not null and pmf_specific_userid = :0)
		group by pmwf_id, pmev_id
		order by 2,4", array($USER->userid), PDO::FETCH_ASSOC);

		$rs = array_merge($rs, $rs2);
		$data = array();
		foreach ($rs as $row) {
			if (!isset($data[$row['workflowid']])) {
				$data[$row['workflowid']] = array(
					'id' => $row['workflowid'],
					'name' => $row['workflowname'],
					'totalpendingcount' => 0,
					'totaloverduecount' => 0,
					'activities' => array(),
					'events' => array(),
				);
			}
			if ($row['object_type'] == 'PM_Activity') {
				$data[$row['workflowid']]['activities'][$row['activityid']] = array(
					'id' => $row['activityid'],
					'name' => $row['activityname'],
					'totalpendingcount' => $row['totalpendingcount'],
					'totaloverduecount' => $row['totaloverduecount'],
				);
			}
			else if ($row['object_type'] == 'PM_Event') {
				$data[$row['workflowid']]['events'][$row['eventid']] = array(
					'id' => $row['eventid'],
					'name' => $row['eventname'],
					'totalpendingcount' => $row['totalpendingcount'],
					'totaloverduecount' => $row['totaloverduecount'],
				);
			}
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
							<i title='Workflow' class='fa fa-sitemap fa-fw fa-lg'></i>
							<span>{$d['name']}</span>

						</a>
						<ul id='collapse{$wfid}' class='nav nav-pills nav-stacked collapse ".($expand ? 'in' : '')."'>";
			foreach ($d['activities'] as $atvid=>$a){
				$pendingBadge = ($a['totalpendingcount'] > 0) ? "<span ".($a['totaloverduecount'] > 0 ? "class='badge pull-right urgent ' title='{$a['totaloverduecount']} overdue task(s)'" : "class='badge pull-right normal'").">{$a['totalpendingcount']}</span>" : "";
				$html .= "<li class='list-activity'>
					<a href='#' data-atid='{$a['id']}'>{$pendingBadge}<i title='User Activity' class='fa fa-tasks fa-fw fa-lg'></i> <span>{$a['name']}</span></a>
				</li>";
			}
			foreach ($d['events'] as $evid=>$e){
				$pendingBadge = ($e['totalpendingcount'] > 0) ? "<span ".($e['totaloverduecount'] > 0 ? "class='badge pull-right urgent ' title='{$e['totaloverduecount']} overdue task(s)'" : "class='badge pull-right normal'").">{$e['totalpendingcount']}</span>" : "";
				$html .= "<li class='list-event'>
					<a href='#' data-evid='{$e['id']}'>{$pendingBadge}<i title='Intermediate Event' class='fa fa-play-circle fa-fw fa-lg'></i> <span>{$e['name']}</span></a>
				</li>";
			}
			$html .= "</ul></li>";
		}
		$html .="</ul>";

		echo $html;
	}

	function renderTopBar($taskid, $tasktype, $fid = false, &$caseid = false) {
		global $DB;
		$rs = false;
		if ($fid) {
			if ($tasktype == 'evid') {
				$rs = $DB->getRow("select *
				from fcpmevent join fcpmworkflow on pmev_pmwfid = pmwf_id 
				join fcpmcaseflow on pmf_obj_type = 'PM_Event' and pmf_obj_id = pmev_id
				join fcpmcase on pmf_pmcid = pmc_id
				where pmf_id = :0", array($fid), PDO::FETCH_ASSOC);
			}
			else {
				$rs = $DB->getRow("select *
				from fcpmactivity join fcpmworkflow on pmat_pmwfid = pmwf_id 
				join fcpmcaseflow on pmf_obj_type = 'PM_Activity' and pmf_obj_id = pmat_id
				join fcpmcase on pmf_pmcid = pmc_id
				where pmf_id = :0", array($fid), PDO::FETCH_ASSOC);
			}
		}
		else if ($taskid) {
			if ($tasktype == 'evid') {
				$rs = $DB->getRow("select *
				from fcpmevent join fcpmworkflow on pmev_pmwfid = pmwf_id where pmev_id = :0", array($taskid), PDO::FETCH_ASSOC);
			}
			else {
				$rs = $DB->getRow("select *
				from fcpmactivity join fcpmworkflow on pmat_pmwfid = pmwf_id where pmat_id = :0", array($taskid), PDO::FETCH_ASSOC);
			}
		}
		else if ($caseid) {
			$rs = $DB->getRow("select * from fcpmcase where pmc_id = :0", array($caseid), PDO::FETCH_ASSOC);
		}
		if ($rs) {
			if (!empty($rs['pmc_id'])) $caseid = $rs['pmc_id'];

			$html = 
			"<div id='taskTopBar'>
				<ul id='taskTopBarPath' class='page-breadcrumb breadcrumb pull-left' >";

			if (!empty($rs['pmwf_id'])) {
				$html .= 
					"<li>
						<i title='Workflow' class='fa fa-sitemap fa-fw fa-lg'></i>
						{$rs['pmwf_name']}
					</li>";

				if ($tasktype == 'evid') {
					$html .= 
					"<li>
						<i title='Intermediate Event' class='fa fa-play-circle fa-fw fa-lg'></i> {$rs['pmev_name']}
					</li>";
				}
				else {
					$html .= 
					"<li>
						<i title='User Activity' class='fa fa-tasks fa-fw fa-lg'></i> {$rs['pmat_name']}
					</li>";
				}
			}

			if (!empty($rs['pmc_id'])) {

				$casedesc = "{$rs['pmc_casetype']}::{$rs['pmc_casekey']}";
				$s = $DB->getRow("select pmct_table, pmct_desc_col, pmct_key_col from fcpmcasetype where pmct_code=:0", array($rs['pmc_casetype']), PDO::FETCH_ASSOC);
				if ($s) $cd = $DB->getOne("select {$s['pmct_desc_col']} from {$s['pmct_table']} where {$s['pmct_key_col']} = :0", array($rs['pmc_casekey']));
				if ($cd) $casedesc = $cd;
				if (!empty($rs['pmf_id'])) {
					$html .= 
						"<li>
							<i title='Task' class='fa fa-pencil-square-o fa-fw fa-lg'></i>#{$rs['pmc_id']} : <i>{$casedesc}</i>
						</li>";
				}
				else {
					$html .= 
						"<li>
						".(($rs['pmc_closed'] == 'Y') ? "<i title='Closed Case' class='fa fa-file-o fa-fw fa-lg'></i>" : "<i title='Active Case' class='fa fa-file-text-o fa-fw fa-lg'></i>")."
							#{$rs['pmc_id']} : <i>{$casedesc}</i>
						</li>";
				}
			}

			$html .= "</ul>";

			$html .= "<div id='taskTopBarActionDiv' class='pull-right'>";
			if (!empty($rs['pmc_id'])) {
				if (!empty($rs['pmf_id'])) $html .= $this->showTaskUrgency($rs['pmf_id']);
				$html .= $this->showCaseIntermediateEvent($rs['pmc_id']);
				$html .= $this->showCommentButton($rs['pmc_id'], (!empty($rs['pmf_id'])) ? $rs['pmf_id'] : false);
				$html .= $this->showFlagButton($rs['pmc_id']);
			}
			$html .= "</div><div class='cb'></div></div>";
			echo $html;

		}
	}

	static function showCaseIntermediateEvent($pmcid) {
		global $DB, $USER;

		if (!empty($_POST['event_action_manual'])) {
			$pmfid = $_POST['event_action_manual'];
			$case = new PM_Case($pmcid);
			$ok = $case->performFlow($pmfid, true);
		}

		$html = '';
		$evRS = $DB->getAll("select * from fcpmcaseflow join fcpmevent on pmf_obj_id = pmev_id and pmf_obj_type = 'PM_Event' 
				where pmf_pmcid = :0 and pmf_end_date is null and 
				(pmf_specific_userid is null or (pmf_specific_userid is not null and pmf_specific_userid = :1)) and 
				pmev_type = 'INTERMEDIATE' order by pmev_name", array($pmcid, $USER->userid), PDO::FETCH_ASSOC);

		if ($evRS) { // has active intermediate event
			$html = "<form id='eventForm' method='post'><input id='eventInp' type='hidden' name='event_action_manual' /></form>
					<div class='btn-group action-event'>
						<button type='button' class='btn btn-default dropdown-toggle btn-sm' data-toggle='dropdown'>Event 
							<span class='caret'></span>
						</button>
						<ul class='dropdown-menu pull-right' role='menu'>";
			foreach ($evRS as $i=>$e) {
				$html .= "<li><a class='event-link' href='javascript:void(0)' data-pmfid='{$e['pmf_id']}'>{$e['pmev_name']}</a></li>";
			}
			$html .= 	"</ul>
					</div>";

			$html .=
"<script type='text/javascript'>
$(function () {
	var \$eventForm = $('#eventForm'),
		\$eventInp = $('#eventInp');
	$('.action-event').on('click', '.event-link', function () {
		\$eventInp.val($(this).data('pmfid'));
		\$eventForm.submit();
	})
})
</script>";
		}
		return $html;
	}

	function renderCaseScreen() {
		global $HTML, $GLOBAL, $DB;
		$HTML->showFooter = false;
		$HTML->addCSS('css/css.php?c=PMTask&css=task.css');
		$smarty = $this->initSmarty('header.nh.html');
		if (!empty($_REQUEST['caseid'])) {
			$GLOBAL['PMTask_caseid'] = $_REQUEST['caseid'];
		}
		if (empty($GLOBAL['PMTask_caseid'])) return;
		$this->renderTopBar(null, null, null, $GLOBAL['PMTask_caseid']);

		$case = new PM_Case($GLOBAL['PMTask_caseid']);
		if ($case->data['pmct_caseinfo_function']) {
			$func = new PMFunc();
			if (method_exists($func, $case->data['pmct_caseinfo_function'])) {
				call_user_func_array(array($func, $case->data['pmct_caseinfo_function']), array($case));
			}
			else echo "'{$case->data['pmct_caseinfo_function']}' does not exist in PMFunc class";
		}
	}

	function renderCaseFlowList() {
		global $HTML, $GLOBAL, $DB;
		$HTML->showFooter = false;
		$HTML->addCSS('css/css.php?c=PMTask&css=task.css');
		$smarty = $this->initSmarty('header.nh.html');
		if (!empty($_REQUEST['atid'])) {
			$GLOBAL['PMTask_taskid'] = $_REQUEST['atid'];
			$GLOBAL['PMTask_tasktype'] = 'atid';
		}
		if (!empty($_REQUEST['evid'])) {
			$GLOBAL['PMTask_taskid'] = $_REQUEST['evid'];
			$GLOBAL['PMTask_tasktype'] = 'evid';
		}
		if (empty($GLOBAL['PMTask_taskid']) || empty($GLOBAL['PMTask_tasktype'])) return;

		$this->renderTopBar($GLOBAL['PMTask_taskid'], $GLOBAL['PMTask_tasktype']);
		if ($GLOBAL['PMTask_tasktype'] == 'evid') {
			if (!empty($_POST['event_action'])) {
				$performed = null;
				$toPerform = (!empty($_POST['dboform_pmtask_caseflow_list_event_list_cb'])) ? $_POST['dboform_pmtask_caseflow_list_event_list_cb'] : array();
				foreach ($toPerform as $p) {
					parse_str($p, $keys);
					$case = new PM_Case($keys['pmf_pmcid']);
					$ok = $case->performFlow($keys['pmf_id'], true);
					if ($ok) $performed = $ok;
				}
				if ($performed) {
					// echo "<script>window.top.location = 'Home'</script>"; //temp
				}
			}
			dbo_include('pmtask_caseflow_list_event');
		}
		else dbo_include('pmtask_caseflow_list');
	}


	function renderActivityPerform() {
		global $HTML, $GLOBAL, $DB;
		$HTML->showFooter = false;
		$HTML->addCSS('css/css.php?c=PMTask&css=task.css');
		$smarty = $this->initSmarty('header.nh.html');
		if (!empty($_REQUEST['fid'])) {
			$GLOBAL['PMTask_flowid'] = $_REQUEST['fid'];
		}
		if (empty($GLOBAL['PMTask_flowid'])) return;

		$caseid = false;
		$this->renderTopBar(null, null, $GLOBAL['PMTask_flowid'], $caseid);

		if ($caseid) {
			$case = new PM_Case($caseid);
			$performed = $case->performFlow($GLOBAL['PMTask_flowid'], true);
			if ($performed) {
				// echo "<script>window.top.location = 'Home'</script>"; //temp
			}
		}
		else return;
	}

	// case urgency
	static function showTaskUrgency($pmfid, $startdate = false, $duedate = false) {
		global $DB;
		static $urgencyDivCount;
		if ($urgencyDivCount) ++$urgencyDivCount;
		else $urgencyDivCount = 1;

		$overdue = false;
		$title = "";
		if ($startdate === false) {
			list($startdate, $duedate) = $DB->getRow("select pmf_start_date, pmf_due_date from fcpmcaseflow where pmf_id=:0", array($pmfid));
		}
		$now = new DateTime();
		if ($duedate) {
			$duedate = new DateTime($duedate);
			if ($duedate < $now) $overdue = true;
			$str = time_different_string($duedate);
			$title = "Task due $str";
		}
		else {
			$str = time_different_string($startdate);
			$title = "Task started $str";

		}

		$divid = "urgencyDiv_{$urgencyDivCount}";
		$ret = "<div id='{$divid}' class='urgency ".(($overdue) ? 'overdue' : 'normal')."' data-toggle='tooltip' data-placement='bottom' title='{$title}'></div>";
		if ($urgencyDivCount == 1) {
			$ret .= "<script type='text/javascript'>
			\$(function () {\$('[data-toggle=\"tooltip\"]').tooltip(); })
			</script>";
		}
		return $ret;
	}

	// case comment start 
	static function showCommentButton($pmcid, $pmfid = false) {
		global $DB, $USER;
		static $commentButtonCount;
		if ($commentButtonCount) ++$commentButtonCount;
		else $commentButtonCount = 1;
		$comm = $DB->getRow("select count(*) total_comment, sum(case when pmcr_id is null then 1 else 0 end) unread_comment from fcpmcasecomment 
		left join fcpmcasecommentread on pmcc_id = pmcr_pmccid and pmcr_read_by = :1 where pmcc_pmcid=:0", array($pmcid, $USER->userid));
		if ($comm['unread_comment'] > 0) $commtitle = "{$comm['unread_comment']} unread comment(s)";
		else if ($comm['total_comment'] > 0) $commtitle = "{$comm['total_comment']} comment(s)";
		else $commtitle = "Post Comment";
		$buttonid  = "commentButton_{$commentButtonCount}";
		$ret = "<span id='{$buttonid}' class='fa fa-comments fa-border action action-comment"
			.(($comm['total_comment'] > 0) ? ' hascomment'.(($comm['unread_comment'] > 0) ? ' unread' : '') : '')
			."' title='{$commtitle}' data-caseid='{$pmcid}' data-flowid='{$pmfid}' data-commid=''></span>";

		if ($commentButtonCount == 1) { 
			$ret .=
			"<script type='text/javascript'>
			$(function () {
				$('.action-comment').click(function (e) {
					e.stopPropagation();
					var \$this = $(this),
						caseid = \$this.data('caseid'),
						flowid = \$this.data('flowid'),
						lastcommentid = \$this.data('commid');
					window.top.toggleLoading(true, function () {
						\$popupDiv = $('<div id=\"commentDiv\"></div>').load('renderCommentList?caseid='+caseid+'&flowid='+flowid, function () {
							var \$thisDiv = $(this);
							window.top.toggleLoading(false, function () {
								window.top.popupContent(\$thisDiv, '<span class=\"fa fa-comments fa-lg\"></span> Comments', '500px', function () {
									var \$firstUnread = \$thisDiv.find('.comment.unread').first();
									if (\$firstUnread.length > 0) {
										$('.content-box',window.top.document).animate({scrollTop: \$firstUnread.offset().top}, '400', 'swing', function() { 
											$.ajax({
												url : 'readComment',
												data : {
													'caseid' : caseid,
													'tillcommid' : \$thisDiv.find('.comment.unread').last().data('commid')
												},
												dataType : 'json',
												success : function(data) {
												}
											})
										});
									}
								});
							});
						})
					})
				})
			})
			</script>";
		}

		return $ret;
	}

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
		if (isset($_REQUEST['flowid'])) {
			$GLOBAL['PMTask_comment_flowid'] = $_REQUEST['flowid'];
		}
		if (empty($GLOBAL['PMTask_comment_caseid'])) return;
		if (!isset($GLOBAL['PMTask_comment_flowid'])) $GLOBAL['PMTask_comment_flowid'] = null;
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



	// case flag start
	static $noFlagTitle = 'Flag This Case';
	static $flagList = array(
		'red' => array('title'=>'Red Flag', 'color'=>'#BD0404'),
		'blue' => array('title'=>'Blue Flag', 'color'=>'rgb(105, 115, 233)'),
		'yellow' => array('title'=>'Yellow Flag', 'color'=>'#DDC40B'),
		'green' => array('title'=>'Green Flag', 'color'=>'#6CD825'),
	);

	static function showFlagButton($pmcid) {
		global $DB, $USER;
		static $flagButtonCount;
		if ($flagButtonCount) ++$flagButtonCount;
		else $flagButtonCount = 1;
		$noFlagTitle = self::$noFlagTitle;
		$flagList = self::$flagList;
		$rs = $DB->getRow("select * from fcpmcaseflag where pmcf_pmcid = :0 and pmcf_flag_by = :1", array($pmcid, $USER->userid), PDO::FETCH_ASSOC);
		if (empty($rs['pmcf_flag_type'])) $flagType = '';
		else $flagType = $rs['pmcf_flag_type'];
		$buttonID = "flagButton_{$flagButtonCount}";
		$ret = "<span id='{$buttonID}' class='fa fa-flag fa-border action action-flag' data-caseid='{$pmcid}' data-flag='{$flagType}' "
		.((!empty($flagList[$flagType])) ? "style='background-color:{$flagList[$flagType]['color']}' title='{$flagList[$flagType]['title']}'" : "title='{$noFlagTitle}'")."></span>";

		if ($flagButtonCount == 1) {
			$ret .= 
			"<script type='text/javascript'>
				$(function () {
					var flagList = ".json_encode($flagList).";
					var noFlagText = \"".$noFlagTitle."\";
					$('.action-flag').click(function (e) {
						e.stopPropagation();
						var \$this = $(this),
							caseid = \$this.data('caseid'),
							flagtype = \$this.data('flag'),
							nextFlagType, useNext = false, cnt = 0;
							
						for (var i in flagList) {
							++cnt;
							if (cnt == 1) nextFlagType = i;
							if (useNext) {
								nextFlagType = i;
								useNext = false;
								break;
							}
							if (i == flagtype) useNext = true;
						}
						if (useNext) nextFlagType = null;
						$.ajax({
							url : 'flagCase',
							data : {
								'caseid' : caseid,
								'flagtype' : nextFlagType
							},
							dataType : 'json',
							success : function(ret) {
								if (ret) \$this.data('flag',ret).css('background-color', flagList[ret].color).attr('title', flagList[ret].title);
								else \$this.data('flag','').css('background-color', '').attr('title', noFlagText);
							}
						})
					})
				})
			</script>";
		}

		return $ret;
	}

	function flagCase() {
		global $DB, $USER;
		$caseid = !empty($_REQUEST['caseid']) ? $_REQUEST['caseid'] : false;
		$flag = !empty($_REQUEST['flagtype']) ? $_REQUEST['flagtype'] : null;

		if ($caseid) {
			if (!empty(self::$flagList[$flag])) {
				$now = new DateTime();
				$data = array(
					'pmcf_flag_date' => $now->format('Y-m-d H:i:s'),
					'pmcf_flag_type' => $flag,
				);
				$ok = $DB->doUpdate("fcpmcaseflag", $data, array('pmcf_pmcid'=>$caseid, 'pmcf_flag_by'=>$USER->userid));
				$affected = $DB->lastRS->rowCount();
				if ($affected == 0) {
					$data['pmcf_pmcid'] = $caseid;
					$data['pmcf_flag_by'] = $USER->userid;
					$ok = $DB->doInsert("fcpmcaseflag", $data);
				}
				echo json_encode($flag);
			}
			else {
				$DB->execute("delete from fcpmcaseflag where pmcf_pmcid=:0 and pmcf_flag_by=:1", array($caseid, $USER->userid));
				echo json_encode(null);
			}
		}
	}
	// case flag end


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