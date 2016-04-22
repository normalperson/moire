;(function($) {
"use strict";

	$.ruleEditor = function(el) {
		var b = this;
			b.$el = $(el);

		b.init = function () {
			b.$inputList = b.$el.find('.rule-input-list');
			b.$pickList = b.$el.find('.rule-pick-list');
			b.$ruleDataHolder = b.$el.find('.rule-serialize-data');
			b.$ruleID = b.$el.find('.rule-input-id');
			b.$ruleName = b.$el.find('.rule-input-name');
			b.$ruleTrue = b.$el.find('.rule-input-true');
			b.$ruleFalse = b.$el.find('.rule-input-false');
			b.$capsuleList = b.$pickList.children('li').addClass('rule-pick');
			b.inputFocusCnt = 0;
			b.pickFocusCnt = 0;
			b.inputParenthesesFocusCnt = 0;
			b.lastMousedownTS = false;
			b.connectorOption = [
				{ key : 'AND', val : '&&' },
				{ key : 'OR' , val : '||' }
			]
			
			b.$butAddInput = b.$el.find('.rule-button-add-input').click(function () {
				if ($(this).hasClass("rule-button-disable")) return false;
				b.addCapsuleInput(b.$pickList.find('.rule-pick.rule-pick-focus'));
			});
			b.$butRemoveInput = b.$el.find('.rule-button-remove-input').click(function () {
				if ($(this).hasClass("rule-button-disable")) return false;
				b.removeCapsuleInput(b.$inputList.find('.rule-input-focus').parent('.rule-input-pair'));
			});
			b.$butAddParentheses = b.$el.find('.rule-button-add-parentheses').click(function () {
				if ($(this).hasClass("rule-button-disable")) return false;
				var $curr = b.$inputList.find('.rule-input-focus').parent('.rule-input-pair');
				var $tempClone = $curr.first().clone().insertBefore($curr.first());
				
				b.addParentheses($curr, $tempClone);
				$tempClone.remove();
				b.removeFirstConnector();
				b.toggleButtons();
				
			});
			b.$butRemoveParentheses = b.$el.find('.rule-button-remove-parentheses').click(function () {
				if ($(this).hasClass("rule-button-disable")) return false;
				b.removeParentheses(b.$inputList.find('.rule-input-parentheses.rule-input-focus').parent());
			});
			
			b.$butClearInput = b.$el.find('.rule-button-clear-input').click(function () {
				if ($(this).hasClass("rule-button-disable")) return false;
				b.removeCapsuleInput(b.$inputList.find('.rule-input-pair'));
			});	

			$(document).mousedown(function (e) {
				var $t = $(e.target).closest(b.$el);

				var $t2 = $(e.target).closest('.rule-input-udv , .rule-pick, .rule-button, .rule-input-parentheses');
				if ($t.length == 0 || ($t.length > 0 && $t2.length == 0)) {
					if (b.inputFocusCnt > 0) {
						b.$inputList.find(".rule-input-focus").removeClass("rule-input-focus");
						b.inputFocusCnt = 0;
						b.toggleButtons();
					}
					if (b.pickFocusCnt > 0) {
						b.$capsuleList.removeClass("rule-pick-focus");
						b.pickFocusCnt = 0;
						b.toggleButtons();
					}
				}
			})
			
			b.$el.on('keyup', 'input', function () {
				b.assembleJSON();
			})
			b.$el.on('change', 'select', function () {
				b.assembleJSON();
			})
			
			b.activateDragNDrop();
			b.makeSelectable(b.$capsuleList);
			
			if (b.$ruleDataHolder.val()) {
				b.dissembleJSON(JSON.parse(b.$ruleDataHolder.val()));
				b.removeFirstConnector();
			}
			b.toggleButtons();
			
			
		}

		b.activateDragNDrop = function () {
			b.$capsuleList.draggable({
				appendTo: "body",
				helper: "clone"
			})
			b.$inputList.droppable({
				accept: function (el) {
					var hit = b.$capsuleList.filter(el).length;
					return (hit > 0) ? true : false;
				},
				drop: function( e, ui ) {
					b.addCapsuleInput(ui.draggable);
					b.assembleJSON();
				}
			}).sortable({
				opacity: 0.5 ,
				items : ".rule-input-pair",
				update : function () {
					b.removeFirstConnector();
				},
				handle : ".rule-input-udv , .rule-input-parentheses"
			}).disableSelection();
		}

		b.addParentheses = function ($child, $insertAfter, $appendTo, connOper) {
			var $par = b.createParentheses($child, connOper);
			if ($insertAfter) $par.insertAfter($insertAfter);
			else {
				if ($appendTo) $par.appendTo($appendTo);
				else b.$inputList.append($par);
			}
			
			b.assembleJSON();
			return $par;
			
		}

		b.createParentheses = function ($child, connOper) {
			var $p = $("<ul class='rule-input-parentheses'></ul>").sortable({
				opacity: 0.5 ,
				update : function () {
					b.removeFirstConnector();
				},
				handle : ".rule-input-udv , .rule-input-parentheses"
			}).disableSelection();
			if ($child) $child.find(".rule-input-focus").removeClass('rule-input-focus');
			b.makeSelectable($p);
			
			var $grp = b.pairConnector($p, connOper);
			var $del = $("<span class='rule-input-parentheses-delete'>&times</span>").click(function (e) {
				e.stopPropagation();
				b.removeParentheses($grp);
				b.assembleJSON();
			});
			$p.append($del);
			if ($child) $p.append($child);
			return $grp;
		}



		b.addCapsuleInput = function ($cap, $target, connOper, oper, val) {

			$cap.each(function () {
				var $t = $(this).removeClass('rule-pick-focus');
				var $n = $t.clone().removeClass('rule-pick');
				var $pn = b.pairConnector($n, connOper);
				
				if ($cap.hasClass('udv-capsule')) {
					$n.addClass('udv-capsule-active').addClass('rule-input-udv');
					b.makeSelectable($n);
					$n.find('.udv-capsule-delete').click(function (e) {
						e.stopPropagation();
						b.removeCapsuleInput($pn);
					})
					
					if (oper) $n.find('.udv-capsule-oper-input').val(oper);
					if (val) $n.find('.udv-capsule-value-input').val(val);
				}
				
				if (!$target) b.$inputList.append($pn);
				else $target.append($pn);
			})
			b.removeFirstConnector();
			b.toggleButtons();
			b.assembleJSON();
		}

		b.pairConnector = function ($cp, oper) {

			if ($cp.parent('.rule-input-pair').length > 0) return $cp.parent('.rule-input-pair'); //already got connector
			var $cn = b.createConnector(oper);
			var $grp = $('<li>').addClass('rule-input-pair');
			$grp.append($cn).append($cp)
			return $grp;
		}

		b.removeCapsuleInput = function ($cap) {
			$cap.remove();
			b.removeFirstConnector();
			b.toggleButtons();
			b.assembleJSON();
		}

		b.removeParentheses = function ($p) {
			$p.each(function () {
				var $t = $(this);
				$t.children(".rule-input-parentheses").children("li").insertAfter($t);
				$t.remove();
			})
			b.removeFirstConnector();
			b.toggleButtons();
			b.assembleJSON();
		}

		b.removeFirstConnector = function ($ul) {
			var isRoot = false;
			if (typeof $ul == 'undefined') {
				$ul = b.$inputList;
				isRoot = true;
			}
			$ul.children('.rule-input-pair').each(function (i) {
				var $t = $(this);
				var isParentheses = ($t.children('.rule-input-parentheses').length > 0);
				if (isParentheses) b.removeFirstConnector($t.children('.rule-input-parentheses'));
				var $conn = $t.children('.rule-input-connector');
				if ($t.prev('.rule-input-pair').length == 0) {
					// set the first connector to always "AND" and hide it
					b.changeConnectorValue($conn, "&&");
					$conn.addClass('rule-input-connector-first');
				}
				else $conn.removeClass('rule-input-connector-first'); 
			})
			
			if (!isRoot) { 
				if ($ul.children('.rule-input-pair').length < 1) {
					// clear empty parentheses
					$ul.parent('.rule-input-pair').remove();
					return;
				}
			}
		}

		b.makeSelectable = function ($el) {
			$el.mousedown(function (e) {
				if (b.lastMousedownTS !== e.timeStamp) { //manual stop propagation, cannot use stop propagation because it will also stop the sortable mousedown event
					var $t = $(this);
					var focusClass = ($t.hasClass('rule-input-udv') || $t.hasClass('rule-input-parentheses')) ? "rule-input-focus" : "rule-pick-focus";
					if (!e.ctrlKey) {
						b.$capsuleList.removeClass("rule-pick-focus");
						b.$inputList.find(".rule-input-focus").removeClass("rule-input-focus");
						$t.addClass(focusClass);
						
					}
					else {
						if ($t.hasClass(focusClass)) {
							$t.removeClass(focusClass);
						}
						else {
							if (focusClass == 'rule-input-focus') b.$capsuleList.removeClass("rule-pick-focus");
							else b.$inputList.find(".rule-input-focus").removeClass("rule-input-focus");
							$t.addClass(focusClass);
						}
					}
					b.toggleButtons();
				}
				b.lastMousedownTS = e.timeStamp;
			})
		}

		b.assembleJSON = function () {
			var arr;
			arr = b.generateCurrentLevelArray(b.$inputList);
			b.$ruleDataHolder.val(JSON.stringify(arr));
			
		}

		b.dissembleJSON = function (json, $target) {
			for (var i in json) {
				if (json[i].clausetype == 'parentheses') {
					var $par = b.addParentheses(false, false, $target, json[i].oper);
					b.dissembleJSON(json[i].child, $par.find('.rule-input-parentheses'));
				}
				else if (json[i].clausetype == 'udv')
					b.addCapsuleInput(b.$capsuleList.filter("li[data-udv-code='"+json[i].clausecode+"']"), $target, json[i].oper, json[i].clauseoper, json[i].clauseval);
			}
		}

		b.generateCurrentLevelArray = function ($li) {
			var arr = [];
			$li.children('.rule-input-pair').each(function (i) {
				var $t = $(this);
				var $ti = $t.children('.rule-input-connector').next();
				var type = ($ti.hasClass('rule-input-parentheses')) ? "parentheses" : "udv";
				arr[i] = {
					"oper" : $t.children('.rule-input-connector').children('.rule-input-connector-input').val(),
					"clausetype" : type
				}
				switch (type) {
					case "udv" :
						arr[i]["clausecode"] = $ti.attr('data-udv-code');
						arr[i]["clauseoper"] = $ti.find('.udv-capsule-oper-input').val();
						arr[i]["clauseval"] = $ti.find('.udv-capsule-value-input').val();
						break;
					case "parentheses" :
						arr[i]["child"] = b.generateCurrentLevelArray($ti);
						break;
				}
			})
			
			return arr;
		}

		b.updateFocusCount = function () {
			b.inputFocusCnt = b.$inputList.find('.rule-input-focus').length;
			b.pickFocusCnt = b.$pickList.find('.rule-pick-focus').length;
			b.inputParenthesesFocusCnt = b.$inputList.find('.rule-input-focus.rule-input-parentheses').length;
		}

		b.toggleButtons = function () {
			b.updateFocusCount();
			if (b.inputFocusCnt > 0) {
				b.enableButton(b.$butRemoveInput);
				b.enableButton(b.$butAddParentheses);
				if (b.inputParenthesesFocusCnt > 0) b.enableButton(b.$butRemoveParentheses);
				else b.disableButton(b.$butRemoveParentheses);
			}
			else {
				b.disableButton(b.$butRemoveInput);
				b.disableButton(b.$butAddParentheses);
				b.disableButton(b.$butRemoveParentheses);
			}
			
			if (b.pickFocusCnt > 0) {
				b.enableButton(b.$butAddInput);
			}
			else {
				b.disableButton(b.$butAddInput);
			}
		}


		b.createConnector = function (oper) {
			var op = b.connectorOption;
			var $l = $('<li>').addClass('rule-input-connector');
			var $inp, $lab;
			for (var k in op) {
				$inp = $("<input type='hidden'>").addClass('rule-input-connector-input').val(op[k].val);
				$lab = $("<span>").addClass('rule-input-connector-label').html(op[k].key);
				$l.append($inp).append($lab);
				break;
			}
			
			$l.click(function (e) {
				e.stopPropagation();
				b.changeConnectorValue($l);
			});
			
			if (oper) b.changeConnectorValue($l, oper);
			
			return $l;
		}


		b.changeConnectorValue = function ($conn, val) {
			var op = b.connectorOption;
			if (typeof val == 'undefined') val = false; //toggle next value if key is not given
			var $inp = $conn.children('.rule-input-connector-input');
			var $lab = $conn.children('.rule-input-connector-label');
			var curval = $inp.val();
			
			for (var i = 0; i < op.length; i++) {
				if (val && op[i].val == val) {
					$inp.val(op[i].val);
					$lab.html(op[i].key);
					break;
				}
				if (!val && op[i].val == curval) {
					var nextIndex = (i+1)%op.length;
					$inp.val(op[nextIndex].val);
					$lab.html(op[nextIndex].key);
					break;
				}
			}
			b.assembleJSON();
		}

		b.enableButton = function ($bt) {
			$bt.removeClass("rule-button-disable");
		}
		b.disableButton = function ($bt) {
			$bt.addClass("rule-button-disable");
		}
		b.$el.data('ruleEditor', b);
		b.init();
	}
	
	$.fn.ruleEditor = function() {
		return this.each(function() {
			if (!$(this).data('ruleEditor')) {
				(new $.ruleEditor(this));
			}
		});
	};
	
	
	
})(jQuery);
