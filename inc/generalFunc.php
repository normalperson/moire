<?php
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
	$rootRow = array();
	if (!$arr) return array();
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

function time_different_string($to, $from = false, $full = false, $nowtext = 'just now') {
    $now = ($from) ? new DateTime($from) : new DateTime;
    $ago = new DateTime($to);
    $diff = $now->diff($ago);
	
    $diff->w = floor($diff->d / 7);
    $diff->d -= $diff->w * 7;

    $string = array(
        'y' => 'year',
        'm' => 'month',
        'w' => 'week',
        'd' => 'day',
        'h' => 'hour',
        'i' => 'minute',
        's' => 'second',
    );
    foreach ($string as $k => &$v) {
        if ($diff->$k) {
            $v = $diff->$k . ' ' . $v . ($diff->$k > 1 ? 's' : '');
        } else {
            unset($string[$k]);
        }
    }
    if (!$full) $string = array_slice($string, 0, 1);
    return $string ? implode(', ', $string) . (($now > $ago) ? ' ago' : ' later') : $nowtext;
}

function insertNotice($to, $subject, $text = null, $duedate = null, $from = null, $displaydate = null) {
	global $DB;
	// role 
	if (!is_array($to)) {
		if (substr($to, 0, 1) == '*') {
			$to = $DB->getCol("select usr_userid from fcuserorgrole join fcrole on rol_id = uor_rolid join fcuser on uor_usrid = usr_userid
			where rol_code = :0 and rol_status = 'ACTIVE' and usr_status = 'ACTIVE'", array(substr($to,1)));
		}
		else $to = array($to);
	}
	
	foreach ($to as $t) {
		$data = array(
			"di_created_by" => ($from) ? $from : '*'.APP,
			"di_userid" => $t,
			"di_cat"=>"Notice",
			"di_subject"=>$subject,
			"di_text"=>$text,
			"di_duedate"=>$duedate,
			"di_display_date"=> ($displaydate) ? $displaydate : $DB->getOne("select now()"),
		);
		$ok = $DB->doInsert("fcuserdiary", $data);
		if (!$ok) return false;
	}
	return true;
}

function addOrdinalNumberSuffix($num) {
    if (!in_array(($num % 100),array(11,12,13))){
        switch ($num % 10) {
            // Handle 1st, 2nd, 3rd
            case 1:  return $num.'st';
            case 2:  return $num.'nd';
            case 3:  return $num.'rd';
        }
    }
    return $num.'th';
}


// TEMP SOLUTION TO READONLY COLUMNS IN DBO  START //
function set_dbo_readonly_cols(&$dbo, $cols=array()) {
	foreach ($cols as $c) {
		$dbo->cols[$c]->inputEditModifierMethod = 'phpfunc';
		$dbo->cols[$c]->inputEditModifier = 'hideInputModifier';
	}
}

function hideInputModifier($c, $currval, $rs, $html) {
	return "<div style='display:none'>{$html}</div><div class='dbo_readonly_value_container'>{$currval}</div>";
}

// TEMP SOLUTION TO READONLY COLUMNS IN DBO  END   //

?>