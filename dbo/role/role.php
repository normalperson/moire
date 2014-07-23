<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'role.conf.php');

# customization
global $HTML;
/*$HTML->addJS('js/jquery.min.js');*/
//$HTML->addJS('js/popup.js');

$dbo->newModifier = 'role_custom_new';
function role_custom_new($table, $cols){
	global $DB;
	$ret = array();		
	$roledata = $cols;
	$tablepostname = 'roleperm';
	$tableprefix = $DB->prefix;
	$tablename = $tableprefix.$tablepostname;
	unset($roledata['rol_permission']);
	$ok = $DB->doInsert($table, $roledata);
	$fcroleid = $DB->lastInsertId('fcrole_rol_id_seq');
	if($ok){		
		foreach($cols['rol_permission'] as $val){
			$rolepermdata = Array('rp_rolid' => $fcroleid , 'rp_pmsid' => $val);
			$ok = $DB->doInsert($tablename, $rolepermdata);	
			if(!$ok){
				$ret[] = $DB->lastError;
			}
		}
	}else{
		$ret[] = $DB->lastError;
	}
	return $ret;
}


$dbo->editModifier = 'role_custom_edit';
function role_custom_edit($table, $cols, $wheres){
	global $DB;
	$ret = array();

	$roledata = $cols;
	$tablepostname = 'roleperm';
	$tableprefix = $DB->prefix;
	$tablename = $tableprefix.$tablepostname;
	unset($roledata['rol_permission']);
	$ok = $DB->doUpdate($table, $roledata, $wheres);
	// get role id
	$roleid = $DB->GetOne("select rol_id from fcrole where rol_code = :0",array($cols['rol_code']));
	if($roleid){
		$sql = "delete from fcroleperm where rp_rolid = :0";
		$ok = $DB->Execute($sql,array($roleid));
		if($ok && count( $cols['rol_permission'] ) > 0){
			$rolpermission = explode(",", $cols['rol_permission']);
			foreach($rolpermission as $val){
				$rolepermdata = Array('rp_rolid' => $roleid , 'rp_pmsid' => trim($val));
				$ok = $DB->doInsert($tablename, $rolepermdata);	
				if(!$ok){
					$ret[] = $DB->lastError;
				}
			}		
		}
	}else{
		$ret[] = $DB->lastError;
	}
	return $ret;
}


$dbo->deleteModifier = 'role_custom_delete';
function role_custom_delete($table, $wheres){
	global $DB;
	$ret = array();	
	// get the role code
	$rolid = $wheres['rol_id'];
	$ok = $DB->doDelete($table, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}else{
		$tablepostname = 'roleperm';
		$tableprefix = $DB->prefix;
		$tablename = $tableprefix.$tablepostname;
		// delete the record inside fcroleperm
		$wheres = array('rp_rolid' => $rolid);
		$ok = $DB->doDelete($tablename, $wheres);
		if(!$ok) $ret[] = $DB->lastError;
	}
	return $ret;
}

/*
$dbo->searchModifier = 'role_custom_search';
function role_custom_search(&$search){
}
*/

# final rendering
$dbo->render();
?>
<script type="text/javascript">
// handle new role screen
var newRole = {
     init : function (config){
		this.config = config;
		this.addCheckAll();
		this.bindEvent();
	},
	addCheckAll : function(){
		var self = newRole,		
		    lastrow = self.config.permissiondiv.closest('table').find('tr:last');		
		lastrow.after(self.config.checkallhtml);
	},
	bindEvent : function(){
		$(this.config.permissiondiv).on({
			click : this.checkBoxControl
		},this.config.checkall);
	},
	checkBoxControl : function(){
		var self = newRole,
		    $this = $(this),
		    checkboxes = self.config.permissiondiv.closest('table').find(':checkbox');
		if($this.prop('checked')){
			checkboxes.prop('checked', true);
		}else{
			 checkboxes.removeAttr('checked');
		}
	}
}
if($('#dbo_role_new_cont_rol_permission').attr("id")){
	newRole.init({
		permissiondiv     : $('#dbo_role_new_cont_rol_permission'),
		checkallhtml      : $('<tr><td><label for="checkall"><input type="checkbox" name="checkall" id="checkall" />Check All</label></td></tr>'),
		checkall          : '#checkall'
	});
}

var editRole = {
	init : function (config){
		this.config = config;
		this.addCheckAll();
		this.selectCheckBox();
		this.bindEvent();
	},
	selectCheckBox : function (){
		var self = editRole;
		$.ajax({
    		url : 'getrole',
    		type: 'POST',
			data:  { rolecode: self.config.inprolecode.val()},
			dataType: 'json',
			success: function(results) {
				if(results.length > 0){
					for (var i = 0; i < results.length; i++){
						$('input[value="'+results[i][0]+'"]').attr('checked','checked');
					}
				}
			},
			error: function (request, status, error) {
		        console.log(request.responseText);
		    }
		});
	},
	addCheckAll : function(){
		var self    = editRole,		
		    lastrow = self.config.permissiondiv.closest('table').find('tr:last');		
		lastrow.after(self.config.checkallhtml);
	},
	bindEvent : function(){
		$(this.config.permissiondiv).on({
			click : this.checkBoxControl
		},this.config.checkall);
	},
	checkBoxControl : function(){
		var self       = editRole,
		    $this      = $(this),
		    checkboxes = self.config.permissiondiv.closest('table').find(':checkbox');
		if($this.prop('checked')){
			checkboxes.prop('checked', true);
		}else{
			 checkboxes.removeAttr('checked');
		}
	}
}
if($('#dbo_role_edit_cont_rol_permission').attr("id")){
	editRole.init({
		permissiondiv     : $('#dbo_role_edit_cont_rol_permission'),
		checkallhtml      : $('<tr><td><label for="checkall"><input type="checkbox" name="checkall" id="checkall" />Check All</label></td></tr>'),
		checkall          : '#checkall',
		inprolecode       : $('#dbo_role_edit_rol_code')
	});
}
</script>