function notifyMe() {
  if (!Notification) {
    alert('Please us a modern version of Chrome, Firefox, Opera or Firefox.');
    return;
  }

  if (Notification.permission !== "granted")
    Notification.requestPermission();

  var notification = new Notification('MOIREGC Notification', {
    icon: 'http://www.moiregc.com.my/moire/image/moirenotification.png',
    body: "You've received a new task in MOIREGC!",
  });


  notification.onclick = function () {
    window.open("www.moiregc.com.my");
  }
}

function popUpAlert() {
    // open window
    var win = window.open("", "", "width=600, height=300");
    // init doc
    var doc = win.document;
    // init head
    var head = doc.getElementsByTagName("head")[0];
    // create title
    var title = doc.createElement("title");
    title.text = "MOIREGC New task notification";
    head.appendChild(title);
    // create script
    var code = "function childFunction() { alert('from parent to child'); this.focus(); }";
    var script = doc.createElement("script");
    script.text = code;
    script.type = "text/javascript";
    head.appendChild(script);
    // init body
    var body = doc.body;
    // create h3
    win.document.write("<!DOCTYPE html><html>" +
   "<body><h3 style='background-color:#5ebd5e;color:white;text-align:center;padding:8px'>You''ve received a new task in MOIREGC!</h3></h3>"  +
   "</body></html>");
    win.focus();
    
}
function pop2(){
	var w = window.open("", "", "");
	w.document.write("<!DOCTYPE html><html>" +
   "<body><h3 style='background-color:#5ebd5e;color:white;text-align:center;padding:8px'>You''ve received a new task in MOIREGC!</h3></h3>"  +
   "</body></html>");	
	w.focus();
}

window.parentFunction =  function() {
    alert("from child to parent");
    win.focus();
}

$(function () {
	var loc = window.location, wsurl;
	if (loc.protocol === "https:") wsurl = "wss:";
	else wsurl = "ws:";
	wsurl += "//" + loc.host+':8080';
	var conn = new ab.Session(wsurl,
		function() {
			conn.subscribe(ss, function(topic, data) {
				if (typeof data.msg == 'string') {
					$.growl.notice({ message: data.msg, size: 'large' });
									
				}
				if (data.cat == 'NOTICE') {
					$('.noificationLI').trigger('reload');
				}
				else if (data.cat == 'MESSAGE') {
					$('.messageLI').trigger('reload');
				}
				else if (data.cat == 'TASK') {
					notifyMe();
/*					popUpAlert();*/
					$('.tasklistingLI').trigger('reload');
				}
			});
		},
		function() {
			console.warn('WebSocket connection closed');
		},
		{'skipSubprotocolCheck': true}
	);
});
