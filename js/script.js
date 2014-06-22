function showError(msg, autoclose) {
	/* page alert
	var options = {
		type: 'danger',
		namespace: 'pa_page_alerts_default'
	};
	if (autoclose) options['auto_close'] = autoclose; // seconds
	PixelAdmin.plugins.alerts.add(msg, options);
	*/

	var options = {	message: msg}
	if (!autoclose) options['duration'] = 9999*9999;
	$.growl.error(options);
}

function ajaxGetJSON(posturl, postdata, successFunc) {
	$.ajax({
		url : posturl,
		data : postdata,
		dataType : 'json',
		method : 'post',
		success : successFunc,
		error : function (request, status, error) {
			showError((request.responseText) ? request.responseText : status);
		}
	})
}


function ajaxRenderHTML(posturl, postdata, targetElement, func /*JQUERY Functions : replaceWith, append, prepend, html*/, successFunc) {
	$.ajax({
		url : posturl,
		data : postdata,
		dataType : 'html',
		method : 'post',
		success : function (retHTML) {
			$(targetElement)[func](retHTML);
			if ($.isFunction(successFunc)) {
				successFunc(retHTML);
			}
		},
		error : function (request, status, error) {
			showError((request.responseText) ? request.responseText : status);
		}
	})
}

function createEmptyModal(modalID) {
	var $ret = $('<div class="modal fade" role="dialog">'+
					'<div class="modal-dialog">'+
						'<div class="modal-content">'+
							'<div class="modal-header">'+
								'<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times</button>'+
								'<h4 class="modal-title"></h4>'+
							'</div>'+
							'<div class="modal-body"></div>'+
							'<div class="modal-footer"></div>'+
						'</div>'+
					'</div>'+
				'</div>');
	if (modalID) $ret.attr('id', modalID);
	$ret.appendTo($('body'));
	return $ret;
}


var modalAlertCounter = 0;
function showModalAlert(type/*danger/success/warning/info*/, title, text, callbackFunc) {
	var iconmap = {
		danger 	:	$('<i class="fa fa-times-circle"></i>'),
		success :	$('<i class="fa fa-check-circle"></i>'),
		warning	:	$('<i class="fa fa-warning"></i>'),
		info 	:	$('<i class="fa fa-info-circle"></i>')
	}
	if (typeof iconmap[type] == 'undefined') return false;
	++modalAlertCounter;
	var $modal = createEmptyModal('modal_alert_'+modalAlertCounter);
	$modal.addClass('modal-alert modal-'+type);
	$modal.find('.modal-header').html(iconmap[type]);
	$modal.find('.modal-body').html(text);
	$('<div class="modal-title"></div>').html(title).insertBefore($modal.find('.modal-body'));
	$modal.find('.modal-footer').html('<button type="button" class="btn btn-'+type+'" data-dismiss="modal">OK</button>');
	$modal.modal('show').one('hidden.bs.modal', function () {
		if ($.isFunction(callbackFunc)) {
			callbackFunc();
		}
	})
}

function addClass(obj, cls){
	if(typeof(obj)=='string'){
		obj = document.getElementById(obj);
	}/*else if(typeof(obj)=='object'){
	}*/
	if(!obj)
		return false;
	var newClassArr = new Array();
	var existingClassArr = obj.className.split(' ');
	existingClassArr.push(cls);
	for(key in existingClassArr){
		if(!in_array(existingClassArr[key], newClassArr))
			newClassArr.push(existingClassArr[key]);
	}
	obj.className = newClassArr.join(' ');
}
function removeClass(obj, cls){
	if(typeof(obj)=='string'){
		obj = document.getElementById(obj);
	}/*else if(typeof(obj)=='object'){
	}*/		
	if(!obj)
		return false;
	// var reg = new RegExp('([^0-9a-zA-Z]*'+cls+'[^0-9a-zA-Z]*)', 'g');
	// obj.className = obj.className.replace(reg, ' ');
	var newClassArr = new Array();
	var existingClassArr = obj.className.split(' ');
	for(key in existingClassArr){
		if(existingClassArr[key]!=cls && !in_array(existingClassArr[key], newClassArr))
			newClassArr.push(existingClassArr[key]);
	}
	obj.className = newClassArr.join(' ');
}
function in_array(needle, haystack, argStrict){
  var key = '', strict = !! argStrict;
  if (strict){
    for (key in haystack){
      if (haystack[key] === needle){
        return true;
      }
    }
  }else{
    for(key in haystack){
      if(haystack[key] == needle){
        return true;
      }
    }
  } 
  return false;
}

function setCookie(cname, cvalue, exdays) {
    var d = new Date();
    d.setTime(d.getTime() + (exdays*24*60*60*1000));
    var expires = "expires="+d.toGMTString();
    document.cookie = cname + "=" + cvalue + "; " + expires;
}
function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for(var i=0; i<ca.length; i++) {
        var c = ca[i].trim();
        if (c.indexOf(name) == 0) return c.substring(name.length,c.length);
    }
    return "";
}
