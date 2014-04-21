
INSERT INTO fcpmcasetype (ct_code, ct_desc, ct_table, ct_desc_col, ct_key_col) VALUES ('adhoc', 'Adhoc Activity', 'shadhocactivity', 'aha_name', 'aha_id');


INSERT INTO fcpmoperation (op_id, op_parentid, op_wfid, op_name, op_type, op_x, op_y, op_next_opid, op_escalate_opid, op_userrole, op_task_func, op_pmscode) VALUES (42, 0, 17, 'New Request', 'DATAENTRY', 0, 100, 43, NULL, NULL, 'requestAdhocActivity', 'REQUEST_ADHOC_ACTIVITY');
INSERT INTO fcpmoperation (op_id, op_parentid, op_wfid, op_name, op_type, op_x, op_y, op_next_opid, op_escalate_opid, op_userrole, op_task_func, op_pmscode) VALUES (43, 0, 17, 'Approval', 'DATAENTRY', 0, 100, NULL, NULL, NULL, 'adhocActivityApproval', 'ADHOC_APPROVAL');


INSERT INTO fcpmoperationtype (opt_code, opt_name, opt_order, opt_ui, opt_method, opt_shape, opt_bgcolor, opt_icon, opt_fontcolor) VALUES ('DATAENTRY', 'Data Entry', 1, 'Y', NULL, NULL, NULL, NULL, NULL);



INSERT INTO fcpmworkflow (wf_id, wf_name, wf_seq, wf_userrole, wf_status) VALUES (18, 'TSAT', 200, NULL, 'ACTIVE');
INSERT INTO fcpmworkflow (wf_id, wf_name, wf_seq, wf_userrole, wf_status) VALUES (19, 'Reflection', 300, NULL, 'ACTIVE');
INSERT INTO fcpmworkflow (wf_id, wf_name, wf_seq, wf_userrole, wf_status) VALUES (17, 'Adhoc Activity', 100, NULL, 'ACTIVE');
