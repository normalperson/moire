accounting.settings = {
	currency: {
		symbol : "RM",   // default currency symbol is '$'
		format: "%s %v", // controls output: %s = symbol, %v = value/number (can be object: see below)
		decimal : ".",  // decimal point separator
		thousand: ",",  // thousands separator
		precision : 2   // decimal places
	},
	number: {
		precision : 0,  // default precision on numbers is 0
		thousand: ",",
		decimal : "."
	}
}

if (typeof DBO == 'object') {
	DBO.formValidator = function(formname){
		
		if(!document.forms[formname]) return false;
		this.formname = formname;
		this.form = document.forms[formname];
		var state = formname.substring(formname.lastIndexOf('_')+1).slice(0, -4);
		var dboid = formname.slice(4,formname.lastIndexOf('_'));
		
		$(this.form).validate({
			ignore : '', 
			invalidHandler : function (e, v) {
				if (v.errorList.length > 0 && v.errorList[0]) {
					var $errinp = $(v.errorList[0].element),
						$tabbody = $errinp.closest('tbody.dbotab_inactive');
					if ($tabbody.length > 0 ) { // is hidden tab
						var tabid = $tabbody.attr('id')
						tabid = tabid.substring(tabid.lastIndexOf('_')+1);
						DBO.tabSwitch(dboid, state, tabid);
					}
				}
			}
		});
		this.form['validator'] = this;
		this.summarizeError = true;
		this.validationList = new Array();
		this.addValidation = function(inputname, validation, message, param){
			var $inp;
			if (this.form[inputname]) {
				$inp = $(this.form[inputname]);
			}else if(this.form[inputname+'[]']){
				$inp = $(this.form[inputname+'[]']);
			}
			if ($inp) {
				$inp.closest('td.value').addClass('form-group col-dbo');
				if (validation == 'mandatory') {
					$inp.rules("remove");
					$inp.rules("add", {required:true, messages: { required:message}});
				}
			}
		};
		this.runValidation = function(){
			
		};
	}
}
