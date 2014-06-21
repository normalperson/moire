<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'reqverification.conf.php');

function defaultTime($col, $colVal, $data=array(), $html=null){
  global $DB;
  //vd($html);
  //dbo_reqverification_edit_js_manrequiretime
  $defminutes = $DB->GetOne("select getreqtimebyjob(".$data['js_id'].")");
  $html .= "<script>$('#dbo_reqverification_edit_js_requiretime').val(".$defminutes.");</script>";

  return $html;
}

# customization
function dbo_reqverification_customize(&$dbo){
  $dbo->editModifier = 'dbo_reqverification_custom_edit';
}


function dbo_reqverification_custom_edit($table, $cols, $wheres){

  global $DB,$FLOWDECISION,$REMARK;
  $ret = array();
  $REMARK = $cols['remark'];
  unset($cols['remark']);
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
  $('#dbo_reqverification_edit_js_assignto').attr('disabled','disabled')
                                            .css("background-color","#E6E6E6");

  $('#dbo_reqverification_edit_js_decision').change(function(){
  	 if($(this).val() == 'Revert'){
  	 	$('#dbo_reqverification_edit_js_assignto').attr('disabled','disabled')
                                            .css("background-color","#E6E6E6");
     }
     else{
     	$('#dbo_reqverification_edit_js_assignto').removeAttr('disabled')
                                            .css("background-color","#ffffff");	
     }
  });                                           
});
</script>