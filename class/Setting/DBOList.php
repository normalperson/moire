<?php
global $GLOBAL, $DB;
html_header();
?>
<style type="text/css">
#container, #body{
	width:100%;
}
</style>
<table style="width:100%;">
<tr>
<td style="vertical-align:top;padding:0px 0px 0px 5px;width:210px;">
<div style="width:200px;height:500px;overflow:auto;">
<?php
$list = scandir(DOC_DIR.DS.'dbo');
for($i=2; $i<count($list); $i++){
	echo '<div><a target="dboload" href="DBOLoad?load='.$list[$i].'">'.$list[$i].'</a></div>';
}
?>
</div>
</td>
<td>
<iframe name="dboload" id="dboload" src="DBOLoad<?php echo isset($_GET['load'])?'?load='.$_GET['load']:''; ?>" src="DBOLoad" style="width:100%;height:100%;min-height:500px;border:0px;padding:5px;"></iframe>
</td>
</tr></table>