function popupContent (content, titleText, popupwidth, callback) {
	
	if (parent.$.fn.modal) {
		popupwidth = typeof popupwidth !== 'undefined' ? popupwidth : false;
	
		var $body = $(window.top.document.body);
		var $modalDiv = $("<div class='modal fade content-box' role='dialog' aria-labelledby='popup_label' data-backdrop='static' data-keyboard='false' aria-hidden='true'>");
		
        
		var $modalHeader = $("<div class='modal-header'>");
		$modalHeader.append($("<button type='button' class='close' data-dismiss='modal' aria-hidden='true'>&times;</button>"))
		$modalHeader.append($("<h4 class='modal-title' id='popup_label'>"+titleText+"</h4>"))
		
		var $modalBody = $("<div class='modal-body'>");
		$modalBody.append(content);
		var $modalDialog = $("<div class='modal-dialog'>").append($("<div class='modal-content'>").append($modalHeader).append($modalBody));
		if (popupwidth) $modalDialog.css('width', popupwidth);
		$modalDiv.append($modalDialog);
		$body.append($modalDiv);
		$modalDiv.modal('show')

		$modalDiv.modal().on('hidden.bs.modal', function () {
			if ($.isFunction(callback)) {
				callback($modalDiv);
			}
			$(this).remove();
		});	
	}
	else alert("Require bootstrap");
}


function popupFrameContent(renderurl, titleText, popupwidth, callback) {
	var $contentFrame = $('<iframe src="'+renderurl+'" class="autoheight" width="100%" frameborder="0"></iframe>')
	popupContent($contentFrame, titleText, popupwidth, callback);
	$contentFrame.iFrameResize()
}


function showError ( msg, buttonText/*optional, default is 'OK'*/, titleText/*optional, default is 'Error'*/, callback) {
	buttonText = typeof buttonText !== 'undefined' ? buttonText : 'OK';
	titleText = typeof titleText !== 'undefined' ? titleText : 'Error';
	
	if (parent.$.fn.modal) {
		var $body = $(window.top.document.body);
		var $modalDiv = $("<div class='modal fade modal-custom error-box' data-backdrop='static' role='dialog' aria-labelledby='alert_label' aria-hidden='true'>");
		
		var $modalHeader = $("<div class='modal-header'>");
		$modalHeader.append($("<h4 class='modal-title' id='alert_label'>"+titleText+"</h4>"))
		
		var $modalBody = $("<div class='modal-body'>");
		$modalBody.append($("<p>"+msg+"</p>"));
		
		var $modalFooter = $("<div class='modal-footer'>");
		$modalFooter.append($("<button class='btn btn-danger ok-button' data-dismiss='modal' aria-hidden='true'>"+buttonText+"</button>"))
		
		$modalDiv.append($("<div class='modal-dialog'>").append($("<div class='modal-content'>").append($modalHeader).append($modalBody).append($modalFooter)));
		$body.append($modalDiv);
		$modalDiv.modal('show')

		$modalDiv.modal().on('hidden.bs.modal', function () {
			if ($.isFunction(callback)) {
				callback(true);
			}
			$(this).remove();
		});	

	}
	else {
		alert(msg);
	}
}


function showInfo ( msg, buttonText/*optional, default is 'OK'*/, titleText/*optional, default is 'Alert'*/, callback) {
	buttonText = typeof buttonText !== 'undefined' ? buttonText : 'OK';
	titleText = typeof titleText !== 'undefined' ? titleText : 'Info';
	
	if (parent.$.fn.modal) {
		var $body = $(window.top.document.body);
		var $modalDiv = $("<div class='modal fade modal-custom info-box' data-backdrop='static' role='dialog' aria-labelledby='info_label' aria-hidden='true'>");
		
		var $modalHeader = $("<div class='modal-header'>");
		$modalHeader.append($("<h4 class='modal-title' id='info_label'>"+titleText+"</h4>"))
		
		var $modalBody = $("<div class='modal-body'>");
		$modalBody.append($("<p>"+msg+"</p>"));
		
		var $modalFooter = $("<div class='modal-footer'>");
		$modalFooter.append($("<button class='btn btn-warning ok-button' data-dismiss='modal' aria-hidden='true'>"+buttonText+"</button>"))
		
		$modalDiv.append($("<div class='modal-dialog'>").append($("<div class='modal-content'>").append($modalHeader).append($modalBody).append($modalFooter)));
		$body.append($modalDiv);
		$modalDiv.modal('show')

		$modalDiv.modal().on('hidden.bs.modal', function () {
			if ($.isFunction(callback)) {
				callback(true);
			}
			$(this).remove();
		});	

	}
	else {
		alert(msg);
	}
}

