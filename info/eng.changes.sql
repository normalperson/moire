ALTER TABLE fclookup
   ALTER COLUMN lu_title TYPE character varying(200);


CREATE TABLE morgextra
(
   ox_id serial, 
   ox_orgid integer, 
   ox_customertype character varying, 
   CONSTRAINT const_morgextra_prikey PRIMARY KEY (ox_id)
) 
WITH (
  OIDS = FALSE
)
;
ALTER TABLE morgextra
  OWNER TO pnd;


insert into morgextra(ox_orgid,ox_customertype)
select org_id,'TYPE A' from fcorg;

ALTER TABLE mjoboutputlookup
   ADD COLUMN jol_custtype character varying(50);

delete from mjoboutputlookup;

INSERT INTO mjoboutputlookup (jol_id, jol_title, jol_requiredtime, jol_status, jol_price_color_1, jol_price_color_2, jol_price_color_3, jol_price_color_4, jol_pricingtype, jol_price, jol_seq, jol_custtype) VALUES (2, 'Prepare artwork | 素描图稿', 360, 'ACTIVE', 10.0000, 15.0000, 20.0000, 25.0000, 'FIXED', 20.0000, 10, 'TYPE A');
INSERT INTO mjoboutputlookup (jol_id, jol_title, jol_requiredtime, jol_status, jol_price_color_1, jol_price_color_2, jol_price_color_3, jol_price_color_4, jol_pricingtype, jol_price, jol_seq, jol_custtype) VALUES (3, 'Master Card | 完整图稿', 360, 'ACTIVE', 10.0000, 15.0000, 20.0000, 25.0000, 'FIXED', 5.0000, 20, 'TYPE A');
INSERT INTO mjoboutputlookup (jol_id, jol_title, jol_requiredtime, jol_status, jol_price_color_1, jol_price_color_2, jol_price_color_3, jol_price_color_4, jol_pricingtype, jol_price, jol_seq, jol_custtype) VALUES (4, 'Amendment | 修改图稿', 360, 'ACTIVE', NULL, NULL, NULL, NULL, 'FIXED', 5.0000, 40, 'TYPE A');
INSERT INTO mjoboutputlookup (jol_id, jol_title, jol_requiredtime, jol_status, jol_price_color_1, jol_price_color_2, jol_price_color_3, jol_price_color_4, jol_pricingtype, jol_price, jol_seq, jol_custtype) VALUES (6, 'Barcode | 条码图稿', 360, 'ACTIVE', NULL, NULL, NULL, NULL, 'UNIT', 5.0000, 60, 'TYPE A');
INSERT INTO mjoboutputlookup (jol_id, jol_title, jol_requiredtime, jol_status, jol_price_color_1, jol_price_color_2, jol_price_color_3, jol_price_color_4, jol_pricingtype, jol_price, jol_seq, jol_custtype) VALUES (8, 'Master Card | 完整图稿', 360, 'ACTIVE', 10.0000, 15.0000, 20.0000, 25.0000, 'FIXED', 5.0000, 20, 'TYPE B');
INSERT INTO mjoboutputlookup (jol_id, jol_title, jol_requiredtime, jol_status, jol_price_color_1, jol_price_color_2, jol_price_color_3, jol_price_color_4, jol_pricingtype, jol_price, jol_seq, jol_custtype) VALUES (10, 'Amendment | 修改图稿', 360, 'ACTIVE', NULL, NULL, NULL, NULL, 'FIXED', 5.0000, 40, 'TYPE B');
INSERT INTO mjoboutputlookup (jol_id, jol_title, jol_requiredtime, jol_status, jol_price_color_1, jol_price_color_2, jol_price_color_3, jol_price_color_4, jol_pricingtype, jol_price, jol_seq, jol_custtype) VALUES (12, 'Barcode | 条码图稿', 360, 'ACTIVE', NULL, NULL, NULL, NULL, 'UNIT', 5.0000, 60, 'TYPE B');
INSERT INTO mjoboutputlookup (jol_id, jol_title, jol_requiredtime, jol_status, jol_price_color_1, jol_price_color_2, jol_price_color_3, jol_price_color_4, jol_pricingtype, jol_price, jol_seq, jol_custtype) VALUES (14, 'Master Card | 完整图稿', 360, 'ACTIVE', 10.0000, 15.0000, 20.0000, 25.0000, 'FIXED', 5.0000, 20, 'TYPE C');
INSERT INTO mjoboutputlookup (jol_id, jol_title, jol_requiredtime, jol_status, jol_price_color_1, jol_price_color_2, jol_price_color_3, jol_price_color_4, jol_pricingtype, jol_price, jol_seq, jol_custtype) VALUES (16, 'Amendment | 修改图稿', 360, 'ACTIVE', NULL, NULL, NULL, NULL, 'FIXED', 5.0000, 40, 'TYPE C');
INSERT INTO mjoboutputlookup (jol_id, jol_title, jol_requiredtime, jol_status, jol_price_color_1, jol_price_color_2, jol_price_color_3, jol_price_color_4, jol_pricingtype, jol_price, jol_seq, jol_custtype) VALUES (18, 'Barcode | 条码图稿', 360, 'ACTIVE', NULL, NULL, NULL, NULL, 'UNIT', 5.0000, 60, 'TYPE C');
INSERT INTO mjoboutputlookup (jol_id, jol_title, jol_requiredtime, jol_status, jol_price_color_1, jol_price_color_2, jol_price_color_3, jol_price_color_4, jol_pricingtype, jol_price, jol_seq, jol_custtype) VALUES (20, 'Master Card | 完整图稿', 360, 'ACTIVE', 10.0000, 15.0000, 20.0000, 25.0000, 'FIXED', 5.0000, 20, 'TYPE D');
INSERT INTO mjoboutputlookup (jol_id, jol_title, jol_requiredtime, jol_status, jol_price_color_1, jol_price_color_2, jol_price_color_3, jol_price_color_4, jol_pricingtype, jol_price, jol_seq, jol_custtype) VALUES (22, 'Amendment | 修改图稿', 360, 'ACTIVE', NULL, NULL, NULL, NULL, 'FIXED', 5.0000, 40, 'TYPE D');
INSERT INTO mjoboutputlookup (jol_id, jol_title, jol_requiredtime, jol_status, jol_price_color_1, jol_price_color_2, jol_price_color_3, jol_price_color_4, jol_pricingtype, jol_price, jol_seq, jol_custtype) VALUES (24, 'Barcode | 条码图稿', 360, 'ACTIVE', NULL, NULL, NULL, NULL, 'UNIT', 5.0000, 60, 'TYPE D');
INSERT INTO mjoboutputlookup (jol_id, jol_title, jol_requiredtime, jol_status, jol_price_color_1, jol_price_color_2, jol_price_color_3, jol_price_color_4, jol_pricingtype, jol_price, jol_seq, jol_custtype) VALUES (1, 'Technical drawing | 标注图稿', 360, 'ACTIVE', 10.0000, 15.0000, 20.0000, 25.0000, 'FIXED', 5.0000, 30, 'TYPE A');
INSERT INTO mjoboutputlookup (jol_id, jol_title, jol_requiredtime, jol_status, jol_price_color_1, jol_price_color_2, jol_price_color_3, jol_price_color_4, jol_pricingtype, jol_price, jol_seq, jol_custtype) VALUES (5, 'Output | 排版出片', 360, 'ACTIVE', NULL, NULL, NULL, NULL, 'FIXED', 5.0000, 50, 'TYPE A');
INSERT INTO mjoboutputlookup (jol_id, jol_title, jol_requiredtime, jol_status, jol_price_color_1, jol_price_color_2, jol_price_color_3, jol_price_color_4, jol_pricingtype, jol_price, jol_seq, jol_custtype) VALUES (7, 'Prepare artwork | 素描图稿', 360, 'ACTIVE', 10.0000, 15.0000, 20.0000, 25.0000, 'FIXED', 30.0000, 10, 'TYPE B');
INSERT INTO mjoboutputlookup (jol_id, jol_title, jol_requiredtime, jol_status, jol_price_color_1, jol_price_color_2, jol_price_color_3, jol_price_color_4, jol_pricingtype, jol_price, jol_seq, jol_custtype) VALUES (11, 'Output | 排版出片', 360, 'ACTIVE', NULL, NULL, NULL, NULL, 'FIXED', 5.0000, 50, 'TYPE B');
INSERT INTO mjoboutputlookup (jol_id, jol_title, jol_requiredtime, jol_status, jol_price_color_1, jol_price_color_2, jol_price_color_3, jol_price_color_4, jol_pricingtype, jol_price, jol_seq, jol_custtype) VALUES (9, 'Technical drawing | 标注图稿', 360, 'ACTIVE', 10.0000, 15.0000, 20.0000, 25.0000, 'FIXED', 5.0000, 30, 'TYPE B');
INSERT INTO mjoboutputlookup (jol_id, jol_title, jol_requiredtime, jol_status, jol_price_color_1, jol_price_color_2, jol_price_color_3, jol_price_color_4, jol_pricingtype, jol_price, jol_seq, jol_custtype) VALUES (17, 'Output | 排版出片', 360, 'ACTIVE', NULL, NULL, NULL, NULL, 'FIXED', 5.0000, 50, 'TYPE C');
INSERT INTO mjoboutputlookup (jol_id, jol_title, jol_requiredtime, jol_status, jol_price_color_1, jol_price_color_2, jol_price_color_3, jol_price_color_4, jol_pricingtype, jol_price, jol_seq, jol_custtype) VALUES (15, 'Technical drawing | 标注图稿', 360, 'ACTIVE', 10.0000, 15.0000, 20.0000, 25.0000, 'FIXED', 5.0000, 30, 'TYPE C');
INSERT INTO mjoboutputlookup (jol_id, jol_title, jol_requiredtime, jol_status, jol_price_color_1, jol_price_color_2, jol_price_color_3, jol_price_color_4, jol_pricingtype, jol_price, jol_seq, jol_custtype) VALUES (13, 'Prepare artwork | 素描图稿', 360, 'ACTIVE', 10.0000, 15.0000, 20.0000, 25.0000, 'FIXED', 25.0000, 10, 'TYPE C');
INSERT INTO mjoboutputlookup (jol_id, jol_title, jol_requiredtime, jol_status, jol_price_color_1, jol_price_color_2, jol_price_color_3, jol_price_color_4, jol_pricingtype, jol_price, jol_seq, jol_custtype) VALUES (19, 'Prepare artwork | 素描图稿', 360, 'ACTIVE', 10.0000, 15.0000, 20.0000, 25.0000, 'FIXED', 50.0000, 10, 'TYPE D');
INSERT INTO mjoboutputlookup (jol_id, jol_title, jol_requiredtime, jol_status, jol_price_color_1, jol_price_color_2, jol_price_color_3, jol_price_color_4, jol_pricingtype, jol_price, jol_seq, jol_custtype) VALUES (21, 'Technical drawing | 标注图稿', 360, 'ACTIVE', 10.0000, 15.0000, 20.0000, 25.0000, 'FIXED', 5.0000, 30, 'TYPE D');
INSERT INTO mjoboutputlookup (jol_id, jol_title, jol_requiredtime, jol_status, jol_price_color_1, jol_price_color_2, jol_price_color_3, jol_price_color_4, jol_pricingtype, jol_price, jol_seq, jol_custtype) VALUES (23, 'Output | 排版出片', 360, 'ACTIVE', NULL, NULL, NULL, NULL, 'FIXED', 5.0000, 50, 'TYPE D');



