<?php
function allocatePoint($userid, $point, $reftype, $refid, $desc = null, $parentid = null){
	global $DB;
	$data = array(
		'pts_usrid'=>$userid,
		'pts_point'=>$point,
		'pts_created_date'=>$DB->getOne("select now()"),
		'pts_parentid'=>$parentid,
		'pts_reftype'=>$reftype,
		'pts_refid'=>$refid,
		'pts_desc'=>$desc,
	);
	
	$ok = $DB->doInsert('shpoint', $data);
	if (!$ok) return false;
	else return $DB->lastInsertId('shpoint_pts_id_seq');
}

function getPoint($userid, &$detail = array()){
	global $DB;
	$detail = $DB->getArray("select * from shpoint where pts_usrid = :0", array($userid), PDO::FETCH_ASSOC);
	return $DB->getOne("select COALESCE(sum(COALESCE(pts_point,0)),0) from shpoint where pts_usrid = :0 and pts_parentid is null", array($userid));
}

function getPointByRefID($userid, $reftype, $refid, &$detail = array()) {
	global $DB;
	$rs = $DB->getArray("select * from shpoint where pts_usrid = :0", array($userid), PDO::FETCH_ASSOC);
	$rs = arr2tree($rs, 'pts_id', 'pts_parentid');
	foreach ($rs as $i=>$row) {
		if ($row['pts_reftype'] == $reftype && $row['pts_refid'] == $refid) {
			$detail = $row;
			break;
		}
	}
	return $DB->getOne("select COALESCE(sum(COALESCE(pts_point,0)),0) from shpoint 
	where pts_usrid = :0 and pts_refid = :1 and pts_reftype=:2 and pts_parentid is null", array($userid, $refid, $reftype));
}
// check absent or present

// get point by series

// get point by activity

// calculate activity joined
function getJoinedActivities($userid) {
	global $DB;
	return $DB->GetOne("select count(*) from shreflection where rfl_usrid=:0 and rfl_status = 'Approve' and rfl_reftype in ('adhoc','event')", array($userid));
}



?>