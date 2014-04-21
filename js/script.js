/* 
use this in onkeypress="return isNumericKey(event,this,true,false)" of a numeric input box
Parameters : 	e - event
				obj - input box element, use "this"
				allowDecimal - whether to allow user to enter "." , acceptable values are true/false
				allowNegative - whether to allow user to enter "-" , acceptable values are true/false
*/
function isNumericKey(e, obj, allowDecimal, allowNegative) {

	// get decimal character and determine if negatives are allowed
	
	var decimal = (typeof allowDecimal !== 'undefined') ? allowDecimal : true;
	var decimal = (decimal) ? '.' : false;
	var negative = (typeof allowNegative !== 'undefined') ? allowNegative : true;
 
 
	// get the key that was pressed
	var key = e.charCode ? e.charCode : e.keyCode ? e.keyCode : 0;
	// allow enter/return key

	if(key == 13) {
		return true;
	}
	
	var allow = false;
	// allow Ctrl+A
	if((e.ctrlKey && key == 97 /* firefox */) || (e.ctrlKey && key == 65) /* opera */) { return true; }
	// allow Ctrl+X (cut)
	if((e.ctrlKey && key == 120 /* firefox */) || (e.ctrlKey && key == 88) /* opera */) { return true; }
	// allow Ctrl+C (copy)
	if((e.ctrlKey && key == 99 /* firefox */) || (e.ctrlKey && key == 67) /* opera */) { return true; }
	// allow Ctrl+Z (undo)
	if((e.ctrlKey && key == 122 /* firefox */) || (e.ctrlKey && key == 90) /* opera */) { return true; }
	// allow or deny Ctrl+V (paste), Shift+Ins
	if((e.ctrlKey && key == 118 /* firefox */) || (e.ctrlKey && key == 86) /* opera */ || (e.shiftKey && key == 45)) { return true; }
	// if a number was not pressed
	
	if(key < 48 || key > 57) {

		var value = obj.value;
		/* '-' only allowed at start and if negative numbers allowed */
		if(value.indexOf("-") !== 0 && negative && key == 45 && (value.length === 0 || parseInt(getCaretPosition(obj), 10) === 0)) { return true; }
		
		/* only one decimal separator allowed */
		if(decimal && key == decimal.charCodeAt(0) && value.indexOf(decimal) != -1)	{
			allow = false;
		}
		
		// check for other keys that have special purposes
		if (
			key != 8 /* backspace */ &&
			key != 9 /* tab */ &&
			key != 13 /* enter */ &&
			key != 35 /* end */ &&
			key != 36 /* home */ &&
			key != 37 /* left */ &&
			key != 39 /* right */ &&
			key != 46 /* del */
		) 
		{
			allow = false;
		}
		else
		{ 
			// for detecting special keys (listed above)
			// IE does not support 'charCode' and ignores them in keypress anyway
			if(typeof e.charCode != "undefined")
			{ 
				// special keys have 'keyCode' and 'which' the same (e.g. backspace)
				if(e.keyCode == e.which && e.which !== 0)
				{
					allow = true;
					// . and delete share the same code, don't allow . (will be set to true later if it is the decimal point)
					if(e.which == 46) { allow = false; }
				}
				// or keyCode != 0 and 'charCode'/'which' = 0
				else if(e.keyCode !== 0 && e.charCode === 0 && e.which === 0)
				{
					if (e.keyCode ==46) {return true;} // allow delete 
					allow = true;
				}
			}
		}
		// if key pressed is the decimal and it is not already in the field
		if(decimal && key == decimal.charCodeAt(0))
		{
			if(value.indexOf(decimal) == -1)
			{
				allow = true;
			}
			else
			{
				allow = false;
			}
		}
	}
	else
	{
		allow = true;
	}
	
	return allow;

}