function showAlert ( msg, buttonText/*optional, default is 'OK'*/, titleText/*optional, default is 'Alert'*/, callback) {
	buttonText = typeof buttonText !== 'undefined' ? buttonText : 'OK';
	titleText = typeof titleText !== 'undefined' ? titleText : 'Alert';
	
	if (parent.$.fn.modal) {
		var $body = $(window.top.document.body);
		var $modalDiv = $("<div class='modal fade modal-custom alert-box' data-backdrop='static' role='dialog' aria-labelledby='alert_label' aria-hidden='true'>");
		
		var $modalHeader = $("<div class='modal-header'>");
		$modalHeader.append($("<h4 class='modal-title' id='alert_label'>"+titleText+"</h4>"))
		
		var $modalBody = $("<div class='modal-body'>");
		$modalBody.append($("<p>"+msg+"</p>"));
		
		var $modalFooter = $("<div class='modal-footer'>");
		$modalFooter.append($("<button class='btn btn-warning ok-button' data-dismiss='modal' aria-hidden='true'>"+buttonText+"</button>"))
		
		$modalDiv.append($("<div class='modal-dialog'>").append($("<div class='modal-content'>").append($modalHeader).append($modalBody).append($modalFooter)));
		$body.append($modalDiv);
		$modalDiv.modal('show')

		$modalDiv.modal().on('hidden.bs.modal', function () {
			if ($.isFunction(callback)) {
				callback(true);
			}
			$(this).remove();
		});	

	}
	else {
		alert(msg);
	}
}

function showConfirm ( msg, callback, yesText/*optional, default is 'Yes'*/, noText/*optional, default is 'No'*/, titleText/*optional, default is 'Confirm'*/) { 

/*
Example usage:
	showConfirm ("Are you sure?", function (ret) {
			if (ret) { // if user click yes
				
			}
			else { // if user click no
			
			}
		});
*/
   yesText = typeof yesText !== 'undefined' ? yesText : 'Yes';
   noText = typeof noText !== 'undefined' ? noText : 'No';
   titleText = typeof titleText !== 'undefined' ? titleText : 'Confirm';
   
	if (parent.$.fn.modal) {
		var $body = $(window.top.document.body);
		var $modalDiv = $("<div class='modal fade modal-custom confirm-box' data-backdrop='static' role='dialog' aria-labelledby='confirm_label' aria-hidden='true'>");
		
		var $modalHeader = $("<div class='modal-header'>");
		$modalHeader.append($("<h4 class='modal-title' id='confirm_label'>"+titleText+"</h4>"))
		
		var $modalBody = $("<div class='modal-body'>");
		$modalBody.append($("<p>"+msg+"</p>"));
		
		var $modalFooter = $("<div class='modal-footer'>");
		$modalFooter.append($("<button class='btn btn-info yes-button' data-dismiss='modal' aria-hidden='true'>"+yesText+"</button>").click(function () {
			if ($.isFunction(callback)) {
				callback(true);
			}
		}))
		$modalFooter.append($("<button class='btn btn-info no-button' data-dismiss='modal' aria-hidden='true'>"+noText+"</button>"))
		
		$modalDiv.append($("<div class='modal-dialog'>").append($("<div class='modal-content'>").append($modalHeader).append($modalBody).append($modalFooter)));
		$body.append($modalDiv);
		$modalDiv.modal('show');
		
		$modalDiv.on('hidden.bs.modal', function (e) {
			$(this).remove();
		})

	}
	else {
		var ret = confirm(msg);
		if (r==true) {
			if ($.isFunction(callback)) {
				callback(true);
			}
		}
	}
}

function toggleLoading(state, callback, titleText) {
	titleText = typeof titleText !== 'undefined' ? titleText : 'Loading';
	var $body = $(window.top.document.body),
		$exist = $body.find('.loading-box');
	if (typeof state == 'undefined' || state) {
		if ($exist.length == 0) {
			var $modalDiv = $("<div class='modal fade modal-custom loading-box' data-backdrop='static' role='dialog' aria-hidden='true'>");
			
			var $modalHeader = $("<div class='modal-header'>");
			$modalHeader.append($("<h4 class='modal-title' id='confirm_label'>"+titleText+"</h4>"))
			
			var $modalBody = $("<div class='modal-body'>");
			if (0) { // use css3 loader animation
				$modalBody.append($('<div class="loader"><div class="circle"></div><div class="circle"></div><div class="circle"></div><div class="circle"></div><div class="circle"></div></div>'));
			}
			else { // use gif loader animation
				$modalBody.append($('<div class="loader-gif"></div>'));
			}

			$modalDiv.append($("<div class='modal-dialog'>").append($("<div class='modal-content'>").append($modalHeader).append($modalBody)));
			$body.append($modalDiv);
			$modalDiv.modal('show');
			
			$modalDiv.on('hidden.bs.modal', function (e) {
				$(this).remove();
			}).on('shown.bs.modal', function (e) {
				if ($.isFunction(callback)) {
					callback(true);
				}
			})
			
		}
		else if (typeof state == 'undefined') {
			$exist.modal('hide');
		}
	}
	else {
		// remove loading
		if ($exist.length > 0) {
			$exist.modal('hide');
		}
	}
}
