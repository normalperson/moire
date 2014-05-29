--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.4
-- Dumped by pg_dump version 9.3.4
-- Started on 2014-05-17 15:55:25

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 7 (class 2615 OID 24580)
-- Name: pnd; Type: SCHEMA; Schema: -; Owner: pnd
--

CREATE SCHEMA pnd;


ALTER SCHEMA pnd OWNER TO pnd;

SET search_path = pnd, pg_catalog;

--
-- TOC entry 262 (class 1255 OID 24581)
-- Name: generatedata(); Type: FUNCTION; Schema: pnd; Owner: pnd
--

CREATE FUNCTION generatedata() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    currenttime timestamp;
    jobid integer;
    caseid integer;
BEGIN

delete from mjobsheet;

delete from fcpmcase;

delete from fcpmcaseflow;
-- get current time
select now() into currenttime;

-- generate certain number of record
FOR i IN 2..10 LOOP

if i = 2 then
insert into mjobsheet (js_cuid,js_ctid,js_request_date,js_status,js_completiondate,js_assignto,
js_title,js_model,js_description,
js_color_1,js_color_2,js_color_3,js_color_4,
js_angle_1,js_angle_2,js_angle_3,js_angle_4,
js_bleeding,js_primcat)
values(i,i-1,  currenttime - interval '4 hour','QC',currenttime - interval '3 hour','artist1',
'Title '||i,'Model '||i,'Description '||i,
get_random_integer(1,100),get_random_integer(1,100),get_random_integer(1,100),get_random_integer(1,100),
get_random_integer(1,359),get_random_integer(1,359),get_random_integer(1,359),get_random_integer(1,359),
0,get_random_integer(1,8));

SELECT currval('mjobsheet_js_id_seq') into jobid;

INSERT INTO fcpmcase(
            pmc_created_date, pmc_created_by, pmc_casekey, pmc_casetype)
    VALUES (now(), 'Customer', jobid, 'jobsheet');

select currval('fcpmcase_pmc_id_seq') into caseid;

insert into fcpmcaseflow(pmf_pmcid, pmf_obj_id,pmf_obj_type)
values(caseid,5,'PM_Activity');

end if;

if i = 3 then
insert into mjobsheet (js_cuid,js_ctid,js_request_date,js_status,js_assignto,
js_title,js_model,js_description,
js_color_1,js_color_2,js_color_3,js_color_4,
js_angle_1,js_angle_2,js_angle_3,js_angle_4,
js_bleeding,js_primcat)
values(i,i-1,  currenttime - interval '2 hour','QC','artist1',
'Title '||i,'Model '||i,'Description '||i,
get_random_integer(1,100),get_random_integer(1,100),get_random_integer(1,100),get_random_integer(1,100),
get_random_integer(1,359),get_random_integer(1,359),get_random_integer(1,359),get_random_integer(1,359),
0,get_random_integer(1,8));

SELECT currval('mjobsheet_js_id_seq') into jobid;

INSERT INTO fcpmcase(
            pmc_created_date, pmc_created_by, pmc_casekey, pmc_casetype)
    VALUES (now(), 'Customer', jobid, 'jobsheet');

select currval('fcpmcase_pmc_id_seq') into caseid;

insert into fcpmcaseflow(pmf_pmcid, pmf_obj_id,pmf_obj_type)
values(caseid,5,'PM_Activity');

end if;

if i = 4 then
insert into mjobsheet (js_cuid,js_ctid,js_request_date,js_status,js_assignto,
js_title,js_model,js_description,
js_color_1,js_color_2,js_color_3,js_color_4,
js_angle_1,js_angle_2,js_angle_3,js_angle_4,
js_bleeding,js_primcat)
values(i,i-1,  currenttime - interval '3 hour','CUSTOMER ACCEPTANCE','artist2',
'Title '||i,'Model '||i,'Description '||i,
get_random_integer(1,100),get_random_integer(1,100),get_random_integer(1,100),get_random_integer(1,100),
get_random_integer(1,359),get_random_integer(1,359),get_random_integer(1,359),get_random_integer(1,359),
0,get_random_integer(1,8));

SELECT currval('mjobsheet_js_id_seq') into jobid;

INSERT INTO fcpmcase(
            pmc_created_date, pmc_created_by, pmc_casekey, pmc_casetype)
    VALUES (now(), 'Customer', jobid, 'jobsheet');

select currval('fcpmcase_pmc_id_seq') into caseid;

insert into fcpmcaseflow(pmf_pmcid, pmf_obj_id,pmf_obj_type)
values(caseid,6,'PM_Activity');

end if;

if i = 4 then
insert into mjobsheet (js_cuid,js_ctid,js_request_date,js_status,js_assignto,
js_title,js_model,js_description,
js_color_1,js_color_2,js_color_3,js_color_4,
js_angle_1,js_angle_2,js_angle_3,js_angle_4,
js_bleeding,js_primcat)
values(i,i-1,  currenttime - interval '1 hour','ACKNOLWEDGE','artist2',
'Title '||i,'Model '||i,'Description '||i,
get_random_integer(1,100),get_random_integer(1,100),get_random_integer(1,100),get_random_integer(1,100),
get_random_integer(1,359),get_random_integer(1,359),get_random_integer(1,359),get_random_integer(1,359),
0,get_random_integer(1,8));

SELECT currval('mjobsheet_js_id_seq') into jobid;

INSERT INTO fcpmcase(
            pmc_created_date, pmc_created_by, pmc_casekey, pmc_casetype)
    VALUES (now(), 'Customer', jobid, 'jobsheet');

select currval('fcpmcase_pmc_id_seq') into caseid;

insert into fcpmcaseflow(pmf_pmcid, pmf_obj_id,pmf_obj_type)
values(caseid,4,'PM_Activity');

end if;	

if i = 5 then
insert into mjobsheet (js_cuid,js_ctid,js_request_date,js_status,js_assignto,
js_title,js_model,js_description,
js_color_1,js_color_2,js_color_3,js_color_4,
js_angle_1,js_angle_2,js_angle_3,js_angle_4,
js_bleeding,js_primcat)
values(i,i-1,  currenttime - interval '30 minutes','ACKNOLWEDGE','artist1',
'Title '||i,'Model '||i,'Description '||i,
get_random_integer(1,100),get_random_integer(1,100),get_random_integer(1,100),get_random_integer(1,100),
get_random_integer(1,359),get_random_integer(1,359),get_random_integer(1,359),get_random_integer(1,359),
0,get_random_integer(1,8));

SELECT currval('mjobsheet_js_id_seq') into jobid;

INSERT INTO fcpmcase(
            pmc_created_date, pmc_created_by, pmc_casekey, pmc_casetype)
    VALUES (now(), 'Customer', jobid, 'jobsheet');

select currval('fcpmcase_pmc_id_seq') into caseid;

insert into fcpmcaseflow(pmf_pmcid, pmf_obj_id,pmf_obj_type)
values(caseid,4,'PM_Activity');

end if;	

if i = 6 then
insert into mjobsheet (js_cuid,js_ctid,js_request_date,js_status,js_assignto,
js_title,js_model,js_description,
js_color_1,js_color_2,js_color_3,js_color_4,
js_angle_1,js_angle_2,js_angle_3,js_angle_4,
js_bleeding,js_primcat)
values(i,i-1,  currenttime - interval '20 minutes','ASSIGNED','artist2',
'Title '||i,'Model '||i,'Description '||i,
get_random_integer(1,100),get_random_integer(1,100),get_random_integer(1,100),get_random_integer(1,100),
get_random_integer(1,359),get_random_integer(1,359),get_random_integer(1,359),get_random_integer(1,359),
0,get_random_integer(1,8));

SELECT currval('mjobsheet_js_id_seq') into jobid;

INSERT INTO fcpmcase(
            pmc_created_date, pmc_created_by, pmc_casekey, pmc_casetype)
    VALUES (now(), 'Customer', jobid, 'jobsheet');

select currval('fcpmcase_pmc_id_seq') into caseid;

insert into fcpmcaseflow(pmf_pmcid, pmf_obj_id,pmf_obj_type)
values(caseid,3,'PM_Activity');


end if;	

if i = 7 then
insert into mjobsheet (js_cuid,js_ctid,js_request_date,js_status,js_assignto,
js_title,js_model,js_description,
js_color_1,js_color_2,js_color_3,js_color_4,
js_angle_1,js_angle_2,js_angle_3,js_angle_4,
js_bleeding,js_primcat)
values(i,i-1,  currenttime - interval '70 minutes','ASSIGNED','artist2',
'Title '||i,'Model '||i,'Description '||i,
get_random_integer(1,100),get_random_integer(1,100),get_random_integer(1,100),get_random_integer(1,100),
get_random_integer(1,359),get_random_integer(1,359),get_random_integer(1,359),get_random_integer(1,359),
0,get_random_integer(1,8));

SELECT currval('mjobsheet_js_id_seq') into jobid;

INSERT INTO fcpmcase(
            pmc_created_date, pmc_created_by, pmc_casekey, pmc_casetype)
    VALUES (now(), 'Customer', jobid, 'jobsheet');

select currval('fcpmcase_pmc_id_seq') into caseid;

insert into fcpmcaseflow(pmf_pmcid, pmf_obj_id,pmf_obj_type)
values(caseid,3,'PM_Activity');



end if;	

if i = 8 then
insert into mjobsheet (js_cuid,js_ctid,js_request_date,js_status,js_completiondate,js_assignto,
js_title,js_model,js_description,
js_color_1,js_color_2,js_color_3,js_color_4,
js_angle_1,js_angle_2,js_angle_3,js_angle_4,
js_bleeding,js_primcat)
values(i,i-1,  currenttime ,'NEWJOB',null,null,
'New job','new job model ','Description of new job',
get_random_integer(1,100),get_random_integer(1,100),get_random_integer(1,100),get_random_integer(1,100),
get_random_integer(1,359),get_random_integer(1,359),get_random_integer(1,359),get_random_integer(1,359),
0,get_random_integer(1,8));

SELECT currval('mjobsheet_js_id_seq') into jobid;

INSERT INTO fcpmcase(
            pmc_created_date, pmc_created_by, pmc_casekey, pmc_casetype)
    VALUES (now(), 'Customer', jobid, 'jobsheet');

select currval('fcpmcase_pmc_id_seq') into caseid;

insert into fcpmcaseflow(pmf_pmcid, pmf_obj_id,pmf_obj_type)
values(caseid,1,'PM_Activity');
    
end if;

if i = 9 then
insert into mjobsheet (js_cuid,js_ctid,js_request_date,js_status,js_completiondate,js_assignto,
js_title,js_model,js_description,
js_color_1,js_color_2,js_color_3,js_color_4,
js_angle_1,js_angle_2,js_angle_3,js_angle_4,
js_bleeding,js_primcat)
values(5,4,  currenttime ,'NEWJOB',null,null,
'New job '||i,'new job model '||i,'Description of new job '||i,
get_random_integer(1,100),get_random_integer(1,100),get_random_integer(1,100),get_random_integer(1,100),
get_random_integer(1,359),get_random_integer(1,359),get_random_integer(1,359),get_random_integer(1,359),
0,get_random_integer(1,8));

SELECT currval('mjobsheet_js_id_seq') into jobid;

INSERT INTO fcpmcase(
            pmc_created_date, pmc_created_by, pmc_casekey, pmc_casetype)
    VALUES (now(), 'Customer '||i, jobid, 'jobsheet');

select currval('fcpmcase_pmc_id_seq') into caseid;    

insert into fcpmcaseflow(pmf_pmcid, pmf_obj_id,pmf_obj_type)
values(caseid,1,'PM_Activity');

    
end if;

if i = 10 then
insert into mjobsheet (js_cuid,js_ctid,js_request_date,js_status,js_completiondate,js_assignto,
js_title,js_model,js_description,
js_color_1,js_color_2,js_color_3,js_color_4,
js_angle_1,js_angle_2,js_angle_3,js_angle_4,
js_bleeding,js_primcat)
values(4,3,  currenttime ,'REVERT',null,null,
'Revert job ','Revert job ','Description of revert job ',
get_random_integer(1,100),get_random_integer(1,100),get_random_integer(1,100),get_random_integer(1,100),
get_random_integer(1,359),get_random_integer(1,359),get_random_integer(1,359),get_random_integer(1,359),
0,get_random_integer(1,8));

SELECT currval('mjobsheet_js_id_seq') into jobid;

INSERT INTO fcpmcase(
            pmc_created_date, pmc_created_by, pmc_casekey, pmc_casetype)
    VALUES (now(), 'Customer '||i, jobid, 'jobsheet');

select currval('fcpmcase_pmc_id_seq') into caseid;    

insert into fcpmcaseflow(pmf_pmcid, pmf_obj_id,pmf_obj_type)
values(caseid,2,'PM_Activity');

    
end if;
   
END LOOP;

end;

$$;


ALTER FUNCTION pnd.generatedata() OWNER TO pnd;

--
-- TOC entry 263 (class 1255 OID 24582)
-- Name: get_random_integer(integer, integer); Type: FUNCTION; Schema: pnd; Owner: pnd
--

CREATE FUNCTION get_random_integer(integer, integer) RETURNS integer
    LANGUAGE plpgsql STRICT
    AS $_$
DECLARE
    start_int ALIAS FOR $1;
    end_int ALIAS FOR $2;
BEGIN
    RETURN trunc(random() * (end_int-start_int) + start_int);
END;
$_$;


ALTER FUNCTION pnd.get_random_integer(integer, integer) OWNER TO pnd;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 171 (class 1259 OID 24583)
-- Name: fccountry; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE fccountry (
    con_code character varying(24) NOT NULL,
    con_name character varying(1000)
);


ALTER TABLE pnd.fccountry OWNER TO pnd;

--
-- TOC entry 172 (class 1259 OID 24589)
-- Name: fcdoc; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE fcdoc (
    fd_id integer NOT NULL,
    fd_created_date timestamp with time zone DEFAULT now(),
    fd_created_by character varying(100),
    fd_refid character varying(32),
    fd_reftype character varying(100),
    fd_description character varying(1000),
    fd_file_name character varying(200),
    fd_file_ext character varying(32),
    fd_tags character varying(500),
    fd_file_size numeric(20,4)
);


ALTER TABLE pnd.fcdoc OWNER TO pnd;

--
-- TOC entry 173 (class 1259 OID 24596)
-- Name: fcdoc_fd_id_seq; Type: SEQUENCE; Schema: pnd; Owner: pnd
--

CREATE SEQUENCE fcdoc_fd_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd.fcdoc_fd_id_seq OWNER TO pnd;

--
-- TOC entry 2438 (class 0 OID 0)
-- Dependencies: 173
-- Name: fcdoc_fd_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcdoc_fd_id_seq OWNED BY fcdoc.fd_id;


--
-- TOC entry 174 (class 1259 OID 24598)
-- Name: fclang; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE fclang (
    lang_code character varying(5) NOT NULL,
    lang_name character varying(200),
    lang_status character varying(12) DEFAULT 'ACTIVE'::character varying
);


ALTER TABLE pnd.fclang OWNER TO pnd;

--
-- TOC entry 2439 (class 0 OID 0)
-- Dependencies: 174
-- Name: TABLE fclang; Type: COMMENT; Schema: pnd; Owner: pnd
--

COMMENT ON TABLE fclang IS 'ISO 639-1';


--
-- TOC entry 244 (class 1259 OID 25527)
-- Name: fclocale; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE fclocale (
    lc_code character varying(32) NOT NULL,
    lc_description character varying(100),
    lc_primary_langcode character varying(5),
    lc_tzcode character varying(100)
);


ALTER TABLE pnd.fclocale OWNER TO pnd;

--
-- TOC entry 246 (class 1259 OID 25534)
-- Name: fclocaleholiday; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE fclocaleholiday (
    lch_id integer NOT NULL,
    lch_lccode character varying(32),
    lch_date date,
    lch_recurring character varying(1) DEFAULT 'Y'::character varying,
    lch_description character varying(100)
);


ALTER TABLE pnd.fclocaleholiday OWNER TO pnd;

--
-- TOC entry 245 (class 1259 OID 25532)
-- Name: fclocaleholiday_lch_id_seq; Type: SEQUENCE; Schema: pnd; Owner: pnd
--

CREATE SEQUENCE fclocaleholiday_lch_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd.fclocaleholiday_lch_id_seq OWNER TO pnd;

--
-- TOC entry 2440 (class 0 OID 0)
-- Dependencies: 245
-- Name: fclocaleholiday_lch_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fclocaleholiday_lch_id_seq OWNED BY fclocaleholiday.lch_id;


--
-- TOC entry 248 (class 1259 OID 25549)
-- Name: fclocaleworkinghour; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE fclocaleworkinghour (
    lcw_id integer NOT NULL,
    lcw_lccode character varying(32),
    lcw_day character varying(3),
    lcw_start_time time without time zone,
    lcw_end_time time without time zone
);


ALTER TABLE pnd.fclocaleworkinghour OWNER TO pnd;

--
-- TOC entry 247 (class 1259 OID 25547)
-- Name: fclocaleworkinghour_lcw_id_seq; Type: SEQUENCE; Schema: pnd; Owner: pnd
--

CREATE SEQUENCE fclocaleworkinghour_lcw_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd.fclocaleworkinghour_lcw_id_seq OWNER TO pnd;

--
-- TOC entry 2441 (class 0 OID 0)
-- Dependencies: 247
-- Name: fclocaleworkinghour_lcw_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fclocaleworkinghour_lcw_id_seq OWNED BY fclocaleworkinghour.lcw_id;


--
-- TOC entry 175 (class 1259 OID 24602)
-- Name: fclog; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE fclog (
    log_id integer NOT NULL,
    log_created timestamp with time zone DEFAULT now(),
    log_cat character varying(100),
    log_cat2 character varying(100),
    log_ref character varying(100),
    log_ref2 character varying(100),
    log_ref3 character varying(100),
    log_desc text,
    log_desc2 text
);


ALTER TABLE pnd.fclog OWNER TO pnd;

--
-- TOC entry 176 (class 1259 OID 24609)
-- Name: fclog_log_id_seq; Type: SEQUENCE; Schema: pnd; Owner: pnd
--

CREATE SEQUENCE fclog_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd.fclog_log_id_seq OWNER TO pnd;

--
-- TOC entry 2442 (class 0 OID 0)
-- Dependencies: 176
-- Name: fclog_log_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fclog_log_id_seq OWNED BY fclog.log_id;


--
-- TOC entry 177 (class 1259 OID 24611)
-- Name: fclookup; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE fclookup (
    lu_cat character varying(12) NOT NULL,
    lu_code character varying(50) NOT NULL,
    lu_parentcode character varying(12) DEFAULT 'ROOT'::character varying NOT NULL,
    lu_title character varying(50),
    lu_status character varying(12) DEFAULT 'ACTIVE'::character varying,
    lu_id integer NOT NULL
);


ALTER TABLE pnd.fclookup OWNER TO pnd;

--
-- TOC entry 178 (class 1259 OID 24616)
-- Name: fclookup_lu_id_seq; Type: SEQUENCE; Schema: pnd; Owner: pnd
--

CREATE SEQUENCE fclookup_lu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd.fclookup_lu_id_seq OWNER TO pnd;

--
-- TOC entry 2443 (class 0 OID 0)
-- Dependencies: 178
-- Name: fclookup_lu_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fclookup_lu_id_seq OWNED BY fclookup.lu_id;


--
-- TOC entry 179 (class 1259 OID 24618)
-- Name: fcmenu; Type: TABLE; Schema: pnd; Owner: shine; Tablespace: 
--

CREATE TABLE fcmenu (
    mn_id integer NOT NULL,
    mn_code character varying(32),
    mn_parentid integer NOT NULL,
    mn_title character varying(50),
    mn_status character varying(12) DEFAULT 'ACTIVE'::character varying,
    mn_order integer,
    mn_url character varying(100),
    mn_webflag character varying(12),
    mn_class character varying(50),
    mn_classlist character varying(1000),
    mn_func character varying(50),
    mn_funclist character varying(1000),
    mn_param character varying(500),
    mn_pmscode character varying(50)
);


ALTER TABLE pnd.fcmenu OWNER TO shine;

--
-- TOC entry 180 (class 1259 OID 24625)
-- Name: fcmenu_mn_id_seq; Type: SEQUENCE; Schema: pnd; Owner: shine
--

CREATE SEQUENCE fcmenu_mn_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd.fcmenu_mn_id_seq OWNER TO shine;

--
-- TOC entry 2444 (class 0 OID 0)
-- Dependencies: 180
-- Name: fcmenu_mn_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: shine
--

ALTER SEQUENCE fcmenu_mn_id_seq OWNED BY fcmenu.mn_id;


--
-- TOC entry 181 (class 1259 OID 24627)
-- Name: fcmenu_mn_parentid_seq; Type: SEQUENCE; Schema: pnd; Owner: shine
--

CREATE SEQUENCE fcmenu_mn_parentid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd.fcmenu_mn_parentid_seq OWNER TO shine;

--
-- TOC entry 2445 (class 0 OID 0)
-- Dependencies: 181
-- Name: fcmenu_mn_parentid_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: shine
--

ALTER SEQUENCE fcmenu_mn_parentid_seq OWNED BY fcmenu.mn_parentid;


--
-- TOC entry 182 (class 1259 OID 24629)
-- Name: fcorg; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE fcorg (
    org_id integer NOT NULL,
    org_type character varying(32),
    org_external character varying(1) DEFAULT 'Y'::character varying,
    org_name character varying(2000),
    org_parentid integer DEFAULT 0,
    org_primaryid character varying(200),
    org_address character varying(4000),
    org_contactno character varying(100),
    org_status character varying(12) DEFAULT 'ACTIVE'::character varying,
    org_lccode character varying(32)
);


ALTER TABLE pnd.fcorg OWNER TO pnd;

--
-- TOC entry 2446 (class 0 OID 0)
-- Dependencies: 182
-- Name: COLUMN fcorg.org_lccode; Type: COMMENT; Schema: pnd; Owner: pnd
--

COMMENT ON COLUMN fcorg.org_lccode IS 'Locale';


--
-- TOC entry 183 (class 1259 OID 24638)
-- Name: fcorg_org_id_seq; Type: SEQUENCE; Schema: pnd; Owner: pnd
--

CREATE SEQUENCE fcorg_org_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd.fcorg_org_id_seq OWNER TO pnd;

--
-- TOC entry 2447 (class 0 OID 0)
-- Dependencies: 183
-- Name: fcorg_org_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcorg_org_id_seq OWNED BY fcorg.org_id;


--
-- TOC entry 184 (class 1259 OID 24640)
-- Name: fcpermission; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE fcpermission (
    pms_code character varying(50) NOT NULL,
    pms_desc character varying(2000)
);


ALTER TABLE pnd.fcpermission OWNER TO pnd;

--
-- TOC entry 185 (class 1259 OID 24646)
-- Name: fcpmactivity_pmat_id_seq; Type: SEQUENCE; Schema: pnd; Owner: pnd
--

CREATE SEQUENCE fcpmactivity_pmat_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd.fcpmactivity_pmat_id_seq OWNER TO pnd;

--
-- TOC entry 186 (class 1259 OID 24648)
-- Name: fcpmactivity; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE fcpmactivity (
    pmat_id integer DEFAULT nextval('fcpmactivity_pmat_id_seq'::regclass) NOT NULL,
    pmat_pmwfid integer,
    pmat_pmslid integer,
    pmat_name character varying(100),
    pmat_type character varying(32),
    pmat_function character varying(100),
    pmat_sla_interval character varying(50),
    pmat_sla_workinghours_only character varying(1) DEFAULT 'N'::character varying,
    pmat_show_caseinfo character varying(1) DEFAULT 'N'::character varying
);


ALTER TABLE pnd.fcpmactivity OWNER TO pnd;

--
-- TOC entry 2448 (class 0 OID 0)
-- Dependencies: 186
-- Name: COLUMN fcpmactivity.pmat_sla_interval; Type: COMMENT; Schema: pnd; Owner: pnd
--

COMMENT ON COLUMN fcpmactivity.pmat_sla_interval IS 'format follow PHP DateInterval interval_spec';


--
-- TOC entry 187 (class 1259 OID 24652)
-- Name: fcpmcase; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE fcpmcase (
    pmc_id integer NOT NULL,
    pmc_created_date timestamp with time zone,
    pmc_created_by character varying(100),
    pmc_casekey integer,
    pmc_casetype character varying(32),
    pmc_parentid integer,
    pmc_pmwfid integer,
    pmc_start_pmevid integer,
    pmc_start_date timestamp with time zone,
    pmc_end_pmevid integer,
    pmc_end_date timestamp with time zone,
    pmc_closed character varying(1) DEFAULT 'N'::character varying
);


ALTER TABLE pnd.fcpmcase OWNER TO pnd;

--
-- TOC entry 188 (class 1259 OID 24656)
-- Name: fcpmcase_pmc_id_seq; Type: SEQUENCE; Schema: pnd; Owner: pnd
--

CREATE SEQUENCE fcpmcase_pmc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd.fcpmcase_pmc_id_seq OWNER TO pnd;

--
-- TOC entry 2449 (class 0 OID 0)
-- Dependencies: 188
-- Name: fcpmcase_pmc_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcpmcase_pmc_id_seq OWNED BY fcpmcase.pmc_id;


--
-- TOC entry 189 (class 1259 OID 24658)
-- Name: fcpmcasecomment; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE fcpmcasecomment (
    pmcc_id integer NOT NULL,
    pmcc_pmcid integer,
    pmcc_parentid integer,
    pmcc_created_date timestamp with time zone DEFAULT now(),
    pmcc_created_by character varying(100),
    pmcc_comment text,
    pmcc_pin character varying(1),
    pmcc_pin_date timestamp with time zone,
    pmcc_pin_by character varying(100),
    pmcc_delete character varying(1) DEFAULT 'N'::character varying,
    pmcc_pmfid integer
);


ALTER TABLE pnd.fcpmcasecomment OWNER TO pnd;

--
-- TOC entry 190 (class 1259 OID 24666)
-- Name: fcpmcasecomment_pmcc_id_seq; Type: SEQUENCE; Schema: pnd; Owner: pnd
--

CREATE SEQUENCE fcpmcasecomment_pmcc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd.fcpmcasecomment_pmcc_id_seq OWNER TO pnd;

--
-- TOC entry 2450 (class 0 OID 0)
-- Dependencies: 190
-- Name: fcpmcasecomment_pmcc_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcpmcasecomment_pmcc_id_seq OWNED BY fcpmcasecomment.pmcc_id;


--
-- TOC entry 191 (class 1259 OID 24668)
-- Name: fcpmcasecommentread; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE fcpmcasecommentread (
    pmcr_id integer NOT NULL,
    pmcr_pmccid integer,
    pmcr_read_by character varying(100),
    pmcr_read_date timestamp with time zone DEFAULT now()
);


ALTER TABLE pnd.fcpmcasecommentread OWNER TO pnd;

--
-- TOC entry 192 (class 1259 OID 24672)
-- Name: fcpmcasecommentread_pmcr_id_seq; Type: SEQUENCE; Schema: pnd; Owner: pnd
--

CREATE SEQUENCE fcpmcasecommentread_pmcr_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd.fcpmcasecommentread_pmcr_id_seq OWNER TO pnd;

--
-- TOC entry 2451 (class 0 OID 0)
-- Dependencies: 192
-- Name: fcpmcasecommentread_pmcr_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcpmcasecommentread_pmcr_id_seq OWNED BY fcpmcasecommentread.pmcr_id;


--
-- TOC entry 243 (class 1259 OID 25490)
-- Name: fcpmcaseflag; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE fcpmcaseflag (
    pmcf_id integer NOT NULL,
    pmcf_pmcid integer,
    pmcf_flag_by character varying(100),
    pmcf_flag_date timestamp with time zone DEFAULT now(),
    pmcf_flag_type character varying(12)
);


ALTER TABLE pnd.fcpmcaseflag OWNER TO pnd;

--
-- TOC entry 242 (class 1259 OID 25488)
-- Name: fcpmcaseflag_pmcf_id_seq; Type: SEQUENCE; Schema: pnd; Owner: pnd
--

CREATE SEQUENCE fcpmcaseflag_pmcf_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd.fcpmcaseflag_pmcf_id_seq OWNER TO pnd;

--
-- TOC entry 2452 (class 0 OID 0)
-- Dependencies: 242
-- Name: fcpmcaseflag_pmcf_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcpmcaseflag_pmcf_id_seq OWNED BY fcpmcaseflag.pmcf_id;


--
-- TOC entry 193 (class 1259 OID 24674)
-- Name: fcpmcaseflow; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE fcpmcaseflow (
    pmf_id integer NOT NULL,
    pmf_pmcid integer,
    pmf_obj_id integer,
    pmf_obj_type character varying(100),
    pmf_previd integer,
    pmf_prev_pmcnid integer,
    pmf_start_date timestamp with time zone,
    pmf_end_date timestamp with time zone,
    pmf_end_status character varying(32),
    pmf_due_date timestamp with time zone,
    pmf_last_perform_date timestamp with time zone,
    pmf_specific_userid character varying(100),
    pmf_end_by character varying(100),
    pmf_end_pmfid integer,
    pmf_from_event_gateway character varying(1) DEFAULT 'N'::character varying
);


ALTER TABLE pnd.fcpmcaseflow OWNER TO pnd;

--
-- TOC entry 2453 (class 0 OID 0)
-- Dependencies: 193
-- Name: COLUMN fcpmcaseflow.pmf_from_event_gateway; Type: COMMENT; Schema: pnd; Owner: pnd
--

COMMENT ON COLUMN fcpmcaseflow.pmf_from_event_gateway IS 'Last flow is an event gateway';


--
-- TOC entry 194 (class 1259 OID 24677)
-- Name: fcpmcaseflow_pmf_id_seq; Type: SEQUENCE; Schema: pnd; Owner: pnd
--

CREATE SEQUENCE fcpmcaseflow_pmf_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd.fcpmcaseflow_pmf_id_seq OWNER TO pnd;

--
-- TOC entry 2454 (class 0 OID 0)
-- Dependencies: 194
-- Name: fcpmcaseflow_pmf_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcpmcaseflow_pmf_id_seq OWNED BY fcpmcaseflow.pmf_id;


--
-- TOC entry 195 (class 1259 OID 24679)
-- Name: fcpmcasetype; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE fcpmcasetype (
    pmct_code character varying(32) NOT NULL,
    pmct_desc character varying(100),
    pmct_table character varying(100),
    pmct_key_col character varying(100),
    pmct_desc_col character varying(100),
    pmct_caseinfo_function character varying(100)
);


ALTER TABLE pnd.fcpmcasetype OWNER TO pnd;

--
-- TOC entry 196 (class 1259 OID 24682)
-- Name: fcpmconnector; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE fcpmconnector (
    pmcn_id integer NOT NULL,
    pmcn_from_type character varying(100),
    pmcn_from_id integer,
    pmcn_to_type character varying(100),
    pmcn_to_id integer,
    pmcn_order integer,
    pmcn_type character varying(32),
    pmcn_ruid integer
);


ALTER TABLE pnd.fcpmconnector OWNER TO pnd;

--
-- TOC entry 197 (class 1259 OID 24685)
-- Name: fcpmconnector_pmcn_id_seq; Type: SEQUENCE; Schema: pnd; Owner: pnd
--

CREATE SEQUENCE fcpmconnector_pmcn_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd.fcpmconnector_pmcn_id_seq OWNER TO pnd;

--
-- TOC entry 2455 (class 0 OID 0)
-- Dependencies: 197
-- Name: fcpmconnector_pmcn_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcpmconnector_pmcn_id_seq OWNED BY fcpmconnector.pmcn_id;


