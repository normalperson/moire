<?php
require_once(CLASS_DIR.DS.'PMFunc'.DS.'PMFunc.php');
class PMTask {

	var $classurl;
	function __construct() {
		$this->classurl = WEB_HREF.'/'.__CLASS__;
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

	function renderDropDown() {
		global $DB, $USER, $GLOBAL;

		$rs = $DB->getArray("select pmev_name, pmev_id, pmwf_name
		from fcpmevent join fcpmworkflow on pmwf_id=pmev_pmwfid 
		left join fcpmswimlane on pmsl_id = pmev_pmslid
		where pmev_type = 'START' and pmev_start_function is not null and ".PM_Case::genObjectPermWhere()."
		order by pmwf_name, pmev_name", array(), PDO::FETCH_ASSOC);

		if ($rs) {
			$html = 
			"<li class='nav-icon-btn nav-icon-btn-default dropdown'>
				<a href='javascript:void(0)' class='dropdown-toggle' data-toggle='dropdown'>
					<i class='nav-icon fa fa-plus'></i>
					<span class='small-screen-text'>Create New</span>
				</a>
				<ul class='dropdown-menu' style='width:300px'>";
			$wfname = "";
			$cnt = 0;
			foreach ($rs as $r) {
				if ($wfname != $r['pmwf_name']) {
					if ($cnt > 0) $html .= "<li role='presentation' class='divider'></li>";
					$html .= "<li role='presentation' class='dropdown-header'>".tl($r['pmwf_name'],true,'workflow')."</li>";
					$wfname = $r['pmwf_name'];
				}
				$html .= "<li><a style='padding-left:30px' href='{$this->classurl}/startEvent?id={$r['pmev_id']}&type=PM_Event'>".tl($r['pmev_name'],true,'workflow')."</a></li>";
			}
			$html .= 
				"</ul>
			</li>";

			return $html;
		}
	}

	function renderNavi($skipUL = true) {
		global $DB, $USER, $GLOBAL;

		// USER ACTIVITIES
		$rs1 = $DB->getArray("select pmwf_id workflowid, max(pmwf_name) workflowname, 'PM_Activity' as object_type, pmat_id activityid, 
		max(pmat_name) activityname, 
		sum(case when pmf_id is not null then 1 else 0 end) totalcount,
		sum(case when pmf_id is not null and pmf_end_date is null then 1 else 0 end) totalpendingcount,
		sum(case when pmf_id is not null and pmf_end_date is null and pmf_due_date < now() then 1 else 0 end) totaloverduecount,
		min(case when pmf_id is not null and pmf_end_date is null then pmf_due_date  else null end) earliestduedate
		from fcpmworkflow join fcpmactivity on pmwf_id = pmat_pmwfid and pmat_type = 'USER'
		join fcpmcaseflow on pmf_obj_type = 'PM_Activity' and pmat_id = pmf_obj_id and pmf_end_date is null
		where ".PM_Case::genFlowPermWhere()."
		group by pmwf_id, pmat_id
		order by 2,4", array(), PDO::FETCH_ASSOC);

		// INTERMEDIATE EVENTS SHOW AS TASK
		$rs2 = $DB->getArray("select pmwf_id workflowid, max(pmwf_name) workflowname, 'PM_Event' as object_type, pmev_id eventid, pmev_type eventtype,
		max(pmev_name) eventname, 
		sum(case when pmf_id is not null then 1 else 0 end) totalcount,
		sum(case when pmf_id is not null and pmf_end_date is null then 1 else 0 end) totalpendingcount,
		sum(case when pmf_id is not null and pmf_end_date is null and pmf_due_date < now() then 1 else 0 end) totaloverduecount,
		min(case when pmf_id is not null and pmf_end_date is null then pmf_due_date  else null end) earliestduedate
		from fcpmworkflow join fcpmevent on pmwf_id = pmev_pmwfid and pmev_type = 'INTERMEDIATE' and pmev_intermediate_show_task = 'Y'
		join fcpmcaseflow on pmf_obj_type = 'PM_Event' and pmev_id = pmf_obj_id and pmf_end_date is null
		where ".PM_Case::genFlowPermWhere()."
		group by pmwf_id, pmev_id, pmev_type
		order by 2, pmev_type desc, 4", array(), PDO::FETCH_ASSOC);

		// START EVENTS SHOW AS TASK
		$rs3 = $DB->getArray("select pmwf_id workflowid, max(pmwf_name) workflowname, 'PM_Event' as object_type, pmev_id eventid, pmev_type eventtype,
		max(pmev_name) eventname, 
		0 totalcount,
		0 totalpendingcount,
		0 totaloverduecount,
		null earliestduedate
		from fcpmworkflow join fcpmevent on pmwf_id = pmev_pmwfid and pmev_type = 'START' and pmev_start_function is not null
		left join fcpmswimlane on pmev_pmslid = pmsl_id
		where ".PM_Case::genObjectPermWhere()."
		group by pmwf_id, pmev_id, pmev_type
		order by 2, pmev_type desc, 4", array(), PDO::FETCH_ASSOC);
		
		$rs = array_merge($rs1, $rs2);
		$rs = array_merge($rs, $rs3);
		
		$data = array();
		$totalpending = 0;
		$totaldue = 0;
		foreach ($rs as $row) {
			if (!isset($data[$row['workflowid']])) {
				$data[$row['workflowid']] = array(
					'id' => $row['workflowid'],
					'name' => $row['workflowname'],
					'totalpendingcount' => 0,
					'totaloverduecount' => 0,
					'activities' => array(),
					'events' => array(),
					'start' => array(),
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
			else if ($row['object_type'] == 'PM_Event' && $row['eventtype'] == 'INTERMEDIATE') {
				$data[$row['workflowid']]['events'][$row['eventid']] = array(
					'id' => $row['eventid'],
					'name' => $row['eventname'],
					'totalpendingcount' => $row['totalpendingcount'],
					'totaloverduecount' => $row['totaloverduecount'],
				);
			}
			else if ($row['object_type'] == 'PM_Event' && $row['eventtype'] == 'START') {
				$data[$row['workflowid']]['start'][$row['eventid']] = array(
					'id' => $row['eventid'],
					'name' => $row['eventname'],
				);
			}
			$data[$row['workflowid']]['totalpendingcount'] += $row['totalpendingcount'];
			$data[$row['workflowid']]['totaloverduecount'] += $row['totaloverduecount'];
			$totalpending += $row['totalpendingcount'];
			$totaldue += $row['totaloverduecount'];
		}
		$html = "";
		foreach ($data as $wfid=>$d) {
			$currhtml = "";
			$focusWF = false;

			foreach ($d['start'] as $sid=>$s) {
				$focusThis = $this->showingTask('PM_Event', $s['id']);
				if ($focusThis) $focusWF = true;
				$currhtml .= "<li ".(($focusThis) ? "class='active'" : '').">
								<a tabindex='-1' href='{$this->classurl}/startEvent?id={$s['id']}&type=PM_Event'>
									<i class='menu-icon fa fa-plus' title='".tl('Start Event',true,'workflow')."'></i>
									<span class='mm-text'>".tl($s['name'],true,'workflow')."</span>
								</a>
							</li>";
			}

			foreach ($d['activities'] as $atvid=>$a){
				$focusThis = $this->showingTask('PM_Activity', $a['id']);
				if ($focusThis) $focusWF = true;
				$pendingBadge = ($a['totalpendingcount'] > 0) ? "<span ".($a['totaloverduecount'] > 0 ? 
					"class='label label-danger' title='{$a['totaloverduecount']} overdue task(s)'" : 
					"class='label label-warning'").">{$a['totalpendingcount']}</span>" : "";
				$currhtml .= "<li ".(($focusThis) ? "class='active'" : '').">
								<a tabindex='-1' href='{$this->classurl}/caseFlowList?id={$a['id']}&type=PM_Activity'>
									<i class='menu-icon fa fa-pencil-square-o' title='".tl('User Activity',true,'workflow')."'></i>
									<span class='mm-text'>".tl($a['name'],true,'workflow')."</span>{$pendingBadge}
								</a>
							</li>";
			}
			foreach ($d['events'] as $evid=>$e){
				$focusThis = $this->showingTask('PM_Event', $e['id']);
				if ($focusThis) $focusWF = true;
				$pendingBadge = ($e['totalpendingcount'] > 0) ? "<span ".($e['totaloverduecount'] > 0 ? 
					"class='label label-danger' title='{$e['totaloverduecount']} overdue task(s)'" : 
					"class='label label-warning'").">{$e['totalpendingcount']}</span>" : "";
				$currhtml .= "<li ".(($focusThis) ? "class='active'" : '').">
								<a tabindex='-1' href='{$this->classurl}/caseFlowList?id={$e['id']}&type=PM_Event'>
									<i class='menu-icon fa fa-play-circle-o' title='".tl('Intermediate Event',true,'workflow')."'></i>
									<span class='mm-text'>".tl($e['name'],true,'workflow')."</span>{$pendingBadge}
								</a>
							</li>";
			}

			$pendingBadge = ($d['totalpendingcount'] > 0) ? "<span ".($d['totaloverduecount'] > 0 ? 
				"class='label label-danger' title='{$d['totaloverduecount']} overdue task(s)'" : 
				"class='label label-warning'").">{$d['totalpendingcount']}</span>" : "";

			$html .= "<li class='mm-dropdown ".(($focusWF) ? 'open active' : '')."'>
						<a tabindex='-1' href='#'>
							<span class='mm-text'>".tl($d['name'],true,'workflow')."</span>
							{$pendingBadge}
						</a>
						<ul>
							{$currhtml}
						</ul>
					</li>";
		}
		$pendingBadge = ($totalpending > 0) ? "<span ".($totaldue > 0 ? 
					"class='label label-danger' title='{$totaldue} overdue task(s)'" : 
					"class='label label-warning'").">{$totalpending}</span>" : "";

		$html = "<li class='mm-dropdown mm-dropdown-root tasklistingLI ".((!empty($_GET['webc']) && $_GET['webc'] == __CLASS__) ? 'open active' : '')."'>
					<a href='#'>
						<i class='menu-icon fa fa-tasks'></i>
						<span class='mm-text mmc-dropdown-delay animated fadeIn'>".tl('Task',true,'workflow')."</span>{$pendingBadge}
					</a>
					<ul class='mmc-dropdown-delay animated fadeInLeft'>
						{$html}
					</ul>
				</li>
				<script type='text/javascript'>
				$('.tasklistingLI').bind('reload', function (e) {
					var \$this = $(this);
					ajaxRenderHTML('{$this->classurl}/ajaxRenderNavi', {}, \$this, 'replaceWith');
				});
				</script>";

		if (!$skipUL) $html = "<ul id='taskListing' class='navigation'>{$html}</ul>";

		return $html;
	}
	
	function ajaxRenderNavi() {
		echo $this->renderNavi();
	
	}

	function showingTask($type, $id) {
		global $GLOBAL;
		$class = isset($_GET['webc'])?$_GET['webc']:false;
		$function = isset($_GET['webf'])?$_GET['webf']:false;

		if ($class == __CLASS__) {
			if (!empty($_GET['id']) && !empty($_GET['type'])) {
				if ($_GET['id']==$id && $_GET['type']==$type) return true;
			}
			else if (!empty($GLOBAL['PMTask_taskid']) && !empty($GLOBAL['PMTask_tasktype'])) {
				if ($GLOBAL['PMTask_taskid'] == $id && $GLOBAL['PMTask_tasktype'] == $type) return true;
			}
		}
		return false;
	}

	function startEvent() {
		ob_start();
		global $HTML, $GLOBAL, $DB;
		$smarty = $this->initSmarty();
		if (!empty($_GET['id'])) {
			$GLOBAL['PMTask_taskid'] = $_GET['id'];
			$GLOBAL['PMTask_tasktype'] = 'PM_Event';
		}
		$ev = new PM_Event($GLOBAL['PMTask_taskid']);
		$this->renderTopBar($ev->id, 'PM_Event');
		$case = $ev->start();
		if ($case) {
			$flowarr = array_keys($case->activeFlow);
			foreach ($flowarr as $fid) {
				$this->notifyNextUsers($case->activeFlow[$fid]);
			}
			redirect('?');
		}
	}

	function caseFlowList() {
		ob_start();
		global $HTML, $GLOBAL, $DB;
		$smarty = $this->initSmarty();

		if (!empty($_REQUEST['id']) && !empty($_REQUEST['type'])) {
			$GLOBAL['PMTask_taskid'] = $_REQUEST['id'];
			$GLOBAL['PMTask_tasktype'] = $_REQUEST['type'];
		}

		if (empty($GLOBAL['PMTask_taskid']) || empty($GLOBAL['PMTask_tasktype'])) return;
		if ($GLOBAL['PMTask_tasktype'] == 'PM_Event') {
			$ev = new PM_Event($GLOBAL['PMTask_taskid']);
			if ($ev->type == 'START') redirect($this->classurl."/startEvent");
		}

		$this->renderTopBar($GLOBAL['PMTask_taskid'], $GLOBAL['PMTask_tasktype']);
		if ($GLOBAL['PMTask_tasktype'] == 'PM_Event') {
			if (!empty($_POST['event_action'])) {
				$performed = null;
				$toPerform = (!empty($_POST['pmtask_event_list_cb'])) ? $_POST['pmtask_event_list_cb'] : array();
				foreach ($toPerform as $p) {
					parse_str($p, $keys);
					$case = new PM_Case($keys['pmf_pmcid']);
					$flowarr_before = array_keys($case->activeFlow);
					$ok = $case->performFlow($keys['pmf_id'], true);
					if ($ok) {
						$flowarr_after = array_keys($case->activeFlow);
						$flowarr_diff = array_diff($flowarr_after, $flowarr_before);
						foreach ($flowarr_diff as $fid) {
							$this->notifyNextUsers($case->activeFlow[$fid]);
						}
						$performed = $ok;
					}
				}
				if ($performed) {
					redirect($this->classurl."/caseFlowList?id={$GLOBAL['PMTask_taskid']}&type={$GLOBAL['PMTask_tasktype']}");
				}
			}
			dbo_include('pmtask_caseflow_list_event');
		}
		else dbo_include('pmtask_caseflow_list');
	}

	var $caseTypeLabel = array(
		'label-primary',
		'label-success',
		'label-info',
		'label-warning',
		'label-danger',
	);

	function renderCaseSearch($limitresult = 12) {
		static $caseSearchCount;
		if ($caseSearchCount) ++$caseSearchCount;
		else $caseSearchCount = 1;
		$id = "caseSearchInp_{$caseSearchCount}";
		$html = "<li><form class='navbar-form pull-left' onsubmit='return false;'><input id='{$id}' type='text' class='form-control' placeholder='Search Case'></form></li>";

		$html .=
		"<script type='text/javascript'>
		(function () {
			$('#{$id}').autocomplete({
				source: function(request, response) {
					$.ajax({
						url: '{$this->classurl}/ajaxCaseSearch',
						dataType: 'json',
						data: {
							limitresult: {$limitresult},
							q: request.term
						},
						success: function(data) {
							response($.map(data.cases, function(item) {
								return {
									label: '#'+item.caseid + ' : ' + item.casedesc,
									value: item.caseid
								}
							}));
						}
					});
				},
				minLength : 1,
				select: function(event, ui) {
					document.location = '{$this->classurl}/renderCaseScreen?caseid='+this.value;
				}
			});
		})()
		</script>";
		return $html;

	}

	function ajaxCaseSearch() {
		global $DB;
		$query = $_REQUEST['q'];
		$maxresult = $_REQUEST['limitresult'];
		$data = array();
		$ret = array();
		if ($query) {
			$query = "%{$query}%";
			$setup = $DB->getArray("select * from fcpmcasetype order by pmct_desc", array(), PDO::FETCH_ASSOC);
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

		for ($i=0;$i<((count($data) < $maxresult) ? count($data) : $maxresult);$i++) {
			$ret['cases'][] = $data[$i];
		}

		echo json_encode($ret);
	}



	function renderTopBar($taskid, $tasktype, $fid = false, &$caseid = false) {
		global $DB;
		$rs = false;
		if ($fid) {
			if ($tasktype == 'PM_Event') {
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
			if ($tasktype == 'PM_Event') {
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
				<ul id='taskTopBarPath' class='breadcrumb pull-left' >";

			if (!empty($rs['pmwf_id'])) {
				$html .= 
					"<li>
						<i title='Workflow' class='fa fa-sitemap fa-fw fa-lg'></i>
						{$rs['pmwf_name']}
					</li>";

				if ($tasktype == 'PM_Event') {
					if ($rs['pmev_type'] == 'START') {
						$html .= 
						"<li>
							<a href='startEvent?id={$rs['pmev_id']}&type=PM_Event'><i title='Start Event' class='fa fa-plus fa-fw fa-lg'></i> {$rs['pmev_name']}</a>
						</li>";
					}
					else {
						$html .= 
						"<li>
							<a href='caseFlowList?id={$rs['pmev_id']}&type=PM_Event'><i title='Intermediate Event' class='fa fa-play-circle-o fa-fw fa-lg'></i> {$rs['pmev_name']}</a>
						</li>";
					}
				}
				else {
					$html .= 
					"<li>
						<a href='caseFlowList?id={$rs['pmat_id']}&type=PM_Activity'><i title='User Activity' class='fa fa-pencil-square-o fa-fw fa-lg'></i> {$rs['pmat_name']}</a>
					</li>";
				}
			}

			if (!empty($rs['pmc_id'])) {
				$cd = false;
				$casedesc = "{$rs['pmc_casetype']}::{$rs['pmc_casekey']}";
				$s = $DB->getRow("select pmct_table, pmct_desc_col, pmct_key_col from fcpmcasetype where pmct_code=:0", array($rs['pmc_casetype']), PDO::FETCH_ASSOC);
				if ($s) $cd = $DB->getOne("select {$s['pmct_desc_col']} from {$s['pmct_table']} where {$s['pmct_key_col']} = :0", array($rs['pmc_casekey']));
				if ($cd) $casedesc = $cd;
				$html .= 
					"<li>
					".(($rs['pmc_closed'] == 'Y') ? "<i title='Closed Case' class='fa fa-file-o fa-fw fa-lg'></i>" : "<i title='Active Case' class='fa fa-file-text-o fa-fw fa-lg'></i>")."
						#{$rs['pmc_id']} : <i>{$casedesc}</i>
					</li>";

			}

			$html .= "</ul>";

			$html .= "<div id='taskTopBarActionDiv' class='pull-right'>";
			if (!empty($rs['pmc_id'])) {
				if (!empty($rs['pmf_id'])) $html .= $this->showTaskUrgency($rs['pmf_id']);
				$html .= "<div class='btn-group btn-group-sm'>";
				$html .= $this->showCaseIntermediateEvent($rs['pmc_id']);
				$html .= $this->showCommentButton($rs['pmc_id'], (!empty($rs['pmf_id'])) ? $rs['pmf_id'] : false);
				$html .= $this->showFlagButton($rs['pmc_id']);
				$html .= "</div>";


			}
			$html .= "</div><div class='clearfix'></div></div>";
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
				pmev_type = 'INTERMEDIATE' and  ".PM_Case::genFlowPermWhere()."
				order by pmev_name", array($pmcid), PDO::FETCH_ASSOC);

		if ($evRS) { // has active intermediate event
			$html = "<form id='eventForm' method='post'><input id='eventInp' type='hidden' name='event_action_manual' /></form>
					<div class='btn-group action-event'>
						<button type='button' class='btn dropdown-toggle' data-toggle='dropdown'>Action 
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

		if (!empty($GLOBAL['PMTask_taskid'])) unset($GLOBAL['PMTask_taskid']);
		if (!empty($GLOBAL['PMTask_tasktype'])) unset($GLOBAL['PMTask_tasktype']);

		$smarty = $this->initSmarty();
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

	function notifyNextUsers($data) {
		global $DB,$PUSHSOCKET;
		$userlist = array();
		$assign = $DB->getArray("select * from fcpmcaseflowassign where pmfa_pmfid = :0", array($data['pmf_id']), PDO::FETCH_ASSOC);
		foreach ($assign as $a) {
			$where = array();
			$where[] = ($a['pmfa_userid']) ? 'uor_usrid = '.$DB->quote($a['pmfa_userid']) : '1=1';
			$where[] = ($a['pmfa_orgid']) ? 'uor_orgid = '.$DB->quote($a['pmfa_orgid']) : '1=1';
			$where[] = ($a['pmfa_rolid']) ? 'uor_rolid = '.$DB->quote($a['pmfa_rolid']) : '1=1';
			$userlist = array_merge($userlist, $DB->getCol("select uor_usrid from fcuserorgrole 
			where ".implode(' and ',$where)));
		}
		if ($PUSHSOCKET) {
			foreach ($userlist as $user) {
				if ($sessid = getuserSessID($user)) {
					$PUSHSOCKET->send(json_encode(array(
						'topic'=>$sessid, 
						'msg'=>"You've received a new task", 
						'cat'=>'TASK')));
				}
			}
		}
	}

	function renderActivityPerform() {
		ob_start();
		global $HTML, $GLOBAL, $DB;

		$smarty = $this->initSmarty();
		if (!empty($_REQUEST['fid'])) {
			$GLOBAL['PMTask_flowid'] = $_REQUEST['fid'];
		}
		if (empty($GLOBAL['PMTask_flowid'])) return;

		$caseid = false;
		$this->renderTopBar(null, null, $GLOBAL['PMTask_flowid'], $caseid);
		if ($caseid) {
			$case = new PM_Case($caseid);
			$flowarr_before = array_keys($case->activeFlow);
			$currid = $case->activeFlow[$GLOBAL['PMTask_flowid']]['pmf_obj_id'];
			$currtype = $case->activeFlow[$GLOBAL['PMTask_flowid']]['pmf_obj_type'];
			$performed = $case->performFlow($GLOBAL['PMTask_flowid'], true);
			if ($performed) {
				$flowarr_after = array_keys($case->activeFlow);
				$flowarr_diff = array_diff($flowarr_after, $flowarr_before);
				foreach ($flowarr_diff as $fid) {
					$this->notifyNextUsers($case->activeFlow[$fid]);
				}
				redirect($this->classurl."/caseFlowList?id={$currid}&type={$currtype}");
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

		$classurl = WEB_HREF.'/'.__CLASS__;

		$comm = $DB->getRow("select count(*) total_comment, sum(case when pmcr_id is null then 1 else 0 end) unread_comment from fcpmcasecomment 
		left join fcpmcasecommentread on pmcc_id = pmcr_pmccid and pmcr_read_by = :1 where pmcc_pmcid=:0", array($pmcid, $USER->userid));
		if ($comm['unread_comment'] > 0) $commtitle = "{$comm['unread_comment']} unread comment(s)";
		else if ($comm['total_comment'] > 0) $commtitle = "{$comm['total_comment']} comment(s)";
		else $commtitle = "Post Comment";
		$buttonid  = "commentButton_{$commentButtonCount}";

		$ret = "<button id='{$buttonid}' class='btn action action-comment"
			.(($comm['total_comment'] > 0) ? ' hascomment'.(($comm['unread_comment'] > 0) ? ' unread' : '') : '')
			."' title='{$commtitle}' data-caseid='{$pmcid}' data-flowid='{$pmfid}' data-commid=''>
				<span class='btn-label icon fa fa-comments'></span>
			</button>";

		if ($commentButtonCount == 1) { 
			$ret .=
			"<script type='text/javascript'>
			$(function () {
				$('.action-comment').click(function (e) {
					e.preventDefault();
					e.stopPropagation();
					var \$this = $(this),
						caseid = \$this.data('caseid'),
						flowid = \$this.data('flowid'),
						lastcommentid = \$this.data('commid');
					
					var \$modal = createEmptyModal('commentListModal');
					ajaxRenderHTML('{$classurl}/ajaxRenderCommentList?caseid='+caseid+'&flowid='+flowid, {}, \$modal.find('.modal-content'), 'html', function () {
						$(window.document).one('hidden.bs.modal', '#'+\$modal.attr('id') ,function () {
							\$modal.remove();
						}).one('shown.bs.modal', '#'+\$modal.attr('id'), function () {
							var \$firstUnread = $(this).find('.comment.unread').first();
									if (\$firstUnread.length > 0) {
										\$modal.animate({scrollTop: \$firstUnread.offset().top}, '400', 'swing', function() { 
											ajaxGetJSON('{$classurl}/ajaxReadComment', {
													'caseid' : caseid,
													'tillcommid' : $(this).find('.comment.unread').last().data('commid')
											}, function () {
												\$this.removeClass('unread');
											});
										});
									}
						})
						\$modal.modal('show');
					});
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

		$senderimage = getUserAvatarImage($row['pmcc_created_by']);
		$html = 
		"<div class='comment".(($row['read_status'] == 'unread') ? ' unread' : '')."' data-commid='{$row['pmcc_id']}' data-parentid='{$row['pmcc_parentid']}'>
			<img src='{$senderimage}' alt=\"{$row['pmcc_created_name']}\" title=\"{$row['pmcc_created_name']}\" class='comment-avatar'>
			<div class='comment-body'>
				<div class='comment-text'>
					<div class='comment-heading'>
						<a href='javascript:void(0)' title='{$row['pmcc_created_by']}' >
							{$row['pmcc_created_name']}".(($USER->userid == $row['pmcc_created_by']) ? " (Me)" : "").
						"	<span title='{$createdDate->format('d-M-Y g:i:s A')}'>".time_different_string($row['pmcc_created_date'])."</span>
						</a>
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
				<textarea rows='1' class='form-control expanding-input-target comment-reply-textarea' placeholder='Reply comment'></textarea>
				<div style='margin-top: 10px;'>
					<button class='btn btn-sm btn-primary pull-right comment-reply-button' data-parentid='{$row['pmcc_id']}'>Reply</button>
					<button class='btn btn-sm pull-right comment-reply-close'>Cancel</button>
				</div>
			</div>
		</div>";
		return $html;
	}

	function ajaxRenderCommentList() {
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
		$commenthtml= '';
		foreach ($treedata as $row) {
			$commenthtml .= $this->renderSingleComment($row);
		}

		$smarty = $this->initSmarty(false);
		$smarty->assign('caseid', $GLOBAL['PMTask_comment_caseid']);
		$smarty->assign('flowid', $GLOBAL['PMTask_comment_flowid']);
		$smarty->assign('lastcommid', $lastcommid);
		$smarty->assign('comments', $commenthtml);
		$smarty->assign('classurl', $this->classurl);

		$smarty->display('comment.html');
	}

	function ajaxCreateNewComment() {
		global $DB, $USER, $GLOBAL;
		$txt = !empty($_REQUEST['comment']) ?  $_REQUEST['comment'] : '';
		$parentid = !empty($_REQUEST['parentid']) ?  $_REQUEST['parentid'] : null;
		$caseid = !empty($_REQUEST['caseid']) ?  $_REQUEST['caseid'] : false;
		$flowid = !empty($_REQUEST['flowid']) ?  $_REQUEST['flowid'] : null;
		$lastcommid = !empty($_REQUEST['lastcommid']) ?  $_REQUEST['lastcommid'] : null;

		if ($txt && $caseid) {
			$caseobj = new PM_Case($caseid);
			$pmccid = ($parentid) ? $caseobj->replyComment($parentid, $txt, $flowid) : $caseobj->insertComment($txt, $flowid);
			if ($pmccid) $caseobj->readComment($pmccid);

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

	function ajaxReadComment() {
		global $DB, $USER;
		$caseid = !empty($_REQUEST['caseid']) ?  $_REQUEST['caseid'] : false;
		$tillcommid = !empty($_REQUEST['tillcommid']) ?  $_REQUEST['tillcommid'] : false;
		$now = new DateTime();
		if ($caseid && $tillcommid) {
			$caseobj = new PM_Case($caseid);
			$toreadid = $DB->getCol("select pmcc_id from fcpmcasecomment left join fcpmcasecommentread on pmcc_id = pmcr_pmccid and pmcr_read_by = :2
			where pmcc_pmcid=:0 and pmcc_id <= :1 and pmcr_id is null order by pmcc_id", array($caseid, $tillcommid, $USER->userid));
			foreach ($toreadid as $pmccid) {
				$caseobj->readComment($pmccid);
			}
			echo json_encode($toreadid);
		}
	}
	// case comment end



	// case flag start
	static $noFlagTitle = 'Flag This Case';
	static $flagList = array(
		'red' => array('title'=>'Red Flag', 'class'=>'btn-danger'),
		'blue' => array('title'=>'Blue Flag', 'class'=>'btn-primary'),
		'yellow' => array('title'=>'Yellow Flag', 'class'=>'btn-warning'),
		'green' => array('title'=>'Green Flag', 'class'=>'btn-success'),
		'lightblue' => array('title'=>'Light Blue Flag', 'class'=>'btn-info'),
	);

	static function showFlagButton($pmcid) {
		global $DB, $USER;
		static $flagButtonCount;
		if ($flagButtonCount) ++$flagButtonCount;
		else $flagButtonCount = 1;
		$noFlagTitle = self::$noFlagTitle;
		$flagList = self::$flagList;
		$classurl = WEB_HREF.'/'.__CLASS__;

		$rs = $DB->getRow("select * from fcpmcaseflag where pmcf_pmcid = :0 and pmcf_flag_by = :1", array($pmcid, $USER->userid), PDO::FETCH_ASSOC);
		if (empty($rs['pmcf_flag_type'])) $flagType = '';
		else $flagType = $rs['pmcf_flag_type'];
		$buttonID = "flagButton_{$flagButtonCount}";

		$ret = 
		"<button id='{$buttonID}' class='btn action action-flag".
		((!empty($flagList[$flagType])) ? " {$flagList[$flagType]['class']}' title='{$flagList[$flagType]['title']}'" : "' title='{$noFlagTitle}'").
		" data-caseid='{$pmcid}' data-flag='{$flagType}' >
			<span class='btn-label icon fa fa-flag'></span>
		</button>";

		if ($flagButtonCount == 1) {
			$ret .= 
			"<script type='text/javascript'>
				$(function () {
					var flagList = ".json_encode($flagList).";
					var noFlagText = \"".$noFlagTitle."\";
					$('.action-flag').click(function (e) {
						e.preventDefault();
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
						ajaxGetJSON('{$classurl}/ajaxFlagCase', {
								'caseid' : caseid,
								'flagtype' : nextFlagType
						}, function (ret) {
							if (flagtype) \$this.data('flag','').removeClass(flagList[flagtype].class).attr('title', noFlagText);
							if (ret) \$this.data('flag',ret).addClass(flagList[ret].class).attr('title', flagList[ret].title);
						});
					})
				})
			</script>";
		}

		return $ret;
	}

	function ajaxFlagCase() {
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
}
?>