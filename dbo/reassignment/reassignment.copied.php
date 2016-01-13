<style type="text/css">
#dbotab_reassignment_detail_tbody_2 .caption{
	display:none;
}
#dbotab_reassignment_edit_tbody_2 .caption{
	display:none;
}
#dbo_reassignment_new_cont_js_distortion{
	min-width: 200px;
}
#dbo_reassignment_edit_cont_js_distortion{
	min-width: 200px;
}
#detail-jbc_jsid-table.disabled {
	background : #EEE;
	border : 1px solid #D6D6D6;
}
#detail-jbc_jsid-table.disabled > tbody, #detail-jbc_jsid-table.disabled > tfoot {
	display:none;
}
#dbo_reassignment_detail_cont_js_distortion{
	font-family:FontAwesome,'Segoe UI','Open Sans','Helvetica Neue',Helvetica,Arial,sans-serif;
}
</style>
<script type="text/javascript">
var inpcnt = 0;
/*function populateInput(obj,elemt,value,readonly){
	inpcnt++;
	var inpid = 'carinp_'+inpcnt;
	if(value==0){
		// create the html element
		$element = $('<div class="form-group" ><label class="col-md-2 mandatory" for="'+inpid+'">'+obj.carv_code+' </label> <div class="input-group col-md-5"><input type="text" class="form-control" id="'+inpid+'" name="carcode['+obj.carv_code+']" ><span class="input-group-addon">'+obj.carv_unit+'</span></div></div>');
	}else{
		if(readonly){
			$element = $('<label class="col-md-2" for="'+obj.carv_carid+'_'+obj.carv_code+'">'+obj.carv_code+' </label> <div class="input-group col-md-5"><input type="text" class="form-control" id="'+obj.carv_carid+'_'+obj.carv_code+'" name="carcode['+obj.carv_code+']"  value="'+accounting.formatNumber(value.caval_value,2)+'" readonly><span class="input-group-addon">'+obj.carv_unit+'</span></div>');		
		}else{
			$element = $('<div class="form-group" > <label class="col-md-2 mandatory" for="'+inpid+'">'+obj.carv_code+' </label> <div class="input-group col-md-5"><input type="text" class="form-control" id="'+inpid+'" name="carcode['+obj.carv_code+']"  value="'+value.caval_value+'"><span class="input-group-addon">'+obj.carv_unit+'</span></div></div>');		
		}		
	}	

	// append to data div
	elemt.append($element);
	if(value==0 || !readonly) {
		$('#'+inpid).rules("add", { required:true, messages: { required:'Please fill up '+obj.carv_code}});	// validation
		$('#'+inpid).inputmask('decimal', { rightAlign: false , digits: 2 });
	}
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
			showError('Error occurred');
		}
	});
}*/
/*$( document ).ready(function() {
  // Handler for .ready() called.
	$('#dbo_reassignment_new_js_carid').change(function(){
		$this = $(this);	
		if($this.val()){
			getCarton($this.val(),'dbotab_reassignment_new_tbody_1');				
		}
		else $('#cartonimage').remove();
	}).change();
	$('#dbo_reassignment_edit_js_carid').change(function(){
		$this = $(this);	
		if($this.val()){
			getCarton($this.val(),'dbotab_reassignment_edit_tbody_1');				
		}else $('#cartonimage').remove();
	})
});*/
</script>
<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'reassignment.conf.php');
require_once(DOC_DIR.DS.'inc'.DS.'appFunc.php');
require_once(CLASS_DIR.DS.'DocManUI'.DS.'DocManUI.php');
require_once(CORE_DIR.DS.'inc'.DS.'DocumentManager.inc.php');
function displayCartonEdit($col, $colVal, $data=array(), $html=null){
	if ($colVal) {
		$str = "<script>$(function () {getCarton(".$colVal.",'dbotab_reassignment_edit_tbody_1',".$data['js_id'].")})</script>";
		$html .= $str;
	}
	return $html;
}
function displayCartonDetail($col, $colVal, $data=array(), $html=null){
	if ($colVal) {
		$str = "<script>$(function () {getCarton(".$colVal.",'dbotab_reassignment_detail_tbody_1',".$data['js_id'].",true)})</script>";
		$html .= $str;
	}
	return $html;
}
function showinfo($col, $colVal, $data=array(), $html=null){
	$html = '<img src="'.IMAGE_HREF.'/info/attachementinfo.png" alt="..." class="img-responsive img-thumbnail " style="width:100%">';

	return $html;
}
function showFileHistory($col, $colVal, $data=array(), $html=null){
	$docUI = new DocManUI();
	$html = $docUI->getFileList($data['js_id'],'js_id');

	return $html;
}
function showPercentage($col, $colVal, $data=array(), $html=null){
	$fronthtml = substr($html,0, strpos($html, '</div>'));
	$html = $fronthtml.'<span class="input-group-addon">%</span></div>';
	$html = '<div class="form-group">'.$html.'</div>';
	return $html;
}	
function showLength($col, $colVal, $data=array(), $html=null){
	$fronthtml = substr($html,0, strpos($html, '</div>'));
	$html = $fronthtml.'<span class="input-group-addon">Length | 长度</span></div>';
	$html = '<div class="form-group">'.$html.'</div>';
	return $html;

}	
function showWidth($col, $colVal, $data=array(), $html=null){
	$fronthtml = substr($html,0, strpos($html, '</div>'));
	$html = $fronthtml.'<span class="input-group-addon">Width | 宽度</span></div>';
	$html = '<div class="form-group">'.$html.'</div>';
	return $html;

}	
function showHeight($col, $colVal, $data=array(), $html=null){
	$fronthtml = substr($html,0, strpos($html, '</div>'));
	$html = $fronthtml.'<span class="input-group-addon">Height | 高度</span></div>';
	$html = '<div class="form-group">'.$html.'</div>';
	return $html;

}	
function showPercentageDet($col, $colVal, $data=array(), $html=null){

	$newhtml = '<div id="dbo_reassignment_detail_cont_js_distortion_value" class="value_container" inputtype="text" inputtypesize="">'.$colVal.' %</div>';

	return $newhtml;
}
function showRequiredMinute($col, $colVal, $data=array(), $html=null){
	$html = '<div style="display:none">'.$html.'</div><div class="note note-info">
				<h4 class="note-title" id="requiredmin">0 minutes</h4>
				<small>'.tl('Note',false,'newjob').'</small>
			</div>';
	return $html;
}

