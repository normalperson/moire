<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'pmtask_caseflow_list.conf.php');

# customization
function dbo_pmtask_caseflow_list_customize(&$dbo){
	global $GLOBAL, $DB,$USER;
	if (empty($GLOBAL['PMTask_atid'])) die('missing activity id');
 $dbo->sql = "select a.*,b.*,'' as urgency, '' as actions from fcpmcase a join fcpmcaseflow b on pmf_pmcid=pmc_id 
 where pmf_obj_id = {$GLOBAL['PMTask_atid']} and pmf_obj_type = 'PM_Activity' 
 and (pmf_specific_userid is null or (pmf_specific_userid is not null and pmf_specific_userid = ".$DB->quote($USER->userid).")) order by pmf_due_date, pmf_id";
	
}

function showurgency($colname, $currval, $rs, $html) {
	global $DB;
	$overdue = false;
	$title = "";
	$now = new DateTime();
	if ($rs['pmf_due_date']) {
		$duedate = new DateTime($rs['pmf_due_date']);
		if ($duedate < $now) $overdue = true;
		$str = time_different_string($duedate);
		$title = "Task due $str";
	}
	else {
		$str = time_different_string($rs['pmf_start_date']);
		$title = "Task started $str";
		
	}
	return "<div class='urgency ".(($overdue) ? 'overdue' : 'normal')."' data-toggle='tooltip' data-placement='top' title='{$title}'></div>";
}


function showcasedescription($colname, $currval, $rs, $html) {
	global $DB;
	static $casetype;
	if (!isset($casetype[$rs['pmc_casetype']])) {
		$casetype[$rs['pmc_casetype']] = $DB->getRow("select pmct_table, pmct_desc_col, pmct_key_col from fcpmcasetype where pmct_code=:0", array($rs['pmc_casetype']), PDO::FETCH_ASSOC);
	}
	if (!$casetype[$rs['pmc_casetype']]) return "{$rs['pmc_casetype']}::{$rs['pmc_casekey']}";
	else {
		$s = $casetype[$rs['pmc_casetype']];
		$casedesc = $DB->getOne("select {$s['pmct_desc_col']} from {$s['pmct_table']} where {$s['pmct_key_col']} = :0", array($rs['pmc_casekey']));
		if ($casedesc) return $casedesc;
		else return "{$rs['pmc_casetype']}::{$rs['pmc_casekey']}";
	}
}


function showactions($colname, $currval, $rs, $html) {
	global $DB;
	$isFlagged = false;
	$ret = 
		"<input class='hidden-flowid' type='hidden' value='{$rs['pmf_id']}' />
		<span class='fa fa-flag fa-border action action-flag' title='".($isFlagged ? 'Unflag' : 'Flag')." This Case' data-caseid='{$rs['pmc_id']}'></span>
		<span class='fa fa-comments fa-border action action-comment' title='Comments' data-caseid='{$rs['pmc_id']}'></span>";
		//<span class='fa fa-pencil-square-o fa-border action action-perform' title='Perform This Activity' data-flowid='{$rs['pmf_id']}'></span>";
		
	return $ret;
}

# final rendering
$dbo->render();
?>
<script type='text/javascript'>
	$('[data-toggle="tooltip"]').tooltip();
	$('#dbo_pmtask_caseflow_list_listtable > tbody > tr').css('cursor', 'pointer').click(function () {
		var $this = $(this),
			$flowInp = $this.find('input.hidden-flowid');
		if ($flowInp.length > 0) {
			window.top.toggleLoading(true, function () {
				var flowid = $flowInp.val();
				window.location.href = 'renderActivityPerform?fid='+flowid;
			})
		}
	})
	$('.action-flag').click(function (e) {
		e.stopPropagation();
		var $this = $(this);
		if ($this.hasClass('flagged')) $this.removeClass('flagged').attr('title','Flag This Case');
		else $this.addClass('flagged').attr('title','Unflag This Case');
	})
</script>