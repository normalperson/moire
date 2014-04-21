/* Object declaration
-------------------------------------------------------------------*/
var $input = {
	'theme'          : $('#theme'),
	'language'       : $('#language'),
	'sessiontime'    : $('#sessiontime'),
	'defcheckintime' : $('#defcheckintime'),
	'defcheckouttime': $('#defcheckouttime'),
	'eicharge'       : $('#eicharge'),
	'locharge'       : $('#locharge'),
	'hotelname'      : $('#hotelname'),
	'hoteladdress'   : $('#hoteladdress')
};

var $div = {
	'gensetting'     : $('#gensettingdiv'),
	'slisessiontime' : $('#slider-sessiontime'),
	'slidefcheckin'  : $('#slider-defcheckin'),
	'slidefcheckout' : $('#slider-defcheckout')
};

var $button = {
	'save'         : $('#save'),
	'resetdefault' : $('#resetdefault')
};    
function getFormData(){
	var formArr = {
		'theme'         : $input.theme.select2('data').id,
		'themetitle'    : $input.theme.select2('data').text,
		'language'      : $input.language.select2('data').id,
		'languagetitle' : $input.language.select2('data').text,
		'sessiontime'   : $input.sessiontime.val(),
		'checkintime'   : $input.defcheckintime.val(),
		'checkouttime'  : $input.defcheckouttime.val(),
		'eicharge'      : accounting.unformat($input.eicharge.val()),
		'locharge'      : accounting.unformat($input.locharge.val()),
		'hoteladdress'  : $input.hoteladdress.val(),
		'hotelname'     : $input.hotelname.val()

	};
	return formArr;
}
$(function() {
	/*
	* Initialize UI 
	-------------------------------------------------------------------*/
	$div.gensetting.accordion({
		active: 0,
		heightStyle: "content"
	});

	// initialize button set
	$.each($button,function(){
		$(this).button();
	});

	// initialize sessiontime slider
	$div.slisessiontime.slider({
      range: "max",
      min: 1,
      max: 60,
      value: def.sessiontime,
      slide: function( event, ui ) {
        $input.sessiontime.val( ui.value );
      }
    });
    $input.sessiontime.val( $div.slisessiontime.slider( "value" ) );

    $div.slidefcheckin.slider({
        range: "max",
        min: 0,
        max: 1440,
        step: 15,
        value: def.checkinmin,
        slide: function(e, ui) {
            var hours = Math.floor(ui.value / 60);
            var minutes = ui.value - (hours * 60);

            if(hours.length == 1) hours = '0' + hours;
            if(minutes.length == 1) minutes = '0' + minutes;

           $input.defcheckintime.val(hours+':'+minutes);
        }
    });
    $input.defcheckintime.val(def.checkinstr);

    $div.slidefcheckout.slider({
        range: "max",
        min: 0,
        max: 1440,
        step: 15,
        value: def.checkoutmin,
        slide: function(e, ui) {
            var hours = Math.floor(ui.value / 60);
            var minutes = ui.value - (hours * 60);

            if(hours.length == 1) hours = '0' + hours;
            if(minutes.length == 1) minutes = '0' + minutes;

           $input.defcheckouttime.val(hours+':'+minutes);
        }
    });
    $input.defcheckouttime.val(def.checkoutstr);
    
    // initialize charges value
    $input.eicharge.val(accounting.formatNumber(def.eicharge));
    $input.locharge.val(accounting.formatNumber(def.locharge));

	// initialize drop down for theme
	$input.theme.select2({
		minimumResultsForSearch: -1,
		ajax: {
            cache: false,
            async:false,
            dataType: 'json',
            type: 'POST',
            url: 'getTheme',                 
            results: function (data, page) {
                return { results: data }; // notice we return the value of more so Select2 knows if more results can be loaded
            }                
        },
        initSelection : function (element, callback) {
        	// default nonight always one 
    		var data = $.ajax({
				url: "defaultTheme",
				type: "post",
				async:false,
				dataType: 'json',
				success: function (initdata,textStatus,jqXHR) {
				   callback(initdata);
				},
				error: function (){
					showAlert($jsmsg.systemerr+'defaultTheme ajax $input.theme.select2');
				}
			});
        		
	    }
	});	

	$input.language.select2({
		minimumResultsForSearch: -1,
		ajax: {
            cache: false,
            async:false,
            dataType: 'json',
            type: 'POST',
            url: 'getLanguage',                 
            results: function (data, page) {
                return { results: data }; // notice we return the value of more so Select2 knows if more results can be loaded
            }                
        },
        initSelection : function (element, callback) {
        	// default nonight always one 
    		var data = $.ajax({
				url: "defaultLang",
				type: "post",
				async:false,
				dataType: 'json',
				success: function (initdata,textStatus,jqXHR) {
				   callback(initdata);
				},
				error: function (){
					showAlert($jsmsg.systemerr+'defaultLang ajax $input.language.select2');
				}
			});
        		
	    }
	});	

	$button.save.click(function(){
		$.ajax({
			url: "updSetting",
			type: "post",
			async:false,
			data: getFormData(),
			success: function (data,textStatus,jqXHR) {
				console.log(data);
			},
			error: function (){
				showAlert($jsmsg.systemerr+'updSetting ajax $button.save.click');
			},
			complete: function(){
				setTimeout(showAlert($jsmsg.updatemsg),1500);
				location.reload();
			}
		});
		
	});
	$button.resetdefault.click(function(){
		$.ajax({
			url: "resetDefault",
			type: "post",
			async:false,
			success: function (data,textStatus,jqXHR) {
				console.log(data);
			},
			error: function (){
				showAlert($jsmsg.systemerr+'resetDefault ajax $button.resetdefault.click');
			},
			complete: function(){
				setTimeout(showAlert($jsmsg.resetmsg),1500);
				location.reload();
			}
		});
		
	});
	
	
});

