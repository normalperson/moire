<?php
define('ANONYMOUS', 1);
require_once(dirname(__FILE__).'/init.inc.php');
?>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>License</title>
</head>
<body>
<?php
$form = array('id'=>'', 'app'=>'', 'holder'=>'', 'licensekey'=>'', 'licensetype'=>'', 'users'=>'', 'created'=>'', 'expiry'=>'', 'activationcode'=>'');
if($_POST){
	$form = $_POST;
	if(!isset($_POST['activationcode'])) $form['activationcode'] = '';
	$form['expiry'] = str_replace('/', '-', $form['expiry']);
}
?>
<form method="post">
<table>
	<tr>
		<th>ID</th>
		<td>:</td>
		<td><input type="text" name="id" id="id" value="<?php echo $form['id']; ?>"/></td>
	</tr>
	<tr>
		<th>Application</th>
		<td>:</td>
		<td><input type="text" name="app" id="app" value="<?php echo $form['app']; ?>"/></td>
	</tr>
	<tr>
		<th>Holder</th>
		<td>:</td>
		<td><input type="text" name="holder" id="holder" value="<?php echo $form['holder']; ?>"/></td>
	</tr>
	<tr>
		<th>License Key</th>
		<td>:</td>
		<td><input type="text" name="licensekey" id="licensekey" value="<?php echo $form['licensekey']; ?>"/></td>
	</tr>
	<tr>
		<th>License Type</th>
		<td>:</td>
		<td><select name="licensetype" id="licensetype">
		<option value="concurrent"<?php echo $form['licensetype']=='concurrent'?' selected="selected"':''; ?>>Concurrent</option>
		<option value="named"<?php echo $form['licensetype']=='named'?' selected="selected"':''; ?>>Named</option>
		</select></td>
	</tr>
	<tr>
		<th>Number of Users</th>
		<td>:</td>
		<td><input type="text" name="users" id="users" value="<?php echo $form['users']; ?>"/></td>
	</tr>
	<tr>
		<th>Expiry</th>
		<td>:</td>
		<td><input type="text" name="expiry" id="expiry" value="<?php echo $form['expiry']; ?>"/> <span style="font-style:italic;font-size:0.8em;">YYYYMMDD</span></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td><input type="submit" name="submit" id="submit" value="Submit"/></td>
	</tr>
</table>
</form>
<?php
if($_POST){
	$template = <<<EOD
<?php
class [CoreApp]_License extends Empty_License{
	var \$key = '[KEY]';
	var \$id = '[ID]';
	var \$app = '[APP]';
	var \$holder = '[HOLDER]';
	var \$licensetype = '[LICENSETYPE]';
	var \$licensekey = '[LICENSEKEY]';
	var \$users = '[USERS]';
	var \$created = '[CREATED]';
	var \$expiry = '[EXPIRY]';
}
?>
EOD;
	$coreapp = $form['app']=='fcore'?'Core':'App';
	$expiryTime = strtotime($form['expiry']);
	$created = time();
	$created = date('Ymd');
	// if(!$expiryTime) die('Invalid Expiry');
	// $str = 'ffecy'.$form['id'].$form['holder'].$form['app'].$created.$form['expiry'].$form['licensetype'].$form['users'].'yceff';
	// echo '<div>'.$str.'</div>';
	$key = License::license_hash($form);
	echo '<pre style="padding:10px 0px;">';
	// echo htmlentities(str_replace(array('[CoreApp]', '[KEY]', '[ID]', '[APP]', '[HOLDER]', '[LICENSEKEY]', '[LICENSETYPE]', '[USERS]', '[CREATED]', '[EXPIRY]'), array($coreapp, $key, $form['id'], $form['app'], $form['holder'], $form['licensekey'], $form['licensetype'], $form['users'], $created, $form['expiry']), $template));
	if(isset($form['submit'])) unset($form['submit']);
	$form['created'] = date('Ymd');
	$licenseString = License::genLicenseString($form);
	echo htmlentities($licenseString);
	echo '</pre>';
}
?>
</body>
</html>