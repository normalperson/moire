<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'reqverification.conf.php');

# customization
function dbo_reqverification_customize(&$dbo){
  $dbo->editModifier = 'dbo_reqverification_custom_edit';
}


function dbo_reqverification_custom_edit($table, $cols, $wheres){

  global $DB,$FLOWDECISION,$REMARK;
  $ret = array();
  $REMARK = $cols['remark'];
  unset($cols['remark']);
  if($cols['js_decision'] == 'Assign')  $cols['js_status'] = 'PENDING ARTIST ACKNOWLEDGE JOB';
  else $cols['js_status'] = 'PENDING CUSTOMER RESOLUTION';
  $ok = $DB->doUpdate($table, $cols, $wheres);
  if(!$ok){
    $ret[] = $DB->lastError;
    $FLOWDECISION = false;
  }else{
    $FLOWDECISION = true;
  }
  return $ret;
}

# final rendering
$dbo->render();
?>
<script type="text/javascript">
$( document ).ready(function() {
  $('#dbo_reqverification_edit_js_assignto').attr('disabled','disabled');

  $('#dbo_reqverification_edit_js_decision').change(function(){
  	 if($(this).val() == 'Revert'){
  	 	$('#dbo_reqverification_edit_js_assignto').attr('disabled','disabled').val('');
     }
     else{
     	$('#dbo_reqverification_edit_js_assignto').removeAttr('disabled');	
     }
  });                                           
});
</script>