--
-- TOC entry 198 (class 1259 OID 24687)
-- Name: fcpmevent; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE fcpmevent (
    pmev_id integer NOT NULL,
    pmev_pmwfid integer,
    pmev_pmslid integer,
    pmev_type character varying(32),
    pmev_type_cat character varying(32),
    pmev_intermediate_function character varying(100),
    pmev_timer_interval character varying(50),
    pmev_timer_workinghours_only character varying(1) DEFAULT 'N'::character varying
);


ALTER TABLE pnd.fcpmevent OWNER TO pnd;

--
-- TOC entry 2456 (class 0 OID 0)
-- Dependencies: 198
-- Name: COLUMN fcpmevent.pmev_timer_interval; Type: COMMENT; Schema: pnd; Owner: pnd
--

COMMENT ON COLUMN fcpmevent.pmev_timer_interval IS 'format follow PHP DateInterval interval_spec, can accept UDV';


--
-- TOC entry 199 (class 1259 OID 24690)
-- Name: fcpmevent_pmev_id_seq; Type: SEQUENCE; Schema: pnd; Owner: pnd
--

CREATE SEQUENCE fcpmevent_pmev_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd.fcpmevent_pmev_id_seq OWNER TO pnd;

--
-- TOC entry 2457 (class 0 OID 0)
-- Dependencies: 199
-- Name: fcpmevent_pmev_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcpmevent_pmev_id_seq OWNED BY fcpmevent.pmev_id;


--
-- TOC entry 200 (class 1259 OID 24692)
-- Name: fcpmgateway; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE fcpmgateway (
    pmgw_id integer NOT NULL,
    pmgw_pmwfid integer,
    pmgw_pmslid integer,
    pmgw_type character varying(32),
    pmgw_type_cat character varying(32)
);


ALTER TABLE pnd.fcpmgateway OWNER TO pnd;

--
-- TOC entry 201 (class 1259 OID 24695)
-- Name: fcpmgateway_pmgw_id_seq; Type: SEQUENCE; Schema: pnd; Owner: pnd
--

CREATE SEQUENCE fcpmgateway_pmgw_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd.fcpmgateway_pmgw_id_seq OWNER TO pnd;

--
-- TOC entry 2458 (class 0 OID 0)
-- Dependencies: 201
-- Name: fcpmgateway_pmgw_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcpmgateway_pmgw_id_seq OWNED BY fcpmgateway.pmgw_id;


--
-- TOC entry 202 (class 1259 OID 24697)
-- Name: fcpmswimlane; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE fcpmswimlane (
    pmsl_id integer NOT NULL,
    pmsl_pmwfid integer,
    pmsl_name character varying(100),
    pmsl_order integer
);


ALTER TABLE pnd.fcpmswimlane OWNER TO pnd;

--
-- TOC entry 203 (class 1259 OID 24700)
-- Name: fcpmswimlane_pmsl_id_seq; Type: SEQUENCE; Schema: pnd; Owner: pnd
--

CREATE SEQUENCE fcpmswimlane_pmsl_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd.fcpmswimlane_pmsl_id_seq OWNER TO pnd;

--
-- TOC entry 2459 (class 0 OID 0)
-- Dependencies: 203
-- Name: fcpmswimlane_pmsl_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcpmswimlane_pmsl_id_seq OWNED BY fcpmswimlane.pmsl_id;


--
-- TOC entry 204 (class 1259 OID 24702)
-- Name: fcpmworkflow; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE fcpmworkflow (
    pmwf_id integer NOT NULL,
    pmwf_name character varying(100)
);


ALTER TABLE pnd.fcpmworkflow OWNER TO pnd;

--
-- TOC entry 205 (class 1259 OID 24705)
-- Name: fcpmworkflow_pmwf_id_seq; Type: SEQUENCE; Schema: pnd; Owner: pnd
--

CREATE SEQUENCE fcpmworkflow_pmwf_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd.fcpmworkflow_pmwf_id_seq OWNER TO pnd;

--
-- TOC entry 2460 (class 0 OID 0)
-- Dependencies: 205
-- Name: fcpmworkflow_pmwf_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcpmworkflow_pmwf_id_seq OWNED BY fcpmworkflow.pmwf_id;


--
-- TOC entry 206 (class 1259 OID 24707)
-- Name: fcrole; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE fcrole (
    rol_id integer NOT NULL,
    rol_name character varying(2000)
);


ALTER TABLE pnd.fcrole OWNER TO pnd;

--
-- TOC entry 207 (class 1259 OID 24713)
-- Name: fcrole_rol_id_seq; Type: SEQUENCE; Schema: pnd; Owner: pnd
--

CREATE SEQUENCE fcrole_rol_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd.fcrole_rol_id_seq OWNER TO pnd;

--
-- TOC entry 2461 (class 0 OID 0)
-- Dependencies: 207
-- Name: fcrole_rol_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcrole_rol_id_seq OWNED BY fcrole.rol_id;


--
-- TOC entry 208 (class 1259 OID 24715)
-- Name: fcroleperm; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE fcroleperm (
    rp_id integer NOT NULL,
    rp_rolid integer,
    rp_pmscode character varying(50)
);


ALTER TABLE pnd.fcroleperm OWNER TO pnd;

--
-- TOC entry 209 (class 1259 OID 24718)
-- Name: fcroleperm_rp_id_seq; Type: SEQUENCE; Schema: pnd; Owner: pnd
--

CREATE SEQUENCE fcroleperm_rp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd.fcroleperm_rp_id_seq OWNER TO pnd;

--
-- TOC entry 2462 (class 0 OID 0)
-- Dependencies: 209
-- Name: fcroleperm_rp_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcroleperm_rp_id_seq OWNED BY fcroleperm.rp_id;


--
-- TOC entry 210 (class 1259 OID 24720)
-- Name: fcrule; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE fcrule (
    ru_id integer NOT NULL,
    ru_name character varying(100),
    ru_true_msg character varying(200),
    ru_false_msg character varying(200),
    ru_data character varying(4000)
);


ALTER TABLE pnd.fcrule OWNER TO pnd;

--
-- TOC entry 211 (class 1259 OID 24726)
-- Name: fcrule_ru_id_seq; Type: SEQUENCE; Schema: pnd; Owner: pnd
--

CREATE SEQUENCE fcrule_ru_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd.fcrule_ru_id_seq OWNER TO pnd;

--
-- TOC entry 2463 (class 0 OID 0)
-- Dependencies: 211
-- Name: fcrule_ru_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcrule_ru_id_seq OWNED BY fcrule.ru_id;


--
-- TOC entry 212 (class 1259 OID 24728)
-- Name: fcsetting; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE fcsetting (
    set_id integer NOT NULL,
    set_user character varying(100) DEFAULT 'shine'::character varying,
    set_code character varying(32),
    set_description character varying(4000),
    set_val character varying(1000)
);


ALTER TABLE pnd.fcsetting OWNER TO pnd;

--
-- TOC entry 2464 (class 0 OID 0)
-- Dependencies: 212
-- Name: COLUMN fcsetting.set_id; Type: COMMENT; Schema: pnd; Owner: pnd
--

COMMENT ON COLUMN fcsetting.set_id IS 'setting id';


--
-- TOC entry 2465 (class 0 OID 0)
-- Dependencies: 212
-- Name: COLUMN fcsetting.set_description; Type: COMMENT; Schema: pnd; Owner: pnd
--

COMMENT ON COLUMN fcsetting.set_description IS 'setting description';


--
-- TOC entry 2466 (class 0 OID 0)
-- Dependencies: 212
-- Name: COLUMN fcsetting.set_val; Type: COMMENT; Schema: pnd; Owner: pnd
--

COMMENT ON COLUMN fcsetting.set_val IS 'setting value';


--
-- TOC entry 213 (class 1259 OID 24735)
-- Name: fcsetting_set_id_seq; Type: SEQUENCE; Schema: pnd; Owner: pnd
--

CREATE SEQUENCE fcsetting_set_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd.fcsetting_set_id_seq OWNER TO pnd;

--
-- TOC entry 2467 (class 0 OID 0)
-- Dependencies: 213
-- Name: fcsetting_set_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcsetting_set_id_seq OWNED BY fcsetting.set_id;


--
-- TOC entry 214 (class 1259 OID 24737)
-- Name: fcudv; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE fcudv (
    udv_code character varying(32) NOT NULL,
    udv_name character varying(100),
    udv_query_type character varying(12),
    udv_query character varying(4000),
    udv_return_type character varying(12) DEFAULT 'CELL'::character varying,
    udv_result_type character varying(12),
    udv_result_lookup_type character varying(12),
    udv_result_lookup character varying(4000)
);


ALTER TABLE pnd.fcudv OWNER TO pnd;

--
-- TOC entry 215 (class 1259 OID 24744)
-- Name: fcuser; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE fcuser (
    usr_userid character varying(50) NOT NULL,
    usr_password character varying(50),
    usr_created timestamp with time zone DEFAULT now(),
    usr_name character varying(100),
    usr_email character varying(50),
    usr_last_active timestamp with time zone,
    usr_last_success_login timestamp with time zone,
    usr_last_fail_login timestamp with time zone,
    usr_group character varying(1000),
    usr_sessiondata text,
    usr_status character varying(32) DEFAULT 'ACTIVE'::character varying,
    usr_langcode character varying(5)
);


ALTER TABLE pnd.fcuser OWNER TO pnd;

--
-- TOC entry 216 (class 1259 OID 24752)
-- Name: fcuserdiary; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE fcuserdiary (
    di_id integer NOT NULL,
    di_created timestamp with time zone DEFAULT now(),
    di_created_by character varying(50),
    di_userid character varying(50),
    di_duedate timestamp with time zone,
    di_cat character varying(50),
    di_subject character varying(200),
    di_text text,
    di_status character varying(50) DEFAULT 'ACTIVE'::character varying
);


ALTER TABLE pnd.fcuserdiary OWNER TO pnd;

--
-- TOC entry 217 (class 1259 OID 24760)
-- Name: fcuserdiary_di_id_seq; Type: SEQUENCE; Schema: pnd; Owner: pnd
--

CREATE SEQUENCE fcuserdiary_di_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd.fcuserdiary_di_id_seq OWNER TO pnd;

--
-- TOC entry 2468 (class 0 OID 0)
-- Dependencies: 217
-- Name: fcuserdiary_di_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcuserdiary_di_id_seq OWNED BY fcuserdiary.di_id;


--
-- TOC entry 218 (class 1259 OID 24762)
-- Name: fcuserlogin; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE fcuserlogin (
    ul_id integer NOT NULL,
    ul_userid character varying(50),
    ul_ip character varying(45),
    ul_success character varying(4),
    ul_created timestamp with time zone DEFAULT now(),
    last_modified_date timestamp with time zone DEFAULT now(),
    last_synchronized_date timestamp with time zone,
    record_synchronized character varying(1) DEFAULT 'N'::character varying,
    cloud_refid integer
);


ALTER TABLE pnd.fcuserlogin OWNER TO pnd;

--
-- TOC entry 219 (class 1259 OID 24768)
-- Name: fcuserlogin_ul_id_seq; Type: SEQUENCE; Schema: pnd; Owner: pnd
--

CREATE SEQUENCE fcuserlogin_ul_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd.fcuserlogin_ul_id_seq OWNER TO pnd;

--
-- TOC entry 2469 (class 0 OID 0)
-- Dependencies: 219
-- Name: fcuserlogin_ul_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcuserlogin_ul_id_seq OWNED BY fcuserlogin.ul_id;


--
-- TOC entry 220 (class 1259 OID 24770)
-- Name: fcuserorgrole; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE fcuserorgrole (
    uor_id integer NOT NULL,
    uor_usrid character varying(50),
    uor_orgid integer,
    uor_rolid integer,
    uor_seq integer
);


ALTER TABLE pnd.fcuserorgrole OWNER TO pnd;

--
-- TOC entry 221 (class 1259 OID 24773)
-- Name: fcuserorgrole_uor_id_seq; Type: SEQUENCE; Schema: pnd; Owner: pnd
--

CREATE SEQUENCE fcuserorgrole_uor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd.fcuserorgrole_uor_id_seq OWNER TO pnd;

--
-- TOC entry 2470 (class 0 OID 0)
-- Dependencies: 221
-- Name: fcuserorgrole_uor_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcuserorgrole_uor_id_seq OWNED BY fcuserorgrole.uor_id;


--
-- TOC entry 222 (class 1259 OID 24775)
-- Name: fcusersession; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE fcusersession (
    us_id integer NOT NULL,
    us_sessid character varying(40),
    us_userid character varying(50),
    us_ip character varying(45),
    us_active character varying(4) DEFAULT 'Y'::character varying,
    us_created timestamp with time zone DEFAULT now(),
    us_last_active timestamp with time zone DEFAULT now(),
    us_forcecloseby integer
);


ALTER TABLE pnd.fcusersession OWNER TO pnd;

--
-- TOC entry 2471 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN fcusersession.us_sessid; Type: COMMENT; Schema: pnd; Owner: pnd
--

COMMENT ON COLUMN fcusersession.us_sessid IS 'PHP session id';


--
-- TOC entry 223 (class 1259 OID 24781)
-- Name: fcusersession_us_id_seq; Type: SEQUENCE; Schema: pnd; Owner: pnd
--

CREATE SEQUENCE fcusersession_us_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd.fcusersession_us_id_seq OWNER TO pnd;

--
-- TOC entry 2472 (class 0 OID 0)
-- Dependencies: 223
-- Name: fcusersession_us_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcusersession_us_id_seq OWNED BY fcusersession.us_id;


--
-- TOC entry 224 (class 1259 OID 24783)
-- Name: mcarton; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE mcarton (
    car_id integer NOT NULL,
    car_name character varying(200)
);


ALTER TABLE pnd.mcarton OWNER TO pnd;

--
-- TOC entry 225 (class 1259 OID 24786)
-- Name: mcarton_car_id_seq; Type: SEQUENCE; Schema: pnd; Owner: pnd
--

CREATE SEQUENCE mcarton_car_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd.mcarton_car_id_seq OWNER TO pnd;

--
-- TOC entry 2473 (class 0 OID 0)
-- Dependencies: 225
-- Name: mcarton_car_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE mcarton_car_id_seq OWNED BY mcarton.car_id;


--
-- TOC entry 226 (class 1259 OID 24788)
-- Name: mcartonvariable; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE mcartonvariable (
    carv_code character varying(12),
    carv_unit character varying(12),
    carv_carid integer
);


ALTER TABLE pnd.mcartonvariable OWNER TO pnd;

--
-- TOC entry 2474 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN mcartonvariable.carv_carid; Type: COMMENT; Schema: pnd; Owner: pnd
--

COMMENT ON COLUMN mcartonvariable.carv_carid IS 'foreign key to mcarton car_id';


--
-- TOC entry 227 (class 1259 OID 24791)
-- Name: mjobcat; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE mjobcat (
    jc_id integer NOT NULL,
    jc_jsid integer,
    jc_jclid integer
);


ALTER TABLE pnd.mjobcat OWNER TO pnd;

--
-- TOC entry 228 (class 1259 OID 24794)
-- Name: mjobcat_jc_id_seq; Type: SEQUENCE; Schema: pnd; Owner: pnd
--

CREATE SEQUENCE mjobcat_jc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd.mjobcat_jc_id_seq OWNER TO pnd;

--
-- TOC entry 2475 (class 0 OID 0)
-- Dependencies: 228
-- Name: mjobcat_jc_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE mjobcat_jc_id_seq OWNED BY mjobcat.jc_id;


--
-- TOC entry 229 (class 1259 OID 24796)
-- Name: mjobcatlookup; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE mjobcatlookup (
    jcl_id integer NOT NULL,
    jcl_title character varying(200),
    jcl_requiretime integer,
    jcl_sequence integer
);


ALTER TABLE pnd.mjobcatlookup OWNER TO pnd;

--
-- TOC entry 2476 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN mjobcatlookup.jcl_requiretime; Type: COMMENT; Schema: pnd; Owner: pnd
--

COMMENT ON COLUMN mjobcatlookup.jcl_requiretime IS 'Require time store in minutes';


--
-- TOC entry 230 (class 1259 OID 24799)
-- Name: mjobcatlookup_jcl_id_seq; Type: SEQUENCE; Schema: pnd; Owner: pnd
--

CREATE SEQUENCE mjobcatlookup_jcl_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd.mjobcatlookup_jcl_id_seq OWNER TO pnd;

--
-- TOC entry 2477 (class 0 OID 0)
-- Dependencies: 230
-- Name: mjobcatlookup_jcl_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE mjobcatlookup_jcl_id_seq OWNED BY mjobcatlookup.jcl_id;


--
-- TOC entry 231 (class 1259 OID 24801)
-- Name: mjobsheet; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE mjobsheet (
    js_id integer NOT NULL,
    js_cuid integer,
    js_ctid integer,
    js_request_date timestamp with time zone DEFAULT now(),
    js_request_by character varying(100),
    js_title character varying(100),
    js_model character varying(2000),
    js_description text,
    js_material_provided character varying(100),
    js_color_1 character varying(12),
    js_color_2 character varying(12),
    js_color_3 character varying(12),
    js_color_4 character varying(12),
    js_angle_1 character varying(12),
    js_angle_2 character varying(12),
    js_angle_3 character varying(12),
    js_angle_4 character varying(12),
    js_bleeding character varying(12),
    js_bleeding_remark character varying(1000),
    js_carcode character varying(12),
    js_distortion character varying(1),
    js_distortion_value numeric(20,4),
    js_diecut_ind character varying(1),
    js_diecut_no character varying(100),
    js_category character varying(500),
    js_trapping_size numeric(20,4),
    js_barcodetype integer,
    js_barcodenumber character varying(100),
    js_primcat integer,
    js_status character varying(100),
    js_completiondate timestamp with time zone,
    js_assignto character varying(50)
);


ALTER TABLE pnd.mjobsheet OWNER TO pnd;

--
-- TOC entry 2478 (class 0 OID 0)
-- Dependencies: 231
-- Name: COLUMN mjobsheet.js_primcat; Type: COMMENT; Schema: pnd; Owner: pnd
--

COMMENT ON COLUMN mjobsheet.js_primcat IS 'primary job category';


--
-- TOC entry 232 (class 1259 OID 24808)
-- Name: mjobsheet_js_id_seq; Type: SEQUENCE; Schema: pnd; Owner: pnd
--

CREATE SEQUENCE mjobsheet_js_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd.mjobsheet_js_id_seq OWNER TO pnd;

--
-- TOC entry 2479 (class 0 OID 0)
-- Dependencies: 232
-- Name: mjobsheet_js_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE mjobsheet_js_id_seq OWNED BY mjobsheet.js_id;


--
-- TOC entry 233 (class 1259 OID 24810)
-- Name: mjscartonvalue; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE mjscartonvalue (
    caval_id integer NOT NULL,
    caval_value numeric(20,4),
    carval_carcode character varying(12)
);


ALTER TABLE pnd.mjscartonvalue OWNER TO pnd;

--
-- TOC entry 234 (class 1259 OID 24813)
-- Name: mjscartonvalue_caval_id_seq; Type: SEQUENCE; Schema: pnd; Owner: pnd
--

CREATE SEQUENCE mjscartonvalue_caval_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd.mjscartonvalue_caval_id_seq OWNER TO pnd;

--
-- TOC entry 2480 (class 0 OID 0)
-- Dependencies: 234
-- Name: mjscartonvalue_caval_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE mjscartonvalue_caval_id_seq OWNED BY mjscartonvalue.caval_id;


--
-- TOC entry 235 (class 1259 OID 24815)
-- Name: pndaddress; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE pndaddress (
    ad_id integer NOT NULL,
    ad_refid integer,
    ad_reftype character varying(50),
    ad_order integer DEFAULT 1,
    ad_type character varying(50),
    ad_addr_line1 character varying(100),
    ad_addr_line2 character varying(100),
    ad_addr_line3 character varying(100),
    ad_addr_line4 character varying(100),
    ad_addr_line5 character varying(100),
    ad_postcode character varying(10),
    ad_city character varying(50),
    ad_state character varying(100),
    ad_concode character varying(24),
    ad_remark character varying(1000),
    ad_status character varying(32) DEFAULT 'ACTIVE'::character varying
);


ALTER TABLE pnd.pndaddress OWNER TO pnd;

--
-- TOC entry 236 (class 1259 OID 24823)
-- Name: pndaddress_ad_id_seq; Type: SEQUENCE; Schema: pnd; Owner: pnd
--

CREATE SEQUENCE pndaddress_ad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd.pndaddress_ad_id_seq OWNER TO pnd;

--
-- TOC entry 2481 (class 0 OID 0)
-- Dependencies: 236
-- Name: pndaddress_ad_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE pndaddress_ad_id_seq OWNED BY pndaddress.ad_id;


--
-- TOC entry 237 (class 1259 OID 24825)
-- Name: pndartistskill; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE pndartistskill (
    as_userid character varying(50),
    as_skill character varying(50)
);


ALTER TABLE pnd.pndartistskill OWNER TO pnd;

--
-- TOC entry 238 (class 1259 OID 24828)
-- Name: pndcontact; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE pndcontact (
    ct_id integer NOT NULL,
    ct_refid integer,
    ct_reftype character varying(50),
    ct_name character varying(100),
    ct_email character varying(100)
);


ALTER TABLE pnd.pndcontact OWNER TO pnd;

--
-- TOC entry 239 (class 1259 OID 24831)
-- Name: pndcontact_ct_id_seq; Type: SEQUENCE; Schema: pnd; Owner: pnd
--

CREATE SEQUENCE pndcontact_ct_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd.pndcontact_ct_id_seq OWNER TO pnd;

--
-- TOC entry 2482 (class 0 OID 0)
-- Dependencies: 239
-- Name: pndcontact_ct_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE pndcontact_ct_id_seq OWNED BY pndcontact.ct_id;


--
-- TOC entry 240 (class 1259 OID 24833)
-- Name: pndphone; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE pndphone (
    ph_id integer NOT NULL,
    ph_refid integer,
    ph_reftype character varying(50),
    ph_order integer DEFAULT 1,
    ph_type character varying(50),
    ph_number character varying(100),
    ph_extension character varying(100),
    ph_remark character varying(1000),
    ph_status character varying(32) DEFAULT 'ACTIVE'::character varying
);


ALTER TABLE pnd.pndphone OWNER TO pnd;

--
-- TOC entry 241 (class 1259 OID 24841)
-- Name: pndphone_ph_id_seq; Type: SEQUENCE; Schema: pnd; Owner: pnd
--

CREATE SEQUENCE pndphone_ph_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd.pndphone_ph_id_seq OWNER TO pnd;

--
-- TOC entry 2483 (class 0 OID 0)
-- Dependencies: 241
-- Name: pndphone_ph_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE pndphone_ph_id_seq OWNED BY pndphone.ph_id;


--
-- TOC entry 2080 (class 2604 OID 24843)
-- Name: fd_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcdoc ALTER COLUMN fd_id SET DEFAULT nextval('fcdoc_fd_id_seq'::regclass);


--
-- TOC entry 2147 (class 2604 OID 25537)
-- Name: lch_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fclocaleholiday ALTER COLUMN lch_id SET DEFAULT nextval('fclocaleholiday_lch_id_seq'::regclass);


--
-- TOC entry 2149 (class 2604 OID 25552)
-- Name: lcw_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fclocaleworkinghour ALTER COLUMN lcw_id SET DEFAULT nextval('fclocaleworkinghour_lcw_id_seq'::regclass);


--
-- TOC entry 2083 (class 2604 OID 24844)
-- Name: log_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fclog ALTER COLUMN log_id SET DEFAULT nextval('fclog_log_id_seq'::regclass);


--
-- TOC entry 2086 (class 2604 OID 24845)
-- Name: lu_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fclookup ALTER COLUMN lu_id SET DEFAULT nextval('fclookup_lu_id_seq'::regclass);


--
-- TOC entry 2088 (class 2604 OID 24846)
-- Name: mn_id; Type: DEFAULT; Schema: pnd; Owner: shine
--

ALTER TABLE ONLY fcmenu ALTER COLUMN mn_id SET DEFAULT nextval('fcmenu_mn_id_seq'::regclass);


--
-- TOC entry 2089 (class 2604 OID 24847)
-- Name: mn_parentid; Type: DEFAULT; Schema: pnd; Owner: shine
--

ALTER TABLE ONLY fcmenu ALTER COLUMN mn_parentid SET DEFAULT nextval('fcmenu_mn_parentid_seq'::regclass);


--
-- TOC entry 2093 (class 2604 OID 24848)
-- Name: org_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcorg ALTER COLUMN org_id SET DEFAULT nextval('fcorg_org_id_seq'::regclass);


--
-- TOC entry 2098 (class 2604 OID 24849)
-- Name: pmc_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcpmcase ALTER COLUMN pmc_id SET DEFAULT nextval('fcpmcase_pmc_id_seq'::regclass);


--
-- TOC entry 2101 (class 2604 OID 24850)
-- Name: pmcc_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcpmcasecomment ALTER COLUMN pmcc_id SET DEFAULT nextval('fcpmcasecomment_pmcc_id_seq'::regclass);


--
-- TOC entry 2103 (class 2604 OID 24851)
-- Name: pmcr_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcpmcasecommentread ALTER COLUMN pmcr_id SET DEFAULT nextval('fcpmcasecommentread_pmcr_id_seq'::regclass);


--
-- TOC entry 2145 (class 2604 OID 25493)
-- Name: pmcf_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcpmcaseflag ALTER COLUMN pmcf_id SET DEFAULT nextval('fcpmcaseflag_pmcf_id_seq'::regclass);


--
-- TOC entry 2104 (class 2604 OID 24852)
-- Name: pmf_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcpmcaseflow ALTER COLUMN pmf_id SET DEFAULT nextval('fcpmcaseflow_pmf_id_seq'::regclass);


--
-- TOC entry 2106 (class 2604 OID 24853)
-- Name: pmcn_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcpmconnector ALTER COLUMN pmcn_id SET DEFAULT nextval('fcpmconnector_pmcn_id_seq'::regclass);


--
-- TOC entry 2107 (class 2604 OID 24854)
-- Name: pmev_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcpmevent ALTER COLUMN pmev_id SET DEFAULT nextval('fcpmevent_pmev_id_seq'::regclass);


--
-- TOC entry 2109 (class 2604 OID 24855)
-- Name: pmgw_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcpmgateway ALTER COLUMN pmgw_id SET DEFAULT nextval('fcpmgateway_pmgw_id_seq'::regclass);


--
-- TOC entry 2110 (class 2604 OID 24856)
-- Name: pmsl_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcpmswimlane ALTER COLUMN pmsl_id SET DEFAULT nextval('fcpmswimlane_pmsl_id_seq'::regclass);


--
-- TOC entry 2111 (class 2604 OID 24857)
-- Name: pmwf_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcpmworkflow ALTER COLUMN pmwf_id SET DEFAULT nextval('fcpmworkflow_pmwf_id_seq'::regclass);


--
-- TOC entry 2112 (class 2604 OID 24858)
-- Name: rol_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcrole ALTER COLUMN rol_id SET DEFAULT nextval('fcrole_rol_id_seq'::regclass);


--
-- TOC entry 2113 (class 2604 OID 24859)
-- Name: rp_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcroleperm ALTER COLUMN rp_id SET DEFAULT nextval('fcroleperm_rp_id_seq'::regclass);


--
-- TOC entry 2114 (class 2604 OID 24860)
-- Name: ru_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcrule ALTER COLUMN ru_id SET DEFAULT nextval('fcrule_ru_id_seq'::regclass);


--
-- TOC entry 2116 (class 2604 OID 24861)
-- Name: set_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcsetting ALTER COLUMN set_id SET DEFAULT nextval('fcsetting_set_id_seq'::regclass);


--
-- TOC entry 2122 (class 2604 OID 24862)
-- Name: di_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcuserdiary ALTER COLUMN di_id SET DEFAULT nextval('fcuserdiary_di_id_seq'::regclass);


--
-- TOC entry 2126 (class 2604 OID 24863)
-- Name: ul_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcuserlogin ALTER COLUMN ul_id SET DEFAULT nextval('fcuserlogin_ul_id_seq'::regclass);


--
-- TOC entry 2127 (class 2604 OID 24864)
-- Name: uor_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcuserorgrole ALTER COLUMN uor_id SET DEFAULT nextval('fcuserorgrole_uor_id_seq'::regclass);


--
-- TOC entry 2131 (class 2604 OID 24865)
-- Name: us_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcusersession ALTER COLUMN us_id SET DEFAULT nextval('fcusersession_us_id_seq'::regclass);


--
-- TOC entry 2132 (class 2604 OID 24866)
-- Name: car_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY mcarton ALTER COLUMN car_id SET DEFAULT nextval('mcarton_car_id_seq'::regclass);


--
-- TOC entry 2133 (class 2604 OID 24867)
-- Name: jc_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY mjobcat ALTER COLUMN jc_id SET DEFAULT nextval('mjobcat_jc_id_seq'::regclass);


--
-- TOC entry 2134 (class 2604 OID 24868)
-- Name: jcl_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY mjobcatlookup ALTER COLUMN jcl_id SET DEFAULT nextval('mjobcatlookup_jcl_id_seq'::regclass);


--
-- TOC entry 2136 (class 2604 OID 24869)
-- Name: js_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY mjobsheet ALTER COLUMN js_id SET DEFAULT nextval('mjobsheet_js_id_seq'::regclass);


--
-- TOC entry 2137 (class 2604 OID 24870)
-- Name: caval_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY mjscartonvalue ALTER COLUMN caval_id SET DEFAULT nextval('mjscartonvalue_caval_id_seq'::regclass);


--
-- TOC entry 2140 (class 2604 OID 24871)
-- Name: ad_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY pndaddress ALTER COLUMN ad_id SET DEFAULT nextval('pndaddress_ad_id_seq'::regclass);


--
-- TOC entry 2141 (class 2604 OID 24872)
-- Name: ct_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY pndcontact ALTER COLUMN ct_id SET DEFAULT nextval('pndcontact_ct_id_seq'::regclass);


--
-- TOC entry 2144 (class 2604 OID 24873)
-- Name: ph_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY pndphone ALTER COLUMN ph_id SET DEFAULT nextval('pndphone_ph_id_seq'::regclass);


