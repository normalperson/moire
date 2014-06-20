<style type="text/css">
#dbotab_jobsheet_detail_tbody_2 .caption{
	display:none;
}
#dbotab_jobsheet_edit_tbody_2 .caption{
	display:none;
}
#dbo_jobsheet_new_cont_js_distortion{
	min-width: 200px;
}
#dbo_jobsheet_edit_cont_js_distortion{
	min-width: 200px;
}
</style>
<script type="text/javascript">
function populateInput(obj,elemt,value,readonly){
	console.log('readonly = '+readonly);
	if(value==0){
		// create the html element
		$element = $('<label class="col-md-2 mandatory" for="'+obj.carv_carid+'_'+obj.carv_code+'">'+obj.carv_code+' </label> <div class="input-group col-md-5"><input type="text" class="form-control" id="'+obj.carv_carid+'_'+obj.carv_code+'" name="carcode['+obj.carv_code+']" ><span class="input-group-addon">'+obj.carv_unit+'</span></div>');
	}else{
		if(readonly){
			$element = $('<label class="col-md-2 mandatory" for="'+obj.carv_carid+'_'+obj.carv_code+'">'+obj.carv_code+' </label> <div class="input-group col-md-5"><input type="text" class="form-control" id="'+obj.carv_carid+'_'+obj.carv_code+'" name="carcode['+obj.carv_code+']"  value="'+value.caval_value+'" readonly><span class="input-group-addon">'+obj.carv_unit+'</span></div>');		
		}else{
			$element = $('<label class="col-md-2 mandatory" for="'+obj.carv_carid+'_'+obj.carv_code+'">'+obj.carv_code+' </label> <div class="input-group col-md-5"><input type="text" class="form-control" id="'+obj.carv_carid+'_'+obj.carv_code+'" name="carcode['+obj.carv_code+']"  value="'+value.caval_value+'"><span class="input-group-addon">'+obj.carv_unit+'</span></div>');		

		}		
	}	
	// $('#'+obj.carv_carid+'_'+obj.carv_code).rules("add", {required:true, messages: { required:'Please fill up '+obj.carv_code}});	// validation

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
$( document ).ready(function() {
  // Handler for .ready() called.
	$('#dbo_jobsheet_new_js_carid').change(function(){
		$this = $(this);	
		if($this.val()!= 'default'){		
			getCarton($this.val(),'dbotab_jobsheet_new_tbody_1');				
		}
	});
	$('#dbo_jobsheet_edit_js_carid').change(function(){
		$this = $(this);	
		if($this.val()!= 'default'){		
			getCarton($this.val(),'dbotab_jobsheet_edit_tbody_1');				
		}
	});
});

</script>

<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'jobsheet.conf.php');
require_once(DOC_DIR.DS.'inc'.DS.'appFunc.php');
require_once(CLASS_DIR.DS.'DocManUI'.DS.'DocManUI.php');
require_once(CORE_DIR.DS.'inc'.DS.'DocumentManager.inc.php');

function displayCartonEdit($col, $colVal, $data=array(), $html=null){
	$str = "<script>getCarton(".$colVal.",'dbotab_jobsheet_edit_tbody_1',".$data['js_id'].")</script>";
	$html .= $str;

	return $html;
}
function displayCartonDetail($col, $colVal, $data=array(), $html=null){
	$str = "<script>getCarton(".$colVal.",'dbotab_jobsheet_detail_tbody_1',".$data['js_id'].",true)</script>";
	$html .= $str;

	return $html;
}
function showinfo($col, $colVal, $data=array(), $html=null){
	$html = '<img src="..'.DS.'..'.DS.'image'.DS.'info'.DS.'attachementinfo.png" alt="..." class="img-responsive img-thumbnail ">';

	return $html;
}
function showFileHistory($col, $colVal, $data=array(), $html=null){
	$docUI = new DocManUI();
	$html = $docUI->getFileList($data['js_id'],'js_id');

	return $html;
}
function showPercentage($col, $colVal, $data=array(), $html=null){

	$html = '<div class="input-group">'.$html.'<span class="input-group-addon">%</span></div>';
	return $html;
}	
function showPercentageDet($col, $colVal, $data=array(), $html=null){

	$newhtml = '<div id="dbo_jobsheet_detail_cont_js_distortion_value" class="value_container" inputtype="text" inputtypesize="">'.$colVal.' %</div>';

	return $newhtml;
}


# customization
function dbo_jobsheet_customize(&$dbo){
	$dbo->newModifier = 'dbo_jobsheet_custom_new';
	$dbo->editModifier = 'dbo_jobsheet_custom_edit';
}