function showPrice($col, $colVal, $data, $html) {
	global $USER,$DB;
	// get the currency code by org
	$sql = "select rg_currency as currencycode
			from fcorg join mregion on org_region = rg_code where org_id = :0";
	$currcode = $DB->GetOne($sql,array($USER->orgid), PDO::FETCH_ASSOC);			
	$fronthtml = substr($html,0, strpos($html, '</div>'));
	$html = '<span class="input-group-addon">'.tl($currcode,false,'newjob').'</span>'.$fronthtml.'</div>';
	$html = '<div class="input-group">'.$html.'</div>';
	return $html;
}
function showPriceDet($col, $colVal, $data, $html) {
	global $USER,$DB;
	// get the currency code by org

	$sql = "select rg_currency as currencycode
			from fcorg join mregion on org_region = rg_code where org_id = :0";
	$currcode = $DB->GetOne($sql,array($data['js_orgid']), PDO::FETCH_ASSOC);			

	$html = $currcode.' :'.$html;
	return $html;
}



# customization
function dbo_reassignment_customize(&$dbo){
	autoDetailTableInput($dbo);
	$dbo->newModifier = 'dbo_reassignment_custom_new';
	$dbo->editModifier = 'dbo_reassignment_custom_edit';
	
	global $USER, $DB;
	$custtype = $DB->GetOne("select ox_customertype from morgextra where ox_orgid = :0",array($USER->orgid), PDO::FETCH_ASSOC); // get customer type
	if ($USER->rolename == 'Customer coordinator') {

		$dbo->cols['js_mcid']->mandatoryDefault = 0;
		$dbo->cols['joboutput']->mandatoryDefault = 0;
		$dbo->cols['joboutput']->option->new = "select jol_id,jol_title from mjoboutputlookup where jol_custtype = '".$custtype."' order by jol_seq";		
		$dbo->cols['joboutput']->option->edit = "select jol_id,jol_title from mjoboutputlookup where jol_custtype = '".$custtype."' order by jol_seq";		
		$dbo->cols['joboutput']->option->default = "select jol_id,jol_title from mjoboutputlookup";		
		$dbo->cols['js_mcid']->option->editMethod = $dbo->cols['js_mcid']->option->newMethod = 'sql';
		$dbo->cols['js_mcid']->option->edit = $dbo->cols['js_mcid']->option->new = 
			'select mc_id, mc_name, org_name from mcustmachine join fcorg on mc_orgid = org_id where org_id ='.$USER->orgid.' order by 3,2';
	}
	else {
		$dbo->cols['js_mcid']->mandatoryDefault = 0;
		$dbo->cols['joboutput']->mandatoryDefault = 0;
		$dbo->cols['joboutput']->option->new = "select jol_id,jol_title from mjoboutputlookup where jol_custtype = '".$custtype."' order by jol_seq";		
		$dbo->cols['joboutput']->option->edit = "select jol_id,jol_title from mjoboutputlookup where jol_custtype = '".$custtype."' order by jol_seq";		
		$dbo->cols['joboutput']->option->default = "select jol_id,jol_title from mjoboutputlookup";		
		$dbo->cols['js_mcid']->option->editMethod = $dbo->cols['js_mcid']->option->newMethod = $dbo->cols['js_mcid']->option->defaultMethod;
		$dbo->cols['js_mcid']->option->edit = $dbo->cols['js_mcid']->option->new = $dbo->cols['js_mcid']->option->default;
	}
	
	
	if (!empty($_GET['referjs'])) {
		$sql = "select * from (".$dbo->sql.") as qr where js_id = :0";
		$referrs = $DB->getRow($sql, array($_GET['referjs']), PDO::FETCH_ASSOC);
		if ($referrs) {
			foreach ($dbo->colNew as $c) {
				if (!empty($referrs[$c])) {
					$dbo->cols[$c]->defaultNewValueMethod = 'text';
					$dbo->cols[$c]->defaultNewValue = $referrs[$c];
				}
			}
		}
	}
	
}

