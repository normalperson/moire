<?php
require_once(DOC_DIR.'/inc/appFunc.php');
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'clientuser.conf.php');

# customization
function dbo_clientuser_customize(&$dbo){
	global $DB, $USER;
	$toporgid = userTopOrgID();
	$orgIDList = array($toporgid);
	$rs = $DB->getColumn("select org_id from fcorg where org_parentid = :0", array($toporgid));
	if($rs){
		$orgIDList = array_merge($orgIDList, $rs);
	}
	$rs = $DB->getColumn("select distinct uor_usrid from fcuserorgrole where uor_orgid in (".implode(", ", $orgIDList).")");
	if($rs)
		$dbo->whereSQL = "usr_userid in ('".implode("', '", $rs)."')";
	$dbo->deleteModifier = 'dbo_clientuser_custom_delete';
	$dbo->editModifier = 'dbo_clientuser_custom_edit';
	$dbo->newModifier = 'dbo_clientuser_custom_new';
}

function dbo_clientuser_custom_delete($table, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doDelete($table, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}else{
		// need to delete the same thing in fcuserorgrole
		$sql = "delete from fcuserorgrole where uor_usrid = :0";
		$ok = $DB->Execute($sql,array($wheres['usr_userid']));
		if(!$ok) $ret[] = $DB->lastError;
	}
	return $ret;
}

function dbo_clientuser_custom_new($table, $cols){
	global $DB,$USER;
	$ret = array();
	// $DB->showsql=1;
	// pr($_POST);
	$toporgid = userTopOrgID();
	/*validation*/
	// check is there space between userid
	if(preg_match('/\s/',$cols['usr_userid'])>0) $ret = array( tl('Userid does not allow to have space in between',false,'valmessage') );

	// validate email address format
	if(!filter_var($cols['usr_email'], FILTER_VALIDATE_EMAIL)) $ret =  array_merge($ret,array( tl('Invalid email address format',false,'valmessage') )); 
	

	if(count($ret) > 0) return $ret;

	# check userid availability
	$cnt = $DB->getOne("select count(*) from ".$DB->prefix."user where usr_userid = :0", array($cols['usr_userid']));
	if($cnt) return array( tl('Userid not available',false,'valmessage') );


	if(!strlen(trim($cols['password1']))) return array( tl('Password is mandatory',false,'valmessage') );
	if($cols['password1']!=$cols['password2']) return array( tl('Password not match',false,'valmessage') );
	$cols['usr_password'] = User::genPassword($cols['password1']);
	foreach(array('password1', 'password2', 'userrole') as $tmp){
		if(array_key_exists($tmp, $cols)) unset($cols[$tmp]);
	}
	$ok = $DB->doInsert($table, $cols);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	# fcuserorgrole
	if($ok){
		$sql = "insert into fcuserorgrole (uor_usrid, uor_orgid, uor_rolid, uor_seq) values ";
		$orgroleInsert = array();
		$seqStart = 1;
		foreach($_POST as $key=>$val){
			if(strpos($key, 'userorg_')!==false){
				$no = str_replace('userorg_', '', $key);
				if($_POST[$key]=='default' || $_POST['userrole_'.$no]=='default'){
					return array( tl('Invalid organization or role',false,'valmessage') );
				}
				if(isset($_POST['checkbox_'.$no])){
					$seq = '1';
					$seqStart = 2;
				}else{
					$seq = 'uor_seq';
				}
				$orgroleInsert[] = "(".$DB->quote($cols['usr_userid']).", ".$_POST['userorg_'.$no].", ".$_POST['userrole_'.$no].", ".$seq.")";
			}
		}
		if($orgroleInsert){
			foreach($orgroleInsert as $key=>$val){
				if(strpos($val, 'uor_seq')!==false){
					$val = str_replace('uor_seq', $seqStart, $val);
					$seqStart++;
				}
				$orgroleInsert[$key] = $val;
			}
			$sql .= implode(", ", $orgroleInsert);
			$ok = $DB->execute($sql);
			if(!$ok) $ret[] = $DB->lastError;
		}
	}
	return $ret;
}

