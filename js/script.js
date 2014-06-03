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
<<<<<<< HEAD
			else var x2 = '.' + rpad('',decimal,'0');
		}
	}
	else var x2 = '';
	
	if (showComma) {
		var rgx = /(\d+)(\d{3})/;
		while (rgx.test(x1)) {
			x1 = x1.replace(rgx, '$1' + ',' + '$2');
		}
	}
	
	return x1 + x2;
}

function getCaretPosition (ctrl) {
	var CaretPos = 0;	// IE Support
	if (document.selection) {
	ctrl.focus ();
		var Sel = document.selection.createRange ();
		Sel.moveStart ('character', -ctrl.value.length);
		CaretPos = Sel.text.length;
	}
	// Firefox support
	else if (ctrl.selectionStart || ctrl.selectionStart == '0')
		CaretPos = ctrl.selectionStart;
	return (CaretPos);
}

function setCaretPosition(ctrl, pos){
	if(ctrl.setSelectionRange)
	{
		ctrl.focus();
		ctrl.setSelectionRange(pos,pos);
	}
	else if (ctrl.createTextRange) {
		var range = ctrl.createTextRange();
		range.collapse(true);
		range.moveEnd('character', pos);
		range.moveStart('character', pos);
		range.select();
	}
}

function lpad(originalstr, length, strToPad) {
	while (originalstr.length < length)
		originalstr = strToPad + originalstr;
	return originalstr;
}
 
function rpad(originalstr, length, strToPad) {
	while (originalstr.length < length)
		originalstr = originalstr + strToPad;
	return originalstr;
}


function sigfig(n, sf) {
	sf = sf - Math.floor(Math.log(n) / Math.LN10) - 1;
	sf = Math.pow(10, sf);
	n = Math.round(n * sf);
	n = n / sf;
	return n;
}

function checkAll(tableid)
{
	table = document.getElementById(tableid);
	var allInputs = table.getElementsByTagName("input");
	for (var i = 0, max = allInputs.length; i < max; i++){
	if (allInputs[i].type === 'checkbox')
		allInputs[i].checked = true;
	}
}
function uncheckAll(tableid)
{
	table = document.getElementById(tableid);
	var allInputs = table.getElementsByTagName("input");
	for (var i = 0, max = allInputs.length; i < max; i++){
	if (allInputs[i].type === 'checkbox')
		allInputs[i].checked = false;
	}
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
function gettopost(url){
	var form = document.createElement("form");
	form.setAttribute("method", "post");
	var tmp = url.split('?');
	if(tmp.length>1){
		if(tmp[0].length>0){
			form.setAttribute("action", tmp[0]);
		}
		var query = tmp[1];
	}else{
		var query = tmp[0];
	}

	params = query.split('&');
	var hiddenField;
	var name;
	var value;
	for(var i=0; i<params.length; i++){
		name = params[i].substr(0, params[i].indexOf('='));
		value = params[i].substr(params[i].indexOf('=')+1);
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", name);
		hiddenField.setAttribute("value", value);
		form.appendChild(hiddenField);
	}
	document.body.appendChild(form);
	form.submit();
}
function redirect(url, microsecond){
	if(!microsecond){
		document.location = url;
	}else{
		window.setTimeout(function(){document.location=url;}, microsecond);
	}
}

function getCookie(c_name)
{
	var i,x,y,ARRcookies=document.cookie.split(";");
	for (i=0;i<ARRcookies.length;i++)
	{
		x=ARRcookies[i].substr(0,ARRcookies[i].indexOf("="));
		y=ARRcookies[i].substr(ARRcookies[i].indexOf("=")+1);
		x=x.replace(/^\s+|\s+$/g,"");
		if (x==c_name)
		{
			return unescape(y);
		}
	}
}

function setCookie(c_name,value,exdays)
{
	var exdate=new Date();
	exdate.setDate(exdate.getDate() + exdays);
	var c_value=escape(value) + ((exdays==null) ? "" : "; expires="+exdate.toUTCString());
	document.cookie=c_name + "=" + c_value;
}

function getXMLHttp(){
	var xmlhttp;
	if (window.XMLHttpRequest){// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp=new XMLHttpRequest();
	}else{// code for IE6, IE5
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
	return xmlhttp;
	/*
	UNSENT (numeric value 0)
	OPENED (numeric value 1)
	HEADERS_RECEIVED (numeric value 2)
	LOADING (numeric value 3)
	DONE (numeric value 4)
	*/
	// xmlhttp.onreadystatechange=function(){
		// if (xmlhttp.readyState==4 && xmlhttp.status==200){
			// document.getElementById("myDiv").innerHTML=xmlhttp.responseText;
		// }
	// }
	// xmlhttp.open("GET","ajax_info.txt",true);
	// xmlhttp.send();
}
function ajaxGet(url, fn){
	var xmlhttp = getXMLHttp();
	var async = false;
	if(typeof(fn)=='function'){
		async = true;
		xmlhttp.onreadystatechange=function(){
			if (xmlhttp.readyState==4) fn(xmlhttp.responseText);
		}
	}
	xmlhttp.open("GET", url, async);
	xmlhttp.send();
	if(typeof(fn)!='function'){
		return xmlhttp.responseText;
	}
}
function ajaxRun(url, fn){
	ajaxGet(url, fn);
}

function addEvent(obj, type, fn){
	if(typeof(obj)=='string')
		obj = document.getElementById(obj);
	if(obj.attachEvent){
		obj['e'+type+fn] = fn;
		obj[type+fn] = function(){obj['e'+type+fn]( window.event );}
		obj.attachEvent('on'+type, obj[type+fn]);
	}else{
		obj.addEventListener(type, fn, false);
	}
}
function removeEvent(obj, type, fn){
	if(typeof(obj)=='string')
		obj = document.getElementById(obj);
	if(obj.detachEvent){
		obj.detachEvent('on'+type, obj[type+fn]);
		obj[type+fn] = null;
	}else{
		obj.removeEventListener(type, fn, false);
	}
}

function fireEvent(obj, ev){
	if(typeof(obj)=="string")
		obj = document.getElementById(obj);
	if(!obj) return false;
	if("fireEvent" in obj){
		obj.fireEvent("on"+ev);
	}else{
		var evt = document.createEvent("HTMLEvents");
		evt.initEvent(ev, false, true);
		obj.dispatchEvent(evt);
	}
}

function fireOnchange(obj){
	fireEvent(obj, 'change');
}


String.prototype.lPad = function (n,c) {var i; var a = this.split(''); for (i = 0; i < n - this.length; i++) {a.unshift (c)}; return a.join('')}

String.prototype.rPad = function (n,c) {var i; var a = this.split(''); for (i = 0; i < n - this.length; i++) {a.push (c)}; return a.join('')}
=======
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
	return $ret;
}
>>>>>>> 70c37bd2f6e0b2331be04ffd5f0f25086b62272e
