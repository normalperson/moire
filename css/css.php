<?php
ob_start();
define('ANONYMOUS', 1);
require_once('../init.inc.php');
ob_end_clean();
getCSS();
?>