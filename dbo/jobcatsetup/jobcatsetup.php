<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'jobcatsetup.conf.php');

# customization
function dbo_jobcatsetup_customize(&$dbo){
}

# final rendering
$dbo->render();
?>
<script type='text/javascript'>
var $priceCat = $('input[name=dbo_jobcatsetup_edit_jcl_price_cat], input[name=dbo_jobcatsetup_new_jcl_price_cat]'),
	$priceUnit = $('#dbo_jobcatsetup_edit_jcl_price_per_unit,#dbo_jobcatsetup_new_jcl_price_per_unit')
	$priceColor = $('#dbo_jobcatsetup_edit_jcl_price_color_1, #dbo_jobcatsetup_edit_jcl_price_color_2, #dbo_jobcatsetup_edit_jcl_price_color_3, #dbo_jobcatsetup_edit_jcl_price_color_4')
					.add('#dbo_jobcatsetup_new_jcl_price_color_1, #dbo_jobcatsetup_new_jcl_price_color_2, #dbo_jobcatsetup_new_jcl_price_color_3, #dbo_jobcatsetup_new_jcl_price_color_4');
$priceCat.change(function () {
	var currval = $priceCat.filter(':checked').val();
	if (typeof currval != 'undefined' && currval == 'UNIT') {
		$priceColor.val('').prop('disabled', true);
		$priceUnit.prop('disabled', false);
	}
	else if (typeof currval != 'undefined' && currval == 'COLOR') {
		$priceUnit.val('').prop('disabled', true);
		$priceColor.prop('disabled', false);
	}
	else {
		$priceColor.prop('disabled', true);
		$priceUnit.prop('disabled', true);
	}
}).change();
</script>