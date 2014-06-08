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
  $ok = $DB->doUpdate($table, $cols, $wheres);
  if(!$ok){
    $ret[] = $DB->lastError;
    $FLOWDECISION = false;
  }else{
    $FLOWDECISION = true;
    // insert remark
  }
  return $ret;
}

# final rendering
$dbo->render();
?>
<script type="text/javascript">
$('#dbo_reqverification_editform > fieldset > legend').css({'background-color': '#D8D8D8',
                                                            'padding-left': '8px'});
/*$('#dbo_reqverification_edit_cancel').css('display','none');
$('#dbo_reqverification_edit_submit').css('display','none');*/
$( document ).ready(function() {
  $('#dbo_reqverification_edit_js_assignto').attr('disabled','disabled')
                                            .css("background-color","#E6E6E6");

  $('#dbo_reqverification_edit_js_decision').change(function(){
  	 console.log($(this).val());
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