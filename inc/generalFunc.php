<?php
global $DATEFORMAT;
$DATEFORMAT['datetime'] = array(
	'php'=>'j-M-Y g:i A',
	'sql'=>'FMDD-Mon-YYYY FMHH:MI AM',
	'dbo'=>'d-mon-yyyy h12:min AP',
	'moment'=>'D-MMM-YYYY h:mm A',
);
$DATEFORMAT['date'] = array(
	'php'=>'j-M-Y',
	'sql'=>'FMDD-Mon-YYYY',
	'dbo'=>'d-mon-yyyy',
	'datepicker'=>'d-M-yyyy',
	'moment'=>'D-MMM-YYYY',
);
function globalFormatDate($d, $formattype = 'datetime') {
	global $DATEFORMAT;
	$d = ($d instanceof DateTime) ? $d : new DateTime($d);
	return $d->format($DATEFORMAT[$formattype]['php']);
}
  /**
  * Push with associative array  
  * @param array $arr
  * @param array $tmp
  * @return array $arr
  */  
function associative_push($arr, $tmp) {
  if (is_array($tmp)) {
    foreach ($tmp as $key => $value) { 
      $arr[$key] = $value;
    }
    return $arr;
  }
  return false;
}

  /**
  * Search value from 2 dimension array
  * @param string $value
  * @param string $index
  * @param array $array
  * @return true,false
  */ 
function searchValue($value, $index, $array) {
   foreach ($array as $key => $val) {
       if ($val[$index] == $value) {
           return true;
       }
   }
   return false;
}

function format_number($number,$decimal,$type='currency'){
	switch ($type) {
    case 'currency':
        return number_format($number,$decimal);
        break;    
	}
}

function arr2tree($arr, $id_index, $parent_index, $ret_index = "__CHILDREN", $level_index = "__LEVEL"){
	$tree = $rootRow = array();
	foreach ($arr as $i=>$row) {
		$haveParent = false;
		foreach ($arr as $crow) {
			if (strlen($row[$parent_index]) > 0 && $row[$parent_index] === $crow[$id_index] && $row[$id_index] !== $crow[$id_index]) {
				$haveParent = true;
				break;
			}
		}
		if (!$haveParent) $rootRow[] = $i;
	}
	if (!function_exists('getNodeArr')) {
		function getNodeArr($arr, $parentid, $id_index, $parent_index, $ret_index, $level_index, $currlevel = 0) {
			$ret = array();
			foreach ($arr as $i=>$row) {
				if ($row[$parent_index] === $parentid) {
					$ret[] = array_merge($row, array($level_index=>$currlevel+1, $ret_index=>getNodeArr($arr, $row[$id_index], $id_index, $parent_index, $ret_index, $level_index, $currlevel+1)));
				}
			}
			return $ret;
		}
	}
	foreach ($rootRow as $r) {
		$tree[] = array_merge($arr[$r], array($level_index=>0,$ret_index=>getNodeArr($arr, $arr[$r][$id_index], $id_index, $parent_index, $ret_index, $level_index)));
	}
    
    return $tree;
}

function quote($str) {
	global $DB;
	return $DB->quote($str);
}

function time_different_string($to, $from = false, $full = false, $showagolater = true, $nowtext = 'just now') {
	$tl = 'timedifferent'; // lang file
	
    $now = ($from) ? (($from instanceof DateTime) ? $from : new DateTime($from)) : new DateTime;
    $ago = ($to instanceof DateTime) ? $to : new DateTime($to);
    $diff = $now->diff($ago);

    $diff->w = floor($diff->d / 7);
    $diff->d -= $diff->w * 7;

    $string = array(
        'y' => tl('year',false,$tl),
        'm' => tl('month',false,$tl),
        'w' => tl('week',false,$tl),
        'd' => tl('day',false,$tl),
        'h' => tl('hour',false,$tl),
        'i' => tl('minute',false,$tl),
        's' => tl('second',false,$tl),
    );
	$pstring = array(
        'y' => tl('years',false,$tl),
        'm' => tl('months',false,$tl),
        'w' => tl('weeks',false,$tl),
        'd' => tl('days',false,$tl),
        'h' => tl('hours',false,$tl),
        'i' => tl('minutes',false,$tl),
        's' => tl('seconds',false,$tl),
    );
    foreach ($string as $k => &$v) {
        if ($diff->$k) {
            $v = $diff->$k . ' ' . ($diff->$k > 1 ? $pstring[$k] : $v);
        } else {
            unset($string[$k]);
        }
    }

    if (!$full) $string = array_slice($string, 0, 1);
	if ($string) {
		$ret = implode(', ', $string);
		if ($showagolater) {
			$ret .= ' '. (($now > $ago) ? tl('ago',false,$tl) : tl('later',false,$tl));
		}
	}
	else $ret = tl($nowtext,false,$tl);
	return $ret;
}

