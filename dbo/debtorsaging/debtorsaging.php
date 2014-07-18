<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'debtorsaging.conf.php');

# customization
function dbo_debtorsaging_customize(&$dbo){
	global $USER, $DB;
	// vd($USER);
	$orgRS = $DB->getRowAssoc("select org_external from fcorg where org_id = :0", array($USER->orgid));
	if($orgRS['org_external']=='Y'){
		$dbo->whereSQL = 'iv_orgid = '.$USER->orgid;
		$dbo->cols['iv_orgid']->option->default = 'select org_id, org_name from fcorg where org_external = \'Y\' and org_id = '.$USER->orgid;
	}
}


# final rendering
$dbo->render();
?>