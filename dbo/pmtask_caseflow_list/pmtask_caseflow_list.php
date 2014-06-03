<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'pmtask_caseflow_list.conf.php');

# customization
function dbo_pmtask_caseflow_list_customize(&$dbo){
<<<<<<< HEAD
	global $GLOBAL, $DB,$USER;
	if (empty($GLOBAL['PMTask_atid'])) die('missing activity id');
 $dbo->sql = "select a.*,b.*,'' as urgency, '' as actions from fcpmcase a join fcpmcaseflow b on pmf_pmcid=pmc_id 
 where pmf_obj_id = {$GLOBAL['PMTask_atid']} and pmf_obj_type = 'PM_Activity' 
 and (pmf_specific_userid is null or (pmf_specific_userid is not null and pmf_specific_userid = ".$DB->quote($USER->userid).")) order by pmf_due_date, pmf_id";
	
=======
	global $GLOBAL, $DB, $USER;
	if (empty($GLOBAL['PMTask_taskid'])) die('missing activity id');
	$dbo->sql = "select a.*,b.*,'' as urgency, '' as actions from fcpmcase a join fcpmcaseflow b on pmf_pmcid=pmc_id 
	where pmf_obj_id = {$GLOBAL['PMTask_taskid']} and pmf_obj_type = 'PM_Activity' and pmf_end_date is null
	and (pmf_specific_userid is null or (pmf_specific_userid is not null and pmf_specific_userid = ".$DB->quote($USER->userid).")) order by pmf_due_date, pmf_id";
>>>>>>> 70c37bd2f6e0b2331be04ffd5f0f25086b62272e
}

function showurgency($colname, $currval, $rs, $html) {

	return PMTask::showTaskUrgency($rs['pmf_id'], $rs['pmf_start_date'], $rs['pmf_due_date']);
	
}

function showcaselink($colname, $currval, $rs, $html) {
	return "<a href='renderCaseScreen?caseid={$currval}'>#".$currval."</a>";
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
	global $DB, $USER;

	$ret = "<input class='hidden-flowid' type='hidden' value='{$rs['pmf_id']}' />";
	$ret .= PMTask::showCommentButton($rs['pmc_id'], $rs['pmf_id']);
	$ret .= PMTask::showFlagButton($rs['pmc_id']);
		
	return $ret;
}

# final rendering
$dbo->render();
?>
<script type='text/javascript'>
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

</script>