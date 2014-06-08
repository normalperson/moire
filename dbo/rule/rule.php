<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'rule.conf.php');

# customization
function dbo_rule_customize(&$dbo){
	
}

function showRuleEditor($c, $currval, $rs, $html) {
	$editor = new RuleBuilder();
	$rule = false;
	if (!empty($rs['ru_id'])) {
		$rule = new Rule($rs['ru_id']);
	}
	return $editor->genEditor('dbo_rule_'.(($rs) ? 'edit' : 'new').'_ru_data', $rule);
}

# final rendering
$dbo->render();
?>