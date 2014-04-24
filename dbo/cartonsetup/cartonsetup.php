<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'cartonsetup.conf.php');

# customization
function dbo_cartonsetup_customize(&$dbo){	
	autoDetailTableInput($dbo);
	$dbo->newModifier = 'dbo_cartonsetup_custom_new';
}


function dbo_cartonsetup_custom_new($table, $cols){
	// include document class
	require_once(CORE_DIR.DS.'inc'.DS.'Document.inc.php');		

	global $DB, $DETAIL_SETUP;
	$ret = array();
	foreach ($cols as $k=>$v) {
		if (substr($k,0,6) == '__map_') unset($cols[$k]);
	}

	$filelocation = DOC_DIR.DS.'image'.DS.'boxtype'.DS;
	
	if(isset($cols['file']) && $cols['file']["name"]!= ''){
		$image = $cols['file'];
		unset($cols['file']);
	}


	$ok = $DB->doInsert($table, $cols);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	else {
		$newid = $DB->lastInsertId();
		if (!$newid) {
			$seq = $DB->getOne("select pg_get_serial_sequence(:0, :1)", array($table, $DETAIL_SETUP['keycol']));
			$newid = $DB->lastInsertId($seq);
		}
		
		if (!$newid) $ret[] = 'Error retrieving last ID';
		else {
			$newfilename = $newid;	
			// move file
			$doc = new Document();
			$status = $doc->moveSingleImage($filelocation, $newfilename,$image,$newid,'car_id');
	
			if (!empty($_POST['detail'])) {
			
				foreach($_POST['detail'] as $keycol=>$d) {
					$currset = false;
					foreach ($DETAIL_SETUP as $k=>$set) {
						if (!empty($set['fkcol']) && $set['fkcol'] == $keycol) $currset = $set;
					}
					if (empty($d['data']) && $currset['mustfill']) {
						$ret[] = "Please fill up ".strip_tags($currset['fkcolcaption']);
					}
					else {
						$detcols = array($keycol => $newid);
						$ok = $DB->execute("delete from {$d['table']} where {$keycol} = :0", array($newid));
						if(!$ok) $ret[] = $DB->lastError;
						else {
							if (!empty($d['data'])) {
								foreach ($d['data'] as $i=>$currcols) {
									$detcols = array_merge($detcols, $currcols);
									foreach ($detcols as &$val) {
										if (is_array($val)) $val = implode(", ", $val);
									}
									foreach ($currset['mustfillCols'] as $mcol) {
										if (empty($detcols[$mcol])) $ret[] = "Please fill up ".strip_tags($currset['caption'][$mcol]);
									}
									if (!$ret) {
										$ok = $DB->doInsert($d['table'], $detcols);
										if(!$ok) $ret[] = $DB->lastError;
									}
								}
							}
						}
					}
				}
			}
		}
	}
	return $ret;

}

function cartonSetupCustomNew($table, $cols) {
	global $DB, $DETAIL_SETUP;
	$ret = array();
	foreach ($cols as $k=>$v) {
		if (substr($k,0,6) == '__map_') unset($cols[$k]);
	}
	$ok = $DB->doInsert($table, $cols);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	else {
		$newid = $DB->lastInsertId();
		if (!$newid) {
			$seq = $DB->getOne("select pg_get_serial_sequence(:0, :1)", array($table, $DETAIL_SETUP['keycol']));
			$newid = $DB->lastInsertId($seq);
		}
		
		if (!$newid) $ret[] = 'Error retrieving last ID';
		else {
			if (!empty($_POST['detail'])) {
			
				foreach($_POST['detail'] as $keycol=>$d) {
					$currset = false;
					foreach ($DETAIL_SETUP as $k=>$set) {
						if (!empty($set['fkcol']) && $set['fkcol'] == $keycol) $currset = $set;
					}
					if (empty($d['data']) && $currset['mustfill']) {
						$ret[] = "Please fill up ".strip_tags($currset['fkcolcaption']);
					}
					else {
						$detcols = array($keycol => $newid);
						$ok = $DB->execute("delete from {$d['table']} where {$keycol} = :0", array($newid));
						if(!$ok) $ret[] = $DB->lastError;
						else {
							if (!empty($d['data'])) {
								foreach ($d['data'] as $i=>$currcols) {
									$detcols = array_merge($detcols, $currcols);
									foreach ($detcols as &$val) {
										if (is_array($val)) $val = implode(", ", $val);
									}
									foreach ($currset['mustfillCols'] as $mcol) {
										if (empty($detcols[$mcol])) $ret[] = "Please fill up ".strip_tags($currset['caption'][$mcol]);
									}
									if (!$ret) {
										$ok = $DB->doInsert($d['table'], $detcols);
										if(!$ok) $ret[] = $DB->lastError;
									}
								}
							}
						}
					}
				}
			}
		}
	}

	return $ret;
}

# final rendering
$dbo->render();
?>