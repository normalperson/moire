<?php
class Notification {

	var $severe_class_map = array(
		5=>'danger',
		4=>'warning',
		3=>'default',
		2=>'info',
		1=>'success',
		0=>'primary',
	);
	var $cat_icon_class = array(
		'NOTICE'=>'fa-info',
		'SYSTEM'=>'fa-hdd-o',
		'BATCHJOB'=>'fa-clock-o',
		'UNKNOWN'=>'fa-question',
	);

	var $eachRecLoad = 20;
	
	function renderDropDown($showLimit = 10, $height = 250) {
		global $DB, $USER;
		static $notListCount;
		if ($notListCount) ++$notListCount;
		else $notListCount = 1;
		$id = "notificationList_{$notListCount}";
		
		$severe_class_map = $this->severe_class_map;
		$cat_icon_class = $this->cat_icon_class;
		
		$unreadID = array();
		list($unreadCount, $maxSevere) = $DB->getRow("select count(*), coalesce(max(di_severity),3) from fcuserdiary 
		where di_cat = 'NOTICE' and di_userid = :0 and di_status = :1", array($USER->userid, 'UNREAD'));
		
		$rs = $DB->getArray("select a.*, coalesce(di_cat2,di_cat) di_cat2, to_char(di_display_date, 'DD-Mon-YYYY hh:mi AM') di_display_date_disp from fcuserdiary a 
		where di_cat = 'NOTICE' and di_userid = :0 and di_status != 'DELETED' and di_display_date <= now()
		order by di_display_date desc, di_id desc limit {$showLimit}", array($USER->userid), PDO::FETCH_ASSOC);
		$reccount = count($rs);
		$labelCount = ($reccount > $showLimit) ? $showLimit."+" : $reccount;
		
		$html = 
"<li id='{$id}' data-showlimit='{$showLimit}' data-height='{$height}' class='nav-icon-btn nav-icon-btn-{$severe_class_map[$maxSevere]} dropdown noificationLI'>
	<a href='javascript:void(0)' class='dropdown-toggle' data-toggle='dropdown'>".
		(($unreadCount) ? "<span class='label'>{$unreadCount}</span>" : "").
		"<i class='nav-icon fa fa-bullhorn'></i>
		<span class='small-screen-text'>Notifications</span>
	</a>
	<div class='dropdown-menu widget-notifications no-padding' style='width: 300px'>
		<div class='notifications-list' id='main-navbar-notifications'>";
		
		foreach ($rs as $i=>$row) {
			if ($row['di_status'] == 'UNREAD') $unreadID[] = $row['di_id'];
			$html .= 
			"<div class='notification {$row['di_status']}' data-notid='{$row['di_id']}'>
				<button type='button' class='close'>&times</button>
				<div class='notification-title text-{$severe_class_map[$row['di_severity']]}'>{$row['di_cat2']}
				</div>
				<div class='notification-description'>
					{$row['di_subject']}
				</div>
				<div class='notification-ago' title='{$row['di_display_date_disp']}'>".time_different_string($row['di_display_date'])."</div>
				<div class='notification-icon fa ".((!empty($cat_icon_class[$row['di_cat2']])) ? $cat_icon_class[$row['di_cat2']] : $cat_icon_class['UNKNOWN']).
				" bg-{$severe_class_map[$row['di_severity']]}'>
				</div>
			</div>";
		}
		
		$classurl = WEB_HREF.'/'.__CLASS__;
		$html .= 
		"</div>
			<a href='javascript:void(0)' class='notifications-link'>".(($reccount) ? 'VIEW ALL' : 'NO NOTIFICATION')."</a>
	</div>
	<script type='text/javascript'>
		(function(){
			var \$notlist = $('#{$id}');
			var unreadList = ".json_encode($unreadID).";
			\$notlist
				.bind('reload', function (e) {
					var \$this = $(this);
					ajaxRenderHTML('{$classurl}/ajaxRenderDropDown', {'showlimit' : \$this.data('showlimit'), 'height' : \$this.data('height')}, \$(this), 'replaceWith');
				})
				.on('shown.bs.dropdown', function () {
					if (unreadList.length > 0) {
						ajaxGetJSON('{$classurl}/ajaxUpdateNotificationStatus', {'notid' : unreadList, 'status' : 'READ'}, function (ret) {
							if (ret) {
								unreadList = [];
								\$notlist.one('hidden.bs.dropdown', function () {
									$(this).trigger('reload');
								})
							}
						});
					}
				})
				.find('div.notification').on('click', function(e) {
					e.stopPropagation();
				})
				.find('button.close').on('click', function(e) {
					e.stopPropagation();
					var \$notDiv = $(this).closest('div.notification');
					ajaxGetJSON('{$classurl}/ajaxUpdateNotificationStatus', {'notid' : [\$notDiv.data('notid')], 'status' : 'DELETED'}, function (ret) {
						if (ret) {
							\$notDiv.fadeOut(200, function() {
								$(this).remove();
							});
						}
					})
				})
			$('#{$id} #main-navbar-notifications').slimScroll({ height: {$height} });
			\$notlist.find('.notifications-link').click(function (e) {
				var \$modal = createEmptyModal('notificationListModal');
				ajaxRenderHTML('{$classurl}/ajaxRenderPanel', {}, \$modal.find('.modal-content'), 'html', function () {
					\$modal.modal('show').one('hidden.bs.modal', function () {
						\$notlist.trigger('reload');
						\$modal.remove();
					});
				});
				
			})
			\$notlist.find('.dropdown-toggle').click(function (e) {
				if ($(this).find('.small-screen-text').is(':visible')) { //mobile view
					\$notlist.find('.notifications-link').click();
				}
			})
		})();
	</script>
</li>";
		return $html;
	}

	function renderPanel() {
		global $DB, $USER;
		static $notPanelCount;
		if ($notPanelCount) ++$notPanelCount;
		else $notPanelCount = 1;
		$id = "notificationPanel_{$notPanelCount}";
		$html = "";
		$severe_class_map = $this->severe_class_map;
		$cat_icon_class = $this->cat_icon_class;
		$showLimit = $this->eachRecLoad;
		
		$loadRows = $showLimit +1;
		$rs = $DB->getArray("select a.*, coalesce(di_cat2,di_cat) di_cat2, to_char(di_display_date, 'DD-Mon-YYYY hh:mi AM') di_display_date_disp from fcuserdiary a 
		where di_cat = 'NOTICE' and di_userid = :0 and di_status != 'DELETED' and di_display_date <= now()
		order by di_display_date desc, di_id desc limit {$loadRows}", array($USER->userid), PDO::FETCH_ASSOC);
		$reccount = count($rs);
		$classurl = WEB_HREF.'/'.__CLASS__;
		
		$html .= "
<div class='panel widget-notifications' id='{$id}' style='margin:0' data-showlimit='{$showLimit}'>
	<div class='panel-heading'>
		<span class='panel-title'><i class='panel-title-icon fa fa-bullhorn'></i>Notifications</span>
		<button type='button' class='close' data-dismiss='modal' aria-hidden='true'>&times;</button>
	</div>
	<div class='panel-body padding-sm'>
		<div class='notifications-list'>";
		$lastLoadedID = $lastLoadedDate = null;
		$unreadList = array();
		foreach ($rs as $i=>$row) {
			if ($i >= $showLimit) break;
			if ($row['di_status'] == 'UNREAD') $unreadList[] = $row['di_id'];
			$html .= 
			"<div class='notification {$row['di_status']}' data-notid='{$row['di_id']}' data-notdate='{$row['di_display_date_disp']}'>
				<button type='button' class='close'>&times</button>
				<div class='notification-title text-{$severe_class_map[$row['di_severity']]}'>{$row['di_cat2']}
				</div>
				<div class='notification-description'>
					{$row['di_subject']}
				</div>
				<div class='notification-ago' title='{$row['di_display_date_disp']}'>".time_different_string($row['di_display_date'])."</div>
				<div class='notification-icon fa ".((!empty($cat_icon_class[$row['di_cat2']])) ? $cat_icon_class[$row['di_cat2']] : $cat_icon_class['UNKNOWN']).
				" bg-{$severe_class_map[$row['di_severity']]}'>
				</div>
			</div>";
			$lastLoadedID = $row['di_id'];
			$lastLoadedDate = $row['di_display_date_disp'];
		}
		if ($reccount > $showLimit) 
			$html .= 
			"<a href='javascript:void(0)' class='notifications-link'>MORE NOTIFICATIONS</a>";
		
		$html .= "
	</div>
</div>
<script type='text/javascript'>
(function(){
	var \$notPanel = $('#{$id}');
	var lastLoadedNotID = '{$lastLoadedID}';
	var lastLoadedNotDate = '{$lastLoadedDate}';
	var unreadList = ".json_encode($unreadList).";
	
	function readUnreadNotifications() {
		if (unreadList.length > 0) {
			ajaxGetJSON('{$classurl}/ajaxUpdateNotificationStatus', {'notid' : unreadList, 'status' : 'READ'}, function (ret) {
				if (ret) {
					unreadList = [];
				}
			});
		}
	
	}
	readUnreadNotifications();
	\$notPanel.on('click', '.notification > button.close', function (e) {
		e.stopPropagation();
		var \$notDiv = $(this).closest('div.notification');
		ajaxGetJSON('{$classurl}/ajaxUpdateNotificationStatus', {'notid' : [\$notDiv.data('notid')], 'status' : 'DELETED'}, function (ret) {
			if (ret) {
				\$notDiv.fadeOut(200, function() {
					$(this).remove();
				});
			}
		})
	}).on('click', '.notifications-link', function (e) {
		if (lastLoadedNotID && lastLoadedNotDate) {
			var \$this = $(this);
			ajaxGetJSON('{$classurl}/ajaxRenderNextNotifications', {'beforeID':lastLoadedNotID, 'beforeDate':lastLoadedNotDate},function (ret) {
				if (ret.html) {
					var \$newcontent = $(ret.html).hide();
					\$this.before(\$newcontent.fadeIn());
					lastLoadedNotID = ret.lastID;
					lastLoadedNotDate = ret.lastDate;
					if (!ret.stillhasmore) \$this.remove();
					if (ret.unreadList) {	
						var newunread = ret.unreadList;
						unreadList = unreadList.concat(newunread);
					}
					readUnreadNotifications();
				}
			});
		}
		else $(this).remove();
	});
})();
</script>";
		
		return $html;
	}
	
	function ajaxRenderPanel() {
		echo $this->renderPanel();
	}
	
	function ajaxRenderNextNotifications() {
		global $DB, $USER;
		$beforeid = $_POST['beforeID'];
		$beforedate = $_POST['beforeDate'];
		$showLimit = $this->eachRecLoad;
		$loadRows = $showLimit +1;
		
		$severe_class_map = $this->severe_class_map;
		$cat_icon_class = $this->cat_icon_class;
		
		$rs = $DB->getArray("select a.*, coalesce(di_cat2,di_cat) di_cat2, to_char(di_display_date, 'DD-Mon-YYYY hh:mi AM') di_display_date_disp from fcuserdiary a 
		where di_cat = 'NOTICE' and di_userid = :0 and di_status != 'DELETED' and di_display_date <= now()
		and (di_id < :1 or di_display_date < to_timestamp(:2,'DD-Mon-YYYY hh:mi AM'))
		order by di_display_date desc, di_id desc limit {$loadRows}", array($USER->userid, $beforeid, $beforedate), PDO::FETCH_ASSOC);
		$reccount = count($rs);
		$classurl = WEB_HREF.'/'.__CLASS__;
		
		
		$html = "";
		$stillhasmore = false;
		$lastLoadedID = $lastLoadedDate = null;
		$unreadList = array();
		foreach ($rs as $i=>$row) {
			if ($i >= $showLimit) break;
			if ($row['di_status'] == 'UNREAD') $unreadList[] = $row['di_id'];
			$html .= 
			"<div class='notification {$row['di_status']}' data-notid='{$row['di_id']}' data-notdate='{$row['di_display_date_disp']}'>
				<button type='button' class='close'>&times</button>
				<div class='notification-title text-{$severe_class_map[$row['di_severity']]}'>{$row['di_cat2']}
				</div>
				<div class='notification-description'>
					{$row['di_subject']}
				</div>
				<div class='notification-ago' title='{$row['di_display_date_disp']}'>".time_different_string($row['di_display_date'])."</div>
				<div class='notification-icon fa ".((!empty($cat_icon_class[$row['di_cat2']])) ? $cat_icon_class[$row['di_cat2']] : $cat_icon_class['UNKNOWN']).
				" bg-{$severe_class_map[$row['di_severity']]}'>
				</div>
			</div>";
			$lastLoadedID = $row['di_id'];
			$lastLoadedDate = $row['di_display_date_disp'];
		}
		if ($reccount > $showLimit) $stillhasmore = true;
		
		echo json_encode(array('html'=>$html, 'stillhasmore'=>$stillhasmore, 'lastID'=>$lastLoadedID, 'lastDate'=>$lastLoadedDate, 'unreadList'=>$unreadList));
	}
	
	function ajaxUpdateNotificationStatus() {
		global $DB;
		$ret = false;
		$notids = $_POST['notid'];
		$status = $_POST['status'];
		if ($notids) {
			$notid_where = implode(',', $notids);
			$ok = $DB->execute("update fcuserdiary set di_status = :0 where di_id in ({$notid_where})", array($status));
			if ($ok) $ret = true;
		}
		echo json_encode($ret);
	}
	
	function ajaxRenderDropDown() {
		$showlimit = $_POST['showlimit'];
		$height = $_POST['height'];
		echo $this->renderDropDown($showlimit,$height);
	}
	
	
	static function send($recipients, $subject, $content = null) {
		global $USER, $DB;
		if (is_string($recipients)) {
			$recipients = explode(',',$recipients);
			$recipients = array_map('trim', $recipients);
			$recipients = array_filter($recipients);
		}
		if (is_array($recipients)) {
			$ret = array();
			foreach ($recipients as $r) {
				$data = array(
					'di_created_by'=>'*'.APP,
					'di_userid'=>$r,
					'di_cat'=>'NOTICE',
					'di_status'=>'UNREAD',
					'di_subject'=>$subject,
					'di_text'=>$content,
				);
				$ok = $DB->doInsert('fcuserdiary', $data);
				if (!$ok) return false;
				$ret[] = $DB->lastID();
				
				global $PUSHSOCKET;
				if ($PUSHSOCKET) {
					if ($sessid = getuserSessID($r)) {
						$PUSHSOCKET->send(json_encode(array('topic'=>$sessid, 'msg'=>"You've received a new notification", 'cat'=>'NOTICE')));
					}
				}
			}
			return $ret;
		}
		else return false;
	}
	
}
?>