function insertNotice($to, $subject, $text = null, $duedate = null, $from = null) {
	global $DB;
	$data = array(
		"di_created_by" => ($from) ? $from : '*'.APP,
		"di_userid" => $to,
		"di_cat"=>"Notice",
		"di_subject"=>$subject,
		"di_text"=>$text,
		"di_duedate"=>$duedate,
	);
	return $DB->doInsert("fcuserdiary", $data);
}

function autoDetailTableInput(&$dbo) { // search for DBO columns with __map_{detailtable}__{detailtable_col}__ and auto generate input fields
	global $DETAIL_SETUP;
	$detailSetup = array();
	$detailTableKeyMap = array();
	if (!in_array($dbo->state, array('detail', 'edit', 'new'))) return;
	foreach ($dbo->cols as $colname=>&$setup) {
		if (stripos($colname,'__map_') === 0 && substr($colname, -2) == '__') {
			$det = explode('__', substr($colname, 6, -2));
			if (count($det) == 2) {
				$detailSetup[$det[0]][$det[1]] = $setup;
				$detailSetup[$det[0]][$det[1]]->col = $det[1];
				if (in_array($colname, $dbo->colEdit)) {
					$detailTableKeyMap[$det[0]] = array("ori"=>$colname, "target"=>$det[1]);
					$setup->inputEditModifierMethod = 'phpfunc';
					$setup->inputEditModifier = 'genDetailTableInput';
				}
				if (in_array($colname, $dbo->colNew)) {
					$detailTableKeyMap[$det[0]] = array("ori"=>$colname, "target"=>$det[1]);
					$setup->inputNewModifierMethod = 'phpfunc';
					$setup->inputNewModifier = 'genDetailTableInput';
				}
				if (in_array($colname, $dbo->colDetail)) {
					$detailTableKeyMap[$det[0]] = array("ori"=>$colname, "target"=>$det[1]);
					$setup->displayDetailModifierMethod = 'phpfunc';
					$setup->displayDetailModifier = 'genDetailTableDisplay';
				}
			}
		}
	}
	if ($detailSetup) {
		$dbo->editModifier = 'autoDetailCustomEdit';
		$dbo->newModifier = 'autoDetailCustomNew';
	}
	foreach($detailSetup as $detTab=>$detCols) {
		$detailDBO = clone $dbo;
		unset($detCols[$detailTableKeyMap[$detTab]["target"]]);
		$detailDBO->cols = $detCols;
		$detailDBO->userFunctions = array();
		$state = $detailDBO->state;
		$tmp = 'col'.ucfirst($state);
		$detailDBO->col = $detailDBO->$tmp = array_keys($detCols);
		$detCaption = $detailDBO->renderPrepareCaption($state);
		$detValue = $detailDBO->renderPrepareValue($state);
		$mandatoryCols = array();
		foreach ($detailDBO->cols as $c=>$s) {
			if ($s->isMandatory($state)) $mandatoryCols[] = $c;
		}
		$DETAIL_SETUP["keycol"] = $dbo->key[0];
		$DETAIL_SETUP[$detailTableKeyMap[$detTab]["ori"]] = array(
			"mustfill"=>$dbo->cols[$detailTableKeyMap[$detTab]["ori"]]->isMandatory($state),
			"mustfillCols"=>$mandatoryCols,
			"caption"=>$detCaption,
			"value"=>$detValue,
			"table"=>$detTab,
			"cols"=>$detailDBO->col,
			"dbo"=>$detailDBO,
			"fkcol"=>$detailTableKeyMap[$detTab]["target"],
			"fkcolcaption"=>$dbo->cols[$detailTableKeyMap[$detTab]["ori"]]->caption->get($state),
			"inputPrefix"=>"dbo_".$detailDBO->id."_".$state."_",
		);
	}
}