--
-- TOC entry 2356 (class 0 OID 24583)
-- Dependencies: 171
-- Data for Name: fccountry; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fccountry (con_code, con_name) VALUES ('FJ', 'Fiji');
INSERT INTO fccountry (con_code, con_name) VALUES ('FI', 'Finland');
INSERT INTO fccountry (con_code, con_name) VALUES ('FR', 'France');
INSERT INTO fccountry (con_code, con_name) VALUES ('GF', 'French Guiana');
INSERT INTO fccountry (con_code, con_name) VALUES ('PF', 'French Polynesia');
INSERT INTO fccountry (con_code, con_name) VALUES ('TF', 'French Southern Territories');
INSERT INTO fccountry (con_code, con_name) VALUES ('GA', 'Gabon');
INSERT INTO fccountry (con_code, con_name) VALUES ('GM', 'Gambia');
INSERT INTO fccountry (con_code, con_name) VALUES ('GE', 'Georgia');
INSERT INTO fccountry (con_code, con_name) VALUES ('DE', 'Germany');
INSERT INTO fccountry (con_code, con_name) VALUES ('GH', 'Ghana');
INSERT INTO fccountry (con_code, con_name) VALUES ('GI', 'Gibraltar');
INSERT INTO fccountry (con_code, con_name) VALUES ('GR', 'Greece');
INSERT INTO fccountry (con_code, con_name) VALUES ('GL', 'Greenland');
INSERT INTO fccountry (con_code, con_name) VALUES ('GD', 'Grenada');
INSERT INTO fccountry (con_code, con_name) VALUES ('GP', 'Guadeloupe');
INSERT INTO fccountry (con_code, con_name) VALUES ('GU', 'Guam');
INSERT INTO fccountry (con_code, con_name) VALUES ('GT', 'Guatemala');
INSERT INTO fccountry (con_code, con_name) VALUES ('GG', 'Guernsey');
INSERT INTO fccountry (con_code, con_name) VALUES ('GN', 'Guinea');
INSERT INTO fccountry (con_code, con_name) VALUES ('GW', 'Guinea-bissau');
INSERT INTO fccountry (con_code, con_name) VALUES ('GY', 'Guyana');
INSERT INTO fccountry (con_code, con_name) VALUES ('HT', 'Haiti');
INSERT INTO fccountry (con_code, con_name) VALUES ('HM', 'Heard Island and Mcdonald Islands');
INSERT INTO fccountry (con_code, con_name) VALUES ('HN', 'Honduras');
INSERT INTO fccountry (con_code, con_name) VALUES ('HK', 'Hong Kong');
INSERT INTO fccountry (con_code, con_name) VALUES ('HU', 'Hungary');
INSERT INTO fccountry (con_code, con_name) VALUES ('IS', 'Iceland');
INSERT INTO fccountry (con_code, con_name) VALUES ('IN', 'India');
INSERT INTO fccountry (con_code, con_name) VALUES ('ID', 'Indonesia');
INSERT INTO fccountry (con_code, con_name) VALUES ('TG', 'Togo');
INSERT INTO fccountry (con_code, con_name) VALUES ('MY', 'Malaysia');
INSERT INTO fccountry (con_code, con_name) VALUES ('MV', 'Maldives');
INSERT INTO fccountry (con_code, con_name) VALUES ('ML', 'Mali');
INSERT INTO fccountry (con_code, con_name) VALUES ('MT', 'Malta');
INSERT INTO fccountry (con_code, con_name) VALUES ('MH', 'Marshall Islands');
INSERT INTO fccountry (con_code, con_name) VALUES ('MQ', 'Martinique');
INSERT INTO fccountry (con_code, con_name) VALUES ('MR', 'Mauritania');
INSERT INTO fccountry (con_code, con_name) VALUES ('MU', 'Mauritius');
INSERT INTO fccountry (con_code, con_name) VALUES ('YT', 'Mayotte');
INSERT INTO fccountry (con_code, con_name) VALUES ('MX', 'Mexico');
INSERT INTO fccountry (con_code, con_name) VALUES ('FM', 'Micronesia, Federated States of');
INSERT INTO fccountry (con_code, con_name) VALUES ('MD', 'Moldova, Republic of');
INSERT INTO fccountry (con_code, con_name) VALUES ('MC', 'Monaco');
INSERT INTO fccountry (con_code, con_name) VALUES ('MN', 'Mongolia');
INSERT INTO fccountry (con_code, con_name) VALUES ('ME', 'Montenegro');
INSERT INTO fccountry (con_code, con_name) VALUES ('MS', 'Montserrat');
INSERT INTO fccountry (con_code, con_name) VALUES ('MA', 'Morocco');
INSERT INTO fccountry (con_code, con_name) VALUES ('MZ', 'Mozambique');
INSERT INTO fccountry (con_code, con_name) VALUES ('MM', 'Myanmar');
INSERT INTO fccountry (con_code, con_name) VALUES ('NA', 'Namibia');
INSERT INTO fccountry (con_code, con_name) VALUES ('NR', 'Nauru');
INSERT INTO fccountry (con_code, con_name) VALUES ('NP', 'Nepal');
INSERT INTO fccountry (con_code, con_name) VALUES ('NL', 'Netherlands');
INSERT INTO fccountry (con_code, con_name) VALUES ('AN', 'Netherlands Antilles');
INSERT INTO fccountry (con_code, con_name) VALUES ('NC', 'New Caledonia');
INSERT INTO fccountry (con_code, con_name) VALUES ('NZ', 'New Zealand');
INSERT INTO fccountry (con_code, con_name) VALUES ('NI', 'Nicaragua');
INSERT INTO fccountry (con_code, con_name) VALUES ('NE', 'Niger');
INSERT INTO fccountry (con_code, con_name) VALUES ('NG', 'Nigeria');
INSERT INTO fccountry (con_code, con_name) VALUES ('NU', 'Niue');
INSERT INTO fccountry (con_code, con_name) VALUES ('NF', 'Norfolk Island');
INSERT INTO fccountry (con_code, con_name) VALUES ('MP', 'Northern Mariana Islands');
INSERT INTO fccountry (con_code, con_name) VALUES ('NO', 'Norway');
INSERT INTO fccountry (con_code, con_name) VALUES ('OM', 'Oman');
INSERT INTO fccountry (con_code, con_name) VALUES ('PK', 'Pakistan');
INSERT INTO fccountry (con_code, con_name) VALUES ('PW', 'Palau');
INSERT INTO fccountry (con_code, con_name) VALUES ('PS', 'Palestinian Territory, Occupied');
INSERT INTO fccountry (con_code, con_name) VALUES ('PA', 'Panama');
INSERT INTO fccountry (con_code, con_name) VALUES ('PG', 'Papua New Guinea');
INSERT INTO fccountry (con_code, con_name) VALUES ('PY', 'Paraguay');
INSERT INTO fccountry (con_code, con_name) VALUES ('PE', 'Peru');
INSERT INTO fccountry (con_code, con_name) VALUES ('PH', 'Philippines');
INSERT INTO fccountry (con_code, con_name) VALUES ('PN', 'Pitcairn');
INSERT INTO fccountry (con_code, con_name) VALUES ('PL', 'Poland');
INSERT INTO fccountry (con_code, con_name) VALUES ('PT', 'Portugal');
INSERT INTO fccountry (con_code, con_name) VALUES ('PR', 'Puerto Rico');
INSERT INTO fccountry (con_code, con_name) VALUES ('QA', 'Qatar');
INSERT INTO fccountry (con_code, con_name) VALUES ('RE', 'Reunion');
INSERT INTO fccountry (con_code, con_name) VALUES ('RO', 'Romania');
INSERT INTO fccountry (con_code, con_name) VALUES ('RU', 'Russian Federation');
INSERT INTO fccountry (con_code, con_name) VALUES ('RW', 'Rwanda');
INSERT INTO fccountry (con_code, con_name) VALUES ('SH', 'Saint Helena');
INSERT INTO fccountry (con_code, con_name) VALUES ('KN', 'Saint Kitts and Nevis');
INSERT INTO fccountry (con_code, con_name) VALUES ('LC', 'Saint Lucia');
INSERT INTO fccountry (con_code, con_name) VALUES ('PM', 'Saint Pierre and Miquelon');
INSERT INTO fccountry (con_code, con_name) VALUES ('VC', 'Saint Vincent and The Grenadines');
INSERT INTO fccountry (con_code, con_name) VALUES ('WS', 'Samoa');
INSERT INTO fccountry (con_code, con_name) VALUES ('SM', 'San Marino');
INSERT INTO fccountry (con_code, con_name) VALUES ('ST', 'Sao Tome and Principe');
INSERT INTO fccountry (con_code, con_name) VALUES ('SA', 'Saudi Arabia');
INSERT INTO fccountry (con_code, con_name) VALUES ('SN', 'Senegal');
INSERT INTO fccountry (con_code, con_name) VALUES ('RS', 'Serbia');
INSERT INTO fccountry (con_code, con_name) VALUES ('SC', 'Seychelles');
INSERT INTO fccountry (con_code, con_name) VALUES ('SL', 'Sierra Leone');
INSERT INTO fccountry (con_code, con_name) VALUES ('SG', 'Singapore');
INSERT INTO fccountry (con_code, con_name) VALUES ('SK', 'Slovakia');
INSERT INTO fccountry (con_code, con_name) VALUES ('SI', 'Slovenia');
INSERT INTO fccountry (con_code, con_name) VALUES ('SB', 'Solomon Islands');
INSERT INTO fccountry (con_code, con_name) VALUES ('SO', 'Somalia');
INSERT INTO fccountry (con_code, con_name) VALUES ('ZA', 'South Africa');
INSERT INTO fccountry (con_code, con_name) VALUES ('GS', 'South Georgia and The South Sandwich Islands');
INSERT INTO fccountry (con_code, con_name) VALUES ('ES', 'Spain');
INSERT INTO fccountry (con_code, con_name) VALUES ('LK', 'Sri Lanka');
INSERT INTO fccountry (con_code, con_name) VALUES ('SD', 'Sudan');
INSERT INTO fccountry (con_code, con_name) VALUES ('SR', 'Suriname');
INSERT INTO fccountry (con_code, con_name) VALUES ('SJ', 'Svalbard and Jan Mayen');
INSERT INTO fccountry (con_code, con_name) VALUES ('SZ', 'Swaziland');
INSERT INTO fccountry (con_code, con_name) VALUES ('SE', 'Sweden');
INSERT INTO fccountry (con_code, con_name) VALUES ('CH', 'Switzerland');
INSERT INTO fccountry (con_code, con_name) VALUES ('SY', 'Syrian Arab Republic');
INSERT INTO fccountry (con_code, con_name) VALUES ('TW', 'Taiwan, Province of China');
INSERT INTO fccountry (con_code, con_name) VALUES ('TJ', 'Tajikistan');
INSERT INTO fccountry (con_code, con_name) VALUES ('TZ', 'Tanzania, United Republic of');
INSERT INTO fccountry (con_code, con_name) VALUES ('TH', 'Thailand');
INSERT INTO fccountry (con_code, con_name) VALUES ('TL', 'Timor-leste');
INSERT INTO fccountry (con_code, con_name) VALUES ('TK', 'Tokelau');
INSERT INTO fccountry (con_code, con_name) VALUES ('TO', 'Tonga');
INSERT INTO fccountry (con_code, con_name) VALUES ('TT', 'Trinidad and Tobago');
INSERT INTO fccountry (con_code, con_name) VALUES ('TN', 'Tunisia');
INSERT INTO fccountry (con_code, con_name) VALUES ('TR', 'Turkey');
INSERT INTO fccountry (con_code, con_name) VALUES ('TM', 'Turkmenistan');
INSERT INTO fccountry (con_code, con_name) VALUES ('TC', 'Turks and Caicos Islands');
INSERT INTO fccountry (con_code, con_name) VALUES ('TV', 'Tuvalu');
INSERT INTO fccountry (con_code, con_name) VALUES ('UG', 'Uganda');
INSERT INTO fccountry (con_code, con_name) VALUES ('UA', 'Ukraine');
INSERT INTO fccountry (con_code, con_name) VALUES ('AE', 'United Arab Emirates');
INSERT INTO fccountry (con_code, con_name) VALUES ('GB', 'United Kingdom');
INSERT INTO fccountry (con_code, con_name) VALUES ('US', 'United States');
INSERT INTO fccountry (con_code, con_name) VALUES ('UM', 'United States Minor Outlying Islands');
INSERT INTO fccountry (con_code, con_name) VALUES ('UY', 'Uruguay');
INSERT INTO fccountry (con_code, con_name) VALUES ('UZ', 'Uzbekistan');
INSERT INTO fccountry (con_code, con_name) VALUES ('VU', 'Vanuatu');
INSERT INTO fccountry (con_code, con_name) VALUES ('VE', 'Venezuela');
INSERT INTO fccountry (con_code, con_name) VALUES ('VG', 'Virgin Islands, British');
INSERT INTO fccountry (con_code, con_name) VALUES ('VI', 'Virgin Islands, U.S.');
INSERT INTO fccountry (con_code, con_name) VALUES ('WF', 'Wallis and Futuna');
INSERT INTO fccountry (con_code, con_name) VALUES ('EH', 'Western Sahara');
INSERT INTO fccountry (con_code, con_name) VALUES ('YE', 'Yemen');
INSERT INTO fccountry (con_code, con_name) VALUES ('ZM', 'Zambia');
INSERT INTO fccountry (con_code, con_name) VALUES ('ZW', 'Zimbabwe');
INSERT INTO fccountry (con_code, con_name) VALUES ('AX', 'Aland Islands');
INSERT INTO fccountry (con_code, con_name) VALUES ('AL', 'Albania');
INSERT INTO fccountry (con_code, con_name) VALUES ('DZ', 'Algeria');
INSERT INTO fccountry (con_code, con_name) VALUES ('AS', 'American Samoa');
INSERT INTO fccountry (con_code, con_name) VALUES ('AD', 'Andorra');
INSERT INTO fccountry (con_code, con_name) VALUES ('AO', 'Angola');
INSERT INTO fccountry (con_code, con_name) VALUES ('AI', 'Anguilla');
INSERT INTO fccountry (con_code, con_name) VALUES ('AQ', 'Antarctica');
INSERT INTO fccountry (con_code, con_name) VALUES ('AG', 'Antigua and Barbuda');
INSERT INTO fccountry (con_code, con_name) VALUES ('AR', 'Argentina');
INSERT INTO fccountry (con_code, con_name) VALUES ('AM', 'Armenia');
INSERT INTO fccountry (con_code, con_name) VALUES ('AW', 'Aruba');
INSERT INTO fccountry (con_code, con_name) VALUES ('AU', 'Australia');
INSERT INTO fccountry (con_code, con_name) VALUES ('AT', 'Austria');
INSERT INTO fccountry (con_code, con_name) VALUES ('AZ', 'Azerbaijan');
INSERT INTO fccountry (con_code, con_name) VALUES ('BS', 'Bahamas');
INSERT INTO fccountry (con_code, con_name) VALUES ('BH', 'Bahrain');
INSERT INTO fccountry (con_code, con_name) VALUES ('BD', 'Bangladesh');
INSERT INTO fccountry (con_code, con_name) VALUES ('BB', 'Barbados');
INSERT INTO fccountry (con_code, con_name) VALUES ('BY', 'Belarus');
INSERT INTO fccountry (con_code, con_name) VALUES ('BE', 'Belgium');
INSERT INTO fccountry (con_code, con_name) VALUES ('BZ', 'Belize');
INSERT INTO fccountry (con_code, con_name) VALUES ('BJ', 'Benin');
INSERT INTO fccountry (con_code, con_name) VALUES ('BM', 'Bermuda');
INSERT INTO fccountry (con_code, con_name) VALUES ('BT', 'Bhutan');
INSERT INTO fccountry (con_code, con_name) VALUES ('BO', 'Bolivia');
INSERT INTO fccountry (con_code, con_name) VALUES ('BA', 'Bosnia and Herzegovina');
INSERT INTO fccountry (con_code, con_name) VALUES ('BW', 'Botswana');
INSERT INTO fccountry (con_code, con_name) VALUES ('BV', 'Bouvet Island');
INSERT INTO fccountry (con_code, con_name) VALUES ('BR', 'Brazil');
INSERT INTO fccountry (con_code, con_name) VALUES ('IO', 'British Indian Ocean Territory');
INSERT INTO fccountry (con_code, con_name) VALUES ('BN', 'Brunei Darussalam');
INSERT INTO fccountry (con_code, con_name) VALUES ('BG', 'Bulgaria');
INSERT INTO fccountry (con_code, con_name) VALUES ('BF', 'Burkina Faso');
INSERT INTO fccountry (con_code, con_name) VALUES ('BI', 'Burundi');
INSERT INTO fccountry (con_code, con_name) VALUES ('KH', 'Cambodia');
INSERT INTO fccountry (con_code, con_name) VALUES ('CM', 'Cameroon');
INSERT INTO fccountry (con_code, con_name) VALUES ('CA', 'Canada');
INSERT INTO fccountry (con_code, con_name) VALUES ('CV', 'Cape Verde');
INSERT INTO fccountry (con_code, con_name) VALUES ('KY', 'Cayman Islands');
INSERT INTO fccountry (con_code, con_name) VALUES ('CF', 'Central African Republic');
INSERT INTO fccountry (con_code, con_name) VALUES ('TD', 'Chad');
INSERT INTO fccountry (con_code, con_name) VALUES ('CL', 'Chile');
INSERT INTO fccountry (con_code, con_name) VALUES ('CN', 'China');
INSERT INTO fccountry (con_code, con_name) VALUES ('CX', 'Christmas Island');
INSERT INTO fccountry (con_code, con_name) VALUES ('CC', 'Cocos (Keeling) Islands');
INSERT INTO fccountry (con_code, con_name) VALUES ('CO', 'Colombia');
INSERT INTO fccountry (con_code, con_name) VALUES ('KM', 'Comoros');
INSERT INTO fccountry (con_code, con_name) VALUES ('CG', 'Congo');
INSERT INTO fccountry (con_code, con_name) VALUES ('CK', 'Cook Islands');
INSERT INTO fccountry (con_code, con_name) VALUES ('CR', 'Costa Rica');
INSERT INTO fccountry (con_code, con_name) VALUES ('CI', 'Cote D''ivoire');
INSERT INTO fccountry (con_code, con_name) VALUES ('HR', 'Croatia');
INSERT INTO fccountry (con_code, con_name) VALUES ('CU', 'Cuba');
INSERT INTO fccountry (con_code, con_name) VALUES ('CY', 'Cyprus');
INSERT INTO fccountry (con_code, con_name) VALUES ('CZ', 'Czech Republic');
INSERT INTO fccountry (con_code, con_name) VALUES ('DK', 'Denmark');
INSERT INTO fccountry (con_code, con_name) VALUES ('DJ', 'Djibouti');
INSERT INTO fccountry (con_code, con_name) VALUES ('DM', 'Dominica');
INSERT INTO fccountry (con_code, con_name) VALUES ('DO', 'Dominican Republic');
INSERT INTO fccountry (con_code, con_name) VALUES ('EC', 'Ecuador');
INSERT INTO fccountry (con_code, con_name) VALUES ('EG', 'Egypt');
INSERT INTO fccountry (con_code, con_name) VALUES ('SV', 'El Salvador');
INSERT INTO fccountry (con_code, con_name) VALUES ('GQ', 'Equatorial Guinea');
INSERT INTO fccountry (con_code, con_name) VALUES ('ER', 'Eritrea');
INSERT INTO fccountry (con_code, con_name) VALUES ('EE', 'Estonia');
INSERT INTO fccountry (con_code, con_name) VALUES ('ET', 'Ethiopia');
INSERT INTO fccountry (con_code, con_name) VALUES ('FK', 'Falkland Islands (Malvinas)');
INSERT INTO fccountry (con_code, con_name) VALUES ('FO', 'Faroe Islands');
INSERT INTO fccountry (con_code, con_name) VALUES ('IQ', 'Iraq');
INSERT INTO fccountry (con_code, con_name) VALUES ('IE', 'Ireland');
INSERT INTO fccountry (con_code, con_name) VALUES ('IM', 'Isle of Man');
INSERT INTO fccountry (con_code, con_name) VALUES ('IL', 'Israel');
INSERT INTO fccountry (con_code, con_name) VALUES ('IT', 'Italy');
INSERT INTO fccountry (con_code, con_name) VALUES ('JM', 'Jamaica');
INSERT INTO fccountry (con_code, con_name) VALUES ('JP', 'Japan');
INSERT INTO fccountry (con_code, con_name) VALUES ('JE', 'Jersey');
INSERT INTO fccountry (con_code, con_name) VALUES ('JO', 'Jordan');
INSERT INTO fccountry (con_code, con_name) VALUES ('KZ', 'Kazakhstan');
INSERT INTO fccountry (con_code, con_name) VALUES ('KE', 'Kenya');
INSERT INTO fccountry (con_code, con_name) VALUES ('KI', 'Kiribati');
INSERT INTO fccountry (con_code, con_name) VALUES ('KW', 'Kuwait');
INSERT INTO fccountry (con_code, con_name) VALUES ('KG', 'Kyrgyzstan');
INSERT INTO fccountry (con_code, con_name) VALUES ('LA', 'Lao People''s Democratic Republic');
INSERT INTO fccountry (con_code, con_name) VALUES ('LV', 'Latvia');
INSERT INTO fccountry (con_code, con_name) VALUES ('LB', 'Lebanon');
INSERT INTO fccountry (con_code, con_name) VALUES ('LS', 'Lesotho');
INSERT INTO fccountry (con_code, con_name) VALUES ('LR', 'Liberia');
INSERT INTO fccountry (con_code, con_name) VALUES ('LY', 'Libyan Arab Jamahiriya');
INSERT INTO fccountry (con_code, con_name) VALUES ('LI', 'Liechtenstein');
INSERT INTO fccountry (con_code, con_name) VALUES ('LT', 'Lithuania');
INSERT INTO fccountry (con_code, con_name) VALUES ('LU', 'Luxembourg');
INSERT INTO fccountry (con_code, con_name) VALUES ('MO', 'Macao');
INSERT INTO fccountry (con_code, con_name) VALUES ('MG', 'Madagascar');
INSERT INTO fccountry (con_code, con_name) VALUES ('MW', 'Malawi');
INSERT INTO fccountry (con_code, con_name) VALUES ('AF', 'Afghanistan');
INSERT INTO fccountry (con_code, con_name) VALUES ('VN', 'Vietnam');
INSERT INTO fccountry (con_code, con_name) VALUES ('VA', 'Vatican City');
INSERT INTO fccountry (con_code, con_name) VALUES ('IR', 'Iran');
INSERT INTO fccountry (con_code, con_name) VALUES ('KP', 'Korea (South)');
INSERT INTO fccountry (con_code, con_name) VALUES ('KR', 'Korea (North)');
INSERT INTO fccountry (con_code, con_name) VALUES ('MK', 'Macedonia');


