<?php
define('CORE_DIR', realpath(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'fcore'));
define('DOC_DIR', realpath(dirname(__FILE__).''.DIRECTORY_SEPARATOR.'..'));
define('INCLUDE_DIR', dirname(__FILE__));
define('WEB_DIR', DOC_DIR.''.DIRECTORY_SEPARATOR.'web');
define('CLASS_DIR', DOC_DIR.''.DIRECTORY_SEPARATOR.'class');
define('APP', basename(DOC_DIR));
define('APP_HREF', '/'.APP);
define('IMAGE_HREF', APP_HREF.'/image');
define('WEB_HREF', APP_HREF.'/web');
?>