function genDetailTableDisplay($colname, $currval, $rs, $html) {
	global $DB, $DETAIL_SETUP;
	if (empty($DETAIL_SETUP[$colname])) return $html;
	$d = $DETAIL_SETUP[$colname];
	$data = array();
	if ($currval) $data = $DB->getArray("select * from {$d['table']} where {$d['fkcol']} = :0 order by 1", array($currval), PDO::FETCH_ASSOC);
	
	if ($data) {
		foreach ($data as $i=>&$r) {
			foreach ($d['cols'] as $c) {
				$optionMethod = $d['dbo']->cols[$c]->option->getMethod('detail');
				$optionString = $d['dbo']->cols[$c]->option->get('detail');
				if(strlen($optionString)){
					$options = $d['dbo']->genOption($optionMethod, $optionString);
					if($options){
						$opt = array();
						foreach($options as $arr){
							$keys = array_keys($arr);
							$opt[$arr[$keys[0]]] = $arr[isset($keys[1])?$keys[1]:$keys[0]];
						}
					}
					$valueArr = explode(', ', $r[$c]);
					$values = array();
					foreach($valueArr as $valuecode){
						$values[] = isset($opt[$valuecode])?$opt[$valuecode]:$valuecode;
					}
					$r[$c] = implode(', ', $values);
				}
			}
		}
	}
	$smarty = new Smarty();
	$smarty->caching = false;
	$smarty->setTemplateDir(DOC_DIR.DS.'smarty'.DS.'templates');
	$smarty->setCompileDir(DOC_DIR.DS.'smarty'.DS.'templates_c');
	$smarty->setCacheDir(DOC_DIR.DS.'smarty'.DS.'cache');
	$smarty->setConfigDir(DOC_DIR.DS.'smarty'.DS.'configs');
	$smarty->assign("d", $d);
	$smarty->assign("data", $data);
	$smarty->assign("keyhtml",$html);

	return $smarty->fetch("dbodetaildisplay.html");
}

function genDetailTableInput($colname, $currval, $rs, $html, $dbo) {
	global $DB, $DETAIL_SETUP;
	if (empty($DETAIL_SETUP[$colname])) return $html;
	$d = $DETAIL_SETUP[$colname];
	$data = array();
	$defval = $dbo->cols[$colname]->getDefaultValue($dbo->state);
	if ($defval) $currval = $defval;
	if ($currval) $data = $DB->getArray("select * from {$d['table']} where {$d['fkcol']} = :0 order by 1", array($currval), PDO::FETCH_ASSOC);
	if (!empty($_POST['detail'][$d['fkcol']]['data'])) $data = $_POST['detail'][$d['fkcol']]['data'];

	$smarty = new Smarty();
	$smarty->caching = false;
	$smarty->setTemplateDir(DOC_DIR.DS.'smarty'.DS.'templates');
	$smarty->setCompileDir(DOC_DIR.DS.'smarty'.DS.'templates_c');
	$smarty->setCacheDir(DOC_DIR.DS.'smarty'.DS.'cache');
	$smarty->setConfigDir(DOC_DIR.DS.'smarty'.DS.'configs');

	$smarty->assign("d", $d);
	$smarty->assign("data", $data);
	$smarty->assign("keyhtml",$html);

	return $smarty->fetch("dbodetailsetup.html");
}


