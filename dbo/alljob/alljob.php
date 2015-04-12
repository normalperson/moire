<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'alljob.conf.php');

function getjobid($colname,$colval,$rowinfo){
	$ret = $colval."<input type='hidden' class='jobid' value='".$colval."' />";
	return $ret;
}
# customization
function dbo_alljob_customize(&$dbo){
}


# final rendering
$dbo->render();
?>
<script type="text/javascript">
$('#dbo_alljob_listtable > tbody > tr').click(function(){
	redirect('viewJobInfo?jsid='+$(this).find('.jobid').val());
});

</script>