<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'fonginput.conf.php');

# customization
function fonginput_customize(&$dbo){
}

# final rendering
// $dbo->render();

// pr($_POST);
// foreach($dbo->colEdit as $col){
	// echo '<hr />'.$col.'<br />';
	// $ret = $dbo->genInput($col, 'new');
	// echo '<pre>';
	// echo ($ret);
	// echo htmlentities($ret);
	// echo '</pre>';
// }

// $rs = $DB->getRowAssoc("select * from fcmenu where mn_id = 83");
// unset($rs['mn_id']);
// foreach($rs as $key=>$col){
	// if(strlen($col)==0) unset($rs[$key]);
// }
// $sql = $DB->genInsert('fcmenu', $rs);
// d($sql);

require_once(DOC_DIR.DS.'class'.DS.'Moire'.DS.'Moire.php');
$moire = new Moire();
// $moire->invoice_generate(133);

vd(aes128Encrypt('1234567890123456', 'student1sess1'));

function aes128Encrypt($key, $data) {
	if(16 !== strlen($key)) $key = hash('MD5', $key, true);
	$padding = 16 - (strlen($data) % 16);
	$data .= str_repeat(chr($padding), $padding);
	return mcrypt_encrypt(MCRYPT_RIJNDAEL_128, $key, $data, MCRYPT_MODE_CBC, str_repeat("\0", 16));
}
 
function aes256Encrypt($key, $data) {
	if(32 !== strlen($key)) $key = hash('SHA256', $key, true);
	$padding = 16 - (strlen($data) % 16);
	$data .= str_repeat(chr($padding), $padding);
	return mcrypt_encrypt(MCRYPT_RIJNDAEL_128, $key, $data, MCRYPT_MODE_CBC, str_repeat("\0", 16));
}
 
function aes128Decrypt($key, $data) {
	if(16 !== strlen($key)) $key = hash('MD5', $key, true);
	$data = mcrypt_decrypt(MCRYPT_RIJNDAEL_128, $key, $data, MCRYPT_MODE_CBC, str_repeat("\0", 16));
	$padding = ord($data[strlen($data) - 1]);
	return substr($data, 0, -$padding);
}
 
function aes256Decrypt($key, $data) {
	if(32 !== strlen($key)) $key = hash('SHA256', $key, true);
	$data = mcrypt_decrypt(MCRYPT_RIJNDAEL_128, $key, $data, MCRYPT_MODE_CBC, str_repeat("\0", 16));
	$padding = ord($data[strlen($data) - 1]);
	return substr($data, 0, -$padding);
}
?>