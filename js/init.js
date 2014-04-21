// auto resize iframe based on content height
if (self == top) {
	!function(){"use strict";function a(a,b,c){"addEventListener"in window?a.addEventListener(b,c,!1):"attachEvent"in window&&a.attachEvent("on"+b,c)}function b(){var a,b=["moz","webkit","o","ms"];for(a=0;a<b.length&&!window.requestAnimationFrame;a+=1)window.requestAnimationFrame=window[b[a]+"RequestAnimationFrame"];window.requestAnimationFrame||(c(" RequestAnimationFrame not supported"),window.requestAnimationFrame=function(a){a()})}function c(a){k.log&&"console"in window&&console.log(i+"[Host page]"+a)}function d(a){function b(){function a(a){window.requestAnimationFrame(function(){m.iframe.style[a]=m[a]+"px",c(" IFrame ("+m.iframe.id+") "+a+" set to "+m[a]+"px")})}k.sizeHeight&&a("height"),k.sizeWidth&&a("width")}function d(a){c("iFrame "+a.id+" removed."),a.parentNode.removeChild(a)}function e(){var a=l.substr(j).split(":");return{iframe:document.getElementById(a[0]),height:a[1],width:a[2],type:a[3]}}function f(){"close"===m.type?d(m.iframe):b()}function g(){var b=a.origin,d=m.iframe.src.split("/").slice(0,3).join("/");if(k.checkOrigin&&(c(" Checking conection is from: "+d),""+b!="null"&&b!==d))throw new Error("Unexpect message received from: "+b+" for "+m.iframe.id+". Message was: "+a.data);return!0}function h(){return i===""+l.substr(0,j)}var l=a.data,m={};h()&&(m=e(),g()&&(f(),k.resizedCallback(m)))}function e(){function b(a){return""===a&&(l.id=a="iFrameResizer"+h++,c(" Added missing iframe ID: "+a)),a}function d(){c(" IFrame scrolling "+(k.scrolling?"enabled":"disabled")+" for "+m),l.style.overflow=!1===k.scrolling?"hidden":"auto",l.scrolling=!1===k.scrolling?"no":"yes"}function e(){("number"==typeof k.bodyMargin||"0"===k.bodyMargin)&&(k.bodyMarginV1=k.bodyMargin,k.bodyMargin=""+k.bodyMargin+"px")}function f(){return m+":"+k.bodyMarginV1+":"+k.sizeWidth+":"+k.log+":"+k.interval+":"+k.enablePublicMethods+":"+k.autoResize+":"+k.bodyMargin}function g(a,b){c("["+a+"] Sending init msg to iframe ("+b+")"),l.contentWindow.postMessage(i+b,"*")}function j(b){a(l,"load",function(){g("iFrame.onload",b)}),g("init",b)}var l=this,m=b(l.id);d(),e(),j(f())}function f(){function a(a){if("IFRAME"!==a.tagName)throw new TypeError("Expected <IFRAME> tag, found <"+a.tagName+">.");e.call(a)}function b(a){if(a=a||{},"object"!=typeof a)throw new TypeError("Options is not an object.");for(var b in l)l.hasOwnProperty(b)&&(k[b]=a.hasOwnProperty(b)?a[b]:l[b])}window.iFrameResize=function(c,d){b(c),Array.prototype.forEach.call(document.querySelectorAll(d||"iframe"),a)}}function g(){jQuery.fn.iFrameResize=function(a){return k=$.extend({},l,a),this.filter("iframe").each(e).end()}}var h=0,i="[iFrameSizer]",j=i.length,k={},l={autoResize:!0,bodyMargin:null,bodyMarginV1:8,checkOrigin:!0,enablePublicMethods:!1,interval:32,log:!1,resizedCallback:function(){},scrolling:!1,sizeHeight:!0,sizeWidth:!1};b(),a(window,"message",d),f(),"jQuery"in window&&g()}();	
}
else {
	!function(){"use strict";function a(a,b){"addEventListener"in window?window.addEventListener(a,b,!1):"attachEvent"in window&&window.attachEvent("on"+a,b)}function b(a){return p+"["+r+"] "+a}function c(a){o&&"console"in window&&console.log(b(a))}function d(a){"console"in window&&console.warn(b(a))}function e(b){function e(){function d(){function a(a){return"true"===a?!0:!1}var c=b.data.substr(q).split(":");r=c[0],h=void 0!==c[1]?parseInt(c[1],g):0,j=void 0!==c[2]?a(c[2]):!1,o=void 0!==c[3]?a(c[3]):!1,m=void 0!==c[4]?parseInt(c[4],g):33,s=void 0!==c[5]?a(c[5]):!1,f=void 0!==c[6]?a(c[6]):!0,i=c[7]}function e(){void 0===i&&(i=h+"px"),void 0!==i&&""!==i&&"null"!==i&&(document.body.style.margin=i,c("Body margin set to "+i))}function k(){document.documentElement.style.height="auto",document.body.style.height="auto",c('HTML & body height set to "auto"')}function l(){a("resize",function(){w("resize","Window resized")})}function n(){!0===f?(l(),z()):c("Auto Resize disabled")}c("Initialising iFrame"),d(),e(),k(),x(),n()}function w(a,b,d,e){function f(){function a(a){function b(a){var b=/^\d+(px)?$/i;if(b.test(a))return parseInt(a,g);var d=c.style.left,e=c.runtimeStyle.left;return c.runtimeStyle.left=c.currentStyle.left,c.style.left=a||0,a=c.style.pixelLeft,c.style.left=d,c.runtimeStyle.left=e,a}var c=document.body,d=0;return d=document.defaultView&&document.defaultView.getComputedStyle?document.defaultView.getComputedStyle(c,null)[a]:b(c.currentStyle[a]),parseInt(d,g)}return document.body.offsetHeight+a("marginTop")+a("marginBottom")}function h(){return document.documentElement.offsetWidth}function i(){c("Trigger event ("+b+") cancelled"),setTimeout(function(){n=a},u)}function l(){c("Trigger event: "+b),n=a}function m(){var b=r+":"+k+":"+v+":"+a;c("Sending msg to host page ("+b+")"),t.postMessage(p+b,"*")}function o(){k=q,v=s,l(),m()}var q=void 0!==d?d:f(),s=void 0!==e?e:h();n in{size:1,interval:1}&&"resize"===a?i():(k!==q||j&&v!==s)&&o()}function x(){s&&(c("Enable public methods"),window.parentIFrame=window.iFrameSizer={size:function(a,b){var c=""+(a?a:"")+(b?","+b:"");w("size","window.parentIFrame.size("+c+")",a,b)},close:function(){w("close","window.parentIFrame.close()",0,0)}})}function y(){0!==m&&(c("setInterval: "+m+"ms"),setInterval(function(){w("interval","setInterval: "+m)},Math.abs(m)))}function z(){function a(){var a=document.querySelector("body"),d={attributes:!0,attributeOldValue:!1,characterData:!0,characterDataOldValue:!1,childList:!0,subtree:!0},e=new b(function(a){a.forEach(function(a){w("mutationObserver","mutationObserver: "+a.target+" "+a.type)})});c("Enable MutationObserver"),e.observe(a,d)}var b=window.MutationObserver||window.WebKitMutationObserver;b?0>m?y():a():(d("MutationObserver not supported in this browser!"),y())}function A(){return p===""+b.data.substr(0,q)}A()&&l&&(e(),w("init","Init message from host page"),l=!1)}var f=!0,g=10,h=0,i="",j=!1,k=1,l=!0,m=32,n="",o=!1,p="[iFrameSizer]",q=p.length,r="",s=!1,t=window.parent,u=50,v=1;a("message",e)}();	
}
$(function () {
	if (typeof jQuery.fn.iFrameResize == 'function') $('iframe.autoheight').iFrameResize();
})