--
-- TOC entry 5007 (class 0 OID 0)
-- Dependencies: 429
-- Name: mjoboutputlookup_jol_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('mjoboutputlookup_jol_id_seq', 24, true);

INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('CUSTYPE', 'TYPE B', 'ROOT', 'External Company ( Purchase Polymer From P&D)', 'ACTIVE', 176);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('CUSTYPE', 'TYPE A', 'ROOT', 'Internal Company + Corrugated box plan', 'ACTIVE', 175);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('CUSTYPE', 'TYPE C', 'ROOT', 'External Company (Purchase Polymer From P&D and increase the amount of purchase)', 'ACTIVE', 177);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('CUSTYPE', 'TYPE D', 'ROOT', 'Total did not have any business with P&D Dynamic SDN BHD', 'ACTIVE', 178);

ALTER TABLE fccurrency
  RENAME TO fccurrency_old;


CREATE TABLE fccurrency
(
  curr_code character varying(12) NOT NULL,
  curr_name character varying(100),
  curr_symbol character varying(5),
  curr_decimal character varying(1) DEFAULT '.'::character varying,
  curr_thousand character varying(1) DEFAULT ','::character varying,
  curr_precision integer DEFAULT 2,
  curr_format character varying(32),
  curr_rate numeric,
  curr_status character varying(32) DEFAULT 'ACTIVE'::character varying,
  CONSTRAINT fccurrency_pkey PRIMARY KEY (curr_code)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE fccurrency
  OWNER TO pnd;

insert into fccurrency(curr_code,curr_name,curr_rate,curr_symbol)
select cr_code,cr_name,cr_rate,cr_symbol from fccurrency_old  


update fclookup
set lu_status = 'INACTIVE'
where lu_cat = 'QCLIST';

insert into fclookup(lu_cat,lu_code,lu_title)
values('QCLIST','MITEM','Missing Item');

insert into fclookup(lu_cat,lu_code,lu_title)
values('QCLIST','MSIZE','Mistake on Size / Position');

insert into fclookup(lu_cat,lu_code,lu_title)
values('QCLIST','MCOLOR','Mistake on Color / Tone');

insert into fclookup(lu_cat,lu_code,lu_title)
values('QCLIST','MWORD','Mistake on word');

ALTER TABLE mjobsheet
   ADD COLUMN js_custrejectreason character varying;


delete from fcmenu;


INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (88, 'SVHOME', 1, 'Home (Supervisor)', 'ACTIVE', 1000, NULL, 'Y', 'Home', NULL, 'supervisorhome', NULL, NULL, 'SUPHOME', 'fa fa-home');
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (86, 'QCHOME', 1, 'Home (QC)', 'ACTIVE', 1000, NULL, 'Y', 'Home', NULL, 'qchome', NULL, NULL, 'QCHOME', 'fa fa-home');
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (87, 'ARTHOME', 1, 'Home (Artist)', 'ACTIVE', 1000, NULL, 'Y', 'Home', NULL, 'artisthome', NULL, NULL, 'ARTHOME', 'fa fa-home');
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (90, 'CUSTHOME', 1, 'Home(Customer)', 'ACTIVE', 1000, NULL, 'Y', 'Home', NULL, 'customerhome', NULL, NULL, 'CUSTHOME', 'fa fa-home');
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (6, 'SETTING', 1, 'Setting', 'ACTIVE', 9000, NULL, 'N', NULL, NULL, NULL, NULL, NULL, 'POSBMENU', 'fa fa-wrench');
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (91, 'ADMINSETUP', 1, 'Admin Setup', 'ACTIVE', 5000, NULL, 'N', NULL, NULL, NULL, NULL, NULL, 'ADMINSETTING', 'fa fa-wrench');
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (103, 'TNC', 106, 'Terms and Conditions', 'ACTIVE', 5000, NULL, 'Y', 'Setting', NULL, 'tncsetup', NULL, NULL, NULL, NULL);
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (92, 'ARTISTSETUP', 107, 'Artist setup', 'ACTIVE', 3000, NULL, 'Y', 'Setting', NULL, 'artistsetup', NULL, NULL, 'ADMINSETTING', NULL);
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (93, 'PNDUSERSETUP', 107, 'User setting', 'ACTIVE', 4000, NULL, 'Y', 'Setting', NULL, 'pndusersetting', NULL, NULL, 'ADMINSETTING', NULL);
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (1, 'HEADERMENU', 0, 'Top Menu', 'ACTIVE', 0, '', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (96, 'RULESETUP', 6, 'Rule Setting', 'ACTIVE', 3500, NULL, 'Y', 'Rulebuilder', NULL, 'setup', NULL, NULL, 'POSBMENU', NULL);
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (69, 'MENU', 6, 'Menu Setup', 'ACTIVE', 4400, NULL, 'Y', 'Setting', NULL, 'menusetup', NULL, NULL, 'POSBMENU', NULL);
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (50, 'PERMSETUP', 82, 'Permission Setup', 'ACTIVE', 4230, NULL, 'Y', 'Setting', '', 'permsetting', '', '', 'POSBMENU', NULL);
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (51, 'ROLESETUP', 82, 'Role Setup', 'ACTIVE', 4220, NULL, 'Y', 'Setting', '', 'rolesetting', '', '', 'POSBMENU', NULL);
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (83, 'LOOKUPSETUP', 6, 'Lookup Setup', 'ACTIVE', 2000, NULL, 'Y', 'Setting', NULL, 'lookupSetup', NULL, NULL, 'POSBMENU', NULL);
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (82, 'USERSETTING', 6, 'POSB User Setting', 'ACTIVE', 2000, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, 'POSBMENU', NULL);
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (107, 'INTUSERSETTING', 91, 'Internal user setup', 'ACTIVE', 3000, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (108, 'EXUSERSETTING', 91, 'External user setup', 'ACTIVE', 4000, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (49, 'USERSETUP', 82, 'POSB User Setup', 'ACTIVE', 4210, NULL, 'Y', 'Setting', '', 'usersetting', '', '', 'POSBMENU', NULL);
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (101, 'DBOSETUP', 6, 'DBO Setup', 'ACTIVE', 6500, NULL, 'Y', 'Setting', NULL, 'DBO', NULL, NULL, NULL, NULL);
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (102, 'ADVTRANSLATE', 6, 'Translation', 'ACTIVE', 7000, NULL, 'Y', 'Translate', NULL, 'advanceTranslate', NULL, NULL, NULL, NULL);
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (105, 'JOBSETUP', 91, 'Job related setup', 'ACTIVE', 1000, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (84, 'JOBCATSETUP', 105, 'Job category setup', 'ACTIVE', 1000, NULL, 'Y', 'Setting', NULL, 'jobcatsetup', NULL, NULL, 'ADMINSETTING', NULL);
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (104, 'JOBOUTPUT', 105, 'Job output setup', 'ACTIVE', 1200, NULL, 'Y', 'Setting', NULL, 'joboutputsetup', NULL, NULL, 'ADMINSETTING', NULL);
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (85, 'CARTONSETUP', 105, 'Carton setup', 'ACTIVE', 2000, NULL, 'Y', 'Setting', NULL, 'cartonSetup', NULL, NULL, 'ADMINSETTING', NULL);
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (106, 'WFSETUP', 91, 'Workflow related setup', 'ACTIVE', 2000, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, 'ADMINSETTING', NULL);
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (97, 'SLASETUP', 106, 'SLA Setup', 'ACTIVE', 2100, NULL, 'Y', 'Setting', NULL, 'timersetup', NULL, NULL, 'ADMINSETTING', NULL);
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (99, 'MAILTEMPLATE', 105, 'Mail Template Setup', 'ACTIVE', 3000, NULL, 'Y', 'Setting', NULL, 'mailtemplatesetup', NULL, NULL, NULL, NULL);
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (94, 'CUSTOMERSETUP', 108, 'Customer setup', 'ACTIVE', 1000, NULL, 'Y', 'Setting', NULL, 'orgsetup', NULL, NULL, 'ADMINSETTING', NULL);
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (109, 'CUSTUSER', 108, 'Customer user setup', 'ACTIVE', 300, NULL, 'Y', 'Setting', NULL, 'custusersetting', NULL, NULL, 'ADMINSETTING', NULL);
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (111, 'INVOICEADM', 115, 'Invoice', 'INACTIVE', 1100, NULL, 'Y', 'Moire', NULL, 'invoiceadm', NULL, NULL, NULL, NULL);
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (110, 'INVOICEAGING', 115, 'Debtors Aging', 'INACTIVE', 1200, NULL, 'Y', 'Moire', NULL, 'debtorsaging', NULL, NULL, NULL, NULL);
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (100, 'CONTACTSETUP', 108, 'Contact Setup', 'INACTIVE', 3000, NULL, 'Y', 'Setting', NULL, 'contactsetup', NULL, NULL, NULL, NULL);
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (112, 'CURRENCYSETUP', 108, 'Currency Setup', 'ACTIVE', 2500, NULL, 'Y', 'Setting', NULL, 'currencySetup', NULL, NULL, 'ADMINSETTING', NULL);
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (113, 'MREGIONSETUP', 108, 'Region Setup', 'ACTIVE', 2600, NULL, 'Y', 'Setting', NULL, 'mregionSetup', NULL, NULL, 'ADMINSETTING', NULL);
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (114, 'PAYMENTADM', 115, 'Payment', 'INACTIVE', 1300, NULL, 'Y', 'Moire', NULL, 'paymentadm', NULL, NULL, 'SUPHOME', NULL);
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (116, 'STATEMENT', 115, 'Invoice', 'ACTIVE', NULL, NULL, 'Y', 'Moire', NULL, 'statement', NULL, NULL, NULL, NULL);
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (98, 'LOCALE', 106, 'Locale Setup', 'ACTIVE', 100, NULL, 'Y', 'Setting', NULL, 'localesetup', NULL, NULL, 'ADMINSETTING', NULL);
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (122, 'PUBLICHOLIDAY', 106, 'Public Holiday', 'ACTIVE', 1000, NULL, 'Y', 'Setting', NULL, 'holidaysetup', NULL, NULL, 'ADMINSETTING', NULL);
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (123, 'CUSTYPE', 108, 'Customer type setup', 'ACTIVE', 500, NULL, 'Y', 'Setting', NULL, 'customertypesetup', NULL, NULL, 'ADMINSETTING', NULL);
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (95, 'MACHINESETUP', 108, 'Customer machine setting', 'INACTIVE', 2000, NULL, 'Y', 'Setting', NULL, 'machinesetup', NULL, NULL, 'ADMINSETTING', NULL);
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (115, 'BILLING', 1, 'Billing', 'ACTIVE', 3000, NULL, 'N', NULL, NULL, NULL, NULL, NULL, 'VIEW_BILLING', 'fa fa-file-text-o ');
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (117, 'REPORT', 1, 'Report', 'ACTIVE', 4000, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, 'MENU_REPORT', 'fa fa-bar-chart-o');
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (119, 'DAILYSALERPT', 117, 'Daily sale report', 'ACTIVE', 2000, NULL, 'Y', 'Report', NULL, 'dailysalesummary', NULL, NULL, 'MENU_REPORT', NULL);
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (120, 'DAILYJOBRPT', 117, 'Daily job report', 'ACTIVE', 3000, NULL, 'Y', 'Report', NULL, 'dailyjobsummary', NULL, NULL, 'MENU_REPORT', NULL);
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (124, 'MTHSALESBYCUSTOMER', 117, 'Monthly sales by customer', 'ACTIVE', 3000, NULL, 'Y', 'Report', NULL, 'monthlysalesbycustomer', NULL, NULL, 'MENU_REPORT', NULL);
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (118, 'DAILYCALLRPT', 117, 'Daily call report', 'ACTIVE', 1000, NULL, 'Y', 'Report', NULL, 'dailycallsummary', NULL, NULL, 'MENU_REPORT', NULL);
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (121, 'RPTPERFORMANCE', 117, 'Performance report', 'ACTIVE', 4000, NULL, 'Y', 'Report', NULL, 'performancesummary', NULL, NULL, 'MENU_REPORT', NULL);


--
-- TOC entry 2698 (class 0 OID 0)
-- Dependencies: 181
-- Name: fcmenu_mn_id_seq; Type: SEQUENCE SET; Schema: pnd_uat; Owner: pnd
--

SELECT pg_catalog.setval('fcmenu_mn_id_seq', 124, true);  