function dbo_jobsheet_custom_new($table, $cols){

	global $DB,$JOBARRAY,$USER;
	$ret = array();
	//$DB->showsql = true;

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
	// handle file upload if empty 
	if(!empty($cols['attachment']['name'])) {
		/*$ret = "Attachement cannot be empty";
		return $ret;*/
		unset($cols['attachment']);
	}
	else{
		$attachment = json_decode($cols['attachment'],true);
		// validate rar or zip format

		unset($cols['attachment']); 
	}
	
	$remark = $cols['remark']; // get the remark and insert after insert queue
	unset($cols['remark']); // unset remark
	unset($cols['info']); // unset image info
	// category handling part 1
	$cols['js_primcat'] = getHighestPriorityCat($cols['jobcategory']);
	$catstring = $cols['jobcategory'];
	unset($cols['jobcategory']);

	// output requirement handling part 1
	$outputreq = $cols['joboutput'];
	unset($cols['joboutput']);	
	
	$cols['js_orgid'] = $USER->orgid; // assign org id
	$cartonarr = $_POST['carcode']; // get the carton array
	$cartonid = $cols['js_carid']; // get the carton id selected by user
	$ok = $DB->doInsert($table, $cols);
	$jobid = $DB->lastInsertId('mjobsheet_js_id_seq');
	if(!$ok){
		$ret[] = $DB->lastError;
	}else{
		// category handling part 2
		$catarr = explode(",",$catstring);
		foreach ($catarr as $key => $value) {
			// insert into mjobcat
			$data = array('jc_jsid' => $jobid, 'jc_jclid' => $value);
			$ok = $DB->doInsert('mjobcat', $data);
		}

		// output requirement handling part 2
		$oparr = explode(",",$outputreq);
		foreach ($oparr as $key => $value) {
			// insert into mjoboutput
			$opdata = array('jo_jsid' => $jobid, 'jo_outputcode' => $value);
			$ok = $DB->doInsert('mjoboutput', $opdata);
		}
		foreach ($cartonarr as $key => $value) {
			$cartondata = array(
				'caval_value' => $value,
				'carval_carcode' => $key,
				'carval_carid' => $cartonid,
				'carval_jsid' => $jobid
				);
			$ok = $DB->doInsert('mjscartonvalue', $cartondata);			
		}

		// upload the the right place...
		$doc = new DocumentManager();
		$doc->saveMultipleFile($attachment,$jobid,'js_id');


		
		$JOBARRAY = array('casekey' => $jobid,
			              'casetype' => 'jobsheet',
			              'comment' => trim($remark));
		

	}
	return $ret;
}

// yet to modify
function dbo_jobsheet_custom_edit($table, $cols, $wheres){
	global $DB,$REMARK,$FLOWDECISION;
	$ret = array();
	$jobid = $wheres["js_id"];
	// handle file upload if empty 
	if($cols['attachment']['name'] == "") {
		/*$ret = "Attachement cannot be empty";
		return $ret;*/
		unset($cols['attachment']);
	}
	else{
		unset($cols['attachment']);
		// validate rar or zip format
		// upload the the right place...
	}

	$REMARK = $cols['remark']; // get the remark and insert after insert queue
	unset($cols['remark']); // unset remark
	unset($cols['info']); // unset image info
	unset($cols['fileinfo']); // unset file info

	$cartonarr = $_POST['carcode']; // get the carton array
	$cartonid = $cols['js_carid']; // get the carton id selected by user
	// category handling part 1
	$cols['js_primcat'] = getHighestPriorityCat($cols['jobcategory']);
	$catstring = $cols['jobcategory'];
	unset($cols['jobcategory']);

	// output requirement handling part 1
	$outputreq = $cols['joboutput'];
	unset($cols['joboutput']);	

	$ok = $DB->doUpdate($table, $cols, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
		$FLOWDECISION = false;
	}else{
		// category handling part 2
		$catarr = explode(",",$catstring);
		// delete the existing category
		$sql = "delete from mjobcat where jc_jsid = :0 ";
		$ok = $DB->Execute($sql,array($jobid));
		foreach ($catarr as $key => $value) {
			// insert into mjobcat
			$data = array('jc_jsid' => $jobid, 'jc_jclid' => $value);
			$ok = $DB->doInsert('mjobcat', $data);
		}
		// delete the existing output requirement
		$sql = "delete from mjoboutput where jo_jsid = :0 ";
		$ok = $DB->Execute($sql,array($jobid));

		// output requirement handling part 2
		$oparr = explode(",",$outputreq);
		foreach ($oparr as $key => $value) {
			// insert into mjoboutput
			$opdata = array('jo_jsid' => $jobid, 'jo_outputcode' => $value);
			$ok = $DB->doInsert('mjoboutput', $opdata);
		}

		// delete existing job info
		$sql = "delete from mjscartonvalue where carval_jsid = :0";
		$ok = $DB->Execute($sql,array($jobid));
		foreach ($cartonarr as $key => $value) {
			$cartondata = array(
				'caval_value' => $value,
				'carval_carcode' => $key,
				'carval_carid' => $cartonid,
				'carval_jsid' => $jobid
				);
			$ok = $DB->doInsert('mjscartonvalue', $cartondata);			
		}

		$FLOWDECISION=true;
		
	}
	return $ret;
}

# final rendering
$dbo->render();
?>