/* 
use this in onkeyup="convertCurrency(event,this,true/false, 2)" of a numeric input box
Parameters : 	e - event
				obj - input box element, use "this"
				showCommas - whether to convert to 999,999,999 format , acceptable values are true/false
				decimal - force display decimal point , ex 999.00 , default is 2
				maxVal - if input value is greater than maxVal, set to maxVal , default is false
*/
function convertNumeric (e,obj,showCommas, decimal, maxVal, minVal){ 
	var keycode = e.charCode ? e.charCode : e.keyCode ? e.keyCode : 0;
	
	if (e.isTrigger || checkPrintableKey(e) || e.keyCode === 0 ){
		
		showCommas = (typeof showCommas !== 'undefined' && showCommas  === false) ? false : true; // default to true (show commas)
		decimal = (typeof decimal !== 'undefined' && decimal  !== false) ? decimal : 2; // default to 2 decimal point
		maxVal = (typeof maxVal !== 'undefined' && !isNaN(maxVal)) ? maxVal : false; // default to false (no maximum value)
		minVal = (typeof minVal !== 'undefined' && !isNaN(minVal)) ? minVal : false; // default to false (no minimum value)
		
		var selectVal = false;
		var val = obj.value;
		var cpos = getCaretPosition(obj);
		var ol = val.length;
		var preVal ='';
		if (val.substr(0,1) == '-') {
			preVal = val.substr(0,1);
			val = val.substr(1);
		}
		val = toNumeric(val);
		if (maxVal !== false) {
			maxVal = toFloat(maxVal);
			if (toFloat(val) > maxVal){
				val = maxVal;
				selectVal = true;
			}
		}
		if (minVal !== false) {
			minVal = toFloat(minVal);
			if (toFloat(val) < minVal){
				val = minVal;
				selectVal = true;
			}
		}
		val = formatNumeric(val,showCommas,decimal);
		val = preVal + val;
		obj.value = val;
		var nl = val.length;
		if (selectVal) obj.select();
		else setCaretPosition(obj, cpos+(nl-ol));
	}
}

function checkPrintableKey (e) {
	var keycode = e.charCode ? e.charCode : e.keyCode ? e.keyCode : 0;
	var valid = (e.ctrlKey === false && (	
											(keycode > 47 && keycode < 58)   || // number keys
											keycode == 173					 || // -
											keycode == 32 || keycode == 13   || // spacebar & return key(s) (if you want to allow carriage returns)
											keycode == 8  || keycode == 46	 || // backspace & delete (consider as printable)
											(keycode > 64 && keycode < 91)   || // letter keys
											(keycode > 95 && keycode < 112)  || // numpad keys
											(keycode > 185 && keycode < 193) || // ;=,-./` (in order)
											(keycode > 218 && keycode < 223) 	// [\]' (in order)
										)
				)
				||
				(e.ctrlKey && 	(
									keycode == 120 /*firefox*/ || keycode == 88 /*opera*/	|| 	//Ctrl+X (cut)
									keycode == 122 /*firefox*/ || keycode == 90	/*opera*/	|| 	//Ctrl+Z (undo)
									keycode == 118 /*firefox*/ || keycode == 86	/*opera*/		//Ctrl+V (paste). Shift+Ins
								)
				)

	return valid;
}

function toFloat (val) { // return float, can use for value calculations
	var ret = toNumeric (val);
	if (!isNaN(parseFloat(ret))) ret = parseFloat(ret);
	return ret;
}

function toNumeric (val) { // return string 
	var ret = (val+'').replace(/[^0-9\.\-]+/g,'');
	return ret;
}

/*
	Parameters : 	val	- the numeric variable
					showCommas - whether to convert to 999,999,999 format , acceptable values are true/false
					decimal - display up to x decimal point , ex 999.999231 -> 999.99 , default is 2
					rpadDecimal - force to rpad trailing zero up to x decimal point, ex. 23 -> 23.00 if decimal is 2 , acceptable values are true/false, default is false
					Note : 	if you set rpadDecimal to true and this function is called in onkeyup, 
							you will have problem when entering decimal point to the input box. Please only use it in your custom js function or onblur/onchange event
*/
function formatNumeric (val,showComma,decimal,rpadDecimal) {
	
	rpadDecimal = (typeof rpadDecimal !== 'undefined' && rpadDecimal  === true) ? true : false; // default to false

	val += '';
	
	if (val == '0') return 0;
	
	var x = val.split('.');
	var x1 = x[0];
	
	if (x1 !== '0')
		x1 = x1.replace(/^0+/, ''); // remove leading zero
	
	if (decimal >0) {
		if (!rpadDecimal){
			if (x.length > 1) {
				x[1] = x[1].substr(0,decimal);
				var x2 = '.' + x[1];
			}
			else var x2 = '';
		}
		else{
			if (x.length > 1) {
				x[1] = x[1].substr(0,decimal);
				x[1] = rpad(x[1],decimal,'0');
				var x2 = '.' + x[1];
			}
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