function dbo_clientuser_custom_edit($table, $cols, $wheres){
	global $DB;
	$ret = array();
	if(isset($cols['password1']) && strlen($cols['password1'])){
		if($cols['password1']!==$cols['password2'])
			return array( tl('New password not match',false,'valmessage') );
		else
			$cols['usr_password'] = User::genPassword($cols['password1']);
	}
	foreach(array('password1', 'password2', 'userrole') as $tmp){
		if(array_key_exists($tmp, $cols)) unset($cols[$tmp]);
	}
	$ok = $DB->doUpdate($table, $cols, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	# fcuserorgrole
	if($ok){
		$DB->execute("delete from fcuserorgrole where uor_usrid = :0", array($wheres['usr_userid']));
		$sql = "insert into fcuserorgrole (uor_usrid, uor_orgid, uor_rolid, uor_seq) values ";
		$orgroleInsert = array();
		$seqStart = 1;
		foreach($_POST as $key=>$val){
			if(strpos($key, 'userorg_')!==false){
				$no = str_replace('userorg_', '', $key);
				if($_POST[$key]=='default' || $_POST['userrole_'.$no]=='default'){
					return array('Invalid organization or role');
				}
				if(isset($_POST['checkbox_'.$no])){
					$seq = '1';
					$seqStart = 2;
				}else{
					$seq = 'uor_seq';
				}
				$orgroleInsert[] = "(".$DB->quote($cols['usr_userid']).", ".$_POST['userorg_'.$no].", ".$_POST['userrole_'.$no].", ".$seq.")";
			}
		}
		if($orgroleInsert){
			foreach($orgroleInsert as $key=>$val){
				if(strpos($val, 'uor_seq')!==false){
					$val = str_replace('uor_seq', $seqStart, $val);
					$seqStart++;
				}
				$orgroleInsert[$key] = $val;
			}
			$sql .= implode(", ", $orgroleInsert);
			$ok = $DB->execute($sql);
			if(!$ok) $ret[] = $DB->lastError;
		}
	}
	return $ret;
}

function neworgrole(){
	global $DB,$USER;

	$orgpostname = 'org';
	$tableprefix = $DB->prefix;
	$tblorg = $tableprefix.$orgpostname;

	$toporgid = userTopOrgID();
/*	$orgdata = $DB->GetArray("select org_id,org_name from $tblorg where org_status = :0 and org_id = :1", array('ACTIVE', $toporgid));
	$rs = $DB->getArray("select org_id,org_name from $tblorg where org_status = :0 and org_parentid = :1", array('ACTIVE', $toporgid));
	if($rs)
		$orgdata = array_merge($orgdata, $rs);*/

	/* for temporary use*/
	$orgdata = $DB->GetArray("select org_id,org_name from $tblorg where org_status = :0", array('ACTIVE'));
	/*if($rs)
		$orgdata = array_merge($orgdata, $rs);		*/

	$orgHTML = "<select id='userorg_1' name='userorg_1'><option value='default'>--Select Org--</option>";
	foreach ($orgdata as $data){
		$orgHTML .= "<option selected value='".$data['org_id']."'>".$data['org_name']."</option>";
	}
	$orgHTML .= "</select>"; 

	$rolepostname = 'role';
	$tableprefix = $DB->prefix;
	$tblrole = $tableprefix.$rolepostname;

	if($USER->userid == 'admin') $roledata = $DB->GetArray("select rol_id,rol_name from $tblrole ");
	else $roledata = $DB->GetArray("select rol_id,rol_name from $tblrole where rol_id not in (:0,:1)",array(1,2));

	$roleHTML = "<select id='userrole_1' name='userrole_1'><option value='default'>--Select Role--</option>";
	foreach ($roledata as $data){
		$roleHTML .= "<option value='".$data['rol_id']."'>".$data['rol_name']."</option>";
	}
	$roleHTML .= "</select>"; 
	$html = "<table id='userorgrole'>
				<tr>
				<th>Primary</th>
				<th>Organization</th>
				<th>Role</th>
				<th></th>
				</tr>
				<tbody>
					<tr id='userorgrolerow_1'><td><input type='checkbox' id='checkbox_1' name='checkbox_1' value='1' /></td>
					<td>$orgHTML</td> 
					<td>$roleHTML</td>
					<td><input type='button' value='add row' id='addrow_1' onclick='addrow();'/>
					    <input type='button' value='remove row' id='removerow_1' onclick='removerow(this);'/>
					 </td>
					</tr>
				</tbody>
			</table>";	
	return $html;
}
function editorgrole($param1,$param12,$param3){
	global $DB,$USER;
	// selected userid
	$selecteduserid = $param3['usr_userid'];

	$orgpostname = 'org';
	$tableprefix = $DB->prefix;
	$tblorg = $tableprefix.$orgpostname;

	$rolepostname = 'role';
	$tableprefix = $DB->prefix;
	$tblrole = $tableprefix.$rolepostname;	

	$relpostname = 'userorgrole';
	$tableprefix = $DB->prefix;
	$tblrel = $tableprefix.$relpostname;

	// get existing relationship
	$sql = "select * from $tblrel where uor_usrid = :0";
	$relationshiparr = $DB->GetArray($sql,array($selecteduserid),PDO::FETCH_ASSOC);

	//var_dump();

	$htmlth = "<table id='userorgrole'>
				<tr>
				<th>Primary</th>
				<th>Organization</th>
				<th>Role</th>
				<th></th>
				</tr>
				<tbody>";	
	// load exiting record
	//print 
	if(count($relationshiparr)>0){
		$htmltr = '';
		$i = 0;
		foreach($relationshiparr as $key => $val){
			$num = $i+1;
			$toporgid = userTopOrgID();
			$orgdata = $DB->GetArray("select org_id,org_name from $tblorg where org_status = :0 and org_id = :1",array('ACTIVE',$toporgid));

			$orgHTML = "<select id='userorg_$num' name='userorg_$num'><option value='default'>--Select Org--</option>";
			foreach ($orgdata as $data){
				if($data['org_id'] == $val['uor_orgid']) $orgHTML .= "<option selected value='".$data['org_id']."'>".$data['org_name']."</option>";
				else  $orgHTML .= "<option value='".$data['org_id']."'>".$data['org_name']."</option>";
				
			}
			$orgHTML .= "</select>"; 

			//$roledata = $DB->GetArray("select rol_id,rol_code,rol_name from $tblrole where rol_status = :0 ",array('ACTIVE'));
			if($USER->userid == 'admin') $roledata = $DB->GetArray("select rol_id,rol_name from $tblrole ");
			else $roledata = $DB->GetArray("select rol_id,rol_name from $tblrole where rol_code not in (:0,:1)",array(1,2));


			$roleHTML = "<select id='userrole_$num' name='userrole_$num'><option value='default'>--Select Role--</option>";
			foreach ($roledata as $data){
				if($data['rol_id'] == $val['uor_rolid']) $roleHTML .= "<option selected value='".$data['rol_id']."'>".$data['rol_name']."</option>";
				else $roleHTML .= "<option value='".$data['rol_id']."'>".$data['rol_name']."</option>";
			}
			$roleHTML .= "</select>"; 

			if($val['uor_seq'] == '1') {
				$checked = 'checked';
				$bgcolor = '#428bca';
			}
			else {
				$checked = null;
				$bgcolor = '#FFFFFF';
			}

			$htmltr .= "<tr id='userorgrolerow_$num' style='background-color:$bgcolor'><td><input type='checkbox' id='checkbox_$num' name='checkbox_$num' value='1' $checked/></td>
							<td>$orgHTML</td> 
							<td>$roleHTML</td>
							<td><input type='button' value='add row' id='addrow_$num' onclick='addrow();'/>
							    <input type='button' value='remove row' id='removerow_$num' onclick='removerow(this);'/>
							 </td>
							</tr>";
			$i++;
		}		
	}else{
		$orgdata = $DB->GetArray("select org_id,org_name from $tblorg where org_status = :0",array('ACTIVE'));

		$orgHTML = "<select id='userorg_1' name='userorg_1'><option value='default'>--Select Org--</option>";
		foreach ($orgdata as $data){
			$orgHTML .= "<option selected value='".$data['org_id']."'>".$data['org_name']."</option>";
		}
		$orgHTML .= "</select>"; 

		$roledata = $DB->GetArray("select rol_id,rol_code,rol_name from $tblrole ");

		$roleHTML = "<select id='userrole_1' name='userrole_1'><option value='default'>--Select Role--</option>";
		foreach ($roledata as $data){
			$roleHTML .= "<option value='".$data['rol_id']."'>".$data['rol_name']."</option>";
		}
		$roleHTML .= "</select>"; 

		$htmltr = "<tr id='userorgrolerow_1'><td><input type='checkbox' id='checkbox_1' name='checkbox_1' value='1' /></td>
						<td>$orgHTML</td> 
						<td>$roleHTML</td>
						<td><input type='button' value='add row' id='addrow_1' onclick='addrow();'/>
						    <input type='button' value='remove row' id='removerow_1' onclick='removerow(this);'/>
						 </td>
						</tr>";
	}

	$htmltf = "</tbody></table>";	
	$html = $htmlth.$htmltr.$htmltf;
	return $html;
}

# final rendering
$dbo->render();
?>
<script type="text/javascript">
// validation 
var usrVal = {
	init : function(config){
		this.config = config;
		this.bindEvent();
	},
	bindEvent : function(){
		this.config.newsubmit.click( this.validation );
		this.config.editsubmit.click( this.validation );
	},
	validation : function(){
		var self = usrVal,
		    msg = '',
		    success = true,
		    trcount = $('#userorgrole tr').length-1;// minus off table header row
//		console.log('TR count '+trcount);
		    //return false;
		//console.log($('#userorgrole input:checkbox:checked').length);
		if($('#userorgrole input:checkbox:checked').length == 0){
			msg = "Please tick at lease one checkbox<br>";
			success = false;
		}
		// single user not allow to have same org and role validation
		outerloop:
		for(var i=1; i<=trcount; i++){
			orgval = $('#'+self.config.orgstr+i).val();
			roleval = $('#'+self.config.rolestr+i).val();
			checkbox = $('#'+self.config.checkboxstr+i);
			if (checkbox.is(":checked") && roleval == 'default') {
				msg += "Pri check must have role";
				success = false;
				break;
			}
			// if checkbox is check, must select role

			innerloop:
			for(var j=i+1;j<=trcount;j++){
				orgval_next = $('#'+self.config.orgstr+j).val();
				roleval_next = $('#'+self.config.rolestr+j).val();
				if(orgval == orgval_next && roleval == roleval_next){
					msg += "Cannot assign 2 same role to the same user";
					success = false;	
					break outerloop;		
				}
			}
		}

		if(msg!='') alert(msg);
		//$("#formID input:checkbox:checked").length > 0
		return success;
	}
}
usrVal.init({
	newsubmit     : $('#dbo_user_new_submit'),
	editsubmit    : $('#dbo_user_edit_submit'),
	orgstr        : 'userorg_',
	rolestr       : 'userrole_',
	checkboxstr   : 'checkbox_',
	tableid       : $('#userorgrole')
});
// check this row background color change and add a text primary role somewhere
// other row background color change to normal and checkbox untick
// 

(function (){		
	$(document.body).on('click', '#userorgrole input[type=checkbox]', function() {
	    console.log('inside here');
		$tablerow = $('#userorgrole tr');
		$this = $(this);				
		$tablerow.find(':checkbox').not(this).prop('checked', false);
		$tablerow.not(this).css('background-color','#FFFFFF');
		if($this.prop('checked')) $this.closest('tr').css('background-color','#428bca');
		else $this.closest('tr').css('background-color','#FFFFFF');
	});
})();
function addrow(){
	var rowCount = $('#userorgrole tr').length;
	var itemCount =0;
	// count total row with item
	$('#userorgrole [id^=userrole_]').each(function (){
		if($(this).val()!='default') itemCount+=1;
	});

	// add new row to table using addTableRow function 
	// only can add 1 row new empty row at a time
	if(rowCount-itemCount === 1){	
		addTableRow($("#userorgrole"));
	}else{
		alert("Please select role")
	}

	// prevent button redirecting to new page
	return false;
}
function addTableRow(table)
{
	/*var ss = document.getElementById('search_suggest_'+rowid);
	ss.innerHTML = '';*/	
	/*console.log('Before inside');*/
	var lastdigitindex;
	// clone the last row in the table
	var $tr = $(table).find("tbody tr:last").clone();
	// get tr id
	$tr.attr("id", function(){
		// Get the last number on the id
		var lastnum = this.id.substring(this.id.lastIndexOf("_")+1);			
		// create a unique name for the new row by incrementing
	    // the number for the previous field by 1
		return this.id.substring(0,this.id.lastIndexOf("_")+1)+ ++lastnum		
	});
	// get the name attribute for the input and select fields
	$tr.find("input,select,div").attr("id", function()
	{
	  // Get the last number
	  var lastnum = this.id.substring(this.id.lastIndexOf("_")+1);	  		  
	  lastdigitindex = ++lastnum;
	  //console.log('lastdigit '+lastdigitindex);
	  // create a unique name for the new field by incrementing
	  // the number for the previous field by 1
	  return this.id.substring(0,this.id.lastIndexOf("_")+1)+ lastnum

	// repeat for id attributes
	}).attr("name", function(){
	// Get the last number
	  var lastnum = this.name.substring(this.name.lastIndexOf("_")+1);	  		  
	  lastdigitindex = ++lastnum;
	  //console.log('lastdigit '+lastdigitindex);
	  // create a unique name for the new field by incrementing
	  // the number for the previous field by 1
	  return this.name.substring(0,this.name.lastIndexOf("_")+1)+ lastnum

	});
	$tr.find("select [id^=userrole_]").removeAttr('value');
	$tr.find(":checkbox").attr('checked', false);
	$tr.css('background-color','#FFFFFF');	

	// append the new row to the table
	$(table).find("tbody tr:last").after($tr);

};
function removerow(element){	
	var rowCount = $('#userorgrole tr').length;

	if(rowCount-1>1) {
		removeTableRow($(element).closest('tr').attr('id'));
	}
	//console.log($(element).closest('tr').attr('id'));
}
function removeTableRow(trId) {
    $(document.getElementById(trId)).remove();
}
</script>