--
-- TOC entry 2357 (class 0 OID 24589)
-- Dependencies: 172
-- Data for Name: fcdoc; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (2, '2014-04-24 13:29:58.09+08', NULL, '5', 'car_id', NULL, '5.png', 'png', '', 12095.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (3, '2014-04-24 13:31:09.326+08', NULL, '6', 'car_id', NULL, '6.png', 'png', '', 10963.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (4, '2014-04-28 19:45:42.897+08', NULL, '7', 'car_id', NULL, '7.png', 'png', NULL, 23347.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (5, '2014-04-28 19:46:38.762+08', NULL, '8', 'car_id', NULL, '8.png', 'png', '', 13436.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (6, '2014-04-28 21:23:03.646+08', NULL, '14', 'car_id', NULL, '14.', 'png', '', 7062.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (7, '2014-04-28 21:33:27.757+08', NULL, '16', 'car_id', NULL, NULL, NULL, '', NULL);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (8, '2014-04-28 21:35:08.971+08', NULL, '17', 'car_id', NULL, NULL, NULL, '', NULL);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (9, '2014-04-28 21:35:20.551+08', NULL, '18', 'car_id', NULL, NULL, NULL, '', NULL);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (10, '2014-04-28 21:36:05.078+08', NULL, '19', 'car_id', NULL, NULL, NULL, '', NULL);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (11, '2014-04-28 21:43:29.514+08', NULL, '21', 'car_id', NULL, '21.xls', 'xls', '', 27136.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (12, '2014-04-28 21:44:00.845+08', NULL, '22', 'car_id', NULL, '22.xls', 'xls', '', 27136.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (13, '2014-04-28 21:46:53.704+08', NULL, '24', 'car_id', NULL, NULL, NULL, '', NULL);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (14, '2014-04-28 21:54:30.45+08', NULL, '31', 'car_id', NULL, '31.png', 'png', '', 7062.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (15, '2014-05-01 16:32:55.239+08', NULL, '33', 'car_id', NULL, '33.png', 'png', '', 23347.0000);


--
-- TOC entry 2484 (class 0 OID 0)
-- Dependencies: 173
-- Name: fcdoc_fd_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcdoc_fd_id_seq', 15, true);


--
-- TOC entry 2359 (class 0 OID 24598)
-- Dependencies: 174
-- Data for Name: fclang; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('AF', 'Afrikaans', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('SQ', 'Albanian', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('AM', 'Amharic', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('AR-DZ', 'Arabic - Algeria', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('AR-BH', 'Arabic - Bahrain', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('AR-EG', 'Arabic - Egypt', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('AR-IQ', 'Arabic - Iraq', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('AR-JO', 'Arabic - Jordan', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('AR-KW', 'Arabic - Kuwait', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('AR-LB', 'Arabic - Lebanon', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('AR-LY', 'Arabic - Libya', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('AR-MA', 'Arabic - Morocco', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('AR-OM', 'Arabic - Oman', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('AR-QA', 'Arabic - Qatar', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('AR-SA', 'Arabic - Saudi Arabia', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('AR-SY', 'Arabic - Syria', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('AR-TN', 'Arabic - Tunisia', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('AR-AE', 'Arabic - United Arab Emirates', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('AR-YE', 'Arabic - Yemen', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('HY', 'Armenian', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('AS', 'Assamese', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('AZ-AZ', 'Azeri - Latin', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('EU', 'Basque', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('BE', 'Belarusian', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('BN', 'Bengali - Bangladesh', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('BS', 'Bosnian', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('BG', 'Bulgarian', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('MY', 'Burmese', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('CA', 'Catalan', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('ZH-CN', 'Chinese - China', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('ZH-HK', 'Chinese - Hong Kong SAR', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('ZH-MO', 'Chinese - Macau SAR', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('ZH-SG', 'Chinese - Singapore', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('ZH-TW', 'Chinese - Taiwan', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('HR', 'Croatian', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('CS', 'Czech', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('DA', 'Danish', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('DV', 'Divehi; Dhivehi; Maldivian', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('NL-BE', 'Dutch - Belgium', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('NL-NL', 'Dutch - Netherlands', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('EN-AU', 'English - Australia', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('EN-BZ', 'English - Belize', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('EN-CA', 'English - Canada', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('EN-CB', 'English - Caribbean', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('EN-GB', 'English - Great Britain', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('EN-IN', 'English - India', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('EN-IE', 'English - Ireland', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('EN-JM', 'English - Jamaica', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('EN-NZ', 'English - New Zealand', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('EN-PH', 'English - Phillippines', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('EN-ZA', 'English - Southern Africa', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('EN-TT', 'English - Trinidad', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('EN-US', 'English - United States', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('ET', 'Estonian', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('FO', 'Faroese', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('FA', 'Farsi - Persian', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('FI', 'Finnish', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('FR-BE', 'French - Belgium', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('FR-CA', 'French - Canada', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('FR-FR', 'French - France', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('FR-LU', 'French - Luxembourg', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('FR-CH', 'French - Switzerland', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('MK', 'FYRO Macedonia', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('GD-IE', 'Gaelic - Ireland', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('GD', 'Gaelic - Scotland', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('DE-AT', 'German - Austria', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('DE-DE', 'German - Germany', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('DE-LI', 'German - Liechtenstein', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('DE-LU', 'German - Luxembourg', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('DE-CH', 'German - Switzerland', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('EL', 'Greek', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('GN', 'Guarani - Paraguay', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('GU', 'Gujarati', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('HE', 'Hebrew', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('HI', 'Hindi', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('HU', 'Hungarian', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('IS', 'Icelandic', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('ID', 'Indonesian', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('IT-IT', 'Italian - Italy', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('IT-CH', 'Italian - Switzerland', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('JA', 'Japanese', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('KN', 'Kannada', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('KS', 'Kashmiri', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('KK', 'Kazakh', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('KM', 'Khmer', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('KO', 'Korean', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('LO', 'Lao', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('LA', 'Latin', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('LV', 'Latvian', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('LT', 'Lithuanian', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('MS-BN', 'Malay - Brunei', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('MS-MY', 'Malay - Malaysia', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('ML', 'Malayalam', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('MT', 'Maltese', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('MI', 'Maori', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('MR', 'Marathi', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('MN', 'Mongolian', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('NE', 'Nepali', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('NO-NO', 'Norwegian - Bokml', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('OR', 'Oriya', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('PL', 'Polish', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('PT-BR', 'Portuguese - Brazil', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('PT-PT', 'Portuguese - Portugal', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('PA', 'Punjabi', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('RM', 'Raeto-Romance', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('RO-MO', 'Romanian - Moldova', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('RO', 'Romanian - Romania', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('RU', 'Russian', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('RU-MO', 'Russian - Moldova', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('SA', 'Sanskrit', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('SR-SP', 'Serbian - Cyrillic', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('TN', 'Setsuana', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('SD', 'Sindhi', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('SI', 'Sinhala; Sinhalese', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('SK', 'Slovak', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('SL', 'Slovenian', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('SO', 'Somali', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('SB', 'Sorbian', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('ES-AR', 'Spanish - Argentina', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('ES-BO', 'Spanish - Bolivia', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('ES-CL', 'Spanish - Chile', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('ES-CO', 'Spanish - Colombia', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('ES-CR', 'Spanish - Costa Rica', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('ES-DO', 'Spanish - Dominican Republic', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('ES-EC', 'Spanish - Ecuador', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('ES-SV', 'Spanish - El Salvador', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('ES-GT', 'Spanish - Guatemala', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('ES-HN', 'Spanish - Honduras', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('ES-MX', 'Spanish - Mexico', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('ES-NI', 'Spanish - Nicaragua', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('ES-PA', 'Spanish - Panama', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('ES-PY', 'Spanish - Paraguay', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('ES-PE', 'Spanish - Peru', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('ES-PR', 'Spanish - Puerto Rico', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('ES-ES', 'Spanish - Spain (Traditional)', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('ES-UY', 'Spanish - Uruguay', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('ES-VE', 'Spanish - Venezuela', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('SW', 'Swahili', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('SV-FI', 'Swedish - Finland', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('SV-SE', 'Swedish - Sweden', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('TG', 'Tajik', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('TA', 'Tamil', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('TT', 'Tatar', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('TE', 'Telugu', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('TH', 'Thai', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('BO', 'Tibetan', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('TS', 'Tsonga', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('TR', 'Turkish', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('TK', 'Turkmen', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('UK', 'Ukrainian', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('UTF-8', 'Unicode', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('UR', 'Urdu', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('UZ-UZ', 'Uzbek - Cyrillic', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('VI', 'Vietnamese', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('CY', 'Welsh', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('XH', 'Xhosa', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('YI', 'Yiddish', 'ACTIVE');
INSERT INTO fclang (lang_code, lang_name, lang_status) VALUES ('ZU', 'Zulu', 'ACTIVE');


--
-- TOC entry 2429 (class 0 OID 25527)
-- Dependencies: 244
-- Data for Name: fclocale; Type: TABLE DATA; Schema: pnd; Owner: pnd
--



--
-- TOC entry 2431 (class 0 OID 25534)
-- Dependencies: 246
-- Data for Name: fclocaleholiday; Type: TABLE DATA; Schema: pnd; Owner: pnd
--



--
-- TOC entry 2485 (class 0 OID 0)
-- Dependencies: 245
-- Name: fclocaleholiday_lch_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fclocaleholiday_lch_id_seq', 1, false);


--
-- TOC entry 2433 (class 0 OID 25549)
-- Dependencies: 248
-- Data for Name: fclocaleworkinghour; Type: TABLE DATA; Schema: pnd; Owner: pnd
--



--
-- TOC entry 2486 (class 0 OID 0)
-- Dependencies: 247
-- Name: fclocaleworkinghour_lcw_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fclocaleworkinghour_lcw_id_seq', 1, false);


--
-- TOC entry 2360 (class 0 OID 24602)
-- Dependencies: 175
-- Data for Name: fclog; Type: TABLE DATA; Schema: pnd; Owner: pnd
--



--
-- TOC entry 2487 (class 0 OID 0)
-- Dependencies: 176
-- Name: fclog_log_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fclog_log_id_seq', 1, false);


--
-- TOC entry 2362 (class 0 OID 24611)
-- Dependencies: 177
-- Data for Name: fclookup; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('THEME', 'blacktie', 'ROOT', 'Black Tie', 'ACTIVE', 1);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('THEME', 'blitzer', 'ROOT', 'Blitzer', 'ACTIVE', 2);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('THEME', 'darkness', 'ROOT', 'Darkness', 'ACTIVE', 3);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('THEME', 'dotluv', 'ROOT', 'Dot Luv', 'ACTIVE', 4);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('THEME', 'eggplant', 'ROOT', 'Eggplant', 'ACTIVE', 5);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('THEME', 'overcast', 'ROOT', 'Overcast', 'ACTIVE', 6);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('THEME', 'skyblue', 'ROOT', 'Skyblue', 'ACTIVE', 7);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('THEME', 'smoothness', 'ROOT', 'Smoothness', 'ACTIVE', 8);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('LANGUAGE', 'zh_TW', 'ROOT', 'Chinese', 'ACTIVE', 9);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('LANGUAGE', 'en_US', 'ROOT', 'English', 'ACTIVE', 10);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('COURSE', 'BUSINESS', 'ROOT', 'Business', 'ACTIVE', 11);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('COURSE', 'BIOSCIENCES', 'ROOT', 'Biosciences', 'ACTIVE', 14);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('COURSE', 'COMMUNICATION', 'ROOT', 'Communication', 'ACTIVE', 15);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('COURSE', 'IT', 'ROOT', 'Computing & IT', 'ACTIVE', 16);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('COURSE', 'DESIGN', 'ROOT', 'Design', 'ACTIVE', 17);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('COURSE', 'EDUCATION', 'ROOT', 'Education', 'ACTIVE', 18);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('COURSE', 'ENGINEERING', 'ROOT', 'Engineering', 'ACTIVE', 19);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('COURSE', 'H&T', 'ROOT', 'Hospitality, Tourism & Culinary Arts', 'ACTIVE', 20);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('COURSE', 'LAW', 'ROOT', 'Law', 'ACTIVE', 21);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('COURSE', 'MEDICINE', 'ROOT', 'Medicine', 'ACTIVE', 22);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('COURSE', 'PHARMACY', 'ROOT', 'Pharmacy', 'ACTIVE', 23);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('EXP', 'FIRSTJOB', 'ROOT', 'I am a fresh graduate seeking my first job', 'ACTIVE', 27);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('EXP', 'INTERN', 'ROOT', 'I am a student seeking internship ', 'ACTIVE', 24);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('EXP', 'WORKSINCE', 'ROOT', 'I have been working since', 'ACTIVE', 28);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('YEAR', '1970', 'ROOT', '1970', 'ACTIVE', 29);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('YEAR', '1971', 'ROOT', '1971', 'ACTIVE', 30);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('YEAR', '1972', 'ROOT', '1972', 'ACTIVE', 31);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('YEAR', '1973', 'ROOT', '1973', 'ACTIVE', 32);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('YEAR', '1974', 'ROOT', '1974', 'ACTIVE', 33);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('YEAR', '1975', 'ROOT', '1975', 'ACTIVE', 34);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('YEAR', '1976', 'ROOT', '1976', 'ACTIVE', 35);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('YEAR', '1977', 'ROOT', '1977', 'ACTIVE', 36);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('YEAR', '1978', 'ROOT', '1978', 'ACTIVE', 37);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('YEAR', '1979', 'ROOT', '1979', 'ACTIVE', 38);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('YEAR', '1980', 'ROOT', '1980', 'ACTIVE', 39);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('YEAR', '1981', 'ROOT', '1981', 'ACTIVE', 40);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('YEAR', '1982', 'ROOT', '1982', 'ACTIVE', 41);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('YEAR', '1983', 'ROOT', '1983', 'ACTIVE', 42);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('YEAR', '1984', 'ROOT', '1984', 'ACTIVE', 43);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('YEAR', '1985', 'ROOT', '1985', 'ACTIVE', 44);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('YEAR', '1986', 'ROOT', '1986', 'ACTIVE', 45);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('YEAR', '1987', 'ROOT', '1987', 'ACTIVE', 46);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('YEAR', '1988', 'ROOT', '1988', 'ACTIVE', 47);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('YEAR', '1989', 'ROOT', '1989', 'ACTIVE', 48);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('YEAR', '1990', 'ROOT', '1990', 'ACTIVE', 49);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('YEAR', '1991', 'ROOT', '1991', 'ACTIVE', 50);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('YEAR', '1992', 'ROOT', '1992', 'ACTIVE', 51);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('YEAR', '1993', 'ROOT', '1993', 'ACTIVE', 52);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('YEAR', '1994', 'ROOT', '1994', 'ACTIVE', 53);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('YEAR', '1995', 'ROOT', '1995', 'ACTIVE', 54);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('YEAR', '1996', 'ROOT', '1996', 'ACTIVE', 55);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('YEAR', '1997', 'ROOT', '1997', 'ACTIVE', 56);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('YEAR', '1998', 'ROOT', '1998', 'ACTIVE', 57);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('YEAR', '1999', 'ROOT', '1999', 'ACTIVE', 58);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('YEAR', '2000', 'ROOT', '2000', 'ACTIVE', 59);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('YEAR', '2001', 'ROOT', '2001', 'ACTIVE', 60);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('YEAR', '2002', 'ROOT', '2002', 'ACTIVE', 61);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('YEAR', '2003', 'ROOT', '2003', 'ACTIVE', 62);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('YEAR', '2004', 'ROOT', '2004', 'ACTIVE', 63);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('YEAR', '2005', 'ROOT', '2005', 'ACTIVE', 64);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('YEAR', '2006', 'ROOT', '2006', 'ACTIVE', 65);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('YEAR', '2007', 'ROOT', '2007', 'ACTIVE', 66);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('YEAR', '2008', 'ROOT', '2008', 'ACTIVE', 67);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('YEAR', '2009', 'ROOT', '2009', 'ACTIVE', 68);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('YEAR', '2010', 'ROOT', '2010', 'ACTIVE', 69);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('YEAR', '2011', 'ROOT', '2011', 'ACTIVE', 70);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('YEAR', '2012', 'ROOT', '2012', 'ACTIVE', 71);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('YEAR', '2013', 'ROOT', '2013', 'ACTIVE', 72);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('SUBJECT', 'SCSC121', 'ROOT', 'Introduction to Computer Programming', 'ACTIVE', 73);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('SUBJECT', 'COSC261', 'ROOT', 'Formal Languages and Compilers', 'ACTIVE', 74);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('SUBJECT', 'COSC262', 'ROOT', 'Algorithms', 'ACTIVE', 76);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('SUBJECT', 'COSC265', 'ROOT', 'Relational Database Systems', 'ACTIVE', 77);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('SUBJECT', 'COSC467', 'ROOT', 'Computational Intelligence', 'ACTIVE', 79);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('SUBJECT', 'COSC364', 'ROOT', 'Internet Technology and Engineering', 'ACTIVE', 80);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('SUBJECT', 'COSC411', 'ROOT', 'Information and Software Visualisation', 'ACTIVE', 81);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('SEMESTER', 'SMS12012', 'ROOT', 'Semester 1 2012', 'ACTIVE', 82);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('SEMESTER', 'SMS22012', 'ROOT', 'Semester 2 2012', 'ACTIVE', 83);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('SEMESTER', 'SMS32012', 'ROOT', 'Semester 3 2012', 'ACTIVE', 84);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('SEMESTER', 'SMS12013', 'ROOT', 'Semester 1 2013', 'ACTIVE', 85);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('SEMESTER', 'SMS22013', 'ROOT', 'Semester 2 2013', 'ACTIVE', 86);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('SEMESTER', 'SMS32013', 'ROOT', 'Semester 3 2013', 'ACTIVE', 87);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('SUBJECT', 'COSC110', 'ROOT', 'Working in a Digital World', 'ACTIVE', 89);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('SUBJECT', 'COSC122', 'ROOT', 'Introduction to Computer Science', 'ACTIVE', 90);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('SUBJECT', 'COSC264', 'ROOT', 'Data Communications and Networking', 'ACTIVE', 91);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('SUBJECT', 'COSC362', 'ROOT', 'Data and Network Security', 'ACTIVE', 92);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('SUBJECT', 'COSC363', 'ROOT', 'Computer Graphics', 'ACTIVE', 93);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('SUBJECT', 'COSC366', 'ROOT', 'Research Project', 'ACTIVE', 94);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('SUBJECT', 'COSC401', 'ROOT', 'Machine Learning', 'ACTIVE', 95);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('SUBJECT', 'COSC410', 'ROOT', 'Simulation: Modelling and Analysis', 'ACTIVE', 96);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('SUBJECT', 'COSC413', 'ROOT', 'Advanced Topics in Algorithms', 'ACTIVE', 98);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('SUBJECT', 'COSC418', 'ROOT', 'Wireless Ad-hoc and Sensor Networks', 'ACTIVE', 99);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('SUBJECT', 'COSC421', 'ROOT', 'Advanced Topics in Security', 'ACTIVE', 100);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('SUBJECT', 'COSC422', 'ROOT', 'Advanced Computer Graphics', 'ACTIVE', 101);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('SUBJECT', 'COSC424', 'ROOT', 'Augmented Reality', 'ACTIVE', 102);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('SUBJECT', 'COSC428', 'ROOT', 'Computer Vision', 'ACTIVE', 103);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('SUBJECT', 'COSC460', 'ROOT', 'Special Topic', 'ACTIVE', 104);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('EVENT', 'DINNER', 'ROOT', 'Dinner', 'ACTIVE', 105);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('EVENT', 'BOWLING', 'ROOT', 'Bowling', 'ACTIVE', 106);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('EVENT', 'GOLF', 'ROOT', 'Golf', 'ACTIVE', 107);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('MEMBER', 'MEMBERSHIP', 'ROOT', 'Membership', 'ACTIVE', 108);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('EVENT', 'SEMINAR', 'ROOT', 'Seminar', 'ACTIVE', 110);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('EXAM', 'EXAM', 'ROOT', 'Exam', 'ACTIVE', 109);


--
-- TOC entry 2488 (class 0 OID 0)
-- Dependencies: 178
-- Name: fclookup_lu_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fclookup_lu_id_seq', 110, true);


--
-- TOC entry 2364 (class 0 OID 24618)
-- Dependencies: 179
-- Data for Name: fcmenu; Type: TABLE DATA; Schema: pnd; Owner: shine
--

INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode) VALUES (1, 'HEADERMENU', 0, 'Top Menu', 'ACTIVE', 0, '', 'Y', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode) VALUES (69, 'MENU', 6, 'Menu Setup', 'ACTIVE', 4400, NULL, 'Y', 'Setting', NULL, 'menusetup', NULL, NULL, NULL);
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode) VALUES (82, 'USERSETTING', 6, 'User Setting', 'ACTIVE', 2000, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode) VALUES (49, 'USERSETUP', 82, 'User Setup', 'ACTIVE', 4210, NULL, 'Y', 'Setting', '', 'usersetting', '', '', NULL);
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode) VALUES (50, 'PERMSETUP', 82, 'Permission Setup', 'ACTIVE', 4230, NULL, 'Y', 'Setting', '', 'permsetting', '', '', NULL);
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode) VALUES (51, 'ROLESETUP', 82, 'Role Setup', 'ACTIVE', 4220, NULL, 'Y', 'Setting', '', 'rolesetting', '', '', NULL);
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode) VALUES (83, 'LOOKUPSETUP', 6, 'Lookup Setup', 'ACTIVE', 2000, NULL, 'Y', 'Setting', NULL, 'lookupSetup', NULL, NULL, NULL);
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode) VALUES (84, 'JOBCATSETUP', 6, 'Job category setup', 'ACTIVE', 3000, NULL, 'Y', 'Setting', NULL, 'jobcatsetup', NULL, NULL, NULL);
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode) VALUES (85, 'CARTONSETUP', 6, 'Carton setup', 'ACTIVE', 3000, NULL, 'Y', 'Setting', NULL, 'cartonSetup', NULL, NULL, NULL);
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode) VALUES (86, 'QCHOME', 1, 'Home (QC)', 'ACTIVE', 1000, NULL, 'Y', 'Home', NULL, 'qchome', NULL, NULL, 'QCHOME');
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode) VALUES (6, 'SETTING', 1, 'Setting', 'ACTIVE', 9000, NULL, 'N', NULL, NULL, NULL, NULL, NULL, 'MENU_SETTING');
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode) VALUES (87, 'ARTHOME', 1, 'Home (Artist)', 'ACTIVE', 1000, NULL, 'Y', 'Home', NULL, 'artisthome', NULL, NULL, 'ARTHOME');
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode) VALUES (88, 'SVHOME', 1, 'Home (Supervisor)', 'ACTIVE', 1000, NULL, 'Y', 'Home', NULL, 'supervisorhome', NULL, NULL, 'SUPHOME');
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode) VALUES (89, 'TASK', 1, 'Task', 'ACTIVE', 1500, NULL, 'Y', 'PMTask', NULL, 'home', NULL, NULL, NULL);
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode) VALUES (90, 'CUSTHOME', 1, 'Home(Customer)', 'ACTIVE', 1000, NULL, 'Y', 'Home', NULL, 'customerhome', NULL, NULL, 'CUSTHOME');


--
-- TOC entry 2489 (class 0 OID 0)
-- Dependencies: 180
-- Name: fcmenu_mn_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: shine
--

SELECT pg_catalog.setval('fcmenu_mn_id_seq', 90, true);


--
-- TOC entry 2490 (class 0 OID 0)
-- Dependencies: 181
-- Name: fcmenu_mn_parentid_seq; Type: SEQUENCE SET; Schema: pnd; Owner: shine
--

SELECT pg_catalog.setval('fcmenu_mn_parentid_seq', 6, true);


--
-- TOC entry 2367 (class 0 OID 24629)
-- Dependencies: 182
-- Data for Name: fcorg; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fcorg (org_id, org_type, org_external, org_name, org_parentid, org_primaryid, org_address, org_contactno, org_status, org_lccode) VALUES (1, NULL, 'Y', 'PND', 0, NULL, NULL, NULL, 'ACTIVE', NULL);
INSERT INTO fcorg (org_id, org_type, org_external, org_name, org_parentid, org_primaryid, org_address, org_contactno, org_status, org_lccode) VALUES (2, NULL, 'Y', 'Carton box', 0, NULL, NULL, NULL, 'ACTIVE', NULL);
INSERT INTO fcorg (org_id, org_type, org_external, org_name, org_parentid, org_primaryid, org_address, org_contactno, org_status, org_lccode) VALUES (3, NULL, 'Y', 'Grand fortune', 0, NULL, NULL, NULL, 'ACTIVE', NULL);
INSERT INTO fcorg (org_id, org_type, org_external, org_name, org_parentid, org_primaryid, org_address, org_contactno, org_status, org_lccode) VALUES (4, NULL, 'Y', 'New box', 0, NULL, NULL, NULL, 'ACTIVE', NULL);
INSERT INTO fcorg (org_id, org_type, org_external, org_name, org_parentid, org_primaryid, org_address, org_contactno, org_status, org_lccode) VALUES (5, NULL, 'Y', 'Deswell', 0, NULL, NULL, NULL, 'ACTIVE', NULL);
INSERT INTO fcorg (org_id, org_type, org_external, org_name, org_parentid, org_primaryid, org_address, org_contactno, org_status, org_lccode) VALUES (6, NULL, 'Y', 'Darun', 0, NULL, NULL, NULL, 'ACTIVE', NULL);
INSERT INTO fcorg (org_id, org_type, org_external, org_name, org_parentid, org_primaryid, org_address, org_contactno, org_status, org_lccode) VALUES (7, NULL, 'Y', 'Harta', 0, NULL, NULL, NULL, 'ACTIVE', NULL);
INSERT INTO fcorg (org_id, org_type, org_external, org_name, org_parentid, org_primaryid, org_address, org_contactno, org_status, org_lccode) VALUES (8, NULL, 'Y', 'Genting ', 0, NULL, NULL, NULL, 'ACTIVE', NULL);


--
-- TOC entry 2491 (class 0 OID 0)
-- Dependencies: 183
-- Name: fcorg_org_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcorg_org_id_seq', 8, true);


--
-- TOC entry 2369 (class 0 OID 24640)
-- Dependencies: 184
-- Data for Name: fcpermission; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fcpermission (pms_code, pms_desc) VALUES ('MENU_REPORT', 'VIEW REPORT');
INSERT INTO fcpermission (pms_code, pms_desc) VALUES ('MENU_SETTING', 'VIEW SETTINGS');
INSERT INTO fcpermission (pms_code, pms_desc) VALUES ('REQUEST_NEWJOB', 'Request new job');
INSERT INTO fcpermission (pms_code, pms_desc) VALUES ('QCHOME', 'View QC home');
INSERT INTO fcpermission (pms_code, pms_desc) VALUES ('ARTHOME', 'View artist home');
INSERT INTO fcpermission (pms_code, pms_desc) VALUES ('SUPHOME', 'View supervisor home');
INSERT INTO fcpermission (pms_code, pms_desc) VALUES ('CUSTHOME', 'View customer home');


--
-- TOC entry 2371 (class 0 OID 24648)
-- Dependencies: 186
-- Data for Name: fcpmactivity; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fcpmactivity (pmat_id, pmat_pmwfid, pmat_pmslid, pmat_name, pmat_type, pmat_function, pmat_sla_interval, pmat_sla_workinghours_only, pmat_show_caseinfo) VALUES (2, 1, NULL, 'Pending customer resolution ', 'USER', 'pendingRevert', NULL, 'N', 'N');
INSERT INTO fcpmactivity (pmat_id, pmat_pmwfid, pmat_pmslid, pmat_name, pmat_type, pmat_function, pmat_sla_interval, pmat_sla_workinghours_only, pmat_show_caseinfo) VALUES (3, 1, NULL, 'Pending acknowledgement ', 'USER', 'pendingAcknowledge', NULL, 'N', 'N');
INSERT INTO fcpmactivity (pmat_id, pmat_pmwfid, pmat_pmslid, pmat_name, pmat_type, pmat_function, pmat_sla_interval, pmat_sla_workinghours_only, pmat_show_caseinfo) VALUES (1, 1, NULL, 'Requirement verification', 'USER', 'reqVerification', NULL, 'N', 'Y');
INSERT INTO fcpmactivity (pmat_id, pmat_pmwfid, pmat_pmslid, pmat_name, pmat_type, pmat_function, pmat_sla_interval, pmat_sla_workinghours_only, pmat_show_caseinfo) VALUES (4, 1, NULL, 'Work in progress ', 'USER', 'wip', NULL, 'N', 'Y');
INSERT INTO fcpmactivity (pmat_id, pmat_pmwfid, pmat_pmslid, pmat_name, pmat_type, pmat_function, pmat_sla_interval, pmat_sla_workinghours_only, pmat_show_caseinfo) VALUES (5, 1, NULL, 'Pending QC check', 'USER', 'pendingQC', NULL, 'N', 'Y');
INSERT INTO fcpmactivity (pmat_id, pmat_pmwfid, pmat_pmslid, pmat_name, pmat_type, pmat_function, pmat_sla_interval, pmat_sla_workinghours_only, pmat_show_caseinfo) VALUES (6, 1, NULL, 'Pending customer acceptance', 'USER', 'pendingCust', NULL, 'N', 'Y');


--
-- TOC entry 2492 (class 0 OID 0)
-- Dependencies: 185
-- Name: fcpmactivity_pmat_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcpmactivity_pmat_id_seq', 6, true);


--
-- TOC entry 2372 (class 0 OID 24652)
-- Dependencies: 187
-- Data for Name: fcpmcase; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fcpmcase (pmc_id, pmc_created_date, pmc_created_by, pmc_casekey, pmc_casetype, pmc_parentid, pmc_pmwfid, pmc_start_pmevid, pmc_start_date, pmc_end_pmevid, pmc_end_date, pmc_closed) VALUES (37, '2014-05-08 18:11:02.524+08', 'Customer', 144, 'jobsheet', NULL, NULL, NULL, NULL, NULL, NULL, 'N');
INSERT INTO fcpmcase (pmc_id, pmc_created_date, pmc_created_by, pmc_casekey, pmc_casetype, pmc_parentid, pmc_pmwfid, pmc_start_pmevid, pmc_start_date, pmc_end_pmevid, pmc_end_date, pmc_closed) VALUES (38, '2014-05-08 18:11:02.524+08', 'Customer', 145, 'jobsheet', NULL, NULL, NULL, NULL, NULL, NULL, 'N');
INSERT INTO fcpmcase (pmc_id, pmc_created_date, pmc_created_by, pmc_casekey, pmc_casetype, pmc_parentid, pmc_pmwfid, pmc_start_pmevid, pmc_start_date, pmc_end_pmevid, pmc_end_date, pmc_closed) VALUES (39, '2014-05-08 18:11:02.524+08', 'Customer', 146, 'jobsheet', NULL, NULL, NULL, NULL, NULL, NULL, 'N');
INSERT INTO fcpmcase (pmc_id, pmc_created_date, pmc_created_by, pmc_casekey, pmc_casetype, pmc_parentid, pmc_pmwfid, pmc_start_pmevid, pmc_start_date, pmc_end_pmevid, pmc_end_date, pmc_closed) VALUES (40, '2014-05-08 18:11:02.524+08', 'Customer', 147, 'jobsheet', NULL, NULL, NULL, NULL, NULL, NULL, 'N');
INSERT INTO fcpmcase (pmc_id, pmc_created_date, pmc_created_by, pmc_casekey, pmc_casetype, pmc_parentid, pmc_pmwfid, pmc_start_pmevid, pmc_start_date, pmc_end_pmevid, pmc_end_date, pmc_closed) VALUES (41, '2014-05-08 18:11:02.524+08', 'Customer', 148, 'jobsheet', NULL, NULL, NULL, NULL, NULL, NULL, 'N');
INSERT INTO fcpmcase (pmc_id, pmc_created_date, pmc_created_by, pmc_casekey, pmc_casetype, pmc_parentid, pmc_pmwfid, pmc_start_pmevid, pmc_start_date, pmc_end_pmevid, pmc_end_date, pmc_closed) VALUES (42, '2014-05-08 18:11:02.524+08', 'Customer', 149, 'jobsheet', NULL, NULL, NULL, NULL, NULL, NULL, 'N');
INSERT INTO fcpmcase (pmc_id, pmc_created_date, pmc_created_by, pmc_casekey, pmc_casetype, pmc_parentid, pmc_pmwfid, pmc_start_pmevid, pmc_start_date, pmc_end_pmevid, pmc_end_date, pmc_closed) VALUES (43, '2014-05-08 18:11:02.524+08', 'Customer', 150, 'jobsheet', NULL, NULL, NULL, NULL, NULL, NULL, 'N');
INSERT INTO fcpmcase (pmc_id, pmc_created_date, pmc_created_by, pmc_casekey, pmc_casetype, pmc_parentid, pmc_pmwfid, pmc_start_pmevid, pmc_start_date, pmc_end_pmevid, pmc_end_date, pmc_closed) VALUES (44, '2014-05-08 18:11:02.524+08', 'Customer', 151, 'jobsheet', NULL, NULL, NULL, NULL, NULL, NULL, 'N');
INSERT INTO fcpmcase (pmc_id, pmc_created_date, pmc_created_by, pmc_casekey, pmc_casetype, pmc_parentid, pmc_pmwfid, pmc_start_pmevid, pmc_start_date, pmc_end_pmevid, pmc_end_date, pmc_closed) VALUES (45, '2014-05-08 18:11:02.524+08', 'Customer 9', 152, 'jobsheet', NULL, NULL, NULL, NULL, NULL, NULL, 'N');
INSERT INTO fcpmcase (pmc_id, pmc_created_date, pmc_created_by, pmc_casekey, pmc_casetype, pmc_parentid, pmc_pmwfid, pmc_start_pmevid, pmc_start_date, pmc_end_pmevid, pmc_end_date, pmc_closed) VALUES (46, '2014-05-08 18:11:02.524+08', 'Customer 10', 153, 'jobsheet', NULL, NULL, NULL, NULL, NULL, NULL, 'N');


--
-- TOC entry 2493 (class 0 OID 0)
-- Dependencies: 188
-- Name: fcpmcase_pmc_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcpmcase_pmc_id_seq', 46, true);


--
-- TOC entry 2374 (class 0 OID 24658)
-- Dependencies: 189
-- Data for Name: fcpmcasecomment; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (67, 42, 66, '2014-05-11 20:52:42+08', 'admin', 'halo reply 1', NULL, NULL, NULL, 'N', 91);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (68, 42, 67, '2014-05-11 20:53:57+08', 'admin', 'my reply 1 reply 1', NULL, NULL, NULL, 'N', 91);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (69, 42, 66, '2014-05-11 20:54:13+08', 'admin', 'halo reply 2', NULL, NULL, NULL, 'N', 91);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (70, 42, NULL, '2014-05-11 20:54:26+08', 'admin', 'halo 2', NULL, NULL, NULL, 'N', 91);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (71, 42, 68, '2014-05-11 20:54:40+08', 'admin', 'my reply 1 reply 1 reply 1', NULL, NULL, NULL, 'N', 91);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (72, 42, NULL, '2014-05-11 20:56:07+08', 'admin', 'woohoo', NULL, NULL, NULL, 'N', 91);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (73, 42, 70, '2014-05-11 20:57:31+08', 'admin', 'halo 2 reply', NULL, NULL, NULL, 'N', 91);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (74, 42, 70, '2014-05-11 20:57:40+08', 'admin', 'halo 2  reply 2', NULL, NULL, NULL, 'N', 91);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (75, 42, 74, '2014-05-11 20:57:50+08', 'admin', 'halo 2 reply 2 reply 1', NULL, NULL, NULL, 'N', 91);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (76, 42, NULL, '2014-05-11 22:55:22+08', 'admin', 'cool man very cool', NULL, NULL, NULL, 'N', 91);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (77, 42, NULL, '2014-05-11 23:03:57+08', 'admin', 'i am writing a comment', NULL, NULL, NULL, 'N', 91);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (78, 42, 66, '2014-05-11 23:04:22+08', 'admin', 'asd', NULL, NULL, NULL, 'N', 91);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (79, 42, 78, '2014-05-11 23:04:26+08', 'admin', ' ', NULL, NULL, NULL, 'N', 91);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (80, 42, NULL, '2014-05-12 01:01:31+08', 'admin', 'sdffds', NULL, NULL, NULL, 'N', 91);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (81, 42, 77, '2014-05-12 01:01:48+08', 'admin', 'wawawa', NULL, NULL, NULL, 'N', 91);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (82, 42, NULL, '2014-05-12 01:03:50+08', 'admin', 'asdsad', NULL, NULL, NULL, 'N', 91);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (83, 42, NULL, '2014-05-12 01:52:43+08', 'admin', 'halo', NULL, NULL, NULL, 'N', 91);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (84, 43, NULL, '2014-05-12 01:53:55+08', 'admin', 'asd', NULL, NULL, NULL, 'N', 92);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (66, 42, NULL, '2014-05-11 20:52:32+08', 'admin', 'halo', NULL, NULL, NULL, 'N', 91);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (85, 42, NULL, '2014-05-13 06:18:08+08', 'admin', 'cool dude', NULL, NULL, NULL, 'N', 91);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (86, 42, 79, '2014-05-13 06:18:15+08', 'admin', 'halo', NULL, NULL, NULL, 'N', 91);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (87, 43, NULL, '2014-05-13 09:15:40+08', 'admin', 'cool bro
', NULL, NULL, NULL, 'N', 92);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (88, 39, NULL, '2014-05-13 09:54:46+08', 'admin', 'asdasdasd', NULL, NULL, NULL, 'N', 88);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (89, 42, NULL, '2014-05-16 04:40:33+08', 'admin', 'hasadadsasd', NULL, NULL, NULL, 'N', 91);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (90, 38, NULL, '2014-05-17 11:08:59+08', 'admin', 'hallo', NULL, NULL, NULL, 'N', 87);


--
-- TOC entry 2494 (class 0 OID 0)
-- Dependencies: 190
-- Name: fcpmcasecomment_pmcc_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcpmcasecomment_pmcc_id_seq', 90, true);


--
-- TOC entry 2376 (class 0 OID 24668)
-- Dependencies: 191
-- Data for Name: fcpmcasecommentread; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (67, 84, 'admin', '2014-05-12 02:07:22+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (68, 66, 'admin', '2014-05-12 02:07:36+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (69, 67, 'admin', '2014-05-12 02:07:36+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (70, 68, 'admin', '2014-05-12 02:07:36+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (71, 69, 'admin', '2014-05-12 02:07:36+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (72, 70, 'admin', '2014-05-12 02:07:36+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (73, 71, 'admin', '2014-05-12 02:07:36+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (74, 72, 'admin', '2014-05-12 02:07:36+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (75, 73, 'admin', '2014-05-12 02:07:36+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (76, 74, 'admin', '2014-05-12 02:07:36+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (77, 75, 'admin', '2014-05-12 02:07:36+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (78, 76, 'admin', '2014-05-12 02:07:36+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (79, 77, 'admin', '2014-05-12 02:07:36+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (80, 78, 'admin', '2014-05-12 02:07:36+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (81, 79, 'admin', '2014-05-12 02:07:36+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (82, 80, 'admin', '2014-05-12 02:07:36+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (83, 81, 'admin', '2014-05-12 02:07:36+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (84, 82, 'admin', '2014-05-12 02:07:36+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (85, 83, 'admin', '2014-05-12 02:07:36+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (86, 85, 'admin', '2014-05-13 06:18:08+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (87, 86, 'admin', '2014-05-13 06:18:15+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (88, 87, 'admin', '2014-05-13 09:15:40+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (89, 88, 'admin', '2014-05-13 09:54:46+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (90, 89, 'admin', '2014-05-16 04:40:33+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (91, 90, 'admin', '2014-05-17 11:08:59+08');


--
-- TOC entry 2495 (class 0 OID 0)
-- Dependencies: 192
-- Name: fcpmcasecommentread_pmcr_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcpmcasecommentread_pmcr_id_seq', 91, true);


--
-- TOC entry 2428 (class 0 OID 25490)
-- Dependencies: 243
-- Data for Name: fcpmcaseflag; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fcpmcaseflag (pmcf_id, pmcf_pmcid, pmcf_flag_by, pmcf_flag_date, pmcf_flag_type) VALUES (12, 39, 'admin', '2014-05-15 18:41:27+08', 'green');
INSERT INTO fcpmcaseflag (pmcf_id, pmcf_pmcid, pmcf_flag_by, pmcf_flag_date, pmcf_flag_type) VALUES (13, 42, 'admin', '2014-05-16 04:41:33+08', 'yellow');
INSERT INTO fcpmcaseflag (pmcf_id, pmcf_pmcid, pmcf_flag_by, pmcf_flag_date, pmcf_flag_type) VALUES (14, 37, 'admin', '2014-05-17 11:08:45+08', 'red');
INSERT INTO fcpmcaseflag (pmcf_id, pmcf_pmcid, pmcf_flag_by, pmcf_flag_date, pmcf_flag_type) VALUES (2, 43, 'admin', '2014-05-13 16:33:00+08', 'red');


--
-- TOC entry 2496 (class 0 OID 0)
-- Dependencies: 242
-- Name: fcpmcaseflag_pmcf_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcpmcaseflag_pmcf_id_seq', 16, true);


--
-- TOC entry 2378 (class 0 OID 24674)
-- Dependencies: 193
-- Data for Name: fcpmcaseflow; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_specific_userid, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway) VALUES (90, 41, 4, 'PM_Activity', NULL, NULL, NULL, NULL, NULL, NULL, '2014-05-10 17:36:38+08', NULL, NULL, NULL, 'N');
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_specific_userid, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway) VALUES (95, 46, 2, 'PM_Activity', NULL, NULL, NULL, NULL, NULL, NULL, '2014-05-14 18:35:46+08', NULL, NULL, NULL, 'N');
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_specific_userid, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway) VALUES (94, 45, 1, 'PM_Activity', NULL, NULL, NULL, NULL, NULL, NULL, '2014-05-14 18:35:59+08', NULL, NULL, NULL, 'N');
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_specific_userid, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway) VALUES (87, 38, 5, 'PM_Activity', NULL, NULL, NULL, NULL, NULL, NULL, '2014-05-15 17:58:16+08', NULL, NULL, NULL, 'N');
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_specific_userid, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway) VALUES (88, 39, 6, 'PM_Activity', NULL, NULL, NULL, NULL, NULL, NULL, '2014-05-15 18:41:06+08', NULL, NULL, NULL, 'N');
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_specific_userid, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway) VALUES (86, 37, 5, 'PM_Activity', NULL, NULL, NULL, NULL, NULL, NULL, '2014-05-15 19:15:27+08', NULL, NULL, NULL, 'N');
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_specific_userid, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway) VALUES (89, 40, 4, 'PM_Activity', NULL, NULL, NULL, NULL, NULL, NULL, '2014-05-16 04:42:48+08', NULL, NULL, NULL, 'N');
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_specific_userid, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway) VALUES (93, 44, 1, 'PM_Activity', NULL, NULL, NULL, NULL, NULL, NULL, '2014-05-16 05:13:31+08', NULL, NULL, NULL, 'N');
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_specific_userid, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway) VALUES (92, 43, 3, 'PM_Activity', NULL, NULL, NULL, NULL, NULL, NULL, '2014-05-13 16:42:29+08', NULL, NULL, NULL, 'N');
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_specific_userid, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway) VALUES (91, 42, 3, 'PM_Activity', NULL, NULL, NULL, NULL, NULL, NULL, '2014-05-17 15:48:50+08', NULL, NULL, NULL, 'N');


--
-- TOC entry 2497 (class 0 OID 0)
-- Dependencies: 194
-- Name: fcpmcaseflow_pmf_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcpmcaseflow_pmf_id_seq', 95, true);


--
-- TOC entry 2380 (class 0 OID 24679)
-- Dependencies: 195
-- Data for Name: fcpmcasetype; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fcpmcasetype (pmct_code, pmct_desc, pmct_table, pmct_key_col, pmct_desc_col, pmct_caseinfo_function) VALUES ('jobsheet', 'jobsheet', 'mjobsheet', 'js_id', 'js_title', 'viewJobInfo');


--
-- TOC entry 2381 (class 0 OID 24682)
-- Dependencies: 196
-- Data for Name: fcpmconnector; Type: TABLE DATA; Schema: pnd; Owner: pnd
--



--
-- TOC entry 2498 (class 0 OID 0)
-- Dependencies: 197
-- Name: fcpmconnector_pmcn_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcpmconnector_pmcn_id_seq', 1, false);


--
-- TOC entry 2383 (class 0 OID 24687)
-- Dependencies: 198
-- Data for Name: fcpmevent; Type: TABLE DATA; Schema: pnd; Owner: pnd
--



--
-- TOC entry 2499 (class 0 OID 0)
-- Dependencies: 199
-- Name: fcpmevent_pmev_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcpmevent_pmev_id_seq', 1, false);


--
-- TOC entry 2385 (class 0 OID 24692)
-- Dependencies: 200
-- Data for Name: fcpmgateway; Type: TABLE DATA; Schema: pnd; Owner: pnd
--



--
-- TOC entry 2500 (class 0 OID 0)
-- Dependencies: 201
-- Name: fcpmgateway_pmgw_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcpmgateway_pmgw_id_seq', 1, false);


--
-- TOC entry 2387 (class 0 OID 24697)
-- Dependencies: 202
-- Data for Name: fcpmswimlane; Type: TABLE DATA; Schema: pnd; Owner: pnd
--



--
-- TOC entry 2501 (class 0 OID 0)
-- Dependencies: 203
-- Name: fcpmswimlane_pmsl_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcpmswimlane_pmsl_id_seq', 1, false);


--
-- TOC entry 2389 (class 0 OID 24702)
-- Dependencies: 204
-- Data for Name: fcpmworkflow; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fcpmworkflow (pmwf_id, pmwf_name) VALUES (1, 'Artwork job');


--
-- TOC entry 2502 (class 0 OID 0)
-- Dependencies: 205
-- Name: fcpmworkflow_pmwf_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcpmworkflow_pmwf_id_seq', 1, true);


--
-- TOC entry 2391 (class 0 OID 24707)
-- Dependencies: 206
-- Data for Name: fcrole; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fcrole (rol_id, rol_name) VALUES (18, 'QC');
INSERT INTO fcrole (rol_id, rol_name) VALUES (19, 'Supervisor');
INSERT INTO fcrole (rol_id, rol_name) VALUES (20, 'artist');
INSERT INTO fcrole (rol_id, rol_name) VALUES (14, 'Customer');
INSERT INTO fcrole (rol_id, rol_name) VALUES (10, 'admin');


--
-- TOC entry 2503 (class 0 OID 0)
-- Dependencies: 207
-- Name: fcrole_rol_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcrole_rol_id_seq', 20, true);


--
-- TOC entry 2393 (class 0 OID 24715)
-- Dependencies: 208
-- Data for Name: fcroleperm; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (31, 4, NULL);
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (32, 4, NULL);
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (33, 4, NULL);
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (34, 4, NULL);
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (42, 3, NULL);
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (43, 3, NULL);
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (44, 3, NULL);
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (45, 3, NULL);
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (46, 3, NULL);
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (47, 3, NULL);
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (48, 3, NULL);
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (49, 3, NULL);
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (50, 3, NULL);
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (62, 1, NULL);
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (63, 1, NULL);
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (64, 1, NULL);
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (65, 1, NULL);
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (66, 1, NULL);
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (67, 1, NULL);
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (68, 1, NULL);
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (69, 1, NULL);
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (70, 1, NULL);
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (71, 1, NULL);
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (72, 1, NULL);
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (73, 1, NULL);
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (116, 12, NULL);
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (117, 12, NULL);
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (118, 13, NULL);
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (119, 13, NULL);
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (120, 13, NULL);
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (121, 11, NULL);
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (122, 11, NULL);
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (123, 11, NULL);
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (124, 11, NULL);
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (126, NULL, 'MENU_HOME');
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (127, NULL, 'REQUEST_NEWJOB');
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (137, 15, 'MENU_HOME');
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (145, 17, 'ARTHOME');
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (146, 18, 'QCHOME');
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (147, 19, 'SUPHOME');
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (148, 16, 'ARTHOME');
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (149, 20, 'ARTHOME');
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (150, 14, 'REQUEST_NEWJOB');
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (151, 14, 'CUSTHOME');
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (152, 10, 'MENU_REPORT');
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (153, 10, 'MENU_SETTING');
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (154, 10, 'REQUEST_NEWJOB');
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (155, 10, 'QCHOME');
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (156, 10, 'ARTHOME');
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (157, 10, 'SUPHOME');
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (158, 10, 'CUSTHOME');


--
-- TOC entry 2504 (class 0 OID 0)
-- Dependencies: 209
-- Name: fcroleperm_rp_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcroleperm_rp_id_seq', 158, true);


--
-- TOC entry 2395 (class 0 OID 24720)
-- Dependencies: 210
-- Data for Name: fcrule; Type: TABLE DATA; Schema: pnd; Owner: pnd
--



--
-- TOC entry 2505 (class 0 OID 0)
-- Dependencies: 211
-- Name: fcrule_ru_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcrule_ru_id_seq', 1, false);


--
-- TOC entry 2397 (class 0 OID 24728)
-- Dependencies: 212
-- Data for Name: fcsetting; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fcsetting (set_id, set_user, set_code, set_description, set_val) VALUES (3, 'shine', 'DEFCHECKIN', 'Default Check In Time', NULL);
INSERT INTO fcsetting (set_id, set_user, set_code, set_description, set_val) VALUES (4, 'shine', 'DEFCHECKOUT', 'Default Check Out Time', NULL);
INSERT INTO fcsetting (set_id, set_user, set_code, set_description, set_val) VALUES (6, 'shine', 'EICHARGE', 'Early Check In Charges', NULL);
INSERT INTO fcsetting (set_id, set_user, set_code, set_description, set_val) VALUES (7, 'shine', 'LOCHARGE', 'Late Check Out Charges', NULL);
INSERT INTO fcsetting (set_id, set_user, set_code, set_description, set_val) VALUES (2, '*', 'MAXLIFETIME', 'Maximum Idle Time (in second)', '15');
INSERT INTO fcsetting (set_id, set_user, set_code, set_description, set_val) VALUES (1, 'shine', 'LANG', 'English - United States', 'EN-US');
INSERT INTO fcsetting (set_id, set_user, set_code, set_description, set_val) VALUES (5, 'shine', 'THEME', 'Bootstrap Metro', 'bootstrap_metro');
INSERT INTO fcsetting (set_id, set_user, set_code, set_description, set_val) VALUES (8, 'shine', 'LIFETIME_MEMBER_FEE', 'Lifetime Member Fee', '15000');
INSERT INTO fcsetting (set_id, set_user, set_code, set_description, set_val) VALUES (9, 'shine', 'MONTHLY_MEMBER_FEE', 'Monthly Member Fee', '1000');


--
-- TOC entry 2506 (class 0 OID 0)
-- Dependencies: 213
-- Name: fcsetting_set_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcsetting_set_id_seq', 7, true);


--
-- TOC entry 2399 (class 0 OID 24737)
-- Dependencies: 214
-- Data for Name: fcudv; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fcudv (udv_code, udv_name, udv_query_type, udv_query, udv_return_type, udv_result_type, udv_result_lookup_type, udv_result_lookup) VALUES ('application_no', 'Application Number', 'php', '''{$APPNO}''', 'CELL', NULL, NULL, NULL);
INSERT INTO fcudv (udv_code, udv_name, udv_query_type, udv_query, udv_return_type, udv_result_type, udv_result_lookup_type, udv_result_lookup) VALUES ('applicant_name', 'Applicant Name', 'sql', 'select sc_applicantname from spcase where sc_applicationno=''[[application_no]]''', 'CELL', NULL, NULL, NULL);
INSERT INTO fcudv (udv_code, udv_name, udv_query_type, udv_query, udv_return_type, udv_result_type, udv_result_lookup_type, udv_result_lookup) VALUES ('lo_print_date', 'Print Sysdate', 'sql', 'select to_char(now(),''DD-MON-YYYY'')', 'CELL', NULL, NULL, NULL);
INSERT INTO fcudv (udv_code, udv_name, udv_query_type, udv_query, udv_return_type, udv_result_type, udv_result_lookup_type, udv_result_lookup) VALUES ('STAFF_DEPARTMENT', 'User Org Name', 'sql', 'select org_name from fcorg where org_id=''{$USER->orgid}''', 'CELL', NULL, NULL, NULL);
INSERT INTO fcudv (udv_code, udv_name, udv_query_type, udv_query, udv_return_type, udv_result_type, udv_result_lookup_type, udv_result_lookup) VALUES ('AMT_APPROVED', 'Amount Approved', 'sql', 'select trim(to_char(sc_amtapproved,''999,999,999,999,999,990.00'')) from spcase where sc_applicationno=''[[application_no]]''', 'CELL', NULL, NULL, NULL);
INSERT INTO fcudv (udv_code, udv_name, udv_query_type, udv_query, udv_return_type, udv_result_type, udv_result_lookup_type, udv_result_lookup) VALUES ('INTEREST_RATE', 'Interest Rate', 'sql', 'select trim(to_char(sc_rate,''999,999,999,999,999,990.00'')) from spcase where sc_applicationno=''[[application_no]]''', 'CELL', NULL, NULL, NULL);
INSERT INTO fcudv (udv_code, udv_name, udv_query_type, udv_query, udv_return_type, udv_result_type, udv_result_lookup_type, udv_result_lookup) VALUES ('LOAN_TENURE_MTH', 'Loan Tenure Month', 'sql', 'select sc_tenure from spcase where sc_applicationno=''[[application_no]]''', 'CELL', NULL, NULL, NULL);
INSERT INTO fcudv (udv_code, udv_name, udv_query_type, udv_query, udv_return_type, udv_result_type, udv_result_lookup_type, udv_result_lookup) VALUES ('INSTALMENT_AMT', 'Instalment Amount', 'sql', 'select  trim(to_char(sc_regularinst,''999,999,999,999,999,990.00'')) from spcase where sc_applicationno=''[[application_no]]''', 'CELL', NULL, NULL, NULL);
INSERT INTO fcudv (udv_code, udv_name, udv_query_type, udv_query, udv_return_type, udv_result_type, udv_result_lookup_type, udv_result_lookup) VALUES ('TOTAL_PAYABLE', 'Total Payable', 'sql', 'select  trim(to_char(sc_totalpayable,''999,999,999,999,999,990.00'')) from spcase where sc_applicationno=''[[application_no]]''', 'CELL', NULL, NULL, NULL);
INSERT INTO fcudv (udv_code, udv_name, udv_query_type, udv_query, udv_return_type, udv_result_type, udv_result_lookup_type, udv_result_lookup) VALUES ('APPROVED_BY', 'Approved By', 'sql', 'select usr_name from fcuser join spcase on usr_userid = sc_approvedby where sc_applicationno=''[[application_no]]''', 'CELL', NULL, NULL, NULL);


--
-- TOC entry 2400 (class 0 OID 24744)
-- Dependencies: 215
-- Data for Name: fcuser; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('admin2', 'd033e22ae348aeb5660fc2140aec35850c4da997', '2014-01-26 15:39:57.04+08', 'Administrator 2', NULL, '2014-05-01 18:22:23+08', '2014-05-01 17:54:44+08', '2014-02-05 15:30:53+08', 'ADMIN', 'a:2:{s:7:"dbosess";a:4:{s:6:"ackjob";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"list";}s:7:"jobinfo";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:3:"new";}s:4:"user";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"list";}s:0:"";a:3:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}}}s:9:"dboconfig";a:1:{s:6:"ackjob";i:1;}}', 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('customer', 'b39f008e318efd2bb988d724a161b61c6909677f', '2014-04-24 15:46:41.898+08', 'Customer', 'customer@gmail.com', '2014-05-10 10:06:53+08', '2014-05-09 09:56:20+08', NULL, NULL, 'a:4:{s:7:"dbosess";a:8:{s:7:"jobinfo";a:4:{s:6:"lastid";a:1:{s:5:"js_id";s:3:"144";}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:6:"detail";}s:8:"jobcolor";a:4:{s:6:"lastid";a:1:{s:5:"js_id";s:3:"153";}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"edit";}s:8:"jobother";a:4:{s:6:"lastid";a:1:{s:5:"js_id";s:3:"144";}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:6:"detail";}s:20:"pmtask_caseflow_list";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"list";}s:18:"customeracceptance";a:4:{s:6:"lastid";a:1:{s:5:"js_id";s:2:"88";}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"edit";}s:9:"pendingQC";a:4:{s:6:"lastid";a:1:{s:5:"js_id";s:2:"86";}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"edit";}s:15:"reqverification";a:4:{s:6:"lastid";a:1:{s:5:"js_id";s:2:"93";}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"edit";}s:3:"wip";a:4:{s:6:"lastid";a:1:{s:5:"js_id";s:2:"89";}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"edit";}}s:9:"dboconfig";a:0:{}s:11:"PMTask_atid";s:1:"5";s:13:"PMTask_flowid";s:2:"86";}', 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('artist1', '2cabffd3c7cb40ae6541b7f10a640b41190ccb27', '2014-04-30 13:05:53.973+08', 'Artist 1', 'artist1@gmail.com', '2014-05-01 16:28:37+08', '2014-05-01 14:26:26+08', NULL, NULL, 'a:0:{}', 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('artist2', '09c04a14fff8cbd7d0235da2c01bfd31d7826824', '2014-04-30 13:06:14.614+08', 'Artist 2', 'artist2@gmail.com', NULL, NULL, NULL, NULL, NULL, 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('supervisor', '0f4d09e43d208d5e9222322fbc7091ceea1a78c3', '2014-04-30 19:09:48.659+08', 'supervisor', 'supervisor@gmail.com', '2014-04-30 19:37:44+08', '2014-04-30 19:36:54+08', NULL, NULL, 'a:0:{}', 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('qc', 'd6426af04235d59336c5b6b08f61240cbb6b0f66', '2014-04-30 19:10:06.929+08', 'qc', 'qc@gmail.com', '2014-04-30 19:36:48+08', '2014-04-30 19:36:04+08', NULL, NULL, 'a:0:{}', 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', '2013-08-15 09:55:18.85+08', 'Administrator', NULL, '2014-05-17 15:48:51+08', '2014-05-17 10:05:16+08', '2014-05-13 06:00:56+08', 'ADMIN', 'a:6:{s:7:"dbosess";a:6:{s:20:"pmtask_caseflow_list";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"list";}s:7:"jobinfo";a:4:{s:6:"lastid";a:1:{s:5:"js_id";s:3:"149";}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:6:"detail";}s:8:"jobcolor";a:4:{s:6:"lastid";a:1:{s:5:"js_id";s:3:"151";}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:3:"new";}s:8:"jobother";a:4:{s:6:"lastid";a:1:{s:5:"js_id";s:3:"149";}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:3:"new";}s:3:"wip";a:4:{s:6:"lastid";a:1:{s:5:"js_id";s:2:"89";}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"edit";}s:15:"reqverification";a:4:{s:6:"lastid";a:1:{s:5:"js_id";s:2:"93";}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"edit";}}s:11:"PMTask_atid";s:1:"3";s:9:"dboconfig";a:0:{}s:13:"PMTask_flowid";s:2:"91";s:21:"PMTask_comment_caseid";s:2:"38";s:21:"PMTask_comment_flowid";s:2:"87";}', 'ACTIVE', NULL);


--
-- TOC entry 2401 (class 0 OID 24752)
-- Dependencies: 216
-- Data for Name: fcuserdiary; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status) VALUES (4, '2014-02-11 12:35:04.406+08', '*shine', 'esp@phiorion.com', '2014-06-27 00:00:00+08', 'Notice', 'Your registration on Planters dinner has been approved. Please make payment before event date.', NULL, 'ACTIVE');
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status) VALUES (5, '2014-02-11 12:35:08.767+08', '*shine', 'esp@phiorion.com', '2014-03-31 00:00:00+08', 'Notice', 'Your registration on March Examination! has been approved. Please make payment before event date.', NULL, 'ACTIVE');
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status) VALUES (3, '2014-02-11 12:34:23.307+08', '*shine', 'esp@phiorion.com', NULL, 'Notice', 'Your registration on March Examination! is now pending for approval.', NULL, 'DELETE');
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status) VALUES (2, '2014-02-11 12:34:10.986+08', '*shine', 'esp@phiorion.com', NULL, 'Notice', 'Your registration on Planters dinner is now pending for approval.', NULL, 'INACTIVE');
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status) VALUES (1, '2014-02-11 12:19:59.605+08', '*shine', 'esp@phiorion.com', NULL, 'Notice', 'Your membership registration is now pending for approval.', NULL, 'ACTIVE');
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status) VALUES (6, '2014-02-12 13:55:54.825+08', '*shine', 'esp@phiorion.com', NULL, 'Notice', 'Thanks for your payment of 1,000.00 for the invoice INV0000000002', NULL, 'ACTIVE');
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status) VALUES (7, '2014-02-12 13:55:54.828+08', '*shine', 'esp@phiorion.com', '2014-03-31 00:00:00+08', 'Notice', 'You can now attend March Examination!.', NULL, 'ACTIVE');
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status) VALUES (8, '2014-02-12 13:55:59.076+08', '*shine', 'esp@phiorion.com', NULL, 'Notice', 'Thanks for your payment of 500.00 for the invoice INV0000000001', NULL, 'ACTIVE');
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status) VALUES (9, '2014-02-12 13:55:59.12+08', '*shine', 'esp@phiorion.com', '2014-06-27 00:00:00+08', 'Notice', 'You can now attend Planters dinner.', NULL, 'ACTIVE');
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status) VALUES (10, '2014-02-12 13:56:20.641+08', '*shine', 'esp@phiorion.com', NULL, 'Notice', 'Your membership application is now approved. Please make payment.', NULL, 'ACTIVE');
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status) VALUES (11, '2014-02-12 14:35:17.033+08', '*shine', 'danny@phiorion.com', NULL, 'Notice', 'Your membership registration is now pending for approval.', NULL, 'ACTIVE');
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status) VALUES (12, '2014-02-12 14:36:19.974+08', '*shine', 'hongyee@phiorion.com', NULL, 'Notice', 'Your membership registration is now pending for approval.', NULL, 'ACTIVE');
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status) VALUES (13, '2014-02-12 14:37:38.239+08', '*shine', 'fong@phiorion.com', NULL, 'Notice', 'Your membership registration is now pending for approval.', NULL, 'ACTIVE');
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status) VALUES (14, '2014-02-12 14:38:47.589+08', '*shine', 'yow@phiorion.com', NULL, 'Notice', 'Your membership registration is now pending for approval.', NULL, 'ACTIVE');
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status) VALUES (15, '2014-02-12 14:40:20.074+08', '*shine', 'ironman@gmail.com', NULL, 'Notice', 'Your membership registration is now pending for approval.', NULL, 'ACTIVE');
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status) VALUES (16, '2014-02-12 14:41:05.04+08', '*shine', 'captainamerica@gmail.com', NULL, 'Notice', 'Your membership registration is now pending for approval.', NULL, 'ACTIVE');
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status) VALUES (17, '2014-02-12 14:42:15.179+08', '*shine', 'thor@gmail.com', NULL, 'Notice', 'Your membership registration is now pending for approval.', NULL, 'ACTIVE');
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status) VALUES (18, '2014-02-12 14:43:06.208+08', '*shine', 'superman@gmail.com', NULL, 'Notice', 'Your membership registration is now pending for approval.', NULL, 'ACTIVE');
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status) VALUES (19, '2014-02-13 15:42:46.15+08', 'ispadmin', 'ispadmin', '2014-02-28 00:00:00+08', 'Reminder', 'Meeting on 28-Feb-2014', '<p>Meeting on 28-Feb-2014</p>', 'ACTIVE');
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status) VALUES (20, '2014-02-13 15:43:04.156+08', 'ispadmin', 'ispadmin', '2014-02-20 00:00:00+08', 'Appointment', 'Meeting with Azlin for Lunch', '<p>Meeting with Azlin for Lunch</p>', 'ACTIVE');
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status) VALUES (21, '2014-02-16 14:54:09.35+08', '*shine', 'esp@phiorion.com', NULL, 'Notice', 'Your registration on Dinner is now pending for approval.', NULL, 'ACTIVE');
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status) VALUES (22, '2014-02-17 14:56:01.085+08', '*shine', 'ironman@gmail.com', NULL, 'Notice', 'Your membership application is now approved. Please make payment.', NULL, 'ACTIVE');
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status) VALUES (23, '2014-02-17 14:56:04.732+08', '*shine', 'ironman@gmail.com', NULL, 'Notice', 'Your membership application is now approved. Please make payment.', NULL, 'ACTIVE');
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status) VALUES (24, '2014-02-17 14:57:50.654+08', '*shine', 'ironman@gmail.com', NULL, 'Notice', 'Thanks for your payment of 1,000.00 for the invoice INV0000000004', NULL, 'ACTIVE');
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status) VALUES (25, '2014-02-17 14:57:50.669+08', '*shine', 'ironman@gmail.com', NULL, 'Notice', 'Your membership application is now approved and active.', NULL, 'ACTIVE');


--
-- TOC entry 2507 (class 0 OID 0)
-- Dependencies: 217
-- Name: fcuserdiary_di_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcuserdiary_di_id_seq', 25, true);


--
-- TOC entry 2403 (class 0 OID 24762)
-- Dependencies: 218
-- Data for Name: fcuserlogin; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (1, 'admin', '127.0.0.1', 'Y', '2013-08-15 09:55:42.735+08', '2013-08-15 09:55:42.735+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (2, 'admin', '127.0.0.1', 'Y', '2013-08-15 10:59:43.076+08', '2013-08-15 10:59:43.076+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (3, 'admin', '127.0.0.1', 'Y', '2013-08-15 10:59:45.466+08', '2013-08-15 10:59:45.466+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (4, 'admin', '127.0.0.1', 'Y', '2013-08-15 12:31:47.582+08', '2013-08-15 12:31:47.582+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (5, 'admin', '127.0.0.1', 'Y', '2013-08-15 12:31:50.866+08', '2013-08-15 12:31:50.866+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (6, 'admin', '127.0.0.1', 'Y', '2013-08-16 09:31:41.219+08', '2013-08-16 09:31:41.219+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (7, 'admin', '127.0.0.1', 'Y', '2013-08-16 09:31:45.152+08', '2013-08-16 09:31:45.152+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (8, 'admin', '127.0.0.1', 'Y', '2013-08-16 19:30:04.873+08', '2013-08-16 19:30:04.873+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (9, 'admin', '127.0.0.1', 'Y', '2013-08-16 19:30:06.887+08', '2013-08-16 19:30:06.887+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (10, 'admin', '127.0.0.1', 'Y', '2013-08-17 12:03:56.022+08', '2013-08-17 12:03:56.022+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (11, 'admin', '127.0.0.1', 'Y', '2013-08-17 12:03:58.864+08', '2013-08-17 12:03:58.864+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (12, 'admin', '127.0.0.1', 'Y', '2013-08-18 00:07:07.289+08', '2013-08-18 00:07:07.289+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (13, 'admin', '127.0.0.1', 'Y', '2013-08-18 00:07:09.755+08', '2013-08-18 00:07:09.755+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (14, 'admin', '127.0.0.1', 'Y', '2013-08-19 09:49:37.24+08', '2013-08-19 09:49:37.24+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (15, 'admin', '127.0.0.1', 'Y', '2013-08-19 09:49:40.679+08', '2013-08-19 09:49:40.679+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (16, 'admin', '127.0.0.1', 'Y', '2013-08-19 14:05:24.028+08', '2013-08-19 14:05:24.028+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (17, 'admin', '127.0.0.1', 'Y', '2013-08-19 14:05:27.188+08', '2013-08-19 14:05:27.188+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (18, 'admin', '127.0.0.1', 'N', '2013-08-20 08:55:06.083+08', '2013-08-20 08:55:06.083+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (19, 'admin', '127.0.0.1', 'Y', '2013-08-20 08:55:09.355+08', '2013-08-20 08:55:09.355+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (20, 'admin', '127.0.0.1', 'Y', '2013-08-20 08:55:13.336+08', '2013-08-20 08:55:13.336+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (21, 'admin', '127.0.0.1', 'Y', '2013-08-20 20:50:37.253+08', '2013-08-20 20:50:37.253+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (22, 'admin', '127.0.0.1', 'Y', '2013-08-20 20:50:40.93+08', '2013-08-20 20:50:40.93+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (23, 'admin', '127.0.0.1', 'Y', '2013-08-21 00:05:39.414+08', '2013-08-21 00:05:39.414+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (24, 'admin', '127.0.0.1', 'Y', '2013-08-21 00:05:42.393+08', '2013-08-21 00:05:42.393+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (25, 'admin', '127.0.0.1', 'Y', '2013-08-21 09:18:20.614+08', '2013-08-21 09:18:20.614+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (26, 'admin', '127.0.0.1', 'Y', '2013-08-21 09:18:23.152+08', '2013-08-21 09:18:23.152+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (27, 'admin', '127.0.0.1', 'Y', '2013-08-21 18:05:58.803+08', '2013-08-21 18:05:58.803+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (28, 'admin', '127.0.0.1', 'Y', '2013-08-21 18:06:02.117+08', '2013-08-21 18:06:02.117+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (29, 'admin', '127.0.0.1', 'Y', '2013-08-21 21:57:25.853+08', '2013-08-21 21:57:25.853+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (30, 'admin', '127.0.0.1', 'Y', '2013-08-21 21:57:28.086+08', '2013-08-21 21:57:28.086+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (31, 'admin', '127.0.0.1', 'Y', '2013-08-21 21:59:38.092+08', '2013-08-21 21:59:38.092+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (32, 'admin', '127.0.0.1', 'Y', '2013-08-22 09:15:22.625+08', '2013-08-22 09:15:22.625+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (33, 'admin', '127.0.0.1', 'Y', '2013-08-22 09:39:36.632+08', '2013-08-22 09:39:36.632+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (34, 'admin', '127.0.0.1', 'Y', '2013-08-22 17:58:43.615+08', '2013-08-22 17:58:43.615+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (35, 'admin', '127.0.0.1', 'Y', '2013-08-22 17:58:49.349+08', '2013-08-22 17:58:49.349+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (36, 'admin', '127.0.0.1', 'Y', '2013-08-22 17:58:52.295+08', '2013-08-22 17:58:52.295+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (37, 'admin', '127.0.0.1', 'Y', '2013-08-23 10:16:44.943+08', '2013-08-23 10:16:44.943+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (38, 'admin', '127.0.0.1', 'Y', '2013-08-23 10:17:09.147+08', '2013-08-23 10:17:09.147+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (39, 'admin', '127.0.0.1', 'Y', '2013-08-23 10:18:45.831+08', '2013-08-23 10:18:45.831+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (40, 'admin', '127.0.0.1', 'Y', '2013-08-24 09:28:55.443+08', '2013-08-24 09:28:55.443+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (41, 'admin', '127.0.0.1', 'Y', '2013-08-24 09:29:00.016+08', '2013-08-24 09:29:00.016+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (42, 'admin', '127.0.0.1', 'Y', '2013-08-24 09:29:05.438+08', '2013-08-24 09:29:05.438+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (43, 'admin', '127.0.0.1', 'Y', '2013-08-25 20:55:31.684+08', '2013-08-25 20:55:31.684+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (44, 'admin', '127.0.0.1', 'Y', '2013-08-25 20:55:33.356+08', '2013-08-25 20:55:33.356+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (45, 'admin', '127.0.0.1', 'Y', '2013-08-25 21:38:38.285+08', '2013-08-25 21:38:38.285+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (46, 'admin', '127.0.0.1', 'Y', '2013-08-25 21:38:40.849+08', '2013-08-25 21:38:40.849+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (47, 'admin', '127.0.0.1', 'Y', '2013-08-26 09:23:28.223+08', '2013-08-26 09:23:28.223+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (48, 'admin', '127.0.0.1', 'Y', '2013-08-26 09:23:33.083+08', '2013-08-26 09:23:33.083+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (49, 'admin', '127.0.0.1', 'Y', '2013-08-26 20:33:59.158+08', '2013-08-26 20:33:59.158+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (50, 'admin', '127.0.0.1', 'Y', '2013-08-26 20:34:02.152+08', '2013-08-26 20:34:02.152+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (51, 'admin', '127.0.0.1', 'Y', '2013-08-26 20:34:06.07+08', '2013-08-26 20:34:06.07+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (52, 'admin', '127.0.0.1', 'Y', '2013-08-26 22:39:10.781+08', '2013-08-26 22:39:10.781+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (53, 'admin', '127.0.0.1', 'Y', '2013-08-26 22:39:13.451+08', '2013-08-26 22:39:13.451+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (54, 'admin', '127.0.0.1', 'Y', '2013-08-27 00:08:21.181+08', '2013-08-27 00:08:21.181+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (55, 'admin', '127.0.0.1', 'Y', '2013-08-27 00:08:24.244+08', '2013-08-27 00:08:24.244+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (56, 'admin', '127.0.0.1', 'Y', '2013-08-27 00:58:48.192+08', '2013-08-27 00:58:48.192+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (57, 'admin', '127.0.0.1', 'Y', '2013-08-27 00:58:50.481+08', '2013-08-27 00:58:50.481+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (58, 'admin', '127.0.0.1', 'Y', '2013-08-27 10:14:03.181+08', '2013-08-27 10:14:03.181+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (59, 'admin', '127.0.0.1', 'Y', '2013-08-27 10:14:05.169+08', '2013-08-27 10:14:05.169+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (60, 'admin', '127.0.0.1', 'Y', '2013-08-27 19:12:18.387+08', '2013-08-27 19:12:18.387+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (61, 'admin', '127.0.0.1', 'Y', '2013-08-27 19:12:21.251+08', '2013-08-27 19:12:21.251+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (62, 'admin', '127.0.0.1', 'Y', '2013-08-28 09:58:45.286+08', '2013-08-28 09:58:45.286+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (63, 'admin', '127.0.0.1', 'Y', '2013-08-28 10:00:04.487+08', '2013-08-28 10:00:04.487+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (64, 'admin', '127.0.0.1', 'Y', '2013-08-28 17:52:51.188+08', '2013-08-28 17:52:51.188+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (65, 'admin', '127.0.0.1', 'Y', '2013-08-28 17:52:55.592+08', '2013-08-28 17:52:55.592+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (66, 'admin', '127.0.0.1', 'Y', '2013-08-29 08:50:38.201+08', '2013-08-29 08:50:38.201+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (67, 'admin', '127.0.0.1', 'Y', '2013-08-29 08:50:41.23+08', '2013-08-29 08:50:41.23+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (68, 'admin', '127.0.0.1', 'Y', '2013-08-29 08:50:43.856+08', '2013-08-29 08:50:43.856+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (69, 'admin', '127.0.0.1', 'Y', '2013-08-29 12:43:53.389+08', '2013-08-29 12:43:53.389+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (70, 'admin', '127.0.0.1', 'Y', '2013-08-29 12:43:55.179+08', '2013-08-29 12:43:55.179+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (71, 'admin', '127.0.0.1', 'Y', '2013-08-30 09:35:54.327+08', '2013-08-30 09:35:54.327+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (72, 'admin', '127.0.0.1', 'Y', '2013-08-30 09:36:58.461+08', '2013-08-30 09:36:58.461+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (73, 'admin', '127.0.0.1', 'Y', '2013-08-31 08:37:13.902+08', '2013-08-31 08:37:13.902+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (74, 'admin', '127.0.0.1', 'Y', '2013-08-31 08:37:16.208+08', '2013-08-31 08:37:16.208+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (75, 'admin', '127.0.0.1', 'Y', '2013-08-31 09:32:58.611+08', '2013-08-31 09:32:58.611+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (76, 'admin', '127.0.0.1', 'Y', '2013-08-31 09:33:00.466+08', '2013-08-31 09:33:00.466+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (77, 'admin', '127.0.0.1', 'Y', '2013-08-31 11:18:25.865+08', '2013-08-31 11:18:25.865+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (78, 'admin', '127.0.0.1', 'Y', '2013-08-31 11:18:27.803+08', '2013-08-31 11:18:27.803+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (79, 'admin', '127.0.0.1', 'Y', '2013-09-02 13:10:26.206+08', '2013-09-02 13:10:26.206+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (80, 'admin', '127.0.0.1', 'Y', '2013-09-02 13:10:27.862+08', '2013-09-02 13:10:27.862+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (81, 'admin', '127.0.0.1', 'Y', '2013-09-03 09:08:40.399+08', '2013-09-03 09:08:40.399+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (82, 'admin', '127.0.0.1', 'Y', '2013-09-03 09:08:43.518+08', '2013-09-03 09:08:43.518+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (83, 'admin', '127.0.0.1', 'Y', '2013-09-06 10:12:01.974+08', '2013-09-06 10:12:01.974+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (84, 'admin', '127.0.0.1', 'Y', '2013-09-06 10:12:03.774+08', '2013-09-06 10:12:03.774+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (85, 'admin', '127.0.0.1', 'Y', '2013-09-07 12:20:53.798+08', '2013-09-07 12:20:53.798+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (86, 'admin', '127.0.0.1', 'Y', '2013-09-07 12:20:57.195+08', '2013-09-07 12:20:57.195+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (87, 'admin', '127.0.0.1', 'Y', '2013-09-07 12:20:59.784+08', '2013-09-07 12:20:59.784+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (88, 'admin', '127.0.0.1', 'Y', '2013-09-07 12:21:03.776+08', '2013-09-07 12:21:03.776+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (89, 'admin', '127.0.0.1', 'Y', '2013-09-07 15:45:14.401+08', '2013-09-07 15:45:14.401+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (90, 'admin', '127.0.0.1', 'Y', '2013-09-07 15:45:16.955+08', '2013-09-07 15:45:16.955+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (91, 'admin', '127.0.0.1', 'Y', '2013-09-07 18:25:27.659+08', '2013-09-07 18:25:27.659+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (92, 'admin', '127.0.0.1', 'Y', '2013-09-07 19:32:35.48+08', '2013-09-07 19:32:35.48+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (93, 'admin', '127.0.0.1', 'Y', '2013-09-07 19:32:37.781+08', '2013-09-07 19:32:37.781+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (94, 'admin', '127.0.0.1', 'Y', '2013-09-07 19:34:29.907+08', '2013-09-07 19:34:29.907+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (95, 'admin', '127.0.0.1', 'Y', '2013-09-07 19:34:31.561+08', '2013-09-07 19:34:31.561+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (96, 'admin', '127.0.0.1', 'Y', '2013-09-09 10:15:45.436+08', '2013-09-09 10:15:45.436+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (97, 'admin', '127.0.0.1', 'Y', '2013-09-09 10:15:47.617+08', '2013-09-09 10:15:47.617+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (98, 'admin', '127.0.0.1', 'Y', '2013-09-10 14:35:37.484+08', '2013-09-10 14:35:37.484+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (99, 'admin', '127.0.0.1', 'Y', '2013-09-10 14:35:39.392+08', '2013-09-10 14:35:39.392+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (100, 'admin', '127.0.0.1', 'Y', '2013-09-13 21:38:29.62+08', '2013-09-13 21:38:29.62+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (101, 'admin', '127.0.0.1', 'Y', '2013-09-13 21:38:31.866+08', '2013-09-13 21:38:31.866+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (102, 'admin', '127.0.0.1', 'Y', '2013-09-13 22:33:34.777+08', '2013-09-13 22:33:34.777+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (103, 'admin', '127.0.0.1', 'Y', '2013-09-13 22:33:36.607+08', '2013-09-13 22:33:36.607+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (104, 'admin', '127.0.0.1', 'Y', '2013-09-16 14:48:44.486+08', '2013-09-16 14:48:44.486+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (105, 'admin', '127.0.0.1', 'Y', '2013-09-16 14:48:48.249+08', '2013-09-16 14:48:48.249+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (106, 'admin', '127.0.0.1', 'Y', '2013-09-17 10:20:51.025+08', '2013-09-17 10:20:51.025+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (107, 'admin', '127.0.0.1', 'Y', '2013-09-17 10:20:54.016+08', '2013-09-17 10:20:54.016+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (108, 'admin', '127.0.0.1', 'Y', '2013-09-19 00:23:01.133+08', '2013-09-19 00:23:01.133+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (109, 'admin', '127.0.0.1', 'Y', '2013-09-19 00:23:03.503+08', '2013-09-19 00:23:03.503+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (110, 'admin', '127.0.0.1', 'Y', '2013-09-21 20:04:50.781+08', '2013-09-21 20:04:50.781+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (111, 'admin', '127.0.0.1', 'Y', '2013-09-21 20:04:52.838+08', '2013-09-21 20:04:52.838+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (112, 'admin', '127.0.0.1', 'Y', '2013-09-22 14:35:34.275+08', '2013-09-22 14:35:34.275+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (113, 'admin', '127.0.0.1', 'Y', '2013-09-22 14:35:36.409+08', '2013-09-22 14:35:36.409+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (114, 'admin', '127.0.0.1', 'Y', '2013-09-22 14:35:38.461+08', '2013-09-22 14:35:38.461+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (115, 'admin', '127.0.0.1', 'Y', '2013-09-23 09:04:35.926+08', '2013-09-23 09:04:35.926+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (116, 'admin', '127.0.0.1', 'Y', '2013-09-23 09:04:38.078+08', '2013-09-23 09:04:38.078+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (117, 'admin', '127.0.0.1', 'Y', '2013-09-23 23:38:32.332+08', '2013-09-23 23:38:32.332+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (118, 'admin', '127.0.0.1', 'Y', '2013-09-23 23:38:34.625+08', '2013-09-23 23:38:34.625+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (119, 'admin', '127.0.0.1', 'Y', '2013-09-24 22:30:17.903+08', '2013-09-24 22:30:17.903+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (120, 'admin', '127.0.0.1', 'Y', '2013-09-24 22:30:20.395+08', '2013-09-24 22:30:20.395+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (121, 'admin', '127.0.0.1', 'Y', '2013-09-24 22:30:22.489+08', '2013-09-24 22:30:22.489+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (122, 'admin', '127.0.0.1', 'Y', '2013-09-25 09:36:08.39+08', '2013-09-25 09:36:08.39+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (123, 'admin', '127.0.0.1', 'Y', '2013-09-25 09:36:10.385+08', '2013-09-25 09:36:10.385+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (124, 'admin', '127.0.0.1', 'Y', '2013-09-25 11:31:52.533+08', '2013-09-25 11:31:52.533+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (125, 'admin', '127.0.0.1', 'Y', '2013-09-25 11:32:04.645+08', '2013-09-25 11:32:04.645+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (126, 'admin', '127.0.0.1', 'Y', '2013-09-26 13:23:38.882+08', '2013-09-26 13:23:38.882+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (127, 'admin', '127.0.0.1', 'Y', '2013-09-26 13:23:40.469+08', '2013-09-26 13:23:40.469+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (128, 'admin', '127.0.0.1', 'Y', '2013-09-26 21:57:02.123+08', '2013-09-26 21:57:02.123+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (129, 'admin', '127.0.0.1', 'Y', '2013-09-26 21:57:03.969+08', '2013-09-26 21:57:03.969+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (130, 'admin', '127.0.0.1', 'Y', '2013-09-27 09:59:36.073+08', '2013-09-27 09:59:36.073+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (131, 'admin', '127.0.0.1', 'Y', '2013-09-27 09:59:39.084+08', '2013-09-27 09:59:39.084+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (132, 'admin', '127.0.0.1', 'Y', '2013-09-29 10:12:39.029+08', '2013-09-29 10:12:39.029+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (133, 'admin', '127.0.0.1', 'Y', '2013-09-29 10:12:41.766+08', '2013-09-29 10:12:41.766+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (134, 'admin', '127.0.0.1', 'Y', '2013-10-02 10:54:59.046+08', '2013-10-02 10:54:59.046+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (135, 'admin', '127.0.0.1', 'Y', '2013-10-02 10:55:04.847+08', '2013-10-02 10:55:04.847+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (136, 'admin', '127.0.0.1', 'Y', '2013-10-03 20:06:27.669+08', '2013-10-03 20:06:27.669+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (137, 'admin', '127.0.0.1', 'Y', '2013-10-03 20:06:29.218+08', '2013-10-03 20:06:29.218+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (138, 'admin', '127.0.0.1', 'Y', '2013-10-04 09:27:57.896+08', '2013-10-04 09:27:57.896+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (139, 'admin', '127.0.0.1', 'Y', '2013-10-04 09:28:00.399+08', '2013-10-04 09:28:00.399+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (140, 'admin', '127.0.0.1', 'Y', '2013-10-04 18:42:58.016+08', '2013-10-04 18:42:58.016+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (141, 'admin', '127.0.0.1', 'Y', '2013-10-04 18:42:59.955+08', '2013-10-04 18:42:59.955+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (142, 'admin', '127.0.0.1', 'Y', '2013-10-05 10:41:20.053+08', '2013-10-05 10:41:20.053+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (143, 'admin', '127.0.0.1', 'Y', '2013-10-05 10:41:22.181+08', '2013-10-05 10:41:22.181+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (144, 'admin', '127.0.0.1', 'Y', '2013-10-05 22:58:31.446+08', '2013-10-05 22:58:31.446+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (145, 'admin', '127.0.0.1', 'Y', '2013-10-05 22:58:33.867+08', '2013-10-05 22:58:33.867+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (146, 'admin', '127.0.0.1', 'Y', '2013-10-06 14:18:45.871+08', '2013-10-06 14:18:45.871+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (147, 'admin', '127.0.0.1', 'Y', '2013-10-06 14:18:48.788+08', '2013-10-06 14:18:48.788+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (148, 'admin', '127.0.0.1', 'Y', '2013-10-23 10:48:24.152+08', '2013-10-23 10:48:24.152+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (149, 'admin', '127.0.0.1', 'Y', '2013-10-23 10:48:28.017+08', '2013-10-23 10:48:28.017+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (150, 'admin', '127.0.0.1', 'Y', '2013-10-30 10:24:15.54+08', '2013-10-30 10:24:15.54+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (151, 'admin', '127.0.0.1', 'Y', '2013-10-30 10:24:19.365+08', '2013-10-30 10:24:19.365+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (152, 'admin', '127.0.0.1', 'Y', '2013-10-31 14:42:12.578+08', '2013-10-31 14:42:12.578+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (153, 'admin', NULL, NULL, '2013-10-31 14:46:14.082+08', '2013-10-31 14:46:14.082+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (154, 'admin', '127.0.0.1', 'Y', '2013-10-31 14:46:27.394+08', '2013-10-31 14:46:27.394+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (155, 'admin', '127.0.0.1', 'Y', '2013-10-31 14:57:26.95+08', '2013-10-31 14:57:26.95+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (156, 'admin', '127.0.0.1', 'Y', '2013-10-31 14:57:44.07+08', '2013-10-31 14:57:44.07+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (157, 'admin', '127.0.0.1', 'Y', '2013-11-01 09:45:44.23+08', '2013-11-01 09:45:44.23+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (158, 'admin', '127.0.0.1', 'Y', '2013-11-01 09:45:46.037+08', '2013-11-01 09:45:46.037+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (159, 'admin', '127.0.0.1', 'Y', '2013-11-01 11:00:52.227+08', '2013-11-01 11:00:52.227+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (160, 'admin', '127.0.0.1', 'Y', '2013-11-01 11:00:54.655+08', '2013-11-01 11:00:54.655+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (161, 'admin', '127.0.0.1', 'Y', '2013-11-01 11:07:38.056+08', '2013-11-01 11:07:38.056+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (162, 'admin', '127.0.0.1', 'Y', '2013-11-01 11:07:40.391+08', '2013-11-01 11:07:40.391+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (163, 'admin', '127.0.0.1', 'Y', '2013-11-02 13:20:41.309+08', '2013-11-02 13:20:41.309+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (164, 'admin', '127.0.0.1', 'Y', '2013-11-02 13:20:43.179+08', '2013-11-02 13:20:43.179+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (165, 'admin', '127.0.0.1', 'Y', '2013-11-04 09:16:28.638+08', '2013-11-04 09:16:28.638+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (166, 'admin', '127.0.0.1', 'Y', '2013-11-04 09:16:31.862+08', '2013-11-04 09:16:31.862+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (167, 'admin', '127.0.0.1', 'Y', '2013-11-05 14:59:33.6+08', '2013-11-05 14:59:33.6+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (168, 'admin', '127.0.0.1', 'Y', '2013-11-05 14:59:35.718+08', '2013-11-05 14:59:35.718+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (169, 'admin', '127.0.0.1', 'Y', '2013-11-06 09:27:25.89+08', '2013-11-06 09:27:25.89+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (170, 'admin', '127.0.0.1', 'Y', '2013-11-06 09:27:27.768+08', '2013-11-06 09:27:27.768+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (171, 'admin', '127.0.0.1', 'Y', '2013-11-07 09:45:39.252+08', '2013-11-07 09:45:39.252+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (172, 'admin', '127.0.0.1', 'Y', '2013-11-07 09:45:41.428+08', '2013-11-07 09:45:41.428+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (173, 'admin', '127.0.0.1', 'Y', '2013-11-08 09:37:02.189+08', '2013-11-08 09:37:02.189+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (174, 'admin', '127.0.0.1', 'Y', '2013-11-08 09:37:04.044+08', '2013-11-08 09:37:04.044+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (175, 'admin', '127.0.0.1', 'Y', '2013-11-09 16:46:06.871+08', '2013-11-09 16:46:06.871+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (176, 'admin', '127.0.0.1', 'Y', '2013-11-09 21:00:13.526+08', '2013-11-09 21:00:13.526+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (177, 'admin', '127.0.0.1', 'Y', '2013-11-10 11:18:52.874+08', '2013-11-10 11:18:52.874+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (178, 'admin', '127.0.0.1', 'Y', '2013-11-14 14:44:49.498+08', '2013-11-14 14:44:49.498+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (179, 'admin', '127.0.0.1', 'Y', '2013-11-20 09:12:51.809+08', '2013-11-20 09:12:51.809+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (180, 'admin', '127.0.0.1', 'N', '2013-11-21 10:32:41.729+08', '2013-11-21 10:32:41.729+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (181, 'admin', '127.0.0.1', 'Y', '2013-11-21 10:32:44.281+08', '2013-11-21 10:32:44.281+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (182, 'admin', '127.0.0.1', 'Y', '2013-11-22 10:51:46.084+08', '2013-11-22 10:51:46.084+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (183, 'admin', '127.0.0.1', 'Y', '2013-11-22 16:08:08.657+08', '2013-11-22 16:08:08.657+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (184, 'admin', '127.0.0.1', 'Y', '2013-11-23 09:45:11.308+08', '2013-11-23 09:45:11.308+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (185, 'admin', '127.0.0.1', 'Y', '2013-11-23 18:14:02.841+08', '2013-11-23 18:14:02.841+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (186, 'admin', '127.0.0.1', 'Y', '2013-11-23 21:11:38.002+08', '2013-11-23 21:11:38.002+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (187, 'admin', '127.0.0.1', 'Y', '2013-11-24 14:09:16.854+08', '2013-11-24 14:09:16.854+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (188, 'tony', '127.0.0.1', 'Y', '2013-11-24 17:50:59.487+08', '2013-11-24 17:50:59.487+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (189, 'natasha', '127.0.0.1', 'Y', '2013-11-24 17:56:36.418+08', '2013-11-24 17:56:36.418+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (190, 'nick', '127.0.0.1', 'Y', '2013-11-24 17:56:46.738+08', '2013-11-24 17:56:46.738+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (191, 'admin', '127.0.0.1', 'Y', '2013-11-24 18:14:12.104+08', '2013-11-24 18:14:12.104+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (192, 'admin', '127.0.0.1', 'Y', '2013-11-25 09:37:12.186+08', '2013-11-25 09:37:12.186+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (193, 'nick', '127.0.0.1', 'Y', '2013-11-25 10:44:30.515+08', '2013-11-25 10:44:30.515+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (194, 'admin', '127.0.0.1', 'Y', '2013-11-25 10:47:26.275+08', '2013-11-25 10:47:26.275+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (195, 'tony', '127.0.0.1', 'Y', '2013-11-25 10:48:33.676+08', '2013-11-25 10:48:33.676+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (196, 'natasha', '127.0.0.1', 'Y', '2013-11-25 10:50:17.64+08', '2013-11-25 10:50:17.64+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (197, 'admin', '127.0.0.1', 'Y', '2013-11-25 11:13:55.937+08', '2013-11-25 11:13:55.937+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (198, 'admin', '127.0.0.1', 'Y', '2013-11-25 12:25:04.239+08', '2013-11-25 12:25:04.239+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (199, 'admin', '127.0.0.1', 'Y', '2013-11-25 12:34:54.949+08', '2013-11-25 12:34:54.949+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (200, 'tony', '127.0.0.1', 'N', '2013-11-25 14:17:11.72+08', '2013-11-25 14:17:11.72+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (201, 'tony', '127.0.0.1', 'Y', '2013-11-25 14:17:13.919+08', '2013-11-25 14:17:13.919+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (202, 'tony', '127.0.0.1', 'Y', '2013-11-25 14:33:30.064+08', '2013-11-25 14:33:30.064+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (203, 'natasha', '127.0.0.1', 'Y', '2013-11-25 14:46:15.673+08', '2013-11-25 14:46:15.673+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (204, 'tony', '127.0.0.1', 'Y', '2013-11-25 14:48:15.818+08', '2013-11-25 14:48:15.818+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (205, 'tony', '127.0.0.1', 'Y', '2013-11-25 14:48:34.005+08', '2013-11-25 14:48:34.005+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (206, 'natasha', '127.0.0.1', 'Y', '2013-11-25 14:48:49.656+08', '2013-11-25 14:48:49.656+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (207, 'nick', '127.0.0.1', 'Y', '2013-11-25 14:49:07.325+08', '2013-11-25 14:49:07.325+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (208, 'admin', '127.0.0.1', 'Y', '2013-11-25 14:58:52.671+08', '2013-11-25 14:58:52.671+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (209, 'tony', '127.0.0.1', 'Y', '2013-11-25 19:52:49.706+08', '2013-11-25 19:52:49.706+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (210, 'admin', '127.0.0.1', 'Y', '2013-11-25 23:23:59.094+08', '2013-11-25 23:23:59.094+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (211, 'nick', '127.0.0.1', 'Y', '2013-11-26 12:27:06.107+08', '2013-11-26 12:27:06.107+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (212, 'admin', '127.0.0.1', 'Y', '2013-11-26 12:36:16.254+08', '2013-11-26 12:36:16.254+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (213, 'nick', '127.0.0.1', 'Y', '2013-11-26 14:58:52.051+08', '2013-11-26 14:58:52.051+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (214, 'tony', '127.0.0.1', 'Y', '2013-11-26 15:00:45.139+08', '2013-11-26 15:00:45.139+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (215, 'nick', '127.0.0.1', 'Y', '2013-11-26 15:09:35.599+08', '2013-11-26 15:09:35.599+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (216, 'tony', '127.0.0.1', 'Y', '2013-11-26 15:10:02.122+08', '2013-11-26 15:10:02.122+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (217, 'nick', '127.0.0.1', 'Y', '2013-11-26 15:51:45.464+08', '2013-11-26 15:51:45.464+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (218, 'admin', '127.0.0.1', 'Y', '2013-11-26 16:10:29.808+08', '2013-11-26 16:10:29.808+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (219, 'tony', '127.0.0.1', 'Y', '2013-11-26 16:28:42.108+08', '2013-11-26 16:28:42.108+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (220, 'nick', '127.0.0.1', 'Y', '2013-11-26 16:29:16.028+08', '2013-11-26 16:29:16.028+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (221, 'natasha', '127.0.0.1', 'Y', '2013-11-26 16:35:05.488+08', '2013-11-26 16:35:05.488+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (222, 'admin', '127.0.0.1', 'Y', '2013-11-26 16:53:11.921+08', '2013-11-26 16:53:11.921+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (223, 'tony', '127.0.0.1', 'Y', '2013-11-26 20:38:30.797+08', '2013-11-26 20:38:30.797+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (224, 'nick', '127.0.0.1', 'Y', '2013-11-26 20:39:12.744+08', '2013-11-26 20:39:12.744+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (225, 'natasha', '127.0.0.1', 'Y', '2013-11-26 20:39:59.958+08', '2013-11-26 20:39:59.958+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (226, 'admin', '127.0.0.1', 'Y', '2013-11-26 21:23:07.392+08', '2013-11-26 21:23:07.392+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (227, 'admin', '127.0.0.1', 'Y', '2013-11-26 21:23:37.626+08', '2013-11-26 21:23:37.626+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (228, 'natasha', '127.0.0.1', 'Y', '2013-11-27 09:34:02.151+08', '2013-11-27 09:34:02.151+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (229, 'admin', '127.0.0.1', 'Y', '2013-11-27 09:34:21.143+08', '2013-11-27 09:34:21.143+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (230, 'natasha', '127.0.0.1', 'Y', '2013-11-27 10:19:38.899+08', '2013-11-27 10:19:38.899+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (231, 'admin', '127.0.0.1', 'Y', '2013-11-27 10:22:52.898+08', '2013-11-27 10:22:52.898+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (232, 'admin', '127.0.0.1', 'N', '2013-11-27 10:42:28.623+08', '2013-11-27 10:42:28.623+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (233, 'admin', '127.0.0.1', 'Y', '2013-11-27 10:42:32.828+08', '2013-11-27 10:42:32.828+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (234, 'admin', '127.0.0.1', 'Y', '2013-11-27 10:44:22.839+08', '2013-11-27 10:44:22.839+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (235, 'tony', '127.0.0.1', 'Y', '2013-11-27 13:03:06.793+08', '2013-11-27 13:03:06.793+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (236, 'nick', '127.0.0.1', 'Y', '2013-11-27 13:04:01.525+08', '2013-11-27 13:04:01.525+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (237, 'admin', '127.0.0.1', 'Y', '2013-11-27 14:33:17.252+08', '2013-11-27 14:33:17.252+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (238, 'tony', '127.0.0.1', 'Y', '2013-11-28 14:24:40.75+08', '2013-11-28 14:24:40.75+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (239, 'tony', '127.0.0.1', 'Y', '2013-11-28 14:26:29.491+08', '2013-11-28 14:26:29.491+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (240, 'admin', '127.0.0.1', 'Y', '2013-11-28 14:45:55.276+08', '2013-11-28 14:45:55.276+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (241, 'nick', '127.0.0.1', 'Y', '2013-11-28 14:52:49.363+08', '2013-11-28 14:52:49.363+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (242, 'tony', '127.0.0.1', 'Y', '2013-11-28 15:25:10.773+08', '2013-11-28 15:25:10.773+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (243, 'nick', '127.0.0.1', 'Y', '2013-11-28 15:25:29.49+08', '2013-11-28 15:25:29.49+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (244, 'admin', '127.0.0.1', 'Y', '2013-11-28 15:27:12.801+08', '2013-11-28 15:27:12.801+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (245, 'tony', '127.0.0.1', 'Y', '2013-11-28 15:40:01.198+08', '2013-11-28 15:40:01.198+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (246, 'nick', '127.0.0.1', 'Y', '2013-11-28 15:41:21.845+08', '2013-11-28 15:41:21.845+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (247, 'natasha', '127.0.0.1', 'Y', '2013-11-28 15:42:30.769+08', '2013-11-28 15:42:30.769+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (248, 'admin', '127.0.0.1', 'Y', '2013-11-28 16:06:49.251+08', '2013-11-28 16:06:49.251+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (249, 'tony', '127.0.0.1', 'Y', '2013-11-28 17:35:58.967+08', '2013-11-28 17:35:58.967+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (250, 'nick', '127.0.0.1', 'Y', '2013-11-28 17:36:48.889+08', '2013-11-28 17:36:48.889+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (251, 'natasha', '127.0.0.1', 'Y', '2013-11-28 17:37:51.256+08', '2013-11-28 17:37:51.256+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (252, 'tony', '127.0.0.1', 'N', '2013-11-28 19:31:10.365+08', '2013-11-28 19:31:10.365+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (253, 'tony', '127.0.0.1', 'Y', '2013-11-28 19:31:14.57+08', '2013-11-28 19:31:14.57+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (254, 'nick', '127.0.0.1', 'Y', '2013-11-28 19:31:44.152+08', '2013-11-28 19:31:44.152+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (255, 'tony', '127.0.0.1', 'Y', '2013-11-28 19:37:39.098+08', '2013-11-28 19:37:39.098+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (256, 'nick', '127.0.0.1', 'Y', '2013-11-28 19:41:31.554+08', '2013-11-28 19:41:31.554+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (257, 'natasha', '127.0.0.1', 'Y', '2013-11-28 19:41:54.518+08', '2013-11-28 19:41:54.518+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (258, 'nick', '127.0.0.1', 'Y', '2013-11-28 19:42:13.066+08', '2013-11-28 19:42:13.066+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (259, 'admin', '127.0.0.1', 'Y', '2013-11-28 20:08:09.43+08', '2013-11-28 20:08:09.43+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (260, 'tony', '127.0.0.1', 'Y', '2013-11-28 20:40:29.085+08', '2013-11-28 20:40:29.085+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (261, 'tony', '127.0.0.1', 'Y', '2013-11-28 20:50:29.748+08', '2013-11-28 20:50:29.748+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (262, 'admin', '127.0.0.1', 'Y', '2013-11-28 21:04:20.095+08', '2013-11-28 21:04:20.095+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (263, 'tony', '127.0.0.1', 'Y', '2013-11-28 21:22:58.046+08', '2013-11-28 21:22:58.046+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (264, 'admin', '127.0.0.1', 'Y', '2013-11-28 21:23:50.045+08', '2013-11-28 21:23:50.045+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (265, 'tony', '127.0.0.1', 'Y', '2013-11-29 11:42:40.314+08', '2013-11-29 11:42:40.314+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (266, 'admin', '127.0.0.1', 'Y', '2013-11-29 11:43:15.952+08', '2013-11-29 11:43:15.952+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (267, 'natasha', '127.0.0.1', 'Y', '2013-11-29 11:52:05.436+08', '2013-11-29 11:52:05.436+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (268, 'admin', '127.0.0.1', 'Y', '2013-11-29 12:00:02.36+08', '2013-11-29 12:00:02.36+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (269, 'natasha', '127.0.0.1', 'Y', '2013-11-29 12:22:08.644+08', '2013-11-29 12:22:08.644+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (270, 'admin', '127.0.0.1', 'Y', '2013-11-29 12:38:27.372+08', '2013-11-29 12:38:27.372+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (271, 'admin', '127.0.0.1', 'Y', '2013-11-29 12:40:18.491+08', '2013-11-29 12:40:18.491+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (272, 'natasha', '127.0.0.1', 'Y', '2013-11-29 12:40:55.223+08', '2013-11-29 12:40:55.223+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (273, 'admin', '127.0.0.1', 'Y', '2013-11-29 12:51:25.689+08', '2013-11-29 12:51:25.689+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (274, 'natasha', '127.0.0.1', 'Y', '2013-11-29 12:51:50.58+08', '2013-11-29 12:51:50.58+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (275, 'admin', '127.0.0.1', 'Y', '2013-11-29 13:15:27.596+08', '2013-11-29 13:15:27.596+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (276, 'natasha', '127.0.0.1', 'Y', '2013-11-29 13:29:34.638+08', '2013-11-29 13:29:34.638+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (277, 'tony', '127.0.0.1', 'Y', '2013-11-29 13:30:23.481+08', '2013-11-29 13:30:23.481+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (278, 'admin', '127.0.0.1', 'Y', '2013-11-29 14:32:02.953+08', '2013-11-29 14:32:02.953+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (279, 'tony', '127.0.0.1', 'Y', '2013-11-29 19:17:40.191+08', '2013-11-29 19:17:40.191+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (280, 'nick', '127.0.0.1', 'Y', '2013-11-29 19:21:08.217+08', '2013-11-29 19:21:08.217+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (281, 'natasha', '127.0.0.1', 'Y', '2013-11-29 19:25:33.71+08', '2013-11-29 19:25:33.71+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (282, 'nick', '127.0.0.1', 'Y', '2013-11-29 19:26:32.094+08', '2013-11-29 19:26:32.094+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (283, 'tony', '127.0.0.1', 'Y', '2013-11-29 19:28:26.37+08', '2013-11-29 19:28:26.37+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (284, 'nick', '127.0.0.1', 'Y', '2013-11-29 19:29:47.83+08', '2013-11-29 19:29:47.83+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (285, 'natasha', '127.0.0.1', 'Y', '2013-11-29 21:14:51.79+08', '2013-11-29 21:14:51.79+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (286, 'tony', '127.0.0.1', 'Y', '2013-11-29 21:32:42.912+08', '2013-11-29 21:32:42.912+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (287, 'nick', '127.0.0.1', 'Y', '2013-11-29 21:35:09.796+08', '2013-11-29 21:35:09.796+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (288, 'natasha', '127.0.0.1', 'Y', '2013-11-29 21:36:21.972+08', '2013-11-29 21:36:21.972+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (289, 'nick', '127.0.0.1', 'Y', '2013-11-29 21:37:38.57+08', '2013-11-29 21:37:38.57+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (290, 'tony', '127.0.0.1', 'Y', '2013-11-29 21:39:48.356+08', '2013-11-29 21:39:48.356+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (291, 'admin', '127.0.0.1', 'Y', '2013-11-29 21:49:15.688+08', '2013-11-29 21:49:15.688+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (292, 'tony', '127.0.0.1', 'Y', '2013-11-30 13:01:19.093+08', '2013-11-30 13:01:19.093+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (293, 'nick', '127.0.0.1', 'Y', '2013-11-30 13:02:30.721+08', '2013-11-30 13:02:30.721+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (294, 'tony', '127.0.0.1', 'Y', '2013-11-30 13:03:18.394+08', '2013-11-30 13:03:18.394+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (295, 'natasha', '127.0.0.1', 'Y', '2013-11-30 13:03:48.977+08', '2013-11-30 13:03:48.977+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (296, 'nick', '127.0.0.1', 'Y', '2013-11-30 13:06:45.153+08', '2013-11-30 13:06:45.153+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (297, 'tony', '127.0.0.1', 'Y', '2013-11-30 13:07:48.975+08', '2013-11-30 13:07:48.975+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (298, 'nick', '127.0.0.1', 'Y', '2013-11-30 13:11:12.262+08', '2013-11-30 13:11:12.262+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (299, 'admin', '127.0.0.1', 'Y', '2013-12-15 10:43:15.96+08', '2013-12-15 10:43:15.96+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (300, 'admin', '127.0.0.1', 'Y', '2013-12-15 10:51:32.096+08', '2013-12-15 10:51:32.096+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (301, 'admin', '127.0.0.1', 'Y', '2013-12-18 13:57:10.326+08', '2013-12-18 13:57:10.326+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (302, 'admin', '127.0.0.1', 'Y', '2013-12-19 15:20:04.691+08', '2013-12-19 15:20:04.691+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (303, 'admin', '127.0.0.1', 'Y', '2013-12-22 17:08:06.88+08', '2013-12-22 17:08:06.88+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (304, 'admin', '127.0.0.1', 'N', '2014-01-03 10:29:47.483+08', '2014-01-03 10:29:47.483+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (305, 'admin', '127.0.0.1', 'N', '2014-01-03 10:29:50.753+08', '2014-01-03 10:29:50.753+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (306, 'admin', '127.0.0.1', 'Y', '2014-01-10 12:53:08.377+08', '2014-01-10 12:53:08.377+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (307, 'admin', '127.0.0.1', 'Y', '2014-01-11 20:56:35.439+08', '2014-01-11 20:56:35.439+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (308, 'tony', '127.0.0.1', 'Y', '2014-01-12 23:47:24.988+08', '2014-01-12 23:47:24.988+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (309, 'tony', '127.0.0.1', 'Y', '2014-01-13 09:41:20.264+08', '2014-01-13 09:41:20.264+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (310, 'admin', '127.0.0.1', 'Y', '2014-01-16 15:35:34.96+08', '2014-01-16 15:35:34.96+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (311, 'admin', '127.0.0.1', 'Y', '2014-01-17 12:40:35.831+08', '2014-01-17 12:40:35.831+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (312, 'admin', '127.0.0.1', 'Y', '2014-01-17 14:33:36.204+08', '2014-01-17 14:33:36.204+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (313, 'admin', '127.0.0.1', 'N', '2014-01-18 12:00:58.387+08', '2014-01-18 12:00:58.387+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (314, 'admin', '127.0.0.1', 'Y', '2014-01-18 12:01:00.479+08', '2014-01-18 12:01:00.479+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (315, 'nick', '127.0.0.1', 'Y', '2014-01-18 12:22:29.181+08', '2014-01-18 12:22:29.181+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (316, 'tony', '127.0.0.1', 'Y', '2014-01-18 12:24:32.012+08', '2014-01-18 12:24:32.012+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (317, 'admin', '127.0.0.1', 'Y', '2014-01-18 12:41:23.91+08', '2014-01-18 12:41:23.91+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (318, 'tony', '127.0.0.1', 'Y', '2014-01-18 12:50:12.068+08', '2014-01-18 12:50:12.068+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (319, 'admin', '127.0.0.1', 'N', '2014-01-18 12:53:03.729+08', '2014-01-18 12:53:03.729+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (320, 'admin', '127.0.0.1', 'Y', '2014-01-18 12:53:05.857+08', '2014-01-18 12:53:05.857+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (321, 'tony', '127.0.0.1', 'Y', '2014-01-18 12:53:28.579+08', '2014-01-18 12:53:28.579+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (322, 'admin', '127.0.0.1', 'Y', '2014-01-18 16:21:10.308+08', '2014-01-18 16:21:10.308+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (323, 'tony', '127.0.0.1', 'Y', '2014-01-18 17:15:24.33+08', '2014-01-18 17:15:24.33+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (324, 'nick', '127.0.0.1', 'Y', '2014-01-18 17:16:17.367+08', '2014-01-18 17:16:17.367+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (325, 'admin', '127.0.0.1', 'Y', '2014-01-18 19:58:13.255+08', '2014-01-18 19:58:13.255+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (326, 'admin', '127.0.0.1', 'Y', '2014-01-18 20:12:35.43+08', '2014-01-18 20:12:35.43+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (327, 'tony', '127.0.0.1', 'Y', '2014-01-18 20:19:28.457+08', '2014-01-18 20:19:28.457+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (328, 'nick', '127.0.0.1', 'Y', '2014-01-18 20:21:51.353+08', '2014-01-18 20:21:51.353+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (329, 'tony', '127.0.0.1', 'Y', '2014-01-18 20:22:14.546+08', '2014-01-18 20:22:14.546+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (330, 'admin', '127.0.0.1', 'Y', '2014-01-18 20:22:30.117+08', '2014-01-18 20:22:30.117+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (331, 'tony', '127.0.0.1', 'Y', '2014-01-18 21:11:21.773+08', '2014-01-18 21:11:21.773+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (332, 'tony', '127.0.0.1', 'Y', '2014-01-18 21:17:01.307+08', '2014-01-18 21:17:01.307+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (333, 'nick', '127.0.0.1', 'Y', '2014-01-18 21:19:51.36+08', '2014-01-18 21:19:51.36+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (334, 'admin', '127.0.0.1', 'Y', '2014-01-18 21:21:34.926+08', '2014-01-18 21:21:34.926+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (335, 'tony', '127.0.0.1', 'Y', '2014-01-20 09:46:39.624+08', '2014-01-20 09:46:39.624+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (336, 'nick', '127.0.0.1', 'Y', '2014-01-20 09:49:27.614+08', '2014-01-20 09:49:27.614+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (337, 'tony', '127.0.0.1', 'Y', '2014-01-20 09:50:06.093+08', '2014-01-20 09:50:06.093+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (338, 'admin', '127.0.0.1', 'Y', '2014-01-20 09:50:45.45+08', '2014-01-20 09:50:45.45+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (339, 'tony', '127.0.0.1', 'Y', '2014-01-20 09:51:56.707+08', '2014-01-20 09:51:56.707+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (340, 'admin', '192.168.0.147', 'Y', '2014-01-25 17:22:36.743+08', '2014-01-25 17:22:36.743+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (341, 'admin', '127.0.0.1', 'Y', '2014-01-25 21:06:10.78+08', '2014-01-25 21:06:10.78+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (342, 'admin', '127.0.0.1', 'Y', '2014-01-26 14:36:38.325+08', '2014-01-26 14:36:38.325+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (343, 'admin', '192.168.1.81', 'Y', '2014-01-26 15:26:33.159+08', '2014-01-26 15:26:33.159+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (344, 'admin2', '192.168.1.81', 'N', '2014-01-26 15:40:50.103+08', '2014-01-26 15:40:50.103+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (345, 'admin2', '192.168.1.81', 'N', '2014-01-26 15:40:54.051+08', '2014-01-26 15:40:54.051+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (346, 'admin2', '192.168.1.81', 'N', '2014-01-26 15:40:59.057+08', '2014-01-26 15:40:59.057+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (347, 'admin2', '192.168.1.81', 'Y', '2014-01-26 15:41:52.659+08', '2014-01-26 15:41:52.659+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (348, 'admin2', '192.168.1.81', 'Y', '2014-01-26 15:42:05.493+08', '2014-01-26 15:42:05.493+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (349, 'admin2', '192.168.1.81', 'Y', '2014-01-26 15:42:28.532+08', '2014-01-26 15:42:28.532+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (350, 'admin', '127.0.0.1', 'Y', '2014-01-26 15:51:44.874+08', '2014-01-26 15:51:44.874+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (351, 'admin2', '192.168.1.81', 'Y', '2014-01-26 15:52:20.571+08', '2014-01-26 15:52:20.571+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (352, 'admin2', '192.168.1.81', 'Y', '2014-01-26 18:29:50.854+08', '2014-01-26 18:29:50.854+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (353, 'tony', '127.0.0.1', 'Y', '2014-01-27 11:09:34.69+08', '2014-01-27 11:09:34.69+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (354, 'nick', '127.0.0.1', 'Y', '2014-01-27 11:12:34.513+08', '2014-01-27 11:12:34.513+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (355, 'tony', '127.0.0.1', 'Y', '2014-01-27 11:13:07.965+08', '2014-01-27 11:13:07.965+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (356, 'admin', '127.0.0.1', 'Y', '2014-01-27 11:14:03.07+08', '2014-01-27 11:14:03.07+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (357, 'tony', '127.0.0.1', 'Y', '2014-01-27 11:15:26.869+08', '2014-01-27 11:15:26.869+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (358, 'tony', '127.0.0.1', 'Y', '2014-01-27 11:16:43.624+08', '2014-01-27 11:16:43.624+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (359, 'tony', '127.0.0.1', 'Y', '2014-01-28 10:30:47.069+08', '2014-01-28 10:30:47.069+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (360, 'nick', '127.0.0.1', 'Y', '2014-01-28 10:32:55.089+08', '2014-01-28 10:32:55.089+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (361, 'tony', '127.0.0.1', 'Y', '2014-01-28 10:33:28.254+08', '2014-01-28 10:33:28.254+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (362, 'tony', '127.0.0.1', 'Y', '2014-01-28 10:35:09.488+08', '2014-01-28 10:35:09.488+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (363, 'admin', '127.0.0.1', 'Y', '2014-01-28 10:35:19.558+08', '2014-01-28 10:35:19.558+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (364, 'tony', '127.0.0.1', 'Y', '2014-01-28 10:36:27.541+08', '2014-01-28 10:36:27.541+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (365, 'admin', '127.0.0.1', 'Y', '2014-01-28 15:01:27.136+08', '2014-01-28 15:01:27.136+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (366, 'admin', '127.0.0.1', 'Y', '2014-02-03 17:32:06.641+08', '2014-02-03 17:32:06.641+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (367, 'admin', '127.0.0.1', 'Y', '2014-02-04 09:31:08.036+08', '2014-02-04 09:31:08.036+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (368, 'admin', '127.0.0.1', 'Y', '2014-02-04 19:09:05.842+08', '2014-02-04 19:09:05.842+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (369, 'admin', '127.0.0.1', 'Y', '2014-02-04 19:19:34.804+08', '2014-02-04 19:19:34.804+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (370, 'admin', '127.0.0.1', 'Y', '2014-02-05 13:10:42.449+08', '2014-02-05 13:10:42.449+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (371, 'danny', '192.168.1.20', 'N', '2014-02-05 15:30:14.062+08', '2014-02-05 15:30:14.062+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (372, 'admin2', '192.168.1.20', 'N', '2014-02-05 15:30:41.206+08', '2014-02-05 15:30:41.206+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (373, 'admin2', '192.168.1.20', 'N', '2014-02-05 15:30:53.486+08', '2014-02-05 15:30:53.486+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (374, 'admin', '192.168.1.20', 'Y', '2014-02-05 15:30:57.535+08', '2014-02-05 15:30:57.535+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (375, 'admin2', '127.0.0.1', 'Y', '2014-02-05 15:34:51.962+08', '2014-02-05 15:34:51.962+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (376, 'admin', '127.0.0.1', 'Y', '2014-02-06 12:24:29.892+08', '2014-02-06 12:24:29.892+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (377, 'admin', '127.0.0.1', 'Y', '2014-02-07 11:34:05.737+08', '2014-02-07 11:34:05.737+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (378, 'admin2', '192.168.1.20', 'Y', '2014-02-08 11:56:37.581+08', '2014-02-08 11:56:37.581+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (379, 'admin', '127.0.0.1', 'Y', '2014-02-10 09:28:46.529+08', '2014-02-10 09:28:46.529+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (380, 'admin', '127.0.0.1', 'Y', '2014-02-10 21:13:56.378+08', '2014-02-10 21:13:56.378+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (381, 'admin', '127.0.0.1', 'Y', '2014-02-11 10:45:11.124+08', '2014-02-11 10:45:11.124+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (382, 'admin', '127.0.0.1', 'Y', '2014-02-11 10:48:39.732+08', '2014-02-11 10:48:39.732+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (383, 'admin', '127.0.0.1', 'Y', '2014-02-11 11:02:45.539+08', '2014-02-11 11:02:45.539+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (384, 'admin', '127.0.0.1', 'Y', '2014-02-11 11:13:51.348+08', '2014-02-11 11:13:51.348+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (385, 'ispadmin', '127.0.0.1', 'N', '2014-02-11 11:14:50.158+08', '2014-02-11 11:14:50.158+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (386, 'ispadmin', '127.0.0.1', 'Y', '2014-02-11 11:14:53.107+08', '2014-02-11 11:14:53.107+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (387, 'admin', '127.0.0.1', 'Y', '2014-02-11 11:16:53.535+08', '2014-02-11 11:16:53.535+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (388, 'admin', '127.0.0.1', 'Y', '2014-02-11 11:18:59.751+08', '2014-02-11 11:18:59.751+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (389, 'lampard7824@gmail.com', '127.0.0.1', 'N', '2014-02-11 12:05:48.883+08', '2014-02-11 12:05:48.883+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (390, 'lampard7824@gmail.com', '127.0.0.1', 'Y', '2014-02-11 12:06:12.218+08', '2014-02-11 12:06:12.218+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (391, 'yyyyss@gmail.com', '127.0.0.1', 'Y', '2014-02-11 12:07:18.609+08', '2014-02-11 12:07:18.609+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (392, 'admin', '127.0.0.1', 'Y', '2014-02-11 12:14:53.864+08', '2014-02-11 12:14:53.864+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (393, 'ispadmin', '127.0.0.1', 'Y', '2014-02-11 12:21:11.819+08', '2014-02-11 12:21:11.819+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (394, 'esp@phiorion.com', '127.0.0.1', 'N', '2014-02-11 12:32:12.863+08', '2014-02-11 12:32:12.863+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (395, 'esp@phiorion.com', '127.0.0.1', 'N', '2014-02-11 12:32:22.532+08', '2014-02-11 12:32:22.532+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (396, 'esp@phiorion.com', '127.0.0.1', 'N', '2014-02-11 12:32:28.651+08', '2014-02-11 12:32:28.651+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (397, 'esp@phiorion.com', '127.0.0.1', 'Y', '2014-02-11 12:34:02.364+08', '2014-02-11 12:34:02.364+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (398, 'ispadmin', '127.0.0.1', 'N', '2014-02-11 12:34:55.781+08', '2014-02-11 12:34:55.781+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (399, 'ispadmin', '127.0.0.1', 'Y', '2014-02-11 12:34:59.276+08', '2014-02-11 12:34:59.276+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (400, 'esp@phiorion.com', '127.0.0.1', 'Y', '2014-02-11 12:35:17.407+08', '2014-02-11 12:35:17.407+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (401, 'admin', '127.0.0.1', 'Y', '2014-02-11 14:31:01.158+08', '2014-02-11 14:31:01.158+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (402, 'admin', '127.0.0.1', 'Y', '2014-02-12 12:35:25.904+08', '2014-02-12 12:35:25.904+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (403, 'ispadmin', '127.0.0.1', 'Y', '2014-02-12 12:51:42.72+08', '2014-02-12 12:51:42.72+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (404, 'admin', '127.0.0.1', 'Y', '2014-02-12 13:50:04.748+08', '2014-02-12 13:50:04.748+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (405, 'esp@phiorion.com', '127.0.0.1', 'Y', '2014-02-12 13:52:57.388+08', '2014-02-12 13:52:57.388+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (406, 'ispadmin', '127.0.0.1', 'N', '2014-02-12 13:56:09.598+08', '2014-02-12 13:56:09.598+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (407, 'ispadmin', '127.0.0.1', 'Y', '2014-02-12 13:56:13.399+08', '2014-02-12 13:56:13.399+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (408, 'esp@phiorion.com', '127.0.0.1', 'Y', '2014-02-12 13:58:29.495+08', '2014-02-12 13:58:29.495+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (409, 'admin', '127.0.0.1', 'Y', '2014-02-12 13:58:52.797+08', '2014-02-12 13:58:52.797+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (410, 'esp@phiorion.com', '127.0.0.1', 'Y', '2014-02-12 14:13:50.786+08', '2014-02-12 14:13:50.786+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (411, 'admin', '127.0.0.1', 'Y', '2014-02-12 14:13:59.1+08', '2014-02-12 14:13:59.1+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (412, 'esp@phiorion.com', '127.0.0.1', 'Y', '2014-02-12 14:14:53.643+08', '2014-02-12 14:14:53.643+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (413, 'ispadmin', '127.0.0.1', 'Y', '2014-02-12 14:15:09.974+08', '2014-02-12 14:15:09.974+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (414, 'esp@phiorion.com', '127.0.0.1', 'Y', '2014-02-12 14:43:17.037+08', '2014-02-12 14:43:17.037+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (415, 'admin', '127.0.0.1', 'Y', '2014-02-12 21:32:52.964+08', '2014-02-12 21:32:52.964+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (416, 'ispadmin', '127.0.0.1', 'N', '2014-02-12 21:59:02.459+08', '2014-02-12 21:59:02.459+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (417, 'ispadmin', '127.0.0.1', 'Y', '2014-02-12 21:59:06.216+08', '2014-02-12 21:59:06.216+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (418, 'admin', '127.0.0.1', 'Y', '2014-02-12 22:14:04.024+08', '2014-02-12 22:14:04.024+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (419, 'ispadmin', '127.0.0.1', 'N', '2014-02-13 15:42:07.117+08', '2014-02-13 15:42:07.117+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (420, 'ispadmin', '127.0.0.1', 'Y', '2014-02-13 15:42:10.763+08', '2014-02-13 15:42:10.763+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (421, 'admin', '127.0.0.1', 'Y', '2014-02-14 14:31:58.736+08', '2014-02-14 14:31:58.736+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (422, 'admin', '127.0.0.1', 'Y', '2014-02-15 13:52:52.213+08', '2014-02-15 13:52:52.213+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (423, 'admin', '127.0.0.1', 'Y', '2014-02-16 14:45:21.209+08', '2014-02-16 14:45:21.209+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (424, 'esp@phiorion.com', '127.0.0.1', 'Y', '2014-02-16 14:52:30.109+08', '2014-02-16 14:52:30.109+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (425, 'ispadmin', '127.0.0.1', 'Y', '2014-02-16 14:52:48.994+08', '2014-02-16 14:52:48.994+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (426, 'esp@phiorion.com', '127.0.0.1', 'Y', '2014-02-16 14:53:52.639+08', '2014-02-16 14:53:52.639+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (427, 'admin', '127.0.0.1', 'Y', '2014-02-16 15:06:13.216+08', '2014-02-16 15:06:13.216+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (428, 'admin', '127.0.0.1', 'Y', '2014-02-17 14:22:14.934+08', '2014-02-17 14:22:14.934+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (429, 'ironman@gmail.com', '127.0.0.1', 'Y', '2014-02-17 14:55:35.657+08', '2014-02-17 14:55:35.657+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (430, 'ispadmin', '127.0.0.1', 'Y', '2014-02-17 14:55:54.499+08', '2014-02-17 14:55:54.499+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (431, 'ironman@gmail.com', '127.0.0.1', 'Y', '2014-02-17 14:56:19.633+08', '2014-02-17 14:56:19.633+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (432, 'admin', '127.0.0.1', 'Y', '2014-02-17 15:00:37.66+08', '2014-02-17 15:00:37.66+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (433, 'ironman@gmail.com', '127.0.0.1', 'Y', '2014-02-17 15:31:34.877+08', '2014-02-17 15:31:34.877+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (434, 'admin', '127.0.0.1', 'Y', '2014-02-26 09:40:46.654+08', '2014-02-26 09:40:46.654+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (435, 'admin', '127.0.0.1', 'Y', '2014-02-27 13:48:18.995+08', '2014-02-27 13:48:18.995+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (436, 'admin', '127.0.0.1', 'Y', '2014-02-28 09:53:56.131+08', '2014-02-28 09:53:56.131+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (437, 'admin', '127.0.0.1', 'Y', '2014-03-01 11:16:19.357+08', '2014-03-01 11:16:19.357+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (438, 'admin2', '192.168.0.117', 'Y', '2014-03-01 15:38:05.861+08', '2014-03-01 15:38:05.861+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (439, 'admin', '127.0.0.1', 'Y', '2014-03-23 11:22:21.502+08', '2014-03-23 11:22:21.502+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (440, 'admin', '127.0.0.1', 'Y', '2014-03-23 16:37:17.655+08', '2014-03-23 16:37:17.655+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (441, 'admin', '127.0.0.1', 'Y', '2014-03-23 20:02:48.867+08', '2014-03-23 20:02:48.867+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (442, 'admin', '127.0.0.1', 'Y', '2014-03-25 20:43:23.761+08', '2014-03-25 20:43:23.761+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (443, 'admin', '127.0.0.1', 'N', '2014-03-26 18:54:54.858+08', '2014-03-26 18:54:54.858+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (444, 'admin', '127.0.0.1', 'Y', '2014-03-26 18:54:58.551+08', '2014-03-26 18:54:58.551+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (445, 'admin', '127.0.0.1', 'Y', '2014-03-28 07:42:29.948+08', '2014-03-28 07:42:29.948+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (446, 'admin', '127.0.0.1', 'Y', '2014-03-31 17:31:16.949+08', '2014-03-31 17:31:16.949+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (447, 'admin', '127.0.0.1', 'Y', '2014-03-31 17:41:10.627+08', '2014-03-31 17:41:10.627+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (448, 'admin', '127.0.0.1', 'Y', '2014-03-31 17:58:35.099+08', '2014-03-31 17:58:35.099+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (449, 'admin', '127.0.0.1', 'Y', '2014-04-02 09:14:59.471+08', '2014-04-02 09:14:59.471+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (450, 'admin', '127.0.0.1', 'Y', '2014-04-03 10:12:34.749+08', '2014-04-03 10:12:34.749+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (451, 'admin', '127.0.0.1', 'Y', '2014-04-03 21:43:15.846+08', '2014-04-03 21:43:15.846+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (452, 'admin', '127.0.0.1', 'Y', '2014-04-03 21:53:55.524+08', '2014-04-03 21:53:55.524+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (453, 'admin', '127.0.0.1', 'Y', '2014-04-10 09:37:07.046+08', '2014-04-10 09:37:07.046+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (454, 'admin', '127.0.0.1', 'Y', '2014-04-11 09:28:09.319+08', '2014-04-11 09:28:09.319+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (455, 'admin', '127.0.0.1', 'Y', '2014-04-12 11:06:57.422+08', '2014-04-12 11:06:57.422+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (456, 'severus', '127.0.0.1', 'Y', '2014-04-12 11:11:10.794+08', '2014-04-12 11:11:10.794+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (457, 'admin', '127.0.0.1', 'Y', '2014-04-12 11:11:27.138+08', '2014-04-12 11:11:27.138+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (458, 'admin', '192.168.0.105', 'Y', '2014-04-21 22:31:32.482+08', '2014-04-21 22:31:32.482+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (459, 'admin', '127.0.0.1', 'Y', '2014-04-23 09:53:42.491+08', '2014-04-23 09:53:42.491+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (460, 'admin', '127.0.0.1', 'Y', '2014-04-24 11:17:13.437+08', '2014-04-24 11:17:13.437+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (461, 'customer', '127.0.0.1', 'Y', '2014-04-24 15:46:53.098+08', '2014-04-24 15:46:53.098+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (462, 'admin', '127.0.0.1', 'Y', '2014-04-28 09:50:49.284+08', '2014-04-28 09:50:49.284+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (463, 'admin', '127.0.0.1', 'Y', '2014-04-28 14:44:53.291+08', '2014-04-28 14:44:53.291+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (464, 'admin', '127.0.0.1', 'Y', '2014-04-28 14:54:50.946+08', '2014-04-28 14:54:50.946+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (465, 'admin', '127.0.0.1', 'Y', '2014-04-29 19:21:49.298+08', '2014-04-29 19:21:49.298+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (466, 'artist1', '127.0.0.1', 'Y', '2014-04-30 19:24:26.652+08', '2014-04-30 19:24:26.652+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (467, 'admin', '127.0.0.1', 'Y', '2014-04-30 19:24:34.041+08', '2014-04-30 19:24:34.041+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (468, 'artist1', '127.0.0.1', 'Y', '2014-04-30 19:24:56.742+08', '2014-04-30 19:24:56.742+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (469, 'admin', '127.0.0.1', 'Y', '2014-04-30 19:25:06.673+08', '2014-04-30 19:25:06.673+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (470, 'artist1', '127.0.0.1', 'Y', '2014-04-30 19:25:46.503+08', '2014-04-30 19:25:46.503+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (471, 'admin', '127.0.0.1', 'Y', '2014-04-30 19:26:10.567+08', '2014-04-30 19:26:10.567+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (472, 'artist1', '127.0.0.1', 'Y', '2014-04-30 19:27:03.453+08', '2014-04-30 19:27:03.453+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (473, 'admin', '127.0.0.1', 'Y', '2014-04-30 19:27:10.942+08', '2014-04-30 19:27:10.942+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (474, 'artist1', '127.0.0.1', 'Y', '2014-04-30 19:27:31.456+08', '2014-04-30 19:27:31.456+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (475, 'supervisor', '127.0.0.1', 'Y', '2014-04-30 19:28:19.5+08', '2014-04-30 19:28:19.5+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (476, 'artist1', '127.0.0.1', 'Y', '2014-04-30 19:35:31.144+08', '2014-04-30 19:35:31.144+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (477, 'qc', '127.0.0.1', 'Y', '2014-04-30 19:36:04.812+08', '2014-04-30 19:36:04.812+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (478, 'supervisor', '127.0.0.1', 'Y', '2014-04-30 19:36:54.913+08', '2014-04-30 19:36:54.913+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (479, 'admin', '127.0.0.1', 'Y', '2014-04-30 19:37:48.292+08', '2014-04-30 19:37:48.292+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (480, 'artist1', '127.0.0.1', 'Y', '2014-05-01 14:26:25.788+08', '2014-05-01 14:26:25.788+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (481, 'admin', '127.0.0.1', 'Y', '2014-05-01 14:27:23.184+08', '2014-05-01 14:27:23.184+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (482, 'admin', '127.0.0.1', 'Y', '2014-05-01 16:28:41.12+08', '2014-05-01 16:28:41.12+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (483, 'admin2', '127.0.0.1', 'Y', '2014-05-01 17:54:44.547+08', '2014-05-01 17:54:44.547+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (484, 'customer', '127.0.0.1', 'Y', '2014-05-09 09:56:20.449+08', '2014-05-09 09:56:20.449+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (485, 'admin', '192.168.1.2', 'Y', '2014-05-09 22:00:37.02+08', '2014-05-09 22:00:37.02+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (486, 'admin', '192.168.1.2', 'Y', '2014-05-09 23:47:50.532+08', '2014-05-09 23:47:50.532+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (487, 'admin', '192.168.1.2', 'Y', '2014-05-09 23:49:09.856+08', '2014-05-09 23:49:09.856+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (488, 'admin', '127.0.0.1', 'Y', '2014-05-10 16:28:50.901+08', '2014-05-10 16:28:50.901+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (489, 'admin', '127.0.0.1', 'Y', '2014-05-10 21:24:30.195+08', '2014-05-10 21:24:30.195+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (490, 'admin', '127.0.0.1', 'Y', '2014-05-10 21:26:50.955+08', '2014-05-10 21:26:50.955+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (491, 'admin', '192.168.0.106', 'Y', '2014-05-11 14:51:36.435+08', '2014-05-11 14:51:36.435+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (492, 'admin', '::1', 'Y', '2014-05-13 01:11:01.772+08', '2014-05-13 01:11:01.772+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (493, 'admin', '192.168.0.106', 'Y', '2014-05-13 01:11:40.044+08', '2014-05-13 01:11:40.044+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (494, 'admin', '192.168.0.106', 'N', '2014-05-13 12:00:53.723+08', '2014-05-13 12:00:53.723+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (495, 'admin', '192.168.0.106', 'Y', '2014-05-13 12:01:04.548+08', '2014-05-13 12:01:04.548+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (496, 'admin', '::1', 'Y', '2014-05-13 15:15:04.337+08', '2014-05-13 15:15:04.337+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (497, 'admin', '192.168.0.106', 'Y', '2014-05-14 23:46:58.04+08', '2014-05-14 23:46:58.04+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (498, 'admin', '::1', 'Y', '2014-05-16 10:39:56.608+08', '2014-05-16 10:39:56.608+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (499, 'admin', '::1', 'Y', '2014-05-17 10:05:16.692+08', '2014-05-17 10:05:16.692+08', NULL, 'N', NULL);


--
-- TOC entry 2508 (class 0 OID 0)
-- Dependencies: 219
-- Name: fcuserlogin_ul_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcuserlogin_ul_id_seq', 499, true);


--
-- TOC entry 2405 (class 0 OID 24770)
-- Dependencies: 220
-- Data for Name: fcuserorgrole; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fcuserorgrole (uor_id, uor_usrid, uor_orgid, uor_rolid, uor_seq) VALUES (2, 'tony', 1, 2, NULL);
INSERT INTO fcuserorgrole (uor_id, uor_usrid, uor_orgid, uor_rolid, uor_seq) VALUES (3, 'nick', 1, 3, NULL);
INSERT INTO fcuserorgrole (uor_id, uor_usrid, uor_orgid, uor_rolid, uor_seq) VALUES (4, 'natasha', 1, 4, NULL);
INSERT INTO fcuserorgrole (uor_id, uor_usrid, uor_orgid, uor_rolid, uor_seq) VALUES (6, 'lampard7824@gmail.com', 1, 2, 1);
INSERT INTO fcuserorgrole (uor_id, uor_usrid, uor_orgid, uor_rolid, uor_seq) VALUES (11, 'yys1988@gmail.com', 1, 5, 1);
INSERT INTO fcuserorgrole (uor_id, uor_usrid, uor_orgid, uor_rolid, uor_seq) VALUES (17, 'admin', 1, 10, 1);
INSERT INTO fcuserorgrole (uor_id, uor_usrid, uor_orgid, uor_rolid, uor_seq) VALUES (18, 'admin2', 1, 10, 1);
INSERT INTO fcuserorgrole (uor_id, uor_usrid, uor_orgid, uor_rolid, uor_seq) VALUES (19, 'esp@phiorion.com', 1, 2, 1);
INSERT INTO fcuserorgrole (uor_id, uor_usrid, uor_orgid, uor_rolid, uor_seq) VALUES (20, 'danny@phiorion.com', 1, 2, 1);
INSERT INTO fcuserorgrole (uor_id, uor_usrid, uor_orgid, uor_rolid, uor_seq) VALUES (21, 'hongyee@phiorion.com', 1, 2, 1);
INSERT INTO fcuserorgrole (uor_id, uor_usrid, uor_orgid, uor_rolid, uor_seq) VALUES (22, 'fong@phiorion.com', 1, 2, 1);
INSERT INTO fcuserorgrole (uor_id, uor_usrid, uor_orgid, uor_rolid, uor_seq) VALUES (23, 'yow@phiorion.com', 1, 2, 1);
INSERT INTO fcuserorgrole (uor_id, uor_usrid, uor_orgid, uor_rolid, uor_seq) VALUES (26, 'thor@gmail.com', 1, 2, 1);
INSERT INTO fcuserorgrole (uor_id, uor_usrid, uor_orgid, uor_rolid, uor_seq) VALUES (27, 'superman@gmail.com', 1, 2, 1);
INSERT INTO fcuserorgrole (uor_id, uor_usrid, uor_orgid, uor_rolid, uor_seq) VALUES (29, 'harry', 1, 12, 1);
INSERT INTO fcuserorgrole (uor_id, uor_usrid, uor_orgid, uor_rolid, uor_seq) VALUES (30, 'fred', 1, 12, 1);
INSERT INTO fcuserorgrole (uor_id, uor_usrid, uor_orgid, uor_rolid, uor_seq) VALUES (31, 'severus', 1, 13, 1);
INSERT INTO fcuserorgrole (uor_id, uor_usrid, uor_orgid, uor_rolid, uor_seq) VALUES (32, 'albus', 1, 11, 1);
INSERT INTO fcuserorgrole (uor_id, uor_usrid, uor_orgid, uor_rolid, uor_seq) VALUES (33, 'customer', 1, 14, 1);
INSERT INTO fcuserorgrole (uor_id, uor_usrid, uor_orgid, uor_rolid, uor_seq) VALUES (36, 'supervisor', 1, 19, 1);
INSERT INTO fcuserorgrole (uor_id, uor_usrid, uor_orgid, uor_rolid, uor_seq) VALUES (37, 'qc', 1, 18, 1);
INSERT INTO fcuserorgrole (uor_id, uor_usrid, uor_orgid, uor_rolid, uor_seq) VALUES (38, 'artist1', 1, 20, 1);
INSERT INTO fcuserorgrole (uor_id, uor_usrid, uor_orgid, uor_rolid, uor_seq) VALUES (39, 'artist2', 1, 20, 1);


--
-- TOC entry 2509 (class 0 OID 0)
-- Dependencies: 221
-- Name: fcuserorgrole_uor_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcuserorgrole_uor_id_seq', 39, true);


--
-- TOC entry 2407 (class 0 OID 24775)
-- Dependencies: 222
-- Data for Name: fcusersession; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fcusersession (us_id, us_sessid, us_userid, us_ip, us_active, us_created, us_last_active, us_forcecloseby) VALUES (408, '1kkbhl72fl7lktmld4p5d10os0', 'ironman@gmail.com', '127.0.0.1', 'Y', '2014-02-17 15:31:34.882+08', '2014-02-17 15:31:34+08', NULL);
INSERT INTO fcusersession (us_id, us_sessid, us_userid, us_ip, us_active, us_created, us_last_active, us_forcecloseby) VALUES (457, '72dfg6tbh1jd98eifhla9r25i6', 'admin2', '127.0.0.1', 'Y', '2014-05-01 17:54:44.645+08', '2014-05-01 17:54:44+08', NULL);
INSERT INTO fcusersession (us_id, us_sessid, us_userid, us_ip, us_active, us_created, us_last_active, us_forcecloseby) VALUES (458, 'h68n7hesc822jhi1caneg5ghl0', 'customer', '127.0.0.1', 'Y', '2014-05-09 09:56:20.674+08', '2014-05-09 09:56:20+08', NULL);
INSERT INTO fcusersession (us_id, us_sessid, us_userid, us_ip, us_active, us_created, us_last_active, us_forcecloseby) VALUES (472, 'cem50brv0jopf4id9ph2patdi2', 'admin', '::1', 'Y', '2014-05-17 10:05:17.166+08', '2014-05-17 10:05:17+08', NULL);


--
-- TOC entry 2510 (class 0 OID 0)
-- Dependencies: 223
-- Name: fcusersession_us_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcusersession_us_id_seq', 472, true);


--
-- TOC entry 2409 (class 0 OID 24783)
-- Dependencies: 224
-- Data for Name: mcarton; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO mcarton (car_id, car_name) VALUES (5, 'Five panel');
INSERT INTO mcarton (car_id, car_name) VALUES (6, 'HSC');
INSERT INTO mcarton (car_id, car_name) VALUES (33, 'Top 3');


--
-- TOC entry 2511 (class 0 OID 0)
-- Dependencies: 225
-- Name: mcarton_car_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('mcarton_car_id_seq', 33, true);


--
-- TOC entry 2411 (class 0 OID 24788)
-- Dependencies: 226
-- Data for Name: mcartonvariable; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO mcartonvariable (carv_code, carv_unit, carv_carid) VALUES ('x.1', 'mm', 5);
INSERT INTO mcartonvariable (carv_code, carv_unit, carv_carid) VALUES ('x.2', 'mm', 5);
INSERT INTO mcartonvariable (carv_code, carv_unit, carv_carid) VALUES ('x.3', 'mm', 5);
INSERT INTO mcartonvariable (carv_code, carv_unit, carv_carid) VALUES ('x.4', 'mm', 5);
INSERT INTO mcartonvariable (carv_code, carv_unit, carv_carid) VALUES ('x.5', 'mm', 5);
INSERT INTO mcartonvariable (carv_code, carv_unit, carv_carid) VALUES ('y.1', 'mm', 5);
INSERT INTO mcartonvariable (carv_code, carv_unit, carv_carid) VALUES ('y.2', 'mm', 5);
INSERT INTO mcartonvariable (carv_code, carv_unit, carv_carid) VALUES ('y.3', 'mm', 5);
INSERT INTO mcartonvariable (carv_code, carv_unit, carv_carid) VALUES ('x.E', 'mm', 6);
INSERT INTO mcartonvariable (carv_code, carv_unit, carv_carid) VALUES ('x.L1', 'mm', 6);
INSERT INTO mcartonvariable (carv_code, carv_unit, carv_carid) VALUES ('x.W1', 'mm', 6);
INSERT INTO mcartonvariable (carv_code, carv_unit, carv_carid) VALUES ('x.L2', 'mm', 6);
INSERT INTO mcartonvariable (carv_code, carv_unit, carv_carid) VALUES ('x.W2', 'mm', 6);
INSERT INTO mcartonvariable (carv_code, carv_unit, carv_carid) VALUES ('y.T', 'mm', 6);
INSERT INTO mcartonvariable (carv_code, carv_unit, carv_carid) VALUES ('y.H', 'mm', 6);
INSERT INTO mcartonvariable (carv_code, carv_unit, carv_carid) VALUES ('y.B', 'mm', 6);
INSERT INTO mcartonvariable (carv_code, carv_unit, carv_carid) VALUES ('x.1', 'mm', 33);
INSERT INTO mcartonvariable (carv_code, carv_unit, carv_carid) VALUES ('x.2', 'mm', 33);
INSERT INTO mcartonvariable (carv_code, carv_unit, carv_carid) VALUES ('x.3', 'mm', 33);
INSERT INTO mcartonvariable (carv_code, carv_unit, carv_carid) VALUES ('y.1', 'mm', 33);
INSERT INTO mcartonvariable (carv_code, carv_unit, carv_carid) VALUES ('y.2', 'mm', 33);
INSERT INTO mcartonvariable (carv_code, carv_unit, carv_carid) VALUES ('y.3', 'mm', 33);


--
-- TOC entry 2412 (class 0 OID 24791)
-- Dependencies: 227
-- Data for Name: mjobcat; Type: TABLE DATA; Schema: pnd; Owner: pnd
--



--
-- TOC entry 2512 (class 0 OID 0)
-- Dependencies: 228
-- Name: mjobcat_jc_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('mjobcat_jc_id_seq', 1, false);


--
-- TOC entry 2414 (class 0 OID 24796)
-- Dependencies: 229
-- Data for Name: mjobcatlookup; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO mjobcatlookup (jcl_id, jcl_title, jcl_requiretime, jcl_sequence) VALUES (1, 'Typing', 20, 100);
INSERT INTO mjobcatlookup (jcl_id, jcl_title, jcl_requiretime, jcl_sequence) VALUES (3, 'Monotone editing', 50, 300);
INSERT INTO mjobcatlookup (jcl_id, jcl_title, jcl_requiretime, jcl_sequence) VALUES (2, 'Drawing', 30, 200);
INSERT INTO mjobcatlookup (jcl_id, jcl_title, jcl_requiretime, jcl_sequence) VALUES (4, 'Trapping', 100, 400);
INSERT INTO mjobcatlookup (jcl_id, jcl_title, jcl_requiretime, jcl_sequence) VALUES (5, 'Artwork Seperation', 100, 500);
INSERT INTO mjobcatlookup (jcl_id, jcl_title, jcl_requiretime, jcl_sequence) VALUES (6, 'Barcode scan', 60, 600);
INSERT INTO mjobcatlookup (jcl_id, jcl_title, jcl_requiretime, jcl_sequence) VALUES (7, 'Drawing varnish part', 60, 700);
INSERT INTO mjobcatlookup (jcl_id, jcl_title, jcl_requiretime, jcl_sequence) VALUES (8, 'Master card', 30, 800);


--
-- TOC entry 2513 (class 0 OID 0)
-- Dependencies: 230
-- Name: mjobcatlookup_jcl_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('mjobcatlookup_jcl_id_seq', 8, true);


--
-- TOC entry 2416 (class 0 OID 24801)
-- Dependencies: 231
-- Data for Name: mjobsheet; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO mjobsheet (js_id, js_cuid, js_ctid, js_request_date, js_request_by, js_title, js_model, js_description, js_material_provided, js_color_1, js_color_2, js_color_3, js_color_4, js_angle_1, js_angle_2, js_angle_3, js_angle_4, js_bleeding, js_bleeding_remark, js_carcode, js_distortion, js_distortion_value, js_diecut_ind, js_diecut_no, js_category, js_trapping_size, js_barcodetype, js_barcodenumber, js_primcat, js_status, js_completiondate, js_assignto) VALUES (144, 2, 1, '2014-05-08 14:11:02.524+08', NULL, 'Title 2', 'Model 2', 'Description 2', NULL, '60', '9', '89', '39', '357', '203', '14', '154', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 'QC', '2014-05-08 15:11:02.524+08', 'artist1');
INSERT INTO mjobsheet (js_id, js_cuid, js_ctid, js_request_date, js_request_by, js_title, js_model, js_description, js_material_provided, js_color_1, js_color_2, js_color_3, js_color_4, js_angle_1, js_angle_2, js_angle_3, js_angle_4, js_bleeding, js_bleeding_remark, js_carcode, js_distortion, js_distortion_value, js_diecut_ind, js_diecut_no, js_category, js_trapping_size, js_barcodetype, js_barcodenumber, js_primcat, js_status, js_completiondate, js_assignto) VALUES (145, 3, 2, '2014-05-08 16:11:02.524+08', NULL, 'Title 3', 'Model 3', 'Description 3', NULL, '23', '12', '90', '16', '344', '331', '343', '82', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 'QC', NULL, 'artist1');
INSERT INTO mjobsheet (js_id, js_cuid, js_ctid, js_request_date, js_request_by, js_title, js_model, js_description, js_material_provided, js_color_1, js_color_2, js_color_3, js_color_4, js_angle_1, js_angle_2, js_angle_3, js_angle_4, js_bleeding, js_bleeding_remark, js_carcode, js_distortion, js_distortion_value, js_diecut_ind, js_diecut_no, js_category, js_trapping_size, js_barcodetype, js_barcodenumber, js_primcat, js_status, js_completiondate, js_assignto) VALUES (146, 4, 3, '2014-05-08 15:11:02.524+08', NULL, 'Title 4', 'Model 4', 'Description 4', NULL, '23', '83', '41', '83', '331', '339', '57', '3', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'CUSTOMER ACCEPTANCE', NULL, 'artist2');
INSERT INTO mjobsheet (js_id, js_cuid, js_ctid, js_request_date, js_request_by, js_title, js_model, js_description, js_material_provided, js_color_1, js_color_2, js_color_3, js_color_4, js_angle_1, js_angle_2, js_angle_3, js_angle_4, js_bleeding, js_bleeding_remark, js_carcode, js_distortion, js_distortion_value, js_diecut_ind, js_diecut_no, js_category, js_trapping_size, js_barcodetype, js_barcodenumber, js_primcat, js_status, js_completiondate, js_assignto) VALUES (147, 4, 3, '2014-05-08 17:11:02.524+08', NULL, 'Title 4', 'Model 4', 'Description 4', NULL, '71', '15', '96', '4', '27', '95', '57', '164', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 'ACKNOLWEDGE', NULL, 'artist2');
INSERT INTO mjobsheet (js_id, js_cuid, js_ctid, js_request_date, js_request_by, js_title, js_model, js_description, js_material_provided, js_color_1, js_color_2, js_color_3, js_color_4, js_angle_1, js_angle_2, js_angle_3, js_angle_4, js_bleeding, js_bleeding_remark, js_carcode, js_distortion, js_distortion_value, js_diecut_ind, js_diecut_no, js_category, js_trapping_size, js_barcodetype, js_barcodenumber, js_primcat, js_status, js_completiondate, js_assignto) VALUES (148, 5, 4, '2014-05-08 17:41:02.524+08', NULL, 'Title 5', 'Model 5', 'Description 5', NULL, '2', '74', '38', '64', '230', '198', '149', '345', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 'ACKNOLWEDGE', NULL, 'artist1');
INSERT INTO mjobsheet (js_id, js_cuid, js_ctid, js_request_date, js_request_by, js_title, js_model, js_description, js_material_provided, js_color_1, js_color_2, js_color_3, js_color_4, js_angle_1, js_angle_2, js_angle_3, js_angle_4, js_bleeding, js_bleeding_remark, js_carcode, js_distortion, js_distortion_value, js_diecut_ind, js_diecut_no, js_category, js_trapping_size, js_barcodetype, js_barcodenumber, js_primcat, js_status, js_completiondate, js_assignto) VALUES (149, 6, 5, '2014-05-08 17:51:02.524+08', NULL, 'Title 6', 'Model 6', 'Description 6', NULL, '87', '21', '31', '36', '291', '160', '55', '244', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 'ASSIGNED', NULL, 'artist2');
INSERT INTO mjobsheet (js_id, js_cuid, js_ctid, js_request_date, js_request_by, js_title, js_model, js_description, js_material_provided, js_color_1, js_color_2, js_color_3, js_color_4, js_angle_1, js_angle_2, js_angle_3, js_angle_4, js_bleeding, js_bleeding_remark, js_carcode, js_distortion, js_distortion_value, js_diecut_ind, js_diecut_no, js_category, js_trapping_size, js_barcodetype, js_barcodenumber, js_primcat, js_status, js_completiondate, js_assignto) VALUES (150, 7, 6, '2014-05-08 17:01:02.524+08', NULL, 'Title 7', 'Model 7', 'Description 7', NULL, '40', '59', '63', '1', '206', '92', '261', '117', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'ASSIGNED', NULL, 'artist2');
INSERT INTO mjobsheet (js_id, js_cuid, js_ctid, js_request_date, js_request_by, js_title, js_model, js_description, js_material_provided, js_color_1, js_color_2, js_color_3, js_color_4, js_angle_1, js_angle_2, js_angle_3, js_angle_4, js_bleeding, js_bleeding_remark, js_carcode, js_distortion, js_distortion_value, js_diecut_ind, js_diecut_no, js_category, js_trapping_size, js_barcodetype, js_barcodenumber, js_primcat, js_status, js_completiondate, js_assignto) VALUES (151, 8, 7, '2014-05-08 18:11:02.524+08', NULL, 'New job', 'new job model ', 'Description of new job', NULL, '52', '21', '11', '13', '7', '201', '39', '308', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 'NEWJOB', NULL, NULL);
INSERT INTO mjobsheet (js_id, js_cuid, js_ctid, js_request_date, js_request_by, js_title, js_model, js_description, js_material_provided, js_color_1, js_color_2, js_color_3, js_color_4, js_angle_1, js_angle_2, js_angle_3, js_angle_4, js_bleeding, js_bleeding_remark, js_carcode, js_distortion, js_distortion_value, js_diecut_ind, js_diecut_no, js_category, js_trapping_size, js_barcodetype, js_barcodenumber, js_primcat, js_status, js_completiondate, js_assignto) VALUES (152, 5, 4, '2014-05-08 18:11:02.524+08', NULL, 'New job 9', 'new job model 9', 'Description of new job 9', NULL, '1', '49', '46', '60', '182', '180', '270', '237', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 'NEWJOB', NULL, NULL);
INSERT INTO mjobsheet (js_id, js_cuid, js_ctid, js_request_date, js_request_by, js_title, js_model, js_description, js_material_provided, js_color_1, js_color_2, js_color_3, js_color_4, js_angle_1, js_angle_2, js_angle_3, js_angle_4, js_bleeding, js_bleeding_remark, js_carcode, js_distortion, js_distortion_value, js_diecut_ind, js_diecut_no, js_category, js_trapping_size, js_barcodetype, js_barcodenumber, js_primcat, js_status, js_completiondate, js_assignto) VALUES (153, 4, 3, '2014-05-08 18:11:02.524+08', NULL, 'Revert job ', 'Revert job ', 'Description of revert job ', NULL, '87', '18', '20', '44', '130', '274', '336', '253', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 'REVERT', NULL, NULL);


--
-- TOC entry 2514 (class 0 OID 0)
-- Dependencies: 232
-- Name: mjobsheet_js_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('mjobsheet_js_id_seq', 153, true);


--
-- TOC entry 2418 (class 0 OID 24810)
-- Dependencies: 233
-- Data for Name: mjscartonvalue; Type: TABLE DATA; Schema: pnd; Owner: pnd
--



--
-- TOC entry 2515 (class 0 OID 0)
-- Dependencies: 234
-- Name: mjscartonvalue_caval_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('mjscartonvalue_caval_id_seq', 1, false);


--
-- TOC entry 2420 (class 0 OID 24815)
-- Dependencies: 235
-- Data for Name: pndaddress; Type: TABLE DATA; Schema: pnd; Owner: pnd
--



--
-- TOC entry 2516 (class 0 OID 0)
-- Dependencies: 236
-- Name: pndaddress_ad_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('pndaddress_ad_id_seq', 1, false);


--
-- TOC entry 2422 (class 0 OID 24825)
-- Dependencies: 237
-- Data for Name: pndartistskill; Type: TABLE DATA; Schema: pnd; Owner: pnd
--



--
-- TOC entry 2423 (class 0 OID 24828)
-- Dependencies: 238
-- Data for Name: pndcontact; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO pndcontact (ct_id, ct_refid, ct_reftype, ct_name, ct_email) VALUES (1, 2, 'ORG_ID', 'Danny', 'danny@gmail.com');
INSERT INTO pndcontact (ct_id, ct_refid, ct_reftype, ct_name, ct_email) VALUES (2, 3, 'ORG_ID', 'Jeremy', 'jeremy@gmail.com');
INSERT INTO pndcontact (ct_id, ct_refid, ct_reftype, ct_name, ct_email) VALUES (3, 4, 'ORG_ID', 'Mohamad', 'mohamad@gmail.com');
INSERT INTO pndcontact (ct_id, ct_refid, ct_reftype, ct_name, ct_email) VALUES (4, 5, 'ORG_ID', 'Justin', 'justin@gmail.com');
INSERT INTO pndcontact (ct_id, ct_refid, ct_reftype, ct_name, ct_email) VALUES (5, 6, 'ORG_ID', 'Alvin', 'alvin@gmail.com');
INSERT INTO pndcontact (ct_id, ct_refid, ct_reftype, ct_name, ct_email) VALUES (6, 7, 'ORG_ID', 'Tracy', 'tracy@gmail.com');


--
-- TOC entry 2517 (class 0 OID 0)
-- Dependencies: 239
-- Name: pndcontact_ct_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('pndcontact_ct_id_seq', 6, true);


--
-- TOC entry 2425 (class 0 OID 24833)
-- Dependencies: 240
-- Data for Name: pndphone; Type: TABLE DATA; Schema: pnd; Owner: pnd
--



--
-- TOC entry 2518 (class 0 OID 0)
-- Dependencies: 241
-- Name: pndphone_ph_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('pndphone_ph_id_seq', 1, false);


--
-- TOC entry 2153 (class 2606 OID 24875)
-- Name: const_fcdoc_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcdoc
    ADD CONSTRAINT const_fcdoc_prikey PRIMARY KEY (fd_id);


--
-- TOC entry 2155 (class 2606 OID 24877)
-- Name: const_fclang_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fclang
    ADD CONSTRAINT const_fclang_prikey PRIMARY KEY (lang_code);


--
-- TOC entry 2242 (class 2606 OID 25531)
-- Name: const_fclocale_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fclocale
    ADD CONSTRAINT const_fclocale_prikey PRIMARY KEY (lc_code);


--
-- TOC entry 2244 (class 2606 OID 25540)
-- Name: const_fclocaleholiday_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fclocaleholiday
    ADD CONSTRAINT const_fclocaleholiday_prikey PRIMARY KEY (lch_id);


--
-- TOC entry 2246 (class 2606 OID 25554)
-- Name: const_fclocaleworkinghour_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fclocaleworkinghour
    ADD CONSTRAINT const_fclocaleworkinghour_prikey PRIMARY KEY (lcw_id);


--
-- TOC entry 2248 (class 2606 OID 25556)
-- Name: const_fclocaleworkinghour_unikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fclocaleworkinghour
    ADD CONSTRAINT const_fclocaleworkinghour_unikey UNIQUE (lcw_lccode, lcw_day);


--
-- TOC entry 2157 (class 2606 OID 24879)
-- Name: const_fclog_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fclog
    ADD CONSTRAINT const_fclog_prikey PRIMARY KEY (log_id);


--
-- TOC entry 2169 (class 2606 OID 24881)
-- Name: const_fcpermission_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpermission
    ADD CONSTRAINT const_fcpermission_prikey PRIMARY KEY (pms_code);


--
-- TOC entry 2171 (class 2606 OID 24883)
-- Name: const_fcpmactivity_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpmactivity
    ADD CONSTRAINT const_fcpmactivity_prikey PRIMARY KEY (pmat_id);


--
-- TOC entry 2173 (class 2606 OID 24885)
-- Name: const_fcpmcase_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpmcase
    ADD CONSTRAINT const_fcpmcase_prikey PRIMARY KEY (pmc_id);


--
-- TOC entry 2175 (class 2606 OID 24887)
-- Name: const_fcpmcasecomment_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpmcasecomment
    ADD CONSTRAINT const_fcpmcasecomment_prikey PRIMARY KEY (pmcc_id);


--
-- TOC entry 2177 (class 2606 OID 24889)
-- Name: const_fcpmcasecommentread_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpmcasecommentread
    ADD CONSTRAINT const_fcpmcasecommentread_prikey PRIMARY KEY (pmcr_id);


--
-- TOC entry 2179 (class 2606 OID 24891)
-- Name: const_fcpmcasecommentread_unikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpmcasecommentread
    ADD CONSTRAINT const_fcpmcasecommentread_unikey UNIQUE (pmcr_pmccid, pmcr_read_by);


--
-- TOC entry 2238 (class 2606 OID 25496)
-- Name: const_fcpmcaseflag_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpmcaseflag
    ADD CONSTRAINT const_fcpmcaseflag_prikey PRIMARY KEY (pmcf_id);


--
-- TOC entry 2240 (class 2606 OID 25498)
-- Name: const_fcpmcaseflag_unikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpmcaseflag
    ADD CONSTRAINT const_fcpmcaseflag_unikey UNIQUE (pmcf_pmcid, pmcf_flag_by);


--
-- TOC entry 2181 (class 2606 OID 24893)
-- Name: const_fcpmcaseflow_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpmcaseflow
    ADD CONSTRAINT const_fcpmcaseflow_prikey PRIMARY KEY (pmf_id);


--
-- TOC entry 2183 (class 2606 OID 24895)
-- Name: const_fcpmcasetype_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpmcasetype
    ADD CONSTRAINT const_fcpmcasetype_prikey PRIMARY KEY (pmct_code);


--
-- TOC entry 2185 (class 2606 OID 24897)
-- Name: const_fcpmconnector_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpmconnector
    ADD CONSTRAINT const_fcpmconnector_prikey PRIMARY KEY (pmcn_id);


--
-- TOC entry 2187 (class 2606 OID 24899)
-- Name: const_fcpmconnector_unikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpmconnector
    ADD CONSTRAINT const_fcpmconnector_unikey UNIQUE (pmcn_from_type, pmcn_from_id, pmcn_to_type, pmcn_to_id);


--
-- TOC entry 2189 (class 2606 OID 24901)
-- Name: const_fcpmevent_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpmevent
    ADD CONSTRAINT const_fcpmevent_prikey PRIMARY KEY (pmev_id);


--
-- TOC entry 2191 (class 2606 OID 24903)
-- Name: const_fcpmgateway_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpmgateway
    ADD CONSTRAINT const_fcpmgateway_prikey PRIMARY KEY (pmgw_id);


--
-- TOC entry 2193 (class 2606 OID 24905)
-- Name: const_fcpmswimlane_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpmswimlane
    ADD CONSTRAINT const_fcpmswimlane_prikey PRIMARY KEY (pmsl_id);


--
-- TOC entry 2195 (class 2606 OID 24907)
-- Name: const_fcpmworkflow_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpmworkflow
    ADD CONSTRAINT const_fcpmworkflow_prikey PRIMARY KEY (pmwf_id);


--
-- TOC entry 2203 (class 2606 OID 24909)
-- Name: const_fcrule_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcrule
    ADD CONSTRAINT const_fcrule_prikey PRIMARY KEY (ru_id);


--
-- TOC entry 2210 (class 2606 OID 24911)
-- Name: const_fcudv_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcudv
    ADD CONSTRAINT const_fcudv_prikey PRIMARY KEY (udv_code);


--
-- TOC entry 2214 (class 2606 OID 24913)
-- Name: const_fcuserdiary_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcuserdiary
    ADD CONSTRAINT const_fcuserdiary_prikey PRIMARY KEY (di_id);


--
-- TOC entry 2159 (class 2606 OID 24915)
-- Name: const_hlookup_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fclookup
    ADD CONSTRAINT const_hlookup_prikey PRIMARY KEY (lu_id);


--
-- TOC entry 2161 (class 2606 OID 24917)
-- Name: const_hlookup_unikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fclookup
    ADD CONSTRAINT const_hlookup_unikey UNIQUE (lu_cat, lu_code);


--
-- TOC entry 2226 (class 2606 OID 24919)
-- Name: const_mcarton_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY mcarton
    ADD CONSTRAINT const_mcarton_prikey PRIMARY KEY (car_id);


--
-- TOC entry 2228 (class 2606 OID 24921)
-- Name: const_mjobcat_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY mjobcat
    ADD CONSTRAINT const_mjobcat_prikey PRIMARY KEY (jc_id);


--
-- TOC entry 2232 (class 2606 OID 24923)
-- Name: const_mjobsheet_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY mjobsheet
    ADD CONSTRAINT const_mjobsheet_prikey PRIMARY KEY (js_id);


--
-- TOC entry 2234 (class 2606 OID 24925)
-- Name: const_mjscartonvalue_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY mjscartonvalue
    ADD CONSTRAINT const_mjscartonvalue_prikey PRIMARY KEY (caval_id);


--
-- TOC entry 2236 (class 2606 OID 24927)
-- Name: const_pndcontact_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY pndcontact
    ADD CONSTRAINT const_pndcontact_prikey PRIMARY KEY (ct_id);


--
-- TOC entry 2163 (class 2606 OID 24929)
-- Name: const_vmenu_prikey; Type: CONSTRAINT; Schema: pnd; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY fcmenu
    ADD CONSTRAINT const_vmenu_prikey PRIMARY KEY (mn_id);


--
-- TOC entry 2165 (class 2606 OID 24931)
-- Name: const_vmenu_unikey; Type: CONSTRAINT; Schema: pnd; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY fcmenu
    ADD CONSTRAINT const_vmenu_unikey UNIQUE (mn_code);


--
-- TOC entry 2167 (class 2606 OID 24933)
-- Name: const_vorg_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcorg
    ADD CONSTRAINT const_vorg_prikey PRIMARY KEY (org_id);


--
-- TOC entry 2197 (class 2606 OID 24935)
-- Name: const_vrole_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcrole
    ADD CONSTRAINT const_vrole_prikey PRIMARY KEY (rol_id);


--
-- TOC entry 2199 (class 2606 OID 24937)
-- Name: const_vroleperm_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcroleperm
    ADD CONSTRAINT const_vroleperm_prikey PRIMARY KEY (rp_id);


--
-- TOC entry 2201 (class 2606 OID 24939)
-- Name: const_vroleperm_unikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcroleperm
    ADD CONSTRAINT const_vroleperm_unikey UNIQUE (rp_rolid, rp_pmscode);


--
-- TOC entry 2205 (class 2606 OID 24941)
-- Name: const_vsetting_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcsetting
    ADD CONSTRAINT const_vsetting_prikey PRIMARY KEY (set_id);


--
-- TOC entry 2207 (class 2606 OID 24943)
-- Name: const_vsetting_unikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcsetting
    ADD CONSTRAINT const_vsetting_unikey UNIQUE (set_user, set_code);


--
-- TOC entry 2212 (class 2606 OID 24945)
-- Name: const_vuser_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcuser
    ADD CONSTRAINT const_vuser_prikey PRIMARY KEY (usr_userid);


--
-- TOC entry 2216 (class 2606 OID 24947)
-- Name: const_vuserlogin_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcuserlogin
    ADD CONSTRAINT const_vuserlogin_prikey PRIMARY KEY (ul_id);


--
-- TOC entry 2218 (class 2606 OID 24949)
-- Name: const_vuserorgrole_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcuserorgrole
    ADD CONSTRAINT const_vuserorgrole_prikey PRIMARY KEY (uor_id);


--
-- TOC entry 2220 (class 2606 OID 24951)
-- Name: const_vuserorgrole_unikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcuserorgrole
    ADD CONSTRAINT const_vuserorgrole_unikey UNIQUE (uor_usrid, uor_orgid, uor_rolid);


--
-- TOC entry 2222 (class 2606 OID 24953)
-- Name: const_vusersession_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcusersession
    ADD CONSTRAINT const_vusersession_prikey PRIMARY KEY (us_id);


--
-- TOC entry 2230 (class 2606 OID 24955)
-- Name: cont_mjobcatlookup_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY mjobcatlookup
    ADD CONSTRAINT cont_mjobcatlookup_prikey PRIMARY KEY (jcl_id);


--
-- TOC entry 2151 (class 2606 OID 24957)
-- Name: country_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fccountry
    ADD CONSTRAINT country_prikey PRIMARY KEY (con_code);


--
-- TOC entry 2208 (class 1259 OID 24958)
-- Name: idx_vsetting_code_user; Type: INDEX; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE UNIQUE INDEX idx_vsetting_code_user ON fcsetting USING btree (set_user, set_code);


--
-- TOC entry 2223 (class 1259 OID 24959)
-- Name: usersession_idx1; Type: INDEX; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE INDEX usersession_idx1 ON fcusersession USING btree (us_sessid);


--
-- TOC entry 2224 (class 1259 OID 24960)
-- Name: usersession_idx2; Type: INDEX; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE INDEX usersession_idx2 ON fcusersession USING btree (us_userid);


-- Completed on 2014-05-17 15:55:27

--
-- PostgreSQL database dump complete
--

