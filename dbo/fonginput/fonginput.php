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

vd($moire->convertNumberToCurrency(12111122.01));
vd($moire->convertNumberToCurrency(12111122.21));
vd($moire->convertNumberToCurrency(12111122.1));
vd($moire->convertNumberToCurrency(12111122.123));
vd($moire->convertNumberToCurrency(12111122.125));
vd($moire->convertNumberToCurrency(12111122.127));
?>