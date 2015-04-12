$(function () {

	function load_translate_bar() {
		var $div =$("<div class='translate-mode-bar'>");
		$div.append($("<p>Translate Mode</p>"));
		$div.append($("<input type='button' id='translate_submit' name='translate_submit' value='Save' />"));
		$div.append($("<input type='button' id='translate_discard' name='translate_discard' value='Discard and Quit Translation Mode' />"));
		$('body').prepend($div);
	}
	
	load_translate_bar();
				
	$('font.translate-popup-link').click(function (e) {
		e.preventDefault();
		var $t = $(this);
		var clang = $t.attr('data-lang');
		var $tinp = $t.find("input[id^=translate_text_]");
		var $tspn = $t.find("span[id^=translate_disp_]");
		var ntext = prompt("Translate to " + clang, $tinp.val());
		if (ntext != null) {
			$tinp.val(ntext);
			$tspn.html((ntext == '') ? '&nbsp;' : ntext);
			$t.addClass('modified');
		}
	})
	
	$('#translate_submit').click(function () {
		var form = document.createElement("form");
		form.setAttribute("method", "post");
		form.setAttribute("action", window.location.href.substring(0,window.location.href.indexOf("?")));
		$('font.translate-popup-link input[id^=translate_text_]').each(function () {
			form.appendChild(this);
		})
		document.body.appendChild(form);
		form.submit();
	
	})
	
	$('#translate_discard').click(function () {
		var form = document.createElement("form");
		form.setAttribute("method", "post");
		form.setAttribute("action", window.location.href.substring(0,window.location.href.indexOf("?")));
		form.appendChild($("<input type='hidden' name='translate_discard' value='1' />")[0]);
		document.body.appendChild(form);
		form.submit();
	})
})