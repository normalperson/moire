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
			showError((request.responseText) ? ((status) ? status + ':' + request.responseText : request.responseText) : status);
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
			showError((request.responseText) ? ((status) ? status + ':' + request.responseText : request.responseText) : status);
		}
	})
}

function createEmptyModal(modalID) {
	var $ret = $('<div class="modal fade" role="dialog">'+
					'<div class="modal-dialog">'+
						'<div class="modal-content">'+
							'<div class="modal-header">'+
								'<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>'+
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