<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'init.inc.php');

function html_header($headerTemplate='header.html'){
	global $HTML,$THEME,$DB,$USER;
	if($HTML->smarty){

		require_once('inc/AppMenu.inc.php');
		$Menu = new AppMenu();
		$HTML->addCSS('css/'.$THEME.'/bootstrap.min.css');
		$HTML->addCSS('css/'.$THEME.'/pixel-admin.min.css');
		$HTML->addCSS('css/'.$THEME.'/widgets.min.css');
		$HTML->addCSS('css/'.$THEME.'/rtl.min.css');
		$HTML->addCSS('css/'.$THEME.'/themes.min.css');
		$HTML->addCSS('css/'.$THEME.'/dbo.css');
		$HTML->addCSS('css/'.$THEME.'/custom.css');
		$HTML->addJS('js/jquery-2.1.1.min.js');
		$HTML->addJS('js/bootstrap.min.js');
		$HTML->addJS('js/pixel-admin.min.js');
		$HTML->addJS('js/jquery.ui.draggable.min.js');
		$HTML->addJS('js/jquery.ui.droppable.min.js');
		$HTML->addJS('js/moment.min.js');
		$HTML->addJS('js/script.js');
		$HTML->addJS('js/init.js');
		
		$HTML->title = "PnD's Moire Portal";


		// live notification
		$HTML->addJS('js/autobahn.min.js');
		$HTML->addJS('js/live-notification.js');
		
		
		include_once(CLASS_DIR.DS.'PMTask'.DS.'PMTask.php');
		$PMTask = new PMTask();
		$taskNaviHTML = $PMTask->renderNavi();
		$Menu->additionalLI = $taskNaviHTML;
		$HTML->smarty->assign('Menu', $Menu);
		
		// include Widgets in Menu
		include_once(CLASS_DIR.DS.'NotificationList'.DS.'NotificationList.php');
		$HTML->smarty->assign('NotificationList', new NotificationList());
		
		include_once(CLASS_DIR.DS.'Messaging'.DS.'Messaging.php');
		$HTML->smarty->assign('Messaging', new Messaging());
		
		$HTML->smarty->assign('PMTask', $PMTask);
		
		
		$HTML->genHeader($headerTemplate);

	}
}

?>