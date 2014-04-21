<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'init.inc.php');
require_once('inc/AppMenu.inc.php');
$Menu = new AppMenu();
$defaultPage = $Menu->getDefaultPage();
if ($defaultPage) redirect($defaultPage);
else echo "No permission";
?>