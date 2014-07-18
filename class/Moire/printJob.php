<?php
require_once(dirname(__FILE__).'/../../init.inc.php');
global $DB, $GLOBAL, $USER, $LOCALE;
// html_header();
if(!isset($_GET['jobid'])) die("Invalid job");
// $DB->showsql=1;
$smarty = new Smarty();
$smarty->caching = false;
// die(DOC_DIR.DS.'smarty'.DS.'templates');
$smarty->setTemplateDir(DOC_DIR.DS.'smarty'.DS.'templates');
$smarty->setCompileDir(DOC_DIR.DS.'smarty'.DS.'templates_c');
$smarty->setCacheDir(DOC_DIR.DS.'smarty'.DS.'cache');
$smarty->setConfigDir(DOC_DIR.DS.'smarty'.DS.'configs');
$smarty->assign('APP', APP);
$jsid = $_GET['jobid'];
list($currentOrgId, $currentOrgExternal) = $DB->getRow("select org_id, org_external from fcuserorgrole join fcorg on uor_orgid = org_id where uor_id = :0 and uor_rolid = :1", array($USER->userorgroleid, $USER->roleid));
$sql = "select mjobsheet.*, pndcontact.*, fcorg.*, fcuser.*, pndphoneo.ph_number as oph_number, pndphonem.ph_number as mph_number, 
jcl_id as primary_category_id, jcl_title as primary_category_title, 
mcarton.*, 
fccountry.* 
from mjobsheet 
join fcorg on org_id = js_orgid
left join pndcontact on js_ctid = ct_id 
left join mjobcatlookup on js_primcat = jcl_id 
left join mcarton on js_carid = car_id 
join fcuser on js_request_by = usr_userid 
left join pndphone pndphoneo on pndphoneo.ph_refid = ct_id and pndphoneo.ph_reftype = 'CT_ID' and pndphoneo.ph_type = 'O' 
left join pndphone pndphonem on pndphonem.ph_refid = ct_id and pndphonem.ph_reftype = 'CT_ID' and pndphonem.ph_type = 'M' 
left join fccountry on org_concode = con_code 
where js_id = :0";
$bind = array($jsid);
if($currentOrgExternal=='Y'){
	$sql .= " and js_orgid = :1";
	$bind[] = $currentOrgId;
}
$rs = $DB->getRowAssoc($sql, $bind);

if(!$rs) die('Job not found!');
// category
$catRS = $DB->getArrayAssoc("select jcl_id, jcl_title from mjobcat join mjobcatlookup on jc_jclid = jcl_id where jc_jsid = :0", array($jsid));
$rs['category_array'] = $catRS?$catRS:array();
// output 
$outputRS = $DB->getArrayAssoc("select lu_code, lu_title from mjoboutput join fclookup on jo_outputcode = lu_code and lu_cat = 'OUTPUT' where jo_jsid = :0", array($jsid));
$rs['output_array'] = $outputRS?$outputRS:array();
// remark
$rs['customer_remark'] = $DB->getOne("select pmcc_comment from fcpmcase join fcpmcasecomment on pmc_id = pmcc_pmcid where pmc_casekey = :0 and pmc_casetype = 'jobsheet' order by pmcc_id asc limit 1 offset 0", array($jsid));

// barcode
$barcodeRS = $DB->getArrayAssoc("select jbc_btcode, bt_name, jbc_value from mjobbarcode join mbarcodetype on jbc_btcode = bt_code where jbc_jsid = :0", array($jsid));
$rs['barcode_array'] = $barcodeRS?$barcodeRS:array();

$companyname = $DB->GetOne("select org_name from fcorg where org_external = 'N' and org_parentid = 0",null, PDO::FETCH_ASSOC);
$rs['companyname'] = $companyname;

$companyadd = $DB->GetOne("select org_address from fcorg where org_external = 'N' and org_parentid = 0",null, PDO::FETCH_ASSOC);
$rs['companyaddress'] = $companyadd;

// carton
// carton - image
require_once(INCLUDE_DIR.'/Image.inc.php');
$img = new Image();
$imageinfo = $img->getImage('boxtype', $rs['js_carid']);
$rs['carton_img_src'] = str_replace('\\', '/', $imageinfo);

// carton - dimension
$cartonRS = $DB->getArrayAssoc("select carv_code, caval_value, carv_unit from mjscartonvalue join mcartonvariable on carval_carcode = carv_code and carval_carid = carv_carid where carval_jsid = :0", array($jsid));
$rs['carton_dimension_array'] = $cartonRS?$cartonRS:array();

// pr($cartonRS);
if($rs['js_requiretime']){
	// yow locale
	$dt = new DateTime($rs['js_request_date']);
	$adt = new DateInterval('PT'.($rs['js_requiretime']).'M');
	// $locale = new FCLocale();
	$LOCALE->dateTimeAdd($dt, $adt);
	$rs['preferredcompletiondatetime'] = $dt->format('Y-m-d H:i:s');
	#$rs['preferredcompletiondatetime'] = 'sample time';
	// no locale
	// $dt = new DateTime($rs['js_request_date']);
	// $dt->add(new DateInterval('PT'.$rs['js_requiretime'].'M'));
	// $rs['preferredcompletiondatetime'] = $dt->format('Y-m-d H:i:s');
}else{
	$rs['preferredcompletiondatetime'] = $rs['js_request_date'];
}

$smarty->assign('data', $rs);
$smarty->display('printJob.html');
?>