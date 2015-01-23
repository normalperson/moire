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


INSERT INTO mjoboutputlookup (jol_id, jol_title, jol_requiredtime, jol_status, jol_price_color_1, jol_price_color_2, jol_price_color_3, jol_price_color_4, jol_pricingtype, jol_price, jol_seq, jol_custtype) VALUES (2, 'Prepare artwork', 360, 'ACTIVE', 10.0000, 15.0000, 20.0000, 25.0000, 'FIXED', 20.0000, 100, 'TYPE B');
INSERT INTO mjoboutputlookup (jol_id, jol_title, jol_requiredtime, jol_status, jol_price_color_1, jol_price_color_2, jol_price_color_3, jol_price_color_4, jol_pricingtype, jol_price, jol_seq, jol_custtype) VALUES (3, 'Master Card', 360, 'ACTIVE', 10.0000, 15.0000, 20.0000, 25.0000, 'FIXED', 5.0000, 200, 'TYPE B');
INSERT INTO mjoboutputlookup (jol_id, jol_title, jol_requiredtime, jol_status, jol_price_color_1, jol_price_color_2, jol_price_color_3, jol_price_color_4, jol_pricingtype, jol_price, jol_seq, jol_custtype) VALUES (1, 'Technical drawing', 360, 'ACTIVE', 10.0000, 15.0000, 20.0000, 25.0000, 'FIXED', 10.0000, 300, 'TYPE B');
INSERT INTO mjoboutputlookup (jol_id, jol_title, jol_requiredtime, jol_status, jol_price_color_1, jol_price_color_2, jol_price_color_3, jol_price_color_4, jol_pricingtype, jol_price, jol_seq, jol_custtype) VALUES (6, 'Barcode', 360, 'ACTIVE', NULL, NULL, NULL, NULL, 'UNIT', 5.0000, 400, 'TYPE B');
INSERT INTO mjoboutputlookup (jol_id, jol_title, jol_requiredtime, jol_status, jol_price_color_1, jol_price_color_2, jol_price_color_3, jol_price_color_4, jol_pricingtype, jol_price, jol_seq, jol_custtype) VALUES (5, 'Output', 360, 'ACTIVE', NULL, NULL, NULL, NULL, 'FIXED', 10.0000, 500, 'TYPE B');
INSERT INTO mjoboutputlookup (jol_id, jol_title, jol_requiredtime, jol_status, jol_price_color_1, jol_price_color_2, jol_price_color_3, jol_price_color_4, jol_pricingtype, jol_price, jol_seq, jol_custtype) VALUES (4, 'Amendment', 360, 'ACTIVE', NULL, NULL, NULL, NULL, 'FIXED', 5.0000, 600, 'TYPE B');
INSERT INTO mjoboutputlookup (jol_id, jol_title, jol_requiredtime, jol_status, jol_price_color_1, jol_price_color_2, jol_price_color_3, jol_price_color_4, jol_pricingtype, jol_price, jol_seq, jol_custtype) VALUES (8, 'Prepare artwork', 360, 'ACTIVE', 10.0000, 15.0000, 20.0000, 25.0000, 'FIXED', 20.0000, 100, 'TYPE A');
INSERT INTO mjoboutputlookup (jol_id, jol_title, jol_requiredtime, jol_status, jol_price_color_1, jol_price_color_2, jol_price_color_3, jol_price_color_4, jol_pricingtype, jol_price, jol_seq, jol_custtype) VALUES (9, 'Master Card', 360, 'ACTIVE', 10.0000, 15.0000, 20.0000, 25.0000, 'FIXED', 5.0000, 200, 'TYPE A');
INSERT INTO mjoboutputlookup (jol_id, jol_title, jol_requiredtime, jol_status, jol_price_color_1, jol_price_color_2, jol_price_color_3, jol_price_color_4, jol_pricingtype, jol_price, jol_seq, jol_custtype) VALUES (10, 'Technical drawing', 360, 'ACTIVE', 10.0000, 15.0000, 20.0000, 25.0000, 'FIXED', 10.0000, 300, 'TYPE A');
INSERT INTO mjoboutputlookup (jol_id, jol_title, jol_requiredtime, jol_status, jol_price_color_1, jol_price_color_2, jol_price_color_3, jol_price_color_4, jol_pricingtype, jol_price, jol_seq, jol_custtype) VALUES (11, 'Barcode', 360, 'ACTIVE', NULL, NULL, NULL, NULL, 'UNIT', 5.0000, 400, 'TYPE A');
INSERT INTO mjoboutputlookup (jol_id, jol_title, jol_requiredtime, jol_status, jol_price_color_1, jol_price_color_2, jol_price_color_3, jol_price_color_4, jol_pricingtype, jol_price, jol_seq, jol_custtype) VALUES (12, 'Output', 360, 'ACTIVE', NULL, NULL, NULL, NULL, 'FIXED', 10.0000, 500, 'TYPE A');
INSERT INTO mjoboutputlookup (jol_id, jol_title, jol_requiredtime, jol_status, jol_price_color_1, jol_price_color_2, jol_price_color_3, jol_price_color_4, jol_pricingtype, jol_price, jol_seq, jol_custtype) VALUES (13, 'Amendment', 360, 'ACTIVE', NULL, NULL, NULL, NULL, 'FIXED', 5.0000, 600, 'TYPE A');
INSERT INTO mjoboutputlookup (jol_id, jol_title, jol_requiredtime, jol_status, jol_price_color_1, jol_price_color_2, jol_price_color_3, jol_price_color_4, jol_pricingtype, jol_price, jol_seq, jol_custtype) VALUES (14, 'Prepare artwork', 360, 'ACTIVE', 10.0000, 15.0000, 20.0000, 25.0000, 'FIXED', 20.0000, 100, 'TYPE C');
INSERT INTO mjoboutputlookup (jol_id, jol_title, jol_requiredtime, jol_status, jol_price_color_1, jol_price_color_2, jol_price_color_3, jol_price_color_4, jol_pricingtype, jol_price, jol_seq, jol_custtype) VALUES (15, 'Master Card', 360, 'ACTIVE', 10.0000, 15.0000, 20.0000, 25.0000, 'FIXED', 5.0000, 200, 'TYPE C');
INSERT INTO mjoboutputlookup (jol_id, jol_title, jol_requiredtime, jol_status, jol_price_color_1, jol_price_color_2, jol_price_color_3, jol_price_color_4, jol_pricingtype, jol_price, jol_seq, jol_custtype) VALUES (16, 'Technical drawing', 360, 'ACTIVE', 10.0000, 15.0000, 20.0000, 25.0000, 'FIXED', 10.0000, 300, 'TYPE C');
INSERT INTO mjoboutputlookup (jol_id, jol_title, jol_requiredtime, jol_status, jol_price_color_1, jol_price_color_2, jol_price_color_3, jol_price_color_4, jol_pricingtype, jol_price, jol_seq, jol_custtype) VALUES (17, 'Barcode', 360, 'ACTIVE', NULL, NULL, NULL, NULL, 'UNIT', 5.0000, 400, 'TYPE C');
INSERT INTO mjoboutputlookup (jol_id, jol_title, jol_requiredtime, jol_status, jol_price_color_1, jol_price_color_2, jol_price_color_3, jol_price_color_4, jol_pricingtype, jol_price, jol_seq, jol_custtype) VALUES (18, 'Output', 360, 'ACTIVE', NULL, NULL, NULL, NULL, 'FIXED', 10.0000, 500, 'TYPE C');
INSERT INTO mjoboutputlookup (jol_id, jol_title, jol_requiredtime, jol_status, jol_price_color_1, jol_price_color_2, jol_price_color_3, jol_price_color_4, jol_pricingtype, jol_price, jol_seq, jol_custtype) VALUES (19, 'Amendment', 360, 'ACTIVE', NULL, NULL, NULL, NULL, 'FIXED', 5.0000, 600, 'TYPE C');
INSERT INTO mjoboutputlookup (jol_id, jol_title, jol_requiredtime, jol_status, jol_price_color_1, jol_price_color_2, jol_price_color_3, jol_price_color_4, jol_pricingtype, jol_price, jol_seq, jol_custtype) VALUES (20, 'Prepare artwork', 360, 'ACTIVE', 10.0000, 15.0000, 20.0000, 25.0000, 'FIXED', 20.0000, 100, 'TYPE D');
INSERT INTO mjoboutputlookup (jol_id, jol_title, jol_requiredtime, jol_status, jol_price_color_1, jol_price_color_2, jol_price_color_3, jol_price_color_4, jol_pricingtype, jol_price, jol_seq, jol_custtype) VALUES (21, 'Master Card', 360, 'ACTIVE', 10.0000, 15.0000, 20.0000, 25.0000, 'FIXED', 5.0000, 200, 'TYPE D');
INSERT INTO mjoboutputlookup (jol_id, jol_title, jol_requiredtime, jol_status, jol_price_color_1, jol_price_color_2, jol_price_color_3, jol_price_color_4, jol_pricingtype, jol_price, jol_seq, jol_custtype) VALUES (22, 'Technical drawing', 360, 'ACTIVE', 10.0000, 15.0000, 20.0000, 25.0000, 'FIXED', 10.0000, 300, 'TYPE D');
INSERT INTO mjoboutputlookup (jol_id, jol_title, jol_requiredtime, jol_status, jol_price_color_1, jol_price_color_2, jol_price_color_3, jol_price_color_4, jol_pricingtype, jol_price, jol_seq, jol_custtype) VALUES (23, 'Barcode', 360, 'ACTIVE', NULL, NULL, NULL, NULL, 'UNIT', 5.0000, 400, 'TYPE D');
INSERT INTO mjoboutputlookup (jol_id, jol_title, jol_requiredtime, jol_status, jol_price_color_1, jol_price_color_2, jol_price_color_3, jol_price_color_4, jol_pricingtype, jol_price, jol_seq, jol_custtype) VALUES (24, 'Output', 360, 'ACTIVE', NULL, NULL, NULL, NULL, 'FIXED', 10.0000, 500, 'TYPE D');
INSERT INTO mjoboutputlookup (jol_id, jol_title, jol_requiredtime, jol_status, jol_price_color_1, jol_price_color_2, jol_price_color_3, jol_price_color_4, jol_pricingtype, jol_price, jol_seq, jol_custtype) VALUES (25, 'Amendment', 360, 'ACTIVE', NULL, NULL, NULL, NULL, 'FIXED', 5.0000, 600, 'TYPE D');


--
-- TOC entry 5007 (class 0 OID 0)
-- Dependencies: 429
-- Name: mjoboutputlookup_jol_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('mjoboutputlookup_jol_id_seq', 25, true);

INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('CUSTYPE', 'TYPE B', 'ROOT', 'External Company ( Purchase Polymer From P&D)', 'ACTIVE', 176);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('CUSTYPE', 'TYPE A', 'ROOT', 'Internal Company + Corrugated box plan', 'ACTIVE', 175);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('CUSTYPE', 'TYPE C', 'ROOT', 'External Company (Purchase Polymer From P&D and increase the amount of purchase)', 'ACTIVE', 177);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('CUSTYPE', 'TYPE D', 'ROOT', 'Total did not have any business with P&D Dynamic SDN BHD', 'ACTIVE', 178);


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
