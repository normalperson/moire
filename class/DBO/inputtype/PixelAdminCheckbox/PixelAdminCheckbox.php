<?php
class DBO_InputType_PixelAdminCheckbox extends DBO_InputType{
	function getHTML($param){
		global $HTML;
		$ret = "";
		extract($param);
		if (is_array($value)) $values = $value;
		else $values = explode(", ",$value);
		$options = array();
		$optionMethod = $dbo->cols[$col]->option->getMethod($state);
		$optionString = $dbo->cols[$col]->option->get($state);
		$options = $dbo->genOption($optionMethod, $optionString, $data);
		
		$optionCount = count($options);
		if(!$optionCount) return '';
		
		foreach($options as $no=>$opt){
			if(is_array($opt)){
				$cnt = count($opt);
				$keys = array_keys($opt);
				if($cnt>1){
					$val = $opt[$keys[0]];
					$text = $opt[$keys[1]];
				}else if($cnt==1){
					$val = $text = $opt[$keys[0]];
				}
			}else{
				$val = $key;
				$text = $opt;
			}
			$currname = htmlentities($name."[]", ENT_QUOTES, $HTML->htmlentities_encoding);
			$currid = htmlentities($currname."_".$no, ENT_QUOTES, $HTML->htmlentities_encoding);
			$currval = htmlentities($val, ENT_QUOTES, $HTML->htmlentities_encoding);
			$ret .= '
				<div class="checkbox">
					<label>
						<input type="checkbox" id="'.$currid.'" name="'.$currname.'" value="'.$currval.'" class="px" '.
						(in_array($val, $values) ? 'checked="checked"' : '').
						($ext?' '.$ext:'').'>
						<span class="lbl">'.$text.'</span>
					</label>
				</div>';
		}
		return $ret;
		
	}
}
?>