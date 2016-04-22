<style type="text/css">
#dbotab_joblisting_detail_tbody_2 .caption{
	display:none;
}
</style>
<script type="text/javascript">
function populateInput(obj,elemt,value,readonly){
	if(value==0){
		// create the html element
		$element = $('<label class="col-md-2" for="'+obj.carv_carid+'_'+obj.carv_code+'">'+obj.carv_code+' </label> <div class="input-group col-md-5"><input type="text" class="form-control" id="'+obj.carv_carid+'_'+obj.carv_code+'" name="carcode['+obj.carv_code+']" ><span class="input-group-addon">'+obj.carv_unit+'</span></div>');
	}else{
		if(readonly){
			$element = $('<label class="col-md-2" for="'+obj.carv_carid+'_'+obj.carv_code+'">'+obj.carv_code+' </label> <div class="input-group col-md-5"><input type="text" class="form-control" id="'+obj.carv_carid+'_'+obj.carv_code+'" name="carcode['+obj.carv_code+']"  value="'+value.caval_value+'" readonly><span class="input-group-addon">'+obj.carv_unit+'</span></div>');		
		}else{
			$element = $('<label class="col-md-2" for="'+obj.carv_carid+'_'+obj.carv_code+'">'+obj.carv_code+' </label> <div class="input-group col-md-5"><input type="text" class="form-control" id="'+obj.carv_carid+'_'+obj.carv_code+'" name="carcode['+obj.carv_code+']"  value="'+value.caval_value+'"><span class="input-group-addon">'+obj.carv_unit+'</span></div>');		

		}
	}		

	// append to data div
	elemt.append($element);
}
function getCarton(carid, tbody, jobid,readonly){
	jobid= typeof jobid !== 'undefined' ? jobid : 0;
	readonly= typeof readonly !== 'undefined' ? readonly : false;

	if($('#cartonimage').length > 0) $('#cartonimage').remove(); // remove the image if there is
	// design the new row
	var newrow = $('<tr id="cartonimage"><td id="imagetd" colspan="2"></td><td id="cartonvalue" colspan="2"></td></tr>');
	$('#'+tbody).append(newrow);

	$.ajax({
		url: "<?php echo WEB_HREF.'/PMFunc/getCartonInfo';?>",
		type: "post",
		async:false,
		dataType: 'json',
		data: {'carid' : carid, 'jobid' : jobid},
		success: function (data,textStatus,jqXHR) {
			console.log(data);
			// show image
			var imagelocation = data.imageinfo;

			// remove the image tag
			$('#imgcb').remove();
			// declare the image tag
			var imgtag = $('<img id="imgcb" alt="cartonbox" class="img-responsive img-thumbnail ">');
			// update the image location
			imgtag.attr('src',imagelocation);		
			// append the image tag
			$('#imagetd').append(imgtag);

			// populate variable input
			for(var i=0;i<data.variable.length;i++){
				//populateInput(data.variable[i],$('#cartonvalue'));
				if(data.boxsize == 0)	populateInput(data.variable[i],$('#cartonvalue'),0);
				else populateInput(data.variable[i],$('#cartonvalue'),data.boxsize[i],readonly);
			}
		},
		error: function (){
			//console.log(data);
		}
	});
}

</script>
<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'joblisting.conf.php');
require_once(DOC_DIR.DS.'inc'.DS.'appFunc.php');
require_once(CLASS_DIR.DS.'DocManUI'.DS.'DocManUI.php');
require_once(CORE_DIR.DS.'inc'.DS.'DocumentManager.inc.php');

function displayCartonDetail($col, $colVal, $data=array(), $html=null){
	$str = "<script>getCarton(".$colVal.",'dbotab_joblisting_detail_tbody_1',".$data['js_id'].",true)</script>";
	$html .= $str;

	return $html;
}
function showFileHistory($col, $colVal, $data=array(), $html=null){
	$docUI = new DocManUI();
	$html = $docUI->getFileList($data['js_id'],'js_id');

	return $html;
}
function showPercentageDet($col, $colVal, $data=array(), $html=null){

	$newhtml = '<div id="dbo_jobsheet_detail_cont_js_distortion_value" class="value_container" inputtype="text" inputtypesize="">'.$colVal.' %</div>';

	return $newhtml;
}
# customization
function dbo_joblisting_customize(&$dbo){
	global $GLOBAL,$USER,$DB;
	autoDetailTableInput($dbo);
	list($currentOrgId, $currentOrgExternal) = $DB->getRow("select org_id, org_external from fcuserorgrole join fcorg on uor_orgid = org_id where uor_id = :0 and uor_rolid = :1", array($USER->userorgroleid, $USER->roleid));
	
	if($currentOrgExternal=='Y'){
		$dbo->whereSQL = "js_orgid = ".$USER->orgid;
	}	

	if( isset($_GET['active']) && $_GET['active'] == 'true' ){
		$GLOBAL['actvorder'] = true;
	}elseif ( !isset($_GET['page'])  ){
		unset($GLOBAL['actvorder']);
	}	
	if( isset($GLOBAL['actvorder'])  && $GLOBAL['actvorder'] ){
		$dbo->whereSQL .= " and js_status != 'COMPLETED'";
	}

}


# final rendering
$dbo->render();
?>
