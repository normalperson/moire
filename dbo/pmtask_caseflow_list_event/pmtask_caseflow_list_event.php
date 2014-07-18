<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'pmtask_caseflow_list_event.conf.php');

# customization
function dbo_pmtask_caseflow_list_event_customize(&$dbo){
	global $GLOBAL, $DB, $USER;
	if (empty($GLOBAL['PMTask_taskid'])) die('missing event id');
	$dbo->sql = "select a.*,b.*,'' as urgency, '' as actions,c.js_assignto,c.js_orgid, case when pmf_due_date is not null and pmf_due_date <= now() then 'Y' else 'N' end as isdue,
	".PM_Case::genCaseDescriptionSQL()." as casedesc from fcpmcase a 
	join mjobsheet c on pmc_casekey = js_id
	join fcpmcaseflow b on pmf_pmcid=pmc_id 
	where pmf_obj_id = {$GLOBAL['PMTask_taskid']} and pmf_obj_type = 'PM_Event' and pmf_end_date is null
	and ".PM_Case::genFlowPermWhere()."
	order by pmf_due_date, pmf_start_date";
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

	$keys = array(
		'pmf_id' => $rs['pmf_id'],
		'pmf_pmcid' => $rs['pmf_pmcid'],
	);
	
	$ret = "<input class='hidden-flowid' type='hidden' value=\"".http_build_query($keys)."\" />";
	$ret .= "<div class='btn-group btn-group-sm'>";
	$ret .= PMTask::showCommentButton($rs['pmc_id'], $rs['pmf_id']);
	$ret .= PMTask::showFlagButton($rs['pmc_id']);
	$ret .= PMTask::showTimelineButton($rs['pmc_id']);
	$ret .= "</div>";
		
	return $ret;
}

# final rendering
$dbo->render();
global $GLOBAL, $DB;
$eventName = $DB->getOne("select pmev_name from fcpmevent where pmev_id = :0", array($GLOBAL['PMTask_taskid']));
?>
<script type='text/javascript'>
$(function () {
	var evname = "<?php echo $eventName; ?>";
	var $eventActionbutton = $("<input type='submit' class='btn btn-primary' value=\""+evname+"\" name='event_action' />");
	$('#dbo_pmtask_caseflow_list_event_listtable thead .tool').append($eventActionbutton);
	var $checkboxtmpl = $('<label class="px-single" style="margin: 2px 3px 0 0"><input type="checkbox" name="pmtask_event_list_cb[]" value="" class="px"><span class="lbl"></span></label>');
	$('td.recordnum , th.recordnum').each(function () {
		var $this = $(this);
		var $cloneCB = $checkboxtmpl.clone();
		var keyval = $this.closest('tr').find('.hidden-flowid').val();
		if (keyval) $cloneCB.find('input[type="checkbox"]').val(keyval);
		$this.prepend($cloneCB);
		if ($this.closest('thead').length > 0) { // global checkbox
			$cloneCB.find('input[type="checkbox"]').removeAttr('name')
			$cloneCB.change(function () {
				if ($(this).find('input[type="checkbox"]').is(':checked')) $('td.recordnum input[type="checkbox"]').prop('checked',true).change();
				else $('td.recordnum input[type="checkbox"]').prop('checked',false).change();
			})
		}
	})
	var $listCheckBoxes = $('input[name^="pmtask_event_list_cb"]');
	$listCheckBoxes.change(function () {
		if ($listCheckBoxes.not('thead input[name^="pmtask_event_list_cb"]').filter(':checked').length > 0) $eventActionbutton.attr('disabled', false).removeClass('disabled');
		else $eventActionbutton.attr('disabled', true).addClass('disabled');
	}).change();
	
})
</script>