<?php
require_once(dirname(__FILE__).'/../../init.inc.php');
html_header();

global $HTML, $DB;
echo '<hr />';
// pr(get_defined_constants());
include(DOC_DIR.'/dbo/fongoption/fongoption.php');
?>