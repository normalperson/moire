<?php
global $USER;
if (!$USER->inGroup('ITADMIN')) {
	redirect(APP_HREF);
	die();
}
html_header();
?>
<div class="panel colourable">
	<div class="panel-heading">
		<span class="panel-title">Run SQL</span>
	</div>
	<div class='panel-body'>
		<form method='post'>
			<textarea id='sqlinput' name='sqlinput' class='form-control' placeholder='Type SQL here' rows=4 style='font-family:Menlo,Monaco,Consolas,"Courier New",monospace'><?php echo !empty($_POST['sqlinput']) ? $_POST['sqlinput'] : ''; ?></textarea>
			<br/>
			<input type='submit' id='sqlsubmit' name='sqlsubmit' value='Run' class='btn btn-primary pull-right' style='min-width:100px'>
			<br/>
		</form>
		
<?php
global $DB, $USER;
$sql = '';
if (!empty($_POST['sqlsubmit'])) {
	if (!empty($_POST['sqlinput'])) $sql = trim($_POST['sqlinput']);
	if ($sql) {
		$DB->showError=true;
		echo "<hr/>";
		$rs = @$DB->getArrayAssoc("select * from ( ". $sql." ) sqlalias");
		if ($rs) {
			$cols = array();
			foreach ($rs as $i=>&$r) {
				if ($i == 0) $cols = array_map(function($k) {
					return array('title'=>$k);
				}, array_keys($r));
				$r = array_values($r);
			}
			echo "<div class='table-light'>
					<table cellpadding='0' cellspacing='0' border='0' class='table table-striped table-bordered' id='sqlResult'></table>
				</div>
<script type='text/javascript'>
$('#sqlResult').dataTable({
	'data': ".json_encode($rs).",
	'columns' : ".json_encode($cols)."
});
</script>";
		}
		else echo "<span class='text-warning'>No row return</span>";
	}
}
?>
	</div>
</div>
<script type='text/javascript'>
var oldval = $('#sqlinput').val();
$('#sqlinput').on('keyup', function(e) {
	if ((e.keyCode == 10 || e.keyCode == 13) && e.ctrlKey) $('#sqlsubmit').click();
}).select().autosize();
</script>