function autoDetailCustomEdit($table, $cols, $wheres){
	global $DB, $DETAIL_SETUP;
	$ret = array();
	foreach ($cols as $k=>$v) {
		if (substr($k,0,6) == '__map_') unset($cols[$k]);
	}
	$ok = $DB->doUpdate($table, $cols, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
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
					$detcols = array($keycol => $d['key']);
					$ok = $DB->execute("delete from {$d['table']} where {$keycol} = :0", array($d['key']));
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

	return $ret;
}

function autoDetailCustomNew($table, $cols) {
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
		if (!empty($cols[$DETAIL_SETUP['keycol']])) {
			$newid = $cols[$DETAIL_SETUP['keycol']];
		}
		else {
			$newid = $DB->lastInsertId();
			if (!$newid) {
				$seq = $DB->getOne("select pg_get_serial_sequence(:0, :1)", array($table, $DETAIL_SETUP['keycol']));
				$newid = $DB->lastInsertId($seq);
			}
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

function moveSingleImage($destination, $newfilename='',$image){

	$allowedExts = array("jpg", "jpeg", "gif", "png","JPG", "JPEG", "GIF", "PNG");
	$tmp = explode(".", $image["name"]);
	$extension = end($tmp);	
	# Need to add file size validation
	if ((($image["type"] == "image/gif")
	|| ($image["type"] == "image/jpeg")			
	|| ($image["type"] == "image/png")
	|| ($image["type"] == "image/pjpeg"))
	&& in_array($extension, $allowedExts))
	{
	  if ($image["error"] > 0)
		{
			return "Return Code: " . $image["error"] . "<br>"; 
		}
	  else
		{
			if($newfilename =='') $filename = $image["name"];
			else $filename  = $newfilename.".".$extension;
			move_uploaded_file($image["tmp_name"],$destination.$filename);			  	
		}
	}
	else
	{
	  return "Invalid file "; 
	}	

	return array('extension' => $extension);
}


/**
 * Convert a shorthand byte value from a PHP configuration directive to an integer value
 * @param    string   $value
 * @return   int
 */
function convertBytes( $value ) {
    if ( is_numeric( $value ) ) {
        return $value;
    } else {
        $value_length = strlen( $value );
        $qty = substr( $value, 0, $value_length - 1 );
        $unit = strtolower( substr( $value, $value_length - 1 ) );
        switch ( $unit ) {
            case 'k':
                $qty *= 1024;
                break;
            case 'm':
                $qty *= 1048576;
                break;
            case 'g':
                $qty *= 1073741824;
                break;
        }
        return $qty;
    }
}

function getuserSessID($userid) {
	global $DB;
	$sessid = $DB->getOne("select us_sessid from fcusersession where us_userid =:0 and us_active = 'Y' order by us_id desc", array($userid));
	return ($sessid) ? $sessid : false;
}

function showDBO($dboid, $state, $key = false) {
	ob_start();
	$_GET['dboid'] = $dboid;
	$_GET['dbostate'] = $state;
	if (!empty($_GET['dboconfig'])) {
		echo
		'<div class="alert alert-page alert-danger alert-dark">
			<button type="button" class="close" data-dismiss="alert">&times</button>
			<strong>You cannot configure the DBO here.</strong>
		</div>';
		unset($_GET['dboconfig']);
	}
	if ($key) {
		foreach ($key as $k=>$v) {
			$_GET[$k] = $v;
		}
	}
	dbo_include($dboid);
	$pageContent = ob_get_clean();
	return $pageContent;
}

function getUserLang($userid) {
	global $DB;
	$ret = 'EN-US';
	
	$userlang = $DB->getOne("select lang_code from fcuser join fclang on usr_langcode = lang_code where usr_userid = :0", array($userid));
	if ($userlang) {
		$ret = $userlang;
		return $ret;
	}
	
	$applang = $DB->getOne("select set_val from fcsetting where set_user = '*' and set_code = 'LANG'");
	if ($applang) $ret = $applang;
	$localelang = $DB->getOne("select lang_code from fcorg join fcuserorgrole on org_id = uor_orgid
	join fclocale on lc_code = org_lccode join fclang on lc_primary_langcode = lang_code 
	where uor_usrid = :0 order by uor_seq", array($userid));
	if (!$localelang) {
		$localelang = $DB->getOne("select lang_code from fcsetting join fclocale on set_val = lc_code 
		join fclang on lc_primary_langcode = lang_code where set_code = 'SERVERLOCALE' and set_user = '*'");
	}
	if ($localelang) $ret = $localelang;
	
	return $ret;
}

function displaySearchDate(){

	$start = '2014-07-01';

	// A DATE TO STOP GENERATING DATA
	$stop  = date("Y-m-d");
	$ret = array();
	// A LOOP TO SHOW THE DATES
	while ($start <= $stop)
	{
	    $start = date('M-Y', strtotime($start));
	    //echo strtoupper($start).'<br>';
	    $newdate = array(strtoupper($start),strtoupper($start));
	    array_push($ret, $newdate);
	    $start = date('Y-m-01', strtotime($start . ' + 1 MONTH'));
	}
	return $ret;
}

?>