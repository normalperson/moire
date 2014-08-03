<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dboID = 'rpt_dailycallsummary';
$dbo = DBO_init($dboID);
$dbo->id = $dboID;
$dbo->fileSaveMode = 511;
$dbo->table = 'mjobsheet';
$dbo->key = array();
$dbo->sql = 'select totaljob.completiondate, 
totaljob.astotaljob, totalprice.astotalprice, totalinch.astotalinch,
totaljob.eutotaljob, totalprice.eutotalprice, totalinch.eutotalinch,
totaljob.lctotaljob, totalprice.lctotalprice, totalinch.lctotalinch,
totalinmyr.astotalpriceinmyr+totalinmyr.eutotalpriceinmyr+totalinmyr.lctotalpriceinmyr as totalpriceinmyr,
totalinusd.astotalpriceinusd+totalinusd.eutotalpriceinusd+totalinusd.lctotalpriceinusd as totalpriceinusd
from crosstab (\'
select trimdatetime(js_completiondate),rg_code,count(*) as totaljob
from mjobsheet 
join fcorg on js_orgid = org_id
join mregion on org_region = rg_code
where js_status = \'\'COMPLETED\'\'
and rg_code = any (\'\'{ASIA, LOCAL, EURO}\'\')
and org_external = \'\'Y\'\'
group by rg_code,trimdatetime(js_completiondate)
order by 1,2,3\')
as totaljob(completiondate date, astotaljob bigint,eutotaljob bigint, lctotaljob bigint)
full outer join 
crosstab (\'
select trimdatetime(js_completiondate),rg_code,sum(js_finalprice) as totalprice
from mjobsheet 
join fcorg on js_orgid = org_id
join mregion on org_region = rg_code
where js_status = \'\'COMPLETED\'\'
and rg_code = any (\'\'{ASIA, LOCAL, EURO}\'\')
and org_external = \'\'Y\'\'
group by rg_code,trimdatetime(js_completiondate)
order by 1,2\')
as totalprice(completiondate date, astotalprice numeric,eutotalprice numeric, lctotalprice numeric) on totaljob.completiondate = totalprice.completiondate
full outer join 
crosstab (\'
select trimdatetime(js_completiondate),rg_code,sum(js_totalinch) as inch
from mjobsheet 
join fcorg on js_orgid = org_id
join mregion on org_region = rg_code
where js_status = \'\'COMPLETED\'\'
and rg_code = any (\'\'{ASIA, LOCAL, EURO}\'\')
and org_external = \'\'Y\'\'
group by rg_code,trimdatetime(js_completiondate)
order by 1,2\')
as totalinch(completiondate date, astotalinch numeric,eutotalinch numeric, lctotalinch numeric) on totalprice.completiondate = totalinch.completiondate
full outer join 
crosstab (\'
select trimdatetime(js_completiondate),rg_code,sum( usdtomyr(js_finalprice,js_rate,js_currency) ) as amtinMYR
from mjobsheet 
join fcorg on js_orgid = org_id
join mregion on org_region = rg_code
where js_status = \'\'COMPLETED\'\'
and rg_code = any (\'\'{ASIA, LOCAL, EURO}\'\')
and org_external = \'\'Y\'\'
group by rg_code,trimdatetime(js_completiondate)
order by 1,2\')
as totalinmyr(completiondate date, astotalpriceinmyr numeric,eutotalpriceinmyr numeric, lctotalpriceinmyr numeric) on totalinch.completiondate = totalinmyr.completiondate
full outer join 
crosstab (\'
select trimdatetime(js_completiondate),rg_code,sum( myrtousd(js_finalprice,js_rate,js_currency) ) as amtinUSD
from mjobsheet 
join fcorg on js_orgid = org_id
join mregion on org_region = rg_code
where js_status = \'\'COMPLETED\'\'
and rg_code = any (\'\'{ASIA, LOCAL, EURO}\'\')
and org_external = \'\'Y\'\'
group by rg_code,trimdatetime(js_completiondate)
order by 1,2\')
as totalinusd(completiondate date, astotalpriceinusd numeric,eutotalpriceinusd numeric, lctotalpriceinusd numeric) on totalinmyr.completiondate = totalinusd.completiondate';
$dbo->col = array('completiondate', 'astotaljob', 'astotalprice', 'astotalinch', 'eutotaljob', 'eutotalprice', 'eutotalinch', 'lctotaljob', 'lctotalprice', 'lctotalinch', 'totalpriceinmyr', 'totalpriceinusd');
$dbo->colList = array('completiondate', 'astotaljob', 'astotalprice', 'astotalinch', 'eutotaljob', 'eutotalprice', 'eutotalinch', 'lctotaljob', 'lctotalprice', 'lctotalinch', 'totalpriceinmyr', 'totalpriceinusd');
$dbo->colListEdit = array();
$dbo->colListNew = array();
$dbo->colListGlobalInput = array();
$dbo->colDetail = array('completiondate', 'astotaljob', 'astotalprice', 'astotalinch', 'eutotaljob', 'eutotalprice', 'eutotalinch', 'lctotaljob', 'lctotalprice', 'lctotalinch');
$dbo->colNew = array('completiondate', 'astotaljob', 'astotalprice', 'astotalinch', 'eutotaljob', 'eutotalprice', 'eutotalinch', 'lctotaljob', 'lctotalprice', 'lctotalinch');
$dbo->colEdit = array('completiondate', 'astotaljob', 'astotalprice', 'astotalinch', 'eutotaljob', 'eutotalprice', 'eutotalinch', 'lctotaljob', 'lctotalprice', 'lctotalinch');
$dbo->colSearch = array('completiondate');
$dbo->colExport = array('completiondate', 'astotaljob', 'astotalprice', 'astotalinch', 'eutotaljob', 'eutotalprice', 'eutotalinch', 'lctotaljob', 'lctotalprice', 'lctotalinch');
$dbo->colSort = array();
$dbo->colSum = array('astotaljob', 'astotalprice', 'astotalinch', 'eutotaljob', 'eutotalprice', 'eutotalinch', 'lctotaljob', 'lctotalprice', 'lctotalinch', 'totalpriceinmyr', 'totalpriceinusd');
$dbo->colSumPage = array('astotaljob', 'astotalprice', 'astotalinch', 'eutotaljob', 'eutotalprice', 'eutotalinch', 'lctotaljob', 'lctotalprice', 'lctotalinch', 'totalpriceinmyr', 'totalpriceinusd');
$dbo->colAvg = array();
$dbo->colAvgPage = array();
$dbo->canSearch = true;
$dbo->canNew = false;
$dbo->canEdit = false;
$dbo->canDelete = false;
$dbo->canDetail = false;
$dbo->canListEdit = false;
$dbo->canListNew = false;
$dbo->canNewGroup = array();
$dbo->canEditGroup = array();
$dbo->canDeleteGroup = array();
$dbo->showSearch = true;
$dbo->titleList = 'List Record';
$dbo->titleDetail = 'Detail';
$dbo->titleNew = 'New Record';
$dbo->titleEdit = 'Edit Record';
$dbo->titleSearch = 'Search Record';
$dbo->theme = 'pixeladmin';
$dbo->layout = 'One';
$dbo->pageLinkCount = 5;
$dbo->recordPerPage = 50;
$dbo->showRecordNo = 1;
$dbo->defaultState = 'search';
$dbo->maxSortCount = 9;
$dbo->defaultDateFormat = 'yyyy-mm-dd';
$dbo->defaultDateTimeFormat = 'yyyy-mm-dd hh24:min:ss';
$dbo->defaultTimeFormat = 'hh24:min:ss';
$dbo->lang = 'EN-US';
$dbo->render = array();
$dbo->searchCancel = 'Reset';
$dbo->searchSubmit = 'Search';
$dbo->detailBack = 'Back';
$dbo->editCancel = 'Cancel';
$dbo->editSubmit = 'Edit';
$dbo->listEditSubmit = 'Submit';
$dbo->newCancel = 'Cancel';
$dbo->newSubmit = 'Submit';

$dbo->cols['completiondate'] = new DBO_COL('completiondate', 'date', '4', '-1');
$dbo->cols['completiondate']->inputTypeDefault = 'rangedate';
$dbo->cols['completiondate']->mandatorySearch = 1;
$dbo->cols['completiondate']->searchMode = 'exact';
$dbo->cols['completiondate']->capContClassDefault = array();
$dbo->cols['completiondate']->valContClassDefault = array();
$dbo->cols['completiondate']->option->defaultMethod = 'text';
$dbo->cols['completiondate']->option->searchMethod = 'text';
$dbo->cols['completiondate']->option->listMethod = 'text';
$dbo->cols['completiondate']->option->detailMethod = 'text';
$dbo->cols['completiondate']->option->newMethod = 'text';
$dbo->cols['completiondate']->option->editMethod = 'text';
$dbo->cols['astotaljob'] = new DBO_COL('astotaljob', 'int8', '8', '-1');
$dbo->cols['astotaljob']->displayDataType = 'int';
$dbo->cols['astotaljob']->displayListModifierMethod = 'phpfunc';
$dbo->cols['astotaljob']->displayListModifier = 'totalJobLink';
$dbo->cols['astotaljob']->inputTypeDefault = 'text';
$dbo->cols['astotaljob']->searchMode = 'exact';
$dbo->cols['astotaljob']->capContClassDefault = array();
$dbo->cols['astotaljob']->valContClassDefault = array();
$dbo->cols['astotaljob']->option->defaultMethod = 'text';
$dbo->cols['astotaljob']->option->searchMethod = 'text';
$dbo->cols['astotaljob']->option->listMethod = 'text';
$dbo->cols['astotaljob']->option->detailMethod = 'text';
$dbo->cols['astotaljob']->option->newMethod = 'text';
$dbo->cols['astotaljob']->option->editMethod = 'text';
$dbo->cols['astotalprice'] = new DBO_COL('astotalprice', 'numeric', '-1', '-1');
$dbo->cols['astotalprice']->displayDataType = 'currency';
$dbo->cols['astotalprice']->inputTypeDefault = 'text';
$dbo->cols['astotalprice']->searchMode = 'exact';
$dbo->cols['astotalprice']->capContClassDefault = array();
$dbo->cols['astotalprice']->valContClassDefault = array();
$dbo->cols['astotalprice']->option->defaultMethod = 'text';
$dbo->cols['astotalprice']->option->searchMethod = 'text';
$dbo->cols['astotalprice']->option->listMethod = 'text';
$dbo->cols['astotalprice']->option->detailMethod = 'text';
$dbo->cols['astotalprice']->option->newMethod = 'text';
$dbo->cols['astotalprice']->option->editMethod = 'text';
$dbo->cols['astotalinch'] = new DBO_COL('astotalinch', 'numeric', '-1', '-1');
$dbo->cols['astotalinch']->displayDataType = 'currency';
$dbo->cols['astotalinch']->inputTypeDefault = 'text';
$dbo->cols['astotalinch']->searchMode = 'exact';
$dbo->cols['astotalinch']->capContClassDefault = array();
$dbo->cols['astotalinch']->valContClassDefault = array();
$dbo->cols['astotalinch']->option->defaultMethod = 'text';
$dbo->cols['astotalinch']->option->searchMethod = 'text';
$dbo->cols['astotalinch']->option->listMethod = 'text';
$dbo->cols['astotalinch']->option->detailMethod = 'text';
$dbo->cols['astotalinch']->option->newMethod = 'text';
$dbo->cols['astotalinch']->option->editMethod = 'text';
$dbo->cols['eutotaljob'] = new DBO_COL('eutotaljob', 'int8', '8', '-1');
$dbo->cols['eutotaljob']->displayDataType = 'int';
$dbo->cols['eutotaljob']->displayListModifierMethod = 'phpfunc';
$dbo->cols['eutotaljob']->displayListModifier = 'totalJobLink';
$dbo->cols['eutotaljob']->inputTypeDefault = 'text';
$dbo->cols['eutotaljob']->searchMode = 'exact';
$dbo->cols['eutotaljob']->capContClassDefault = array();
$dbo->cols['eutotaljob']->valContClassDefault = array();
$dbo->cols['eutotaljob']->option->defaultMethod = 'text';
$dbo->cols['eutotaljob']->option->searchMethod = 'text';
$dbo->cols['eutotaljob']->option->listMethod = 'text';
$dbo->cols['eutotaljob']->option->detailMethod = 'text';
$dbo->cols['eutotaljob']->option->newMethod = 'text';
$dbo->cols['eutotaljob']->option->editMethod = 'text';
$dbo->cols['eutotalprice'] = new DBO_COL('eutotalprice', 'numeric', '-1', '-1');
$dbo->cols['eutotalprice']->displayDataType = 'currency';
$dbo->cols['eutotalprice']->inputTypeDefault = 'text';
$dbo->cols['eutotalprice']->searchMode = 'exact';
$dbo->cols['eutotalprice']->capContClassDefault = array();
$dbo->cols['eutotalprice']->valContClassDefault = array();
$dbo->cols['eutotalprice']->option->defaultMethod = 'text';
$dbo->cols['eutotalprice']->option->searchMethod = 'text';
$dbo->cols['eutotalprice']->option->listMethod = 'text';
$dbo->cols['eutotalprice']->option->detailMethod = 'text';
$dbo->cols['eutotalprice']->option->newMethod = 'text';
$dbo->cols['eutotalprice']->option->editMethod = 'text';
$dbo->cols['eutotalinch'] = new DBO_COL('eutotalinch', 'numeric', '-1', '-1');
$dbo->cols['eutotalinch']->displayDataType = 'currency';
$dbo->cols['eutotalinch']->inputTypeDefault = 'text';
$dbo->cols['eutotalinch']->searchMode = 'exact';
$dbo->cols['eutotalinch']->capContClassDefault = array();
$dbo->cols['eutotalinch']->valContClassDefault = array();
$dbo->cols['eutotalinch']->option->defaultMethod = 'text';
$dbo->cols['eutotalinch']->option->searchMethod = 'text';
$dbo->cols['eutotalinch']->option->listMethod = 'text';
$dbo->cols['eutotalinch']->option->detailMethod = 'text';
$dbo->cols['eutotalinch']->option->newMethod = 'text';
$dbo->cols['eutotalinch']->option->editMethod = 'text';
$dbo->cols['lctotaljob'] = new DBO_COL('lctotaljob', 'int8', '8', '-1');
$dbo->cols['lctotaljob']->displayDataType = 'int';
$dbo->cols['lctotaljob']->displayListModifierMethod = 'phpfunc';
$dbo->cols['lctotaljob']->displayListModifier = 'totalJobLink';
$dbo->cols['lctotaljob']->inputTypeDefault = 'text';
$dbo->cols['lctotaljob']->searchMode = 'exact';
$dbo->cols['lctotaljob']->capContClassDefault = array();
$dbo->cols['lctotaljob']->valContClassDefault = array();
$dbo->cols['lctotaljob']->option->defaultMethod = 'text';
$dbo->cols['lctotaljob']->option->searchMethod = 'text';
$dbo->cols['lctotaljob']->option->listMethod = 'text';
$dbo->cols['lctotaljob']->option->detailMethod = 'text';
$dbo->cols['lctotaljob']->option->newMethod = 'text';
$dbo->cols['lctotaljob']->option->editMethod = 'text';
$dbo->cols['lctotalprice'] = new DBO_COL('lctotalprice', 'numeric', '-1', '-1');
$dbo->cols['lctotalprice']->displayDataType = 'currency';
$dbo->cols['lctotalprice']->inputTypeDefault = 'text';
$dbo->cols['lctotalprice']->searchMode = 'exact';
$dbo->cols['lctotalprice']->capContClassDefault = array();
$dbo->cols['lctotalprice']->valContClassDefault = array();
$dbo->cols['lctotalprice']->option->defaultMethod = 'text';
$dbo->cols['lctotalprice']->option->searchMethod = 'text';
$dbo->cols['lctotalprice']->option->listMethod = 'text';
$dbo->cols['lctotalprice']->option->detailMethod = 'text';
$dbo->cols['lctotalprice']->option->newMethod = 'text';
$dbo->cols['lctotalprice']->option->editMethod = 'text';
$dbo->cols['lctotalinch'] = new DBO_COL('lctotalinch', 'numeric', '-1', '-1');
$dbo->cols['lctotalinch']->displayDataType = 'currency';
$dbo->cols['lctotalinch']->inputTypeDefault = 'text';
$dbo->cols['lctotalinch']->searchMode = 'exact';
$dbo->cols['lctotalinch']->capContClassDefault = array();
$dbo->cols['lctotalinch']->valContClassDefault = array();
$dbo->cols['lctotalinch']->option->defaultMethod = 'text';
$dbo->cols['lctotalinch']->option->searchMethod = 'text';
$dbo->cols['lctotalinch']->option->listMethod = 'text';
$dbo->cols['lctotalinch']->option->detailMethod = 'text';
$dbo->cols['lctotalinch']->option->newMethod = 'text';
$dbo->cols['lctotalinch']->option->editMethod = 'text';
$dbo->cols['totalpriceinmyr'] = new DBO_COL('totalpriceinmyr', 'numeric', '-1', '-1');
$dbo->cols['totalpriceinmyr']->displayDataType = 'currency';
$dbo->cols['totalpriceinmyr']->inputTypeDefault = 'text';
$dbo->cols['totalpriceinmyr']->searchMode = 'exact';
$dbo->cols['totalpriceinmyr']->capContClassDefault = array();
$dbo->cols['totalpriceinmyr']->valContClassDefault = array();
$dbo->cols['totalpriceinmyr']->option->defaultMethod = 'text';
$dbo->cols['totalpriceinmyr']->option->searchMethod = 'text';
$dbo->cols['totalpriceinmyr']->option->listMethod = 'text';
$dbo->cols['totalpriceinmyr']->option->detailMethod = 'text';
$dbo->cols['totalpriceinmyr']->option->newMethod = 'text';
$dbo->cols['totalpriceinmyr']->option->editMethod = 'text';
$dbo->cols['totalpriceinusd'] = new DBO_COL('totalpriceinusd', 'numeric', '-1', '-1');
$dbo->cols['totalpriceinusd']->displayDataType = 'currency';
$dbo->cols['totalpriceinusd']->inputTypeDefault = 'text';
$dbo->cols['totalpriceinusd']->searchMode = 'exact';
$dbo->cols['totalpriceinusd']->capContClassDefault = array();
$dbo->cols['totalpriceinusd']->valContClassDefault = array();
$dbo->cols['totalpriceinusd']->option->defaultMethod = 'text';
$dbo->cols['totalpriceinusd']->option->searchMethod = 'text';
$dbo->cols['totalpriceinusd']->option->listMethod = 'text';
$dbo->cols['totalpriceinusd']->option->detailMethod = 'text';
$dbo->cols['totalpriceinusd']->option->newMethod = 'text';
$dbo->cols['totalpriceinusd']->option->editMethod = 'text';

// support multiple language. only caption
global $LANG;
if(file_exists(dirname(__FILE__).DIRECTORY_SEPARATOR.$dbo->id.'.conf.lang.'.$LANG.'.php')){
	require(dirname(__FILE__).DIRECTORY_SEPARATOR.$dbo->id.'.conf.lang.'.$LANG.'.php');
}else if($availang = glob(dirname(__FILE__).DIRECTORY_SEPARATOR.$dboID.'.conf.lang.*')){
	require($availang[0]);
}

// for DBO Builder
$dbo->saveDir = dirname(dirname(__FILE__));

$dbo->run();

/*
$dbo->newModifier = 'dbo_rpt_dailycallsummary_custom_new';
function dbo_rpt_dailycallsummary_custom_new($table, $cols){
	global $DB;
	$ret = array();
	$ok = $DB->doInsert($table, $cols);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->editModifier = 'dbo_rpt_dailycallsummary_custom_edit';
function dbo_rpt_dailycallsummary_custom_edit($table, $cols, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doUpdate($table, $cols, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->searchModifier = 'dbo_rpt_dailycallsummary_custom_search';
function dbo_rpt_dailycallsummary_custom_search(&$search){
}

$dbo->deleteModifier = 'dbo_rpt_dailycallsummary_custom_delete';
function dbo_rpt_dailycallsummary_custom_delete($table, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doDelete($table, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

function dbo_rpt_dailycallsummary_display_modifier($col, $colVal, $data=array(), $html=null){
}
*/
?>