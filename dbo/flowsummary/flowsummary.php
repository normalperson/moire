<script type="text/javascript">
function populateInput(obj,elemt,value,readonly){
	console.log('readonly = '+readonly);
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
			console.log(data);
		}
	});
}

</script>
<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'flowsummary.conf.php');
require_once(DOC_DIR.DS.'inc'.DS.'appFunc.php');
require_once(CLASS_DIR.DS.'DocManUI'.DS.'DocManUI.php');
require_once(CORE_DIR.DS.'inc'.DS.'DocumentManager.inc.php');

function displayCartonDetail($col, $colVal, $data=array(), $html=null){
	$str = "<script>getCarton(".$colVal.",'dbotab_flowsummary_detail_tbody_1',".$data['js_id'].",true)</script>";
	$html .= $str;

	return $html;
}
function showFileHistory($col, $colVal, $data=array(), $html=null){
	$docUI = new DocManUI();
	$html = $docUI->getFileList($data['js_id'],'js_id');

	return $html;
}

# customization
function dbo_flowsummary_customize(&$dbo){
	global $GLOBAL,$USER;

	if( isset($_GET['type']) && isset($_GET['id']) ){
		$GLOBAL['type'] = $_GET['type'];
		$GLOBAL['actvid'] = $_GET['id'];
	}


	$dbo->whereSQL = " pmf_obj_type = '".$GLOBAL['type']."'
		and pmf_obj_id = '".$GLOBAL['actvid']."'
		and pmf_end_date is not null
		and pmf_end_by = '".$USER->userid."'";

}


# final rendering
$dbo->render();
?>
