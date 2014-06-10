<?php
define('ANONYMOUS', true);
define('LOGINPAGE', true);
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');
require_once(CORE_DIR.DS.'inc'.DS.'DocumentManager.inc.php');		

// unit testing on get single doc info
/*$doc = new Document();
$doc->getSingleDocInfo(33,'car_id');*/
/* test result pass */


/* Testing file single file upload without validation*/
if(isset($_FILES) && count($_FILES) !=0 ){
	$doc = new DocumentManager();
	$doc->saveMultipleFile($_FILES['file'],41,'car_id',false);
}

/*Testing delete single file*/
/*$doc = new Document();
$ret = $doc->deleteFile(21);
echo $ret;*/


?>
<!-- test multiple file upload -->
<form  method="post" enctype="multipart/form-data">
<label for="file">Filename:</label>
<input type="file" name="file[]" id="file" multiple><br>
<input type="submit" name="submit" value="Submit">
</form>

<!-- <form  method="post" enctype="multipart/form-data">
<label for="file">Filename:</label>
<input type="file" name="file" id="file" ><br>
<input type="submit" name="submit" value="Submit">
</form> -->
