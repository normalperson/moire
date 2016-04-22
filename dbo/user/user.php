<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'user.conf.php');

function neworgrole(){
	global $DB,$USER;

	$orgpostname = 'org';
	$tableprefix = $DB->prefix;
	$tblorg = $tableprefix.$orgpostname;

	$orgdata = $DB->GetArray("select org_id,org_name from $tblorg where org_status = :0",array('ACTIVE'));

	$orgHTML = "<select id='userorg_1' name='userorg_1'><option value='default'>--Select Org--</option>";
	foreach ($orgdata as $data){
		$orgHTML .= "<option selected value='".$data['org_id']."'>".$data['org_name']."</option>";
	}
	$orgHTML .= "</select>"; 

	$rolepostname = 'role';
	$tableprefix = $DB->prefix;
	$tblrole = $tableprefix.$rolepostname;

	if($USER->userid == 'admin') $roledata = $DB->GetArray("select rol_id,rol_name from $tblrole");
	else $roledata = $DB->GetArray("select rol_id,rol_name from $tblrole where rol_name not in (:0,:1)",array('admin','ADMIN'));

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
	global $DB, $USER;
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
			$orgdata = $DB->GetArray("select org_id,org_name from $tblorg where org_status = :0",array('ACTIVE'));

			$orgHTML = "<select id='userorg_$num' name='userorg_$num'><option value='default'>--Select Org--</option>";
			foreach ($orgdata as $data){
				if($data['org_id'] == $val['uor_orgid']) $orgHTML .= "<option selected value='".$data['org_id']."'>".$data['org_name']."</option>";
				else  $orgHTML .= "<option value='".$data['org_id']."'>".$data['org_name']."</option>";
			}
			$orgHTML .= "</select>"; 

			if($USER->userid == 'admin') $roledata = $DB->GetArray("select rol_id,rol_name from $tblrole ");
			else $roledata = $DB->GetArray("select rol_id,rol_name from $tblrole where rol_name not in (:0,:1)",array('ADMIN','ADMIN'));
			#$roledata = $DB->GetArray("select rol_id,rol_code,rol_name from $tblrole where rol_status = :0 ",array('ACTIVE'));

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

		$roledata = $DB->GetArray("select rol_id,rol_name from $tblrole ");

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

# customization


$dbo->newModifier = 'user_custom_new';
function user_custom_new($table, $cols){
	global $DB;
	$ret = array();
	$rolecount=0;

	/*validation*/
	// check is there space between userid
	if(preg_match('/\s/',$cols['usr_userid'])>0) $ret = array( tl('Userid does not allow to have space in between',false,'valmessage') );

	// validate email address format
	if(!filter_var($cols['usr_email'], FILTER_VALIDATE_EMAIL)) $ret =  array_merge($ret,array( tl('Invalid email address format',false,'valmessage') )); 

	if(count($ret) > 0) return $ret;

	# check userid availability
	$cnt = $DB->getOne("select count(*) from ".$DB->prefix."user where usr_userid = :0", array($cols['usr_userid']));
	if($cnt) return array( tl('Userid not available',false,'valmessage') );

	$orgpostname = 'org';
	$tableprefix = $DB->prefix;
	$tblorg = $tableprefix.$orgpostname;

	$rolepostname = 'role';
	$tableprefix = $DB->prefix;
	$tblrole = $tableprefix.$rolepostname;	

	$relpostname = 'userorgrole';
	$tableprefix = $DB->prefix;
	$tblrel = $tableprefix.$relpostname;

	$rowkey = array();
	foreach($_POST as $key => $val){	
		$pos = strpos($key, 'userrole_');
		// if the array key match userrole_ && the value is not 'dafault'
		if ( $pos !== false && $val != 'default') {
			$temp = explode("_", $key);
			$rowkey[] = $temp[1];
		}
	}
	$userid = $cols['usr_userid'];
	unset($cols['userrole']);
	$cols['usr_password'] = User::genPassword($cols['usr_password']);
	$ok = $DB->doInsert($table, $cols);
	if($ok){
		// insert into vrelationship
		foreach($rowkey as $i){
			// get org info
			list($orgid,$orgname) = $DB->GetRow("select org_id,org_name from $tblorg where org_id = :0",array($_POST['userorg_'.$i]));
			// get role info
			list($roleid,$rolename) = $DB->GetRow("select rol_id,rol_name from $tblrole where rol_id = :0",array($_POST['userrole_'.$i]));
			// check if primary
			if(isset($_POST['checkbox_'.$i]) && $_POST['checkbox_'.$i] == 1) $reltype = 1;
			else $reltype = null; 
			$pos = strpos($key, 'userrole_');
			$sql = "INSERT INTO $tblrel(
	            uor_usrid, uor_orgid,  uor_rolid,uor_seq)
	    		VALUES (:0, :1, :2,:3)";	
	    	$ok = $DB->Execute($sql,array($userid,$orgid,$roleid,$reltype));
	    	if(!$ok) $ret[] = $DB->lastError;
		}
		
	}else{
		$ret[] = $DB->lastError;
	}
	return $ret;
}