function dbo_reassignment_custom_new($table, $cols){
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
	if($cols['attachment'] == '') {
		$ret = "Attachement cannot be empty";
		return array($ret);
		unset($cols['attachment']);
	}
	else{
		$attachment = json_decode($cols['attachment'],true);
		// validate rar or zip format
		if (!$attachment) {
			$ret = "Attachement cannot be empty";
			return array($ret);
		}
		unset($cols['attachment']); 
	}

	
	foreach ($cols as $k=>$v) {
		if (substr($k,0,6) == '__map_') unset($cols[$k]);
	}
	
	
	$remark = $cols['remark']; // get the remark and insert after insert queue
	unset($cols['remark']); // unset remark
	unset($cols['info']); // unset image info
	// category handling part 1
	/*$cols['js_primcat'] = getPrimaryCat($cols['js_jobcolor'], $cols['jobcategory']);*/
	/*$catstring = $cols['jobcategory'];
	unset($cols['jobcategory']);*/

	// output requirement handling part 1
	$outputreq = $cols['joboutput'];
	unset($cols['joboutput']);	
	
	$cols['js_orgid'] = $USER->orgid; // assign org id
	$cartonarr = (!empty($_POST['carcode'])) ? $_POST['carcode'] : array(); // get the carton array
/*	$cartonid = $cols['js_carid']; // get the carton id selected by user*/
	$cols['js_request_by'] = $USER->userid; // store the userid
	
	$currmth = date('Ym');
	$ind = $DB->getOne("select coalesce(max(js_month_occur),0)+1 from mreassignment 
	where to_char(js_request_date,'YYYYMM') = :0", array($currmth));

	// assign the price
	$price = $cols['js_price'];
	/*handle currency by region*/
	// get base currency
	$sql = "select set_val from fcsetting where set_code= :0";
	$basecurr = $DB->GetOne($sql,array('CURRENCYBASE'), PDO::FETCH_ASSOC);
	$sql = "select rg_code,rg_currency,rg_convert from fcorg join mregion on org_region = rg_code where org_id = :0";
	$rowdata = $DB->GetRow($sql,array($USER->orgid), PDO::FETCH_ASSOC);

	$cols['js_currency'] = $rowdata['rg_currency'];

	// determine whether need to calculate conversion

	// get rate
	$sql = "select curr_rate from fccurrency where curr_code = :0";
	$rate = $DB->GetOne($sql,array($cols['js_currency']), PDO::FETCH_ASSOC);

/*	if($basecurr != $cols['js_currency'] && $rowdata['rg_convert'] == 'Y'){
		$cols['js_finalprice'] =  bcdiv($price, $rate, 2);
		$cols['js_rate'] = $rate;

	}else{
		$cols['js_finalprice'] = $price;
		$cols['js_rate'] = $rate;
	}*/

	$cols['js_finalprice'] = $price;
	$cols['js_rate'] = $rate;

	
	$cols['js_code'] = $currmth.str_pad($ind, 4, "0", STR_PAD_LEFT);
	$cols['js_month_occur'] = $ind;
	$ok = $DB->doInsert($table, $cols);
	$jobid = $DB->lastInsertId('mreassignment_js_id_seq');
	if(!$ok){
		$ret[] = $DB->lastError;
	}else{
			
			if (!empty($_POST['detail'])) {
				global $DETAIL_SETUP;
				$newid = $jobid;
				foreach($_POST['detail'] as $keycol=>$d) {
					$currset = false;
					foreach ($DETAIL_SETUP as $k=>$set) {
						if (!empty($set['fkcol']) && $set['fkcol'] == $keycol) $currset = $set;
					}
					if (empty($d['data']) && $currset['mustfill']) {
						$ret[] = "Please fill up ".strip_tags($currset['fkcolcaption']);
					}
					else {
						$detcols = array($keycol => $newid);
						$ok = $DB->execute("delete from {$d['table']} where {$keycol} = :0", array($newid));
						if(!$ok) $ret[] = $DB->lastError;
						else {
							if (!empty($d['data'])) {
								foreach ($d['data'] as $i=>$currcols) {
									$detcols = array_merge($detcols, $currcols);
									foreach ($detcols as &$val) {
										if (is_array($val)) $val = implode(", ", $val);
									}
									foreach ($currset['mustfillCols'] as $mcol) {
										if (empty($detcols[$mcol])) $ret[] = "Please fill up ".strip_tags($currset['caption'][$mcol]);
									}
									if (!$ret) {
										$ok = $DB->doInsert($d['table'], $detcols);
										if(!$ok) $ret[] = $DB->lastError;
									}
								}
							}
						}
					}
				}
				if ($ret) return $ret;
			}
	
		// category handling part 2
		/*$catarr = explode(",",$catstring);
		foreach ($catarr as $key => $value) {
			// insert into mjobcat
			$data = array('jc_jsid' => $jobid, 'jc_jclid' => $value);
			$ok = $DB->doInsert('mjobcat', $data);
		}*/

		// output requirement handling part 2
		$oparr = explode(",",$outputreq);
		if(!empty($oparr)){
			foreach ($oparr as $key => $value) {
				// insert into mjoboutput
				$opdata = array('jo_jsid' => $jobid, 'jo_outputcode' => trim($value) );
				$ok = $DB->doInsert('mjoboutput', $opdata);
			}
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
		
		if (!$ret) {
			$JOBARRAY = array('casekey' => $jobid,
							  'casetype' => 'reassignment',
							  'comment' => trim($remark));
		}

	}
	return $ret;
}

// yet to modify
function dbo_reassignment_custom_edit($table, $cols, $wheres){
	global $DB,$REMARK,$FLOWDECISION,$USER;
	$ret = array();
	$jobid = $wheres["js_id"];
	// handle file upload if empty 
	if($cols['attachment'] == '') {
		/*$ret = "Attachement cannot be empty";
		return $ret;*/
		unset($cols['attachment']);
	}
	else{
		$attachment = json_decode($cols['attachment'],true);
		// validate rar or zip format
		unset($cols['attachment']); 
	}

	foreach ($cols as $k=>$v) {
		if (substr($k,0,6) == '__map_') unset($cols[$k]);
	}
	// assign the price
	$price = $cols['js_price'];
	$cols['js_status'] = 'REQUIREMENT VERIFICATION'; // after customer change
	
	$REMARK = $cols['remark']; // get the remark and insert after insert queue
	unset($cols['remark']); // unset remark
	unset($cols['info']); // unset image info
	unset($cols['filehistory']);
	$cartonarr = (!empty($_POST['carcode'])) ? $_POST['carcode'] : array(); // get the carton array
/*	$cartonid = $cols['js_carid']; // get the carton id selected by user*/
	// category handling part 1
/*	$cols['js_primcat'] = getPrimaryCat($cols['js_jobcolor'], $cols['jobcategory']);
	$catstring = $cols['jobcategory'];
	unset($cols['jobcategory']);
*/
	// output requirement handling part 1
	$outputreq = $cols['joboutput'];
	unset($cols['joboutput']);	

	// get base currency
	$sql = "select set_val from fcsetting where set_code= :0";
	$basecurr = $DB->GetOne($sql,array('CURRENCYBASE'), PDO::FETCH_ASSOC);
	$sql = "select rg_code,rg_currency,rg_convert from fcorg join mregion on org_region = rg_code where org_id = :0";
	$rowdata = $DB->GetRow($sql,array($USER->orgid), PDO::FETCH_ASSOC);

	$cols['js_currency'] = $rowdata['rg_currency'];

	// get rate
	$sql = "select curr_rate from fccurrency where curr_code = :0";
	$rate = $DB->GetOne($sql,array($cols['js_currency']), PDO::FETCH_ASSOC);

	// determine whether need to calculate conversion
/*	if($basecurr != $cols['js_currency'] && $rowdata['rg_convert'] == 'Y'){

		$cols['js_finalprice'] =  bcdiv($price, $rate, 2);
		$cols['js_rate'] = $rate;

	}else{
		$cols['js_finalprice'] = $price;
		$cols['js_rate'] = $rate;
	}*/

	$cols['js_finalprice'] = $price;
	$cols['js_rate'] = $rate;

	$ok = $DB->doUpdate($table, $cols, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
		$FLOWDECISION = false;
	}else{
	
			if (!empty($_POST['detail'])) {
				global $DETAIL_SETUP;
				$newid = $jobid;
				foreach($_POST['detail'] as $keycol=>$d) {
					$currset = false;
					foreach ($DETAIL_SETUP as $k=>$set) {
						if (!empty($set['fkcol']) && $set['fkcol'] == $keycol) $currset = $set;
					}
					if (empty($d['data']) && $currset['mustfill']) {
						$ret[] = "Please fill up ".strip_tags($currset['fkcolcaption']);
					}
					else {
						$detcols = array($keycol => $newid);
						$ok = $DB->execute("delete from {$d['table']} where {$keycol} = :0", array($newid));
						if(!$ok) $ret[] = $DB->lastError;
						else {
							if (!empty($d['data'])) {
								foreach ($d['data'] as $i=>$currcols) {
									$detcols = array_merge($detcols, $currcols);
									foreach ($detcols as &$val) {
										if (is_array($val)) $val = implode(", ", $val);
									}
									foreach ($currset['mustfillCols'] as $mcol) {
										if (empty($detcols[$mcol])) $ret[] = "Please fill up ".strip_tags($currset['caption'][$mcol]);
									}
									if (!$ret) {
										$ok = $DB->doInsert($d['table'], $detcols);
										if(!$ok) $ret[] = $DB->lastError;
									}
								}
							}
						}
					}
				}
				if ($ret) return $ret;
			}
	
	
		// category handling part 2
		/*$catarr = explode(",",$catstring);*/
		// delete the existing category
	/*	$sql = "delete from mjobcat where jc_jsid = :0 ";
		$ok = $DB->Execute($sql,array($jobid));
		foreach ($catarr as $key => $value) {
			// insert into mjobcat
			$data = array('jc_jsid' => $jobid, 'jc_jclid' => $value);
			$ok = $DB->doInsert('mjobcat', $data);
		}*/
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
		if(isset($attachment) && $attachment!=''){
			// upload the the right place...
			$doc = new DocumentManager();
			$doc->saveMultipleFile($attachment,$jobid,'js_id');
		}

		$FLOWDECISION=true;
		
	}
	return $ret;
}

global $DB,$USER;
$ctype = $DB->GetOne("select ox_customertype from morgextra where ox_orgid = :0",array($USER->orgid), PDO::FETCH_ASSOC); // get customer type
$sql = "select * from mjobcatlookup";
$data = $DB->GetArray($sql,null, PDO::FETCH_ASSOC);
// get base currency
$sql = "select set_val from fcsetting where set_code= :0";
$basecurr = $DB->GetOne($sql,array('CURRENCYBASE'), PDO::FETCH_ASSOC);
$sql = "select rg_code,rg_currency,rg_convert from fcorg join mregion on org_region = rg_code where org_id = :0";
$rowdata = $DB->GetRow($sql,array($USER->orgid), PDO::FETCH_ASSOC);
// get rate
$sql = "select curr_rate from fccurrency where curr_code = :0";
$rate = $DB->GetOne($sql,array($rowdata['rg_currency']), PDO::FETCH_ASSOC);

$timemap = array('JOBOUTP'=>array());
/*foreach ($data as $key => $value) {
	$timemap['JOBCAT'][$value['jcl_id']] = array(
		'time'=> array(
			1=>$value['jcl_requiretime_color_1'],
			2=>$value['jcl_requiretime_color_2'],
			3=>$value['jcl_requiretime_color_3'],
			4=>$value['jcl_requiretime_color_4'],
		),
		'pricecat'=>$value['jcl_price_cat'],
		'price'=> array(
			0=>$value['jcl_price_per_unit'],
			1=>$value['jcl_price_color_1'],
			2=>$value['jcl_price_color_2'],
			3=>$value['jcl_price_color_3'],
			4=>$value['jcl_price_color_4'],
		),
		'title'=> $value['jcl_title'],
	);
}*/
$data = $DB->GetArray("select * from mjoboutputlookup",null, PDO::FETCH_ASSOC);
foreach ($data as $key => $value) {
	$timemap['JOBOUTP'][$value['jol_id']] = array(
		1=>$value['jol_requiredtime'],
		'title'=>$value['jol_title'],
		'price'=> array(
			0=>0,
			1=>(trim($value['jol_price_color_1']))==''?0:trim($value['jol_price_color_1']),
			2=>(trim($value['jol_price_color_2']))==''?0:trim($value['jol_price_color_2']),
			3=>(trim($value['jol_price_color_3']))==''?0:trim($value['jol_price_color_3']),
			4=>(trim($value['jol_price_color_4']))==''?0:trim($value['jol_price_color_4']),
			5=>$value['jol_pricingtype'],
			6=>$value['jol_price'],
			7=>$value['jol_custtype']
		)
	);
}
echo '<script type="text/javascript"> var jstimemap = '.json_encode($timemap).'; </script>';
echo '<script type="text/javascript"> var currdata = '.json_encode($rowdata).'; </script>';
echo '<script type="text/javascript"> var basecurr = \''.$basecurr.'\'; </script>';
echo '<script type="text/javascript"> var rate = '.$rate.'; </script>';
echo '<script type="text/javascript"> var ctype = \''.$ctype.'\'; </script>';
echo '<script type="text/javascript"> var dbostate = \''.$_GET['dbostate'].'\'; </script>';


# final rendering
$dbo->render();
?>
<script type="text/javascript">
$( document ).ready(function() {
	
	var $colorjob = $('input[name=dbo_reassignment_new_js_jobcolor], input[name=dbo_reassignment_edit_js_jobcolor]').click(function () {calMinutes();calPrice();}),
		$outputjob = $('input[name=dbo_reassignment_new_joboutput\\[\\]], input[name=dbo_reassignment_edit_joboutput\\[\\]]').click(function () {calMinutes();calPrice();setBarcodeProp();}),
		// $categoryjob = $('input[name=dbo_reassignment_new_jobcategory\\[\\]], input[name=dbo_reassignment_edit_jobcategory\\[\\]]').click(function () {calMinutes();calPrice();}),
		$requiredmin = $('#requiredmin'),
		$requireinput = $('#dbo_reassignment_new_js_requiretime, #dbo_reassignment_edit_js_requiretime'),
		$priceinput = $('#dbo_reassignment_new_js_price, #dbo_reassignment_edit_js_price');
		//$priceinput = $('<input type="hidden" name="js_price" />');
		//$form = $('#dbo_reassignment_newform,#dbo_reassignment_editform').append($priceinput);
	
	// barcode (6) and prepare artwork (2) doesn't allow other options checked together with them.
	function joChecked(clickedCB){
		// if($outputjob.filter(':checked').length > 0){
			// console.log($outputjob.filter(':checked').length);
			if((clickedCB.val()==2 || clickedCB.val()==6)){
				// console.log('checked '+clickedCB.val()+' '+clickedCB.is(':checked'));
				// console.log(clickedCB.attr('checked'));
				if(clickedCB.is(':checked')){
					$outputjob.each(function(){
						if($(this).val()!=clickedCB.val()){
							$(this).attr('checked', false);
							$(this).attr('disabled', true);
						}
					});
				}else{
					$outputjob.each(function(){
						if($(this).val()!=clickedCB.val()){
							$(this).attr('checked', false);
							$(this).attr('disabled', false);
						}
					});
				}
			}
			/* $outputjob.filter(':checked').each(function(){
				var currCLID = $(this).val();
				// console.log(currCLID);
				if(currCLID==2 || currCLID==6){
					$outputjob.filter(':checked').each(function(){
						if($(this).val()!=currCLID){
							$(this).attr('checked', false);
						}
					});
				}
			}); */
		// }
	}

	// estimated time calculation
	function calMinutes(){
		if ($requiredmin.length > 0) {
			var p1_maxmin = 0, p2_maxmin = 0;
			// p1
			var colorval = $colorjob.filter(':checked').val();
			/* if (colorval && $categoryjob.filter(':checked').length > 0) {
				$categoryjob.filter(':checked').each(function () {
					var clid = $(this).val();
					if (typeof jstimemap['JOBCAT'][clid] != 'undefined' && 
						typeof jstimemap['JOBCAT'][clid]['time'][colorval] != 'undefined' && 
						jstimemap['JOBCAT'][clid]['time'][colorval] > p1_maxmin) {
						p1_maxmin = jstimemap['JOBCAT'][clid]['time'][colorval];
					}
				})
			} */
			//p2 
			$outputjob.filter(':checked').each(function () {
				var olid = $(this).val();
				if (typeof jstimemap['JOBOUTP'][olid] != 'undefined' && 
					jstimemap['JOBOUTP'][olid][1] != 'undefined' &&
					jstimemap['JOBOUTP'][olid][1] > p2_maxmin) {
					p2_maxmin = jstimemap['JOBOUTP'][olid][1];
				}
			})
			$requiredmin.text((p1_maxmin+p2_maxmin) + ' minutes');
			$requireinput.val((p1_maxmin+p2_maxmin));
		}
	}
	calMinutes();
	
	function calPrice() {
		var price = 0;
		var tmpPrice = 0;
		if ($priceinput.length > 0) {
			// var colorval = $colorjob.filter(':checked').val();
			if ($outputjob.filter(':checked').length > 0) {
				// get the max price
				$outputjob.filter(':checked').each(function () {
					var opid = $(this).val();
					// if( parseFloat(jstimemap['JOBOUTP'][opid]['price'][colorval]) > price ) 
						// price = parseFloat(jstimemap['JOBOUTP'][opid]['price'][colorval]);
					if(jstimemap['JOBOUTP'][opid]['price'][5]=='FIXED'){
						tmpPrice = parseFloat(jstimemap['JOBOUTP'][opid]['price'][6]);
					}else if(jstimemap['JOBOUTP'][opid]['price'][5]=='UNIT'){
						tmpPrice = parseFloat(jstimemap['JOBOUTP'][opid]['price'][6] * $('#detail-jbc_jsid-table > tbody > tr').length);
					}
					if(tmpPrice > price)
						price = tmpPrice;
				});
				// console.log(jstimemap);
			}
			/* $categoryjob.filter(':checked').each(function () {
				var clid = $(this).val();
				if( parseFloat(jstimemap['JOBCAT'][clid]['price'][colorval]) > price ) 
					price = parseFloat(jstimemap['JOBCAT'][clid]['price'][colorval]);					

			}); */

			/* $categoryjob.filter(':checked').each(function () {
				var clid = $(this).val();
				// get the barcode total price and add the output category price
				if (jstimemap['JOBCAT'][clid]['pricecat'] == 'UNIT') {
					if (jstimemap['JOBCAT'][clid]['title'].toUpperCase() == 'BARCODE') {
						price += parseFloat(jstimemap['JOBCAT'][clid]['price'][0]) * $('#detail-jbc_jsid-table > tbody > tr').length;
					}
				}			
			}); */
			// currency exchange
			
			if(basecurr != currdata.rg_currency && currdata.rg_convert == 'Y'){
			    console.log('price before calculate = '+price);
				price = Math.round( price/rate * 100 ) /100;
				console.log('price after calculate = '+price);
			}			
			
			$priceinput.val(price);
		}
	}
	calPrice();
	$('#detail-jbc_jsid-table').on('addrow', function (){calPrice();})
	$('#detail-jbc_jsid-table').on('removerow', function (){calPrice();})
	
	// color input enabling
	/* function setColorInput(val) {
		var sel = parseInt(val);
		$('input[id^=dbo_reassignment_new_js_color_], input[id^=dbo_reassignment_edit_js_color_]').prop('disabled', true);
		if (val) {
			for (var i=1; i <= 4; i++ ){
				var $colorinp = $('#dbo_reassignment_new_js_color_'+i+', #dbo_reassignment_edit_js_color_'+i).prop('disabled', false);
				if (i > sel) {
					$colorinp.prop('disabled', true).val('');
				}
			}
		}
	}
	
	$colorjob.click(function () {
		setColorInput($colorjob.filter(':checked').val());
	})
	setColorInput($colorjob.filter(':checked').val()); */
	
	
	// trapping size enabling
	var $trappingSizeInp = $('#dbo_reassignment_new_js_trapping_size, #dbo_reassignment_edit_js_trapping_size');
	/* function setTrappingProp() {
		if ($categoryjob.filter(':checked').filter(function () {
			if (typeof jstimemap['JOBCAT'][this.value] != 'undefined' &&
			jstimemap['JOBCAT'][this.value]['title'].toUpperCase() == 'TRAPPING') return true;
			return false;
		}).length > 0) $trappingSizeInp.prop('disabled', false)
		else $trappingSizeInp.val('').prop('disabled', true);
	} */
	// outputtype
	// var $outputtype = $('#dbo_reassignment_new_js_outputtype, #dbo_reassignment_edit_js_outputtype, #dbo_reassignment_new_js_outputwidth, #dbo_reassignment_edit_js_outputwidth,#dbo_reassignment_new_js_outputheight,#dbo_reassignment_edit_js_outputheight');
	/* function setOutputtypeProp() {
		if ($outputjob.filter(':checked').filter(function () {
			if (typeof jstimemap['JOBOUTP'][this.value] != 'undefined' &&
			jstimemap['JOBOUTP'][this.value]['title'].toUpperCase() == 'ARTWORK SEPERATION') return true;
			return false;
		}).length > 0) $outputtype.prop('disabled', false)
		else $outputtype.val('').prop('disabled', true);
	} */
	/* $categoryjob.click(function () {
		setTrappingProp();
	}); */
	/* $outputjob.click(function () {
		setOutputtypeProp();
	}); */
	// setTrappingProp();
	// setOutputtypeProp();
	//setDieCut();


	
	
	// angle enabling
	var $lpiInp = $('#dbo_reassignment_new_js_lpi, #dbo_reassignment_edit_js_lpi');
	var $angleInp = $('#dbo_reassignment_new_js_angle_1, #dbo_reassignment_new_js_angle_2, #dbo_reassignment_new_js_angle_3, #dbo_reassignment_new_js_angle_4')
		.add('#dbo_reassignment_edit_js_angle_1, #dbo_reassignment_edit_js_angle_2, #dbo_reassignment_edit_js_angle_3, #dbo_reassignment_edit_js_angle_4')
		.add($lpiInp);
	
	/*function setAngleProp() {
		if ($categoryjob.filter(':checked').filter(function () {
			if (typeof jstimemap['JOBCAT'][this.value] != 'undefined' &&
			jstimemap['JOBCAT'][this.value]['title'].toUpperCase() == 'MONOTONE') return true;
			return false;
		}).length > 0) $angleInp.prop('disabled', false)
		else $angleInp.val('').prop('disabled', true);
	}*/
	/*$categoryjob.click(function () {
		setAngleProp();
	})*/
	/*setAngleProp();*/

	// bleeding remark enabling
	var $bleedingRemarkInp = $('#dbo_reassignment_new_js_bleeding_remark, #dbo_reassignment_edit_js_bleeding_remark');
	$('#dbo_reassignment_new_js_bleeding, #dbo_reassignment_edit_js_bleeding').change(function () {
		if ($(this).val()) {
			$bleedingRemarkInp.prop('disabled', false);
		}
		else $bleedingRemarkInp.val('').prop('disabled', true);
	}).change();
	
	// barcode enabling
	var $barcodeTable = $('.dbo_edit #detail-jbc_jsid-table, .dbo_new #detail-jbc_jsid-table');
	function setBarcodeProp() {
		if ($outputjob.filter(':checked').filter(function () {
			if (typeof jstimemap['JOBOUTP'][this.value] != 'undefined' &&
			jstimemap['JOBOUTP'][this.value]['title'].toUpperCase().substring(0, 7) == 'BARCODE') return true;
			return false;
		}).length > 0) {
			$barcodeTable.removeClass('disabled');
			$barcodeTable.find(':input').prop('disabled', false);
		}
		else {
			$barcodeTable.addClass('disabled');
			$barcodeTable.find(':input').prop('disabled', true);
		}
	}
	setBarcodeProp();
	
	
	//distortion value enabling
	var $distortValInp = $('#dbo_reassignment_new_js_distortion_value, #dbo_reassignment_edit_js_distortion_value');
	$('#dbo_reassignment_new_js_distortion, #dbo_reassignment_edit_js_distortion').change(function () {
		if ($(this).val()) {
			$distortValInp.prop('disabled', false);
		}
		else $distortValInp.val('').prop('disabled', true);
	}).change();
	
	

	console.log('DBo state = '+dbostate);
	if(dbostate == 'new' || dbostate == 'edit'){
		console.log('inside if');
		var submitted = false;

	    window.onbeforeunload = function (e) {
	    	console.log('before unload');
	        if (!submitted) {
	        	console.log('inside...');
	            var message = "你肯定你要离开这页吗？", e = e || window.event;
	            if (e) {
	                e.returnValue = message;
	            }
	            return message;
	        }
	    }

	     $("#dbo_reassignment_newform").submit(function() {
	     	submitted = true;
	     });

	     $("#dbo_reassignment_editform").submit(function() {
	     	submitted = true;
	     });
	     

	     $('.btn-success').click(function(){
	     	submitted = true;
	     });

	}

	
	
});


</script>