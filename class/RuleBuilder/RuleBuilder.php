<?php 
class RuleBuilder {
	
	function initSmarty(){
		$smarty = new Smarty();
		$smarty->caching = false;
		$smarty->setTemplateDir(dirname(__FILE__).DS.'templates');
		$smarty->setCompileDir(DOC_DIR.DS.'smarty'.DS.'templates_c');
		$smarty->setCacheDir(DOC_DIR.DS.'smarty'.DS.'cache');
		$smarty->setConfigDir(DOC_DIR.DS.'smarty'.DS.'configs');
		return $smarty;
	}
	
	function setup() {
		html_header();
		include_once(CLASS_DIR.DS.'RuleBuilder'.DS.'RuleBuilder.php');
		echo "<a href='UDV' class='btn pull-right'>Create UDV</a><div class='clearfix'></div>";
		dbo_include('rule');
	}
	
	function UDV() {
		html_header();
		echo "<a href='setup' class='btn pull-right'>Create Rule</a><div class='clearfix'></div>";
		dbo_include('udv');
	}

	function genUDVCapsule($u) {
		global $DB, $HTML;
		
		if (!$u) return false;
		$ret = "<li draggable='true' class='udv-capsule' data-udv-code=\"{$u['udv_code']}\" ><span class='udv-capsule-label' title=\"".$u['udv_code']."\">".((trim($u['udv_name'])) ? $u['udv_name'] : $u['udv_code'])."</span>";
		$inpext = "class='udv-capsule-value-input'";
		switch ($u['udv_result_type']) {
			case "char" : 
				$operarr = array(
					"=="=>"=",
					"LIKE"=>"LIKE",
					"ILIKE"=>"ILIKE"
				);
				$input = $HTML->genInput("text", "", "", $inpext);
				break;
			case "lookup" :
				$operarr = array("=="=>"=");
				$dbo = new DBO();
				$options = $dbo->genOption($u['udv_result_lookup_type'], $u['udv_result_lookup']);
				$input = $HTML->genInput('select', "", $options, "", $inpext);
				break;
			case "number" :
				$operarr = array(
					"="=>"=",
					">="=>">=",
					">"=>">",
					"<="=>"<=",
					"<"=>"<"
				);
				$input = $HTML->genInput("text", "", "", $inpext);
				break;
			case "date" :
				$operarr = array(
					"="=>"=",
					">="=>">=",
					">"=>">",
					"<="=>"<=",
					"<"=>"<"
				);
				$input = $HTML->genInput("text", "", "", $inpext);
				break;
			default :
				$operarr = array();
				$input = "";
				break;
		}
		
		$oprext = "class='udv-capsule-oper-input'";
		$ret .= "<span class='udv-capsule-oper'>".$HTML->genInput('select', "", $operarr, "", $oprext)."</span>";
		$ret .= "<span class='udv-capsule-value'>".$input."</span>";
		$ret .= "<span class='udv-capsule-delete'>&times</span>";
		$ret .= "</li>";
		
		return $ret;
	}
	
	function genEditor($inputname, $rule = false /*Rule Object*/) {
		global $HTML, $DB;
		static $ruleEditorCnt;
		if ($ruleEditorCnt) ++$ruleEditorCnt;
		else $ruleEditorCnt = 1;
		$editorid = "ruleEditor_{$ruleEditorCnt}";
		
		$HTML->addJS("js/js.php?c=".__CLASS__."&js=ruleeditor.js");
		$HTML->addCSS("css/css.php?c=".__CLASS__."&css=ruleeditor.css");
		
		$ruleRS = (!empty($rule->rs)) ? $rule->rs : false;
		$smarty = $this->initSmarty();
		$udvarr = array();
		foreach ($this->getUDVs() as $u) {
			$udvarr[$u['udv_code']] = $this->genUDVCapsule($u);
		}
		$smarty->assign("udvarr", $udvarr);
		$smarty->assign("rule", $ruleRS);
		$smarty->assign("inputname", $inputname);
		$smarty->assign("editorid", $editorid);
		$html = $smarty->fetch('rule_editor.html');
		
		return $html;
	}
	
	function getUDVs() {
		global $DB;
		return $DB->getArray("select * from fcudv where udv_result_type is not null order by udv_name", false, PDO::FETCH_ASSOC);
	}
	
	function getRules($ruid=false) {
		global $DB;
		if ($ruid) return $DB->getRow("select * from fcrule where ru_id = :0", array($ruid), PDO::FETCH_ASSOC);
		else return $DB->getArray("select * from fcrule order by ru_name", false, PDO::FETCH_ASSOC);
	}

	function genSelector($inputname, $value='', $allowEditor = true) {
		global $HTML;
		static $ruleSelectorCnt;
		if ($ruleSelectorCnt) ++$ruleSelectorCnt;
		else $ruleSelectorCnt = 1;
		$selectorid = "ruleSelector_{$ruleSelectorCnt}";
		
		$HTML->addJS("js/js.php?c=".__CLASS__."&js=ruleselector.js");
		
		$inputname = htmlentities($inputname, ENT_QUOTES, 'UTF-8');
		$rules = $this->getRules();
	
		$html = '<div id="'.$selectorid.'" class="rule-selector-container input-group">'.
					'<input type="hidden" id="'.$inputname.'" name="'.$inputname.'" class="rule-selector-value" value="'.$value.'"/>'.
					'<select class="rule-selector form-control">
						<option value=""></option>';
		foreach ($rules as $r) {
			$truemsg = !empty($r['ru_true_msg']) ? htmlentities($r['ru_true_msg'], ENT_QUOTES, 'UTF-8') : 'TRUE';
			$falsemsg = !empty($r['ru_false_msg']) ? htmlentities($r['ru_false_msg'], ENT_QUOTES, 'UTF-8') : 'FALSE';
			$html .= 	'<option value="'.$r['ru_id'].'" data-truemsg="'.$truemsg.'" data-falsemsg="'.$falsemsg.'">'.
							htmlentities($r['ru_name'], ENT_QUOTES, 'UTF-8').
						'</option>';
		}
		$html .= "	</select>
					<span class='input-group-btn'>
						<button class='rule-selector-toggle btn' data-curr='' type='button'>&nbsp;</button>
					</span>
				</div>";
		
		$js = 
"<script type='text/javascript'>
(function() {	$('#{$selectorid}').ruleSelector(); })()
</script>";
		
		return $html.$js;
	}
	
	
}
?>