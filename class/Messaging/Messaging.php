<?php
class Messaging {
	static $tl = 'Messaging';
	var $eachRecLoad = 20;
	
	function renderDropDown($showLimit = 10, $height = 250) {
		global $DB, $USER;
		static $messageListCount;
		if ($messageListCount) ++$messageListCount;
		else $messageListCount = 1;
		$id = "messageList_{$messageListCount}";
			
		$unreadID = array();
		$unreadCount = $DB->getOne("select count(*) from fcuserdiary 
		where di_cat = 'MESSAGE' and di_userid = :0 and di_status = :1", array($USER->userid, 'UNREAD'));
		
		$rs = $DB->getArray("select a.*, b.*, to_char(di_display_date, 'DD-Mon-YYYY hh:mi AM') di_display_date_disp from fcuserdiary a 
		left join fcuser b on usr_userid = di_created_by
		where di_cat = 'MESSAGE' and di_userid = :0 and di_status != 'DELETED' and di_display_date <= now()
		order by di_display_date desc, di_id desc limit {$showLimit}", array($USER->userid), PDO::FETCH_ASSOC);
		$reccount = count($rs);
		$labelCount = ($reccount > $showLimit) ? $showLimit."+" : $reccount;
		
		
		$html = 
"<li id='{$id}' data-showlimit='{$showLimit}' data-height='{$height}' class='nav-icon-btn nav-icon-btn-success dropdown messageLI'>
	<a href='javascript:void(0)' class='dropdown-toggle' data-toggle='dropdown'>".
		(($unreadCount) ? "<span class='label'>{$unreadCount}</span>" : "").
		"<i class='nav-icon fa fa-envelope'></i>
		<span class='small-screen-text'>".tl('Messages', false, self::$tl)."</span>
	</a>
	<div class='dropdown-menu widget-messages-alt no-padding' style='width: 300px'>
		<div class='messages-list' id='main-navbar-messages'>";
		
		foreach ($rs as $i=>$row) {
			$displaysender = ($row['usr_name']) ? $row['usr_name'] : (($row['di_created_by']) ? $row['di_created_by'] : tl('Anonymous', false, self::$tl));
			$senderimage = getUserAvatarImage($row['di_created_by']);
			if ($row['di_status'] == 'UNREAD') $unreadID[] = $row['di_id'];
			$html .= 
			"<div class='message {$row['di_status']}' data-msgid='{$row['di_id']}'>
				<button type='button' class='close'>&times</button>
				<img src='{$senderimage}' alt=\"{$displaysender}\" title=\"{$displaysender}\" class='message-avatar'>
				<span class='message-subject'>{$row['di_subject']}</span>
				<div class='message-description' >
					from  &nbsp;<a href='javascript:void(0)' class='message-reply-link' data-userid='{$row['di_created_by']}'>{$displaysender}</a>
					&nbsp;·&nbsp;
					<span title='{$row['di_display_date_disp']}'>".time_different_string($row['di_display_date'])."</span>
				</div>
			</div>";
		}
		
		$classurl = WEB_HREF.'/'.__CLASS__;
		$html .= 
		"</div>
			<a href='javascript:void(0)' class='messages-link messages-view-all-link'>".(($reccount) ? tl('VIEW ALL', false, self::$tl) : tl('NO MESSAGES', false, self::$tl))."</a>
			<a href='javascript:void(0)' class='messages-link messages-compose-link'>".tl('COMPOSE', false, self::$tl)."</a>
	</div>
	<script type='text/javascript'>
		(function(){
			var \$msglist = $('#{$id}');
			var unreadList = ".json_encode($unreadID).";
			\$msglist
				.bind('reload', function (e) {
					var \$this = $(this);
					ajaxRenderHTML('{$classurl}/ajaxRenderDropDown', {'showlimit' : \$this.data('showlimit'), 'height' : \$this.data('height')}, \$(this), 'replaceWith');
				})
				.on('shown.bs.dropdown', function () {
					if (unreadList.length > 0) {
						ajaxGetJSON('{$classurl}/ajaxUpdateMessageStatus', {'msgid' : unreadList, 'status' : 'READ'}, function (ret) {
							if (ret) {
								unreadList = [];
								\$msglist.one('hidden.bs.dropdown', function () {
									$(this).trigger('reload');
								})
							}
						});
					}
				})
				.find('div.message').on('click', function(e) {
					e.stopPropagation();
				})
				.find('button.close').on('click', function(e) {
					e.stopPropagation();
					var \$msgDiv = $(this).closest('div.message');
					ajaxGetJSON('{$classurl}/ajaxUpdateMessageStatus', {'msgid' : [\$msgDiv.data('msgid')], 'status' : 'DELETED'}, function (ret) {
						if (ret) {
							\$msgDiv.fadeOut(200, function() {
								$(this).remove();
							});
						}
					})
				})
			$('#{$id} #main-navbar-messages').slimScroll({ height: {$height} });
			\$msglist.find('.messages-link.messages-view-all-link').click(function (e) {
				var \$modal = createEmptyModal('messageListModal');
				ajaxRenderHTML('{$classurl}/ajaxRenderPanel', {}, \$modal.find('.modal-content'), 'html', function () {
					\$modal.modal('show').one('hidden.bs.modal', function () {
						\$msglist.trigger('reload');
						\$modal.remove();
					});
				});
				
			})
			\$msglist.find('.messages-link.messages-compose-link').click(function (e) {
				var \$modal = createEmptyModal('messageComposeModal');
				ajaxRenderHTML('{$classurl}/ajaxRenderCompose', {}, \$modal.find('.modal-content'), 'html', function () {
					\$modal.modal('show').one('hidden.bs.modal', function () {
						\$msglist.trigger('reload');
						\$modal.remove();
					});
				});
			})
			\$msglist.find('.message-reply-link').click(function (e) {
				var \$modal = createEmptyModal('messageComposeModal');
				ajaxRenderHTML('{$classurl}/ajaxRenderCompose', {'defaultRecp': [$(this).data('userid')]}, \$modal.find('.modal-content'), 'html', function () {
					\$modal.modal('show').one('hidden.bs.modal', function () {
						\$msglist.trigger('reload');
						\$modal.remove();
					});
				});
			})
			
			\$msglist.find('.dropdown-toggle').click(function (e) {
				if ($(this).find('.small-screen-text').is(':visible')) { //mobile view
					\$msglist.find('.messages-link.messages-view-all-link').click();
				}
			})
		})();
	</script>
</li>";
		return $html;
	}
	
	
	function renderCompose($defaultRecp = array()) {
		global $DB, $USER;
		$smarty = new Smarty();
		$smarty->setTemplateDir(dirname(__FILE__).DS.'templates');
		$smarty->setCompileDir(DOC_DIR.DS.'smarty'.DS.'templates_c');
		$smarty->setCacheDir(DOC_DIR.DS.'smarty'.DS.'cache');
		$smarty->setConfigDir(DOC_DIR.DS.'smarty'.DS.'configs');
		
		$defaultRecpArr = array();
		foreach($defaultRecp as $r) {
			$defaultRecpArr[] = $DB->getRow("select usr_userid as id, usr_name as text from fcuser where usr_userid=:0", array($r), PDO::FETCH_ASSOC);
		}
		$classurl = WEB_HREF.'/'.__CLASS__;
		$smarty->assign('classurl', $classurl);
		$smarty->assign('tl', self::$tl);
		$smarty->assign('defaultRecp', $defaultRecpArr);
		return $smarty->fetch('compose.html');
		
	}
	
	function ajaxSearchRecipient() {
		global $DB;
		$q = $_REQUEST['query'];
		$qstr = $DB->quote("%{$q}%");
	
		$rs = $DB->getArray("select usr_userid as id, usr_name||' ('||usr_userid||')' as text from fcuser
		where ( usr_userid ilike {$qstr} or usr_name ilike {$qstr} ) limit 10", array(),PDO::FETCH_ASSOC);

		echo json_encode($rs);
	}
	
	function ajaxGetRecipient() {
		global $DB;
		$useridstr = $_REQUEST['userid'];
		$useridarr = explode(",", $useridstr);
		$ret = array();
		foreach ($useridarr as $userid) {
			$row = $DB->getRow("select usr_userid as id, usr_name||' ('||usr_userid||')' as text from fcuser where usr_userid = :0", array($userid), PDO::FETCH_ASSOC);
			if ($row) $ret[] = $row;
		}		
		
		echo json_encode($ret);
	}
	
	function ajaxSubmitMessage() {
		$recipients = $_REQUEST['recipient'];
		$content = $_REQUEST['content'];
		$ok = $this->sendMessage($recipients, $content);
		if($ok) echo json_encode(true);
		else echo json_encode(false);
	}
	
	static function sendMessage($recipients, $msg, $sender = false) {
		global $USER, $DB;
		if (is_string($recipients)) {
			$recipients = explode(',',$recipients);
			$recipients = array_map('trim', $recipients);
			$recipients = array_filter($recipients);
		}
		if (is_array($recipients)) {
			$ret = array();
			if (!$sender) $sender = $USER->userid;
			foreach ($recipients as $r) {
				$data = array(
					'di_created_by'=>$sender,
					'di_userid'=>$r,
					'di_cat'=>'MESSAGE',
					'di_status'=>'UNREAD',
					'di_subject'=>$msg,
				);
				$ok = $DB->doInsert('fcuserdiary', $data);
				if (!$ok) return false;
				$ret[] = $DB->lastID();
				global $PUSHSOCKET;
				if ($PUSHSOCKET) {	
					if ($sessid = getuserSessID($r)) {
						$PUSHSOCKET->send(json_encode(array('topic'=>$sessid, 'msg'=>tl("You've received a new message", false, self::$tl, getUserLang($r)), 'cat'=>'MESSAGE')));
					}
				}
			}
			return $ret;
		}
		else return false;
	}
	
	function renderPanel() {
		global $DB, $USER;
		static $msgPanelCount;
		if ($msgPanelCount) ++$msgPanelCount;
		else $msgPanelCount = 1;
		$id = "messagePanel_{$msgPanelCount}";
		$html = "";
		$showLimit = $this->eachRecLoad;
		
		$loadRows = $showLimit +1;
		$rs = $DB->getArray("select a.*, b.*, to_char(di_display_date, 'DD-Mon-YYYY hh:mi AM') di_display_date_disp from fcuserdiary a 
		left join fcuser b on usr_userid = di_created_by
		where di_cat = 'MESSAGE' and di_userid = :0 and di_status != 'DELETED' and di_display_date <= now()
		order by di_display_date desc, di_id desc limit {$loadRows}", array($USER->userid), PDO::FETCH_ASSOC);
		$reccount = count($rs);
		$classurl = WEB_HREF.'/'.__CLASS__;

		
		$html .= "
<div class='panel widget-messages-alt' id='{$id}' style='margin:0' data-showlimit='{$showLimit}'>
	<div class='panel-heading'>
		<span class='panel-title'><i class='panel-title-icon fa fa-envelope'></i>".tl('Messages', false, self::$tl)."</span>
		<div class='panel-heading-controls'>
			<button class='btn btn-xs messages-compose-button'>".tl('Compose', false, self::$tl)."</button>
			<button type='button' class='close' data-dismiss='modal' aria-hidden='true'>&times;</button>
		</div>
	</div>
	<div class='panel-body padding-sm'>
		<div class='messages-list'>";
		$lastLoadedID = $lastLoadedDate = null;
		$unreadList = array();
		foreach ($rs as $i=>$row) {
			if ($i >= $showLimit) break;
			if ($row['di_status'] == 'UNREAD') $unreadList[] = $row['di_id'];
			$displaysender = ($row['usr_name']) ? $row['usr_name'] : (($row['di_created_by']) ? $row['di_created_by'] : tl('Anonymous', false, self::$tl));
			$senderimage = getUserAvatarImage($row['di_created_by']);
			
			$html .= 
			"<div class='message {$row['di_status']}' data-msgid='{$row['di_id']}'>
				<button type='button' class='close'>&times</button>
				<img src='{$senderimage}' alt=\"{$displaysender}\" title=\"{$displaysender}\" class='message-avatar'>
				<span class='message-subject'>{$row['di_subject']}</span>
				<div class='message-description' >
					".tl('from',false,self::$tl)."  <a href='javascript:void(0)' class='message-reply-link' data-userid='{$row['di_created_by']}'>{$displaysender}</a>
					&nbsp;·&nbsp;
					<span title='{$row['di_display_date_disp']}'>".time_different_string($row['di_display_date'])."</span>
				</div>
			</div>";
			
			$lastLoadedID = $row['di_id'];
			$lastLoadedDate = $row['di_display_date_disp'];
		}
		if ($reccount > $showLimit) 
			$html .= 
			"<a href='javascript:void(0)' class='messages-link'>".tl('MORE MESSAGES', false, self::$tl)."</a>";
		
		$html .= "
	</div>
</div>
<script type='text/javascript'>
(function(){
	var \$msgPanel = $('#{$id}');
	var lastLoadedMsgID = '{$lastLoadedID}';
	var lastLoadedMsgDate = '{$lastLoadedDate}';
	var unreadList = ".json_encode($unreadList).";
	
	function readUnreadMessages() {
		if (unreadList.length > 0) {
			ajaxGetJSON('{$classurl}/ajaxUpdateMessageStatus', {'msgid' : unreadList, 'status' : 'READ'}, function (ret) {
				if (ret) {
					unreadList = [];
				}
			});
		}
	
	}
	readUnreadMessages();
	\$msgPanel.on('click', '.message > button.close', function (e) {
		e.stopPropagation();
		var \$msgDiv = $(this).closest('div.message');
		ajaxGetJSON('{$classurl}/ajaxUpdateMessageStatus', {'msgid' : [\$msgDiv.data('msgid')], 'status' : 'DELETED'}, function (ret) {
			if (ret) {
				\$msgDiv.fadeOut(200, function() {
					$(this).remove();
				});
			}
		})
	}).on('click', '.messages-link', function (e) {
		if (lastLoadedMsgID && lastLoadedMsgDate) {
			var \$this = $(this);
			ajaxGetJSON('{$classurl}/ajaxRenderNextMessages', {'beforeID':lastLoadedMsgID, 'beforeDate':lastLoadedMsgDate},function (ret) {
				if (ret.html) {
					var \$newcontent = $(ret.html).hide();
					\$this.before(\$newcontent.fadeIn());
					lastLoadedMsgID = ret.lastID;
					lastLoadedMsgDate = ret.lastDate;
					if (!ret.stillhasmore) \$this.remove();
					if (ret.unreadList) {	
						var newunread = ret.unreadList;
						unreadList = unreadList.concat(newunread);
					}
					readUnreadMessages();
				}
			});
		}
		else $(this).remove();
	}).on('click', '.messages-compose-button', function (e) {
		var \$exmodal = $(this).closest('#messageListModal');
		if (\$exmodal.length > 0) {
			\$exmodal.modal('hide');
		}
		var \$modal = createEmptyModal('messageComposeModal');
		ajaxRenderHTML('{$classurl}/ajaxRenderCompose', {}, \$modal.find('.modal-content'), 'html', function () {
			\$modal.modal('show').one('hidden.bs.modal', function () {
				\$modal.remove();
			});
		});
	}).on('click', '.message-reply-link', function (e) {
		var \$exmodal = $(this).closest('#messageListModal');
		if (\$exmodal.length > 0) {
			\$exmodal.modal('hide');
		}
		var \$modal = createEmptyModal('messageComposeModal');
		ajaxRenderHTML('{$classurl}/ajaxRenderCompose', {'defaultRecp': [$(this).data('userid')]}, \$modal.find('.modal-content'), 'html', function () {
			\$modal.modal('show').one('hidden.bs.modal', function () {
				\$modal.remove();
			});
		});
	})
	
})();
</script>";
		
		return $html;
	}
	
	function ajaxRenderPanel() {
		echo $this->renderPanel();
	}
	
	function ajaxRenderCompose() {
		$defrecp = (!empty($_POST['defaultRecp'])) ? $_POST['defaultRecp'] : array();
		echo $this->renderCompose($defrecp);
	}
	
	function ajaxRenderNextMessages() {
		global $DB, $USER;
		$beforeid = $_POST['beforeID'];
		$beforedate = $_POST['beforeDate'];
		$showLimit = $this->eachRecLoad;
		$loadRows = $showLimit +1;
		
		$rs = $DB->getArray("select a.*, b.*, to_char(di_display_date, 'DD-Mon-YYYY hh:mi AM') di_display_date_disp from fcuserdiary a 
		left join fcuser b on usr_userid = di_created_by
		where di_cat = 'MESSAGE' and di_userid = :0 and di_status != 'DELETED' and di_display_date <= now()
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
			$displaysender = ($row['usr_name']) ? $row['usr_name'] : (($row['di_created_by']) ? $row['di_created_by'] : 'Anonymous');
			$senderimage = getUserAvatarImage($row['di_created_by']);
			
			$html .= 
			"<div class='message {$row['di_status']}' data-msgid='{$row['di_id']}'>
				<button type='button' class='close'>&times</button>
				<img src='{$senderimage}' alt=\"{$displaysender}\" title=\"{$displaysender}\" class='message-avatar'>
				<span class='message-subject'>{$row['di_subject']}</span>
				<div class='message-description' >
					".tl('from',false,self::$tl)."  <a href='javascript:void(0)'>{$displaysender}</a>
					&nbsp;·&nbsp;
					<span title='{$row['di_display_date_disp']}'>".time_different_string($row['di_display_date'])."</span>
				</div>
			</div>";
			
			$lastLoadedID = $row['di_id'];
			$lastLoadedDate = $row['di_display_date_disp'];
			
		}
		if ($reccount > $showLimit) $stillhasmore = true;
		
		echo json_encode(array('html'=>$html, 'stillhasmore'=>$stillhasmore, 'lastID'=>$lastLoadedID, 'lastDate'=>$lastLoadedDate, 'unreadList'=>$unreadList));
	}
	
	
	
	function ajaxUpdateMessageStatus() {
		global $DB;
		$ret = false;
		$msgids = $_POST['msgid'];
		$status = $_POST['status'];
		if ($msgids) {
			$msgid_where = implode(',', $msgids);
			$ok = $DB->execute("update fcuserdiary set di_status = :0 where di_id in ({$msgid_where})", array($status));
			if ($ok) $ret = true;
		}
		echo json_encode($ret);
	}
	
	function ajaxRenderDropDown() {
		$showlimit = $_POST['showlimit'];
		$height = $_POST['height'];
		echo $this->renderDropDown($showlimit,$height);
	}
}
?>

