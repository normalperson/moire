<?php
function getUserAvatarImage($userid) {

	$imgfile = IMAGE_HREF.'/default_avatar.png';
	if (file_exists(DOC_DIR.DS.'image'.DS.'avatar'.DS.$userid.'.png')) $imgfile = IMAGE_HREF.'/avatar/'.$userid.'.png';
	if (file_exists(DOC_DIR.DS.'image'.DS.'avatar'.DS.$userid.'.jpg')) $imgfile = IMAGE_HREF.'/avatar/'.$userid.'.jpg';
	return $imgfile;
	
}
function getHighestPriorityCat($catstring){
	if($catstring == '') return 'Cat string cannot be empty';

	global $DB;


	$sql = "select jcl_id from mjobcatlookup
			where jcl_id in ($catstring)
			order by jcl_sequence desc
			limit 1";

	return $DB->GetOne($sql,null, PDO::FETCH_ASSOC);

}

function userTopOrgID(){
	global $USER, $DB;
	$topID = $USER->orgid;
	$parentID = $DB->getOne("select org_parentid from ".$DB->prefix."org where org_id = :0", array($topID));
	while($parentID && $topID!=$parentID){
		$topID = $parentID;
		$parentID = $DB->getOne("select org_parentid from ".$DB->prefix."org where org_id = :0", array($parentID));
	}
	return $topID;
}
function orgTopOrgID($orgID){
	global $DB;
	$topID = $orgID;
	$parentID = $DB->getOne("select org_parentid from ".$DB->prefix."org where org_id = :0", array($topID));
	while($parentID && $topID!=$parentID){
		$topID = $parentID;
		$parentID = $DB->getOne("select org_parentid from ".$DB->prefix."org where org_id = :0", array($parentID));
	}
	return $topID;
}


?>