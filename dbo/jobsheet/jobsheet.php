<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'jobsheet.conf.php');

function fiveinputinarow_new($col, $colVal, $data=array(), $html=null){
	$colname = $col;
	
	$inputname = substr($colname,1,strlen($colname)-1);
	// get the input name
	$html = '<div id="'.'dbo_jobsheet_new_'.$inputname.'"  inputtype="text" inputtypesize="">';

	for($i=1;$i<=5;$i++){
		$html .= '<input type="text" class="fiveinarow" name="'.'dbo_jobsheet_new_'.$inputname.$i.'" id="'.'dbo_machinesetup_new_'.$inputname.$i.'" value="">';
	}
	$html .="</div>";

	return $html;
}
function fiveinputinarow_detail($col, $colVal, $data=array(), $html=null){
	$colname = $col;
	
	$inputname = substr($colname,1,strlen($colname)-1);
	// get the input name
	$html = '<div id="'.'dbo_jobsheet_detail_'.$inputname.'"  inputtype="text" inputtypesize="">';

	for($i=1;$i<=5;$i++){
		$html .= '<input type="text" class="fiveinarow" name="'.'dbo_jobsheet_detail_'.$inputname.$i.'" id="'.'dbo_machinesetup_new_'.$inputname.$i.'" value="">';
	}
	$html .="</div>";

	return $html;
}
# customization
function dbo_jobsheet_customize(&$dbo){
	$dbo->newModifier = 'dbo_jobsheet_custom_new';
}

function dbo_jobsheet_custom_new($table, $cols){

	global $DB;
	$ret = array();
	/*
	Screen
	1. Modify the on change drop down on showing the image
	2. Show the instruction on showing image

	Logic
	1. Choose the primary category
	2. save the request by and create by
	3. save the created date
	4. insert remark
	5. move the uploaded zip file (verify the zip file format)


	*/
	$ok = $DB->doInsert($table, $cols);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

# final rendering
$dbo->render();
?>
<script type="text/javascript">
function populateInput(obj,elemt){
	// create the html element
	$element = $('<label class="col-md-2" for="'+obj.carv_carid+'_'+obj.carv_code+'">'+obj.carv_code+' </label> <div class="input-group col-md-5"><input type="text" class="form-control" id="'+obj.carv_carid+'_'+obj.carv_code+'" name="'+obj.carv_carid+'_'+obj.carv_code+'" ><span class="input-group-addon">'+obj.carv_unit+'</span></div>');

	// append to data div
	elemt.append($element);
}
$('#dbo_jobsheet_new_js_carcode').change(function(){
	$this = $(this);	
	if($this.val()!= 'default'){		

		if($('#cartonimage').length > 0) $('#cartonimage').remove();
		// design the new row
		var newrow = $('<tr id="cartonimage"><td id="imagetd" colspan="2"></td><td id="cartonvalue" colspan="2"></td></tr>');
		$('#dbotab_jobsheet_new_tbody_2').append(newrow);

		$.ajax({
			url: "getCartonInfo",
			type: "post",
			async:false,
			dataType: 'json',
			data: {'carid' : $this.val()},
			success: function (data,textStatus,jqXHR) {
				console.log(data);
				// show image
				var imagelocation = '';

				if(window.location.href.indexOf("?") > 0) imagelocation = window.location.href.substring(0,window.location.href.indexOf("?"))+'/../../../image/boxtype/'+data.imageinfo.fd_file_name;
				else imagelocation = window.location+'/../../../image/boxtype/'+data.imageinfo.fd_file_name;
				// remove the image tag
				$('#imgcb').remove();
				// declare the image tag
				var imgtag = $('<img id="imgcb" alt="cartonbox" class="img-responsive img-thumbnail ">');
				// update the image location
				imgtag.attr('src',imagelocation);		
				// append the image tag
				$('#imagetd').append(imgtag);

				// populate variable input
				for(var i=0;i<data.var.length;i++){
					populateInput(data.var[i],$('#cartonvalue'));
				}
			},
			error: function (){
				console.log(data);
				//showAlert(changeqtyerror);
			}
		});

	}
});
</script>