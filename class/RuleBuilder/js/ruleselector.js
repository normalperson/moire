;(function($) {
"use strict";

	$.ruleSelector = function(el) {
		var b = this, o;
		b.$el = $(el);
		b.$input = b.$el.find('.rule-selector-value');
		b.$toggle = b.$el.find('.rule-selector-toggle').click(function () {
			b.toggleTrueFalse();
		})
		b.$select = b.$el.find('.rule-selector').change(function () {
			b.toggleTrueFalse('true');
		});
		
		b.toggleTrueFalse = function (tovalue) {
			var $opt = b.$select.find(':selected[value!=""]');
			if ($opt.length > 0) {
				if ((typeof tovalue == 'undefined' && b.$toggle.data('curr') == 'true') || (typeof tovalue == 'string' && tovalue == 'false')) {
					b.$toggle.removeClass('btn-success').removeClass('btn-danger').addClass('btn-danger').data('curr','false').html($opt.data('falsemsg'));
					b.$input.val(b.$select.val()+'::false');
					return 'false';
				}
				else {
					b.$toggle.removeClass('btn-success').removeClass('btn-danger').addClass('btn-success').data('curr','true').html($opt.data('truemsg'));
					b.$input.val(b.$select.val()+'::true');
					return 'true';
				}
			}
			else {
				b.$toggle.removeClass('btn-success').removeClass('btn-danger').data('curr','').html('&nbsp;');
				b.$input.val('');
				return null;
			}
		}
		
		b.init = function () {
			var initval = b.$input.val();
			if (initval) {
				var valarr = initval.split('::');
				b.$select.val(valarr[0]);
				b.toggleTrueFalse(valarr[1]);
			}
		}
		b.$el.data('ruleSelector', b);
		b.init();
	}
	
	$.fn.ruleSelector = function() {
		return this.each(function(){
			if (!$(this).data('ruleSelector')) {
				(new $.ruleSelector(this));
			}
		});
	};
	
	
	
})(jQuery);