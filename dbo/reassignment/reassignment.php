<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'reassignment.conf.php');

# customization
function dbo_reassignment_customize(&$dbo){
	$dbo->editModifier = 'dbo_reassignment_custom_edit';
}


function dbo_reassignment_custom_edit($table, $cols, $wheres, $dbo){
	global $DB;
	$ret = array();
	$jsid = $wheres['js_id'];
	$assignto = $cols['js_assignto'];
	$ok = $DB->doUpdate($table, $cols, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}else{
		$sql = "select pmfa_id from fcpmcaseflow join fcpmcaseflowassign on pmf_id  = pmfa_pmfid join fcpmcase on pmc_id = pmf_pmcid
where pmf_obj_id in (select pmat_id from fcpmactivity where pmat_pmslid = 3) and pmf_obj_type = 'PM_Activity'
and pmf_end_date is null and pmc_casekey = :0 and pmc_casetype = 'jobsheet'";
        $pmfaid = $DB->GetOne($sql,array($jsid));

        $sql = "update fcpmcaseflowassign set pmfa_userid = :0 where pmfa_id = :1";
        $ok = $DB->Execute($sql,array($assignto,$pmfaid));

	}
	return $ret;
}

# final rendering
$dbo->render();
?>