$dbo->editModifier = 'user_custom_edit';
function user_custom_edit($table, $cols, $wheres){
	global $DB, $USER;
	$ret = array();
	$rolecount=0;
	$orgpostname = 'org';
	$tableprefix = $DB->prefix;
	$tblorg = $tableprefix.$orgpostname;

	$rolepostname = 'role';
	$tableprefix = $DB->prefix;
	$tblrole = $tableprefix.$rolepostname;	

	$relpostname = 'userorgrole';
	$tableprefix = $DB->prefix;
	$tblrel = $tableprefix.$relpostname;
	$rowkey = array();
	foreach($_POST as $key => $val){	
		$pos = strpos($key, 'userrole_');
		// if the array key match userrole_ && the value is not 'dafault'
		if ( $pos !== false && $val != 'default') {
			$temp = explode("_", $key);
			$rowkey[] = $temp[1];
		}
	}

	$userid = $cols['usr_userid'];
	unset($cols['userrole']);
	/* if(isset($cols['usr_password'])){
		$oripassword = $DB->getOne("select usr_password from ".$DB->prefix."user where usr_userid = :0", array($wheres['usr_userid']));
		if($oripassword==$cols['usr_password'] || empty($cols['usr_password'])){
			unset($cols['usr_password']);
		}
	}
	$cols['usr_password'] = User::genPassword($cols['usr_password']); */
	// if(isset($cols['currpassword'])){
		// $p = $DB->getOne("select usr_password from ".$DB->prefix."user where usr_userid = :0", array($USER->userid));
		// if(User::genPassword($cols['currpassword'])!=$p) return array("Invalid password");
		if(isset($cols['newpassword'])){
			if($cols['newpassword']!==$cols['newpassword2'])
				return array('New password not match');
			else
				$cols['usr_password'] = User::genPassword($cols['newpassword']);
		}
	// }
	foreach(array('currpassword', 'newpassword', 'newpassword2') as $tmp){
		if(array_key_exists($tmp, $cols)) unset($cols[$tmp]);
	}
	$ok = $DB->doUpdate($table, $cols, $wheres);
	if($ok){
		$sql = "Delete from $tblrel where uor_usrid = :0";
		$ok = $DB->Execute($sql,array($userid));
		if($ok){
			// insert into vrelationship
			foreach($rowkey as $i){	
				// get org info
				if(isset($_POST['userorg_'.$i]) && $_POST['userorg_'.$i]!='')
					list($orgid,$orgname) = $DB->GetRow("select org_id,org_name from $tblorg where org_id = :0",array($_POST['userorg_'.$i]));
				// get role info
				if(isset($_POST['userrole_'.$i]) && $_POST['userrole_'.$i]!='')
					list($roleid,$rolename) = $DB->GetRow("select rol_id,rol_name from $tblrole where rol_id = :0",array($_POST['userrole_'.$i]));
				// check if primary
				if(isset($_POST['checkbox_'.$i]) && $_POST['checkbox_'.$i] == 1) 
					$reltype = 1;
				else 
					$reltype = null; 
				$pos = strpos($key, 'userrole_');
				$sql = "INSERT INTO $tblrel(
		            uor_usrid, uor_orgid,  uor_rolid,uor_seq)
		    		VALUES (:0, :1, :2,:3)";	
		    	if(isset($orgid) && $orgid != '')
		    		$ok = $DB->Execute($sql,array($userid,$orgid,$roleid,$reltype));
		    	if(!$ok) $ret[] = $DB->lastError;
			}		
		}
		else{
			$ret[] = $DB->lastError;
		}
	}
	else{
		$ret[] = $DB->lastError;
	}
	return $ret;
}
/*
$dbo->deleteModifier = 'role_custom_delete';
function role_custom_delete($table, $wheres){
	global $DB;
	$ret = array();	
	// get the role code
	$rolcode = $wheres['rol_code'];
	$ok = $DB->doDelete($table, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}else{
		// delete the record inside vroleperm
		$table = 'vroleperm';
		$wheres = array('rp_rolcode' => $rolcode);
		$ok = $DB->doDelete($table, $wheres);
		if(!$ok) $ret[] = $DB->lastError;
	}
	return $ret;
}*/

$dbo->deleteModifier = 'user_custom_delete';
function user_custom_delete($table, $wheres){
	global $DB;
	$ret = array();
	$userid = $wheres['usr_userid'];
	$ok = $DB->doDelete($table, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}else{
		$relpostname = 'userorgrole';
		$tableprefix = $DB->prefix;
		$tblrel = $tableprefix.$relpostname;
		$wheres = array('uor_usrid' => $userid);
		$ok = $DB->doDelete($tblrel, $wheres);
		if(!$ok) $ret[] = $DB->lastError;
	}
	return $ret;
}

/*
$dbo->searchModifier = 'user_custom_search';
function user_custom_search(&$search){
}
*/

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