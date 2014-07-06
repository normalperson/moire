<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'machinesetup.conf.php');

# customization
function dbo_machinesetup_customize(&$dbo){
	$dbo->newModifier = 'dbo_machinesetup_custom_new';
	$dbo->editModifier = 'dbo_machinesetup_custom_edit';
}

function dbo_machinesetup_custom_new($table, $cols){
	global $DB;
	// $DB->showsql=1;
	$cols2 = $cols;
	foreach(array('anilox', 'line', 'repeat', 'substrate', 'plate') as $col){
		if(array_key_exists($col, $cols)) unset($cols[$col]);
	}
	$ret = array();
	// pr($_POST);
	// pr($cols);
	// pr($cols2);
	$ok = $DB->doInsert($table, $cols);
	$mcid = $DB->lastID();
	
	for($i=1; $i<=$cols['mc_colorslot']; $i++){
		// anilox
		$DB->execute("insert into mcmanilox (ma_mcid, ma_num, ma_type, ma_value) values (:0, :1, :2, :3)", array($mcid, $i, $_POST['anilox_type_'.$i], $_POST['anilox_val_'.$i]));
		// mcmline
		$DB->execute("insert into mcmline (ml_mcid, ml_num, ml_value) values (:0, :1, :2)", array($mcid, $i, $_POST['mcmline_'.$i]));
		// mcmcylrepeat
		$DB->execute("insert into mcmcylrepeat (mcr_mcid, mcr_num, mcr_value) values (:0, :1, :2)", array($mcid, $i, $_POST['mcmcylrepeat_'.$i]));
		// mcmcylsubstrate
		$DB->execute("insert into mcmcylsubstrate (mcs_mcid, mcs_num, mcs_value) values (:0, :1, :2)", array($mcid, $i, $_POST['mcmcylsubstrate_'.$i]));
		// mcmcylplate
		$DB->execute("insert into mcmcylplate (mcp_mcid, mcp_num, mcp_value) values (:0, :1, :2)", array($mcid, $i, $_POST['mcmcylplate_'.$i]));
	}
	for($i=1; $i<=$cols['mc_colorslot']; $i++){
	}
	for($i=1; $i<=$cols['mc_colorslot']; $i++){
	}
	// mcmcylsubstrate
	// mcmcylplate
	
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

function dbo_machinesetup_custom_edit($table, $cols, $wheres){
	global $DB;
	// $DB->showsql=1;
	$mcid = $wheres['mc_id'];
	$cols2 = $cols;
	foreach(array('anilox', 'line', 'repeat', 'substrate', 'plate') as $col){
		if(array_key_exists($col, $cols)) unset($cols[$col]);
	}
	$ret = array();
	// pr($_POST);
	// pr($cols);
	// pr($cols2);
		
	// anilox
	$DB->execute("delete from mcmanilox where ma_mcid = :0", array($wheres['mc_id']));
	$DB->execute("delete from mcmline where ml_mcid = :0", array($wheres['mc_id']));
	$DB->execute("delete from mcmcylrepeat where mcr_mcid = :0", array($wheres['mc_id']));
	$DB->execute("delete from mcmcylsubstrate where mcs_mcid = :0", array($wheres['mc_id']));
	$DB->execute("delete from mcmcylplate where mcp_mcid = :0", array($wheres['mc_id']));
	for($i=1; $i<=$cols['mc_colorslot']; $i++){
		$DB->execute("insert into mcmanilox (ma_mcid, ma_num, ma_type, ma_value) values (:0, :1, :2, :3)", array($mcid, $i, $_POST['anilox_type_'.$i], $_POST['anilox_val_'.$i]));		
		$DB->execute("insert into mcmline (ml_mcid, ml_num, ml_value) values (:0, :1, :2)", array($mcid, $i, $_POST['mcmline_'.$i]));
		$DB->execute("insert into mcmcylrepeat (mcr_mcid, mcr_num, mcr_value) values (:0, :1, :2)", array($mcid, $i, $_POST['mcmcylrepeat_'.$i]));
		$DB->execute("insert into mcmcylsubstrate (mcs_mcid, mcs_num, mcs_value) values (:0, :1, :2)", array($mcid, $i, $_POST['mcmcylsubstrate_'.$i]));
		$DB->execute("insert into mcmcylplate (mcp_mcid, mcp_num, mcp_value) values (:0, :1, :2)", array($mcid, $i, $_POST['mcmcylplate_'.$i]));
	}
	
	// return array('dev');
	$ok = $DB->doUpdate($table, $cols, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

function colorslot_anilox($mcid){
	global $DB;
	$aniloxRS = $DB->getArrayAssoc("select ma_type, ma_value from mcmanilox where ma_mcid = :0 order by ma_num", array($mcid));
	$cslotNum = count($aniloxRS);
	if(!$cslotNum) $cslotNum = 1;
	$aniloxOptionRS = $DB->getArrayAssoc("select lu_code, lu_title from fclookup where lu_cat = :0", array('ANILOXTYPE'));
	$ret = '<table><tr><th>Type</th><th>Value</th></tr>';
	for($i=1;$i<=6;$i++){
		$ret .= '<tr id="anilox_row_'.$i.'" style="display:'.($cslotNum&&$i<=$cslotNum?'table-row':'none').'">';
		$ret .= '<td>'.$i.'.</td>';
		$ret .= '<td><div class="value_container"><select name="anilox_type_'.$i.'" id="anilox_type_'.$i.'">';
		foreach($aniloxOptionRS as $row){
			$ret .= '<option value="'.htmlentities($row['lu_code'], ENT_QUOTES).'"'.(isset($aniloxRS[$i-1])&&$row['lu_code']==$aniloxRS[$i-1]['ma_type']?' selected="selected"':'').'>'.htmlentities($row['lu_title'], ENT_QUOTES).'</option>';
		}
		$ret .= '</select></div></td>';
		$ret .= '<td><div class="value_container"><input type="text" name="anilox_val_'.$i.'" id="anilox_val_'.$i.'" value="'.(isset($aniloxRS[$i-1])?htmlentities($aniloxRS[$i-1]['ma_value'], ENT_QUOTES):'').'"/></div></td>';
		$ret .= '</tr>';
	}
	$ret .= '</table>';
	return $ret;
}

function colorslot_anilox_det($mcid){
	global $DB;
	$aniloxRS = $DB->getArrayAssoc("select ma_type, ma_value from mcmanilox where ma_mcid = :0 order by ma_num", array($mcid));
	$cslotNum = count($aniloxRS);
	if(!$cslotNum) $cslotNum = 1;
	$aniloxOptionRS = $DB->getArrayAssoc("select lu_code, lu_title from fclookup where lu_cat = :0", array('ANILOXTYPE'));
	$ret = '<table><tr><th>Type</th><th>Value</th></tr>';
	for($i=1;$i<=$cslotNum;$i++){
		$ret .= '<tr id="anilox_row_'.$i.'" style="display:'.($cslotNum&&$i<=$cslotNum?'table-row':'none').'">';
		$ret .= '<td>'.$i.'.</td>';
		$ret .= '<td><div class="value_container">';
		foreach($aniloxOptionRS as $row){
			// $ret .= '<option value="'.htmlentities($row['lu_code'], ENT_QUOTES).'"'.(isset($aniloxRS[$i-1])&&$row['lu_code']==$aniloxRS[$i-1]['ma_type']?' selected="selected"':'').'>'.htmlentities($row['lu_title'], ENT_QUOTES).'</option>';
			$ret .= isset($aniloxRS[$i-1])&&$row['lu_code']==$aniloxRS[$i-1]['ma_type']?$row['lu_title']:'';
		}
		$ret .= '</div></td>';
		$ret .= '<td><div class="value_container">'.(isset($aniloxRS[$i-1])?htmlentities($aniloxRS[$i-1]['ma_value'], ENT_QUOTES):'').'</div></td>';
		$ret .= '</tr>';
	}
	$ret .= '</table>';
	return $ret;
}

function colorslot_mult($mcid, $table, $colprefix){
	global $DB;
	$inputRS = $DB->getArray("select {$colprefix}_value from {$table} where {$colprefix}_mcid = :0 order by {$colprefix}_num", array($mcid));
	$cslotNum = count($inputRS);
	if(!$cslotNum) $cslotNum=1;
	$ret = '<table>';
	for($i=1;$i<=6;$i++){
		$ret .= '<tr id="anilox_row_'.$table.'_'.$i.'" style="display:'.($cslotNum&&$i<=$cslotNum?'table-row':'none').'"><td>'.$i.'.</td><td><div class="value_container">';
		$ret .= '<input type="text" name="'.$table.'_'.$i.'" id="'.$table.'_'.$i.'" value="'.(isset($inputRS[$i-1])?htmlentities($inputRS[$i-1][$colprefix.'_value'], ENT_QUOTES):'').'"/>';
		$ret .= '</div></td></tr>';
	}
	$ret .= '</table>';
	return $ret;
}

function colorslot_mult_det($mcid, $table, $colprefix){
	global $DB;
	$inputRS = $DB->getArray("select {$colprefix}_value from {$table} where {$colprefix}_mcid = :0 order by {$colprefix}_num", array($mcid));
	$cslotNum = count($inputRS);
	if(!$cslotNum) $cslotNum=1;
	$ret = '<table>';
	for($i=1;$i<=$cslotNum;$i++){
		$ret .= '<tr id="anilox_row_'.$table.'_'.$i.'"><td>'.$i.'.</td><td><div class="value_container">';
		if(isset($inputRS[$i-1]))
			$ret .= htmlentities($inputRS[$i-1][$colprefix.'_value'], ENT_QUOTES);
		$ret .= '</div></td></tr>';
	}
	$ret .= '</table>';
	return $ret;
}

# final rendering
$dbo->render();
?>
<script type="text/javascript">
function colorslotchange(){
	if(document.getElementById('dbo_machinesetup_new_mc_colorslot')){
		var state = 'new';
	}else if(document.getElementById('dbo_machinesetup_edit_mc_colorslot')){
		var state = 'edit';
	}else{
	}
	colorslotCount = document.getElementById('dbo_machinesetup_'+state+'_mc_colorslot').value;
	typeValue = document.getElementById('dbo_machinesetup_'+state+'_mc_type').value;
	console.log(typeValue);
	// if(!colorslotCount){
		// return false;
	// }
	for(var i=1; i<=6; i++){
		// anilox type
		if(i>colorslotCount){ // hide
			document.getElementById('anilox_row_'+i).style.display = 'none';
			document.getElementById('anilox_row_mcmline_'+i).style.display = 'none';
			document.getElementById('anilox_row_mcmcylrepeat_'+i).style.display = 'none';
			document.getElementById('anilox_row_mcmcylsubstrate_'+i).style.display = 'none';
			document.getElementById('anilox_row_mcmcylplate_'+i).style.display = 'none';
		}else{ // show
			document.getElementById('anilox_row_'+i).style.display = 'table-row';
			document.getElementById('anilox_row_mcmline_'+i).style.display = 'table-row';
			document.getElementById('anilox_row_mcmcylrepeat_'+i).style.display = 'table-row';
			document.getElementById('anilox_row_mcmcylsubstrate_'+i).style.display = 'table-row';
			document.getElementById('anilox_row_mcmcylplate_'+i).style.display = 'table-row';
		}
		// anilox value
		console.log(document.getElementById('anilox_type_'+i).value);
		var sel = document.getElementById('anilox_type_'+i);
		if(typeValue=='LONGWAY'){
			for(var j=0;j<sel.options.length;j++){
				if(sel.options[j].value.substr(-3)=='WDB'){
					if(sel.options[j].selected){
						sel.options[1].selected = true;
					}
					sel.options[j].selected=false;
					sel.options[j].disabled=true;
					sel.options[j].style.display='none';
				}
			}
		}else{
			for(var j=0;j<sel.options.length;j++){
				sel.options[j].disabled=false;
				sel.options[j].style.display='inline-block';
			}
		}
	}
}
</script>