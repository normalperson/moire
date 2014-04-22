<?php
class AppMenu extends Menu{
	var $class;
	var $function;
	var $url;
	var $treeRS;
	
	function __construct(){
		parent::__construct();
		$this->class = isset($_GET['webc'])?$_GET['webc']:false;
		$this->function = isset($_GET['webf'])?$_GET['webf']:false;
		$this->loadMenu();
	}
	
	function loadMenu() {
		global $DB, $USER;
		$menuRS = $DB->GetArray("select * from fcmenu where mn_status = 'ACTIVE' order by mn_order", false, PDO::FETCH_ASSOC);
		foreach ($menuRS as $i=>$r) {
			if ($r['mn_pmscode'] && !$USER->inGroup($r['mn_pmscode'])) {
				unset($menuRS[$i]);
				continue;
			}
		}
		$retRS = arr2tree($menuRS, 'mn_id', 'mn_parentid');
		foreach ($retRS as $rt) {
			if (!$rt['mn_parentid']) {
				$this->treeRS = $rt['__CHILDREN'];
				break;
			}
		}
	}
	
	function render(){
		if (!$this->treeRS) {
			$this->loadMenu();
			if (!$this->treeRS) return;
		}
		$this->renderBootstrapNavi($this->treeRS);
	}
	
	function renderBootstrapNavi($menuRS, $lvl = 0, $prependLi = array()) {
		if ($lvl === 0) echo "<ul class='nav navbar-nav'>";
		else echo "<ul class='dropdown-menu'>";
		foreach ($prependLi as $li) {
			echo $li;
		}
		foreach ($menuRS as $r) {
			$anchorclass = "without-link";
			$url = $this->getURL($r);
			
			if (!$url) $url = "javascript:void(0)";
			else $anchorclass = "with-link";
			
			$liclass = $this->isActiveMenu($r) ? ' active' : '';
			
			if ($r['__CHILDREN']) {
				if ($lvl === 0) {
					echo "<li class='dropdown $liclass'><a href='$url' class='dropdown-toggle $anchorclass' data-toggle='dropdown'>{$r['mn_title']} <span class='caret'></span></a>";
				}
				else echo "<li class='dropdown dropdown-submenu'><a href='$url' class='dropdown-toggle $anchorclass' data-toggle='dropdown'>{$r['mn_title']}</a>";
				
				$prependLi = array();
				if ($url != "javascript:void(0)") {
					$prependLi[] = "<li><a href='$url' class='$anchorclass'>{$r['mn_title']}</a></li>";
					$prependLi[] = "<li class='divider'></li>";
				}
				$this->renderBootstrapNavi($r['__CHILDREN'],$lvl+1, $prependLi);
				echo "</li>";
			}
			else {
				if ($lvl === 0) {
					if ($anchorclass != 'without-link') echo "<li class='$liclass'><a href='$url' class='$anchorclass'>{$r['mn_title']}</a></li>";
				}
				else echo "<li><a href='$url' class='$anchorclass'>{$r['mn_title']}</a></li>";
			}
		}
		echo "</ul>";
	}
	
	function isActiveMenu($rs) {
		$classList = array($rs['mn_class']);
		if($rs['mn_classlist']) $classList = array_merge($classList, array_filter(array_map('trim', explode(',', $rs['mn_classlist']))));
		
		$funcList = array($rs['mn_func']);
		if($rs['mn_funclist']) $funcList = array_merge($funcList, array_filter(array_map('trim', explode(',', $rs['mn_funclist']))));
		
		if (in_array($this->class, $classList) && in_array($this->function, $funcList)) {
			return true;
		}
		
		foreach ($rs['__CHILDREN'] as $i=>$j) {
			$check = $this->isActiveMenu($j);
			if ($check) return true;
		}
		return false;
	}
	
	function getURL($r) {
		$url = false;
		if ($r['mn_webflag'] == 'Y' && !empty($r['mn_class']) && !empty($r['mn_func']))  {
			$url = "/".APP."/web/{$r['mn_class']}/{$r['mn_func']}";
		}
		else if ($r['mn_webflag'] != 'Y' && !empty($r['mn_url'])) {
			$url = $r['mn_url'];
		}
		if($url && !empty($r['mn_param'])) {
			if (strpos($url, "?")) $url .= '&'.$r['mn_param'];
			else $url .= '?'.$r['mn_param'];
		}
		return $url;
	}
	
	function getDefaultPage($rs = false) {
		$r = ($rs) ?  $rs : (($this->treeRS) ? $this->treeRS : false);
		foreach ($r as $i=>$p) {
			$url = $this->getURL($p);
			if (!$url && !empty($p['__CHILDREN'])) $url = $this->getDefaultPage($p['__CHILDREN']);
			if ($url) return $url;
		}
		return false;
	}
	
	
/*Customization for SHINE menu*/	

	function genRequestList() {
		global $USER;
		$html = "";
		
		if ($USER->inGroup('REQUEST_ADHOC_ACTIVITY')) {
			$frameURL = WEB_HREF."/Task/create?opid=42";
			$html .= "<li><a href='javascript:void(0)' id='requestAdhocEvent'>Adhoc Activity Registration</a></li>
<script type='text/javascript'>
$('#requestAdhocEvent').click(function () {
	popupFrameContent('{$frameURL}', 'Adhoc Activity Registration', '90%', function (\$modal) {
		if (\$modal.data('post')) {
			$('#taskPanel').find('.panel-reload').click();
		}
	});
})
</script>";
		}
		if ($USER->inGroup('PERFORM_TSAT')) {
			$URL =  WEB_HREF."/Home/TSAT";
			$html .= "<li><a href='{$URL}' id='performTSAT'>Perform TSAT</a></li>";
		}
		
		if ($USER->inGroup('ADHOC_NOTIFICATION')) {
			$frameURL = WEB_HREF."/Home/adhocNotification";
			$html .= "<li><a href='javascript:void(0)' id='requestAdhocNotification'>Adhoc Notification</a></li>
<script type='text/javascript'>
$('#requestAdhocNotification').click(function () {
	popupFrameContent('{$frameURL}', 'Adhoc Notification', '70%');
})
</script>";
		}
		
		return $html;
	}
}
?>