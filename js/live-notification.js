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
			});
		},
		function() {
			console.warn('WebSocket connection closed');
		},
		{'skipSubprotocolCheck': true}
	);
});