<style type="text/css">
.fileUpload {
	position: relative;
	overflow: hidden;
	margin: 10px;
}
.fileUpload input.upload {
	position: absolute;
	top: 0;
	right: 0;
	margin: 0;
	padding: 0;
	font-size: 20px;
	cursor: pointer;
	opacity: 0;
	filter: alpha(opacity=0);
}
.smallinput{
	width:100%;
	line-height: 1.5;
	font-size: 13px;
	padding: 3px 5px;
}
progress,          /* All HTML5 progress enabled browsers */
progress[role]     /* polyfill */
{

	/* Turns off styling - not usually needed, but good to know. */
	appearance: none;
	-moz-appearance: none;
	-webkit-appearance: none;

	/* gets rid of default border in Firefox and Opera. */ 
	border: none;

	/* Needs to be in here for Safari polyfill so background images work as expected. */
	background-size: auto;
	
	/* Dimensions */
	width: 100%;
	
}

/* Polyfill */
progress[role]:after {
	background-image: none; /* removes default background from polyfill */
}

/* Ensure fallback text doesn't appear in polyfill */
progress[role] strong {
	display: none;
}
progress,                          /* Firefox  */ 
progress[role][aria-valuenow] {    /* Polyfill */
   background: #CEF6F5 !important; /* !important is needed by the polyfill */
}

/* Chrome */
progress::-webkit-progress-bar {
    background: #CEF6F5;
}
/* IE10 */
progress {
    color: #007FFF;
}

/* Firefox */
progress::-moz-progress-bar { 
    background: #007FFF;	
}

/* Chrome */
progress::-webkit-progress-value {
    background: #007FFF;
}

/* Polyfill */
progress[aria-valuenow]:before  {
    background: #007FFF;
}
</style>
<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'testupload.conf.php');

# customization
function dbo_testupload_customize(&$dbo){
}


# final rendering
$dbo->render();
?>


<script type="text/javascript">
$span = $('<span id="upload">Upload</span>');
$div = $('<div class="progressinfo"></div>');
$input = $('<input id="inp_dbo_testupload_new_fd_file_name" class="smallinput" placeholder="Choose File" disabled="disabled" />');
$meter = $('<progress max="10000" ></progress>');

$progressinput = $div.append($input).append($meter);

$('#dbo_testupload_new_cont_fd_file_name').parent().prepend($progressinput);

$('#dbo_testupload_new_cont_fd_file_name').addClass("fileUpload btn btn-primary btn-sm")
                                          .prepend($span);



$('#dbo_testupload_new_fd_file_name').addClass('upload')
                                     .change(function(){
                                     	$('#inp_dbo_testupload_new_fd_file_name').val( $(this).val() );
                                     	// add ajax operation inside
                                     	upload();
                                     });


function upload(){
	console.log('upload span clicked');
    var formData = new FormData($('form')[0]);
    $.ajax({
        url: 'testMove',  //Server script to process data
        type: 'POST',
        xhr: function() {  // Custom XMLHttpRequest
            var myXhr = $.ajaxSettings.xhr();
            if(myXhr.upload){ // Check if upload property exists
                myXhr.upload.addEventListener('progress',progressHandlingFunction, false); // For handling the progress of the upload
            }
            return myXhr;
        },
        //Ajax events
        beforeSend: beforeSendHandler,
        success: completeHandler,
        error: errorHandler,
        // Form data
        data: formData,
        //Options to tell jQuery not to process data or worry about content-type.
        cache: false,
        contentType: false,
        processData: false
    });
}                                  
function progressHandlingFunction(e){
	console.log(e);
    if(e.lengthComputable){
        $('progress').attr({value:e.loaded,max:e.total});
    }
}
function beforeSendHandler(){

}
function completeHandler(e){
	console.log('after complete');
	console.log(e);
}
function errorHandler(){

}
</script>