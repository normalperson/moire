<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'rule.conf.php');

# customization
function dbo_rule_customize(&$dbo){
}


function showRuleEditor($col, $currval, $rs, $html, $dbo) {
	$editor = new RuleBuilder();
	$rule = false;
	if (!empty($rs['ru_id'])) $rule = new Rule($rs['ru_id']);
	$inputname = $dbo->genPrefix($dbo->state).$col;
	return $editor->genEditor($inputname, $rule);
}

# final rendering
$dbo->render();
?>