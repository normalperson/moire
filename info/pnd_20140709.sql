--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.4
-- Dumped by pg_dump version 9.3.4
-- Started on 2014-07-09 16:44:13

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 9 (class 2615 OID 51543)
-- Name: pnd; Type: SCHEMA; Schema: -; Owner: pnd
--

CREATE SCHEMA pnd;


ALTER SCHEMA pnd OWNER TO pnd;

SET search_path = pnd, pg_catalog;

--
-- TOC entry 549 (class 1255 OID 51544)
-- Name: cleanup(); Type: FUNCTION; Schema: pnd; Owner: pnd
--

CREATE FUNCTION cleanup() RETURNS void
    LANGUAGE plpgsql STRICT
    AS $$
BEGIN
    delete from fcpmcase;
    delete from fcpmcaseflow;
    delete from fcpmcasecomment;    
    delete from fcpmcasecommentread;
    delete from fcpmcaseflag;
    delete from fcpmcaseflowassign;
    delete from mjobcat;
    delete from mjobsheet;
    delete from mjoboutput;
    delete from fcdoc;
    delete from mjscartonvalue;
    
    
END;
$$;


ALTER FUNCTION pnd.cleanup() OWNER TO pnd;

--
-- TOC entry 545 (class 1255 OID 51545)
-- Name: date_to_char(timestamp without time zone); Type: FUNCTION; Schema: pnd; Owner: pnd
--

CREATE FUNCTION date_to_char(timefield timestamp without time zone) RETURNS text
    LANGUAGE sql IMMUTABLE
    AS $_$
    select to_char($1, 'Mon-YYYY');
$_$;


ALTER FUNCTION pnd.date_to_char(timefield timestamp without time zone) OWNER TO pnd;

--
-- TOC entry 546 (class 1255 OID 51546)
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
-- TOC entry 550 (class 1255 OID 51547)
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

--
-- TOC entry 551 (class 1255 OID 51548)
-- Name: getreqtimebyjob(integer, text); Type: FUNCTION; Schema: pnd; Owner: pnd
--

CREATE FUNCTION getreqtimebyjob(jobid integer, chktype text DEFAULT 'DEFAULT'::text) RETURNS integer
    LANGUAGE plpgsql STRICT
    AS $$
DECLARE
    totalminutes integer;
BEGIN
	if chktype = 'DEFAULT' then
	    select sum(jcl_requiretime) into totalminutes from mjobcat join mjobcatlookup on jc_jclid = jcl_id
	    where jc_jsid = jobid;
	ELSIF  chktype = 'REASSIGN' then
	    select sum(jcl_requiretime)/3 into totalminutes from mjobcat join mjobcatlookup on jc_jclid = jcl_id
	    where jc_jsid = jobid;
	end if;

	return totalminutes;
END;
$$;


ALTER FUNCTION pnd.getreqtimebyjob(jobid integer, chktype text) OWNER TO pnd;

--
-- TOC entry 552 (class 1255 OID 51549)
-- Name: update_requestdate(); Type: FUNCTION; Schema: pnd; Owner: pnd
--

CREATE FUNCTION update_requestdate() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    BEGIN
	NEW.js_request_dateinmth = TO_CHAR(NEW.js_request_date,'Mon-YYYY');
        RETURN NEW;
    END;
$$;


ALTER FUNCTION pnd.update_requestdate() OWNER TO pnd;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 410 (class 1259 OID 51550)
-- Name: fccountry; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE fccountry (
    con_code character varying(24) NOT NULL,
    con_name character varying(1000)
);


ALTER TABLE pnd.fccountry OWNER TO pnd;

--
-- TOC entry 411 (class 1259 OID 51556)
-- Name: fcdbaudit; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE fcdbaudit (
    dba_id integer NOT NULL,
    dba_created timestamp with time zone DEFAULT now(),
    dba_userid character varying(50),
    dba_table character varying(64),
    dba_column character varying(64),
    dba_oldvalue character varying(4000),
    dba_newvalue character varying(4000),
    dba_keys character varying(1000),
    dba_key1 character varying(200),
    dba_key2 character varying(200),
    dba_key3 character varying(200),
    dba_key4 character varying(200),
    dba_key5 character varying(200)
);


ALTER TABLE pnd.fcdbaudit OWNER TO pnd;

--
-- TOC entry 412 (class 1259 OID 51563)
-- Name: fcdbaudit_dba_id_seq; Type: SEQUENCE; Schema: pnd; Owner: pnd
--

CREATE SEQUENCE fcdbaudit_dba_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd.fcdbaudit_dba_id_seq OWNER TO pnd;

--
-- TOC entry 3349 (class 0 OID 0)
-- Dependencies: 412
-- Name: fcdbaudit_dba_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcdbaudit_dba_id_seq OWNED BY fcdbaudit.dba_id;


--
-- TOC entry 413 (class 1259 OID 51565)
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
-- TOC entry 414 (class 1259 OID 51572)
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
-- TOC entry 3350 (class 0 OID 0)
-- Dependencies: 414
-- Name: fcdoc_fd_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcdoc_fd_id_seq OWNED BY fcdoc.fd_id;


--
-- TOC entry 415 (class 1259 OID 51574)
-- Name: fcemailsetting; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE fcemailsetting (
    ms_id integer NOT NULL,
    ms_type character varying(50) DEFAULT 'MAILOUT'::character varying,
    ms_hostname character varying(200),
    ms_port character varying(12),
    ms_username character varying(100),
    ms_password character varying(100)
);


ALTER TABLE pnd.fcemailsetting OWNER TO pnd;

--
-- TOC entry 3351 (class 0 OID 0)
-- Dependencies: 415
-- Name: COLUMN fcemailsetting.ms_type; Type: COMMENT; Schema: pnd; Owner: pnd
--

COMMENT ON COLUMN fcemailsetting.ms_type IS 'MAILOUT = send out
MAILIN = receive';


--
-- TOC entry 416 (class 1259 OID 51578)
-- Name: fcemailsetting_ms_id_seq; Type: SEQUENCE; Schema: pnd; Owner: pnd
--

CREATE SEQUENCE fcemailsetting_ms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd.fcemailsetting_ms_id_seq OWNER TO pnd;

--
-- TOC entry 3352 (class 0 OID 0)
-- Dependencies: 416
-- Name: fcemailsetting_ms_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcemailsetting_ms_id_seq OWNED BY fcemailsetting.ms_id;


--
-- TOC entry 417 (class 1259 OID 51580)
-- Name: fclang; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE fclang (
    lang_code character varying(5) NOT NULL,
    lang_name character varying(200),
    lang_status character varying(12) DEFAULT 'ACTIVE'::character varying
);


ALTER TABLE pnd.fclang OWNER TO pnd;

--
-- TOC entry 3353 (class 0 OID 0)
-- Dependencies: 417
-- Name: TABLE fclang; Type: COMMENT; Schema: pnd; Owner: pnd
--

COMMENT ON TABLE fclang IS 'ISO 639-1';


--
-- TOC entry 418 (class 1259 OID 51584)
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
-- TOC entry 419 (class 1259 OID 51587)
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
-- TOC entry 420 (class 1259 OID 51591)
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
-- TOC entry 3354 (class 0 OID 0)
-- Dependencies: 420
-- Name: fclocaleholiday_lch_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fclocaleholiday_lch_id_seq OWNED BY fclocaleholiday.lch_id;


--
-- TOC entry 421 (class 1259 OID 51593)
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
-- TOC entry 422 (class 1259 OID 51596)
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
-- TOC entry 3355 (class 0 OID 0)
-- Dependencies: 422
-- Name: fclocaleworkinghour_lcw_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fclocaleworkinghour_lcw_id_seq OWNED BY fclocaleworkinghour.lcw_id;


--
-- TOC entry 423 (class 1259 OID 51598)
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
-- TOC entry 424 (class 1259 OID 51605)
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
-- TOC entry 3356 (class 0 OID 0)
-- Dependencies: 424
-- Name: fclog_log_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fclog_log_id_seq OWNED BY fclog.log_id;


--
-- TOC entry 425 (class 1259 OID 51607)
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
-- TOC entry 426 (class 1259 OID 51612)
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
-- TOC entry 3357 (class 0 OID 0)
-- Dependencies: 426
-- Name: fclookup_lu_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fclookup_lu_id_seq OWNED BY fclookup.lu_id;


--
-- TOC entry 427 (class 1259 OID 51614)
-- Name: fcmenu; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
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
    mn_pmscode character varying(50),
    mn_icon_class character varying(100)
);


ALTER TABLE pnd.fcmenu OWNER TO pnd;

--
-- TOC entry 428 (class 1259 OID 51621)
-- Name: fcmenu_mn_id_seq; Type: SEQUENCE; Schema: pnd; Owner: pnd
--

CREATE SEQUENCE fcmenu_mn_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd.fcmenu_mn_id_seq OWNER TO pnd;

--
-- TOC entry 3358 (class 0 OID 0)
-- Dependencies: 428
-- Name: fcmenu_mn_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcmenu_mn_id_seq OWNED BY fcmenu.mn_id;


--
-- TOC entry 429 (class 1259 OID 51623)
-- Name: fcmenu_mn_parentid_seq; Type: SEQUENCE; Schema: pnd; Owner: pnd
--

CREATE SEQUENCE fcmenu_mn_parentid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd.fcmenu_mn_parentid_seq OWNER TO pnd;

--
-- TOC entry 3359 (class 0 OID 0)
-- Dependencies: 429
-- Name: fcmenu_mn_parentid_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcmenu_mn_parentid_seq OWNED BY fcmenu.mn_parentid;


--
-- TOC entry 430 (class 1259 OID 51625)
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
    org_lccode character varying(32),
    org_concode character varying(24)
);


ALTER TABLE pnd.fcorg OWNER TO pnd;

--
-- TOC entry 3360 (class 0 OID 0)
-- Dependencies: 430
-- Name: COLUMN fcorg.org_lccode; Type: COMMENT; Schema: pnd; Owner: pnd
--

COMMENT ON COLUMN fcorg.org_lccode IS 'Locale';


--
-- TOC entry 431 (class 1259 OID 51634)
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
-- TOC entry 3361 (class 0 OID 0)
-- Dependencies: 431
-- Name: fcorg_org_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcorg_org_id_seq OWNED BY fcorg.org_id;


--
-- TOC entry 432 (class 1259 OID 51636)
-- Name: fcpermission; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE fcpermission (
    pms_code character varying(50) NOT NULL,
    pms_desc character varying(2000)
);


ALTER TABLE pnd.fcpermission OWNER TO pnd;

--
-- TOC entry 433 (class 1259 OID 51642)
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
-- TOC entry 434 (class 1259 OID 51644)
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
    pmat_show_caseinfo character varying(1) DEFAULT 'N'::character varying,
    pmat_performed_message character varying(2000)
);


ALTER TABLE pnd.fcpmactivity OWNER TO pnd;

--
-- TOC entry 3362 (class 0 OID 0)
-- Dependencies: 434
-- Name: COLUMN fcpmactivity.pmat_sla_interval; Type: COMMENT; Schema: pnd; Owner: pnd
--

COMMENT ON COLUMN fcpmactivity.pmat_sla_interval IS 'format follow PHP DateInterval interval_spec';


--
-- TOC entry 435 (class 1259 OID 51653)
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
-- TOC entry 436 (class 1259 OID 51657)
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
-- TOC entry 3363 (class 0 OID 0)
-- Dependencies: 436
-- Name: fcpmcase_pmc_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcpmcase_pmc_id_seq OWNED BY fcpmcase.pmc_id;


--
-- TOC entry 437 (class 1259 OID 51659)
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
-- TOC entry 438 (class 1259 OID 51667)
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
-- TOC entry 3364 (class 0 OID 0)
-- Dependencies: 438
-- Name: fcpmcasecomment_pmcc_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcpmcasecomment_pmcc_id_seq OWNED BY fcpmcasecomment.pmcc_id;


--
-- TOC entry 439 (class 1259 OID 51669)
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
-- TOC entry 440 (class 1259 OID 51673)
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
-- TOC entry 3365 (class 0 OID 0)
-- Dependencies: 440
-- Name: fcpmcasecommentread_pmcr_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcpmcasecommentread_pmcr_id_seq OWNED BY fcpmcasecommentread.pmcr_id;


--
-- TOC entry 441 (class 1259 OID 51675)
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
-- TOC entry 442 (class 1259 OID 51679)
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
-- TOC entry 3366 (class 0 OID 0)
-- Dependencies: 442
-- Name: fcpmcaseflag_pmcf_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcpmcaseflag_pmcf_id_seq OWNED BY fcpmcaseflag.pmcf_id;


--
-- TOC entry 443 (class 1259 OID 51681)
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
    pmf_end_by character varying(100),
    pmf_end_pmfid integer,
    pmf_from_event_gateway character varying(1) DEFAULT 'N'::character varying,
    pmf_last_timer_check_date timestamp with time zone,
    pmf_timer_due_date timestamp with time zone,
    pmf_timer_due_count integer
);


ALTER TABLE pnd.fcpmcaseflow OWNER TO pnd;

--
-- TOC entry 3367 (class 0 OID 0)
-- Dependencies: 443
-- Name: COLUMN fcpmcaseflow.pmf_from_event_gateway; Type: COMMENT; Schema: pnd; Owner: pnd
--

COMMENT ON COLUMN fcpmcaseflow.pmf_from_event_gateway IS 'Last flow is an event gateway';


--
-- TOC entry 444 (class 1259 OID 51685)
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
-- TOC entry 3368 (class 0 OID 0)
-- Dependencies: 444
-- Name: fcpmcaseflow_pmf_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcpmcaseflow_pmf_id_seq OWNED BY fcpmcaseflow.pmf_id;


--
-- TOC entry 445 (class 1259 OID 51687)
-- Name: fcpmcaseflowassign; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE fcpmcaseflowassign (
    pmfa_id integer NOT NULL,
    pmfa_pmfid integer,
    pmfa_userid character varying(100),
    pmfa_orgid integer,
    pmfa_rolid integer,
    pmfa_pmscode character varying(100)
);


ALTER TABLE pnd.fcpmcaseflowassign OWNER TO pnd;

--
-- TOC entry 446 (class 1259 OID 51690)
-- Name: fcpmcaseflowassign_pmfa_id_seq; Type: SEQUENCE; Schema: pnd; Owner: pnd
--

CREATE SEQUENCE fcpmcaseflowassign_pmfa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd.fcpmcaseflowassign_pmfa_id_seq OWNER TO pnd;

--
-- TOC entry 3369 (class 0 OID 0)
-- Dependencies: 446
-- Name: fcpmcaseflowassign_pmfa_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcpmcaseflowassign_pmfa_id_seq OWNED BY fcpmcaseflowassign.pmfa_id;


--
-- TOC entry 447 (class 1259 OID 51692)
-- Name: fcpmcasetype; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE fcpmcasetype (
    pmct_code character varying(32) NOT NULL,
    pmct_desc character varying(100),
    pmct_table character varying(100),
    pmct_key_col character varying(100),
    pmct_desc_col character varying(500),
    pmct_caseinfo_function character varying(100)
);


ALTER TABLE pnd.fcpmcasetype OWNER TO pnd;

--
-- TOC entry 448 (class 1259 OID 51698)
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
    pmcn_rule character varying(20)
);


ALTER TABLE pnd.fcpmconnector OWNER TO pnd;

--
-- TOC entry 449 (class 1259 OID 51701)
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
-- TOC entry 3370 (class 0 OID 0)
-- Dependencies: 449
-- Name: fcpmconnector_pmcn_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcpmconnector_pmcn_id_seq OWNED BY fcpmconnector.pmcn_id;


--
-- TOC entry 450 (class 1259 OID 51703)
-- Name: fcpmevent; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE fcpmevent (
    pmev_id integer NOT NULL,
    pmev_pmwfid integer,
    pmev_pmslid integer,
    pmev_name character varying(100),
    pmev_type character varying(32),
    pmev_type_cat character varying(32),
    pmev_intermediate_function character varying(100),
    pmev_timer_interval character varying(50),
    pmev_timer_workinghours_only character varying(1) DEFAULT 'N'::character varying,
    pmev_intermediate_show_task character varying(1) DEFAULT 'N'::character varying,
    pmev_attach_pmatid integer,
    pmev_timer_non_interrupt_once character varying(1),
    pmev_start_function character varying(100),
    pmev_performed_message character varying(2000)
);


ALTER TABLE pnd.fcpmevent OWNER TO pnd;

--
-- TOC entry 3371 (class 0 OID 0)
-- Dependencies: 450
-- Name: COLUMN fcpmevent.pmev_attach_pmatid; Type: COMMENT; Schema: pnd; Owner: pnd
--

COMMENT ON COLUMN fcpmevent.pmev_attach_pmatid IS 'if event is attached to a activity';


--
-- TOC entry 451 (class 1259 OID 51711)
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
-- TOC entry 3372 (class 0 OID 0)
-- Dependencies: 451
-- Name: fcpmevent_pmev_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcpmevent_pmev_id_seq OWNED BY fcpmevent.pmev_id;


--
-- TOC entry 452 (class 1259 OID 51713)
-- Name: fcpmgateway; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE fcpmgateway (
    pmgw_id integer NOT NULL,
    pmgw_pmwfid integer,
    pmgw_pmslid integer,
    pmgw_name character varying(100),
    pmgw_type character varying(32),
    pmgw_type_cat character varying(32)
);


ALTER TABLE pnd.fcpmgateway OWNER TO pnd;

--
-- TOC entry 453 (class 1259 OID 51716)
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
-- TOC entry 3373 (class 0 OID 0)
-- Dependencies: 453
-- Name: fcpmgateway_pmgw_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcpmgateway_pmgw_id_seq OWNED BY fcpmgateway.pmgw_id;


--
-- TOC entry 454 (class 1259 OID 51718)
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
-- TOC entry 455 (class 1259 OID 51721)
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
-- TOC entry 3374 (class 0 OID 0)
-- Dependencies: 455
-- Name: fcpmswimlane_pmsl_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcpmswimlane_pmsl_id_seq OWNED BY fcpmswimlane.pmsl_id;


--
-- TOC entry 456 (class 1259 OID 51723)
-- Name: fcpmswimlanesetup; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE fcpmswimlanesetup (
    pmss_id integer NOT NULL,
    pmss_pmslid integer,
    pmss_userid character varying(100),
    pmss_orgid character varying(100),
    pmss_rolid character varying(100),
    pmss_pmscode character varying(100)
);


ALTER TABLE pnd.fcpmswimlanesetup OWNER TO pnd;

--
-- TOC entry 457 (class 1259 OID 51726)
-- Name: fcpmswimlanesetup_pmss_id_seq; Type: SEQUENCE; Schema: pnd; Owner: pnd
--

CREATE SEQUENCE fcpmswimlanesetup_pmss_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd.fcpmswimlanesetup_pmss_id_seq OWNER TO pnd;

--
-- TOC entry 3375 (class 0 OID 0)
-- Dependencies: 457
-- Name: fcpmswimlanesetup_pmss_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcpmswimlanesetup_pmss_id_seq OWNED BY fcpmswimlanesetup.pmss_id;


--
-- TOC entry 458 (class 1259 OID 51728)
-- Name: fcpmworkflow; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE fcpmworkflow (
    pmwf_id integer NOT NULL,
    pmwf_name character varying(100)
);


ALTER TABLE pnd.fcpmworkflow OWNER TO pnd;

--
-- TOC entry 459 (class 1259 OID 51731)
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
-- TOC entry 3376 (class 0 OID 0)
-- Dependencies: 459
-- Name: fcpmworkflow_pmwf_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcpmworkflow_pmwf_id_seq OWNED BY fcpmworkflow.pmwf_id;


--
-- TOC entry 460 (class 1259 OID 51733)
-- Name: fcrole; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE fcrole (
    rol_id integer NOT NULL,
    rol_name character varying(2000)
);


ALTER TABLE pnd.fcrole OWNER TO pnd;

--
-- TOC entry 461 (class 1259 OID 51739)
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
-- TOC entry 3377 (class 0 OID 0)
-- Dependencies: 461
-- Name: fcrole_rol_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcrole_rol_id_seq OWNED BY fcrole.rol_id;


--
-- TOC entry 462 (class 1259 OID 51741)
-- Name: fcroleperm; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE fcroleperm (
    rp_id integer NOT NULL,
    rp_rolid integer,
    rp_pmscode character varying(50)
);


ALTER TABLE pnd.fcroleperm OWNER TO pnd;

--
-- TOC entry 463 (class 1259 OID 51744)
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
-- TOC entry 3378 (class 0 OID 0)
-- Dependencies: 463
-- Name: fcroleperm_rp_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcroleperm_rp_id_seq OWNED BY fcroleperm.rp_id;


--
-- TOC entry 464 (class 1259 OID 51746)
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
-- TOC entry 465 (class 1259 OID 51752)
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
-- TOC entry 3379 (class 0 OID 0)
-- Dependencies: 465
-- Name: fcrule_ru_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcrule_ru_id_seq OWNED BY fcrule.ru_id;


--
-- TOC entry 466 (class 1259 OID 51754)
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
-- TOC entry 3380 (class 0 OID 0)
-- Dependencies: 466
-- Name: COLUMN fcsetting.set_id; Type: COMMENT; Schema: pnd; Owner: pnd
--

COMMENT ON COLUMN fcsetting.set_id IS 'setting id';


--
-- TOC entry 3381 (class 0 OID 0)
-- Dependencies: 466
-- Name: COLUMN fcsetting.set_description; Type: COMMENT; Schema: pnd; Owner: pnd
--

COMMENT ON COLUMN fcsetting.set_description IS 'setting description';


--
-- TOC entry 3382 (class 0 OID 0)
-- Dependencies: 466
-- Name: COLUMN fcsetting.set_val; Type: COMMENT; Schema: pnd; Owner: pnd
--

COMMENT ON COLUMN fcsetting.set_val IS 'setting value';


--
-- TOC entry 467 (class 1259 OID 51761)
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
-- TOC entry 3383 (class 0 OID 0)
-- Dependencies: 467
-- Name: fcsetting_set_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcsetting_set_id_seq OWNED BY fcsetting.set_id;


--
-- TOC entry 468 (class 1259 OID 51763)
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
    udv_result_lookup character varying(4000),
    udv_cat character varying(32)
);


ALTER TABLE pnd.fcudv OWNER TO pnd;

--
-- TOC entry 469 (class 1259 OID 51770)
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
-- TOC entry 470 (class 1259 OID 51778)
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
    di_status character varying(50) DEFAULT 'UNREAD'::character varying,
    di_display_date timestamp with time zone DEFAULT now(),
    di_cat2 character varying(50),
    di_severity integer DEFAULT 3
);


ALTER TABLE pnd.fcuserdiary OWNER TO pnd;

--
-- TOC entry 471 (class 1259 OID 51788)
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
-- TOC entry 3384 (class 0 OID 0)
-- Dependencies: 471
-- Name: fcuserdiary_di_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcuserdiary_di_id_seq OWNED BY fcuserdiary.di_id;


--
-- TOC entry 472 (class 1259 OID 51790)
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
-- TOC entry 473 (class 1259 OID 51796)
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
-- TOC entry 3385 (class 0 OID 0)
-- Dependencies: 473
-- Name: fcuserlogin_ul_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcuserlogin_ul_id_seq OWNED BY fcuserlogin.ul_id;


--
-- TOC entry 474 (class 1259 OID 51798)
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
-- TOC entry 475 (class 1259 OID 51801)
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
-- TOC entry 3386 (class 0 OID 0)
-- Dependencies: 475
-- Name: fcuserorgrole_uor_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcuserorgrole_uor_id_seq OWNED BY fcuserorgrole.uor_id;


--
-- TOC entry 476 (class 1259 OID 51803)
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
-- TOC entry 3387 (class 0 OID 0)
-- Dependencies: 476
-- Name: COLUMN fcusersession.us_sessid; Type: COMMENT; Schema: pnd; Owner: pnd
--

COMMENT ON COLUMN fcusersession.us_sessid IS 'PHP session id';


--
-- TOC entry 477 (class 1259 OID 51809)
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
-- TOC entry 3388 (class 0 OID 0)
-- Dependencies: 477
-- Name: fcusersession_us_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcusersession_us_id_seq OWNED BY fcusersession.us_id;


--
-- TOC entry 478 (class 1259 OID 51811)
-- Name: martistskill; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE martistskill (
    ma_id integer NOT NULL,
    ma_usruserid character varying(50),
    ma_jclid integer
);


ALTER TABLE pnd.martistskill OWNER TO pnd;

--
-- TOC entry 3389 (class 0 OID 0)
-- Dependencies: 478
-- Name: COLUMN martistskill.ma_jclid; Type: COMMENT; Schema: pnd; Owner: pnd
--

COMMENT ON COLUMN martistskill.ma_jclid IS 'foreign key to mjobcatlookup';


--
-- TOC entry 479 (class 1259 OID 51814)
-- Name: martistskill_ma_id_seq; Type: SEQUENCE; Schema: pnd; Owner: pnd
--

CREATE SEQUENCE martistskill_ma_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd.martistskill_ma_id_seq OWNER TO pnd;

--
-- TOC entry 3390 (class 0 OID 0)
-- Dependencies: 479
-- Name: martistskill_ma_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE martistskill_ma_id_seq OWNED BY martistskill.ma_id;


--
-- TOC entry 480 (class 1259 OID 51816)
-- Name: mbarcodetype; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE mbarcodetype (
    bt_code character varying(50) NOT NULL,
    bt_name character varying(200),
    bt_format character varying(100)
);


ALTER TABLE pnd.mbarcodetype OWNER TO pnd;

--
-- TOC entry 481 (class 1259 OID 51819)
-- Name: mcarton; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE mcarton (
    car_id integer NOT NULL,
    car_name character varying(200),
    car_status character varying(32) DEFAULT 'ACTIVE'::character varying
);


ALTER TABLE pnd.mcarton OWNER TO pnd;

--
-- TOC entry 482 (class 1259 OID 51823)
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
-- TOC entry 3391 (class 0 OID 0)
-- Dependencies: 482
-- Name: mcarton_car_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE mcarton_car_id_seq OWNED BY mcarton.car_id;


--
-- TOC entry 483 (class 1259 OID 51825)
-- Name: mcartonvariable; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE mcartonvariable (
    carv_code character varying(12),
    carv_unit character varying(12),
    carv_carid integer
);


ALTER TABLE pnd.mcartonvariable OWNER TO pnd;

--
-- TOC entry 3392 (class 0 OID 0)
-- Dependencies: 483
-- Name: COLUMN mcartonvariable.carv_carid; Type: COMMENT; Schema: pnd; Owner: pnd
--

COMMENT ON COLUMN mcartonvariable.carv_carid IS 'foreign key to mcarton car_id';


--
-- TOC entry 484 (class 1259 OID 51828)
-- Name: mcmanilox; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE mcmanilox (
    ma_id integer NOT NULL,
    ma_mcid integer,
    ma_num integer,
    ma_type character varying(50),
    ma_value character varying(50)
);


ALTER TABLE pnd.mcmanilox OWNER TO pnd;

--
-- TOC entry 485 (class 1259 OID 51831)
-- Name: mcmanilox_ma_id_seq; Type: SEQUENCE; Schema: pnd; Owner: pnd
--

CREATE SEQUENCE mcmanilox_ma_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd.mcmanilox_ma_id_seq OWNER TO pnd;

--
-- TOC entry 3393 (class 0 OID 0)
-- Dependencies: 485
-- Name: mcmanilox_ma_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE mcmanilox_ma_id_seq OWNED BY mcmanilox.ma_id;


--
-- TOC entry 486 (class 1259 OID 51833)
-- Name: mcmcylplate; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE mcmcylplate (
    mcp_id integer NOT NULL,
    mcp_mcid integer,
    mcp_num integer,
    mcp_value character varying(50)
);


ALTER TABLE pnd.mcmcylplate OWNER TO pnd;

--
-- TOC entry 487 (class 1259 OID 51836)
-- Name: mcmcylplate_mcp_id_seq; Type: SEQUENCE; Schema: pnd; Owner: pnd
--

CREATE SEQUENCE mcmcylplate_mcp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd.mcmcylplate_mcp_id_seq OWNER TO pnd;

--
-- TOC entry 3394 (class 0 OID 0)
-- Dependencies: 487
-- Name: mcmcylplate_mcp_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE mcmcylplate_mcp_id_seq OWNED BY mcmcylplate.mcp_id;


--
-- TOC entry 488 (class 1259 OID 51838)
-- Name: mcmcylrepeat; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE mcmcylrepeat (
    mcr_id integer NOT NULL,
    mcr_mcid integer,
    mcr_num integer,
    mcr_value character varying(50)
);


ALTER TABLE pnd.mcmcylrepeat OWNER TO pnd;

--
-- TOC entry 489 (class 1259 OID 51841)
-- Name: mcmcylrepeat_mcr_id_seq; Type: SEQUENCE; Schema: pnd; Owner: pnd
--

CREATE SEQUENCE mcmcylrepeat_mcr_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd.mcmcylrepeat_mcr_id_seq OWNER TO pnd;

--
-- TOC entry 3395 (class 0 OID 0)
-- Dependencies: 489
-- Name: mcmcylrepeat_mcr_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE mcmcylrepeat_mcr_id_seq OWNED BY mcmcylrepeat.mcr_id;


--
-- TOC entry 490 (class 1259 OID 51843)
-- Name: mcmcylsubstrate; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE mcmcylsubstrate (
    mcs_id integer NOT NULL,
    mcs_mcid integer,
    mcs_num integer,
    mcs_value character varying(50)
);


ALTER TABLE pnd.mcmcylsubstrate OWNER TO pnd;

--
-- TOC entry 491 (class 1259 OID 51846)
-- Name: mcmcylsubstrate_mcs_id_seq; Type: SEQUENCE; Schema: pnd; Owner: pnd
--

CREATE SEQUENCE mcmcylsubstrate_mcs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd.mcmcylsubstrate_mcs_id_seq OWNER TO pnd;

--
-- TOC entry 3396 (class 0 OID 0)
-- Dependencies: 491
-- Name: mcmcylsubstrate_mcs_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE mcmcylsubstrate_mcs_id_seq OWNED BY mcmcylsubstrate.mcs_id;


--
-- TOC entry 492 (class 1259 OID 51848)
-- Name: mcmline; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE mcmline (
    ml_id integer NOT NULL,
    ml_mcid integer,
    ml_num integer,
    ml_value character varying(50)
);


ALTER TABLE pnd.mcmline OWNER TO pnd;

--
-- TOC entry 493 (class 1259 OID 51851)
-- Name: mcmline_ml_id_seq; Type: SEQUENCE; Schema: pnd; Owner: pnd
--

CREATE SEQUENCE mcmline_ml_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd.mcmline_ml_id_seq OWNER TO pnd;

--
-- TOC entry 3397 (class 0 OID 0)
-- Dependencies: 493
-- Name: mcmline_ml_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE mcmline_ml_id_seq OWNED BY mcmline.ml_id;


--
-- TOC entry 494 (class 1259 OID 51853)
-- Name: mcustmachine; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE mcustmachine (
    mc_id integer NOT NULL,
    mc_orgid integer,
    mc_name character varying(200),
    mc_type character varying(12),
    mc_colorslot integer,
    mc_width character varying(50),
    mc_density character varying(50),
    mc_visosity character varying(50)
);


ALTER TABLE pnd.mcustmachine OWNER TO pnd;

--
-- TOC entry 495 (class 1259 OID 51856)
-- Name: mcustmachine_old; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE mcustmachine_old (
    mc_id integer NOT NULL,
    mc_orgid integer,
    mc_pressmanufacturer character varying(200),
    mc_pressyearbuilt character varying(50),
    mc_pressmodel character varying(200),
    mc_presswidth character varying(50),
    mc_presstype character varying(200),
    mc_pressspeed character varying(50),
    mc_presscylinderrepeat character varying(50),
    mc_inkmanufacturer character varying(200),
    mc_inkcommercialname character varying(200),
    mc_inktype character varying(50),
    mc_inktypeother character varying(200),
    mc_inkviscosity character varying(50),
    mc_inkvicosityother character varying(200),
    mc_inkprintingunit_1 character varying(50),
    mc_inkprintingunit_2 character varying(50),
    mc_inkprintingunit_3 character varying(50),
    mc_inkprintingunit_4 character varying(50),
    mc_inkprintingunit_5 character varying(50),
    mc_inkvisocity_1 character varying(50),
    mc_inkvisocity_2 character varying(50),
    mc_inkvisocity_3 character varying(50),
    mc_inkvisocity_4 character varying(50),
    mc_inkvisocity_5 character varying(50),
    mc_inkph_1 character varying(50),
    mc_inkph_2 character varying(50),
    mc_inkph_3 character varying(50),
    mc_inkph_4 character varying(50),
    mc_inkph_5 character varying(50),
    mc_inkdensity_1 character varying(50),
    mc_inkdensity_2 character varying(50),
    mc_inkdensity_3 character varying(50),
    mc_inkdensity_4 character varying(50),
    mc_inkdensity_5 character varying(50),
    mc_platemanufacturer character varying(200),
    mc_platecommercialname character varying(200),
    mc_platetype character varying(50),
    mc_platedurometer character varying(50),
    mc_platethickness character varying(50),
    mc_platerelief character varying(50),
    mc_mountingtapemanufacturer character varying(200),
    mc_mountingtapename character varying(200),
    mc_mountingtapedensity character varying(50),
    mc_mountingtapthickness character varying(50),
    mc_mountingcarrierthickness character varying(50),
    mc_mountingcushionmanufacturer character varying(200),
    mc_mountingcushonname character varying(200),
    mc_mountingdensity character varying(50),
    mc_mountingcushionthickness character varying(50),
    mc_cimplevel_1 character varying(50),
    mc_cimplevel_2 character varying(50),
    mc_cimplevel_3 character varying(50),
    mc_cimplevel_4 character varying(50),
    mc_cimplevel_5 character varying(50),
    mc_cimpsubstrate_1 character varying(50),
    mc_cimpsubstrate_2 character varying(50),
    mc_cimpsubstrate_3 character varying(50),
    mc_cimpsubstrate_4 character varying(50),
    mc_cimpsubstrate_5 character varying(50),
    mc_cimpanlox_1 character varying(50),
    mc_cimpanlox_2 character varying(50),
    mc_cimpanlox_3 character varying(50),
    mc_cimpanlox_4 character varying(50),
    mc_cimpanlox_5 character varying(50),
    mc_aniloxmanufacturer character varying(200),
    mc_aniloxtype character varying(50),
    mc_aniloxengravingangle character varying(50),
    mc_aniloxinking character varying(200),
    mc_aniloxprintingunit_1 character varying(50),
    mc_aniloxprintingunit_2 character varying(50),
    mc_aniloxprintingunit_3 character varying(50),
    mc_aniloxprintingunit_4 character varying(50),
    mc_aniloxprintingunit_5 character varying(50),
    mc_aniloxmanufacturer_1 character varying(50),
    mc_aniloxmanufacturer_2 character varying(50),
    mc_aniloxmanufacturer_3 character varying(50),
    mc_aniloxmanufacturer_4 character varying(50),
    mc_aniloxmanufacturer_5 character varying(50),
    mc_aniloxtype_1 character varying(50),
    mc_aniloxtype_2 character varying(50),
    mc_aniloxtype_3 character varying(50),
    mc_aniloxtype_4 character varying(50),
    mc_aniloxtype_5 character varying(50),
    mc_aniloxengravingangle_1 character varying(50),
    mc_aniloxengravingangle_2 character varying(50),
    mc_aniloxengravingangle_3 character varying(50),
    mc_aniloxengravingangle_4 character varying(50),
    mc_aniloxengravingangle_5 character varying(50),
    mc_aniloxinking_1 character varying(50),
    mc_aniloxinking_2 character varying(50),
    mc_aniloxinking_3 character varying(50),
    mc_aniloxinking_4 character varying(50),
    mc_aniloxinking_5 character varying(50),
    mc_aniloxcellcount_1 character varying(50),
    mc_aniloxcellcount_2 character varying(50),
    mc_aniloxcellcount_3 character varying(50),
    mc_aniloxcellcount_4 character varying(50),
    mc_aniloxcellcount_5 character varying(50),
    mc_aniloxvolumn_1 character varying(50),
    mc_aniloxvolumn_2 character varying(50),
    mc_aniloxvolumn_3 character varying(50),
    mc_aniloxvolumn_4 character varying(50),
    mc_aniloxvolumn_5 character varying(50),
    mc_aniloxdoration_1 character varying(50),
    mc_aniloxdoration_2 character varying(50),
    mc_aniloxdoration_3 character varying(50),
    mc_aniloxdoration_4 character varying(50),
    mc_aniloxdoration_5 character varying(50),
    mc_aniloxdoctoring_1 character varying(50),
    mc_aniloxdoctoring_2 character varying(50),
    mc_aniloxdoctoring_3 character varying(50),
    mc_aniloxdoctoring_4 character varying(50),
    mc_aniloxdoctoring_5 character varying(50),
    mc_aniloxcontainment_1 character varying(50),
    mc_aniloxcontainment_2 character varying(50),
    mc_aniloxcontainment_3 character varying(50),
    mc_aniloxcontainment_4 character varying(50),
    mc_aniloxcontainment_5 character varying(50),
    mc_substratemanufacturer character varying(200),
    mc_substratename character varying(200),
    mc_substratetype character varying(50),
    mc_substratedyna character varying(50),
    mc_substrateweight character varying(50),
    mc_substrateflute character varying(50),
    mc_substratethickness character varying(50),
    mc_printer_name character varying(200)
);


ALTER TABLE pnd.mcustmachine_old OWNER TO pnd;

--
-- TOC entry 496 (class 1259 OID 51862)
-- Name: mcustmachine_mc_id_seq; Type: SEQUENCE; Schema: pnd; Owner: pnd
--

CREATE SEQUENCE mcustmachine_mc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd.mcustmachine_mc_id_seq OWNER TO pnd;

--
-- TOC entry 3398 (class 0 OID 0)
-- Dependencies: 496
-- Name: mcustmachine_mc_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE mcustmachine_mc_id_seq OWNED BY mcustmachine_old.mc_id;


--
-- TOC entry 497 (class 1259 OID 51864)
-- Name: mcustmachine_mc_id_seq1; Type: SEQUENCE; Schema: pnd; Owner: pnd
--

CREATE SEQUENCE mcustmachine_mc_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd.mcustmachine_mc_id_seq1 OWNER TO pnd;

--
-- TOC entry 3399 (class 0 OID 0)
-- Dependencies: 497
-- Name: mcustmachine_mc_id_seq1; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE mcustmachine_mc_id_seq1 OWNED BY mcustmachine.mc_id;


--
-- TOC entry 498 (class 1259 OID 51866)
-- Name: mcustprinter; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE mcustprinter (
    cp_id integer NOT NULL,
    cp_orgid integer,
    cp_printertype character varying(50),
    cp_colorslot integer
);


ALTER TABLE pnd.mcustprinter OWNER TO pnd;

--
-- TOC entry 499 (class 1259 OID 51869)
-- Name: mcustprinter_cp_id_seq; Type: SEQUENCE; Schema: pnd; Owner: pnd
--

CREATE SEQUENCE mcustprinter_cp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd.mcustprinter_cp_id_seq OWNER TO pnd;

--
-- TOC entry 3400 (class 0 OID 0)
-- Dependencies: 499
-- Name: mcustprinter_cp_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE mcustprinter_cp_id_seq OWNED BY mcustprinter.cp_id;


--
-- TOC entry 500 (class 1259 OID 51871)
-- Name: mjobbarcode; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE mjobbarcode (
    jbc_id integer NOT NULL,
    jbc_jsid integer,
    jbc_btcode character varying(50),
    jbc_value character varying(200)
);


ALTER TABLE pnd.mjobbarcode OWNER TO pnd;

--
-- TOC entry 501 (class 1259 OID 51874)
-- Name: mjobbarcode_jbc_id_seq; Type: SEQUENCE; Schema: pnd; Owner: pnd
--

CREATE SEQUENCE mjobbarcode_jbc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd.mjobbarcode_jbc_id_seq OWNER TO pnd;

--
-- TOC entry 3401 (class 0 OID 0)
-- Dependencies: 501
-- Name: mjobbarcode_jbc_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE mjobbarcode_jbc_id_seq OWNED BY mjobbarcode.jbc_id;


--
-- TOC entry 502 (class 1259 OID 51876)
-- Name: mjobcat; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE mjobcat (
    jc_id integer NOT NULL,
    jc_jsid integer,
    jc_jclid integer
);


ALTER TABLE pnd.mjobcat OWNER TO pnd;

--
-- TOC entry 503 (class 1259 OID 51879)
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
-- TOC entry 3402 (class 0 OID 0)
-- Dependencies: 503
-- Name: mjobcat_jc_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE mjobcat_jc_id_seq OWNED BY mjobcat.jc_id;


--
-- TOC entry 504 (class 1259 OID 51881)
-- Name: mjobcatlookup; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE mjobcatlookup (
    jcl_id integer NOT NULL,
    jcl_title character varying(200),
    jcl_sequence integer,
    jcl_requiretime_color_1 integer,
    jcl_requiretime_color_2 integer,
    jcl_requiretime_color_3 integer,
    jcl_requiretime_color_4 integer,
    jcl_status character varying(32) DEFAULT 'ACTIVE'::character varying,
    jcl_price_cat character varying(12),
    jcl_price_color_1 numeric(20,4),
    jcl_price_color_2 numeric(20,4),
    jcl_price_color_3 numeric(20,4),
    jcl_price_color_4 numeric(20,4),
    jcl_price_per_unit numeric(20,4)
);


ALTER TABLE pnd.mjobcatlookup OWNER TO pnd;

--
-- TOC entry 505 (class 1259 OID 51885)
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
-- TOC entry 3403 (class 0 OID 0)
-- Dependencies: 505
-- Name: mjobcatlookup_jcl_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE mjobcatlookup_jcl_id_seq OWNED BY mjobcatlookup.jcl_id;


--
-- TOC entry 506 (class 1259 OID 51887)
-- Name: mjoboutput; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE mjoboutput (
    jo_id integer NOT NULL,
    jo_jsid integer,
    jo_outputcode character varying(50)
);


ALTER TABLE pnd.mjoboutput OWNER TO pnd;

--
-- TOC entry 507 (class 1259 OID 51890)
-- Name: mjoboutputlookup; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE mjoboutputlookup (
    jol_id integer NOT NULL,
    jol_title character varying(200),
    jol_requiredtime integer,
    jol_status character varying(32) DEFAULT 'ACTIVE'::character varying,
    jol_price_color_1 numeric(20,4),
    jol_price_color_2 numeric(20,4),
    jol_price_color_3 numeric(20,4),
    jol_price_color_4 numeric(20,4)
);


ALTER TABLE pnd.mjoboutputlookup OWNER TO pnd;

--
-- TOC entry 508 (class 1259 OID 51894)
-- Name: mjoboutputlookup_jol_id_seq; Type: SEQUENCE; Schema: pnd; Owner: pnd
--

CREATE SEQUENCE mjoboutputlookup_jol_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd.mjoboutputlookup_jol_id_seq OWNER TO pnd;

--
-- TOC entry 3404 (class 0 OID 0)
-- Dependencies: 508
-- Name: mjoboutputlookup_jol_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE mjoboutputlookup_jol_id_seq OWNED BY mjoboutputlookup.jol_id;


--
-- TOC entry 509 (class 1259 OID 51896)
-- Name: mjobsheet; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE mjobsheet (
    js_id integer NOT NULL,
    js_orgid integer,
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
    js_color_5 character varying(12),
    js_angle_1 character varying(12),
    js_angle_2 character varying(12),
    js_angle_3 character varying(12),
    js_angle_4 character varying(12),
    js_angle_5 character varying(12),
    js_bleeding character varying(12),
    js_bleeding_remark character varying(1000),
    js_distortion character varying(1),
    js_distortion_value numeric(20,4),
    js_diecut_ind character varying(1),
    js_diecut_no character varying(100),
    js_trapping_size numeric(20,4),
    js_primcat integer,
    js_status character varying(100) DEFAULT 'REQUIREMENT VERIFICATION'::character varying,
    js_completiondate timestamp with time zone,
    js_assignto character varying(50),
    js_carid integer,
    js_decision character varying(50),
    js_width character varying(50),
    js_height character varying(50),
    js_requiretime integer,
    js_request_dateinmth character varying(50),
    js_jobcolor character varying(50),
    js_lpi integer,
    js_mcid integer,
    js_code character varying(32),
    js_month_occur integer,
    js_price numeric(20,4),
    js_outputtype character varying(50),
    js_outputwidth integer,
    js_outputheight integer,
    js_qcchecked character varying(2000)
);


ALTER TABLE pnd.mjobsheet OWNER TO pnd;

--
-- TOC entry 3405 (class 0 OID 0)
-- Dependencies: 509
-- Name: COLUMN mjobsheet.js_primcat; Type: COMMENT; Schema: pnd; Owner: pnd
--

COMMENT ON COLUMN mjobsheet.js_primcat IS 'primary job category';


--
-- TOC entry 510 (class 1259 OID 51904)
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
-- TOC entry 3406 (class 0 OID 0)
-- Dependencies: 510
-- Name: mjobsheet_js_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE mjobsheet_js_id_seq OWNED BY mjobsheet.js_id;


--
-- TOC entry 511 (class 1259 OID 51906)
-- Name: mjscartonvalue; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE mjscartonvalue (
    caval_id integer NOT NULL,
    caval_value numeric(20,4),
    carval_carcode character varying(12),
    carval_carid integer,
    carval_jsid integer
);


ALTER TABLE pnd.mjscartonvalue OWNER TO pnd;

--
-- TOC entry 512 (class 1259 OID 51909)
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
-- TOC entry 3407 (class 0 OID 0)
-- Dependencies: 512
-- Name: mjscartonvalue_caval_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE mjscartonvalue_caval_id_seq OWNED BY mjscartonvalue.caval_id;


--
-- TOC entry 513 (class 1259 OID 51911)
-- Name: mmailtemplate; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE mmailtemplate (
    mt_code character varying(32) NOT NULL,
    mt_desc character varying(200),
    mt_recipient_to character varying(2000),
    mt_recipient_cc character varying(2000),
    mt_subject character varying(500),
    mt_content text,
    mt_status character varying(32) DEFAULT 'ACTIVE'::character varying,
    mt_internal_userid character varying(2000)
);


ALTER TABLE pnd.mmailtemplate OWNER TO pnd;

--
-- TOC entry 514 (class 1259 OID 51918)
-- Name: mtnc; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE mtnc (
    tc_id integer NOT NULL,
    tc_text text
);


ALTER TABLE pnd.mtnc OWNER TO pnd;

--
-- TOC entry 515 (class 1259 OID 51924)
-- Name: mtnc_tc_id_seq; Type: SEQUENCE; Schema: pnd; Owner: pnd
--

CREATE SEQUENCE mtnc_tc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd.mtnc_tc_id_seq OWNER TO pnd;

--
-- TOC entry 3408 (class 0 OID 0)
-- Dependencies: 515
-- Name: mtnc_tc_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE mtnc_tc_id_seq OWNED BY mtnc.tc_id;


--
-- TOC entry 516 (class 1259 OID 51926)
-- Name: mtncacceptance; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE mtncacceptance (
    tca_tcid integer NOT NULL,
    tca_userid character varying(100) NOT NULL,
    tca_date timestamp with time zone DEFAULT now(),
    tca_result character varying(32)
);


ALTER TABLE pnd.mtncacceptance OWNER TO pnd;

--
-- TOC entry 517 (class 1259 OID 51930)
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
-- TOC entry 518 (class 1259 OID 51938)
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
-- TOC entry 3409 (class 0 OID 0)
-- Dependencies: 518
-- Name: pndaddress_ad_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE pndaddress_ad_id_seq OWNED BY pndaddress.ad_id;


--
-- TOC entry 519 (class 1259 OID 51940)
-- Name: pndartistskill; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE pndartistskill (
    as_userid character varying(50),
    as_skill character varying(50)
);


ALTER TABLE pnd.pndartistskill OWNER TO pnd;

--
-- TOC entry 520 (class 1259 OID 51943)
-- Name: pndcontact; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE pndcontact (
    ct_id integer NOT NULL,
    ct_refid integer,
    ct_reftype character varying(50),
    ct_name character varying(100),
    ct_email character varying(100),
    ct_concode character varying(24)
);


ALTER TABLE pnd.pndcontact OWNER TO pnd;

--
-- TOC entry 3410 (class 0 OID 0)
-- Dependencies: 520
-- Name: COLUMN pndcontact.ct_concode; Type: COMMENT; Schema: pnd; Owner: pnd
--

COMMENT ON COLUMN pndcontact.ct_concode IS 'Country code';


--
-- TOC entry 521 (class 1259 OID 51946)
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
-- TOC entry 3411 (class 0 OID 0)
-- Dependencies: 521
-- Name: pndcontact_ct_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE pndcontact_ct_id_seq OWNED BY pndcontact.ct_id;


--
-- TOC entry 522 (class 1259 OID 51948)
-- Name: pndjoboutput_jo_id_seq; Type: SEQUENCE; Schema: pnd; Owner: pnd
--

CREATE SEQUENCE pndjoboutput_jo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd.pndjoboutput_jo_id_seq OWNER TO pnd;

--
-- TOC entry 3412 (class 0 OID 0)
-- Dependencies: 522
-- Name: pndjoboutput_jo_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE pndjoboutput_jo_id_seq OWNED BY mjoboutput.jo_id;


--
-- TOC entry 523 (class 1259 OID 51950)
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
-- TOC entry 524 (class 1259 OID 51958)
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
-- TOC entry 3413 (class 0 OID 0)
-- Dependencies: 524
-- Name: pndphone_ph_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE pndphone_ph_id_seq OWNED BY pndphone.ph_id;


--
-- TOC entry 2881 (class 2604 OID 51960)
-- Name: dba_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcdbaudit ALTER COLUMN dba_id SET DEFAULT nextval('fcdbaudit_dba_id_seq'::regclass);


--
-- TOC entry 2883 (class 2604 OID 51961)
-- Name: fd_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcdoc ALTER COLUMN fd_id SET DEFAULT nextval('fcdoc_fd_id_seq'::regclass);


--
-- TOC entry 2885 (class 2604 OID 51962)
-- Name: ms_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcemailsetting ALTER COLUMN ms_id SET DEFAULT nextval('fcemailsetting_ms_id_seq'::regclass);


--
-- TOC entry 2888 (class 2604 OID 51963)
-- Name: lch_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fclocaleholiday ALTER COLUMN lch_id SET DEFAULT nextval('fclocaleholiday_lch_id_seq'::regclass);


--
-- TOC entry 2890 (class 2604 OID 51964)
-- Name: lcw_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fclocaleworkinghour ALTER COLUMN lcw_id SET DEFAULT nextval('fclocaleworkinghour_lcw_id_seq'::regclass);


--
-- TOC entry 2891 (class 2604 OID 51965)
-- Name: log_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fclog ALTER COLUMN log_id SET DEFAULT nextval('fclog_log_id_seq'::regclass);


--
-- TOC entry 2895 (class 2604 OID 51966)
-- Name: lu_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fclookup ALTER COLUMN lu_id SET DEFAULT nextval('fclookup_lu_id_seq'::regclass);


--
-- TOC entry 2897 (class 2604 OID 51967)
-- Name: mn_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcmenu ALTER COLUMN mn_id SET DEFAULT nextval('fcmenu_mn_id_seq'::regclass);


--
-- TOC entry 2898 (class 2604 OID 51968)
-- Name: mn_parentid; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcmenu ALTER COLUMN mn_parentid SET DEFAULT nextval('fcmenu_mn_parentid_seq'::regclass);


--
-- TOC entry 2902 (class 2604 OID 51969)
-- Name: org_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcorg ALTER COLUMN org_id SET DEFAULT nextval('fcorg_org_id_seq'::regclass);


--
-- TOC entry 2906 (class 2604 OID 51970)
-- Name: pmc_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcpmcase ALTER COLUMN pmc_id SET DEFAULT nextval('fcpmcase_pmc_id_seq'::regclass);


--
-- TOC entry 2910 (class 2604 OID 51971)
-- Name: pmcc_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcpmcasecomment ALTER COLUMN pmcc_id SET DEFAULT nextval('fcpmcasecomment_pmcc_id_seq'::regclass);


--
-- TOC entry 2911 (class 2604 OID 51972)
-- Name: pmcr_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcpmcasecommentread ALTER COLUMN pmcr_id SET DEFAULT nextval('fcpmcasecommentread_pmcr_id_seq'::regclass);


--
-- TOC entry 2913 (class 2604 OID 51973)
-- Name: pmcf_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcpmcaseflag ALTER COLUMN pmcf_id SET DEFAULT nextval('fcpmcaseflag_pmcf_id_seq'::regclass);


--
-- TOC entry 2915 (class 2604 OID 51974)
-- Name: pmf_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcpmcaseflow ALTER COLUMN pmf_id SET DEFAULT nextval('fcpmcaseflow_pmf_id_seq'::regclass);


--
-- TOC entry 2917 (class 2604 OID 51975)
-- Name: pmfa_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcpmcaseflowassign ALTER COLUMN pmfa_id SET DEFAULT nextval('fcpmcaseflowassign_pmfa_id_seq'::regclass);


--
-- TOC entry 2918 (class 2604 OID 51976)
-- Name: pmcn_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcpmconnector ALTER COLUMN pmcn_id SET DEFAULT nextval('fcpmconnector_pmcn_id_seq'::regclass);


--
-- TOC entry 2921 (class 2604 OID 51977)
-- Name: pmev_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcpmevent ALTER COLUMN pmev_id SET DEFAULT nextval('fcpmevent_pmev_id_seq'::regclass);


--
-- TOC entry 2922 (class 2604 OID 51978)
-- Name: pmgw_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcpmgateway ALTER COLUMN pmgw_id SET DEFAULT nextval('fcpmgateway_pmgw_id_seq'::regclass);


--
-- TOC entry 2923 (class 2604 OID 51979)
-- Name: pmsl_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcpmswimlane ALTER COLUMN pmsl_id SET DEFAULT nextval('fcpmswimlane_pmsl_id_seq'::regclass);


--
-- TOC entry 2924 (class 2604 OID 51980)
-- Name: pmss_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcpmswimlanesetup ALTER COLUMN pmss_id SET DEFAULT nextval('fcpmswimlanesetup_pmss_id_seq'::regclass);


--
-- TOC entry 2925 (class 2604 OID 51981)
-- Name: pmwf_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcpmworkflow ALTER COLUMN pmwf_id SET DEFAULT nextval('fcpmworkflow_pmwf_id_seq'::regclass);


--
-- TOC entry 2926 (class 2604 OID 51982)
-- Name: rol_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcrole ALTER COLUMN rol_id SET DEFAULT nextval('fcrole_rol_id_seq'::regclass);


--
-- TOC entry 2927 (class 2604 OID 51983)
-- Name: rp_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcroleperm ALTER COLUMN rp_id SET DEFAULT nextval('fcroleperm_rp_id_seq'::regclass);


--
-- TOC entry 2928 (class 2604 OID 51984)
-- Name: ru_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcrule ALTER COLUMN ru_id SET DEFAULT nextval('fcrule_ru_id_seq'::regclass);


--
-- TOC entry 2929 (class 2604 OID 51985)
-- Name: set_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcsetting ALTER COLUMN set_id SET DEFAULT nextval('fcsetting_set_id_seq'::regclass);


--
-- TOC entry 2938 (class 2604 OID 51986)
-- Name: di_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcuserdiary ALTER COLUMN di_id SET DEFAULT nextval('fcuserdiary_di_id_seq'::regclass);


--
-- TOC entry 2942 (class 2604 OID 51987)
-- Name: ul_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcuserlogin ALTER COLUMN ul_id SET DEFAULT nextval('fcuserlogin_ul_id_seq'::regclass);


--
-- TOC entry 2943 (class 2604 OID 51988)
-- Name: uor_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcuserorgrole ALTER COLUMN uor_id SET DEFAULT nextval('fcuserorgrole_uor_id_seq'::regclass);


--
-- TOC entry 2947 (class 2604 OID 51989)
-- Name: us_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcusersession ALTER COLUMN us_id SET DEFAULT nextval('fcusersession_us_id_seq'::regclass);


--
-- TOC entry 2948 (class 2604 OID 51990)
-- Name: ma_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY martistskill ALTER COLUMN ma_id SET DEFAULT nextval('martistskill_ma_id_seq'::regclass);


--
-- TOC entry 2949 (class 2604 OID 51991)
-- Name: car_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY mcarton ALTER COLUMN car_id SET DEFAULT nextval('mcarton_car_id_seq'::regclass);


--
-- TOC entry 2951 (class 2604 OID 51992)
-- Name: ma_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY mcmanilox ALTER COLUMN ma_id SET DEFAULT nextval('mcmanilox_ma_id_seq'::regclass);


--
-- TOC entry 2952 (class 2604 OID 51993)
-- Name: mcp_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY mcmcylplate ALTER COLUMN mcp_id SET DEFAULT nextval('mcmcylplate_mcp_id_seq'::regclass);


--
-- TOC entry 2953 (class 2604 OID 51994)
-- Name: mcr_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY mcmcylrepeat ALTER COLUMN mcr_id SET DEFAULT nextval('mcmcylrepeat_mcr_id_seq'::regclass);


--
-- TOC entry 2954 (class 2604 OID 51995)
-- Name: mcs_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY mcmcylsubstrate ALTER COLUMN mcs_id SET DEFAULT nextval('mcmcylsubstrate_mcs_id_seq'::regclass);


--
-- TOC entry 2955 (class 2604 OID 51996)
-- Name: ml_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY mcmline ALTER COLUMN ml_id SET DEFAULT nextval('mcmline_ml_id_seq'::regclass);


--
-- TOC entry 2956 (class 2604 OID 51997)
-- Name: mc_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY mcustmachine ALTER COLUMN mc_id SET DEFAULT nextval('mcustmachine_mc_id_seq1'::regclass);


--
-- TOC entry 2957 (class 2604 OID 51998)
-- Name: mc_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY mcustmachine_old ALTER COLUMN mc_id SET DEFAULT nextval('mcustmachine_mc_id_seq'::regclass);


--
-- TOC entry 2958 (class 2604 OID 51999)
-- Name: cp_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY mcustprinter ALTER COLUMN cp_id SET DEFAULT nextval('mcustprinter_cp_id_seq'::regclass);


--
-- TOC entry 2959 (class 2604 OID 52000)
-- Name: jbc_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY mjobbarcode ALTER COLUMN jbc_id SET DEFAULT nextval('mjobbarcode_jbc_id_seq'::regclass);


--
-- TOC entry 2960 (class 2604 OID 52001)
-- Name: jc_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY mjobcat ALTER COLUMN jc_id SET DEFAULT nextval('mjobcat_jc_id_seq'::regclass);


--
-- TOC entry 2961 (class 2604 OID 52002)
-- Name: jcl_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY mjobcatlookup ALTER COLUMN jcl_id SET DEFAULT nextval('mjobcatlookup_jcl_id_seq'::regclass);


--
-- TOC entry 2963 (class 2604 OID 52003)
-- Name: jo_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY mjoboutput ALTER COLUMN jo_id SET DEFAULT nextval('pndjoboutput_jo_id_seq'::regclass);


--
-- TOC entry 2964 (class 2604 OID 52004)
-- Name: jol_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY mjoboutputlookup ALTER COLUMN jol_id SET DEFAULT nextval('mjoboutputlookup_jol_id_seq'::regclass);


--
-- TOC entry 2968 (class 2604 OID 52005)
-- Name: js_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY mjobsheet ALTER COLUMN js_id SET DEFAULT nextval('mjobsheet_js_id_seq'::regclass);


--
-- TOC entry 2969 (class 2604 OID 52006)
-- Name: caval_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY mjscartonvalue ALTER COLUMN caval_id SET DEFAULT nextval('mjscartonvalue_caval_id_seq'::regclass);


--
-- TOC entry 2971 (class 2604 OID 52007)
-- Name: tc_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY mtnc ALTER COLUMN tc_id SET DEFAULT nextval('mtnc_tc_id_seq'::regclass);


--
-- TOC entry 2975 (class 2604 OID 52008)
-- Name: ad_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY pndaddress ALTER COLUMN ad_id SET DEFAULT nextval('pndaddress_ad_id_seq'::regclass);


--
-- TOC entry 2976 (class 2604 OID 52009)
-- Name: ct_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY pndcontact ALTER COLUMN ct_id SET DEFAULT nextval('pndcontact_ct_id_seq'::regclass);


--
-- TOC entry 2979 (class 2604 OID 52010)
-- Name: ph_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY pndphone ALTER COLUMN ph_id SET DEFAULT nextval('pndphone_ph_id_seq'::regclass);


--
-- TOC entry 3230 (class 0 OID 51550)
-- Dependencies: 410
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
-- TOC entry 3231 (class 0 OID 51556)
-- Dependencies: 411
-- Data for Name: fcdbaudit; Type: TABLE DATA; Schema: pnd; Owner: pnd
--



--
-- TOC entry 3414 (class 0 OID 0)
-- Dependencies: 412
-- Name: fcdbaudit_dba_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcdbaudit_dba_id_seq', 1, false);


--
-- TOC entry 3233 (class 0 OID 51565)
-- Dependencies: 413
-- Data for Name: fcdoc; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (147, '2014-07-08 06:49:41.33+08', 'uat_customer1', '129', 'js_id', NULL, 'Nescafe.rar', 'rar', '', 790.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (148, '2014-07-08 16:50:18.07+08', 'uat_artist1', '129', 'js_id', 'Artwork job done', 'Nescafe.rar', 'rar', '', 790.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (149, '2014-07-09 11:30:35.494+08', 'ysyow', '130', 'js_id', NULL, 'Rule.rar', 'rar', '', 12892.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (150, '2014-07-09 11:46:37.856+08', 'ysyow', '131', 'js_id', NULL, 'udv.rar', 'rar', '', 2327.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (151, '2014-07-09 12:36:14.042+08', 'ysyow', '132', 'js_id', NULL, 'udv.rar', 'rar', '', 2327.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (152, '2014-07-09 15:14:40.118+08', 'ysyow', '133', 'js_id', NULL, 'Rule.rar', 'rar', '', 12892.0000);


--
-- TOC entry 3415 (class 0 OID 0)
-- Dependencies: 414
-- Name: fcdoc_fd_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcdoc_fd_id_seq', 152, true);


--
-- TOC entry 3235 (class 0 OID 51574)
-- Dependencies: 415
-- Data for Name: fcemailsetting; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fcemailsetting (ms_id, ms_type, ms_hostname, ms_port, ms_username, ms_password) VALUES (1, 'MAILOUT', '202.190.181.92', '25', 'noreply@moiregc.com.my', 'User123');


--
-- TOC entry 3416 (class 0 OID 0)
-- Dependencies: 416
-- Name: fcemailsetting_ms_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcemailsetting_ms_id_seq', 1, true);


--
-- TOC entry 3237 (class 0 OID 51580)
-- Dependencies: 417
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
-- TOC entry 3238 (class 0 OID 51584)
-- Dependencies: 418
-- Data for Name: fclocale; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fclocale (lc_code, lc_description, lc_primary_langcode, lc_tzcode) VALUES ('MYWP', 'Wilayah KL', 'EN-US', 'Asia/Kuala_Lumpur');


--
-- TOC entry 3239 (class 0 OID 51587)
-- Dependencies: 419
-- Data for Name: fclocaleholiday; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fclocaleholiday (lch_id, lch_lccode, lch_date, lch_recurring, lch_description) VALUES (13, 'MYWP', '2012-01-01', 'Y', 'New Year');
INSERT INTO fclocaleholiday (lch_id, lch_lccode, lch_date, lch_recurring, lch_description) VALUES (14, 'MYWP', '2013-05-01', 'Y', 'Labour Day');
INSERT INTO fclocaleholiday (lch_id, lch_lccode, lch_date, lch_recurring, lch_description) VALUES (15, 'MYWP', '2014-08-10', 'N', 'Hari Raya');
INSERT INTO fclocaleholiday (lch_id, lch_lccode, lch_date, lch_recurring, lch_description) VALUES (16, 'MYWP', '2014-01-01', 'N', 'Haha Day');


--
-- TOC entry 3417 (class 0 OID 0)
-- Dependencies: 420
-- Name: fclocaleholiday_lch_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fclocaleholiday_lch_id_seq', 16, true);


--
-- TOC entry 3241 (class 0 OID 51593)
-- Dependencies: 421
-- Data for Name: fclocaleworkinghour; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fclocaleworkinghour (lcw_id, lcw_lccode, lcw_day, lcw_start_time, lcw_end_time) VALUES (20, 'MYWP', 'Mon', '09:00:00', '18:00:00');
INSERT INTO fclocaleworkinghour (lcw_id, lcw_lccode, lcw_day, lcw_start_time, lcw_end_time) VALUES (21, 'MYWP', 'Tue', '09:00:00', '18:00:00');
INSERT INTO fclocaleworkinghour (lcw_id, lcw_lccode, lcw_day, lcw_start_time, lcw_end_time) VALUES (22, 'MYWP', 'Wed', '09:00:00', '18:00:00');
INSERT INTO fclocaleworkinghour (lcw_id, lcw_lccode, lcw_day, lcw_start_time, lcw_end_time) VALUES (23, 'MYWP', 'Thu', '09:00:00', '18:00:00');
INSERT INTO fclocaleworkinghour (lcw_id, lcw_lccode, lcw_day, lcw_start_time, lcw_end_time) VALUES (24, 'MYWP', 'Fri', '09:00:00', '18:00:00');
INSERT INTO fclocaleworkinghour (lcw_id, lcw_lccode, lcw_day, lcw_start_time, lcw_end_time) VALUES (25, 'MYWP', 'Sat', '00:00:00', '23:59:59');
INSERT INTO fclocaleworkinghour (lcw_id, lcw_lccode, lcw_day, lcw_start_time, lcw_end_time) VALUES (26, 'MYWP', 'Sun', '00:00:00', '23:59:59');


--
-- TOC entry 3418 (class 0 OID 0)
-- Dependencies: 422
-- Name: fclocaleworkinghour_lcw_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fclocaleworkinghour_lcw_id_seq', 26, true);


--
-- TOC entry 3243 (class 0 OID 51598)
-- Dependencies: 423
-- Data for Name: fclog; Type: TABLE DATA; Schema: pnd; Owner: pnd
--



--
-- TOC entry 3419 (class 0 OID 0)
-- Dependencies: 424
-- Name: fclog_log_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fclog_log_id_seq', 1, false);


--
-- TOC entry 3245 (class 0 OID 51607)
-- Dependencies: 425
-- Data for Name: fclookup; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('JOBSTATUS', 'REQUIREMENT VERIFICATION', 'ROOT', 'REQUIREMENT VERIFICATION', 'ACTIVE', 123);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('JOBSTATUS', 'PENDING ARTIST ACKNOWLEDGE JOB', 'ROOT', 'PENDING ARTIST ACKNOWLEDGE JOB', 'ACTIVE', 124);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('JOBSTATUS', 'WORK IN PROGRESS', 'ROOT', 'WORK IN PROGRESS', 'ACTIVE', 125);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('JOBSTATUS', 'PENDING QC CHECK', 'ROOT', 'PENDING QC CHECK', 'ACTIVE', 126);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('JOBSTATUS', 'PENDING ACCEPTANCE', 'ROOT', 'PENDING ACCEPTANCE', 'ACTIVE', 128);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('JOBSTATUS', 'COMPLETED', 'ROOT', 'COMPLETED', 'ACTIVE', 129);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('JOBSTATUS', 'PENDING CUSTOMER RESOLUTION', 'ROOT', 'PENDING CUSTOMER RESOLUTION', 'ACTIVE', 137);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('OUTPUTTYPE', 'IMGSETTLE', 'ROOT', 'Image settle', 'ACTIVE', 138);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('OUTPUTTYPE', 'INKJET', 'ROOT', 'Inkjet film', 'ACTIVE', 139);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('ANILOXTYPE', 'CEWDB', 'ROOT', 'Ceramic with Doctor Blade', 'ACTIVE', 140);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('ANILOXTYPE', 'CEXDB', 'ROOT', 'Ceramic without Doctor Blade', 'ACTIVE', 141);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('ANILOXTYPE', 'CHWDB', 'ROOT', 'Chrome with Doctor Blade', 'ACTIVE', 142);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('ANILOXTYPE', 'CHXDB', 'ROOT', 'Chrome without Doctor Blade', 'ACTIVE', 143);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('QCLIST', 'SIZE', 'ROOT', 'Size passed', 'ACTIVE', 154);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('QCLIST', 'BCTYPE', 'ROOT', 'Barcode type passed', 'ACTIVE', 155);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('QCLIST', 'BCNUMBER', 'ROOT', 'Barcode number passed', 'ACTIVE', 156);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('QCLIST', 'COLORSEP', 'ROOT', 'Color seperation passed', 'ACTIVE', 157);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('QCLIST', 'DISTORTION', 'ROOT', 'Distortion passed', 'ACTIVE', 158);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('QCLIST', 'IMAGEPOS', 'ROOT', 'Image position passed', 'ACTIVE', 159);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('QCLIST', 'OVERLAPPING', 'ROOT', 'Overlapping passed', 'ACTIVE', 160);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('QCLIST', 'COLORTRAPPING', 'ROOT', 'Color Trapping passed', 'ACTIVE', 161);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('QCLIST', 'SCREENING', 'ROOT', 'Screening passed', 'ACTIVE', 162);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('QCLIST', 'SCREENINGANGLE', 'ROOT', 'Screening Angle passed', 'ACTIVE', 163);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('QCLIST', 'FINELINETEXT', 'ROOT', 'Fine Line / Text passed', 'ACTIVE', 164);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('QCLIST', 'REVERSEDLINE', 'ROOT', 'Reverse Line / Text passed', 'ACTIVE', 165);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('QCLIST', 'SPEELING', 'ROOT', 'Speeling passed', 'ACTIVE', 166);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('QCLIST', 'EMULSION', 'ROOT', 'Emulsion Surface passed', 'ACTIVE', 167);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('JOBSTATUS', 'CANCELLED', 'ROOT', 'CANCELLED', 'ACTIVE', 168);


--
-- TOC entry 3420 (class 0 OID 0)
-- Dependencies: 426
-- Name: fclookup_lu_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fclookup_lu_id_seq', 168, true);


--
-- TOC entry 3247 (class 0 OID 51614)
-- Dependencies: 427
-- Data for Name: fcmenu; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

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
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (98, 'LOCALE', 6, 'Locale Setup', 'ACTIVE', 100, NULL, 'Y', 'Setting', NULL, 'localesetup', NULL, NULL, NULL, NULL);
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (101, 'DBOSETUP', 6, 'DBO Setup', 'ACTIVE', 6500, NULL, 'Y', 'Setting', NULL, 'DBO', NULL, NULL, NULL, NULL);
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (102, 'ADVTRANSLATE', 6, 'Translation', 'ACTIVE', 7000, NULL, 'Y', 'Translate', NULL, 'advanceTranslate', NULL, NULL, NULL, NULL);
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (105, 'JOBSETUP', 91, 'Job related setup', 'ACTIVE', 1000, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (84, 'JOBCATSETUP', 105, 'Job category setup', 'ACTIVE', 1000, NULL, 'Y', 'Setting', NULL, 'jobcatsetup', NULL, NULL, 'ADMINSETTING', NULL);
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (104, 'JOBOUTPUT', 105, 'Job output setup', 'ACTIVE', 1200, NULL, 'Y', 'Setting', NULL, 'joboutputsetup', NULL, NULL, 'ADMINSETTING', NULL);
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (85, 'CARTONSETUP', 105, 'Carton setup', 'ACTIVE', 2000, NULL, 'Y', 'Setting', NULL, 'cartonSetup', NULL, NULL, 'ADMINSETTING', NULL);
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (106, 'WFSETUP', 91, 'Workflow related setup', 'ACTIVE', 2000, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, 'ADMINSETTING', NULL);
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (97, 'SLASETUP', 106, 'SLA Setup', 'ACTIVE', 2100, NULL, 'Y', 'Setting', NULL, 'timersetup', NULL, NULL, 'ADMINSETTING', NULL);
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (99, 'MAILTEMPLATE', 105, 'Mail Template Setup', 'ACTIVE', 3000, NULL, 'Y', 'Setting', NULL, 'mailtemplatesetup', NULL, NULL, NULL, NULL);
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (95, 'MACHINESETUP', 108, 'Customer machine setting', 'ACTIVE', 2000, NULL, 'Y', 'Setting', NULL, 'machinesetup', NULL, NULL, 'ADMINSETTING', NULL);
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (94, 'CUSTOMERSETUP', 108, 'Customer setup', 'ACTIVE', 1000, NULL, 'Y', 'Setting', NULL, 'orgsetup', NULL, NULL, 'ADMINSETTING', NULL);
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (100, 'CONTACTSETUP', 108, 'Contact Setup', 'ACTIVE', 3000, NULL, 'Y', 'Setting', NULL, 'contactsetup', NULL, NULL, NULL, NULL);
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (109, 'CUSTUSER', 108, 'Customer user setup', 'ACTIVE', 300, NULL, 'Y', 'Setting', NULL, 'custusersetting', NULL, NULL, 'ADMINSETTING', NULL);


--
-- TOC entry 3421 (class 0 OID 0)
-- Dependencies: 428
-- Name: fcmenu_mn_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcmenu_mn_id_seq', 109, true);


--
-- TOC entry 3422 (class 0 OID 0)
-- Dependencies: 429
-- Name: fcmenu_mn_parentid_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcmenu_mn_parentid_seq', 6, true);


--
-- TOC entry 3250 (class 0 OID 51625)
-- Dependencies: 430
-- Data for Name: fcorg; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fcorg (org_id, org_type, org_external, org_name, org_parentid, org_primaryid, org_address, org_contactno, org_status, org_lccode, org_concode) VALUES (2, NULL, 'Y', 'Carton box', 0, NULL, NULL, NULL, 'ACTIVE', NULL, NULL);
INSERT INTO fcorg (org_id, org_type, org_external, org_name, org_parentid, org_primaryid, org_address, org_contactno, org_status, org_lccode, org_concode) VALUES (3, NULL, 'Y', 'Grand fortune', 0, NULL, NULL, NULL, 'ACTIVE', NULL, NULL);
INSERT INTO fcorg (org_id, org_type, org_external, org_name, org_parentid, org_primaryid, org_address, org_contactno, org_status, org_lccode, org_concode) VALUES (4, NULL, 'Y', 'New box', 0, NULL, NULL, NULL, 'ACTIVE', NULL, NULL);
INSERT INTO fcorg (org_id, org_type, org_external, org_name, org_parentid, org_primaryid, org_address, org_contactno, org_status, org_lccode, org_concode) VALUES (5, NULL, 'Y', 'Deswell', 0, NULL, NULL, NULL, 'ACTIVE', NULL, NULL);
INSERT INTO fcorg (org_id, org_type, org_external, org_name, org_parentid, org_primaryid, org_address, org_contactno, org_status, org_lccode, org_concode) VALUES (6, NULL, 'Y', 'Darun', 0, NULL, NULL, NULL, 'ACTIVE', NULL, NULL);
INSERT INTO fcorg (org_id, org_type, org_external, org_name, org_parentid, org_primaryid, org_address, org_contactno, org_status, org_lccode, org_concode) VALUES (7, NULL, 'Y', 'Harta', 0, NULL, NULL, NULL, 'ACTIVE', NULL, NULL);
INSERT INTO fcorg (org_id, org_type, org_external, org_name, org_parentid, org_primaryid, org_address, org_contactno, org_status, org_lccode, org_concode) VALUES (8, NULL, 'Y', 'Genting ', 0, NULL, NULL, NULL, 'ACTIVE', NULL, NULL);
INSERT INTO fcorg (org_id, org_type, org_external, org_name, org_parentid, org_primaryid, org_address, org_contactno, org_status, org_lccode, org_concode) VALUES (1, NULL, 'N', 'PND', 0, NULL, NULL, NULL, 'ACTIVE', NULL, NULL);
INSERT INTO fcorg (org_id, org_type, org_external, org_name, org_parentid, org_primaryid, org_address, org_contactno, org_status, org_lccode, org_concode) VALUES (10, NULL, 'Y', 'Fong Corp', 1, NULL, 'Jalan Fong 1', '0120120123', 'ACTIVE', NULL, NULL);
INSERT INTO fcorg (org_id, org_type, org_external, org_name, org_parentid, org_primaryid, org_address, org_contactno, org_status, org_lccode, org_concode) VALUES (9, NULL, 'Y', 'UAT Customer 1', 1, NULL, '1 Jln Customer', '0123456789', 'ACTIVE', NULL, NULL);
INSERT INTO fcorg (org_id, org_type, org_external, org_name, org_parentid, org_primaryid, org_address, org_contactno, org_status, org_lccode, org_concode) VALUES (11, NULL, 'Y', 'Uat Customer 2', 1, NULL, 'Jalan customer 2', '012345678', 'ACTIVE', NULL, NULL);
INSERT INTO fcorg (org_id, org_type, org_external, org_name, org_parentid, org_primaryid, org_address, org_contactno, org_status, org_lccode, org_concode) VALUES (12, NULL, 'Y', 'Uat Customer 3', 1, NULL, 'Jalan customer 3', '123456789', 'ACTIVE', NULL, NULL);
INSERT INTO fcorg (org_id, org_type, org_external, org_name, org_parentid, org_primaryid, org_address, org_contactno, org_status, org_lccode, org_concode) VALUES (13, NULL, 'Y', 'Uat Customer 4', 1, NULL, 'Jalan customer 4', '012345678', 'ACTIVE', NULL, NULL);
INSERT INTO fcorg (org_id, org_type, org_external, org_name, org_parentid, org_primaryid, org_address, org_contactno, org_status, org_lccode, org_concode) VALUES (14, NULL, 'Y', 'Uat Customer 5', 1, NULL, 'Jalan customer 5', '1234', 'ACTIVE', NULL, NULL);
INSERT INTO fcorg (org_id, org_type, org_external, org_name, org_parentid, org_primaryid, org_address, org_contactno, org_status, org_lccode, org_concode) VALUES (15, NULL, 'Y', 'Test new', 1, NULL, 'Test new', 'Test new', 'ACTIVE', NULL, NULL);


--
-- TOC entry 3423 (class 0 OID 0)
-- Dependencies: 431
-- Name: fcorg_org_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcorg_org_id_seq', 15, true);


--
-- TOC entry 3252 (class 0 OID 51636)
-- Dependencies: 432
-- Data for Name: fcpermission; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fcpermission (pms_code, pms_desc) VALUES ('MENU_REPORT', 'VIEW REPORT');
INSERT INTO fcpermission (pms_code, pms_desc) VALUES ('MENU_SETTING', 'VIEW SETTINGS');
INSERT INTO fcpermission (pms_code, pms_desc) VALUES ('REQUEST_NEWJOB', 'Request new job');
INSERT INTO fcpermission (pms_code, pms_desc) VALUES ('QCHOME', 'View QC home');
INSERT INTO fcpermission (pms_code, pms_desc) VALUES ('ARTHOME', 'View artist home');
INSERT INTO fcpermission (pms_code, pms_desc) VALUES ('SUPHOME', 'View supervisor home');
INSERT INTO fcpermission (pms_code, pms_desc) VALUES ('CUSTHOME', 'View customer home');
INSERT INTO fcpermission (pms_code, pms_desc) VALUES ('ADMINSETTING', 'View Admin Setting');
INSERT INTO fcpermission (pms_code, pms_desc) VALUES ('POSBMENU', 'For POSB Admin');
INSERT INTO fcpermission (pms_code, pms_desc) VALUES ('ADMIN', 'IT Admin');
INSERT INTO fcpermission (pms_code, pms_desc) VALUES ('SEARCH_PMC', 'Search PM Case');


--
-- TOC entry 3254 (class 0 OID 51644)
-- Dependencies: 434
-- Data for Name: fcpmactivity; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fcpmactivity (pmat_id, pmat_pmwfid, pmat_pmslid, pmat_name, pmat_type, pmat_function, pmat_sla_interval, pmat_sla_workinghours_only, pmat_show_caseinfo, pmat_performed_message) VALUES (7, 1, NULL, 'Notify Manager On Late Requirement Verification', 'SCRIPT', 'notifyLateVerification', NULL, 'N', 'N', NULL);
INSERT INTO fcpmactivity (pmat_id, pmat_pmwfid, pmat_pmslid, pmat_name, pmat_type, pmat_function, pmat_sla_interval, pmat_sla_workinghours_only, pmat_show_caseinfo, pmat_performed_message) VALUES (8, 1, NULL, 'Notify Supervisor On Late Job Acknowledgement', 'SCRIPT', 'notifyLateAcknowledgement', NULL, 'N', 'N', NULL);
INSERT INTO fcpmactivity (pmat_id, pmat_pmwfid, pmat_pmslid, pmat_name, pmat_type, pmat_function, pmat_sla_interval, pmat_sla_workinghours_only, pmat_show_caseinfo, pmat_performed_message) VALUES (11, 1, NULL, 'Notify Supervisor and Manager On Late WIP', 'SCRIPT', 'notifyLateWIP', NULL, 'N', 'N', NULL);
INSERT INTO fcpmactivity (pmat_id, pmat_pmwfid, pmat_pmslid, pmat_name, pmat_type, pmat_function, pmat_sla_interval, pmat_sla_workinghours_only, pmat_show_caseinfo, pmat_performed_message) VALUES (12, 1, NULL, 'Notify Supervisor and Manager On Late QC Check', 'SCRIPT', 'notifyLateQC', NULL, 'N', 'N', NULL);
INSERT INTO fcpmactivity (pmat_id, pmat_pmwfid, pmat_pmslid, pmat_name, pmat_type, pmat_function, pmat_sla_interval, pmat_sla_workinghours_only, pmat_show_caseinfo, pmat_performed_message) VALUES (13, 1, NULL, 'Auto Accept', 'SCRIPT', 'autoCustomerAccept', NULL, 'N', 'N', NULL);
INSERT INTO fcpmactivity (pmat_id, pmat_pmwfid, pmat_pmslid, pmat_name, pmat_type, pmat_function, pmat_sla_interval, pmat_sla_workinghours_only, pmat_show_caseinfo, pmat_performed_message) VALUES (4, 1, 3, 'Work in progress ', 'USER', 'wip', '[[REQTIMEART]]', 'Y', 'Y', 'The job has successfully been sent to QC for verification.');
INSERT INTO fcpmactivity (pmat_id, pmat_pmwfid, pmat_pmslid, pmat_name, pmat_type, pmat_function, pmat_sla_interval, pmat_sla_workinghours_only, pmat_show_caseinfo, pmat_performed_message) VALUES (10, 1, 3, 'Rework in progress', 'USER', 'wip', '[[REQTIMEQC]]', 'Y', 'Y', 'The job has successfully been sent to QC for verification.');
INSERT INTO fcpmactivity (pmat_id, pmat_pmwfid, pmat_pmslid, pmat_name, pmat_type, pmat_function, pmat_sla_interval, pmat_sla_workinghours_only, pmat_show_caseinfo, pmat_performed_message) VALUES (5, 1, 4, 'Pending check (QC)', 'USER', 'pendingQC', '[[REQTIMEQC]]', 'Y', 'Y', 'The job has successfully been [[QCDEC_DISP]].');
INSERT INTO fcpmactivity (pmat_id, pmat_pmwfid, pmat_pmslid, pmat_name, pmat_type, pmat_function, pmat_sla_interval, pmat_sla_workinghours_only, pmat_show_caseinfo, pmat_performed_message) VALUES (6, 1, 1, 'Pending acceptance', 'USER', 'pendingCust', 'PT24H', 'Y', 'Y', 'The job has successfully been [[CUSTDEC_DISP]].');
INSERT INTO fcpmactivity (pmat_id, pmat_pmwfid, pmat_pmslid, pmat_name, pmat_type, pmat_function, pmat_sla_interval, pmat_sla_workinghours_only, pmat_show_caseinfo, pmat_performed_message) VALUES (9, 1, 2, 'Reassign Artist', 'USER', 'reassign', NULL, 'Y', 'Y', 'The job has successfully been assigned to artist.');
INSERT INTO fcpmactivity (pmat_id, pmat_pmwfid, pmat_pmslid, pmat_name, pmat_type, pmat_function, pmat_sla_interval, pmat_sla_workinghours_only, pmat_show_caseinfo, pmat_performed_message) VALUES (14, 1, NULL, 'Notify Customer Task Acknowledged', 'SCRIPT', 'notifyCustomerAck', NULL, 'N', 'N', NULL);
INSERT INTO fcpmactivity (pmat_id, pmat_pmwfid, pmat_pmslid, pmat_name, pmat_type, pmat_function, pmat_sla_interval, pmat_sla_workinghours_only, pmat_show_caseinfo, pmat_performed_message) VALUES (1, 1, 2, 'Requirement verification', 'USER', 'reqVerification', 'PT15M', 'Y', 'Y', 'The job has successfully been [[RVDEC_DISP]].');
INSERT INTO fcpmactivity (pmat_id, pmat_pmwfid, pmat_pmslid, pmat_name, pmat_type, pmat_function, pmat_sla_interval, pmat_sla_workinghours_only, pmat_show_caseinfo, pmat_performed_message) VALUES (2, 1, 1, 'Pending resolution ', 'USER', 'pendingRevert', NULL, 'Y', 'N', 'The job has successfully been [[CUSTRESODEC_DISP]].');


--
-- TOC entry 3424 (class 0 OID 0)
-- Dependencies: 433
-- Name: fcpmactivity_pmat_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcpmactivity_pmat_id_seq', 14, true);


--
-- TOC entry 3255 (class 0 OID 51653)
-- Dependencies: 435
-- Data for Name: fcpmcase; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fcpmcase (pmc_id, pmc_created_date, pmc_created_by, pmc_casekey, pmc_casetype, pmc_parentid, pmc_pmwfid, pmc_start_pmevid, pmc_start_date, pmc_end_pmevid, pmc_end_date, pmc_closed) VALUES (151, '2014-07-08 06:49:41+08', 'uat_customer1', 129, 'jobsheet', NULL, 1, 1, '2014-07-08 06:49:41+08', NULL, NULL, 'N');
INSERT INTO fcpmcase (pmc_id, pmc_created_date, pmc_created_by, pmc_casekey, pmc_casetype, pmc_parentid, pmc_pmwfid, pmc_start_pmevid, pmc_start_date, pmc_end_pmevid, pmc_end_date, pmc_closed) VALUES (152, '2014-07-09 11:30:35+08', 'ysyow', 130, 'jobsheet', NULL, 1, 1, '2014-07-09 11:30:35+08', NULL, NULL, 'N');
INSERT INTO fcpmcase (pmc_id, pmc_created_date, pmc_created_by, pmc_casekey, pmc_casetype, pmc_parentid, pmc_pmwfid, pmc_start_pmevid, pmc_start_date, pmc_end_pmevid, pmc_end_date, pmc_closed) VALUES (153, '2014-07-09 11:46:37+08', 'ysyow', 131, 'jobsheet', NULL, 1, 1, '2014-07-09 11:46:37+08', NULL, NULL, 'N');
INSERT INTO fcpmcase (pmc_id, pmc_created_date, pmc_created_by, pmc_casekey, pmc_casetype, pmc_parentid, pmc_pmwfid, pmc_start_pmevid, pmc_start_date, pmc_end_pmevid, pmc_end_date, pmc_closed) VALUES (154, '2014-07-09 12:36:14+08', 'ysyow', 132, 'jobsheet', NULL, 1, 1, '2014-07-09 12:36:14+08', 12, '2014-07-09 14:31:03+08', 'Y');
INSERT INTO fcpmcase (pmc_id, pmc_created_date, pmc_created_by, pmc_casekey, pmc_casetype, pmc_parentid, pmc_pmwfid, pmc_start_pmevid, pmc_start_date, pmc_end_pmevid, pmc_end_date, pmc_closed) VALUES (155, '2014-07-09 15:14:40+08', 'ysyow', 133, 'jobsheet', NULL, 1, 1, '2014-07-09 15:14:40+08', 12, '2014-07-09 15:17:04+08', 'Y');


--
-- TOC entry 3425 (class 0 OID 0)
-- Dependencies: 436
-- Name: fcpmcase_pmc_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcpmcase_pmc_id_seq', 155, true);


--
-- TOC entry 3257 (class 0 OID 51659)
-- Dependencies: 437
-- Data for Name: fcpmcasecomment; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (252, 151, NULL, '2014-07-08 06:49:41+08', 'uat_customer1', '1234', NULL, NULL, NULL, 'N', 1132);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (253, 151, NULL, '2014-07-08 16:49:19+08', 'uat_supervisor1', 'Artist1', NULL, NULL, NULL, 'N', 1133);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (254, 151, NULL, '2014-07-08 16:50:18+08', 'uat_artist1', '1234', NULL, NULL, NULL, 'N', 1140);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (255, 152, NULL, '2014-07-09 11:32:21+08', 'supervisor', 'asddsa', NULL, NULL, NULL, 'N', 1143);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (256, 153, NULL, '2014-07-09 11:46:58+08', 'supervisor', 'sdasd', NULL, NULL, NULL, 'N', 1154);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (257, 153, NULL, '2014-07-09 11:55:54+08', 'supervisor', 'asddsa', NULL, NULL, NULL, 'N', 1163);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (258, 154, NULL, '2014-07-09 12:36:31+08', 'supervisor', 'addsasad', NULL, NULL, NULL, 'N', 1176);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (259, 155, NULL, '2014-07-09 15:15:13+08', 'supervisor', 'not good enuff', NULL, NULL, NULL, 'N', 1182);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (260, 155, NULL, '2014-07-09 15:16:51+08', 'supervisor', 'asdas', NULL, NULL, NULL, 'N', 1186);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (261, 155, NULL, '2014-07-09 15:17:04+08', 'ysyow', 'not good i dont like', NULL, NULL, NULL, 'N', 1188);


--
-- TOC entry 3426 (class 0 OID 0)
-- Dependencies: 438
-- Name: fcpmcasecomment_pmcc_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcpmcasecomment_pmcc_id_seq', 261, true);


--
-- TOC entry 3259 (class 0 OID 51669)
-- Dependencies: 439
-- Data for Name: fcpmcasecommentread; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (242, 255, 'artist2', '2014-07-09 11:33:14+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (243, 256, 'artist2', '2014-07-09 11:56:11+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (244, 257, 'artist2', '2014-07-09 11:56:11+08');


--
-- TOC entry 3427 (class 0 OID 0)
-- Dependencies: 440
-- Name: fcpmcasecommentread_pmcr_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcpmcasecommentread_pmcr_id_seq', 244, true);


--
-- TOC entry 3261 (class 0 OID 51675)
-- Dependencies: 441
-- Data for Name: fcpmcaseflag; Type: TABLE DATA; Schema: pnd; Owner: pnd
--



--
-- TOC entry 3428 (class 0 OID 0)
-- Dependencies: 442
-- Name: fcpmcaseflag_pmcf_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcpmcaseflag_pmcf_id_seq', 44, true);


--
-- TOC entry 3263 (class 0 OID 51681)
-- Dependencies: 443
-- Data for Name: fcpmcaseflow; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (1132, 151, 1, 'PM_Event', NULL, NULL, '2014-07-08 06:49:41+08', '2014-07-08 06:49:41+08', 'DONE', NULL, '2014-07-08 06:49:41+08', 'uat_customer1', 1132, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (1133, 151, 1, 'PM_Activity', 1132, 1, '2014-07-08 06:49:41+08', '2014-07-08 16:49:20+08', 'DONE', '2014-07-08 07:04:41+08', '2014-07-08 16:49:19+08', 'uat_supervisor1', 1133, 'N', NULL, '2014-07-08 07:04:41+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (1134, 151, 1, 'PM_Gateway', 1133, 2, '2014-07-08 16:49:20+08', '2014-07-08 16:49:20+08', 'DONE', NULL, '2014-07-08 16:49:20+08', 'uat_supervisor1', 1134, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (1135, 151, 2, 'PM_Gateway', 1134, 4, '2014-07-08 16:49:20+08', '2014-07-08 16:49:20+08', 'DONE', NULL, '2014-07-08 16:49:20+08', 'uat_supervisor1', 1135, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (1137, 151, 3, 'PM_Event', 1135, 6, '2014-07-08 16:49:20+08', '2014-07-08 16:49:49+08', 'INTERRUPT', NULL, '2014-07-08 16:49:20+08', 'uat_artist1', 1136, 'Y', '2014-07-08 16:49:20+08', '2014-07-09 00:05:00+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (1136, 151, 2, 'PM_Event', 1135, 5, '2014-07-08 16:49:20+08', '2014-07-08 16:49:49+08', 'DONE', '2014-07-09 00:01:00+08', '2014-07-08 16:49:49+08', 'uat_artist1', 1136, 'Y', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (1138, 151, 4, 'PM_Gateway', 1136, 14, '2014-07-08 16:49:49+08', '2014-07-08 16:49:49+08', 'DONE', NULL, '2014-07-08 16:49:49+08', 'uat_artist1', 1138, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (1139, 151, 14, 'PM_Activity', 1138, 15, '2014-07-08 16:49:49+08', '2014-07-08 16:49:52+08', 'DONE', NULL, '2014-07-08 16:49:49+08', 'uat_artist1', 1139, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (1140, 151, 4, 'PM_Activity', 1139, 34, '2014-07-08 16:49:52+08', '2014-07-08 16:50:18+08', 'DONE', '2014-07-09 04:00:00+08', '2014-07-08 16:50:18+08', 'uat_artist1', 1140, 'N', NULL, '2014-07-09 04:00:00+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (1142, 152, 1, 'PM_Event', NULL, NULL, '2014-07-09 11:30:35+08', '2014-07-09 11:30:35+08', 'DONE', NULL, '2014-07-09 11:30:35+08', 'ysyow', 1142, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (1168, 153, 3, 'PM_Gateway', 1167, 9, '2014-07-09 11:56:38+08', '2014-07-09 11:56:38+08', 'DONE', NULL, '2014-07-09 11:56:38+08', 'artist2', 1168, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (1159, 153, 8, 'PM_Activity', 1158, 8, '2014-07-09 11:48:40+08', '2014-07-09 11:48:40+08', 'DONE', NULL, '2014-07-09 11:48:40+08', 'artist2', 1159, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (1143, 152, 1, 'PM_Activity', 1142, 1, '2014-07-09 11:30:35+08', '2014-07-09 11:32:22+08', 'DONE', '2014-07-09 11:45:35+08', '2014-07-09 11:32:21+08', 'supervisor', 1143, 'N', NULL, '2014-07-09 11:45:35+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (1144, 152, 1, 'PM_Gateway', 1143, 2, '2014-07-09 11:32:22+08', '2014-07-09 11:32:22+08', 'DONE', NULL, '2014-07-09 11:32:22+08', 'supervisor', 1144, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (1145, 152, 2, 'PM_Gateway', 1144, 4, '2014-07-09 11:32:22+08', '2014-07-09 11:32:22+08', 'DONE', NULL, '2014-07-09 11:32:22+08', 'supervisor', 1145, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (1160, 153, 3, 'PM_Gateway', 1159, 9, '2014-07-09 11:48:40+08', '2014-07-09 11:48:40+08', 'DONE', NULL, '2014-07-09 11:48:40+08', 'artist2', 1160, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (1147, 152, 3, 'PM_Event', 1145, 6, '2014-07-09 11:32:22+08', '2014-07-09 11:32:51+08', 'INTERRUPT', NULL, '2014-07-09 11:32:22+08', 'artist2', 1146, 'Y', '2014-07-09 11:32:22+08', '2014-07-09 11:37:22+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (1146, 152, 2, 'PM_Event', 1145, 5, '2014-07-09 11:32:22+08', '2014-07-09 11:32:51+08', 'DONE', '2014-07-09 11:33:22+08', '2014-07-09 11:32:51+08', 'artist2', 1146, 'Y', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (1148, 152, 4, 'PM_Gateway', 1146, 14, '2014-07-09 11:32:51+08', '2014-07-09 11:32:51+08', 'DONE', NULL, '2014-07-09 11:32:51+08', 'artist2', 1148, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (1169, 153, 2, 'PM_Event', 1168, 10, '2014-07-09 11:56:38+08', '2014-07-09 11:56:52+08', 'INTERRUPT', '2014-07-09 11:57:38+08', NULL, 'supervisor', 1170, 'Y', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (1149, 152, 14, 'PM_Activity', 1148, 15, '2014-07-09 11:32:51+08', '2014-07-09 11:32:51+08', 'DONE', NULL, '2014-07-09 11:32:51+08', 'artist2', 1149, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (1174, 153, 3, 'PM_Event', 1172, 6, '2014-07-09 11:58:26+08', NULL, NULL, NULL, '2014-07-09 11:58:26+08', NULL, NULL, 'Y', '2014-07-09 11:58:26+08', '2014-07-09 12:03:26+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (1170, 153, 4, 'PM_Event', 1168, 11, '2014-07-09 11:56:38+08', '2014-07-09 11:56:52+08', 'DONE', NULL, '2014-07-09 11:56:52+08', 'supervisor', 1170, 'Y', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (1141, 151, 5, 'PM_Activity', 1140, 17, '2014-07-08 16:50:18+08', NULL, NULL, '2014-07-09 01:20:00+08', '2014-07-09 11:37:23+08', NULL, NULL, 'N', '2014-07-09 11:37:23+08', '2014-07-09 12:57:23+08', 1);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (1151, 151, 12, 'PM_Activity', 1141, 30, '2014-07-09 11:37:23+08', '2014-07-09 11:37:23+08', 'DONE', NULL, '2014-07-09 11:37:23+08', 'artist2', 1151, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (1152, 151, 5, 'PM_Event', 1151, 22, '2014-07-09 11:37:23+08', '2014-07-09 11:37:23+08', 'END', NULL, '2014-07-09 11:37:23+08', 'artist2', 1152, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (1175, 154, 1, 'PM_Event', NULL, NULL, '2014-07-09 12:36:14+08', '2014-07-09 12:36:14+08', 'DONE', NULL, '2014-07-09 12:36:14+08', 'ysyow', 1175, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (1150, 152, 4, 'PM_Activity', 1149, 34, '2014-07-09 11:32:51+08', NULL, NULL, '2014-07-09 11:35:51+08', '2014-07-09 11:37:49+08', NULL, NULL, 'N', NULL, '2014-07-10 09:32:51+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (1153, 153, 1, 'PM_Event', NULL, NULL, '2014-07-09 11:46:37+08', '2014-07-09 11:46:37+08', 'DONE', NULL, '2014-07-09 11:46:37+08', 'ysyow', 1153, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (1161, 153, 2, 'PM_Event', 1160, 10, '2014-07-09 11:48:40+08', '2014-07-09 11:55:31+08', 'INTERRUPT', '2014-07-09 11:49:40+08', NULL, 'supervisor', 1162, 'Y', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (1154, 153, 1, 'PM_Activity', 1153, 1, '2014-07-09 11:46:37+08', '2014-07-09 11:46:58+08', 'DONE', '2014-07-09 12:01:37+08', '2014-07-09 11:46:58+08', 'supervisor', 1154, 'N', NULL, '2014-07-09 12:01:37+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (1162, 153, 4, 'PM_Event', 1160, 11, '2014-07-09 11:48:40+08', '2014-07-09 11:55:31+08', 'DONE', NULL, '2014-07-09 11:55:31+08', 'supervisor', 1162, 'Y', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (1155, 153, 1, 'PM_Gateway', 1154, 2, '2014-07-09 11:46:58+08', '2014-07-09 11:46:58+08', 'DONE', NULL, '2014-07-09 11:46:58+08', 'supervisor', 1155, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (1156, 153, 2, 'PM_Gateway', 1155, 4, '2014-07-09 11:46:58+08', '2014-07-09 11:46:58+08', 'DONE', NULL, '2014-07-09 11:46:58+08', 'supervisor', 1156, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (1188, 155, 2, 'PM_Activity', 1187, 3, '2014-07-09 15:16:51+08', '2014-07-09 15:17:04+08', 'DONE', NULL, '2014-07-09 15:17:04+08', 'ysyow', 1188, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (1180, 154, 12, 'PM_Event', 1179, 37, '2014-07-09 14:31:03+08', '2014-07-09 14:31:03+08', 'END', NULL, '2014-07-09 14:31:03+08', 'ysyow', 1180, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (1163, 153, 9, 'PM_Activity', 1162, 12, '2014-07-09 11:55:31+08', '2014-07-09 11:55:55+08', 'DONE', NULL, '2014-07-09 11:55:54+08', 'supervisor', 1163, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (1157, 153, 2, 'PM_Event', 1156, 5, '2014-07-09 11:46:58+08', '2014-07-09 11:48:40+08', 'INTERRUPT', '2014-07-09 11:47:58+08', NULL, 'artist2', 1158, 'Y', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (1158, 153, 3, 'PM_Event', 1156, 6, '2014-07-09 11:46:58+08', '2014-07-09 11:48:40+08', 'DONE', NULL, '2014-07-09 11:48:40+08', 'artist2', 1158, 'Y', '2014-07-09 11:48:40+08', '2014-07-09 11:47:51+08', 1);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (1176, 154, 1, 'PM_Activity', 1175, 1, '2014-07-09 12:36:14+08', '2014-07-09 12:36:31+08', 'DONE', '2014-07-09 12:51:14+08', '2014-07-09 12:36:31+08', 'supervisor', 1176, 'N', NULL, '2014-07-09 12:51:14+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (1164, 153, 2, 'PM_Gateway', 1163, 13, '2014-07-09 11:55:55+08', '2014-07-09 11:55:55+08', 'DONE', NULL, '2014-07-09 11:55:55+08', 'supervisor', 1164, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (1177, 154, 1, 'PM_Gateway', 1176, 2, '2014-07-09 12:36:31+08', '2014-07-09 12:36:31+08', 'DONE', NULL, '2014-07-09 12:36:31+08', 'supervisor', 1177, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (1165, 153, 2, 'PM_Event', 1164, 5, '2014-07-09 11:55:55+08', '2014-07-09 11:56:38+08', 'INTERRUPT', '2014-07-09 11:56:55+08', NULL, 'artist2', 1166, 'Y', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (1166, 153, 3, 'PM_Event', 1164, 6, '2014-07-09 11:55:55+08', '2014-07-09 11:56:38+08', 'DONE', NULL, '2014-07-09 11:56:38+08', 'artist2', 1166, 'Y', '2014-07-09 11:56:38+08', '2014-07-09 11:47:51+08', 1);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (1181, 155, 1, 'PM_Event', NULL, NULL, '2014-07-09 15:14:40+08', '2014-07-09 15:14:40+08', 'DONE', NULL, '2014-07-09 15:14:40+08', 'ysyow', 1181, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (1167, 153, 8, 'PM_Activity', 1166, 8, '2014-07-09 11:56:38+08', '2014-07-09 11:56:38+08', 'DONE', NULL, '2014-07-09 11:56:38+08', 'artist2', 1167, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (1187, 155, 1, 'PM_Gateway', 1186, 2, '2014-07-09 15:16:51+08', '2014-07-09 15:16:51+08', 'DONE', NULL, '2014-07-09 15:16:51+08', 'supervisor', 1187, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (1184, 155, 2, 'PM_Activity', 1183, 3, '2014-07-09 15:15:14+08', '2014-07-09 15:15:32+08', 'DONE', NULL, '2014-07-09 15:15:31+08', 'ysyow', 1184, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (1171, 153, 9, 'PM_Activity', 1170, 12, '2014-07-09 11:56:52+08', '2014-07-09 11:58:26+08', 'DONE', NULL, '2014-07-09 11:58:26+08', 'supervisor', 1171, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (1182, 155, 1, 'PM_Activity', 1181, 1, '2014-07-09 15:14:40+08', '2014-07-09 15:15:14+08', 'DONE', '2014-07-09 15:29:40+08', '2014-07-09 15:15:13+08', 'supervisor', 1182, 'N', NULL, '2014-07-09 15:29:40+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (1172, 153, 2, 'PM_Gateway', 1171, 13, '2014-07-09 11:58:26+08', '2014-07-09 11:58:26+08', 'DONE', NULL, '2014-07-09 11:58:26+08', 'supervisor', 1172, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (1173, 153, 2, 'PM_Event', 1172, 5, '2014-07-09 11:58:26+08', NULL, NULL, '2014-07-09 11:59:26+08', NULL, NULL, NULL, 'Y', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (1178, 154, 2, 'PM_Activity', 1177, 3, '2014-07-09 12:36:31+08', '2014-07-09 14:31:03+08', 'DONE', NULL, '2014-07-09 14:31:03+08', 'ysyow', 1178, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (1183, 155, 1, 'PM_Gateway', 1182, 2, '2014-07-09 15:15:14+08', '2014-07-09 15:15:14+08', 'DONE', NULL, '2014-07-09 15:15:14+08', 'supervisor', 1183, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (1179, 154, 7, 'PM_Gateway', 1178, 7, '2014-07-09 14:31:03+08', '2014-07-09 14:31:03+08', 'DONE', NULL, '2014-07-09 14:31:03+08', 'ysyow', 1179, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (1186, 155, 1, 'PM_Activity', 1185, 36, '2014-07-09 15:15:32+08', '2014-07-09 15:16:51+08', 'DONE', '2014-07-09 15:30:32+08', '2014-07-09 15:16:51+08', 'supervisor', 1186, 'N', NULL, '2014-07-09 15:30:32+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (1185, 155, 7, 'PM_Gateway', 1184, 7, '2014-07-09 15:15:32+08', '2014-07-09 15:15:32+08', 'DONE', NULL, '2014-07-09 15:15:32+08', 'ysyow', 1185, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (1189, 155, 7, 'PM_Gateway', 1188, 7, '2014-07-09 15:17:04+08', '2014-07-09 15:17:04+08', 'DONE', NULL, '2014-07-09 15:17:04+08', 'ysyow', 1189, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (1190, 155, 12, 'PM_Event', 1189, 37, '2014-07-09 15:17:04+08', '2014-07-09 15:17:04+08', 'END', NULL, '2014-07-09 15:17:04+08', 'ysyow', 1190, 'N', NULL, NULL, NULL);


--
-- TOC entry 3429 (class 0 OID 0)
-- Dependencies: 444
-- Name: fcpmcaseflow_pmf_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcpmcaseflow_pmf_id_seq', 1190, true);


--
-- TOC entry 3265 (class 0 OID 51687)
-- Dependencies: 445
-- Data for Name: fcpmcaseflowassign; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (228, 1132, NULL, NULL, NULL, 'REQUEST_NEWJOB');
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (229, 1133, NULL, 1, 19, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (230, 1136, 'uat_artist1', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (231, 1140, 'uat_artist1', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (232, 1141, NULL, 1, 18, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (233, 1142, NULL, NULL, NULL, 'REQUEST_NEWJOB');
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (234, 1143, NULL, 1, 19, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (235, 1146, 'artist2', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (236, 1150, 'artist2', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (237, 1153, NULL, NULL, NULL, 'REQUEST_NEWJOB');
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (238, 1154, NULL, 1, 19, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (239, 1157, 'artist2', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (240, 1161, 'artist2', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (241, 1162, NULL, 1, 19, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (242, 1163, NULL, 1, 19, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (243, 1165, 'artist2', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (244, 1169, 'artist2', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (245, 1170, NULL, 1, 19, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (246, 1171, NULL, 1, 19, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (247, 1173, 'artist1', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (248, 1175, NULL, NULL, NULL, 'REQUEST_NEWJOB');
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (249, 1176, NULL, 1, 19, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (250, 1178, 'ysyow', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (251, 1181, NULL, NULL, NULL, 'REQUEST_NEWJOB');
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (252, 1182, NULL, 1, 19, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (253, 1184, 'ysyow', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (254, 1186, NULL, 1, 19, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (255, 1188, 'ysyow', NULL, NULL, NULL);


--
-- TOC entry 3430 (class 0 OID 0)
-- Dependencies: 446
-- Name: fcpmcaseflowassign_pmfa_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcpmcaseflowassign_pmfa_id_seq', 255, true);


--
-- TOC entry 3267 (class 0 OID 51692)
-- Dependencies: 447
-- Data for Name: fcpmcasetype; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fcpmcasetype (pmct_code, pmct_desc, pmct_table, pmct_key_col, pmct_desc_col, pmct_caseinfo_function) VALUES ('jobsheet', 'jobsheet', 'mjobsheet', 'js_id', 'case when js_code is null then '''' else js_code||'' - '' end ||case when length(js_description) < 23 then js_description else substring(js_description,0,20)||''...'' end', 'viewJobInfo');


--
-- TOC entry 3268 (class 0 OID 51698)
-- Dependencies: 448
-- Data for Name: fcpmconnector; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fcpmconnector (pmcn_id, pmcn_from_type, pmcn_from_id, pmcn_to_type, pmcn_to_id, pmcn_order, pmcn_type, pmcn_rule) VALUES (1, 'PM_Event', 1, 'PM_Activity', 1, 1, 'NORMAL', NULL);
INSERT INTO fcpmconnector (pmcn_id, pmcn_from_type, pmcn_from_id, pmcn_to_type, pmcn_to_id, pmcn_order, pmcn_type, pmcn_rule) VALUES (14, 'PM_Event', 2, 'PM_Gateway', 4, 1, 'NORMAL', NULL);
INSERT INTO fcpmconnector (pmcn_id, pmcn_from_type, pmcn_from_id, pmcn_to_type, pmcn_to_id, pmcn_order, pmcn_type, pmcn_rule) VALUES (2, 'PM_Activity', 1, 'PM_Gateway', 1, 1, 'NORMAL', NULL);
INSERT INTO fcpmconnector (pmcn_id, pmcn_from_type, pmcn_from_id, pmcn_to_type, pmcn_to_id, pmcn_order, pmcn_type, pmcn_rule) VALUES (5, 'PM_Gateway', 2, 'PM_Event', 2, 1, 'NORMAL', NULL);
INSERT INTO fcpmconnector (pmcn_id, pmcn_from_type, pmcn_from_id, pmcn_to_type, pmcn_to_id, pmcn_order, pmcn_type, pmcn_rule) VALUES (17, 'PM_Activity', 4, 'PM_Activity', 5, 1, 'NORMAL', NULL);
INSERT INTO fcpmconnector (pmcn_id, pmcn_from_type, pmcn_from_id, pmcn_to_type, pmcn_to_id, pmcn_order, pmcn_type, pmcn_rule) VALUES (6, 'PM_Gateway', 2, 'PM_Event', 3, 2, 'NORMAL', NULL);
INSERT INTO fcpmconnector (pmcn_id, pmcn_from_type, pmcn_from_id, pmcn_to_type, pmcn_to_id, pmcn_order, pmcn_type, pmcn_rule) VALUES (18, 'PM_Activity', 5, 'PM_Gateway', 5, 1, 'NORMAL', NULL);
INSERT INTO fcpmconnector (pmcn_id, pmcn_from_type, pmcn_from_id, pmcn_to_type, pmcn_to_id, pmcn_order, pmcn_type, pmcn_rule) VALUES (8, 'PM_Event', 3, 'PM_Activity', 8, 1, 'NORMAL', NULL);
INSERT INTO fcpmconnector (pmcn_id, pmcn_from_type, pmcn_from_id, pmcn_to_type, pmcn_to_id, pmcn_order, pmcn_type, pmcn_rule) VALUES (9, 'PM_Activity', 8, 'PM_Gateway', 3, 1, 'NORMAL', NULL);
INSERT INTO fcpmconnector (pmcn_id, pmcn_from_type, pmcn_from_id, pmcn_to_type, pmcn_to_id, pmcn_order, pmcn_type, pmcn_rule) VALUES (10, 'PM_Gateway', 3, 'PM_Event', 2, 1, 'NORMAL', NULL);
INSERT INTO fcpmconnector (pmcn_id, pmcn_from_type, pmcn_from_id, pmcn_to_type, pmcn_to_id, pmcn_order, pmcn_type, pmcn_rule) VALUES (20, 'PM_Activity', 10, 'PM_Activity', 5, 1, 'NORMAL', NULL);
INSERT INTO fcpmconnector (pmcn_id, pmcn_from_type, pmcn_from_id, pmcn_to_type, pmcn_to_id, pmcn_order, pmcn_type, pmcn_rule) VALUES (11, 'PM_Gateway', 3, 'PM_Event', 4, 2, 'NORMAL', NULL);
INSERT INTO fcpmconnector (pmcn_id, pmcn_from_type, pmcn_from_id, pmcn_to_type, pmcn_to_id, pmcn_order, pmcn_type, pmcn_rule) VALUES (12, 'PM_Event', 4, 'PM_Activity', 9, 1, 'NORMAL', NULL);
INSERT INTO fcpmconnector (pmcn_id, pmcn_from_type, pmcn_from_id, pmcn_to_type, pmcn_to_id, pmcn_order, pmcn_type, pmcn_rule) VALUES (21, 'PM_Activity', 11, 'PM_Event', 5, 1, 'NORMAL', NULL);
INSERT INTO fcpmconnector (pmcn_id, pmcn_from_type, pmcn_from_id, pmcn_to_type, pmcn_to_id, pmcn_order, pmcn_type, pmcn_rule) VALUES (13, 'PM_Activity', 9, 'PM_Gateway', 2, 1, 'NORMAL', NULL);
INSERT INTO fcpmconnector (pmcn_id, pmcn_from_type, pmcn_from_id, pmcn_to_type, pmcn_to_id, pmcn_order, pmcn_type, pmcn_rule) VALUES (22, 'PM_Activity', 12, 'PM_Event', 5, 1, 'NORMAL', NULL);
INSERT INTO fcpmconnector (pmcn_id, pmcn_from_type, pmcn_from_id, pmcn_to_type, pmcn_to_id, pmcn_order, pmcn_type, pmcn_rule) VALUES (24, 'PM_Activity', 6, 'PM_Gateway', 6, 1, 'NORMAL', NULL);
INSERT INTO fcpmconnector (pmcn_id, pmcn_from_type, pmcn_from_id, pmcn_to_type, pmcn_to_id, pmcn_order, pmcn_type, pmcn_rule) VALUES (27, 'PM_Event', 7, 'PM_Activity', 7, 1, 'NORMAL', NULL);
INSERT INTO fcpmconnector (pmcn_id, pmcn_from_type, pmcn_from_id, pmcn_to_type, pmcn_to_id, pmcn_order, pmcn_type, pmcn_rule) VALUES (28, 'PM_Activity', 7, 'PM_Event', 5, 1, 'NORMAL', NULL);
INSERT INTO fcpmconnector (pmcn_id, pmcn_from_type, pmcn_from_id, pmcn_to_type, pmcn_to_id, pmcn_order, pmcn_type, pmcn_rule) VALUES (29, 'PM_Event', 8, 'PM_Activity', 11, 1, 'NORMAL', NULL);
INSERT INTO fcpmconnector (pmcn_id, pmcn_from_type, pmcn_from_id, pmcn_to_type, pmcn_to_id, pmcn_order, pmcn_type, pmcn_rule) VALUES (30, 'PM_Event', 9, 'PM_Activity', 12, 1, 'NORMAL', NULL);
INSERT INTO fcpmconnector (pmcn_id, pmcn_from_type, pmcn_from_id, pmcn_to_type, pmcn_to_id, pmcn_order, pmcn_type, pmcn_rule) VALUES (31, 'PM_Event', 10, 'PM_Activity', 11, 1, 'NORMAL', NULL);
INSERT INTO fcpmconnector (pmcn_id, pmcn_from_type, pmcn_from_id, pmcn_to_type, pmcn_to_id, pmcn_order, pmcn_type, pmcn_rule) VALUES (32, 'PM_Event', 11, 'PM_Activity', 13, 1, 'NORMAL', NULL);
INSERT INTO fcpmconnector (pmcn_id, pmcn_from_type, pmcn_from_id, pmcn_to_type, pmcn_to_id, pmcn_order, pmcn_type, pmcn_rule) VALUES (33, 'PM_Activity', 13, 'PM_Event', 6, 1, 'NORMAL', NULL);
INSERT INTO fcpmconnector (pmcn_id, pmcn_from_type, pmcn_from_id, pmcn_to_type, pmcn_to_id, pmcn_order, pmcn_type, pmcn_rule) VALUES (4, 'PM_Gateway', 1, 'PM_Gateway', 2, 1, 'NORMAL', '1::true');
INSERT INTO fcpmconnector (pmcn_id, pmcn_from_type, pmcn_from_id, pmcn_to_type, pmcn_to_id, pmcn_order, pmcn_type, pmcn_rule) VALUES (3, 'PM_Gateway', 1, 'PM_Activity', 2, 2, 'NORMAL', '1::false');
INSERT INTO fcpmconnector (pmcn_id, pmcn_from_type, pmcn_from_id, pmcn_to_type, pmcn_to_id, pmcn_order, pmcn_type, pmcn_rule) VALUES (23, 'PM_Gateway', 5, 'PM_Activity', 6, 1, 'NORMAL', '2::false');
INSERT INTO fcpmconnector (pmcn_id, pmcn_from_type, pmcn_from_id, pmcn_to_type, pmcn_to_id, pmcn_order, pmcn_type, pmcn_rule) VALUES (19, 'PM_Gateway', 5, 'PM_Activity', 10, 2, 'NORMAL', '2::true');
INSERT INTO fcpmconnector (pmcn_id, pmcn_from_type, pmcn_from_id, pmcn_to_type, pmcn_to_id, pmcn_order, pmcn_type, pmcn_rule) VALUES (26, 'PM_Gateway', 6, 'PM_Activity', 1, 2, 'NORMAL', '3::false');
INSERT INTO fcpmconnector (pmcn_id, pmcn_from_type, pmcn_from_id, pmcn_to_type, pmcn_to_id, pmcn_order, pmcn_type, pmcn_rule) VALUES (25, 'PM_Gateway', 6, 'PM_Event', 6, 1, 'NORMAL', '3::true');
INSERT INTO fcpmconnector (pmcn_id, pmcn_from_type, pmcn_from_id, pmcn_to_type, pmcn_to_id, pmcn_order, pmcn_type, pmcn_rule) VALUES (16, 'PM_Gateway', 4, 'PM_Activity', 10, 2, 'NORMAL', NULL);
INSERT INTO fcpmconnector (pmcn_id, pmcn_from_type, pmcn_from_id, pmcn_to_type, pmcn_to_id, pmcn_order, pmcn_type, pmcn_rule) VALUES (15, 'PM_Gateway', 4, 'PM_Activity', 14, 1, 'NORMAL', '4::false');
INSERT INTO fcpmconnector (pmcn_id, pmcn_from_type, pmcn_from_id, pmcn_to_type, pmcn_to_id, pmcn_order, pmcn_type, pmcn_rule) VALUES (34, 'PM_Activity', 14, 'PM_Activity', 4, 1, 'NORMAL', NULL);
INSERT INTO fcpmconnector (pmcn_id, pmcn_from_type, pmcn_from_id, pmcn_to_type, pmcn_to_id, pmcn_order, pmcn_type, pmcn_rule) VALUES (7, 'PM_Activity', 2, 'PM_Gateway', 7, 1, 'NORMAL', NULL);
INSERT INTO fcpmconnector (pmcn_id, pmcn_from_type, pmcn_from_id, pmcn_to_type, pmcn_to_id, pmcn_order, pmcn_type, pmcn_rule) VALUES (36, 'PM_Gateway', 7, 'PM_Activity', 1, 1, 'NORMAL', '5::false');
INSERT INTO fcpmconnector (pmcn_id, pmcn_from_type, pmcn_from_id, pmcn_to_type, pmcn_to_id, pmcn_order, pmcn_type, pmcn_rule) VALUES (37, 'PM_Gateway', 7, 'PM_Event', 12, 2, 'NORMAL', '5::true');


--
-- TOC entry 3431 (class 0 OID 0)
-- Dependencies: 449
-- Name: fcpmconnector_pmcn_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcpmconnector_pmcn_id_seq', 37, true);


--
-- TOC entry 3270 (class 0 OID 51703)
-- Dependencies: 450
-- Data for Name: fcpmevent; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fcpmevent (pmev_id, pmev_pmwfid, pmev_pmslid, pmev_name, pmev_type, pmev_type_cat, pmev_intermediate_function, pmev_timer_interval, pmev_timer_workinghours_only, pmev_intermediate_show_task, pmev_attach_pmatid, pmev_timer_non_interrupt_once, pmev_start_function, pmev_performed_message) VALUES (5, 1, NULL, 'Notify End', 'END', NULL, NULL, NULL, 'N', 'N', NULL, NULL, NULL, NULL);
INSERT INTO fcpmevent (pmev_id, pmev_pmwfid, pmev_pmslid, pmev_name, pmev_type, pmev_type_cat, pmev_intermediate_function, pmev_timer_interval, pmev_timer_workinghours_only, pmev_intermediate_show_task, pmev_attach_pmatid, pmev_timer_non_interrupt_once, pmev_start_function, pmev_performed_message) VALUES (6, 1, NULL, 'Job Close', 'END', NULL, NULL, NULL, 'N', 'N', NULL, NULL, NULL, NULL);
INSERT INTO fcpmevent (pmev_id, pmev_pmwfid, pmev_pmslid, pmev_name, pmev_type, pmev_type_cat, pmev_intermediate_function, pmev_timer_interval, pmev_timer_workinghours_only, pmev_intermediate_show_task, pmev_attach_pmatid, pmev_timer_non_interrupt_once, pmev_start_function, pmev_performed_message) VALUES (8, 1, NULL, 'Late WIP Timer', 'TIMER', 'NONINTERRUPTING', NULL, '[[REQTIMEART]]', 'Y', 'N', 4, 'Y', NULL, NULL);
INSERT INTO fcpmevent (pmev_id, pmev_pmwfid, pmev_pmslid, pmev_name, pmev_type, pmev_type_cat, pmev_intermediate_function, pmev_timer_interval, pmev_timer_workinghours_only, pmev_intermediate_show_task, pmev_attach_pmatid, pmev_timer_non_interrupt_once, pmev_start_function, pmev_performed_message) VALUES (9, 1, NULL, 'Late QC Timer', 'TIMER', 'NONINTERRUPTING', NULL, '[[REQTIMEQC]]', 'Y', 'N', 5, 'Y', NULL, NULL);
INSERT INTO fcpmevent (pmev_id, pmev_pmwfid, pmev_pmslid, pmev_name, pmev_type, pmev_type_cat, pmev_intermediate_function, pmev_timer_interval, pmev_timer_workinghours_only, pmev_intermediate_show_task, pmev_attach_pmatid, pmev_timer_non_interrupt_once, pmev_start_function, pmev_performed_message) VALUES (10, 1, NULL, 'Late Re-WIP Timer', 'TIMER', 'NONINTERRUPTING', NULL, '[[REQTIMEQC]]', 'Y', 'N', 10, 'Y', NULL, NULL);
INSERT INTO fcpmevent (pmev_id, pmev_pmwfid, pmev_pmslid, pmev_name, pmev_type, pmev_type_cat, pmev_intermediate_function, pmev_timer_interval, pmev_timer_workinghours_only, pmev_intermediate_show_task, pmev_attach_pmatid, pmev_timer_non_interrupt_once, pmev_start_function, pmev_performed_message) VALUES (11, 1, NULL, 'Auto Customer Acceptance Timer', 'TIMER', 'INTERRUPTING', NULL, 'P1D', 'Y', 'N', 6, 'Y', NULL, NULL);
INSERT INTO fcpmevent (pmev_id, pmev_pmwfid, pmev_pmslid, pmev_name, pmev_type, pmev_type_cat, pmev_intermediate_function, pmev_timer_interval, pmev_timer_workinghours_only, pmev_intermediate_show_task, pmev_attach_pmatid, pmev_timer_non_interrupt_once, pmev_start_function, pmev_performed_message) VALUES (1, 1, 5, 'New Job', 'START', NULL, NULL, NULL, 'N', 'N', NULL, NULL, 'newJob', 'Job has been submitted successfully.');
INSERT INTO fcpmevent (pmev_id, pmev_pmwfid, pmev_pmslid, pmev_name, pmev_type, pmev_type_cat, pmev_intermediate_function, pmev_timer_interval, pmev_timer_workinghours_only, pmev_intermediate_show_task, pmev_attach_pmatid, pmev_timer_non_interrupt_once, pmev_start_function, pmev_performed_message) VALUES (4, 1, 2, 'Pull Back', 'INTERMEDIATE', NULL, 'updPullBackStatus', NULL, 'N', 'Y', NULL, NULL, NULL, NULL);
INSERT INTO fcpmevent (pmev_id, pmev_pmwfid, pmev_pmslid, pmev_name, pmev_type, pmev_type_cat, pmev_intermediate_function, pmev_timer_interval, pmev_timer_workinghours_only, pmev_intermediate_show_task, pmev_attach_pmatid, pmev_timer_non_interrupt_once, pmev_start_function, pmev_performed_message) VALUES (2, 1, 3, 'Acknowledge Job', 'INTERMEDIATE', NULL, 'updAcknowdgeJobStatus', 'PT1M', 'Y', 'Y', NULL, NULL, NULL, NULL);
INSERT INTO fcpmevent (pmev_id, pmev_pmwfid, pmev_pmslid, pmev_name, pmev_type, pmev_type_cat, pmev_intermediate_function, pmev_timer_interval, pmev_timer_workinghours_only, pmev_intermediate_show_task, pmev_attach_pmatid, pmev_timer_non_interrupt_once, pmev_start_function, pmev_performed_message) VALUES (7, 1, NULL, 'Late Requirement Verification Timer', 'TIMER', 'NONINTERRUPTING', NULL, 'PT15M', 'Y', 'N', 1, 'N', NULL, NULL);
INSERT INTO fcpmevent (pmev_id, pmev_pmwfid, pmev_pmslid, pmev_name, pmev_type, pmev_type_cat, pmev_intermediate_function, pmev_timer_interval, pmev_timer_workinghours_only, pmev_intermediate_show_task, pmev_attach_pmatid, pmev_timer_non_interrupt_once, pmev_start_function, pmev_performed_message) VALUES (3, 1, NULL, 'Late Job Acknowledgement', 'TIMER', NULL, NULL, 'PT5M', 'Y', 'N', NULL, NULL, NULL, NULL);
INSERT INTO fcpmevent (pmev_id, pmev_pmwfid, pmev_pmslid, pmev_name, pmev_type, pmev_type_cat, pmev_intermediate_function, pmev_timer_interval, pmev_timer_workinghours_only, pmev_intermediate_show_task, pmev_attach_pmatid, pmev_timer_non_interrupt_once, pmev_start_function, pmev_performed_message) VALUES (12, 1, NULL, 'Job Canceled', 'END', NULL, NULL, NULL, 'N', 'N', NULL, NULL, NULL, NULL);


--
-- TOC entry 3432 (class 0 OID 0)
-- Dependencies: 451
-- Name: fcpmevent_pmev_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcpmevent_pmev_id_seq', 12, true);


--
-- TOC entry 3272 (class 0 OID 51713)
-- Dependencies: 452
-- Data for Name: fcpmgateway; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fcpmgateway (pmgw_id, pmgw_pmwfid, pmgw_pmslid, pmgw_name, pmgw_type, pmgw_type_cat) VALUES (2, 1, NULL, 'Acknowledge & Notify', 'EVENTEXCLUSIVE', 'DIVERGENCE');
INSERT INTO fcpmgateway (pmgw_id, pmgw_pmwfid, pmgw_pmslid, pmgw_name, pmgw_type, pmgw_type_cat) VALUES (3, 1, NULL, 'Acknowledge & Pullback', 'EVENTEXCLUSIVE', 'DIVERGENCE');
INSERT INTO fcpmgateway (pmgw_id, pmgw_pmwfid, pmgw_pmslid, pmgw_name, pmgw_type, pmgw_type_cat) VALUES (1, 1, NULL, 'Check Requirement Amendment', 'EXCLUSIVE', 'DIVERGENCE');
INSERT INTO fcpmgateway (pmgw_id, pmgw_pmwfid, pmgw_pmslid, pmgw_name, pmgw_type, pmgw_type_cat) VALUES (4, 1, NULL, 'Check Is Reverted Case', 'EXCLUSIVE', 'DIVERGENCE');
INSERT INTO fcpmgateway (pmgw_id, pmgw_pmwfid, pmgw_pmslid, pmgw_name, pmgw_type, pmgw_type_cat) VALUES (5, 1, NULL, 'Check QC Result', 'EXCLUSIVE', 'DIVERGENCE');
INSERT INTO fcpmgateway (pmgw_id, pmgw_pmwfid, pmgw_pmslid, pmgw_name, pmgw_type, pmgw_type_cat) VALUES (6, 1, NULL, 'Check Customer Acceptance', 'EXCLUSIVE', 'DIVERGENCE');
INSERT INTO fcpmgateway (pmgw_id, pmgw_pmwfid, pmgw_pmslid, pmgw_name, pmgw_type, pmgw_type_cat) VALUES (7, 1, NULL, 'Check Customer Resolution', 'EXCLUSIVE', 'DIVERGENCE');


--
-- TOC entry 3433 (class 0 OID 0)
-- Dependencies: 453
-- Name: fcpmgateway_pmgw_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcpmgateway_pmgw_id_seq', 7, true);


--
-- TOC entry 3274 (class 0 OID 51718)
-- Dependencies: 454
-- Data for Name: fcpmswimlane; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fcpmswimlane (pmsl_id, pmsl_pmwfid, pmsl_name, pmsl_order) VALUES (2, 1, 'Supervisor', 200);
INSERT INTO fcpmswimlane (pmsl_id, pmsl_pmwfid, pmsl_name, pmsl_order) VALUES (3, 1, 'Artist', 300);
INSERT INTO fcpmswimlane (pmsl_id, pmsl_pmwfid, pmsl_name, pmsl_order) VALUES (4, 1, 'QC', 400);
INSERT INTO fcpmswimlane (pmsl_id, pmsl_pmwfid, pmsl_name, pmsl_order) VALUES (5, 1, 'Job Requestors', 50);
INSERT INTO fcpmswimlane (pmsl_id, pmsl_pmwfid, pmsl_name, pmsl_order) VALUES (1, 1, 'Job Requestor', 100);


--
-- TOC entry 3434 (class 0 OID 0)
-- Dependencies: 455
-- Name: fcpmswimlane_pmsl_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcpmswimlane_pmsl_id_seq', 4, true);


--
-- TOC entry 3276 (class 0 OID 51723)
-- Dependencies: 456
-- Data for Name: fcpmswimlanesetup; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fcpmswimlanesetup (pmss_id, pmss_pmslid, pmss_userid, pmss_orgid, pmss_rolid, pmss_pmscode) VALUES (2, 2, NULL, '1', '19', NULL);
INSERT INTO fcpmswimlanesetup (pmss_id, pmss_pmslid, pmss_userid, pmss_orgid, pmss_rolid, pmss_pmscode) VALUES (3, 3, '[[JS_ASSIGN_ARTIST]]', NULL, NULL, NULL);
INSERT INTO fcpmswimlanesetup (pmss_id, pmss_pmslid, pmss_userid, pmss_orgid, pmss_rolid, pmss_pmscode) VALUES (4, 4, NULL, '1', '18', NULL);
INSERT INTO fcpmswimlanesetup (pmss_id, pmss_pmslid, pmss_userid, pmss_orgid, pmss_rolid, pmss_pmscode) VALUES (5, 5, NULL, NULL, NULL, 'REQUEST_NEWJOB');
INSERT INTO fcpmswimlanesetup (pmss_id, pmss_pmslid, pmss_userid, pmss_orgid, pmss_rolid, pmss_pmscode) VALUES (1, 1, '[[JS_REQUESTOR_USERID]]', NULL, NULL, NULL);


--
-- TOC entry 3435 (class 0 OID 0)
-- Dependencies: 457
-- Name: fcpmswimlanesetup_pmss_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcpmswimlanesetup_pmss_id_seq', 1, false);


--
-- TOC entry 3278 (class 0 OID 51728)
-- Dependencies: 458
-- Data for Name: fcpmworkflow; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fcpmworkflow (pmwf_id, pmwf_name) VALUES (1, 'Artwork job');


--
-- TOC entry 3436 (class 0 OID 0)
-- Dependencies: 459
-- Name: fcpmworkflow_pmwf_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcpmworkflow_pmwf_id_seq', 1, true);


--
-- TOC entry 3280 (class 0 OID 51733)
-- Dependencies: 460
-- Data for Name: fcrole; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fcrole (rol_id, rol_name) VALUES (18, 'QC');
INSERT INTO fcrole (rol_id, rol_name) VALUES (14, 'Customer');
INSERT INTO fcrole (rol_id, rol_name) VALUES (20, 'Artist');
INSERT INTO fcrole (rol_id, rol_name) VALUES (22, 'PND Admin');
INSERT INTO fcrole (rol_id, rol_name) VALUES (19, 'Supervisor');
INSERT INTO fcrole (rol_id, rol_name) VALUES (23, 'Manager');
INSERT INTO fcrole (rol_id, rol_name) VALUES (10, 'admin');


--
-- TOC entry 3437 (class 0 OID 0)
-- Dependencies: 461
-- Name: fcrole_rol_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcrole_rol_id_seq', 23, true);


--
-- TOC entry 3282 (class 0 OID 51741)
-- Dependencies: 462
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
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (148, 16, 'ARTHOME');
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (150, 14, 'REQUEST_NEWJOB');
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (151, 14, 'CUSTHOME');
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (159, 20, 'ARTHOME');
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (169, 22, 'MENU_REPORT');
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (170, 22, 'REQUEST_NEWJOB');
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (171, 22, 'QCHOME');
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (172, 22, 'ARTHOME');
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (173, 22, 'SUPHOME');
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (174, 22, 'CUSTHOME');
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (175, 22, 'ADMINSETTING');
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (176, 19, 'REQUEST_NEWJOB');
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (177, 19, 'SUPHOME');
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (178, 23, 'MENU_REPORT');
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (179, 23, 'MENU_SETTING');
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (180, 23, 'REQUEST_NEWJOB');
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (181, 23, 'QCHOME');
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (182, 23, 'ARTHOME');
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (183, 23, 'SUPHOME');
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (184, 23, 'CUSTHOME');
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (185, 23, 'ADMINSETTING');
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (186, 10, 'MENU_REPORT');
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (187, 10, 'MENU_SETTING');
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (188, 10, 'REQUEST_NEWJOB');
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (189, 10, 'QCHOME');
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (190, 10, 'ARTHOME');
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (191, 10, 'SUPHOME');
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (192, 10, 'CUSTHOME');
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (193, 10, 'ADMINSETTING');
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (194, 10, 'POSBMENU');
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (195, 10, 'ADMIN');
INSERT INTO fcroleperm (rp_id, rp_rolid, rp_pmscode) VALUES (196, 10, 'SEARCH_PMC');


--
-- TOC entry 3438 (class 0 OID 0)
-- Dependencies: 463
-- Name: fcroleperm_rp_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcroleperm_rp_id_seq', 196, true);


--
-- TOC entry 3284 (class 0 OID 51746)
-- Dependencies: 464
-- Data for Name: fcrule; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fcrule (ru_id, ru_name, ru_true_msg, ru_false_msg, ru_data) VALUES (1, 'Requirement verification decision?', 'Assigned', 'Reverted', '[{"oper":"&&","clausetype":"udv","clausecode":"RVDEC","clauseoper":"==","clauseval":"Assign"}]');
INSERT INTO fcrule (ru_id, ru_name, ru_true_msg, ru_false_msg, ru_data) VALUES (2, 'QC check decision', 'Revert', 'Forward to customer', '[{"oper":"&&","clausetype":"udv","clausecode":"QCDEC","clauseoper":"==","clauseval":"Revert"}]');
INSERT INTO fcrule (ru_id, ru_name, ru_true_msg, ru_false_msg, ru_data) VALUES (3, 'Customer acceptance decision?', 'Accept', 'Revert', '[{"oper":"&&","clausetype":"udv","clausecode":"CUSTDEC","clauseoper":"==","clauseval":"Accept"}]');
INSERT INTO fcrule (ru_id, ru_name, ru_true_msg, ru_false_msg, ru_data) VALUES (4, 'Is reverted job?', 'Yes', 'No', '[{"oper":"&&","clausetype":"udv","clausecode":"JS_WIP_BEFORE","clauseoper":"==","clauseval":"Y"}]');
INSERT INTO fcrule (ru_id, ru_name, ru_true_msg, ru_false_msg, ru_data) VALUES (5, 'Customer Resolution Cancelled?', 'Cancelled', 'Not Cancelled', '[{"oper":"&&","clausetype":"udv","clausecode":"CUSTRESODEC","clauseoper":"==","clauseval":"Cancel"}]');


--
-- TOC entry 3439 (class 0 OID 0)
-- Dependencies: 465
-- Name: fcrule_ru_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcrule_ru_id_seq', 5, true);


--
-- TOC entry 3286 (class 0 OID 51754)
-- Dependencies: 466
-- Data for Name: fcsetting; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fcsetting (set_id, set_user, set_code, set_description, set_val) VALUES (5, '*', 'THEME', 'Theme', 'pixeladmin');
INSERT INTO fcsetting (set_id, set_user, set_code, set_description, set_val) VALUES (1, '*', 'LANG', 'Default Language', 'EN-US');
INSERT INTO fcsetting (set_id, set_user, set_code, set_description, set_val) VALUES (8, '*', 'SERVERLOCALE', 'Server Locale', 'MYWP');
INSERT INTO fcsetting (set_id, set_user, set_code, set_description, set_val) VALUES (2, '*', 'MAXLIFETIME', 'Maximum Idle Time (in second)', '1800');
INSERT INTO fcsetting (set_id, set_user, set_code, set_description, set_val) VALUES (10, '*', 'EMAILPORT', 'Email Server Port', '25');
INSERT INTO fcsetting (set_id, set_user, set_code, set_description, set_val) VALUES (11, '*', 'EMAILUSERNAME', 'Email Server Username', 'noreply@moiregc.com.my');
INSERT INTO fcsetting (set_id, set_user, set_code, set_description, set_val) VALUES (12, '*', 'EMAILPASSWORD', 'Email Server Password', 'User123');
INSERT INTO fcsetting (set_id, set_user, set_code, set_description, set_val) VALUES (9, '*', 'EMAILHOST', 'Domain / IP of Email Server', '202.190.181.92');


--
-- TOC entry 3440 (class 0 OID 0)
-- Dependencies: 467
-- Name: fcsetting_set_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcsetting_set_id_seq', 12, true);


--
-- TOC entry 3288 (class 0 OID 51763)
-- Dependencies: 468
-- Data for Name: fcudv; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fcudv (udv_code, udv_name, udv_query_type, udv_query, udv_return_type, udv_result_type, udv_result_lookup_type, udv_result_lookup, udv_cat) VALUES ('RVDEC', 'Requirement verification decision', 'sql', 'select js_decision from mjobsheet where js_id = {$CASEKEY}', 'CELL', 'lookup', 'text', 'Revert
Assign', NULL);
INSERT INTO fcudv (udv_code, udv_name, udv_query_type, udv_query, udv_return_type, udv_result_type, udv_result_lookup_type, udv_result_lookup, udv_cat) VALUES ('CUSTDEC', 'Customer acceptance decision', 'sql', 'select js_decision from mjobsheet where js_id = {$CASEKEY}', 'CELL', 'lookup', 'text', 'Revert
Accept', NULL);
INSERT INTO fcudv (udv_code, udv_name, udv_query_type, udv_query, udv_return_type, udv_result_type, udv_result_lookup_type, udv_result_lookup, udv_cat) VALUES ('ACKNOWLEDGE_ACTIVITY_START', 'Job Acknowledgement Activity Start Time', 'sql', 'select to_char(max(pmf_start_date),''DD-Mon-YYYY HH:MI AM'') from fcpmcaseflow where pmf_pmcid = {$PMCID} and pmf_obj_type = ''PM_Event'' and pmf_obj_id = 2', 'CELL', NULL, NULL, NULL, NULL);
INSERT INTO fcudv (udv_code, udv_name, udv_query_type, udv_query, udv_return_type, udv_result_type, udv_result_lookup_type, udv_result_lookup, udv_cat) VALUES ('REQTIMEART', 'Required time for artist', 'sql', 'select ''PT''||js_requiretime||''M'' from mjobsheet where js_id = {$CASEKEY}', 'CELL', 'char', NULL, NULL, NULL);
INSERT INTO fcudv (udv_code, udv_name, udv_query_type, udv_query, udv_return_type, udv_result_type, udv_result_lookup_type, udv_result_lookup, udv_cat) VALUES ('REQTIMEQC', 'Required time for QC', 'sql', 'select ''PT''||(js_requiretime/3)||''M'' from mjobsheet where js_id = {$CASEKEY}', 'CELL', 'char', NULL, NULL, NULL);
INSERT INTO fcudv (udv_code, udv_name, udv_query_type, udv_query, udv_return_type, udv_result_type, udv_result_lookup_type, udv_result_lookup, udv_cat) VALUES ('JS_CUSTOMER_ORG', 'Customer Org', 'sql', 'select js_orgid from mjobsheet where js_id = {$CASEKEY}', 'CELL', NULL, NULL, NULL, NULL);
INSERT INTO fcudv (udv_code, udv_name, udv_query_type, udv_query, udv_return_type, udv_result_type, udv_result_lookup_type, udv_result_lookup, udv_cat) VALUES ('JS_ASSIGN_ARTIST', 'Jobsheet Assigned Artist', 'sql', 'select js_assignto from mjobsheet where js_id = {$CASEKEY}', 'CELL', NULL, NULL, NULL, NULL);
INSERT INTO fcudv (udv_code, udv_name, udv_query_type, udv_query, udv_return_type, udv_result_type, udv_result_lookup_type, udv_result_lookup, udv_cat) VALUES ('JS_CONTACT_PERSON_EMAIL', 'Job Requestor Contact Person Email', 'sql', 'select ct_email from mjobsheet join pndcontact on ct_id = js_ctid
where js_id = {$CASEKEY}', 'CELL', NULL, NULL, NULL, 'EMAIL_RECIPIENT');
INSERT INTO fcudv (udv_code, udv_name, udv_query_type, udv_query, udv_return_type, udv_result_type, udv_result_lookup_type, udv_result_lookup, udv_cat) VALUES ('JS_REQUESTOR_EMAIL', 'Job Requestor Email', 'sql', 'select usr_email from mjobsheet join fcuser on js_request_by = usr_userid
where js_id = {$CASEKEY}', 'CELL', NULL, NULL, NULL, 'EMAIL_RECIPIENT');
INSERT INTO fcudv (udv_code, udv_name, udv_query_type, udv_query, udv_return_type, udv_result_type, udv_result_lookup_type, udv_result_lookup, udv_cat) VALUES ('JS_ASSIGNED_ARTIST_EMAIL', 'Job Assigned Artist Email', 'sql', 'select usr_email from mjobsheet join fcuser on js_assignto = usr_userid
where js_id = {$CASEKEY}', 'CELL', NULL, NULL, NULL, 'EMAIL_RECIPIENT');
INSERT INTO fcudv (udv_code, udv_name, udv_query_type, udv_query, udv_return_type, udv_result_type, udv_result_lookup_type, udv_result_lookup, udv_cat) VALUES ('JS_JOB_DESCRIPTION', 'Jobsheet Short Description', 'sql', 'select js_description from mjobsheet where js_id = {$CASEKEY}', 'CELL', NULL, NULL, NULL, NULL);
INSERT INTO fcudv (udv_code, udv_name, udv_query_type, udv_query, udv_return_type, udv_result_type, udv_result_lookup_type, udv_result_lookup, udv_cat) VALUES ('WIP_ACTIVITY_START', 'Job WIP Activity Start Time', 'sql', 'select to_char(max(pmf_start_date),''DD-Mon-YYYY HH:MI AM'') from fcpmcaseflow where pmf_pmcid = {$PMCID} and pmf_obj_type = ''PM_Activity'' and pmf_obj_id = 4', 'CELL', NULL, NULL, NULL, NULL);
INSERT INTO fcudv (udv_code, udv_name, udv_query_type, udv_query, udv_return_type, udv_result_type, udv_result_lookup_type, udv_result_lookup, udv_cat) VALUES ('JS_ASSIGN_ARTIST_NAME', 'Job Assigned Artist Name', 'sql', 'select usr_name from mjobsheet join fcuser on js_assignto = usr_userid where js_id = {$CASEKEY}', 'CELL', NULL, NULL, NULL, NULL);
INSERT INTO fcudv (udv_code, udv_name, udv_query_type, udv_query, udv_return_type, udv_result_type, udv_result_lookup_type, udv_result_lookup, udv_cat) VALUES ('REQ_VER_ACTIVITY_START', 'Requirement Verification Activity Start Time', 'sql', 'select to_char(max(pmf_start_date),''DD-Mon-YYYY HH:MI AM'') from fcpmcaseflow where pmf_pmcid = {$PMCID} and pmf_obj_type = ''PM_Activity'' and pmf_obj_id = 1', 'CELL', NULL, NULL, NULL, NULL);
INSERT INTO fcudv (udv_code, udv_name, udv_query_type, udv_query, udv_return_type, udv_result_type, udv_result_lookup_type, udv_result_lookup, udv_cat) VALUES ('QC_ACTIVITY_START', 'Job QC Activity Start Time', 'sql', 'select to_char(max(pmf_start_date),''DD-Mon-YYYY HH:MI AM'') from fcpmcaseflow where pmf_pmcid = {$PMCID} and pmf_obj_type = ''PM_Activity'' and pmf_obj_id = 5', 'CELL', NULL, NULL, NULL, NULL);
INSERT INTO fcudv (udv_code, udv_name, udv_query_type, udv_query, udv_return_type, udv_result_type, udv_result_lookup_type, udv_result_lookup, udv_cat) VALUES ('QCDEC', 'QC check decision', 'sql', 'select js_decision from mjobsheet where js_id = {$CASEKEY}', 'CELL', 'lookup', 'text', 'Revert
Forward to Customer', NULL);
INSERT INTO fcudv (udv_code, udv_name, udv_query_type, udv_query, udv_return_type, udv_result_type, udv_result_lookup_type, udv_result_lookup, udv_cat) VALUES ('QCDEC_DISP', 'QC check decision display', 'sql', 'select case when js_decision = ''Forward to Customer'' then ''forwarded to customer'' else ''reverted'' end from mjobsheet where js_id = {$CASEKEY}', 'CELL', NULL, NULL, NULL, NULL);
INSERT INTO fcudv (udv_code, udv_name, udv_query_type, udv_query, udv_return_type, udv_result_type, udv_result_lookup_type, udv_result_lookup, udv_cat) VALUES ('JS_REQUIRE_MIN', 'Estimate job required time', 'sql', 'select js_requiretime||'' minutes'' from mjobsheet where js_id = {$CASEKEY}', 'CELL', 'char', NULL, NULL, NULL);
INSERT INTO fcudv (udv_code, udv_name, udv_query_type, udv_query, udv_return_type, udv_result_type, udv_result_lookup_type, udv_result_lookup, udv_cat) VALUES ('CUSTDEC_DISP', 'Customer acceptance decision display', 'sql', 'select case when js_decision=''Accept'' then ''accepted'' else ''reverted'' end from mjobsheet where js_id = {$CASEKEY}', 'CELL', NULL, NULL, NULL, NULL);
INSERT INTO fcudv (udv_code, udv_name, udv_query_type, udv_query, udv_return_type, udv_result_type, udv_result_lookup_type, udv_result_lookup, udv_cat) VALUES ('JS_WIP_BEFORE', 'Job WIP before', 'sql', 'select case when count(*) > 0 then ''Y'' else ''N'' end from fcpmcaseflow where pmf_pmcid = {$PMCID} and pmf_obj_type=''PM_Activity'' and pmf_obj_id = 4', 'CELL', 'lookup', 'text', 'Y/Yes
N/No', NULL);
INSERT INTO fcudv (udv_code, udv_name, udv_query_type, udv_query, udv_return_type, udv_result_type, udv_result_lookup_type, udv_result_lookup, udv_cat) VALUES ('RVDEC_DISP', 'Requirement verification decision display', 'sql', 'select case when js_decision=''Revert'' then ''reverted'' else ''assigned to artist'' end from mjobsheet where js_id = {$CASEKEY}', 'CELL', NULL, NULL, NULL, NULL);
INSERT INTO fcudv (udv_code, udv_name, udv_query_type, udv_query, udv_return_type, udv_result_type, udv_result_lookup_type, udv_result_lookup, udv_cat) VALUES ('JS_REQUESTOR_USERID', 'Job Requestor Userid', 'sql', 'select usr_userid from mjobsheet join fcuser on js_request_by = usr_userid where js_id = {$CASEKEY}', 'CELL', NULL, NULL, NULL, 'USERID');
INSERT INTO fcudv (udv_code, udv_name, udv_query_type, udv_query, udv_return_type, udv_result_type, udv_result_lookup_type, udv_result_lookup, udv_cat) VALUES ('JS_ASSIGNED_ARTIST_USERID', 'Job Assigned Artist Userid', 'sql', 'select usr_userid from mjobsheet join fcuser on js_assignto = usr_userid where js_id = {$CASEKEY}', 'CELL', NULL, NULL, NULL, 'USERID');
INSERT INTO fcudv (udv_code, udv_name, udv_query_type, udv_query, udv_return_type, udv_result_type, udv_result_lookup_type, udv_result_lookup, udv_cat) VALUES ('JS_EST_COMPLETE_TIME', 'Job estimate completion time', 'php', 'calculateCompletion({$CASEKEY})', 'CELL', NULL, NULL, NULL, NULL);
INSERT INTO fcudv (udv_code, udv_name, udv_query_type, udv_query, udv_return_type, udv_result_type, udv_result_lookup_type, udv_result_lookup, udv_cat) VALUES ('JS_REQUESTOR_NAME', 'Job Requestor Name', 'sql', 'select usr_name from mjobsheet join fcuser on js_request_by = usr_userid where js_id = {$CASEKEY}', 'CELL', NULL, NULL, NULL, NULL);
INSERT INTO fcudv (udv_code, udv_name, udv_query_type, udv_query, udv_return_type, udv_result_type, udv_result_lookup_type, udv_result_lookup, udv_cat) VALUES ('CUSTRESODEC_DISP', 'Customer Resolution Decision Display', 'sql', 'select case when js_decision=''Cancel'' then ''cancelled'' else ''sent back for verification'' end from mjobsheet where js_id = {$CASEKEY}', 'CELL', NULL, NULL, NULL, NULL);
INSERT INTO fcudv (udv_code, udv_name, udv_query_type, udv_query, udv_return_type, udv_result_type, udv_result_lookup_type, udv_result_lookup, udv_cat) VALUES ('CUSTRESODEC', 'Customer resolution decision', 'sql', 'select js_decision from mjobsheet where js_id = {$CASEKEY}', 'CELL', 'lookup', 'text', 'Cancel', NULL);


--
-- TOC entry 3289 (class 0 OID 51770)
-- Dependencies: 469
-- Data for Name: fcuser; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('qc', 'd6426af04235d59336c5b6b08f61240cbb6b0f66', '2014-04-30 19:10:06.929+08', 'qc', 'dannyfoo@phiorion.com', '2014-06-22 18:42:28+08', '2014-06-22 16:14:18+08', NULL, NULL, 'a:5:{s:7:"dbosess";a:3:{s:20:"pmtask_caseflow_list";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"list";}s:9:"pendingQC";a:4:{s:6:"lastid";a:1:{s:5:"js_id";i:67;}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"edit";}s:8:"jobsheet";a:4:{s:6:"lastid";a:1:{s:5:"js_id";i:67;}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:6:"detail";}}s:13:"PMTask_taskid";s:1:"5";s:15:"PMTask_tasktype";s:11:"PM_Activity";s:9:"dboconfig";a:0:{}s:13:"PMTask_flowid";s:3:"794";}', 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('admin2', 'd033e22ae348aeb5660fc2140aec35850c4da997', '2014-01-26 15:39:57.04+08', 'Administrator 2', 'dannyfoo@phiorion.com', '2014-06-28 17:55:20+08', '2014-06-28 16:51:17+08', '2014-06-26 11:53:19+08', 'ADMIN', 'a:4:{s:7:"dbosess";a:3:{s:11:"jobcatsetup";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"list";}s:14:"joboutputsetup";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"list";}s:8:"jobsheet";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:3:"new";}}s:9:"dboconfig";a:0:{}s:13:"PMTask_taskid";s:1:"1";s:15:"PMTask_tasktype";s:8:"PM_Event";}', 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('uat_qc3', '5001bb8bbc319f44083f121452b480400657668a', '2014-06-22 14:42:32.917+08', 'Quality Assurance 3', 'dannyfoo@phiorion.com', '2014-06-22 23:02:18+08', '2014-06-22 23:01:59+08', NULL, NULL, 'a:0:{}', 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('customer', 'b39f008e318efd2bb988d724a161b61c6909677f', '2014-04-24 15:46:41.898+08', 'Customer', 'dannyfoo@phiorion.com', '2014-06-28 22:12:25+08', '2014-06-28 22:10:50+08', '2014-06-22 17:54:18+08', NULL, 'a:0:{}', 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('uat_qc4', '5001bb8bbc319f44083f121452b480400657668a', '2014-06-22 14:43:06.84+08', 'Quality Assurance 4', 'dannyfoo@phiorion.com', NULL, NULL, NULL, NULL, NULL, 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('uat_customer3', '5001bb8bbc319f44083f121452b480400657668a', '2014-06-22 13:48:28.496+08', 'Uat customer 3', 'dannyfoo@phiorion.com', '2014-06-22 23:00:11+08', '2014-06-22 22:00:33+08', '2014-06-22 21:59:53+08', NULL, 'a:0:{}', 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('uat_qc5', '5001bb8bbc319f44083f121452b480400657668a', '2014-06-22 14:43:49.935+08', 'Quality Assurance 5', 'dannyfoo@phiorion.com', NULL, NULL, NULL, NULL, NULL, 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('uat_manager3', '5001bb8bbc319f44083f121452b480400657668a', '2014-06-22 14:45:09.591+08', 'UAT Manager3', 'dannyfoo@phiorion.com', NULL, NULL, NULL, NULL, NULL, 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('esp_artist', '9afb9d02e0ce944228e1001d2b103b3bb9aa7def', '2014-06-21 23:20:39.656+08', 'esp artist', 'esp@phiorion.com', '2014-06-21 23:21:16+08', '2014-06-21 23:20:59+08', NULL, NULL, 'a:0:{}', 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('uat_manager4', '5001bb8bbc319f44083f121452b480400657668a', '2014-06-22 14:45:41.681+08', 'UAT Manager 4', 'dannyfoo@phiorion.com', NULL, NULL, NULL, NULL, NULL, 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('esp_supervisor', '9afb9d02e0ce944228e1001d2b103b3bb9aa7def', '2014-06-21 21:28:05.788+08', 'esp supervisor', 'dannyfoo@phiorion.com', '2014-06-21 23:17:39+08', '2014-06-21 23:05:39+08', '2014-06-21 22:21:37+08', NULL, 'a:0:{}', 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('uat_manager5', '5001bb8bbc319f44083f121452b480400657668a', '2014-06-22 14:46:13.293+08', 'UAT Manager5', 'dannyfoo@phiorion.com', NULL, NULL, NULL, NULL, NULL, 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('fongadmin', 'd033e22ae348aeb5660fc2140aec35850c4da997', '2014-06-21 19:06:57.321+08', 'Administrator', 'dannyfoo@phiorion.com', '2014-06-28 16:49:14+08', '2014-06-28 15:46:39+08', '2014-06-22 19:29:13+08', NULL, 'a:4:{s:7:"dbosess";a:2:{s:8:"jobsheet";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:3:"new";}s:10:"joblisting";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"list";}}s:13:"PMTask_taskid";s:1:"1";s:15:"PMTask_tasktype";s:8:"PM_Event";s:9:"dboconfig";a:1:{s:8:"jobsheet";i:1;}}', 'ACTIVE', 'EN-US');
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('uat_supervisor3', '5001bb8bbc319f44083f121452b480400657668a', '2014-06-22 13:56:56.546+08', 'Uat supervisor 3', 'dannyfoo@phiorion.com', '2014-06-22 23:01:03+08', '2014-06-22 23:00:30+08', NULL, NULL, 'a:0:{}', 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('uat_manager2', '5001bb8bbc319f44083f121452b480400657668a', '2014-06-22 14:44:37.191+08', 'UAT Manager2', 'dannyfoo@phiorion.com', '2014-07-01 15:59:39+08', NULL, NULL, NULL, 'a:0:{}', 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('fongcustomer', 'c3bb51e80fb8801251e17d265e6a84cdd3a65200', '2014-06-21 19:09:47.371+08', 'Fong Customer', 'fong_yeh@hotmail.com', '2014-06-21 19:10:15+08', '2014-06-21 19:10:06+08', NULL, NULL, 'a:4:{s:7:"dbosess";a:1:{s:8:"jobsheet";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:3:"new";}}s:13:"PMTask_taskid";s:1:"1";s:15:"PMTask_tasktype";s:8:"PM_Event";s:9:"dboconfig";a:0:{}}', 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('uat_supervisor4', '5001bb8bbc319f44083f121452b480400657668a', '2014-06-22 13:58:23.837+08', 'Uat supervisor 4', 'dannyfoo@phiorion.com', '2014-06-26 12:29:16+08', '2014-06-26 12:27:03+08', NULL, NULL, 'a:0:{}', 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('uat_qc1', '5001bb8bbc319f44083f121452b480400657668a', '2014-06-21 21:50:16.091+08', 'Quality Assurance 1', 'dannyfoo@phiorion.com', '2014-07-03 12:41:29+08', '2014-07-03 12:41:04+08', NULL, NULL, 'a:0:{}', 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('uat_customer5', '5001bb8bbc319f44083f121452b480400657668a', '2014-06-22 13:54:37.241+08', 'Uat customer 5', 'dannyfoo@phiorion.com', '2014-07-04 14:01:58+08', '2014-07-04 11:52:54+08', NULL, NULL, 'a:0:{}', 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('uat_supervisor5', '5001bb8bbc319f44083f121452b480400657668a', '2014-06-22 13:58:54.09+08', 'Uat supervisor 5', 'dannyfoo@phiorion.com', '2014-07-04 15:36:18+08', '2014-07-04 15:35:54+08', NULL, NULL, 'a:0:{}', 'ACTIVE', 'EN-US');
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('fongsupervisor', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', '2014-06-21 21:41:13.921+08', 'fongsupervisor', 'dannyfoo@phiorion.com', '2014-06-21 22:37:35+08', '2014-06-21 21:52:33+08', NULL, NULL, 'a:0:{}', 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('uat_artist3', '5001bb8bbc319f44083f121452b480400657668a', '2014-06-22 14:39:27.667+08', 'UAT Artist3', 'dannyfoo@phiorion.com', '2014-06-22 23:02:35+08', '2014-06-22 23:02:27+08', NULL, NULL, 'a:4:{s:7:"dbosess";a:1:{s:20:"pmtask_caseflow_list";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"list";}}s:13:"PMTask_taskid";s:2:"10";s:15:"PMTask_tasktype";s:11:"PM_Activity";s:9:"dboconfig";a:0:{}}', 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('uat_artist4', '5001bb8bbc319f44083f121452b480400657668a', '2014-06-22 14:40:21.405+08', 'UAT Artist4', 'dannyfoo@phiorion.com', '2014-06-26 12:03:39+08', '2014-06-26 11:45:43+08', NULL, NULL, 'a:0:{}', 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('uat_cust1', '5001bb8bbc319f44083f121452b480400657668a', '2014-06-21 17:32:20.338+08', 'UAT Customer1', 'dannyfoo@phiorion.com', '2014-06-22 17:06:05+08', '2014-06-22 17:06:05+08', '2014-06-22 14:22:06+08', NULL, 'a:0:{}', 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('uat_manager1', '5001bb8bbc319f44083f121452b480400657668a', '2014-06-21 17:29:57.603+08', 'UAT Manager1', 'dannyfoo@phiorion.com', NULL, NULL, NULL, NULL, NULL, 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('uat_artist5', '5001bb8bbc319f44083f121452b480400657668a', '2014-06-22 14:40:50.232+08', 'UAT Artist5', 'dannyfoo@phiorion.com', NULL, NULL, NULL, NULL, NULL, 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('artist1', '2cabffd3c7cb40ae6541b7f10a640b41190ccb27', '2014-06-09 21:32:50.011+08', 'Artist 1', 'dannyfoo@phiorion.com', '2014-07-09 11:58:42+08', '2014-07-09 11:58:38+08', NULL, NULL, 'a:4:{s:7:"dbosess";a:1:{s:26:"pmtask_caseflow_list_event";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"list";}}s:13:"PMTask_taskid";s:1:"2";s:15:"PMTask_tasktype";s:8:"PM_Event";s:9:"dboconfig";a:0:{}}', 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('uat_artist2', '5001bb8bbc319f44083f121452b480400657668a', '2014-06-22 14:38:00.573+08', 'UAT Artist2', 'dannyfoo@phiorion.com', '2014-07-01 18:26:32+08', '2014-07-01 17:49:47+08', NULL, NULL, 'a:0:{}', 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('uat_supervisor2', '5001bb8bbc319f44083f121452b480400657668a', '2014-06-22 13:56:27.344+08', 'Uat supervisor 2', 'dannyfoo@phiorion.com', '2014-07-01 17:25:05+08', '2014-07-01 17:24:36+08', '2014-06-26 11:15:55+08', NULL, 'a:0:{}', 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('uat_qc2', '5001bb8bbc319f44083f121452b480400657668a', '2014-06-22 14:41:50.867+08', 'Quality Assurance 2', 'dannyfoo@phiorion.com', '2014-07-01 18:49:20+08', '2014-07-01 18:26:58+08', NULL, NULL, 'a:0:{}', 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('uat_customer2', '5001bb8bbc319f44083f121452b480400657668a', '2014-06-22 13:48:01.232+08', 'Uat customer 2', 'dannyfoo@phiorion.com', '2014-07-01 22:33:41+08', '2014-07-01 22:32:57+08', '2014-06-22 17:54:06+08', NULL, 'a:0:{}', 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('uat_customer4', '5001bb8bbc319f44083f121452b480400657668a', '2014-06-22 13:54:11.918+08', 'Uat customer 4', 'dannyfoo@phiorion.com', '2014-07-01 11:19:04+08', '2014-07-01 22:57:09+08', NULL, NULL, 'a:0:{}', 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('newcust', '5001bb8bbc319f44083f121452b480400657668a', '2014-07-03 15:39:05.684+08', 'New customer in chinese', 'cust@cust.com', '2014-07-03 15:39:22+08', '2014-07-03 15:39:16+08', '2014-07-03 15:39:12+08', NULL, 'a:0:{}', 'ACTIVE', 'ZH-CN');
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('esp', '9afb9d02e0ce944228e1001d2b103b3bb9aa7def', '2014-06-21 18:25:38.5+08', 'Eng Shi Ping', 'dannyfoo@phiorion.com', '2014-07-08 16:19:22+08', '2014-07-08 16:16:52+08', '2014-07-08 07:14:56+08', NULL, 'a:3:{s:7:"dbosess";a:1:{s:9:"pendingQC";a:4:{s:6:"lastid";a:1:{s:5:"js_id";s:3:"129";}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"edit";}}s:7:"dboload";s:9:"pendingQC";s:9:"dboconfig";a:0:{}}', 'ACTIVE', 'EN-US');
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('uat_supervisor1', '5001bb8bbc319f44083f121452b480400657668a', '2014-06-21 17:27:46.394+08', 'UAT Supervisor', 'dannyfoo@phiorion.com', '2014-07-08 16:49:24+08', '2014-07-08 16:49:06+08', '2014-07-08 16:49:00+08', NULL, 'a:0:{}', 'ACTIVE', 'EN-US');
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('uat_artist1', '5001bb8bbc319f44083f121452b480400657668a', '2014-06-21 17:29:02.912+08', 'UAT Artist1', 'dannyfoo@phiorion.com', '2014-07-08 16:16:50+08', '2014-07-08 16:49:42+08', '2014-06-24 19:04:06+08', NULL, 'a:0:{}', 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('uat_customer1', '5001bb8bbc319f44083f121452b480400657668a', '2014-06-22 13:50:43.739+08', 'Uat customer 1', 'dannyfoo@phiorion.com', '2014-07-08 06:49:46+08', '2014-07-08 06:47:49+08', '2014-07-01 22:42:58+08', NULL, 'a:0:{}', 'ACTIVE', 'EN-US');
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', '2013-08-15 09:55:18.85+08', 'Administrator', 'dannyfoo@phiorion.com', '2014-07-09 11:25:57+08', '2014-07-03 12:33:34+08', '2014-06-24 18:01:03+08', 'ADMIN', 'a:0:{}', 'ACTIVE', 'EN-US');
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('artist2', '09c04a14fff8cbd7d0235da2c01bfd31d7826824', '2014-06-09 21:35:00.767+08', 'Artist 2', 'dannyfoo@phiorion.com', '2014-07-09 11:58:33+08', '2014-07-09 11:32:41+08', '2014-06-22 22:37:16+08', NULL, 'a:0:{}', 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('supervisor', '0f4d09e43d208d5e9222322fbc7091ceea1a78c3', '2014-04-30 19:09:48.659+08', 'supervisor', 'dannyfoo@phiorion.com', '2014-07-09 16:42:39+08', '2014-07-09 15:14:55+08', '2014-06-30 14:43:47+08', NULL, 'a:5:{s:7:"dbosess";a:6:{s:8:"jobsheet";a:4:{s:6:"lastid";a:1:{s:5:"js_id";i:133;}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:3:"new";}s:20:"pmtask_caseflow_list";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"list";}s:15:"reqverification";a:4:{s:6:"lastid";a:1:{s:5:"js_id";i:133;}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"edit";}s:12:"machinesetup";a:4:{s:6:"lastid";a:1:{s:5:"mc_id";i:1;}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:6:"detail";}s:26:"pmtask_caseflow_list_event";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"list";}s:8:"reassign";a:4:{s:6:"lastid";a:1:{s:5:"js_id";i:131;}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"edit";}}s:13:"PMTask_taskid";s:1:"1";s:15:"PMTask_tasktype";s:8:"PM_Event";s:9:"dboconfig";a:0:{}s:13:"PMTask_flowid";s:4:"1186";}', 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('ysyow', '37d18143f0650c34e4ac4e8bc3c106820945319b', '2014-06-21 18:26:11.482+08', 'Yow Yik Shuen', 'dannyfoo@phiorion.com', '2014-07-09 16:42:34+08', '2014-07-09 15:13:54+08', '2014-06-28 15:04:12+08', NULL, 'a:5:{s:7:"dbosess";a:11:{s:20:"pmtask_caseflow_list";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:6:"search";}s:10:"joblisting";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"list";}s:11:"timer_setup";a:4:{s:6:"lastid";a:1:{s:7:"pmev_id";s:1:"2";}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"list";}s:9:"sla_setup";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"list";}s:8:"jobsheet";a:4:{s:6:"lastid";a:1:{s:5:"js_id";i:133;}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:3:"new";}s:4:"rule";a:4:{s:6:"lastid";a:1:{s:5:"ru_id";s:1:"5";}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"list";}s:3:"udv";a:5:{s:6:"lastid";a:1:{s:8:"udv_code";s:11:"CUSTRESODEC";}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"list";s:4:"page";i:3;}s:11:"cartonsetup";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"list";}s:13:"mail_template";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"list";}s:14:"joboutputsetup";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"list";}s:11:"jobcatsetup";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"list";}}s:13:"PMTask_taskid";s:1:"1";s:15:"PMTask_tasktype";s:8:"PM_Event";s:9:"dboconfig";a:0:{}s:13:"PMTask_flowid";s:4:"1188";}', 'ACTIVE', NULL);


--
-- TOC entry 3290 (class 0 OID 51778)
-- Dependencies: 470
-- Data for Name: fcuserdiary; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (1, '2014-05-29 23:35:52.378+08', 'admin', 'admin', NULL, 'MESSAGE', 'asddsa', NULL, 'READ', '2014-05-29 23:35:52.378+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (2, '2014-05-30 00:03:11.89+08', 'admin', 'admin', NULL, 'MESSAGE', 'asddsacacsa', NULL, 'READ', '2014-05-30 00:03:11.89+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (3, '2014-05-30 00:08:27.371+08', 'admin', 'admin', NULL, 'MESSAGE', 'asdcccc', NULL, 'DELETED', '2014-05-30 00:08:27.371+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (4, '2014-06-01 15:33:31.541+08', 'admin', 'admin', NULL, 'MESSAGE', 'zsfddfsfds', NULL, 'READ', '2014-06-01 15:33:31.541+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (5, '2014-06-01 17:55:52.513+08', 'admin', 'admin', NULL, 'MESSAGE', 'asdasdas', NULL, 'DELETED', '2014-06-01 17:55:52.513+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (7, '2014-06-04 16:39:17.28+08', 'admin', 'admin', NULL, 'MESSAGE', 'Are you happy today?', NULL, 'READ', '2014-06-04 16:39:17.28+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (8, '2014-06-04 16:39:51.61+08', 'admin', 'admin', NULL, 'MESSAGE', 'Am I registered?', NULL, 'READ', '2014-06-04 16:39:51.61+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (9, '2014-06-04 23:23:40.801+08', 'admin', 'admin', NULL, 'MESSAGE', 'Ausi is cantik', NULL, 'READ', '2014-06-04 23:23:40.801+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (10, '2014-06-04 23:26:04.521+08', 'admin', 'admin', NULL, 'MESSAGE', 'Danny is gendut!!', NULL, 'READ', '2014-06-04 23:26:04.521+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (11, '2014-06-05 19:00:10.904+08', 'admin', 'admin', NULL, 'MESSAGE', 'Dr. Tang is here', NULL, 'READ', '2014-06-05 19:00:10.904+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (12, '2014-06-09 09:34:58.606+08', 'admin', 'admin', NULL, 'MESSAGE', 'Today is moire presentation', NULL, 'READ', '2014-06-09 09:34:58.606+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (13, '2014-06-09 09:35:41.073+08', 'admin', 'admin', NULL, 'MESSAGE', 'Daniel is here!', NULL, 'READ', '2014-06-09 09:35:41.073+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (14, '2014-06-09 13:25:46.48+08', 'admin', 'admin', NULL, 'MESSAGE', 'Hi Vikki...', NULL, 'READ', '2014-06-09 13:25:46.48+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (15, '2014-06-15 01:21:22.256+08', 'admin', 'admin', NULL, 'MESSAGE', 'Hello world', NULL, 'READ', '2014-06-15 01:21:22.256+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (6, '2014-06-01 17:55:52.515+08', 'admin', 'admin2', NULL, 'MESSAGE', 'asdasdas', NULL, 'READ', '2014-06-01 17:55:52.515+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (52, '2014-06-21 19:56:37.358+08', '*moire', 'ysyow', NULL, 'NOTICE', '[MOIRE] Late Requirement Verification Notification', '<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "Barcode scan and drawing" job is still pending since 21-Jun-2014 07:15 PM.</p><p><br></p>', 'READ', '2014-06-21 19:56:37.358+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (46, '2014-06-21 17:57:42.741+08', 'uat_cust1', 'uat_cust1', NULL, 'MESSAGE', 'I love Moire', NULL, 'DELETED', '2014-06-21 17:57:42.741+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (47, '2014-06-21 18:02:22.053+08', 'uat_cust1', 'uat_cust1', NULL, 'MESSAGE', 'asdklfj asdkfjasdk asdlkfjalsk dfalksjdf aklsdj falksdjf alksdjf asldkjf aslkdjf asdlkfj alskdjf asl', NULL, 'DELETED', '2014-06-21 18:02:22.053+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (53, '2014-06-21 21:58:36.009+08', 'ysyow', 'ysyow', NULL, 'MESSAGE', 'asdasdasd', NULL, 'READ', '2014-06-21 21:58:36.009+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (48, '2014-06-21 18:52:51.898+08', 'ysyow', 'artist1', NULL, 'MESSAGE', 'hello', NULL, 'READ', '2014-06-21 18:52:51.898+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (54, '2014-06-21 22:00:31.345+08', 'ysyow', 'ysyow', NULL, 'MESSAGE', 'adminasd', NULL, 'READ', '2014-06-21 22:00:31.345+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (50, '2014-06-21 18:53:49.427+08', 'ysyow', 'artist1', NULL, 'MESSAGE', 'asddsadsa', NULL, 'READ', '2014-06-21 18:53:49.427+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (51, '2014-06-21 19:56:37.358+08', '*moire', 'uat_supervisor1', NULL, 'NOTICE', '[MOIRE] Late Requirement Verification Notification', '<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "Barcode scan and drawing" job is still pending since 21-Jun-2014 07:15 PM.</p><p><br></p>', 'READ', '2014-06-21 19:56:37.358+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (49, '2014-06-21 18:53:33.781+08', 'artist1', 'ysyow', NULL, 'MESSAGE', 'cool man', NULL, 'DELETED', '2014-06-21 18:53:33.781+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (65, '2014-06-22 16:57:49.568+08', 'supervisor', 'supervisor', NULL, 'MESSAGE', 'HELLO
', NULL, 'READ', '2014-06-22 16:57:49.568+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (55, '2014-06-21 22:13:47.217+08', 'ysyow', 'ysyow', NULL, 'MESSAGE', 'asd', NULL, 'DELETED', '2014-06-21 22:13:47.217+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (62, '2014-06-22 14:21:25.415+08', '*moire', 'uat_supervisor1', NULL, 'NOTICE', '[MOIRE] Late Requirement Verification Notification', '<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "Esp case" job is still pending since 21-Jun-2014 10:17 PM.</p><p><br></p>', 'READ', '2014-06-22 14:21:25.415+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (56, '2014-06-21 22:16:17.371+08', 'ysyow', 'ysyow', NULL, 'MESSAGE', 'asddsa', NULL, 'READ', '2014-06-21 22:16:17.371+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (59, '2014-06-22 13:39:02.645+08', '*moire', 'uat_supervisor1', NULL, 'NOTICE', '[MOIRE] Late Requirement Verification Notification', '<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "Esp case" job is still pending since 21-Jun-2014 10:17 PM.</p><p><br></p>', 'READ', '2014-06-22 13:39:02.645+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (57, '2014-06-21 22:27:03.088+08', '*moire', 'supervisor', NULL, 'NOTICE', '[MOIRE] Late Job QC Notification', '<p>Dear Manager and Supervisor,</p><p>This email is to notify that the  "Barcode scan and drawing" job is still pending QC since 21-Jun-2014 09:48 PM.</p><div><br></div>', 'READ', '2014-06-21 22:27:03.088+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (58, '2014-06-21 22:27:03.157+08', '*moire', 'supervisor', NULL, 'NOTICE', '[MOIRE] Late Job Acknowledgement Notification', '<p>Dear Supervisor,</p><p>This email is to notify that the  "Master card artwork" job is still pending acknowledgement from UAT Artist1 since 21-Jun-2014 10:24 PM.</p><div><br></div>', 'READ', '2014-06-21 22:27:03.157+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (60, '2014-06-22 13:39:03.177+08', '*moire', 'supervisor', NULL, 'NOTICE', '[MOIRE] Late Job WIP Notification', '<p>Dear Manager and Supervisor,</p><p>This email is to notify that the  "drawing artwork" job is still WIP from UAT Artist1 since 21-Jun-2014 10:06 PM.</p><div><br></div>', 'READ', '2014-06-22 13:39:03.177+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (61, '2014-06-22 13:39:03.604+08', '*moire', 'supervisor', NULL, 'NOTICE', '[MOIRE] Late Job Acknowledgement Notification', '<p>Dear Supervisor,</p><p>This email is to notify that the  "Artwork separation for UAT Customer 1" job is still pending acknowledgement from UAT Artist1 since 22-Jun-2014 01:34 PM.</p><div><br></div>', 'READ', '2014-06-22 13:39:03.604+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (63, '2014-06-22 14:21:26.058+08', '*moire', 'supervisor', NULL, 'NOTICE', '[MOIRE] Late Job WIP Notification', '<p>Dear Manager and Supervisor,</p><p>This email is to notify that the  "Artwork separation job for customer1" job is still WIP from UAT Artist1 since .</p><div><br></div>', 'READ', '2014-06-22 14:21:26.058+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (64, '2014-06-22 14:21:26.471+08', '*moire', 'supervisor', NULL, 'NOTICE', '[MOIRE] Late Job Acknowledgement Notification', '<p>Dear Supervisor,</p><p>This email is to notify that the  "Monotone Editing" job is still pending acknowledgement from UAT Artist1 since 22-Jun-2014 02:02 PM.</p><div><br></div>', 'READ', '2014-06-22 14:21:26.471+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (66, '2014-06-22 18:39:00.845+08', 'uat_customer2', 'uat_customer2', NULL, 'MESSAGE', 'Testing 123 123 123 ', NULL, 'DELETED', '2014-06-22 18:39:00.845+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (67, '2014-06-22 18:41:41.165+08', 'uat_customer2', 'uat_customer2', NULL, 'MESSAGE', '1234567890123456789012345678901234567890123456789012345678901234567890123145678901234567890123456789', NULL, 'READ', '2014-06-22 18:41:41.165+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (73, '2014-06-22 18:43:25.031+08', 'uat_customer2', 'uat_customer2', NULL, 'MESSAGE', 'test 2', NULL, 'READ', '2014-06-22 18:43:25.031+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (74, '2014-06-22 18:43:43.911+08', 'uat_customer2', 'uat_customer2', NULL, 'MESSAGE', 'test3', NULL, 'READ', '2014-06-22 18:43:43.911+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (75, '2014-06-22 19:05:27.723+08', 'uat_customer2', 'uat_customer2', NULL, 'MESSAGE', '1233452525 1243434 2352352535 235325235325 23523535 2523523 523523 5235235 3523523525 35235 35235235', NULL, 'READ', '2014-06-22 19:05:27.723+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (68, '2014-06-22 18:42:27.017+08', '*moire', 'uat_supervisor1', NULL, 'NOTICE', '[MOIRE] Late Requirement Verification Notification', '<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "Esp case" job is still pending since 21-Jun-2014 10:17 PM.</p><p><br></p>', 'READ', '2014-06-22 18:42:27.017+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (70, '2014-06-22 18:42:27.872+08', '*moire', 'uat_supervisor1', NULL, 'NOTICE', '[MOIRE] Late Requirement Verification Notification', '<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "Test job" job is still pending since 22-Jun-2014 03:55 PM.</p><p><br></p>', 'READ', '2014-06-22 18:42:27.872+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (69, '2014-06-22 18:42:27.472+08', '*moire', 'supervisor', NULL, 'NOTICE', '[MOIRE] Late Job WIP Notification', '<p>Dear Manager and Supervisor,</p><p>This email is to notify that the  "Artwork separation for UAT Customer 1" job is still WIP from UAT Artist1 since 22-Jun-2014 01:41 PM.</p><div><br></div>', 'READ', '2014-06-22 18:42:27.472+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (76, '2014-06-22 22:02:36.486+08', 'uat_supervisor2', 'uat_supervisor2', NULL, 'MESSAGE', 'test test test', NULL, 'DELETED', '2014-06-22 22:02:36.486+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (71, '2014-06-22 18:42:28.293+08', '*moire', 'supervisor', NULL, 'NOTICE', '[MOIRE] Late Job WIP Notification', '<p>Dear Manager and Supervisor,</p><p>This email is to notify that the  "test 2" job is still WIP from Artist 2 since .</p><div><br></div>', 'READ', '2014-06-22 18:42:28.293+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (72, '2014-06-22 18:42:28.689+08', '*moire', 'supervisor', NULL, 'NOTICE', '[MOIRE] Late Job WIP Notification', '<p>Dear Manager and Supervisor,</p><p>This email is to notify that the  "Test 4" job is still WIP from Artist 2 since .</p><div><br></div>', 'READ', '2014-06-22 18:42:28.689+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (85, '2014-06-23 00:23:17.891+08', '*moire', 'supervisor', NULL, 'NOTICE', '[MOIRE] Late Job WIP Notification', '<p>Dear Manager and Supervisor,</p><p>This email is to notify that the "asd" job is still WIP from UAT Artist2 since 22-Jun-2014 10:40 PM.</p><div><br></div>', 'READ', '2014-06-23 00:23:17.891+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (86, '2014-06-23 00:23:17.963+08', '*moire', 'supervisor', NULL, 'NOTICE', '[MOIRE] Late Job Acknowledgement Notification', '<p>Dear Supervisor,</p><p>This email is to notify that the "test5" job is still pending acknowledgement from esp artist since 22-Jun-2014 10:06 PM.</p><div><br></div>', 'READ', '2014-06-23 00:23:17.963+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (87, '2014-06-23 00:23:18.025+08', '*moire', 'supervisor', NULL, 'NOTICE', '[MOIRE] Late Job Acknowledgement Notification', '<p>Dear Supervisor,</p><p>This email is to notify that the "Monotone Editing" job is still pending acknowledgement from UAT Artist3 since 22-Jun-2014 10:07 PM.</p><div><br></div>', 'READ', '2014-06-23 00:23:18.025+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (89, '2014-06-23 00:23:18.506+08', '*moire', 'supervisor', NULL, 'NOTICE', '[MOIRE] Late Job Acknowledgement Notification', '<p>Dear Supervisor,</p><p>This email is to notify that the "123" job is still pending acknowledgement from Artist 2 since 22-Jun-2014 10:36 PM.</p><div><br></div>', 'READ', '2014-06-23 00:23:18.506+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (90, '2014-06-23 00:23:18.566+08', '*moire', 'supervisor', NULL, 'NOTICE', '[MOIRE] Late Job Acknowledgement Notification', '<p>Dear Supervisor,</p><p>This email is to notify that the "Case 1 - eng" job is still pending acknowledgement from Artist 1 since 22-Jun-2014 10:38 PM.</p><div><br></div>', 'READ', '2014-06-23 00:23:18.566+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (91, '2014-06-23 00:23:18.623+08', '*moire', 'supervisor', NULL, 'NOTICE', '[MOIRE] Late Job WIP Notification', '<p>Dear Manager and Supervisor,</p><p>This email is to notify that the "new job 3 by eng" job is still WIP from UAT Artist3 since 22-Jun-2014 11:01 PM.</p><div><br></div>', 'READ', '2014-06-23 00:23:18.623+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (92, '2014-06-26 16:33:40.38+08', '*moire', 'ysyow', NULL, 'NOTICE', '[MOIRE] Job Acknowledgement', '<p>Dear Yow Yik Shuen,</p><p>This email is to inform that your job request "YYYSSS" is now confirmed and acknowledged. </p><p><br></p><p>Estimate Time Required : 300 minutes (Working hour)</p><p>Estimate Completion Time : 27-Jun-2014 12:33 PM</p><div><br></div>', 'READ', '2014-06-26 16:33:40.38+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (93, '2014-06-30 14:46:15.876+08', '*moire', 'admin', NULL, 'NOTICE', '[MOIRE] Job Acknowledgement', '<p>Dear Administrator,</p><p>This email is to inform that your job request "test yys" is now confirmed and acknowledged. </p><p><br></p><p>Estimate Time Required : 300 minutes (Working hour)</p><p>Estimate Completion Time : 1-Jul-2014 10:46 AM</p><div><br></div>', 'READ', '2014-06-30 14:46:15.876+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (94, '2014-06-30 17:42:05.827167+08', 'admin', 'admin', NULL, 'MESSAGE', 'test', NULL, 'READ', '2014-06-30 17:42:05.827167+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (115, '2014-06-30 17:57:29.763632+08', 'admin', 'admin', NULL, 'MESSAGE', 'test2', NULL, 'UNREAD', '2014-06-30 17:57:29.763632+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (103, '2014-06-30 17:43:27.492331+08', '*moire', 'uat_supervisor1', NULL, 'NOTICE', '[MOIRE] Late Requirement Verification Notification', '<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "Oder 2 by eng" job is still pending since 22-Jun-2014 10:25 AM.</p><p><br></p>', 'READ', '2014-06-30 17:43:27.492331+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (104, '2014-06-30 17:43:28.376057+08', '*moire', 'uat_supervisor1', NULL, 'NOTICE', '[MOIRE] Late Requirement Verification Notification', '<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "123213" job is still pending since 24-Jun-2014 06:38 AM.</p><p><br></p>', 'READ', '2014-06-30 17:43:28.376057+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (105, '2014-06-30 17:43:29.18841+08', '*moire', 'uat_supervisor1', NULL, 'NOTICE', '[MOIRE] Late Requirement Verification Notification', '<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "sasda" job is still pending since 24-Jun-2014 05:17 AM.</p><p><br></p>', 'READ', '2014-06-30 17:43:29.18841+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (106, '2014-06-30 17:43:29.878136+08', '*moire', 'uat_supervisor1', NULL, 'NOTICE', '[MOIRE] Late Requirement Verification Notification', '<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "12asd" job is still pending since 22-Jun-2014 10:29 AM.</p><p><br></p>', 'READ', '2014-06-30 17:43:29.878136+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (107, '2014-06-30 17:43:30.657928+08', '*moire', 'uat_supervisor1', NULL, 'NOTICE', '[MOIRE] Late Requirement Verification Notification', '<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "test yys" job is still pending since 24-Jun-2014 06:41 AM.</p><p><br></p>', 'READ', '2014-06-30 17:43:30.657928+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (109, '2014-06-30 17:43:31.689868+08', '*moire', 'uat_supervisor1', NULL, 'NOTICE', '[MOIRE] Late Requirement Verification Notification', '<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "required master card!!" job is still pending since 25-Jun-2014 06:09 AM.</p><p><br></p>', 'READ', '2014-06-30 17:43:31.689868+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (111, '2014-06-30 17:43:32.511544+08', '*moire', 'uat_supervisor1', NULL, 'NOTICE', '[MOIRE] Late Requirement Verification Notification', '<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "No barcode, no master card, just drawing and typing-- æ¢äºï¼ï¼" job is still pending since 25-Jun-2014 06:28 AM.</p><p><br></p>', 'READ', '2014-06-30 17:43:32.511544+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (100, '2014-06-30 17:43:25.269224+08', '*moire', 'uat_supervisor1', NULL, 'NOTICE', '[MOIRE] Late Requirement Verification Notification', '<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "sad" job is still pending since 22-Jun-2014 10:25 AM.</p><p><br></p>', 'READ', '2014-06-30 17:43:25.269224+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (101, '2014-06-30 17:43:26.032959+08', '*moire', 'uat_supervisor1', NULL, 'NOTICE', '[MOIRE] Late Requirement Verification Notification', '<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "asddsa" job is still pending since 22-Jun-2014 10:26 AM.</p><p><br></p>', 'READ', '2014-06-30 17:43:26.032959+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (102, '2014-06-30 17:43:26.775047+08', '*moire', 'uat_supervisor1', NULL, 'NOTICE', '[MOIRE] Late Requirement Verification Notification', '<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "1" job is still pending since 22-Jun-2014 10:27 AM.</p><p><br></p>', 'READ', '2014-06-30 17:43:26.775047+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (128, '2014-07-01 06:04:19.646586+08', '*moire', 'uat_customer4', NULL, 'NOTICE', '[MOIRE] Job Acknowledgement', '<p>Dear Uat customer 4,</p><p>This email is to inform that your job request "required master card!!" is now confirmed and acknowledged. </p><p><br></p><p>Estimate Time Required : 250 minutes (Working hour)</p><p>Estimate Completion Time : 1-Jul-2014 1:10 PM</p><div><br></div>', 'UNREAD', '2014-07-01 06:04:19.646586+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (118, '2014-07-01 05:59:05.100017+08', '*moire', 'uat_supervisor1', NULL, 'NOTICE', '[MOIRE] Late Requirement Verification Notification', '<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "sad" job is still pending since 22-Jun-2014 10:25 AM.</p><p><br></p>', 'READ', '2014-07-01 05:59:05.100017+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (119, '2014-07-01 05:59:06.13688+08', '*moire', 'uat_supervisor1', NULL, 'NOTICE', '[MOIRE] Late Requirement Verification Notification', '<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "asddsa" job is still pending since 22-Jun-2014 10:26 AM.</p><p><br></p>', 'READ', '2014-07-01 05:59:06.13688+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (120, '2014-07-01 05:59:06.847278+08', '*moire', 'uat_supervisor1', NULL, 'NOTICE', '[MOIRE] Late Requirement Verification Notification', '<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "1" job is still pending since 22-Jun-2014 10:27 AM.</p><p><br></p>', 'READ', '2014-07-01 05:59:06.847278+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (121, '2014-07-01 05:59:07.571121+08', '*moire', 'uat_supervisor1', NULL, 'NOTICE', '[MOIRE] Late Requirement Verification Notification', '<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "Oder 2 by eng" job is still pending since 22-Jun-2014 10:25 AM.</p><p><br></p>', 'READ', '2014-07-01 05:59:07.571121+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (122, '2014-07-01 05:59:08.280895+08', '*moire', 'uat_supervisor1', NULL, 'NOTICE', '[MOIRE] Late Requirement Verification Notification', '<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "12asd" job is still pending since 22-Jun-2014 10:29 AM.</p><p><br></p>', 'READ', '2014-07-01 05:59:08.280895+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (123, '2014-07-01 05:59:08.988355+08', '*moire', 'uat_supervisor1', NULL, 'NOTICE', '[MOIRE] Late Requirement Verification Notification', '<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "Test job" job is still pending since 22-Jun-2014 03:55 AM.</p><p><br></p>', 'READ', '2014-07-01 05:59:08.988355+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (124, '2014-07-01 05:59:09.742204+08', '*moire', 'uat_supervisor1', NULL, 'NOTICE', '[MOIRE] Late Requirement Verification Notification', '<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "Esp case" job is still pending since 21-Jun-2014 10:17 AM.</p><p><br></p>', 'READ', '2014-07-01 05:59:09.742204+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (125, '2014-07-01 05:59:10.490144+08', '*moire', 'uat_supervisor1', NULL, 'NOTICE', '[MOIRE] Late Requirement Verification Notification', '<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "No barcode, no master card, just drawing and typing-- æ¢äºï¼ï¼" job is still pending since 25-Jun-2014 06:28 AM.</p><p><br></p>', 'READ', '2014-07-01 05:59:10.490144+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (126, '2014-07-01 05:59:11.18635+08', '*moire', 'uat_supervisor1', NULL, 'NOTICE', '[MOIRE] Late Requirement Verification Notification', '<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "123213" job is still pending since 24-Jun-2014 06:38 AM.</p><p><br></p>', 'READ', '2014-07-01 05:59:11.18635+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (127, '2014-07-01 05:59:11.868212+08', '*moire', 'uat_supervisor1', NULL, 'NOTICE', '[MOIRE] Late Requirement Verification Notification', '<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "sasda" job is still pending since 24-Jun-2014 05:17 AM.</p><p><br></p>', 'READ', '2014-07-01 05:59:11.868212+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (112, '2014-06-30 17:43:33.211413+08', '*moire', 'uat_supervisor1', NULL, 'NOTICE', '[MOIRE] Late Requirement Verification Notification', '<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "Test yys" job is still pending since 25-Jun-2014 06:17 AM.</p><p><br></p>', 'READ', '2014-06-30 17:43:33.211413+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (116, '2014-07-01 05:59:03.223507+08', '*moire', 'uat_supervisor1', NULL, 'NOTICE', '[MOIRE] Late Requirement Verification Notification', '<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "UAT job by ENG -1 " job is still pending since 22-Jun-2014 07:05 AM.</p><p><br></p>', 'READ', '2014-07-01 05:59:03.223507+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (117, '2014-07-01 05:59:04.371237+08', '*moire', 'uat_supervisor1', NULL, 'NOTICE', '[MOIRE] Late Requirement Verification Notification', '<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "Test revert job" job is still pending since 22-Jun-2014 07:08 AM.</p><p><br></p>', 'READ', '2014-07-01 05:59:04.371237+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (77, '2014-06-23 00:23:14.953+08', '*moire', 'uat_supervisor1', NULL, 'NOTICE', '[MOIRE] Late Requirement Verification Notification', '<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "Esp case" job is still pending since 21-Jun-2014 10:17 PM.</p><p><br></p>', 'READ', '2014-06-23 00:23:14.953+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (78, '2014-06-23 00:23:15.418+08', '*moire', 'uat_supervisor1', NULL, 'NOTICE', '[MOIRE] Late Requirement Verification Notification', '<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "Test job" job is still pending since 22-Jun-2014 03:55 PM.</p><p><br></p>', 'READ', '2014-06-23 00:23:15.418+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (79, '2014-06-23 00:23:15.884+08', '*moire', 'uat_supervisor1', NULL, 'NOTICE', '[MOIRE] Late Requirement Verification Notification', '<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "UAT job by ENG -1 " job is still pending since 22-Jun-2014 07:05 PM.</p><p><br></p>', 'READ', '2014-06-23 00:23:15.884+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (80, '2014-06-23 00:23:16.288+08', '*moire', 'uat_supervisor1', NULL, 'NOTICE', '[MOIRE] Late Requirement Verification Notification', '<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "Test revert job" job is still pending since 22-Jun-2014 07:08 PM.</p><p><br></p>', 'READ', '2014-06-23 00:23:16.288+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (129, '2014-07-03 12:43:11.029+08', '*moire', 'uat_customer1', NULL, 'NOTICE', '[MOIRE] Job Acknowledgement', '<p>Dear Uat customer 1,</p><p>This email is to inform that your job request "Check fields" is now confirmed and acknowledged. </p><p><br></p><p>Estimate Time Required : 300 minutes (Working hour)</p><p>Estimate Completion Time : 3-Jul-2014 5:43 PM</p><div><br></div>', 'READ', '2014-07-03 12:43:11.029+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (130, '2014-07-03 14:08:34.973+08', '*moire', 'uat_customer1', NULL, 'NOTICE', '[MOIRE] Job Acknowledgement', '<p>Dear Uat customer 1,</p><p>This email is to inform that your job request "new job exceed SLA" is now confirmed and acknowledged. </p><p><br></p><p>Estimate Time Required : 240 minutes (Working hour)</p><p>Estimate Completion Time : 4-Jul-2014 9:08 AM</p><div><br></div>', 'READ', '2014-07-03 14:08:34.973+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (81, '2014-06-23 00:23:16.682+08', '*moire', 'uat_supervisor1', NULL, 'NOTICE', '[MOIRE] Late Requirement Verification Notification', '<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "sad" job is still pending since 22-Jun-2014 10:25 PM.</p><p><br></p>', 'READ', '2014-06-23 00:23:16.682+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (82, '2014-06-23 00:23:17.087+08', '*moire', 'uat_supervisor1', NULL, 'NOTICE', '[MOIRE] Late Requirement Verification Notification', '<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "asddsa" job is still pending since 22-Jun-2014 10:26 PM.</p><p><br></p>', 'READ', '2014-06-23 00:23:17.087+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (83, '2014-06-23 00:23:17.477+08', '*moire', 'uat_supervisor1', NULL, 'NOTICE', '[MOIRE] Late Requirement Verification Notification', '<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "1" job is still pending since 22-Jun-2014 10:27 PM.</p><p><br></p>', 'READ', '2014-06-23 00:23:17.477+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (84, '2014-06-23 00:23:17.848+08', '*moire', 'uat_supervisor1', NULL, 'NOTICE', '[MOIRE] Late Requirement Verification Notification', '<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "12asd" job is still pending since 22-Jun-2014 10:29 PM.</p><p><br></p>', 'READ', '2014-06-23 00:23:17.848+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (88, '2014-06-23 00:23:18.464+08', '*moire', 'uat_supervisor1', NULL, 'NOTICE', '[MOIRE] Late Requirement Verification Notification', '<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "Oder 2 by eng" job is still pending since 22-Jun-2014 10:25 PM.</p><p><br></p>', 'READ', '2014-06-23 00:23:18.464+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (95, '2014-06-30 17:43:22.135222+08', '*moire', 'uat_supervisor1', NULL, 'NOTICE', '[MOIRE] Late Requirement Verification Notification', '<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "Esp case" job is still pending since 21-Jun-2014 10:17 AM.</p><p><br></p>', 'READ', '2014-06-30 17:43:22.135222+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (97, '2014-06-30 17:43:23.010533+08', '*moire', 'uat_supervisor1', NULL, 'NOTICE', '[MOIRE] Late Requirement Verification Notification', '<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "Test job" job is still pending since 22-Jun-2014 03:55 AM.</p><p><br></p>', 'READ', '2014-06-30 17:43:23.010533+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (98, '2014-06-30 17:43:23.760528+08', '*moire', 'uat_supervisor1', NULL, 'NOTICE', '[MOIRE] Late Requirement Verification Notification', '<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "UAT job by ENG -1 " job is still pending since 22-Jun-2014 07:05 AM.</p><p><br></p>', 'READ', '2014-06-30 17:43:23.760528+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (99, '2014-06-30 17:43:24.525236+08', '*moire', 'uat_supervisor1', NULL, 'NOTICE', '[MOIRE] Late Requirement Verification Notification', '<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "Test revert job" job is still pending since 22-Jun-2014 07:08 AM.</p><p><br></p>', 'READ', '2014-06-30 17:43:24.525236+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (131, '2014-07-08 16:49:51.813+08', '*moire', 'uat_customer1', NULL, 'NOTICE', '[MOIRE] Job Acknowledgement', '<p>Dear Uat customer 1,</p><p>This email is to inform that your job request "New job test printer" is now confirmed and acknowledged. </p><p><br></p><p>Estimate Time Required : 240 minutes (Working hour)</p><p>Estimate Completion Time : 8-Jul-2014 1:00 PM</p><div><br></div>', 'UNREAD', '2014-07-08 16:49:51.813+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (96, '2014-06-30 17:43:22.234932+08', '*moire', 'supervisor', NULL, 'NOTICE', '[MOIRE] Late Job WIP Notification', '<p>Dear Manager and Supervisor,</p><p>This email is to notify that the "Master card artwork" job is still WIP from UAT Artist1 since .</p><div><br></div>', 'READ', '2014-06-30 17:43:22.234932+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (108, '2014-06-30 17:43:30.739247+08', '*moire', 'supervisor', NULL, 'NOTICE', '[MOIRE] Late Job WIP Notification', '<p>Dear Manager and Supervisor,</p><p>This email is to notify that the "Test job by Eng" job is still WIP from UAT Artist1 since 24-Jun-2014 07:02 AM.</p><div><br></div>', 'READ', '2014-06-30 17:43:30.739247+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (110, '2014-06-30 17:43:31.778216+08', '*moire', 'supervisor', NULL, 'NOTICE', '[MOIRE] Late Job WIP Notification', '<p>Dear Manager and Supervisor,</p><p>This email is to notify that the "A job with a lot details" job is still WIP from UAT Artist4 since 25-Jun-2014 11:16 PM.</p><div><br></div>', 'READ', '2014-06-30 17:43:31.778216+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (113, '2014-06-30 17:43:33.258755+08', '*moire', 'supervisor', NULL, 'NOTICE', '[MOIRE] Late Job WIP Notification', '<p>Dear Manager and Supervisor,</p><p>This email is to notify that the "YYYSSS" job is still WIP from Artist 2 since 26-Jun-2014 04:33 AM.</p><div><br></div>', 'READ', '2014-06-30 17:43:33.258755+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (114, '2014-06-30 17:43:33.303587+08', '*moire', 'supervisor', NULL, 'NOTICE', '[MOIRE] Late Job QC Notification', '<p>Dear Manager and Supervisor,</p><p>This email is to notify that the "test yys" job is still pending QC since 30-Jun-2014 02:46 AM.</p><div><br></div>', 'READ', '2014-06-30 17:43:33.303587+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (132, '2014-07-09 11:32:51.162+08', '*moire', 'ysyow', NULL, 'NOTICE', '[MOIRE] Job Acknowledgement', '<p>Dear Yow Yik Shuen,</p><p>This email is to inform that your job request "asdads" is now confirmed and acknowledged. </p><p><br></p><p>Estimate Time Required : 420 minutes (Working hour)</p><p>Estimate Completion Time : 10-Jul-2014 9:32 AM</p><div><br></div>', 'READ', '2014-07-09 11:32:51.162+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (133, '2014-07-09 11:37:23.744+08', '*moire', 'supervisor', NULL, 'NOTICE', '[MOIRE] Late Job QC Notification', '<p>Dear Manager and Supervisor,</p><p>This email is to notify that the "New job test printer" job is still pending QC since 08-Jul-2014 04:50 PM.</p><div><br></div>', 'READ', '2014-07-09 11:37:23.744+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (134, '2014-07-09 11:48:40.759+08', '*moire', 'supervisor', NULL, 'NOTICE', '[MOIRE] Late Job Acknowledgement Notification', '<p>Dear Supervisor,</p><p>This email is to notify that the "xssaasd" job is still pending acknowledgement from Artist 2 since 09-Jul-2014 11:46 AM.</p><div><br></div>', 'READ', '2014-07-09 11:48:40.759+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (135, '2014-07-09 11:56:38.904+08', '*moire', 'supervisor', NULL, 'NOTICE', '[MOIRE] Late Job Acknowledgement Notification', '<p>Dear Supervisor,</p><p>This email is to notify that the "xssaasd" job is still pending acknowledgement from Artist 2 since 09-Jul-2014 11:55 AM.</p><div><br></div>', 'READ', '2014-07-09 11:56:38.904+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (136, '2014-07-09 16:08:51.872+08', 'supervisor', 'admin', NULL, 'MESSAGE', 'asdasd', NULL, 'UNREAD', '2014-07-09 16:08:51.872+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (137, '2014-07-09 16:10:29.755+08', 'supervisor', 'supervisor', NULL, 'MESSAGE', 'asdasd', NULL, 'READ', '2014-07-09 16:10:29.755+08', NULL, 3);


--
-- TOC entry 3441 (class 0 OID 0)
-- Dependencies: 471
-- Name: fcuserdiary_di_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcuserdiary_di_id_seq', 137, true);


--
-- TOC entry 3292 (class 0 OID 51790)
-- Dependencies: 472
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
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (500, 'admin', '192.168.0.106', 'Y', '2014-05-18 18:13:28.994+08', '2014-05-18 18:13:28.994+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (501, 'admin', '192.168.0.106', 'Y', '2014-05-18 18:56:16.496+08', '2014-05-18 18:56:16.496+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (502, 'admin', '192.168.0.106', 'Y', '2014-05-18 19:00:31.127+08', '2014-05-18 19:00:31.127+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (503, 'admin', '::1', 'Y', '2014-05-19 11:45:13.35+08', '2014-05-19 11:45:13.35+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (504, 'admin', '192.168.0.106', 'Y', '2014-05-20 00:24:25.105+08', '2014-05-20 00:24:25.105+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (505, 'admin', '::1', 'Y', '2014-05-24 10:51:17.118+08', '2014-05-24 10:51:17.118+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (506, 'admin', '::1', 'Y', '2014-05-24 13:33:52.031+08', '2014-05-24 13:33:52.031+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (507, 'admin', '::1', 'Y', '2014-05-27 15:52:50.703+08', '2014-05-27 15:52:50.703+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (508, 'admin', '192.168.0.106', 'Y', '2014-05-29 23:22:51.732+08', '2014-05-29 23:22:51.732+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (509, 'admin', '::1', 'Y', '2014-06-01 13:19:33.769+08', '2014-06-01 13:19:33.769+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (510, 'admin', '127.0.0.1', 'Y', '2014-06-03 10:53:40.408+08', '2014-06-03 10:53:40.408+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (511, 'admin', '127.0.0.1', 'Y', '2014-06-03 12:40:53.247+08', '2014-06-03 12:40:53.247+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (512, 'admin', '127.0.0.1', 'Y', '2014-06-06 12:18:06.178+08', '2014-06-06 12:18:06.178+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (513, 'admin', '127.0.0.1', 'Y', '2014-06-07 17:11:12.735+08', '2014-06-07 17:11:12.735+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (514, 'admin', '127.0.0.1', 'Y', '2014-06-10 15:41:10.638+08', '2014-06-10 15:41:10.638+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (515, 'admin', '127.0.0.1', 'Y', '2014-06-10 16:37:07.829+08', '2014-06-10 16:37:07.829+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (516, 'admin', '127.0.0.1', 'Y', '2014-06-11 20:45:23.434+08', '2014-06-11 20:45:23.434+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (517, 'admin', '127.0.0.1', 'Y', '2014-06-12 20:56:27.182+08', '2014-06-12 20:56:27.182+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (518, 'admin', '127.0.0.1', 'Y', '2014-06-13 11:59:26.789+08', '2014-06-13 11:59:26.789+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (519, 'admin', '127.0.0.1', 'Y', '2014-06-13 22:36:55.495+08', '2014-06-13 22:36:55.495+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (520, 'admin', '127.0.0.1', 'Y', '2014-06-15 01:21:00.515+08', '2014-06-15 01:21:00.515+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (521, 'admin', '127.0.0.1', 'Y', '2014-06-17 15:23:24.99+08', '2014-06-17 15:23:24.99+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (522, 'artist1', '127.0.0.1', 'Y', '2014-06-19 22:49:35.881+08', '2014-06-19 22:49:35.881+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (523, 'admin', '127.0.0.1', 'Y', '2014-06-19 22:49:59.177+08', '2014-06-19 22:49:59.177+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (524, 'admin', '192.168.0.128', 'Y', '2014-06-20 15:39:53.869+08', '2014-06-20 15:39:53.869+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (525, 'admin', '127.0.0.1', 'Y', '2014-06-20 16:54:54.21+08', '2014-06-20 16:54:54.21+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (526, 'admin2', '192.168.0.128', 'N', '2014-06-20 17:14:34.08+08', '2014-06-20 17:14:34.08+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (527, 'admin2', '192.168.0.128', 'Y', '2014-06-20 17:14:40.386+08', '2014-06-20 17:14:40.386+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (528, 'admin', '192.168.0.128', 'Y', '2014-06-20 19:07:29.732+08', '2014-06-20 19:07:29.732+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (529, 'admin', '127.0.0.1', 'Y', '2014-06-20 19:09:03.369+08', '2014-06-20 19:09:03.369+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (530, 'supervisor', '192.168.0.128', 'Y', '2014-06-20 19:09:25.684+08', '2014-06-20 19:09:25.684+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (531, 'admin', '127.0.0.1', 'Y', '2014-06-21 12:52:39.792+08', '2014-06-21 12:52:39.792+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (532, 'admin', '127.0.0.1', 'Y', '2014-06-21 12:55:29.019+08', '2014-06-21 12:55:29.019+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (533, 'admin', '127.0.0.1', 'Y', '2014-06-21 13:28:21.799+08', '2014-06-21 13:28:21.799+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (534, 'admin2', '192.168.0.128', 'N', '2014-06-21 13:31:42.113+08', '2014-06-21 13:31:42.113+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (535, 'admin2', '192.168.0.128', 'Y', '2014-06-21 13:31:46.38+08', '2014-06-21 13:31:46.38+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (536, 'admin', '192.168.220.1', 'Y', '2014-06-21 17:21:02.601+08', '2014-06-21 17:21:02.601+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (537, 'admin', '192.168.220.50', 'Y', '2014-06-21 17:26:22.019+08', '2014-06-21 17:26:22.019+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (538, 'admin2', '192.168.220.1', 'Y', '2014-06-21 17:26:35.905+08', '2014-06-21 17:26:35.905+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (539, 'uat_cust1', '192.168.220.50', 'Y', '2014-06-21 17:38:43.773+08', '2014-06-21 17:38:43.773+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (540, 'supervisor', '192.168.220.1', 'Y', '2014-06-21 18:10:07.278+08', '2014-06-21 18:10:07.278+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (541, 'supervisor', '192.168.220.1', 'N', '2014-06-21 18:10:40.339+08', '2014-06-21 18:10:40.339+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (542, 'supervisor', '192.168.220.1', 'Y', '2014-06-21 18:10:44.684+08', '2014-06-21 18:10:44.684+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (543, 'artist1', '::1', 'Y', '2014-06-21 18:10:59.767+08', '2014-06-21 18:10:59.767+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (544, 'admin2', '192.168.0.148', 'Y', '2014-06-21 18:16:01.645+08', '2014-06-21 18:16:01.645+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (545, 'admin', '192.168.220.1', 'Y', '2014-06-21 18:24:54.722+08', '2014-06-21 18:24:54.722+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (546, 'ysyow', '192.168.220.1', 'N', '2014-06-21 18:26:20.309+08', '2014-06-21 18:26:20.309+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (547, 'ysyow', '192.168.220.1', 'Y', '2014-06-21 18:26:24.692+08', '2014-06-21 18:26:24.692+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (548, 'esp', '192.168.220.51', 'Y', '2014-06-21 18:26:28.016+08', '2014-06-21 18:26:28.016+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (549, 'ysyow', '192.168.220.1', 'Y', '2014-06-21 18:44:16.411+08', '2014-06-21 18:44:16.411+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (550, 'qc', '::1', 'Y', '2014-06-21 18:54:44.43+08', '2014-06-21 18:54:44.43+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (551, 'admin', '::1', 'Y', '2014-06-21 18:59:46.986+08', '2014-06-21 18:59:46.986+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (552, 'uat_supervisor1', '192.168.220.50', 'Y', '2014-06-21 18:59:51.768+08', '2014-06-21 18:59:51.768+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (553, 'admin2', '::1', 'Y', '2014-06-21 19:04:21.409+08', '2014-06-21 19:04:21.409+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (554, 'fongadmin', '192.168.0.148', 'Y', '2014-06-21 19:07:03.035+08', '2014-06-21 19:07:03.035+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (555, 'admin', '192.168.220.50', 'Y', '2014-06-21 19:08:32.532+08', '2014-06-21 19:08:32.532+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (556, 'fongcustomer', '192.168.0.148', 'Y', '2014-06-21 19:10:06.051+08', '2014-06-21 19:10:06.051+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (557, 'uat_customer1', '192.168.220.50', 'N', '2014-06-21 19:13:57.433+08', '2014-06-21 19:13:57.433+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (558, 'uat_cust1', '192.168.220.50', 'Y', '2014-06-21 19:14:13.413+08', '2014-06-21 19:14:13.413+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (559, 'uat_supervisor1', '192.168.220.50', 'Y', '2014-06-21 19:18:21.427+08', '2014-06-21 19:18:21.427+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (560, 'uat_customer1', '192.168.220.50', 'N', '2014-06-21 20:36:24.956+08', '2014-06-21 20:36:24.956+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (561, 'uat_cust1', '192.168.220.50', 'Y', '2014-06-21 20:36:34.993+08', '2014-06-21 20:36:34.993+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (562, 'uat_supervisor1', '192.168.220.50', 'Y', '2014-06-21 21:05:48.915+08', '2014-06-21 21:05:48.915+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (563, 'uat_cust1', '192.168.220.50', 'Y', '2014-06-21 21:07:08.904+08', '2014-06-21 21:07:08.904+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (564, 'uat_supervisor1', '192.168.220.50', 'Y', '2014-06-21 21:15:49.895+08', '2014-06-21 21:15:49.895+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (565, 'admin', '192.168.220.51', 'Y', '2014-06-21 21:17:39.929+08', '2014-06-21 21:17:39.929+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (566, 'esp', '192.168.220.51', 'Y', '2014-06-21 21:17:47.498+08', '2014-06-21 21:17:47.498+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (567, 'uat_supervisor1', '192.168.220.51', 'Y', '2014-06-21 21:17:59.376+08', '2014-06-21 21:17:59.376+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (568, 'admin', '192.168.220.51', 'Y', '2014-06-21 21:18:54.566+08', '2014-06-21 21:18:54.566+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (569, 'uat_supervisor1', '192.168.220.50', 'Y', '2014-06-21 21:26:32.195+08', '2014-06-21 21:26:32.195+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (570, 'esp', '192.168.220.51', 'Y', '2014-06-21 21:27:08.347+08', '2014-06-21 21:27:08.347+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (571, 'esp_supervisor', '192.168.220.51', 'Y', '2014-06-21 21:28:13.917+08', '2014-06-21 21:28:13.917+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (572, 'uat_artist1', '192.168.220.50', 'Y', '2014-06-21 21:31:22.868+08', '2014-06-21 21:31:22.868+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (573, 'fongsupervisor', '192.168.0.148', 'Y', '2014-06-21 21:41:25.349+08', '2014-06-21 21:41:25.349+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (574, 'fongsupervisor', '192.168.0.148', 'Y', '2014-06-21 21:44:09.982+08', '2014-06-21 21:44:09.982+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (575, 'uat_supervisor1', '192.168.220.50', 'Y', '2014-06-21 21:48:57.105+08', '2014-06-21 21:48:57.105+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (576, 'admin', '192.168.220.50', 'Y', '2014-06-21 21:49:28.696+08', '2014-06-21 21:49:28.696+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (577, 'uat_qc', '192.168.220.50', 'N', '2014-06-21 21:50:32+08', '2014-06-21 21:50:32+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (578, 'uat_qc1', '192.168.220.50', 'Y', '2014-06-21 21:50:46.171+08', '2014-06-21 21:50:46.171+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (579, 'uat_supervisor1', '192.168.220.50', 'Y', '2014-06-21 21:52:00.531+08', '2014-06-21 21:52:00.531+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (580, 'fongsupervisor', '192.168.0.148', 'Y', '2014-06-21 21:52:33.384+08', '2014-06-21 21:52:33.384+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (581, 'uat_cust1', '192.168.220.50', 'Y', '2014-06-21 21:54:19.609+08', '2014-06-21 21:54:19.609+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (582, 'uat_supervisor1', '192.168.220.50', 'Y', '2014-06-21 21:58:00.992+08', '2014-06-21 21:58:00.992+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (583, 'esp_supervisor', '192.168.220.51', 'Y', '2014-06-21 22:03:16.241+08', '2014-06-21 22:03:16.241+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (584, 'uat_artist1', '192.168.220.50', 'Y', '2014-06-21 22:05:50.344+08', '2014-06-21 22:05:50.344+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (585, 'esp_supervisor', '192.168.220.51', 'Y', '2014-06-21 22:15:48.493+08', '2014-06-21 22:15:48.493+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (586, 'admin', '192.168.220.50', 'Y', '2014-06-21 22:18:32.299+08', '2014-06-21 22:18:32.299+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (587, 'esp_supervisor', '192.168.220.51', 'N', '2014-06-21 22:21:37.523+08', '2014-06-21 22:21:37.523+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (588, 'uat_cust1', '192.168.220.50', 'Y', '2014-06-21 22:22:04.605+08', '2014-06-21 22:22:04.605+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (589, 'uat_supervisor1', '192.168.220.50', 'Y', '2014-06-21 22:24:05.377+08', '2014-06-21 22:24:05.377+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (590, 'uat_artist1', '192.168.220.50', 'Y', '2014-06-21 22:25:48.018+08', '2014-06-21 22:25:48.018+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (591, 'uat_supervisor1', '192.168.220.50', 'Y', '2014-06-21 22:27:30.026+08', '2014-06-21 22:27:30.026+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (592, 'uat_artist1', '192.168.220.50', 'Y', '2014-06-21 22:28:18.492+08', '2014-06-21 22:28:18.492+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (593, 'uat_supervisor1', '192.168.220.50', 'Y', '2014-06-21 22:30:40.145+08', '2014-06-21 22:30:40.145+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (594, 'uat_supervisor1', '192.168.220.50', 'Y', '2014-06-21 22:39:13.931+08', '2014-06-21 22:39:13.931+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (595, 'fongadmin', '192.168.0.148', 'N', '2014-06-21 22:39:52.95+08', '2014-06-21 22:39:52.95+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (596, 'fongadmin', '192.168.0.148', 'N', '2014-06-21 22:39:59.152+08', '2014-06-21 22:39:59.152+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (597, 'esp_supervisor', '192.168.0.148', 'Y', '2014-06-21 22:40:40.993+08', '2014-06-21 22:40:40.993+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (598, 'uat_artist1', '192.168.220.50', 'Y', '2014-06-21 22:42:19.319+08', '2014-06-21 22:42:19.319+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (599, 'uat_qc1', '192.168.220.50', 'Y', '2014-06-21 22:54:26.388+08', '2014-06-21 22:54:26.388+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (600, 'esp_supervisor', '192.168.220.51', 'Y', '2014-06-21 22:55:08.47+08', '2014-06-21 22:55:08.47+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (601, 'admin', '192.168.220.50', 'Y', '2014-06-21 22:57:09.156+08', '2014-06-21 22:57:09.156+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (602, 'uat_qc1', '192.168.220.50', 'Y', '2014-06-21 22:57:50.318+08', '2014-06-21 22:57:50.318+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (603, 'esp_supervisor', '192.168.220.51', 'Y', '2014-06-21 23:05:39.128+08', '2014-06-21 23:05:39.128+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (604, 'esp', '192.168.220.51', 'Y', '2014-06-21 23:10:38.805+08', '2014-06-21 23:10:38.805+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (605, 'esp_artist', '192.168.220.51', 'Y', '2014-06-21 23:17:46.3+08', '2014-06-21 23:17:46.3+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (606, 'esp_artist1', '192.168.220.51', 'N', '2014-06-21 23:20:54.621+08', '2014-06-21 23:20:54.621+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (607, 'esp_artist', '192.168.220.51', 'Y', '2014-06-21 23:20:59.985+08', '2014-06-21 23:20:59.985+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (608, 'uat_artist1', '192.168.220.51', 'Y', '2014-06-21 23:21:35.596+08', '2014-06-21 23:21:35.596+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (609, 'uat_artist1', '192.168.220.51', 'Y', '2014-06-21 23:21:57.789+08', '2014-06-21 23:21:57.789+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (610, 'esp', '192.168.220.51', 'Y', '2014-06-21 23:23:28.32+08', '2014-06-21 23:23:28.32+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (611, 'fongadmin', '192.168.0.148', 'N', '2014-06-21 23:23:35.793+08', '2014-06-21 23:23:35.793+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (612, 'fongadmin', '192.168.0.148', 'Y', '2014-06-21 23:24:18.644+08', '2014-06-21 23:24:18.644+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (613, 'esp', '192.168.220.51', 'Y', '2014-06-21 23:25:01.178+08', '2014-06-21 23:25:01.178+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (614, 'uat_artist1', '192.168.220.50', 'Y', '2014-06-21 23:32:32.581+08', '2014-06-21 23:32:32.581+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (615, 'ysyow', '192.168.220.1', 'Y', '2014-06-21 23:37:58.457+08', '2014-06-21 23:37:58.457+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (616, 'uat_cust1', '192.168.220.1', 'N', '2014-06-21 23:39:12.709+08', '2014-06-21 23:39:12.709+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (617, 'uat_cust1', '192.168.220.1', 'Y', '2014-06-21 23:39:19.204+08', '2014-06-21 23:39:19.204+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (618, 'uat_cust1', '192.168.220.1', 'Y', '2014-06-21 23:39:22.161+08', '2014-06-21 23:39:22.161+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (619, 'uat_cust1', '192.168.220.1', 'Y', '2014-06-21 23:41:02.812+08', '2014-06-21 23:41:02.812+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (620, 'uat_cust1', '192.168.220.1', 'Y', '2014-06-21 23:41:04.801+08', '2014-06-21 23:41:04.801+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (621, 'uat_cust1', '192.168.220.1', 'Y', '2014-06-21 23:41:33.921+08', '2014-06-21 23:41:33.921+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (622, 'uat_cust1', '192.168.220.1', 'Y', '2014-06-21 23:41:35.523+08', '2014-06-21 23:41:35.523+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (623, 'uat_cust1', '192.168.220.1', 'Y', '2014-06-21 23:41:37.185+08', '2014-06-21 23:41:37.185+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (624, 'uat_cust1', '192.168.220.1', 'Y', '2014-06-21 23:41:38.368+08', '2014-06-21 23:41:38.368+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (625, 'uat_cust1', '192.168.220.1', 'Y', '2014-06-21 23:41:39.379+08', '2014-06-21 23:41:39.379+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (626, 'uat_cust1', '192.168.220.1', 'Y', '2014-06-21 23:41:40.329+08', '2014-06-21 23:41:40.329+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (627, 'uat_cust1', '192.168.220.1', 'Y', '2014-06-21 23:41:41.396+08', '2014-06-21 23:41:41.396+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (628, 'uat_cust1', '192.168.220.1', 'Y', '2014-06-21 23:41:42.435+08', '2014-06-21 23:41:42.435+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (629, 'uat_cust1', '192.168.220.1', 'Y', '2014-06-21 23:41:43.355+08', '2014-06-21 23:41:43.355+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (630, 'uat_cust1', '192.168.220.1', 'Y', '2014-06-21 23:41:44.246+08', '2014-06-21 23:41:44.246+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (631, 'uat_cust1', '192.168.220.1', 'Y', '2014-06-21 23:41:45.308+08', '2014-06-21 23:41:45.308+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (632, 'uat_cust1', '192.168.220.1', 'Y', '2014-06-21 23:41:46.262+08', '2014-06-21 23:41:46.262+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (633, 'uat_cust1', '192.168.220.1', 'Y', '2014-06-21 23:41:47.137+08', '2014-06-21 23:41:47.137+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (634, 'uat_cust1', '192.168.220.1', 'Y', '2014-06-21 23:45:42.722+08', '2014-06-21 23:45:42.722+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (635, 'uat_cust1', '192.168.220.1', 'Y', '2014-06-21 23:46:00.566+08', '2014-06-21 23:46:00.566+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (636, 'uat_cust1', '192.168.220.1', 'Y', '2014-06-21 23:46:04.128+08', '2014-06-21 23:46:04.128+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (637, 'uat_qc1', '192.168.220.50', 'Y', '2014-06-21 23:46:42.655+08', '2014-06-21 23:46:42.655+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (638, 'uat_cust1', '192.168.220.1', 'Y', '2014-06-21 23:47:32.845+08', '2014-06-21 23:47:32.845+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (639, 'uat_cust1', '192.168.220.1', 'Y', '2014-06-21 23:47:34.909+08', '2014-06-21 23:47:34.909+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (640, 'uat_cust1', '192.168.220.1', 'Y', '2014-06-21 23:47:36.169+08', '2014-06-21 23:47:36.169+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (641, 'uat_cust1', '192.168.220.1', 'Y', '2014-06-21 23:47:37.408+08', '2014-06-21 23:47:37.408+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (642, 'uat_cust1', '192.168.220.1', 'Y', '2014-06-21 23:48:04.05+08', '2014-06-21 23:48:04.05+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (643, 'uat_cust1', '192.168.220.1', 'Y', '2014-06-21 23:48:05.876+08', '2014-06-21 23:48:05.876+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (644, 'uat_cust1', '192.168.220.1', 'Y', '2014-06-21 23:48:07.201+08', '2014-06-21 23:48:07.201+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (645, 'uat_cust1', '192.168.220.1', 'Y', '2014-06-21 23:48:16.773+08', '2014-06-21 23:48:16.773+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (646, 'uat_cust1', '192.168.220.1', 'N', '2014-06-21 23:49:27.808+08', '2014-06-21 23:49:27.808+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (647, 'uat_cust1', '192.168.220.1', 'Y', '2014-06-21 23:49:35.063+08', '2014-06-21 23:49:35.063+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (648, 'uat_cust1', '192.168.220.1', 'Y', '2014-06-21 23:50:04.073+08', '2014-06-21 23:50:04.073+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (649, 'uat_cust1', '192.168.220.1', 'Y', '2014-06-21 23:50:53.989+08', '2014-06-21 23:50:53.989+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (650, 'uat_artist', '192.168.220.51', 'N', '2014-06-22 00:04:14.563+08', '2014-06-22 00:04:14.563+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (651, 'uat_artist1', '192.168.220.51', 'Y', '2014-06-22 00:04:43.264+08', '2014-06-22 00:04:43.264+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (652, 'uat_supervisor', '192.168.220.51', 'N', '2014-06-22 00:05:29.862+08', '2014-06-22 00:05:29.862+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (653, 'uat_supervisor1', '192.168.220.51', 'Y', '2014-06-22 00:05:42.534+08', '2014-06-22 00:05:42.534+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (654, 'uat_artist1', '192.168.220.51', 'Y', '2014-06-22 00:07:50.019+08', '2014-06-22 00:07:50.019+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (655, 'uat_cust1', '192.168.220.50', 'Y', '2014-06-22 00:11:36.568+08', '2014-06-22 00:11:36.568+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (656, 'uat_customer1', '192.168.220.50', 'N', '2014-06-22 00:11:46.015+08', '2014-06-22 00:11:46.015+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (657, 'fongadmin', '192.168.0.148', 'Y', '2014-06-22 00:30:22.819+08', '2014-06-22 00:30:22.819+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (658, 'uat_supervisor1', '192.168.220.50', 'Y', '2014-06-22 00:34:35.011+08', '2014-06-22 00:34:35.011+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (659, 'ysyow', '192.168.220.1', 'Y', '2014-06-22 13:24:36.172+08', '2014-06-22 13:24:36.172+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (660, 'ysyow', '192.168.220.1', 'Y', '2014-06-22 13:27:07.936+08', '2014-06-22 13:27:07.936+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (661, 'uat_cust1', '192.168.220.1', 'Y', '2014-06-22 13:28:22.87+08', '2014-06-22 13:28:22.87+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (662, 'admin', '192.168.220.50', 'Y', '2014-06-22 13:32:21.224+08', '2014-06-22 13:32:21.224+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (663, 'uat_supervisor1', '192.168.220.50', 'Y', '2014-06-22 13:33:35.336+08', '2014-06-22 13:33:35.336+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (664, 'uat_artist1', '192.168.220.50', 'Y', '2014-06-22 13:34:22.73+08', '2014-06-22 13:34:22.73+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (665, 'admin', '::1', 'Y', '2014-06-22 13:38:59.673+08', '2014-06-22 13:38:59.673+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (666, 'uat_supervisor', '192.168.220.50', 'N', '2014-06-22 13:40:18.35+08', '2014-06-22 13:40:18.35+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (667, 'uat_supervisor1', '192.168.220.50', 'Y', '2014-06-22 13:40:23.608+08', '2014-06-22 13:40:23.608+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (668, 'uat_artist1', '192.168.220.50', 'Y', '2014-06-22 13:41:35.489+08', '2014-06-22 13:41:35.489+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (669, 'uat_supervisor1', '192.168.220.50', 'Y', '2014-06-22 13:41:58.294+08', '2014-06-22 13:41:58.294+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (670, 'uat_supervisor1', '192.168.220.50', 'Y', '2014-06-22 13:58:00.778+08', '2014-06-22 13:58:00.778+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (671, 'uat_artist1', '192.168.220.50', 'Y', '2014-06-22 14:03:05.363+08', '2014-06-22 14:03:05.363+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (672, 'uat_cust1', '192.168.220.1', 'Y', '2014-06-22 14:17:38.369+08', '2014-06-22 14:17:38.369+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (673, 'uat_cust1', '192.168.220.1', 'Y', '2014-06-22 14:18:50.861+08', '2014-06-22 14:18:50.861+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (674, 'uat_cust1', '192.168.220.1', 'Y', '2014-06-22 14:21:46.565+08', '2014-06-22 14:21:46.565+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (675, 'uat_cust1', '192.168.220.1', 'Y', '2014-06-22 14:21:54.562+08', '2014-06-22 14:21:54.562+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (676, 'uat_cust1', '192.168.220.1', 'N', '2014-06-22 14:22:06.087+08', '2014-06-22 14:22:06.087+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (677, 'uat_cust1', '192.168.220.1', 'Y', '2014-06-22 14:22:10.911+08', '2014-06-22 14:22:10.911+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (678, 'uat_cust1', '192.168.220.1', 'Y', '2014-06-22 14:23:11.814+08', '2014-06-22 14:23:11.814+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (679, 'admin', '192.168.220.1', 'Y', '2014-06-22 14:23:18.561+08', '2014-06-22 14:23:18.561+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (680, 'uat_supervisor1', '192.168.220.50', 'Y', '2014-06-22 14:23:34.511+08', '2014-06-22 14:23:34.511+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (681, 'uat_cust1', '::1', 'Y', '2014-06-22 14:24:04.331+08', '2014-06-22 14:24:04.331+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (682, 'uat_cust1', '::1', 'Y', '2014-06-22 14:24:15.343+08', '2014-06-22 14:24:15.343+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (683, 'uat_cust1', '::1', 'Y', '2014-06-22 14:24:28.294+08', '2014-06-22 14:24:28.294+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (684, 'ysyow', '::1', 'Y', '2014-06-22 15:22:57.069+08', '2014-06-22 15:22:57.069+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (685, 'uat_customer1', '192.168.0.124', 'N', '2014-06-22 15:52:19.249+08', '2014-06-22 15:52:19.249+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (686, 'uat_customer1', '192.168.0.124', 'Y', '2014-06-22 15:52:27.703+08', '2014-06-22 15:52:27.703+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (687, 'uat_customer1', '192.168.0.124', 'Y', '2014-06-22 15:53:52.39+08', '2014-06-22 15:53:52.39+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (688, 'ysyow', '192.168.220.1', 'Y', '2014-06-22 15:53:53.779+08', '2014-06-22 15:53:53.779+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (689, 'supervisor', '192.168.220.1', 'Y', '2014-06-22 15:54:05.906+08', '2014-06-22 15:54:05.906+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (690, 'ysyow', '::1', 'Y', '2014-06-22 15:55:07.871+08', '2014-06-22 15:55:07.871+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (691, 'artist2', '::1', 'Y', '2014-06-22 16:04:55.146+08', '2014-06-22 16:04:55.146+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (692, 'abc', '192.168.0.148', 'N', '2014-06-22 16:06:10.975+08', '2014-06-22 16:06:10.975+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (693, 'ysyow', '192.168.0.152', 'Y', '2014-06-22 16:07:27.761+08', '2014-06-22 16:07:27.761+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (694, 'abc', '192.168.0.148', 'N', '2014-06-22 16:08:18.496+08', '2014-06-22 16:08:18.496+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (695, 'abc', '192.168.0.148', 'N', '2014-06-22 16:09:25.158+08', '2014-06-22 16:09:25.158+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (696, 'qc', '::1', 'Y', '2014-06-22 16:09:57.203+08', '2014-06-22 16:09:57.203+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (697, 'abc', '192.168.0.148', 'N', '2014-06-22 16:11:48.404+08', '2014-06-22 16:11:48.404+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (698, 'abc', '192.168.0.148', 'N', '2014-06-22 16:12:10.054+08', '2014-06-22 16:12:10.054+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (699, 'abc', '192.168.0.148', 'N', '2014-06-22 16:12:20.926+08', '2014-06-22 16:12:20.926+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (700, 'admin', '192.168.0.148', 'Y', '2014-06-22 16:12:31.483+08', '2014-06-22 16:12:31.483+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (701, 'esp', '192.168.0.124', 'Y', '2014-06-22 16:12:46.934+08', '2014-06-22 16:12:46.934+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (702, 'admin', '192.168.0.148', 'Y', '2014-06-22 16:12:54.308+08', '2014-06-22 16:12:54.308+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (703, 'artist2', '::1', 'Y', '2014-06-22 16:13:38.002+08', '2014-06-22 16:13:38.002+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (704, 'qc', '::1', 'Y', '2014-06-22 16:14:18.431+08', '2014-06-22 16:14:18.431+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (705, 'admin', '192.168.0.148', 'Y', '2014-06-22 16:23:58.886+08', '2014-06-22 16:23:58.886+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (706, 'esp', '192.168.220.50', 'Y', '2014-06-22 16:24:35.898+08', '2014-06-22 16:24:35.898+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (707, 'fongadmin', '192.168.0.148', 'Y', '2014-06-22 16:25:11.016+08', '2014-06-22 16:25:11.016+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (708, 'fongadmin', '192.168.0.148', 'N', '2014-06-22 16:25:20.221+08', '2014-06-22 16:25:20.221+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (709, 'fongadmin', '192.168.0.148', 'Y', '2014-06-22 16:25:28.176+08', '2014-06-22 16:25:28.176+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (710, 'fongadmin', '192.168.0.148', 'N', '2014-06-22 16:28:22.479+08', '2014-06-22 16:28:22.479+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (711, 'fongadmin', '192.168.0.148', 'Y', '2014-06-22 16:28:28.912+08', '2014-06-22 16:28:28.912+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (712, 'fongadmin', '192.168.0.148', 'Y', '2014-06-22 16:31:21.309+08', '2014-06-22 16:31:21.309+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (713, 'fongadmin', '192.168.0.148', 'Y', '2014-06-22 16:37:33.892+08', '2014-06-22 16:37:33.892+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (714, 'fongadmin', '192.168.0.148', 'Y', '2014-06-22 16:37:42.148+08', '2014-06-22 16:37:42.148+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (715, 'supervisor', '192.168.0.152', 'Y', '2014-06-22 16:39:43.017+08', '2014-06-22 16:39:43.017+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (716, 'supervisor', '192.168.0.152', 'Y', '2014-06-22 16:39:49.025+08', '2014-06-22 16:39:49.025+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (717, 'esp', '192.168.0.124', 'Y', '2014-06-22 16:42:43.018+08', '2014-06-22 16:42:43.018+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (718, 'esp', '192.168.0.124', 'Y', '2014-06-22 16:42:48.479+08', '2014-06-22 16:42:48.479+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (719, 'fongadmin', '192.168.0.148', 'N', '2014-06-22 16:45:02.01+08', '2014-06-22 16:45:02.01+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (720, 'fongadmin', '192.168.0.148', 'Y', '2014-06-22 16:45:06.67+08', '2014-06-22 16:45:06.67+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (721, 'fongadmin', '192.168.0.148', 'Y', '2014-06-22 16:45:43.709+08', '2014-06-22 16:45:43.709+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (722, 'uat_cust1', '192.168.0.152', 'Y', '2014-06-22 17:06:05.277+08', '2014-06-22 17:06:05.277+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (723, 'ysyow', '192.168.0.152', 'Y', '2014-06-22 17:06:08.629+08', '2014-06-22 17:06:08.629+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (724, 'uat_supervisor', '192.168.0.124', 'N', '2014-06-22 17:12:36.934+08', '2014-06-22 17:12:36.934+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (725, 'ab', '192.168.0.148', 'N', '2014-06-22 17:15:33.232+08', '2014-06-22 17:15:33.232+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (726, 'ab', '192.168.0.148', 'N', '2014-06-22 17:15:48.113+08', '2014-06-22 17:15:48.113+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (727, 'ab', '192.168.0.148', 'N', '2014-06-22 17:16:13.87+08', '2014-06-22 17:16:13.87+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (728, 'ab', '192.168.0.148', 'N', '2014-06-22 17:16:24.097+08', '2014-06-22 17:16:24.097+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (729, 'ab', '192.168.0.148', 'N', '2014-06-22 17:16:34.973+08', '2014-06-22 17:16:34.973+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (730, 'ab', '192.168.0.148', 'N', '2014-06-22 17:16:47.222+08', '2014-06-22 17:16:47.222+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (731, 'uat_supervisor1', '192.168.0.124', 'Y', '2014-06-22 17:16:53.815+08', '2014-06-22 17:16:53.815+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (732, 'ab', '192.168.0.148', 'N', '2014-06-22 17:16:54.579+08', '2014-06-22 17:16:54.579+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (733, 'ab', '192.168.0.148', 'N', '2014-06-22 17:17:02.512+08', '2014-06-22 17:17:02.512+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (734, 'uat_supervisor1', '192.168.0.124', 'Y', '2014-06-22 17:17:05.521+08', '2014-06-22 17:17:05.521+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (735, 'ab', '192.168.0.148', 'N', '2014-06-22 17:17:18.236+08', '2014-06-22 17:17:18.236+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (736, 'ab', '192.168.0.148', 'N', '2014-06-22 17:18:20.766+08', '2014-06-22 17:18:20.766+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (737, 'uat_customer1', '192.168.0.124', 'Y', '2014-06-22 17:21:21.198+08', '2014-06-22 17:21:21.198+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (738, 'sadsad', '192.168.0.152', 'N', '2014-06-22 17:21:23.276+08', '2014-06-22 17:21:23.276+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (739, 'uat_customer1', '192.168.0.124', 'Y', '2014-06-22 17:21:28.858+08', '2014-06-22 17:21:28.858+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (740, 'ab', '192.168.0.148', 'N', '2014-06-22 17:21:39.172+08', '2014-06-22 17:21:39.172+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (741, 'sadsad', '192.168.0.152', 'N', '2014-06-22 17:28:07.203+08', '2014-06-22 17:28:07.203+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (742, 'sadsad', '192.168.0.152', 'N', '2014-06-22 17:28:13.125+08', '2014-06-22 17:28:13.125+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (743, 'uat_customer1', '192.168.0.124', 'Y', '2014-06-22 17:28:38.835+08', '2014-06-22 17:28:38.835+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (744, 'uat_customer1', '192.168.0.124', 'Y', '2014-06-22 17:28:45.145+08', '2014-06-22 17:28:45.145+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (745, 'uat_customer2', '192.168.0.154', 'N', '2014-06-22 17:53:55.22+08', '2014-06-22 17:53:55.22+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (746, 'uat_customer2', '192.168.0.154', 'N', '2014-06-22 17:54:06.108+08', '2014-06-22 17:54:06.108+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (747, 'customer', '192.168.0.154', 'N', '2014-06-22 17:54:18.346+08', '2014-06-22 17:54:18.346+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (748, 'uat_customer2', '192.168.0.154', 'Y', '2014-06-22 17:54:50.588+08', '2014-06-22 17:54:50.588+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (749, 'uat_customer2', '192.168.0.124', 'Y', '2014-06-22 17:55:14.257+08', '2014-06-22 17:55:14.257+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (750, 'uat_customer2', '192.168.0.154', 'Y', '2014-06-22 17:55:35.421+08', '2014-06-22 17:55:35.421+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (751, 'uat_customer2', '192.168.0.154', 'Y', '2014-06-22 17:55:49.125+08', '2014-06-22 17:55:49.125+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (752, 'uat_customer2', '192.168.0.154', 'Y', '2014-06-22 17:56:05.804+08', '2014-06-22 17:56:05.804+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (753, 'uat_customer2', '192.168.0.154', 'Y', '2014-06-22 17:56:11.85+08', '2014-06-22 17:56:11.85+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (754, 'ysyow', '192.168.0.152', 'Y', '2014-06-22 17:56:34.084+08', '2014-06-22 17:56:34.084+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (755, 'ysyow', '192.168.0.152', 'Y', '2014-06-22 17:56:43.233+08', '2014-06-22 17:56:43.233+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (756, 'ysyow', '192.168.0.152', 'Y', '2014-06-22 17:56:50.099+08', '2014-06-22 17:56:50.099+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (757, 'ysyow', '192.168.0.152', 'N', '2014-06-22 17:58:12.63+08', '2014-06-22 17:58:12.63+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (758, 'ysyow', '192.168.0.152', 'Y', '2014-06-22 17:58:20.321+08', '2014-06-22 17:58:20.321+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (759, 'ysyow', '192.168.0.152', 'Y', '2014-06-22 17:58:56.913+08', '2014-06-22 17:58:56.913+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (760, 'ysyow', '192.168.0.152', 'Y', '2014-06-22 17:59:23.21+08', '2014-06-22 17:59:23.21+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (761, 'ysyow', '192.168.0.152', 'N', '2014-06-22 18:05:46.4+08', '2014-06-22 18:05:46.4+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (762, 'ysyow', '192.168.0.152', 'Y', '2014-06-22 18:05:51.174+08', '2014-06-22 18:05:51.174+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (763, 'uat_supervisor1', '192.168.0.124', 'Y', '2014-06-22 18:07:27.869+08', '2014-06-22 18:07:27.869+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (764, 'esp', '192.168.0.124', 'Y', '2014-06-22 18:15:05.508+08', '2014-06-22 18:15:05.508+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (765, 'uat_customer2', '192.168.0.154', 'Y', '2014-06-22 18:17:38.369+08', '2014-06-22 18:17:38.369+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (766, 'uat_customer1', '192.168.0.124', 'Y', '2014-06-22 18:27:50.268+08', '2014-06-22 18:27:50.268+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (767, 'uat_supervisor1', '192.168.0.124', 'Y', '2014-06-22 18:29:09.417+08', '2014-06-22 18:29:09.417+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (768, 'uat_customer2', '192.168.0.154', 'Y', '2014-06-22 18:31:31.265+08', '2014-06-22 18:31:31.265+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (769, 'uat_customer1', '192.168.0.124', 'Y', '2014-06-22 18:35:38.31+08', '2014-06-22 18:35:38.31+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (770, 'uat_supervisor1', '192.168.0.124', 'N', '2014-06-22 18:38:19.684+08', '2014-06-22 18:38:19.684+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (771, 'uat_supervisor1', '192.168.0.124', 'N', '2014-06-22 18:38:26.421+08', '2014-06-22 18:38:26.421+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (772, 'uat_supervisor1', '192.168.0.124', 'N', '2014-06-22 18:38:36.279+08', '2014-06-22 18:38:36.279+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (773, 'uat_supervisor', '192.168.0.124', 'N', '2014-06-22 18:38:44.97+08', '2014-06-22 18:38:44.97+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (774, 'uat_supervisor1', '192.168.0.124', 'Y', '2014-06-22 18:38:59.479+08', '2014-06-22 18:38:59.479+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (775, 'fongadmin', '192.168.0.148', 'Y', '2014-06-22 18:39:04.171+08', '2014-06-22 18:39:04.171+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (776, 'uat_customer1', '192.168.0.124', 'Y', '2014-06-22 18:40:21.265+08', '2014-06-22 18:40:21.265+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (777, 'uat_supervisor1', '192.168.0.124', 'Y', '2014-06-22 19:11:42.416+08', '2014-06-22 19:11:42.416+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (778, 'uat_customer1', '192.168.0.124', 'N', '2014-06-22 19:18:07.13+08', '2014-06-22 19:18:07.13+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (779, 'uat_customer1', '192.168.0.124', 'Y', '2014-06-22 19:18:14.038+08', '2014-06-22 19:18:14.038+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (780, 'uat_supervisor1', '192.168.0.124', 'N', '2014-06-22 19:20:27.854+08', '2014-06-22 19:20:27.854+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (781, 'uat_customer1', '192.168.0.124', 'Y', '2014-06-22 19:20:33.614+08', '2014-06-22 19:20:33.614+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (782, 'fongadmin', '192.168.0.148', 'N', '2014-06-22 19:29:13.811+08', '2014-06-22 19:29:13.811+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (783, 'fongadmin', '192.168.0.148', 'Y', '2014-06-22 19:29:20.825+08', '2014-06-22 19:29:20.825+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (784, 'uat_customer2', '192.168.0.154', 'Y', '2014-06-22 21:13:25.115+08', '2014-06-22 21:13:25.115+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (785, 'uat_supervisor1', '192.168.0.124', 'Y', '2014-06-22 21:14:19.623+08', '2014-06-22 21:14:19.623+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (786, 'uat_artist1', '192.168.0.124', 'Y', '2014-06-22 21:15:05.208+08', '2014-06-22 21:15:05.208+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (787, 'uat_supervisor2', '192.168.0.154', 'Y', '2014-06-22 21:32:14.144+08', '2014-06-22 21:32:14.144+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (788, 'uat_qc1', '192.168.0.124', 'Y', '2014-06-22 21:34:56.835+08', '2014-06-22 21:34:56.835+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (789, 'uat_customer3', '192.168.0.124', 'N', '2014-06-22 21:59:53.291+08', '2014-06-22 21:59:53.291+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (790, 'uat_customer3', '192.168.0.124', 'Y', '2014-06-22 22:00:33.823+08', '2014-06-22 22:00:33.823+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (791, 'uat_customer2', '192.168.0.154', 'Y', '2014-06-22 22:09:10.863+08', '2014-06-22 22:09:10.863+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (792, 'uat_artist2', '192.168.0.154', 'Y', '2014-06-22 22:13:50.724+08', '2014-06-22 22:13:50.724+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (793, 'uat_qc2', '192.168.0.154', 'Y', '2014-06-22 22:15:13.062+08', '2014-06-22 22:15:13.062+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (794, 'uat_artist2', '192.168.0.154', 'Y', '2014-06-22 22:16:07.003+08', '2014-06-22 22:16:07.003+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (795, 'uat_artist2', '192.168.0.154', 'Y', '2014-06-22 22:22:45.386+08', '2014-06-22 22:22:45.386+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (796, 'supervisor', '::1', 'N', '2014-06-22 22:35:26.144+08', '2014-06-22 22:35:26.144+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (797, 'supervisor', '::1', 'Y', '2014-06-22 22:35:51.297+08', '2014-06-22 22:35:51.297+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (798, 'artist2', '::1', 'N', '2014-06-22 22:37:16.261+08', '2014-06-22 22:37:16.261+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (799, 'artist2', '::1', 'Y', '2014-06-22 22:37:20.689+08', '2014-06-22 22:37:20.689+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (800, 'uat_supervisor2', '192.168.0.154', 'Y', '2014-06-22 22:37:32.432+08', '2014-06-22 22:37:32.432+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (801, 'uat_artist2', '192.168.0.154', 'Y', '2014-06-22 22:38:17.765+08', '2014-06-22 22:38:17.765+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (802, 'uat_supervisor2', '192.168.0.154', 'Y', '2014-06-22 22:38:47.732+08', '2014-06-22 22:38:47.732+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (803, 'uat_artist2', '192.168.0.154', 'Y', '2014-06-22 22:39:56.098+08', '2014-06-22 22:39:56.098+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (804, 'supervisor', '::1', 'Y', '2014-06-22 22:41:17.055+08', '2014-06-22 22:41:17.055+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (805, 'uat_qc2', '192.168.0.154', 'Y', '2014-06-22 22:41:36.378+08', '2014-06-22 22:41:36.378+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (806, 'uat_artist2', '192.168.0.154', 'Y', '2014-06-22 22:43:03.648+08', '2014-06-22 22:43:03.648+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (807, 'uat_supervisor3', '192.168.0.124', 'Y', '2014-06-22 23:00:30.678+08', '2014-06-22 23:00:30.678+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (808, 'uat_artist3', '192.168.0.124', 'Y', '2014-06-22 23:01:13.198+08', '2014-06-22 23:01:13.198+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (809, 'uat_qc3', '192.168.0.124', 'Y', '2014-06-22 23:01:59.677+08', '2014-06-22 23:01:59.677+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (810, 'uat_artist3', '192.168.0.124', 'Y', '2014-06-22 23:02:27.397+08', '2014-06-22 23:02:27.397+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (811, 'uat_artist2', '192.168.0.154', 'Y', '2014-06-22 23:07:27.973+08', '2014-06-22 23:07:27.973+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (812, 'uat_qc2', '192.168.0.154', 'Y', '2014-06-22 23:07:51.189+08', '2014-06-22 23:07:51.189+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (813, 'uat_customer1', '::1', 'Y', '2014-06-23 10:50:18.964+08', '2014-06-23 10:50:18.964+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (814, 'admin', '::1', 'Y', '2014-06-23 12:09:11.478+08', '2014-06-23 12:09:11.478+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (815, 'admin', '::1', 'N', '2014-06-23 13:58:53.528+08', '2014-06-23 13:58:53.528+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (816, 'admin', '::1', 'Y', '2014-06-23 13:58:57.342+08', '2014-06-23 13:58:57.342+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (817, 'admin', '::1', 'Y', '2014-06-23 14:02:42.639+08', '2014-06-23 14:02:42.639+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (818, 'ysyow', '::1', 'Y', '2014-06-24 16:34:32.866+08', '2014-06-24 16:34:32.866+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (819, 'admin', '192.168.0.124', 'N', '2014-06-24 18:01:03.59+08', '2014-06-24 18:01:03.59+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (820, 'admin', '192.168.0.124', 'Y', '2014-06-24 18:01:07.201+08', '2014-06-24 18:01:07.201+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (821, 'admin', '192.168.0.124', 'Y', '2014-06-24 18:26:53.912+08', '2014-06-24 18:26:53.912+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (822, 'uat_customer1', '192.168.0.124', 'Y', '2014-06-24 18:40:58.768+08', '2014-06-24 18:40:58.768+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (823, 'supervisor', '::1', 'Y', '2014-06-24 18:41:24.878+08', '2014-06-24 18:41:24.878+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (824, 'admin', '192.168.0.124', 'Y', '2014-06-24 18:41:43.92+08', '2014-06-24 18:41:43.92+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (825, 'ysyow', '::1', 'Y', '2014-06-24 18:43:00.118+08', '2014-06-24 18:43:00.118+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (826, 'uat_customer1', '192.168.0.124', 'Y', '2014-06-24 18:45:06.128+08', '2014-06-24 18:45:06.128+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (827, 'uat_supervisor1', '192.168.0.124', 'Y', '2014-06-24 18:47:24.417+08', '2014-06-24 18:47:24.417+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (828, 'admin2', '::1', 'Y', '2014-06-24 18:56:20.438+08', '2014-06-24 18:56:20.438+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (829, 'esp', '192.168.0.124', 'Y', '2014-06-24 19:00:10.935+08', '2014-06-24 19:00:10.935+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (830, 'uat_artist1', '192.168.0.124', 'Y', '2014-06-24 19:02:03.663+08', '2014-06-24 19:02:03.663+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (831, 'uat_qc1', '192.168.0.124', 'Y', '2014-06-24 19:02:42.668+08', '2014-06-24 19:02:42.668+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (832, 'uat_customer1', '192.168.0.124', 'Y', '2014-06-24 19:03:24.343+08', '2014-06-24 19:03:24.343+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (833, 'uat_supervisor1', '192.168.0.124', 'Y', '2014-06-24 19:03:42.046+08', '2014-06-24 19:03:42.046+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (834, 'uat_artist1', '192.168.0.124', 'N', '2014-06-24 19:04:06.613+08', '2014-06-24 19:04:06.613+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (835, 'uat_artist1', '192.168.0.124', 'Y', '2014-06-24 19:04:11.898+08', '2014-06-24 19:04:11.898+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (836, 'uat_qc1', '192.168.0.124', 'Y', '2014-06-24 19:04:37.17+08', '2014-06-24 19:04:37.17+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (837, 'uat_customer1', '192.168.0.124', 'Y', '2014-06-24 19:05:53.646+08', '2014-06-24 19:05:53.646+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (838, 'uat_supervisor1', '192.168.0.124', 'Y', '2014-06-24 19:07:04.369+08', '2014-06-24 19:07:04.369+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (839, 'uat_artist1', '192.168.0.124', 'Y', '2014-06-24 19:07:22.506+08', '2014-06-24 19:07:22.506+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (840, 'uat_qc1', '192.168.0.124', 'Y', '2014-06-24 19:07:47.586+08', '2014-06-24 19:07:47.586+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (841, 'admin', '192.168.0.124', 'Y', '2014-06-24 19:09:36.116+08', '2014-06-24 19:09:36.116+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (842, 'admin', '192.168.0.128', 'Y', '2014-06-25 15:30:00.588+08', '2014-06-25 15:30:00.588+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (843, 'admin', '::1', 'Y', '2014-06-25 15:49:25.367+08', '2014-06-25 15:49:25.367+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (844, 'ysyow', '::1', 'Y', '2014-06-25 15:54:39.712+08', '2014-06-25 15:54:39.712+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (845, 'uat_customer4', '192.168.0.124', 'Y', '2014-06-25 17:39:15.19+08', '2014-06-25 17:39:15.19+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (846, 'admin', '192.168.0.124', 'Y', '2014-06-25 17:44:05.359+08', '2014-06-25 17:44:05.359+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (847, 'uat_customer4', '192.168.0.124', 'Y', '2014-06-25 17:44:35.294+08', '2014-06-25 17:44:35.294+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (848, 'ysyow', '192.168.0.128', 'Y', '2014-06-25 18:06:22.929+08', '2014-06-25 18:06:22.929+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (849, 'uat_supervisor4', '192.168.0.124', 'Y', '2014-06-25 18:11:33.252+08', '2014-06-25 18:11:33.252+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (850, 'admin', '192.168.0.124', 'Y', '2014-06-25 18:16:49.201+08', '2014-06-25 18:16:49.201+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (851, 'supervisor', '192.168.0.128', 'Y', '2014-06-25 18:19:06.579+08', '2014-06-25 18:19:06.579+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (852, 'uat_artist4', '192.168.0.124', 'Y', '2014-06-25 18:21:27.287+08', '2014-06-25 18:21:27.287+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (853, 'uat_qc1', '192.168.0.124', 'Y', '2014-06-25 18:25:35.256+08', '2014-06-25 18:25:35.256+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (854, 'uat_customer4', '192.168.0.124', 'Y', '2014-06-25 18:27:49.751+08', '2014-06-25 18:27:49.751+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (855, 'ysyow', '::1', 'Y', '2014-06-25 18:29:31.727+08', '2014-06-25 18:29:31.727+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (856, 'admin', '192.168.0.128', 'Y', '2014-06-25 19:15:41.609+08', '2014-06-25 19:15:41.609+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (857, 'uat_customer4', '192.168.0.124', 'Y', '2014-06-26 10:55:14.119+08', '2014-06-26 10:55:14.119+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (858, 'admin', '192.168.0.124', 'Y', '2014-06-26 11:03:40.312+08', '2014-06-26 11:03:40.312+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (859, 'ysyow', '192.168.0.128', 'Y', '2014-06-26 11:04:00.577+08', '2014-06-26 11:04:00.577+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (860, 'esp', '192.168.0.124', 'Y', '2014-06-26 11:09:49.633+08', '2014-06-26 11:09:49.633+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (861, 'admin2', '192.168.0.124', 'Y', '2014-06-26 11:15:19.569+08', '2014-06-26 11:15:19.569+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (862, 'uat_supervisor2', '192.168.0.124', 'N', '2014-06-26 11:15:55.098+08', '2014-06-26 11:15:55.098+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (863, 'uat_supervisor2', '192.168.0.124', 'Y', '2014-06-26 11:16:01.29+08', '2014-06-26 11:16:01.29+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (864, 'uat_artist4', '192.168.0.124', 'Y', '2014-06-26 11:16:27.865+08', '2014-06-26 11:16:27.865+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (865, 'uat_aritst4', '192.168.0.124', 'N', '2014-06-26 11:45:34.078+08', '2014-06-26 11:45:34.078+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (866, 'uat_artist4', '192.168.0.124', 'Y', '2014-06-26 11:45:43.45+08', '2014-06-26 11:45:43.45+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (867, 'admin2', '::1', 'N', '2014-06-26 11:53:19.01+08', '2014-06-26 11:53:19.01+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (868, 'admin', '192.168.0.124', 'Y', '2014-06-26 12:03:42.463+08', '2014-06-26 12:03:42.463+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (869, 'esp', '192.168.0.124', 'Y', '2014-06-26 12:06:22.464+08', '2014-06-26 12:06:22.464+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (870, 'uat_supervisor', '192.168.0.124', 'N', '2014-06-26 12:26:56.874+08', '2014-06-26 12:26:56.874+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (871, 'uat_supervisor4', '192.168.0.124', 'Y', '2014-06-26 12:27:03.306+08', '2014-06-26 12:27:03.306+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (872, 'esp', '192.168.0.124', 'Y', '2014-06-26 12:29:20.358+08', '2014-06-26 12:29:20.358+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (873, 'uat_customer1', '192.168.0.124', 'Y', '2014-06-26 12:32:50.54+08', '2014-06-26 12:32:50.54+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (874, 'supervisor', '192.168.0.128', 'Y', '2014-06-26 16:27:41.378+08', '2014-06-26 16:27:41.378+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (875, 'ysyow', '::1', 'Y', '2014-06-26 16:28:36.653+08', '2014-06-26 16:28:36.653+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (876, 'artist2', '192.168.0.128', 'Y', '2014-06-26 16:33:28.956+08', '2014-06-26 16:33:28.956+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (877, 'esp', '192.168.0.124', 'Y', '2014-06-26 16:33:37.403+08', '2014-06-26 16:33:37.403+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (878, 'ysyow', '::1', 'Y', '2014-06-26 17:14:36.888+08', '2014-06-26 17:14:36.888+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (879, 'ysyow', '::1', 'N', '2014-06-28 15:04:12.339+08', '2014-06-28 15:04:12.339+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (880, 'ysyow', '::1', 'Y', '2014-06-28 15:04:16.212+08', '2014-06-28 15:04:16.212+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (881, 'supervisor', '::1', 'Y', '2014-06-28 15:12:29.232+08', '2014-06-28 15:12:29.232+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (882, 'ysyow', '192.168.0.152', 'Y', '2014-06-28 15:26:58.995+08', '2014-06-28 15:26:58.995+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (883, 'fongadmin', '192.168.0.148', 'Y', '2014-06-28 15:46:39.195+08', '2014-06-28 15:46:39.195+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (884, 'admin2', '::1', 'Y', '2014-06-28 16:51:17.686+08', '2014-06-28 16:51:17.686+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (885, 'admin', '::1', 'Y', '2014-06-28 18:39:27.601+08', '2014-06-28 18:39:27.601+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (886, 'customer', '::1', 'Y', '2014-06-28 19:41:49.354+08', '2014-06-28 19:41:49.354+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (887, 'customer', '::1', 'Y', '2014-06-28 22:10:50.421+08', '2014-06-28 22:10:50.421+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (888, 'admin', '::1', 'Y', '2014-06-28 22:12:29.469+08', '2014-06-28 22:12:29.469+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (889, 'supervisor', '192.168.0.128', 'N', '2014-06-30 14:43:46.999+08', '2014-06-30 14:43:46.999+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (890, 'supervisor', '192.168.0.128', 'Y', '2014-06-30 14:43:51.814+08', '2014-06-30 14:43:51.814+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (891, 'artist2', '192.168.0.128', 'Y', '2014-06-30 14:46:07.419+08', '2014-06-30 14:46:07.419+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (892, 'admin', '175.140.67.160', 'Y', '2014-06-30 17:40:15.171679+08', '2014-06-30 17:40:15.171679+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (893, 'uat_customer', '203.106.158.254', 'N', '2014-06-30 17:54:31.464295+08', '2014-06-30 17:54:31.464295+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (894, 'uat_customer4', '203.106.158.254', 'Y', '2014-06-30 17:54:44.952621+08', '2014-06-30 17:54:44.952621+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (895, 'uat_artis', '203.106.158.254', 'N', '2014-06-30 20:09:41.058471+08', '2014-06-30 20:09:41.058471+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (896, 'uat_supervisor2', '203.106.158.254', 'Y', '2014-06-30 20:09:57.651314+08', '2014-06-30 20:09:57.651314+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (897, 'uat_customer2', '60.51.119.130', 'Y', '2014-07-01 03:58:44.047823+08', '2014-07-01 03:58:44.047823+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (898, 'uat_customer1', '60.51.119.130', 'Y', '2014-07-01 04:36:39.658623+08', '2014-07-01 04:36:39.658623+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (899, 'uat_customer2', '60.51.119.130', 'Y', '2014-07-01 04:36:59.373908+08', '2014-07-01 04:36:59.373908+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (900, 'uat_customer2', '60.51.119.130', 'Y', '2014-07-01 05:05:22.279089+08', '2014-07-01 05:05:22.279089+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (901, 'uat_customer1', '60.51.119.130', 'Y', '2014-07-01 05:05:44.670023+08', '2014-07-01 05:05:44.670023+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (902, 'uat_supervisor1', '60.51.119.130', 'Y', '2014-07-01 05:23:41.360978+08', '2014-07-01 05:23:41.360978+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (903, 'uat_supervisor2', '60.51.119.130', 'Y', '2014-07-01 05:24:36.04643+08', '2014-07-01 05:24:36.04643+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (904, 'uat_customer2', '60.51.119.130', 'Y', '2014-07-01 05:25:16.938423+08', '2014-07-01 05:25:16.938423+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (905, 'uat_artist1', '60.51.119.130', 'Y', '2014-07-01 05:49:32.702338+08', '2014-07-01 05:49:32.702338+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (906, 'uat_artist2', '60.51.119.130', 'Y', '2014-07-01 05:49:47.242507+08', '2014-07-01 05:49:47.242507+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (907, 'uat_qc1', '60.51.119.130', 'Y', '2014-07-01 06:26:46.051137+08', '2014-07-01 06:26:46.051137+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (908, 'uat_qc2', '60.51.119.130', 'Y', '2014-07-01 06:26:58.873385+08', '2014-07-01 06:26:58.873385+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (909, 'uat_customer1', '60.51.119.130', 'Y', '2014-07-01 06:49:32.112716+08', '2014-07-01 06:49:32.112716+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (910, 'uat_customer1', '60.51.119.130', 'Y', '2014-07-01 06:49:59.86349+08', '2014-07-01 06:49:59.86349+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (911, 'uat_customer2', '60.51.119.130', 'Y', '2014-07-01 06:50:33.642989+08', '2014-07-01 06:50:33.642989+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (912, 'uat_customer1', '175.139.126.176', 'Y', '2014-07-01 07:07:14.899085+08', '2014-07-01 07:07:14.899085+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (913, 'uat_customer2', '175.139.126.176', 'Y', '2014-07-01 07:07:25.841795+08', '2014-07-01 07:07:25.841795+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (914, 'uat_customer4', '175.139.126.176', 'Y', '2014-07-01 07:07:34.117567+08', '2014-07-01 07:07:34.117567+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (915, 'uat_customer1', '203.106.158.254', 'Y', '2014-07-01 10:31:17.909022+08', '2014-07-01 10:31:17.909022+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (916, 'uat_customer1', '203.106.158.254', 'Y', '2014-07-01 10:31:56.536019+08', '2014-07-01 10:31:56.536019+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (917, 'uat_customer2', '203.106.158.254', 'Y', '2014-07-01 10:32:57.620068+08', '2014-07-01 10:32:57.620068+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (918, 'uat_customer1', '203.106.158.254', 'Y', '2014-07-01 10:33:48.860774+08', '2014-07-01 10:33:48.860774+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (919, 'uat_customer1', '203.106.158.254', 'N', '2014-07-01 10:42:58.326562+08', '2014-07-01 10:42:58.326562+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (920, 'uat_customer4', '203.106.158.254', 'Y', '2014-07-01 10:57:09.313652+08', '2014-07-01 10:57:09.313652+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (924, 'admin', '127.0.0.1', 'Y', '2014-07-01 11:19:09.373+08', '2014-07-01 11:19:09.373+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (925, 'uat_supervisor1', '127.0.0.1', 'Y', '2014-07-03 10:12:24.513+08', '2014-07-03 10:12:24.513+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (926, 'admin', '127.0.0.1', 'Y', '2014-07-03 10:18:38.81+08', '2014-07-03 10:18:38.81+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (927, 'esp', '127.0.0.1', 'Y', '2014-07-03 10:19:10.456+08', '2014-07-03 10:19:10.456+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (928, 'esp', '127.0.0.1', 'Y', '2014-07-03 10:22:06.793+08', '2014-07-03 10:22:06.793+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (929, 'admin', '127.0.0.1', 'Y', '2014-07-03 10:41:56.708+08', '2014-07-03 10:41:56.708+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (930, 'uat_artist1', '127.0.0.1', 'Y', '2014-07-03 12:32:42.351+08', '2014-07-03 12:32:42.351+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (931, 'esp', '127.0.0.1', 'Y', '2014-07-03 12:33:24.345+08', '2014-07-03 12:33:24.345+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (932, 'admin', '127.0.0.1', 'Y', '2014-07-03 12:33:34.743+08', '2014-07-03 12:33:34.743+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (933, 'uat_artist1', '127.0.0.1', 'Y', '2014-07-03 12:35:18.276+08', '2014-07-03 12:35:18.276+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (934, 'uat_qc1', '127.0.0.1', 'Y', '2014-07-03 12:41:04.943+08', '2014-07-03 12:41:04.943+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (935, 'uat_customer1', '127.0.0.1', 'Y', '2014-07-03 12:41:34.001+08', '2014-07-03 12:41:34.001+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (936, 'uat_supervisor1', '127.0.0.1', 'Y', '2014-07-03 12:42:25.561+08', '2014-07-03 12:42:25.561+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (937, 'uat_artist1', '127.0.0.1', 'Y', '2014-07-03 12:43:04.632+08', '2014-07-03 12:43:04.632+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (938, 'uat_customer1', '127.0.0.1', 'Y', '2014-07-03 12:43:35.764+08', '2014-07-03 12:43:35.764+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (939, 'uat_supervisor1', '127.0.0.1', 'Y', '2014-07-03 12:44:10.503+08', '2014-07-03 12:44:10.503+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (940, 'uat_artist1', '127.0.0.1', 'Y', '2014-07-03 14:08:06.915+08', '2014-07-03 14:08:06.915+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (941, 'newcust', '127.0.0.1', 'N', '2014-07-03 15:39:12.484+08', '2014-07-03 15:39:12.484+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (942, 'newcust', '127.0.0.1', 'Y', '2014-07-03 15:39:16.862+08', '2014-07-03 15:39:16.862+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (943, 'esp', '127.0.0.1', 'Y', '2014-07-03 15:45:19.133+08', '2014-07-03 15:45:19.133+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (944, 'uat_supervisor', '127.0.0.1', 'N', '2014-07-03 16:46:37.404+08', '2014-07-03 16:46:37.404+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (945, 'uat_supervisor5', '127.0.0.1', 'Y', '2014-07-03 16:46:42.695+08', '2014-07-03 16:46:42.695+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (946, 'esp', '127.0.0.1', 'Y', '2014-07-03 16:53:02.009+08', '2014-07-03 16:53:02.009+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (947, 'uat_supervisor1', '127.0.0.1', 'Y', '2014-07-03 16:53:52.924+08', '2014-07-03 16:53:52.924+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (948, 'uat_customer1', '127.0.0.1', 'Y', '2014-07-03 20:14:24.451+08', '2014-07-03 20:14:24.451+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (949, 'esp', '127.0.0.1', 'Y', '2014-07-03 20:15:19.134+08', '2014-07-03 20:15:19.134+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (950, 'uat_customer1', '127.0.0.1', 'Y', '2014-07-03 21:25:25.187+08', '2014-07-03 21:25:25.187+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (951, 'esp', '127.0.0.1', 'Y', '2014-07-04 11:50:17.261+08', '2014-07-04 11:50:17.261+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (952, 'uat_customer5', '127.0.0.1', 'Y', '2014-07-04 11:52:54.753+08', '2014-07-04 11:52:54.753+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (953, 'esp', '127.0.0.1', 'Y', '2014-07-04 14:02:01.05+08', '2014-07-04 14:02:01.05+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (954, 'esp', '127.0.0.1', 'Y', '2014-07-04 15:30:45.954+08', '2014-07-04 15:30:45.954+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (955, 'uat_supervisor5', '127.0.0.1', 'Y', '2014-07-04 15:35:54.061+08', '2014-07-04 15:35:54.061+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (956, 'esp', '127.0.0.1', 'Y', '2014-07-04 15:36:21.392+08', '2014-07-04 15:36:21.392+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (957, 'esp', '127.0.0.1', 'Y', '2014-07-08 06:27:07.118+08', '2014-07-08 06:27:07.118+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (958, 'esp', '127.0.0.1', 'Y', '2014-07-08 06:30:32.639+08', '2014-07-08 06:30:32.639+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (959, 'uat_customer1', '127.0.0.1', 'Y', '2014-07-08 06:45:24.013+08', '2014-07-08 06:45:24.013+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (960, 'esp', '127.0.0.1', 'Y', '2014-07-08 06:45:32.704+08', '2014-07-08 06:45:32.704+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (961, 'uat_customer1', '127.0.0.1', 'Y', '2014-07-08 06:47:49.082+08', '2014-07-08 06:47:49.082+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (962, 'uat_supervisor1', '127.0.0.1', 'Y', '2014-07-08 06:49:54.21+08', '2014-07-08 06:49:54.21+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (963, 'esp', '127.0.0.1', 'N', '2014-07-08 07:14:56.155+08', '2014-07-08 07:14:56.155+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (964, 'esp', '127.0.0.1', 'Y', '2014-07-08 07:14:59.17+08', '2014-07-08 07:14:59.17+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (965, 'esp', '127.0.0.1', 'Y', '2014-07-08 07:50:29.99+08', '2014-07-08 07:50:29.99+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (966, 'uat_supervisor1', '127.0.0.1', 'Y', '2014-07-08 07:54:47.547+08', '2014-07-08 07:54:47.547+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (967, 'uat_supervisor1', '127.0.0.1', 'N', '2014-07-08 16:48:55.072+08', '2014-07-08 16:48:55.072+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (968, 'uat_supervisor1', '127.0.0.1', 'N', '2014-07-08 16:49:00.553+08', '2014-07-08 16:49:00.553+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (969, 'uat_supervisor1', '127.0.0.1', 'Y', '2014-07-08 16:49:06.639+08', '2014-07-08 16:49:06.639+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (970, 'uat_artist1', '127.0.0.1', 'Y', '2014-07-08 16:49:42.201+08', '2014-07-08 16:49:42.201+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (971, 'esp', '127.0.0.1', 'Y', '2014-07-08 16:16:52.587+08', '2014-07-08 16:16:52.587+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (972, 'ysyow', '::1', 'Y', '2014-07-09 11:26:09.316+08', '2014-07-09 11:26:09.316+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (973, 'supervisor', '192.168.0.128', 'Y', '2014-07-09 11:32:04.51+08', '2014-07-09 11:32:04.51+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (974, 'artist2', '192.168.0.128', 'Y', '2014-07-09 11:32:41.873+08', '2014-07-09 11:32:41.873+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (975, 'supervisor', '::1', 'Y', '2014-07-09 11:33:35.4+08', '2014-07-09 11:33:35.4+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (976, 'artist1', '192.168.0.128', 'Y', '2014-07-09 11:58:38.095+08', '2014-07-09 11:58:38.095+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (977, 'ysyow', '::1', 'Y', '2014-07-09 15:13:54.154+08', '2014-07-09 15:13:54.154+08', NULL, 'N', NULL);
INSERT INTO fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) VALUES (978, 'supervisor', '::1', 'Y', '2014-07-09 15:14:55.016+08', '2014-07-09 15:14:55.016+08', NULL, 'N', NULL);


--
-- TOC entry 3442 (class 0 OID 0)
-- Dependencies: 473
-- Name: fcuserlogin_ul_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcuserlogin_ul_id_seq', 978, true);


--
-- TOC entry 3294 (class 0 OID 51798)
-- Dependencies: 474
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
INSERT INTO fcuserorgrole (uor_id, uor_usrid, uor_orgid, uor_rolid, uor_seq) VALUES (40, 'artist1', 1, 20, 1);
INSERT INTO fcuserorgrole (uor_id, uor_usrid, uor_orgid, uor_rolid, uor_seq) VALUES (41, 'artist2', 1, 20, 1);
INSERT INTO fcuserorgrole (uor_id, uor_usrid, uor_orgid, uor_rolid, uor_seq) VALUES (50, 'Test', 1, 20, 1);
INSERT INTO fcuserorgrole (uor_id, uor_usrid, uor_orgid, uor_rolid, uor_seq) VALUES (51, 'uat_supervisor1', 1, 19, 1);
INSERT INTO fcuserorgrole (uor_id, uor_usrid, uor_orgid, uor_rolid, uor_seq) VALUES (52, 'uat_artist1', 1, 20, 1);
INSERT INTO fcuserorgrole (uor_id, uor_usrid, uor_orgid, uor_rolid, uor_seq) VALUES (53, 'uat_manager1', 1, 23, 1);
INSERT INTO fcuserorgrole (uor_id, uor_usrid, uor_orgid, uor_rolid, uor_seq) VALUES (54, 'uat_cust1', 9, 14, 1);
INSERT INTO fcuserorgrole (uor_id, uor_usrid, uor_orgid, uor_rolid, uor_seq) VALUES (57, 'ysyow', 1, 10, 1);
INSERT INTO fcuserorgrole (uor_id, uor_usrid, uor_orgid, uor_rolid, uor_seq) VALUES (55, 'esp', 1, 10, 1);
INSERT INTO fcuserorgrole (uor_id, uor_usrid, uor_orgid, uor_rolid, uor_seq) VALUES (58, 'fongartist', 1, 20, 1);
INSERT INTO fcuserorgrole (uor_id, uor_usrid, uor_orgid, uor_rolid, uor_seq) VALUES (59, 'fongadmin', 1, 10, 1);
INSERT INTO fcuserorgrole (uor_id, uor_usrid, uor_orgid, uor_rolid, uor_seq) VALUES (60, 'fongcustomer', 10, 14, 1);
INSERT INTO fcuserorgrole (uor_id, uor_usrid, uor_orgid, uor_rolid, uor_seq) VALUES (61, 'esp_supervisor', 1, 19, 1);
INSERT INTO fcuserorgrole (uor_id, uor_usrid, uor_orgid, uor_rolid, uor_seq) VALUES (62, 'fongsupervisor', 1, 19, 1);
INSERT INTO fcuserorgrole (uor_id, uor_usrid, uor_orgid, uor_rolid, uor_seq) VALUES (65, 'esp_artist', 1, 20, 1);
INSERT INTO fcuserorgrole (uor_id, uor_usrid, uor_orgid, uor_rolid, uor_seq) VALUES (68, 'uat_customer1', 9, 14, 1);
INSERT INTO fcuserorgrole (uor_id, uor_usrid, uor_orgid, uor_rolid, uor_seq) VALUES (75, 'uat_supervisor2', 1, 19, 1);
INSERT INTO fcuserorgrole (uor_id, uor_usrid, uor_orgid, uor_rolid, uor_seq) VALUES (76, 'uat_supervisor3', 1, 19, 1);
INSERT INTO fcuserorgrole (uor_id, uor_usrid, uor_orgid, uor_rolid, uor_seq) VALUES (77, 'uat_supervisor4', 1, 19, 1);
INSERT INTO fcuserorgrole (uor_id, uor_usrid, uor_orgid, uor_rolid, uor_seq) VALUES (78, 'uat_supervisor5', 1, 19, 1);
INSERT INTO fcuserorgrole (uor_id, uor_usrid, uor_orgid, uor_rolid, uor_seq) VALUES (79, 'uat_artist2', 1, 20, 1);
INSERT INTO fcuserorgrole (uor_id, uor_usrid, uor_orgid, uor_rolid, uor_seq) VALUES (80, 'uat_artist3', 1, 20, 1);
INSERT INTO fcuserorgrole (uor_id, uor_usrid, uor_orgid, uor_rolid, uor_seq) VALUES (81, 'uat_artist4', 1, 20, 1);
INSERT INTO fcuserorgrole (uor_id, uor_usrid, uor_orgid, uor_rolid, uor_seq) VALUES (82, 'uat_artist5', 1, 20, 1);
INSERT INTO fcuserorgrole (uor_id, uor_usrid, uor_orgid, uor_rolid, uor_seq) VALUES (83, 'uat_qc1', 1, 18, 1);
INSERT INTO fcuserorgrole (uor_id, uor_usrid, uor_orgid, uor_rolid, uor_seq) VALUES (84, 'uat_qc2', 1, 18, 1);
INSERT INTO fcuserorgrole (uor_id, uor_usrid, uor_orgid, uor_rolid, uor_seq) VALUES (85, 'uat_qc3', 1, 18, 1);
INSERT INTO fcuserorgrole (uor_id, uor_usrid, uor_orgid, uor_rolid, uor_seq) VALUES (86, 'uat_qc4', 1, 18, 1);
INSERT INTO fcuserorgrole (uor_id, uor_usrid, uor_orgid, uor_rolid, uor_seq) VALUES (87, 'uat_qc5', 1, 18, 1);
INSERT INTO fcuserorgrole (uor_id, uor_usrid, uor_orgid, uor_rolid, uor_seq) VALUES (88, 'uat_manager2', 1, 23, 1);
INSERT INTO fcuserorgrole (uor_id, uor_usrid, uor_orgid, uor_rolid, uor_seq) VALUES (89, 'uat_manager3', 1, 23, 1);
INSERT INTO fcuserorgrole (uor_id, uor_usrid, uor_orgid, uor_rolid, uor_seq) VALUES (90, 'uat_manager4', 1, 23, 1);
INSERT INTO fcuserorgrole (uor_id, uor_usrid, uor_orgid, uor_rolid, uor_seq) VALUES (91, 'uat_manager5', 1, 23, 1);
INSERT INTO fcuserorgrole (uor_id, uor_usrid, uor_orgid, uor_rolid, uor_seq) VALUES (92, 'uat_customer2', 11, 14, 1);
INSERT INTO fcuserorgrole (uor_id, uor_usrid, uor_orgid, uor_rolid, uor_seq) VALUES (93, 'uat_customer3', 12, 14, 1);
INSERT INTO fcuserorgrole (uor_id, uor_usrid, uor_orgid, uor_rolid, uor_seq) VALUES (94, 'uat_customer4', 13, 14, 1);
INSERT INTO fcuserorgrole (uor_id, uor_usrid, uor_orgid, uor_rolid, uor_seq) VALUES (95, 'uat_customer5', 14, 14, 1);
INSERT INTO fcuserorgrole (uor_id, uor_usrid, uor_orgid, uor_rolid, uor_seq) VALUES (96, 'newcust', 15, 14, 1);


--
-- TOC entry 3443 (class 0 OID 0)
-- Dependencies: 475
-- Name: fcuserorgrole_uor_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcuserorgrole_uor_id_seq', 96, true);


--
-- TOC entry 3296 (class 0 OID 51803)
-- Dependencies: 476
-- Data for Name: fcusersession; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fcusersession (us_id, us_sessid, us_userid, us_ip, us_active, us_created, us_last_active, us_forcecloseby) VALUES (408, '1kkbhl72fl7lktmld4p5d10os0', 'ironman@gmail.com', '127.0.0.1', 'Y', '2014-02-17 15:31:34.882+08', '2014-02-17 15:31:34+08', NULL);
INSERT INTO fcusersession (us_id, us_sessid, us_userid, us_ip, us_active, us_created, us_last_active, us_forcecloseby) VALUES (724, '9kvhl5niddlkdtguhgulocqd52', 'uat_artist3', '192.168.0.124', 'Y', '2014-06-22 23:02:27.408+08', '2014-06-22 23:02:27+08', NULL);
INSERT INTO fcusersession (us_id, us_sessid, us_userid, us_ip, us_active, us_created, us_last_active, us_forcecloseby) VALUES (789, 'mkdspgfc7pfcja7bg4bd74eki4', 'fongadmin', '192.168.0.148', 'Y', '2014-06-28 15:46:39.263+08', '2014-06-28 15:46:39+08', NULL);
INSERT INTO fcusersession (us_id, us_sessid, us_userid, us_ip, us_active, us_created, us_last_active, us_forcecloseby) VALUES (790, 'd3k0qeq69b90rv24lbhc3umsg1', 'admin2', '::1', 'Y', '2014-06-28 16:51:17.696+08', '2014-06-28 16:51:17+08', NULL);
INSERT INTO fcusersession (us_id, us_sessid, us_userid, us_ip, us_active, us_created, us_last_active, us_forcecloseby) VALUES (546, 'niamb5anjmlro4064p35o08ik6', 'fongsupervisor', '192.168.0.148', 'Y', '2014-06-21 21:52:33.397+08', '2014-06-21 21:52:33+08', NULL);
INSERT INTO fcusersession (us_id, us_sessid, us_userid, us_ip, us_active, us_created, us_last_active, us_forcecloseby) VALUES (822, 'mclranlibq8n29dcqous479j13', 'uat_customer4', '203.106.158.254', 'Y', '2014-07-01 10:57:09.3224+08', '2014-07-01 22:57:09+08', NULL);
INSERT INTO fcusersession (us_id, us_sessid, us_userid, us_ip, us_active, us_created, us_last_active, us_forcecloseby) VALUES (866, 'hq1fe2cc46153niigrou5j1hi1', 'esp', '127.0.0.1', 'Y', '2014-07-08 16:16:52.705+08', '2014-07-08 16:16:52+08', NULL);
INSERT INTO fcusersession (us_id, us_sessid, us_userid, us_ip, us_active, us_created, us_last_active, us_forcecloseby) VALUES (871, 'v2ekh5la55i8voeb4ufut56ak5', 'artist1', '192.168.0.128', 'Y', '2014-07-09 11:58:38.14+08', '2014-07-09 11:58:38+08', NULL);
INSERT INTO fcusersession (us_id, us_sessid, us_userid, us_ip, us_active, us_created, us_last_active, us_forcecloseby) VALUES (872, 'hlu2ec0qnccputflmp2u5ggcd6', 'ysyow', '::1', 'Y', '2014-07-09 15:13:54.583+08', '2014-07-09 15:13:54+08', NULL);
INSERT INTO fcusersession (us_id, us_sessid, us_userid, us_ip, us_active, us_created, us_last_active, us_forcecloseby) VALUES (873, '6reopr88e7iofnsf5ccn47hd91', 'supervisor', '::1', 'Y', '2014-07-09 15:14:55.026+08', '2014-07-09 15:14:55+08', NULL);


--
-- TOC entry 3444 (class 0 OID 0)
-- Dependencies: 477
-- Name: fcusersession_us_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcusersession_us_id_seq', 873, true);


--
-- TOC entry 3298 (class 0 OID 51811)
-- Dependencies: 478
-- Data for Name: martistskill; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO martistskill (ma_id, ma_usruserid, ma_jclid) VALUES (1, 'artist1', 5);
INSERT INTO martistskill (ma_id, ma_usruserid, ma_jclid) VALUES (2, 'artist1', 6);
INSERT INTO martistskill (ma_id, ma_usruserid, ma_jclid) VALUES (3, 'artist2', 5);
INSERT INTO martistskill (ma_id, ma_usruserid, ma_jclid) VALUES (4, 'artist1', 2);
INSERT INTO martistskill (ma_id, ma_usruserid, ma_jclid) VALUES (5, 'artist1', 7);
INSERT INTO martistskill (ma_id, ma_usruserid, ma_jclid) VALUES (6, 'Test', 5);
INSERT INTO martistskill (ma_id, ma_usruserid, ma_jclid) VALUES (7, 'Test', 6);
INSERT INTO martistskill (ma_id, ma_usruserid, ma_jclid) VALUES (8, 'Test', 2);
INSERT INTO martistskill (ma_id, ma_usruserid, ma_jclid) VALUES (9, 'Test2', 5);
INSERT INTO martistskill (ma_id, ma_usruserid, ma_jclid) VALUES (10, 'Test2', 6);
INSERT INTO martistskill (ma_id, ma_usruserid, ma_jclid) VALUES (11, 'Test2', 2);
INSERT INTO martistskill (ma_id, ma_usruserid, ma_jclid) VALUES (12, 'fongartist', 5);
INSERT INTO martistskill (ma_id, ma_usruserid, ma_jclid) VALUES (13, 'fongartist', 6);
INSERT INTO martistskill (ma_id, ma_usruserid, ma_jclid) VALUES (14, 'fongartist', 2);
INSERT INTO martistskill (ma_id, ma_usruserid, ma_jclid) VALUES (15, 'fongartist', 7);
INSERT INTO martistskill (ma_id, ma_usruserid, ma_jclid) VALUES (16, 'fongartist', 8);
INSERT INTO martistskill (ma_id, ma_usruserid, ma_jclid) VALUES (17, 'fongartist', 3);
INSERT INTO martistskill (ma_id, ma_usruserid, ma_jclid) VALUES (18, 'fongartist', 4);
INSERT INTO martistskill (ma_id, ma_usruserid, ma_jclid) VALUES (19, 'fongartist', 1);
INSERT INTO martistskill (ma_id, ma_usruserid, ma_jclid) VALUES (20, 'esp_artist', 5);
INSERT INTO martistskill (ma_id, ma_usruserid, ma_jclid) VALUES (21, 'esp_artist', 6);
INSERT INTO martistskill (ma_id, ma_usruserid, ma_jclid) VALUES (22, 'esp_artist', 2);
INSERT INTO martistskill (ma_id, ma_usruserid, ma_jclid) VALUES (23, 'uat_artist2', 5);
INSERT INTO martistskill (ma_id, ma_usruserid, ma_jclid) VALUES (24, 'uat_artist2', 6);
INSERT INTO martistskill (ma_id, ma_usruserid, ma_jclid) VALUES (25, 'uat_artist2', 2);
INSERT INTO martistskill (ma_id, ma_usruserid, ma_jclid) VALUES (26, 'uat_artist3', 5);
INSERT INTO martistskill (ma_id, ma_usruserid, ma_jclid) VALUES (27, 'uat_artist3', 7);
INSERT INTO martistskill (ma_id, ma_usruserid, ma_jclid) VALUES (28, 'uat_artist3', 8);
INSERT INTO martistskill (ma_id, ma_usruserid, ma_jclid) VALUES (29, 'uat_artist4', 6);
INSERT INTO martistskill (ma_id, ma_usruserid, ma_jclid) VALUES (30, 'uat_artist4', 2);
INSERT INTO martistskill (ma_id, ma_usruserid, ma_jclid) VALUES (31, 'uat_artist4', 7);
INSERT INTO martistskill (ma_id, ma_usruserid, ma_jclid) VALUES (32, 'uat_artist5', 5);
INSERT INTO martistskill (ma_id, ma_usruserid, ma_jclid) VALUES (33, 'uat_artist5', 6);
INSERT INTO martistskill (ma_id, ma_usruserid, ma_jclid) VALUES (34, 'uat_artist5', 2);


--
-- TOC entry 3445 (class 0 OID 0)
-- Dependencies: 479
-- Name: martistskill_ma_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('martistskill_ma_id_seq', 34, true);


--
-- TOC entry 3300 (class 0 OID 51816)
-- Dependencies: 480
-- Data for Name: mbarcodetype; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO mbarcodetype (bt_code, bt_name, bt_format) VALUES ('CODEBAR', 'CodeBar', '9999999999999999999999999999');
INSERT INTO mbarcodetype (bt_code, bt_name, bt_format) VALUES ('CODE128', 'Code128', '99999999999999999999999999999999999999999999999999999999999999999');
INSERT INTO mbarcodetype (bt_code, bt_name, bt_format) VALUES ('ISBN', 'ISBN', '999999999');
INSERT INTO mbarcodetype (bt_code, bt_name, bt_format) VALUES ('CODE25', 'Code25', '99999999999999999999999999999');
INSERT INTO mbarcodetype (bt_code, bt_name, bt_format) VALUES ('EAN8', 'EAN-8', '9999999');
INSERT INTO mbarcodetype (bt_code, bt_name, bt_format) VALUES ('ITF', 'ITF', '99999999999999999999999999999999999999');
INSERT INTO mbarcodetype (bt_code, bt_name, bt_format) VALUES ('JAN13', 'Jan-13', '9999999999');
INSERT INTO mbarcodetype (bt_code, bt_name, bt_format) VALUES ('UPCA', 'UPC(A)', '9999999999');
INSERT INTO mbarcodetype (bt_code, bt_name, bt_format) VALUES ('CODE39', 'Code-39', '*****************************');
INSERT INTO mbarcodetype (bt_code, bt_name, bt_format) VALUES ('EAN13', 'EAN-13', '99999999999');
INSERT INTO mbarcodetype (bt_code, bt_name, bt_format) VALUES ('ITF14', 'ITF-14', '99999999999');
INSERT INTO mbarcodetype (bt_code, bt_name, bt_format) VALUES ('JAN8', 'Jan-8', '9999999');
INSERT INTO mbarcodetype (bt_code, bt_name, bt_format) VALUES ('UPCE', 'UPC(E)', '999999');


--
-- TOC entry 3301 (class 0 OID 51819)
-- Dependencies: 481
-- Data for Name: mcarton; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO mcarton (car_id, car_name, car_status) VALUES (38, 'Five panel', 'ACTIVE');
INSERT INTO mcarton (car_id, car_name, car_status) VALUES (39, 'HSC', 'ACTIVE');
INSERT INTO mcarton (car_id, car_name, car_status) VALUES (40, 'OSC 2', 'ACTIVE');
INSERT INTO mcarton (car_id, car_name, car_status) VALUES (41, 'New carton', 'ACTIVE');


--
-- TOC entry 3446 (class 0 OID 0)
-- Dependencies: 482
-- Name: mcarton_car_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('mcarton_car_id_seq', 42, true);


--
-- TOC entry 3303 (class 0 OID 51825)
-- Dependencies: 483
-- Data for Name: mcartonvariable; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO mcartonvariable (carv_code, carv_unit, carv_carid) VALUES ('x.1', 'mm', 38);
INSERT INTO mcartonvariable (carv_code, carv_unit, carv_carid) VALUES ('x.2', 'mm', 38);
INSERT INTO mcartonvariable (carv_code, carv_unit, carv_carid) VALUES ('x.3', 'mm', 38);
INSERT INTO mcartonvariable (carv_code, carv_unit, carv_carid) VALUES ('x.4', 'mm', 38);
INSERT INTO mcartonvariable (carv_code, carv_unit, carv_carid) VALUES ('x.5', 'mm', 38);
INSERT INTO mcartonvariable (carv_code, carv_unit, carv_carid) VALUES ('y.1', 'mm', 38);
INSERT INTO mcartonvariable (carv_code, carv_unit, carv_carid) VALUES ('y.2', 'mm', 38);
INSERT INTO mcartonvariable (carv_code, carv_unit, carv_carid) VALUES ('y.3', 'mm', 38);
INSERT INTO mcartonvariable (carv_code, carv_unit, carv_carid) VALUES ('x.E', 'mm', 39);
INSERT INTO mcartonvariable (carv_code, carv_unit, carv_carid) VALUES ('x.L1', 'mm', 39);
INSERT INTO mcartonvariable (carv_code, carv_unit, carv_carid) VALUES ('x.W1', 'mm', 39);
INSERT INTO mcartonvariable (carv_code, carv_unit, carv_carid) VALUES ('x.L2', 'mm', 39);
INSERT INTO mcartonvariable (carv_code, carv_unit, carv_carid) VALUES ('x.W2', 'mm', 39);
INSERT INTO mcartonvariable (carv_code, carv_unit, carv_carid) VALUES ('y.T', 'mm', 39);
INSERT INTO mcartonvariable (carv_code, carv_unit, carv_carid) VALUES ('y.H', 'mm', 39);
INSERT INTO mcartonvariable (carv_code, carv_unit, carv_carid) VALUES ('y.B', 'mm', 39);
INSERT INTO mcartonvariable (carv_code, carv_unit, carv_carid) VALUES ('x.1', 'mm', 40);
INSERT INTO mcartonvariable (carv_code, carv_unit, carv_carid) VALUES ('x.2', 'mm', 40);
INSERT INTO mcartonvariable (carv_code, carv_unit, carv_carid) VALUES ('x.3', 'mm', 40);
INSERT INTO mcartonvariable (carv_code, carv_unit, carv_carid) VALUES ('x.4', 'mm', 40);
INSERT INTO mcartonvariable (carv_code, carv_unit, carv_carid) VALUES ('x.5', 'mm', 40);
INSERT INTO mcartonvariable (carv_code, carv_unit, carv_carid) VALUES ('y.1', 'mm', 40);
INSERT INTO mcartonvariable (carv_code, carv_unit, carv_carid) VALUES ('y.2', 'mm', 40);
INSERT INTO mcartonvariable (carv_code, carv_unit, carv_carid) VALUES ('y.3', 'mm', 40);
INSERT INTO mcartonvariable (carv_code, carv_unit, carv_carid) VALUES ('x1', 'mm', 41);
INSERT INTO mcartonvariable (carv_code, carv_unit, carv_carid) VALUES ('x2', 'mm', 41);
INSERT INTO mcartonvariable (carv_code, carv_unit, carv_carid) VALUES ('x3', 'mm', 41);
INSERT INTO mcartonvariable (carv_code, carv_unit, carv_carid) VALUES ('y1', 'mm', 41);


--
-- TOC entry 3304 (class 0 OID 51828)
-- Dependencies: 484
-- Data for Name: mcmanilox; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO mcmanilox (ma_id, ma_mcid, ma_num, ma_type, ma_value) VALUES (1, 1, 1, 'CEWDB', '12');
INSERT INTO mcmanilox (ma_id, ma_mcid, ma_num, ma_type, ma_value) VALUES (2, 1, 2, 'CEWDB', '15');
INSERT INTO mcmanilox (ma_id, ma_mcid, ma_num, ma_type, ma_value) VALUES (3, 1, 3, 'CEWDB', '14');


--
-- TOC entry 3447 (class 0 OID 0)
-- Dependencies: 485
-- Name: mcmanilox_ma_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('mcmanilox_ma_id_seq', 3, true);


--
-- TOC entry 3306 (class 0 OID 51833)
-- Dependencies: 486
-- Data for Name: mcmcylplate; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO mcmcylplate (mcp_id, mcp_mcid, mcp_num, mcp_value) VALUES (1, 1, 1, '12');
INSERT INTO mcmcylplate (mcp_id, mcp_mcid, mcp_num, mcp_value) VALUES (2, 1, 2, '12');
INSERT INTO mcmcylplate (mcp_id, mcp_mcid, mcp_num, mcp_value) VALUES (3, 1, 3, '1');


--
-- TOC entry 3448 (class 0 OID 0)
-- Dependencies: 487
-- Name: mcmcylplate_mcp_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('mcmcylplate_mcp_id_seq', 3, true);


--
-- TOC entry 3308 (class 0 OID 51838)
-- Dependencies: 488
-- Data for Name: mcmcylrepeat; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO mcmcylrepeat (mcr_id, mcr_mcid, mcr_num, mcr_value) VALUES (1, 1, 1, '1');
INSERT INTO mcmcylrepeat (mcr_id, mcr_mcid, mcr_num, mcr_value) VALUES (2, 1, 2, '2');
INSERT INTO mcmcylrepeat (mcr_id, mcr_mcid, mcr_num, mcr_value) VALUES (3, 1, 3, '1');


--
-- TOC entry 3449 (class 0 OID 0)
-- Dependencies: 489
-- Name: mcmcylrepeat_mcr_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('mcmcylrepeat_mcr_id_seq', 3, true);


--
-- TOC entry 3310 (class 0 OID 51843)
-- Dependencies: 490
-- Data for Name: mcmcylsubstrate; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO mcmcylsubstrate (mcs_id, mcs_mcid, mcs_num, mcs_value) VALUES (1, 1, 1, '1');
INSERT INTO mcmcylsubstrate (mcs_id, mcs_mcid, mcs_num, mcs_value) VALUES (2, 1, 2, '2');
INSERT INTO mcmcylsubstrate (mcs_id, mcs_mcid, mcs_num, mcs_value) VALUES (3, 1, 3, '1');


--
-- TOC entry 3450 (class 0 OID 0)
-- Dependencies: 491
-- Name: mcmcylsubstrate_mcs_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('mcmcylsubstrate_mcs_id_seq', 3, true);


--
-- TOC entry 3312 (class 0 OID 51848)
-- Dependencies: 492
-- Data for Name: mcmline; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO mcmline (ml_id, ml_mcid, ml_num, ml_value) VALUES (1, 1, 1, '1');
INSERT INTO mcmline (ml_id, ml_mcid, ml_num, ml_value) VALUES (2, 1, 2, '2');
INSERT INTO mcmline (ml_id, ml_mcid, ml_num, ml_value) VALUES (3, 1, 3, '1');


--
-- TOC entry 3451 (class 0 OID 0)
-- Dependencies: 493
-- Name: mcmline_ml_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('mcmline_ml_id_seq', 3, true);


--
-- TOC entry 3314 (class 0 OID 51853)
-- Dependencies: 494
-- Data for Name: mcustmachine; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO mcustmachine (mc_id, mc_orgid, mc_name, mc_type, mc_colorslot, mc_width, mc_density, mc_visosity) VALUES (1, 9, 'Printer 1', 'FLEXO', 3, '12', '11', '22');


--
-- TOC entry 3452 (class 0 OID 0)
-- Dependencies: 496
-- Name: mcustmachine_mc_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('mcustmachine_mc_id_seq', 4, true);


--
-- TOC entry 3453 (class 0 OID 0)
-- Dependencies: 497
-- Name: mcustmachine_mc_id_seq1; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('mcustmachine_mc_id_seq1', 1, true);


--
-- TOC entry 3315 (class 0 OID 51856)
-- Dependencies: 495
-- Data for Name: mcustmachine_old; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO mcustmachine_old (mc_id, mc_orgid, mc_pressmanufacturer, mc_pressyearbuilt, mc_pressmodel, mc_presswidth, mc_presstype, mc_pressspeed, mc_presscylinderrepeat, mc_inkmanufacturer, mc_inkcommercialname, mc_inktype, mc_inktypeother, mc_inkviscosity, mc_inkvicosityother, mc_inkprintingunit_1, mc_inkprintingunit_2, mc_inkprintingunit_3, mc_inkprintingunit_4, mc_inkprintingunit_5, mc_inkvisocity_1, mc_inkvisocity_2, mc_inkvisocity_3, mc_inkvisocity_4, mc_inkvisocity_5, mc_inkph_1, mc_inkph_2, mc_inkph_3, mc_inkph_4, mc_inkph_5, mc_inkdensity_1, mc_inkdensity_2, mc_inkdensity_3, mc_inkdensity_4, mc_inkdensity_5, mc_platemanufacturer, mc_platecommercialname, mc_platetype, mc_platedurometer, mc_platethickness, mc_platerelief, mc_mountingtapemanufacturer, mc_mountingtapename, mc_mountingtapedensity, mc_mountingtapthickness, mc_mountingcarrierthickness, mc_mountingcushionmanufacturer, mc_mountingcushonname, mc_mountingdensity, mc_mountingcushionthickness, mc_cimplevel_1, mc_cimplevel_2, mc_cimplevel_3, mc_cimplevel_4, mc_cimplevel_5, mc_cimpsubstrate_1, mc_cimpsubstrate_2, mc_cimpsubstrate_3, mc_cimpsubstrate_4, mc_cimpsubstrate_5, mc_cimpanlox_1, mc_cimpanlox_2, mc_cimpanlox_3, mc_cimpanlox_4, mc_cimpanlox_5, mc_aniloxmanufacturer, mc_aniloxtype, mc_aniloxengravingangle, mc_aniloxinking, mc_aniloxprintingunit_1, mc_aniloxprintingunit_2, mc_aniloxprintingunit_3, mc_aniloxprintingunit_4, mc_aniloxprintingunit_5, mc_aniloxmanufacturer_1, mc_aniloxmanufacturer_2, mc_aniloxmanufacturer_3, mc_aniloxmanufacturer_4, mc_aniloxmanufacturer_5, mc_aniloxtype_1, mc_aniloxtype_2, mc_aniloxtype_3, mc_aniloxtype_4, mc_aniloxtype_5, mc_aniloxengravingangle_1, mc_aniloxengravingangle_2, mc_aniloxengravingangle_3, mc_aniloxengravingangle_4, mc_aniloxengravingangle_5, mc_aniloxinking_1, mc_aniloxinking_2, mc_aniloxinking_3, mc_aniloxinking_4, mc_aniloxinking_5, mc_aniloxcellcount_1, mc_aniloxcellcount_2, mc_aniloxcellcount_3, mc_aniloxcellcount_4, mc_aniloxcellcount_5, mc_aniloxvolumn_1, mc_aniloxvolumn_2, mc_aniloxvolumn_3, mc_aniloxvolumn_4, mc_aniloxvolumn_5, mc_aniloxdoration_1, mc_aniloxdoration_2, mc_aniloxdoration_3, mc_aniloxdoration_4, mc_aniloxdoration_5, mc_aniloxdoctoring_1, mc_aniloxdoctoring_2, mc_aniloxdoctoring_3, mc_aniloxdoctoring_4, mc_aniloxdoctoring_5, mc_aniloxcontainment_1, mc_aniloxcontainment_2, mc_aniloxcontainment_3, mc_aniloxcontainment_4, mc_aniloxcontainment_5, mc_substratemanufacturer, mc_substratename, mc_substratetype, mc_substratedyna, mc_substrateweight, mc_substrateflute, mc_substratethickness, mc_printer_name) VALUES (1, 2, 'Facture1', '1958', 'Model 1', '1230', 'Stack', '100', '1000', 'Ink manufacturer', 'Ink manufacturer commercial name', 'Water Based', '1234', 'Auto', '1233', 'Ink Printing Unit 1', 'Ink PU2', 'Ink PU3', 'Ink PU4', 'Ink PU5', 'Ink Vis1', 'Ink Vis2', 'Ink Vis3', 'Ink Vis4', 'Ink Vis5', 'Ink ph1', 'Ink ph2', 'Ink ph3', 'Ink ph4', 'Ink ph5', 'Ink des1', 'Ink des2', 'Ink des3', 'Ink des4', 'Ink des5', 'Plate manufacturer', 'plate commercial name', 'Solid, Liquid', 'plate durometer', '123', '123', 'Mounting manufacturer', 'Mounting manufacturer comercial name', 'Mountting Density', '11', '22', 'Mounting carrier manufacturer', 'Mounting carrier manufacturer commercial name', 'Mounting carrier manufacturer density', '123', 'CI imp lvl 1', 'CI imp lvl 2', 'CI imp lvl 3', 'CI imp lvl 4', 'CI imp lvl 5', '11', '22', '33', '44', '55', '123', '123', '123', '123', '13', 'Doctor manufacturer', 'Laser Engraved Ceramic', 'N', 'N', '1', '2', '3', '4', '5', '1', '2', '3', '4', '5', '11', '2', '3', '4', '5', '1', '2', '3', '4', '5', '1', '2', '5', '3', '4', '1', '2', '3', '4', '5', '1', '2', '3', '4', '5', '1', '2', '3', '4', '5', '1', '2', '3', '4', '5', '1', '2', '3', '4', '5', 'Subrate manufacturer', 'Subrate manufacturer 11', 'Film', '2', '2', '11', '11', 'Printer ABC');
INSERT INTO mcustmachine_old (mc_id, mc_orgid, mc_pressmanufacturer, mc_pressyearbuilt, mc_pressmodel, mc_presswidth, mc_presstype, mc_pressspeed, mc_presscylinderrepeat, mc_inkmanufacturer, mc_inkcommercialname, mc_inktype, mc_inktypeother, mc_inkviscosity, mc_inkvicosityother, mc_inkprintingunit_1, mc_inkprintingunit_2, mc_inkprintingunit_3, mc_inkprintingunit_4, mc_inkprintingunit_5, mc_inkvisocity_1, mc_inkvisocity_2, mc_inkvisocity_3, mc_inkvisocity_4, mc_inkvisocity_5, mc_inkph_1, mc_inkph_2, mc_inkph_3, mc_inkph_4, mc_inkph_5, mc_inkdensity_1, mc_inkdensity_2, mc_inkdensity_3, mc_inkdensity_4, mc_inkdensity_5, mc_platemanufacturer, mc_platecommercialname, mc_platetype, mc_platedurometer, mc_platethickness, mc_platerelief, mc_mountingtapemanufacturer, mc_mountingtapename, mc_mountingtapedensity, mc_mountingtapthickness, mc_mountingcarrierthickness, mc_mountingcushionmanufacturer, mc_mountingcushonname, mc_mountingdensity, mc_mountingcushionthickness, mc_cimplevel_1, mc_cimplevel_2, mc_cimplevel_3, mc_cimplevel_4, mc_cimplevel_5, mc_cimpsubstrate_1, mc_cimpsubstrate_2, mc_cimpsubstrate_3, mc_cimpsubstrate_4, mc_cimpsubstrate_5, mc_cimpanlox_1, mc_cimpanlox_2, mc_cimpanlox_3, mc_cimpanlox_4, mc_cimpanlox_5, mc_aniloxmanufacturer, mc_aniloxtype, mc_aniloxengravingangle, mc_aniloxinking, mc_aniloxprintingunit_1, mc_aniloxprintingunit_2, mc_aniloxprintingunit_3, mc_aniloxprintingunit_4, mc_aniloxprintingunit_5, mc_aniloxmanufacturer_1, mc_aniloxmanufacturer_2, mc_aniloxmanufacturer_3, mc_aniloxmanufacturer_4, mc_aniloxmanufacturer_5, mc_aniloxtype_1, mc_aniloxtype_2, mc_aniloxtype_3, mc_aniloxtype_4, mc_aniloxtype_5, mc_aniloxengravingangle_1, mc_aniloxengravingangle_2, mc_aniloxengravingangle_3, mc_aniloxengravingangle_4, mc_aniloxengravingangle_5, mc_aniloxinking_1, mc_aniloxinking_2, mc_aniloxinking_3, mc_aniloxinking_4, mc_aniloxinking_5, mc_aniloxcellcount_1, mc_aniloxcellcount_2, mc_aniloxcellcount_3, mc_aniloxcellcount_4, mc_aniloxcellcount_5, mc_aniloxvolumn_1, mc_aniloxvolumn_2, mc_aniloxvolumn_3, mc_aniloxvolumn_4, mc_aniloxvolumn_5, mc_aniloxdoration_1, mc_aniloxdoration_2, mc_aniloxdoration_3, mc_aniloxdoration_4, mc_aniloxdoration_5, mc_aniloxdoctoring_1, mc_aniloxdoctoring_2, mc_aniloxdoctoring_3, mc_aniloxdoctoring_4, mc_aniloxdoctoring_5, mc_aniloxcontainment_1, mc_aniloxcontainment_2, mc_aniloxcontainment_3, mc_aniloxcontainment_4, mc_aniloxcontainment_5, mc_substratemanufacturer, mc_substratename, mc_substratetype, mc_substratedyna, mc_substrateweight, mc_substrateflute, mc_substratethickness, mc_printer_name) VALUES (2, 10, 'pressmanufacturer', 'yearbuild', 'model', 'width', 'Stack', 'speed', 'cylinderrepeat', 'inkmanufacturer', 'commercialname', 'U.V', 'typeother', 'Manual', 'viscosityother', 'printingunit1', 'printingunit2', 'printingunit3', 'printingunit4', 'printingunit5', 'viscosity1', 'viscosity2', 'viscosity3', 'viscosity4', 'viscosity5', 'ph1', 'ph2', 'ph3', 'ph4', 'ph5', 'density1', 'density2', 'density3', 'density4', 'density5', 'platesmanufacturer', 'platescommercialname', 'Uncapped', 'durometer', 'tickness', 'relief', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Printer 123');
INSERT INTO mcustmachine_old (mc_id, mc_orgid, mc_pressmanufacturer, mc_pressyearbuilt, mc_pressmodel, mc_presswidth, mc_presstype, mc_pressspeed, mc_presscylinderrepeat, mc_inkmanufacturer, mc_inkcommercialname, mc_inktype, mc_inktypeother, mc_inkviscosity, mc_inkvicosityother, mc_inkprintingunit_1, mc_inkprintingunit_2, mc_inkprintingunit_3, mc_inkprintingunit_4, mc_inkprintingunit_5, mc_inkvisocity_1, mc_inkvisocity_2, mc_inkvisocity_3, mc_inkvisocity_4, mc_inkvisocity_5, mc_inkph_1, mc_inkph_2, mc_inkph_3, mc_inkph_4, mc_inkph_5, mc_inkdensity_1, mc_inkdensity_2, mc_inkdensity_3, mc_inkdensity_4, mc_inkdensity_5, mc_platemanufacturer, mc_platecommercialname, mc_platetype, mc_platedurometer, mc_platethickness, mc_platerelief, mc_mountingtapemanufacturer, mc_mountingtapename, mc_mountingtapedensity, mc_mountingtapthickness, mc_mountingcarrierthickness, mc_mountingcushionmanufacturer, mc_mountingcushonname, mc_mountingdensity, mc_mountingcushionthickness, mc_cimplevel_1, mc_cimplevel_2, mc_cimplevel_3, mc_cimplevel_4, mc_cimplevel_5, mc_cimpsubstrate_1, mc_cimpsubstrate_2, mc_cimpsubstrate_3, mc_cimpsubstrate_4, mc_cimpsubstrate_5, mc_cimpanlox_1, mc_cimpanlox_2, mc_cimpanlox_3, mc_cimpanlox_4, mc_cimpanlox_5, mc_aniloxmanufacturer, mc_aniloxtype, mc_aniloxengravingangle, mc_aniloxinking, mc_aniloxprintingunit_1, mc_aniloxprintingunit_2, mc_aniloxprintingunit_3, mc_aniloxprintingunit_4, mc_aniloxprintingunit_5, mc_aniloxmanufacturer_1, mc_aniloxmanufacturer_2, mc_aniloxmanufacturer_3, mc_aniloxmanufacturer_4, mc_aniloxmanufacturer_5, mc_aniloxtype_1, mc_aniloxtype_2, mc_aniloxtype_3, mc_aniloxtype_4, mc_aniloxtype_5, mc_aniloxengravingangle_1, mc_aniloxengravingangle_2, mc_aniloxengravingangle_3, mc_aniloxengravingangle_4, mc_aniloxengravingangle_5, mc_aniloxinking_1, mc_aniloxinking_2, mc_aniloxinking_3, mc_aniloxinking_4, mc_aniloxinking_5, mc_aniloxcellcount_1, mc_aniloxcellcount_2, mc_aniloxcellcount_3, mc_aniloxcellcount_4, mc_aniloxcellcount_5, mc_aniloxvolumn_1, mc_aniloxvolumn_2, mc_aniloxvolumn_3, mc_aniloxvolumn_4, mc_aniloxvolumn_5, mc_aniloxdoration_1, mc_aniloxdoration_2, mc_aniloxdoration_3, mc_aniloxdoration_4, mc_aniloxdoration_5, mc_aniloxdoctoring_1, mc_aniloxdoctoring_2, mc_aniloxdoctoring_3, mc_aniloxdoctoring_4, mc_aniloxdoctoring_5, mc_aniloxcontainment_1, mc_aniloxcontainment_2, mc_aniloxcontainment_3, mc_aniloxcontainment_4, mc_aniloxcontainment_5, mc_substratemanufacturer, mc_substratename, mc_substratetype, mc_substratedyna, mc_substrateweight, mc_substrateflute, mc_substratethickness, mc_printer_name) VALUES (3, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Printer for customer 1');
INSERT INTO mcustmachine_old (mc_id, mc_orgid, mc_pressmanufacturer, mc_pressyearbuilt, mc_pressmodel, mc_presswidth, mc_presstype, mc_pressspeed, mc_presscylinderrepeat, mc_inkmanufacturer, mc_inkcommercialname, mc_inktype, mc_inktypeother, mc_inkviscosity, mc_inkvicosityother, mc_inkprintingunit_1, mc_inkprintingunit_2, mc_inkprintingunit_3, mc_inkprintingunit_4, mc_inkprintingunit_5, mc_inkvisocity_1, mc_inkvisocity_2, mc_inkvisocity_3, mc_inkvisocity_4, mc_inkvisocity_5, mc_inkph_1, mc_inkph_2, mc_inkph_3, mc_inkph_4, mc_inkph_5, mc_inkdensity_1, mc_inkdensity_2, mc_inkdensity_3, mc_inkdensity_4, mc_inkdensity_5, mc_platemanufacturer, mc_platecommercialname, mc_platetype, mc_platedurometer, mc_platethickness, mc_platerelief, mc_mountingtapemanufacturer, mc_mountingtapename, mc_mountingtapedensity, mc_mountingtapthickness, mc_mountingcarrierthickness, mc_mountingcushionmanufacturer, mc_mountingcushonname, mc_mountingdensity, mc_mountingcushionthickness, mc_cimplevel_1, mc_cimplevel_2, mc_cimplevel_3, mc_cimplevel_4, mc_cimplevel_5, mc_cimpsubstrate_1, mc_cimpsubstrate_2, mc_cimpsubstrate_3, mc_cimpsubstrate_4, mc_cimpsubstrate_5, mc_cimpanlox_1, mc_cimpanlox_2, mc_cimpanlox_3, mc_cimpanlox_4, mc_cimpanlox_5, mc_aniloxmanufacturer, mc_aniloxtype, mc_aniloxengravingangle, mc_aniloxinking, mc_aniloxprintingunit_1, mc_aniloxprintingunit_2, mc_aniloxprintingunit_3, mc_aniloxprintingunit_4, mc_aniloxprintingunit_5, mc_aniloxmanufacturer_1, mc_aniloxmanufacturer_2, mc_aniloxmanufacturer_3, mc_aniloxmanufacturer_4, mc_aniloxmanufacturer_5, mc_aniloxtype_1, mc_aniloxtype_2, mc_aniloxtype_3, mc_aniloxtype_4, mc_aniloxtype_5, mc_aniloxengravingangle_1, mc_aniloxengravingangle_2, mc_aniloxengravingangle_3, mc_aniloxengravingangle_4, mc_aniloxengravingangle_5, mc_aniloxinking_1, mc_aniloxinking_2, mc_aniloxinking_3, mc_aniloxinking_4, mc_aniloxinking_5, mc_aniloxcellcount_1, mc_aniloxcellcount_2, mc_aniloxcellcount_3, mc_aniloxcellcount_4, mc_aniloxcellcount_5, mc_aniloxvolumn_1, mc_aniloxvolumn_2, mc_aniloxvolumn_3, mc_aniloxvolumn_4, mc_aniloxvolumn_5, mc_aniloxdoration_1, mc_aniloxdoration_2, mc_aniloxdoration_3, mc_aniloxdoration_4, mc_aniloxdoration_5, mc_aniloxdoctoring_1, mc_aniloxdoctoring_2, mc_aniloxdoctoring_3, mc_aniloxdoctoring_4, mc_aniloxdoctoring_5, mc_aniloxcontainment_1, mc_aniloxcontainment_2, mc_aniloxcontainment_3, mc_aniloxcontainment_4, mc_aniloxcontainment_5, mc_substratemanufacturer, mc_substratename, mc_substratetype, mc_substratedyna, mc_substrateweight, mc_substrateflute, mc_substratethickness, mc_printer_name) VALUES (4, 13, 'Printer 1 for customer 4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Printer 1 for customer 4');


--
-- TOC entry 3318 (class 0 OID 51866)
-- Dependencies: 498
-- Data for Name: mcustprinter; Type: TABLE DATA; Schema: pnd; Owner: pnd
--



--
-- TOC entry 3454 (class 0 OID 0)
-- Dependencies: 499
-- Name: mcustprinter_cp_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('mcustprinter_cp_id_seq', 1, false);


--
-- TOC entry 3320 (class 0 OID 51871)
-- Dependencies: 500
-- Data for Name: mjobbarcode; Type: TABLE DATA; Schema: pnd; Owner: pnd
--



--
-- TOC entry 3455 (class 0 OID 0)
-- Dependencies: 501
-- Name: mjobbarcode_jbc_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('mjobbarcode_jbc_id_seq', 50, true);


--
-- TOC entry 3322 (class 0 OID 51876)
-- Dependencies: 502
-- Data for Name: mjobcat; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (278, 129, 2);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (279, 130, 3);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (280, 130, 4);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (281, 131, 3);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (282, 132, 2);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (284, 133, 2);


--
-- TOC entry 3456 (class 0 OID 0)
-- Dependencies: 503
-- Name: mjobcat_jc_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('mjobcat_jc_id_seq', 284, true);


--
-- TOC entry 3324 (class 0 OID 51881)
-- Dependencies: 504
-- Data for Name: mjobcatlookup; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO mjobcatlookup (jcl_id, jcl_title, jcl_sequence, jcl_requiretime_color_1, jcl_requiretime_color_2, jcl_requiretime_color_3, jcl_requiretime_color_4, jcl_status, jcl_price_cat, jcl_price_color_1, jcl_price_color_2, jcl_price_color_3, jcl_price_color_4, jcl_price_per_unit) VALUES (6, 'Barcode', 600, 30, 30, 30, 30, 'ACTIVE', 'UNIT', NULL, NULL, NULL, NULL, 5.0000);
INSERT INTO mjobcatlookup (jcl_id, jcl_title, jcl_sequence, jcl_requiretime_color_1, jcl_requiretime_color_2, jcl_requiretime_color_3, jcl_requiretime_color_4, jcl_status, jcl_price_cat, jcl_price_color_1, jcl_price_color_2, jcl_price_color_3, jcl_price_color_4, jcl_price_per_unit) VALUES (2, 'Drawing', 200, 240, 240, 240, 240, 'ACTIVE', 'COLOR', 5.0000, 5.0000, 5.0000, 5.0000, NULL);
INSERT INTO mjobcatlookup (jcl_id, jcl_title, jcl_sequence, jcl_requiretime_color_1, jcl_requiretime_color_2, jcl_requiretime_color_3, jcl_requiretime_color_4, jcl_status, jcl_price_cat, jcl_price_color_1, jcl_price_color_2, jcl_price_color_3, jcl_price_color_4, jcl_price_per_unit) VALUES (3, 'Monotone', 300, 60, 60, 60, 60, 'ACTIVE', 'COLOR', 5.0000, 5.0000, 5.0000, 5.0000, NULL);
INSERT INTO mjobcatlookup (jcl_id, jcl_title, jcl_sequence, jcl_requiretime_color_1, jcl_requiretime_color_2, jcl_requiretime_color_3, jcl_requiretime_color_4, jcl_status, jcl_price_cat, jcl_price_color_1, jcl_price_color_2, jcl_price_color_3, jcl_price_color_4, jcl_price_per_unit) VALUES (4, 'Trapping', 400, 180, 180, 360, 360, 'ACTIVE', 'COLOR', 5.0000, 5.0000, 5.0000, 5.0000, NULL);
INSERT INTO mjobcatlookup (jcl_id, jcl_title, jcl_sequence, jcl_requiretime_color_1, jcl_requiretime_color_2, jcl_requiretime_color_3, jcl_requiretime_color_4, jcl_status, jcl_price_cat, jcl_price_color_1, jcl_price_color_2, jcl_price_color_3, jcl_price_color_4, jcl_price_per_unit) VALUES (1, 'Typing', 100, 120, 120, 120, 120, 'ACTIVE', 'COLOR', 5.0000, 5.0000, 5.0000, 5.0000, NULL);


--
-- TOC entry 3457 (class 0 OID 0)
-- Dependencies: 505
-- Name: mjobcatlookup_jcl_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('mjobcatlookup_jcl_id_seq', 8, true);


--
-- TOC entry 3326 (class 0 OID 51887)
-- Dependencies: 506
-- Data for Name: mjoboutput; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO mjoboutput (jo_id, jo_jsid, jo_outputcode) VALUES (105, 129, '');
INSERT INTO mjoboutput (jo_id, jo_jsid, jo_outputcode) VALUES (106, 130, '2');
INSERT INTO mjoboutput (jo_id, jo_jsid, jo_outputcode) VALUES (107, 130, ' 3');
INSERT INTO mjoboutput (jo_id, jo_jsid, jo_outputcode) VALUES (108, 131, '2');
INSERT INTO mjoboutput (jo_id, jo_jsid, jo_outputcode) VALUES (109, 132, '2');
INSERT INTO mjoboutput (jo_id, jo_jsid, jo_outputcode) VALUES (111, 133, '2');


--
-- TOC entry 3327 (class 0 OID 51890)
-- Dependencies: 507
-- Data for Name: mjoboutputlookup; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO mjoboutputlookup (jol_id, jol_title, jol_requiredtime, jol_status, jol_price_color_1, jol_price_color_2, jol_price_color_3, jol_price_color_4) VALUES (1, 'Technical drawing', 120, 'ACTIVE', 10.0000, 15.0000, 20.0000, 25.0000);
INSERT INTO mjoboutputlookup (jol_id, jol_title, jol_requiredtime, jol_status, jol_price_color_1, jol_price_color_2, jol_price_color_3, jol_price_color_4) VALUES (2, 'Artwork seperation', 60, 'ACTIVE', 10.0000, 15.0000, 20.0000, 25.0000);
INSERT INTO mjoboutputlookup (jol_id, jol_title, jol_requiredtime, jol_status, jol_price_color_1, jol_price_color_2, jol_price_color_3, jol_price_color_4) VALUES (3, 'Master Card', 10, 'ACTIVE', 10.0000, 15.0000, 20.0000, 25.0000);


--
-- TOC entry 3458 (class 0 OID 0)
-- Dependencies: 508
-- Name: mjoboutputlookup_jol_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('mjoboutputlookup_jol_id_seq', 3, true);


--
-- TOC entry 3329 (class 0 OID 51896)
-- Dependencies: 509
-- Data for Name: mjobsheet; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO mjobsheet (js_id, js_orgid, js_ctid, js_request_date, js_request_by, js_title, js_model, js_description, js_material_provided, js_color_1, js_color_2, js_color_3, js_color_4, js_color_5, js_angle_1, js_angle_2, js_angle_3, js_angle_4, js_angle_5, js_bleeding, js_bleeding_remark, js_distortion, js_distortion_value, js_diecut_ind, js_diecut_no, js_trapping_size, js_primcat, js_status, js_completiondate, js_assignto, js_carid, js_decision, js_width, js_height, js_requiretime, js_request_dateinmth, js_jobcolor, js_lpi, js_mcid, js_code, js_month_occur, js_price, js_outputtype, js_outputwidth, js_outputheight, js_qcchecked) VALUES (129, 9, NULL, '2014-07-08 06:49:41.33+08', 'uat_customer1', NULL, NULL, 'New job test printer', NULL, '#221100', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, 2, 'PENDING QC CHECK', NULL, 'uat_artist1', NULL, 'Assign', '23', '12', 240, 'Jul-2014', '1', NULL, 1, '2014070001', 1, 5.0000, NULL, NULL, NULL, NULL);
INSERT INTO mjobsheet (js_id, js_orgid, js_ctid, js_request_date, js_request_by, js_title, js_model, js_description, js_material_provided, js_color_1, js_color_2, js_color_3, js_color_4, js_color_5, js_angle_1, js_angle_2, js_angle_3, js_angle_4, js_angle_5, js_bleeding, js_bleeding_remark, js_distortion, js_distortion_value, js_diecut_ind, js_diecut_no, js_trapping_size, js_primcat, js_status, js_completiondate, js_assignto, js_carid, js_decision, js_width, js_height, js_requiretime, js_request_dateinmth, js_jobcolor, js_lpi, js_mcid, js_code, js_month_occur, js_price, js_outputtype, js_outputwidth, js_outputheight, js_qcchecked) VALUES (130, 1, NULL, '2014-07-09 11:30:35.494+08', 'ysyow', NULL, NULL, 'asdads', NULL, '12', '23', '32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', 'assaddsa', NULL, NULL, 'N', NULL, 23.0000, 4, 'WORK IN PROGRESS', NULL, 'artist2', 41, 'Assign', NULL, NULL, 420, 'Jul-2014', '3', NULL, 1, '2014070002', 2, 20.0000, 'IMGSETTLE', 23, 23, NULL);
INSERT INTO mjobsheet (js_id, js_orgid, js_ctid, js_request_date, js_request_by, js_title, js_model, js_description, js_material_provided, js_color_1, js_color_2, js_color_3, js_color_4, js_color_5, js_angle_1, js_angle_2, js_angle_3, js_angle_4, js_angle_5, js_bleeding, js_bleeding_remark, js_distortion, js_distortion_value, js_diecut_ind, js_diecut_no, js_trapping_size, js_primcat, js_status, js_completiondate, js_assignto, js_carid, js_decision, js_width, js_height, js_requiretime, js_request_dateinmth, js_jobcolor, js_lpi, js_mcid, js_code, js_month_occur, js_price, js_outputtype, js_outputwidth, js_outputheight, js_qcchecked) VALUES (131, 1, NULL, '2014-07-09 11:46:37.856+08', 'ysyow', NULL, NULL, 'xssaasd', NULL, '23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '10', NULL, NULL, NULL, 'N', NULL, NULL, 3, 'PENDING ARTIST ACKNOWLEDGE JOB', NULL, 'artist1', NULL, 'Assign', NULL, NULL, 120, 'Jul-2014', '1', NULL, 1, '2014070003', 3, 10.0000, 'IMGSETTLE', 23, NULL, NULL);
INSERT INTO mjobsheet (js_id, js_orgid, js_ctid, js_request_date, js_request_by, js_title, js_model, js_description, js_material_provided, js_color_1, js_color_2, js_color_3, js_color_4, js_color_5, js_angle_1, js_angle_2, js_angle_3, js_angle_4, js_angle_5, js_bleeding, js_bleeding_remark, js_distortion, js_distortion_value, js_diecut_ind, js_diecut_no, js_trapping_size, js_primcat, js_status, js_completiondate, js_assignto, js_carid, js_decision, js_width, js_height, js_requiretime, js_request_dateinmth, js_jobcolor, js_lpi, js_mcid, js_code, js_month_occur, js_price, js_outputtype, js_outputwidth, js_outputheight, js_qcchecked) VALUES (132, 1, NULL, '2014-07-09 12:36:14.042+08', 'ysyow', NULL, NULL, 'sasdasad', NULL, '13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'N', NULL, NULL, 2, 'CANCELLED', NULL, NULL, NULL, 'Cancel', NULL, NULL, 300, 'Jul-2014', '1', NULL, 1, '2014070004', 4, 10.0000, 'INKJET', 23, 23, NULL);
INSERT INTO mjobsheet (js_id, js_orgid, js_ctid, js_request_date, js_request_by, js_title, js_model, js_description, js_material_provided, js_color_1, js_color_2, js_color_3, js_color_4, js_color_5, js_angle_1, js_angle_2, js_angle_3, js_angle_4, js_angle_5, js_bleeding, js_bleeding_remark, js_distortion, js_distortion_value, js_diecut_ind, js_diecut_no, js_trapping_size, js_primcat, js_status, js_completiondate, js_assignto, js_carid, js_decision, js_width, js_height, js_requiretime, js_request_dateinmth, js_jobcolor, js_lpi, js_mcid, js_code, js_month_occur, js_price, js_outputtype, js_outputwidth, js_outputheight, js_qcchecked) VALUES (133, 1, NULL, '2014-07-09 15:14:40.118+08', 'ysyow', NULL, NULL, 'test cancel', NULL, '23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '123sd', NULL, NULL, 'N', NULL, NULL, 2, 'CANCELED', NULL, NULL, NULL, 'Cancel', NULL, NULL, 300, 'Jul-2014', '1', NULL, 1, '2014070005', 5, 10.0000, 'IMGSETTLE', 23, 23, NULL);


--
-- TOC entry 3459 (class 0 OID 0)
-- Dependencies: 510
-- Name: mjobsheet_js_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('mjobsheet_js_id_seq', 133, true);


--
-- TOC entry 3331 (class 0 OID 51906)
-- Dependencies: 511
-- Data for Name: mjscartonvalue; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (623, 123.0000, 'x1', 41, 130);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (624, 23.0000, 'x2', 41, 130);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (625, 23.0000, 'x3', 41, 130);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (626, 22.0000, 'y1', 41, 130);


--
-- TOC entry 3460 (class 0 OID 0)
-- Dependencies: 512
-- Name: mjscartonvalue_caval_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('mjscartonvalue_caval_id_seq', 626, true);


--
-- TOC entry 3333 (class 0 OID 51911)
-- Dependencies: 513
-- Data for Name: mmailtemplate; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO mmailtemplate (mt_code, mt_desc, mt_recipient_to, mt_recipient_cc, mt_subject, mt_content, mt_status, mt_internal_userid) VALUES ('NOTIFY_LATE_REQ_VER', 'Late Requirement Verification Notification Email', 'supervisor@gmail.com', 'supervisor@gmail.com', '[MOIRE] Late Requirement Verification Notification', '<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "[[JS_JOB_DESCRIPTION]]" job is still pending since [[REQ_VER_ACTIVITY_START]].</p><p><br></p>', 'ACTIVE', 'uat_supervisor1');
INSERT INTO mmailtemplate (mt_code, mt_desc, mt_recipient_to, mt_recipient_cc, mt_subject, mt_content, mt_status, mt_internal_userid) VALUES ('NOTIFY_LATE_ACKNOWLEDGE', 'Late Job Acknowledgement Notification Email', NULL, '[[JS_ASSIGNED_ARTIST_EMAIL]]', '[MOIRE] Late Job Acknowledgement Notification', '<p>Dear Supervisor,</p><p>This email is to notify that the "[[JS_JOB_DESCRIPTION]]" job is still pending acknowledgement from [[JS_ASSIGN_ARTIST_NAME]] since [[ACKNOWLEDGE_ACTIVITY_START]].</p><div><br></div>', 'ACTIVE', 'supervisor');
INSERT INTO mmailtemplate (mt_code, mt_desc, mt_recipient_to, mt_recipient_cc, mt_subject, mt_content, mt_status, mt_internal_userid) VALUES ('NOTIFY_LATE_WIP', 'Late Job WIP Notification Email', NULL, '[[JS_ASSIGNED_ARTIST_EMAIL]]', '[MOIRE] Late Job WIP Notification', '<p>Dear Manager and Supervisor,</p><p>This email is to notify that the "[[JS_JOB_DESCRIPTION]]" job is still WIP from [[JS_ASSIGN_ARTIST_NAME]] since [[WIP_ACTIVITY_START]].</p><div><br></div>', 'ACTIVE', 'supervisor');
INSERT INTO mmailtemplate (mt_code, mt_desc, mt_recipient_to, mt_recipient_cc, mt_subject, mt_content, mt_status, mt_internal_userid) VALUES ('NOTIFY_LATE_QC', 'Late QC Notification Email', NULL, NULL, '[MOIRE] Late Job QC Notification', '<p>Dear Manager and Supervisor,</p><p>This email is to notify that the "[[JS_JOB_DESCRIPTION]]" job is still pending QC since [[QC_ACTIVITY_START]].</p><div><br></div>', 'ACTIVE', 'supervisor');
INSERT INTO mmailtemplate (mt_code, mt_desc, mt_recipient_to, mt_recipient_cc, mt_subject, mt_content, mt_status, mt_internal_userid) VALUES ('NOTIFY_CUSTOMER_ACK', 'Notify Customer Job Has Been Acknowledged', '[[JS_REQUESTOR_EMAIL]]', '[[JS_ASSIGNED_ARTIST_EMAIL]], dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com', '[MOIRE] Job Acknowledgement', '<p>Dear [[JS_REQUESTOR_NAME]],</p><p>This email is to inform that your job request "[[JS_JOB_DESCRIPTION]]" is now confirmed and acknowledged. </p><p><br></p><p>Estimate Time Required : [[JS_REQUIRE_MIN]] (Working hour)</p><p>Estimate Completion Time : [[JS_EST_COMPLETE_TIME]]</p><div><br></div>', 'ACTIVE', '[[JS_REQUESTOR_USERID]]');


--
-- TOC entry 3334 (class 0 OID 51918)
-- Dependencies: 514
-- Data for Name: mtnc; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO mtnc (tc_id, tc_text) VALUES (1, '<div><h5 style="line-height: 20px; margin-left: 10px;"><span style="font-family: Arial;">SAMPLE ANSWERS LTD (INCORPORATING PRIME PROSPECTS) – END USER LICENCE TERMS<br></span><strong style="color: rgb(10, 80, 161); font-family: Arial;">1) DEFINITIONS<br></strong><span style="font-family: Arial;">“Goods” means any goods and/or services provided by the Company as ordered by the Client<br></span><span style="font-family: Arial;">“ Company” means Sample Answers Ltd. incorporating Prime Prospects.<br></span><span style="font-family: Arial;">“ Client” means the person, firm or company placing an order with the Company.<br></span><strong style="color: rgb(10, 80, 161); font-family: Arial;">2) APPLICATION<br></strong><span style="font-family: Arial;">These terms and conditions apply to any provision of services or materials by the Company to the Client.<br></span><strong style="color: rgb(10, 80, 161); font-family: Arial;">3) FORMATION OF CONTRACT<br></strong><span style="font-family: Arial;">All Goods sold by the Company are sold subject to the Company’s standard terms and conditions (as detailed below) which form part of the Client’s contract with the Company. Terms and conditions on the Client’s order form or other similar document shall not be binding on the Company.<br></span><strong style="color: rgb(10, 80, 161); font-family: Arial;">4) QUOTATIONS<br></strong><span style="font-family: Arial;">The prices, quantities and delivery time stated in any quotation are not binding on the Company. They are commercial estimates only which the Company will make reasonable efforts to achieve.<br></span><strong style="color: rgb(10, 80, 161); font-family: Arial;">5) ORDERS<br></strong><span style="font-family: Arial;">5.1 Orders will be deemed to have been placed when an email confirmation has been received from a responsible executive of the client company.<br></span><span style="font-family: Arial;">5.2 For email invitations, online fulfilment projects and direct marketing files (as provided by Prime Prospects) it is a requirement of the Company, that the email piece, online form or mail piece shall be approved by the company before an order can be confirmed and any data despatched.<br></span><strong style="color: rgb(10, 80, 161); font-family: Arial;">6) RIGHT TO SUB CONTRACT<br></strong><span style="font-family: Arial;">Unless otherwise agreed the Company shall be entitled to sub-contract all or any part of the work.<br></span><strong style="color: rgb(10, 80, 161); font-family: Arial;">7) TIMETABLE<br></strong><span style="font-family: Arial;">The Company will use its best endeavours to supply the services or materials within the quoted time (normally within a maximum of seven days from order or otherwise as agreed) but time will not be of the essence within the contract.<br></span><strong style="color: rgb(10, 80, 161); font-family: Arial;">8 ) COPYRIGHT<br></strong><span style="font-family: Arial;">The Client acknowledges that the rights to the Goods are owned by the Company and that the Goods are protected by United Kingdom copyright laws, international treaty provisions and all other applicable national laws.<br></span><strong style="color: rgb(10, 80, 161); font-family: Arial;">9) RISK OF LOSS<br></strong><span style="font-family: Arial;">The risk of loss or damage to the Goods shall pass to the Client upon delivery of the Goods.<br></span><strong style="color: rgb(10, 80, 161); font-family: Arial;">10) PAYMENTS<br></strong><span style="font-family: Arial;">10.1 New clients or other clients out of terms may be expected to pay in advance for their services.<br></span><span style="font-family: Arial;">10.2 All other invoices issued by the Company shall be paid by the Client within thirty (30) days of the date of invoice unless otherwise agreed in writing by the Company. In the event of late payment, the Company may charge interest on the amount outstanding before and after judgement at the rate of five (5) percent above the Base Rate of Barclays Bank plc in force from the due date until the date of payment. In addition, invoices unpaid for more than 60 days after the invoice date will incur a surcharge of either £30 or 5% of the outstanding amount, whichever sum is greater.<br></span><span style="font-family: Arial;">10.3 If any amount of an invoice is disputed then the Client shall inform the Company of the grounds for such dispute within seven days of delivery of the goods and shall pay to the Company the value of the invoice less the disputed amount in accordance with these payment terms. Once settlement of the dispute has been agreed, any sum then outstanding shall also be payable in accordance with these payment terms.<br></span><span style="font-family: Arial;">10.4 The Company reserves the right to increase a quoted fee in the event that the client requests a variation to the work agreed.<br></span><strong style="color: rgb(10, 80, 161); font-family: Arial;">11) CANCELLATION<br></strong><span style="font-family: Arial;">In view of the nature of the service, any order – once confirmed by the Company – is not cancellable. Cancellation of the Order by the Client will only be accepted on condition that any costs, charges and expenses already incurred, including any charges that will be levied by a sub-contractor on account of their expenses, work or cancellation conditions will be reimbursed to the Company forthwith.<br></span><strong style="color: rgb(10, 80, 161); font-family: Arial;">12) DELIVERY<br></strong><span style="font-family: Arial;">12.1 The majority of services as supplied by the company are despatched electronically by email and shall be deemed as having been delivered when the email has been opened by the client.<br></span><span style="font-family: Arial;">12.2 The Company reserves the right to substitute conventional delivery methods without notice or penalty should electronic despatch prove inconvenient; in which case delivery by the Company will be deemed to have taken place when the materials are handed to the custody of the Client at his premises or to a deputed messenger or courier when posted. The Company will be entitled to charge the Client for any expenses of delivery other than normal postage charges.<br></span><strong style="color: rgb(10, 80, 161); font-family: Arial;">13) NOTICE<br></strong><span style="font-family: Arial;">All written notices to be served on or given to the client shall be sent or delivered to the client’s principle place of business and shall be treated as having been given upon receipt.<br></span><strong style="color: rgb(10, 80, 161); font-family: Arial;">14) LOSS OR DAMAGE TO SUPPLIES<br></strong><span style="font-family: Arial;">The Company will take all reasonable steps to ensure the protection from loss, damage or destruction of the services or materials it supplies to the Client (or which may be received from the Client).<br></span><strong style="color: rgb(10, 80, 161); font-family: Arial;">15) USAGE OF THE SERVICES OR MATERIALS<br></strong><span style="font-family: Arial;">Unless otherwise agreed in writing by the Company, the Client (and their clients) shall be entitled to use the services and materials provided as follows: .<br></span><span style="font-family: Arial;">15.1 All files of Consumer and Business data records are for single use and for use within a period of not more than 6 months from date of delivery.<br></span><span style="font-family: Arial;">15.2 Files of Samples of Consumer or Businesses data records are provided solely for the purpose of conducting market research to be carried out in conformity with the recognised ESOMAR/MRS Code of Conduct of the market research industry. The Client shall not otherwise be entitled to store, or to pass on (whether to his/her client or other person) or make any other use of these services and materials.<br></span><span style="font-family: Arial;">15.3 The Client shall bear responsibility for ensuring that all usage of information contained within any service as provided by Sample Answers and Prime Prospects is in accordance with, and does not contravene, any Data Protection or other laws, regulations or other trade customs and practices. The Company bears no liability for any omissions or faults in these respects.<br></span><strong style="color: rgb(10, 80, 161); font-family: Arial;">16) CONFIDENTIALITY<br></strong><span style="font-family: Arial;">Both parties shall maintain strict confidence and shall not disclose to any third party any information or material relating to the other or the other’s business which comes into that party’s possession and shall not use such information and material without written permission by the other party. This provision shall not, however, apply to information or material which is, or becomes, public knowledge by means other than by breach by a party to this clause.<br></span><strong style="color: rgb(10, 80, 161); font-family: Arial;">17) EMPLOYMENT OF PERSONNEL<br></strong><span style="font-family: Arial;">Subject to the prior written consent of the Company the Client shall not induce to employ, whether as an employee, agent, partner or consultant, any employee of the Company directly associated with delivery of the Goods.<br></span><strong style="color: rgb(10, 80, 161); font-family: Arial;">18) WARRANTY<br></strong><span style="font-family: Arial;">18.1 The Company warrants that it has the right to provide the Goods but otherwise the Goods are provided on an “as-is” basis without warranty of any kind, express or implied, oral or written including, without limitation, the implied conditions of merchantable quality, fitness for purpose and description, all of which are specifically and unreservedly excluded. In particular, but without limitation, no warranty is given that the Goods are suitable for the purposes intended by the Client.<br></span><span style="font-family: Arial;">18.2 The Company warrants that the Goods will be supplied using reasonable care and skill. The Company does not warrant that the Goods supplied are error-free, accurate or complete.<br></span><span style="font-family: Arial;">18.3 Both parties warrant that they are registered under the Data Protection Act in respect of the collection, processing and use of the Goods. Each party will comply with the Act including but not limited to its obligations in respect of any personal data which it may supply to or receive from the other party.<br></span><span style="font-family: Arial;">18.4 The Client acknowledges that the Company is required to uphold at all times, in letter and in spirit, the British Codes of Advertising and Sales Promotion.<br></span><strong style="color: rgb(10, 80, 161); font-family: Arial;">19) LIMITATION OF LIABILITY<br></strong><span style="font-family: Arial;">19.1 The Company shall not be liable for any claim arising out of the performance, non-performance, delay in delivery of or defect in the Goods nor for any special, indirect, economic or consequential loss or damage howsoever arising or howsoever caused (including loss of profit or loss of revenue) whether from negligence or otherwise in connection with the supply, functioning or use of the Goods. Any liability of the Company shall in any event be limited to the licence fees paid by the Client in the year in which the event of default arises.<br></span><span style="font-family: Arial;">19.2 Nothing herein shall limit either party’s liability for death or personal injury arising from the proven negligence by itself or its employees or agents.<br></span><span style="font-family: Arial;">19.3 The Client shall fully indemnify the Company against any liability to third parties arising out of the Client’s use of the Goods.<br></span><strong style="color: rgb(10, 80, 161); font-family: Arial;">20) FORCE MAJEURE<br></strong><span style="font-family: Arial;">The Company will not be liable to the Client for any loss or damage suffered by the Client as a direct result of the Company, its sub-contractors or the list-owner from whom the sample or other service or material is derived being unable to perform the Contract in the way agreed by reason of cause beyond its control including Act of God, accident, war, riot, lockout, strike, flood, fire, power failure, breakdown of plant or machinery, delay in transit, postal delay, or any other unexpected or exceptional cause or circumstance.<br></span><strong style="color: rgb(10, 80, 161); font-family: Arial;">21) GOVERNING LAW<br></strong><span style="font-family: Arial;">These Terms of Trading shall be subject to and construed in accordance with the laws of England and the parties hereby submit to the exclusive jurisdiction of the English courts.</span></h5></div> ');


--
-- TOC entry 3461 (class 0 OID 0)
-- Dependencies: 515
-- Name: mtnc_tc_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('mtnc_tc_id_seq', 1, true);


--
-- TOC entry 3336 (class 0 OID 51926)
-- Dependencies: 516
-- Data for Name: mtncacceptance; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO mtncacceptance (tca_tcid, tca_userid, tca_date, tca_result) VALUES (1, 'uat_customer4', '2014-06-30 17:54:49.327589+08', 'AGREE');
INSERT INTO mtncacceptance (tca_tcid, tca_userid, tca_date, tca_result) VALUES (1, 'uat_customer2', '2014-07-01 04:36:16.873047+08', 'AGREE');
INSERT INTO mtncacceptance (tca_tcid, tca_userid, tca_date, tca_result) VALUES (1, 'uat_customer1', '2014-07-01 04:36:42.985212+08', 'AGREE');
INSERT INTO mtncacceptance (tca_tcid, tca_userid, tca_date, tca_result) VALUES (1, 'newcust', '2014-07-03 15:39:19.276+08', 'AGREE');
INSERT INTO mtncacceptance (tca_tcid, tca_userid, tca_date, tca_result) VALUES (1, 'uat_customer5', '2014-07-04 14:01:56.496+08', 'AGREE');


--
-- TOC entry 3337 (class 0 OID 51930)
-- Dependencies: 517
-- Data for Name: pndaddress; Type: TABLE DATA; Schema: pnd; Owner: pnd
--



--
-- TOC entry 3462 (class 0 OID 0)
-- Dependencies: 518
-- Name: pndaddress_ad_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('pndaddress_ad_id_seq', 1, false);


--
-- TOC entry 3339 (class 0 OID 51940)
-- Dependencies: 519
-- Data for Name: pndartistskill; Type: TABLE DATA; Schema: pnd; Owner: pnd
--



--
-- TOC entry 3340 (class 0 OID 51943)
-- Dependencies: 520
-- Data for Name: pndcontact; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO pndcontact (ct_id, ct_refid, ct_reftype, ct_name, ct_email, ct_concode) VALUES (2, 3, 'ORG_ID', 'Jeremy', 'dannyfoo@phiorion.com', NULL);
INSERT INTO pndcontact (ct_id, ct_refid, ct_reftype, ct_name, ct_email, ct_concode) VALUES (3, 4, 'ORG_ID', 'Mohamad', 'dannyfoo@phiorion.com', NULL);
INSERT INTO pndcontact (ct_id, ct_refid, ct_reftype, ct_name, ct_email, ct_concode) VALUES (4, 5, 'ORG_ID', 'Justin', 'dannyfoo@phiorion.com', NULL);
INSERT INTO pndcontact (ct_id, ct_refid, ct_reftype, ct_name, ct_email, ct_concode) VALUES (5, 6, 'ORG_ID', 'Alvin', 'dannyfoo@phiorion.com', NULL);
INSERT INTO pndcontact (ct_id, ct_refid, ct_reftype, ct_name, ct_email, ct_concode) VALUES (6, 7, 'ORG_ID', 'Tracy', 'dannyfoo@phiorion.com', NULL);
INSERT INTO pndcontact (ct_id, ct_refid, ct_reftype, ct_name, ct_email, ct_concode) VALUES (1, 10, 'ORG_ID', 'Fong Contact', 'dannyfoo@phiorion.com', 'MY');


--
-- TOC entry 3463 (class 0 OID 0)
-- Dependencies: 521
-- Name: pndcontact_ct_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('pndcontact_ct_id_seq', 6, true);


--
-- TOC entry 3464 (class 0 OID 0)
-- Dependencies: 522
-- Name: pndjoboutput_jo_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('pndjoboutput_jo_id_seq', 111, true);


--
-- TOC entry 3343 (class 0 OID 51950)
-- Dependencies: 523
-- Data for Name: pndphone; Type: TABLE DATA; Schema: pnd; Owner: pnd
--



--
-- TOC entry 3465 (class 0 OID 0)
-- Dependencies: 524
-- Name: pndphone_ph_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('pndphone_ph_id_seq', 1, false);


--
-- TOC entry 2983 (class 2606 OID 52013)
-- Name: const_fcdoc_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcdoc
    ADD CONSTRAINT const_fcdoc_prikey PRIMARY KEY (fd_id);


--
-- TOC entry 2986 (class 2606 OID 52015)
-- Name: const_fcemailsetting_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcemailsetting
    ADD CONSTRAINT const_fcemailsetting_prikey PRIMARY KEY (ms_id);


--
-- TOC entry 2988 (class 2606 OID 52017)
-- Name: const_fclang_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fclang
    ADD CONSTRAINT const_fclang_prikey PRIMARY KEY (lang_code);


--
-- TOC entry 2990 (class 2606 OID 52019)
-- Name: const_fclocale_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fclocale
    ADD CONSTRAINT const_fclocale_prikey PRIMARY KEY (lc_code);


--
-- TOC entry 2992 (class 2606 OID 52021)
-- Name: const_fclocaleholiday_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fclocaleholiday
    ADD CONSTRAINT const_fclocaleholiday_prikey PRIMARY KEY (lch_id);


--
-- TOC entry 2994 (class 2606 OID 52023)
-- Name: const_fclocaleworkinghour_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fclocaleworkinghour
    ADD CONSTRAINT const_fclocaleworkinghour_prikey PRIMARY KEY (lcw_id);


--
-- TOC entry 2996 (class 2606 OID 52025)
-- Name: const_fclocaleworkinghour_unikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fclocaleworkinghour
    ADD CONSTRAINT const_fclocaleworkinghour_unikey UNIQUE (lcw_lccode, lcw_day);


--
-- TOC entry 2998 (class 2606 OID 52027)
-- Name: const_fclog_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fclog
    ADD CONSTRAINT const_fclog_prikey PRIMARY KEY (log_id);


--
-- TOC entry 3010 (class 2606 OID 52029)
-- Name: const_fcpermission_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpermission
    ADD CONSTRAINT const_fcpermission_prikey PRIMARY KEY (pms_code);


--
-- TOC entry 3012 (class 2606 OID 52031)
-- Name: const_fcpmactivity_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpmactivity
    ADD CONSTRAINT const_fcpmactivity_prikey PRIMARY KEY (pmat_id);


--
-- TOC entry 3014 (class 2606 OID 52033)
-- Name: const_fcpmcase_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpmcase
    ADD CONSTRAINT const_fcpmcase_prikey PRIMARY KEY (pmc_id);


--
-- TOC entry 3016 (class 2606 OID 52035)
-- Name: const_fcpmcasecomment_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpmcasecomment
    ADD CONSTRAINT const_fcpmcasecomment_prikey PRIMARY KEY (pmcc_id);


--
-- TOC entry 3018 (class 2606 OID 52037)
-- Name: const_fcpmcasecommentread_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpmcasecommentread
    ADD CONSTRAINT const_fcpmcasecommentread_prikey PRIMARY KEY (pmcr_id);


--
-- TOC entry 3020 (class 2606 OID 52039)
-- Name: const_fcpmcasecommentread_unikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpmcasecommentread
    ADD CONSTRAINT const_fcpmcasecommentread_unikey UNIQUE (pmcr_pmccid, pmcr_read_by);


--
-- TOC entry 3022 (class 2606 OID 52041)
-- Name: const_fcpmcaseflag_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpmcaseflag
    ADD CONSTRAINT const_fcpmcaseflag_prikey PRIMARY KEY (pmcf_id);


--
-- TOC entry 3024 (class 2606 OID 52043)
-- Name: const_fcpmcaseflag_unikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpmcaseflag
    ADD CONSTRAINT const_fcpmcaseflag_unikey UNIQUE (pmcf_pmcid, pmcf_flag_by);


--
-- TOC entry 3026 (class 2606 OID 52045)
-- Name: const_fcpmcaseflow_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpmcaseflow
    ADD CONSTRAINT const_fcpmcaseflow_prikey PRIMARY KEY (pmf_id);


--
-- TOC entry 3032 (class 2606 OID 52047)
-- Name: const_fcpmcaseflowassign_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpmcaseflowassign
    ADD CONSTRAINT const_fcpmcaseflowassign_prikey PRIMARY KEY (pmfa_id);


--
-- TOC entry 3035 (class 2606 OID 52049)
-- Name: const_fcpmcasetype_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpmcasetype
    ADD CONSTRAINT const_fcpmcasetype_prikey PRIMARY KEY (pmct_code);


--
-- TOC entry 3037 (class 2606 OID 52051)
-- Name: const_fcpmconnector_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpmconnector
    ADD CONSTRAINT const_fcpmconnector_prikey PRIMARY KEY (pmcn_id);


--
-- TOC entry 3039 (class 2606 OID 52053)
-- Name: const_fcpmconnector_unikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpmconnector
    ADD CONSTRAINT const_fcpmconnector_unikey UNIQUE (pmcn_from_type, pmcn_from_id, pmcn_to_type, pmcn_to_id);


--
-- TOC entry 3041 (class 2606 OID 52055)
-- Name: const_fcpmevent_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpmevent
    ADD CONSTRAINT const_fcpmevent_prikey PRIMARY KEY (pmev_id);


--
-- TOC entry 3043 (class 2606 OID 52057)
-- Name: const_fcpmgateway_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpmgateway
    ADD CONSTRAINT const_fcpmgateway_prikey PRIMARY KEY (pmgw_id);


--
-- TOC entry 3045 (class 2606 OID 52059)
-- Name: const_fcpmswimlane_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpmswimlane
    ADD CONSTRAINT const_fcpmswimlane_prikey PRIMARY KEY (pmsl_id);


--
-- TOC entry 3047 (class 2606 OID 52061)
-- Name: const_fcpmswimlanesetup_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpmswimlanesetup
    ADD CONSTRAINT const_fcpmswimlanesetup_prikey PRIMARY KEY (pmss_id);


--
-- TOC entry 3050 (class 2606 OID 52063)
-- Name: const_fcpmworkflow_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpmworkflow
    ADD CONSTRAINT const_fcpmworkflow_prikey PRIMARY KEY (pmwf_id);


--
-- TOC entry 3058 (class 2606 OID 52065)
-- Name: const_fcrule_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcrule
    ADD CONSTRAINT const_fcrule_prikey PRIMARY KEY (ru_id);


--
-- TOC entry 3065 (class 2606 OID 52067)
-- Name: const_fcudv_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcudv
    ADD CONSTRAINT const_fcudv_prikey PRIMARY KEY (udv_code);


--
-- TOC entry 3069 (class 2606 OID 52069)
-- Name: const_fcuserdiary_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcuserdiary
    ADD CONSTRAINT const_fcuserdiary_prikey PRIMARY KEY (di_id);


--
-- TOC entry 3000 (class 2606 OID 52071)
-- Name: const_hlookup_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fclookup
    ADD CONSTRAINT const_hlookup_prikey PRIMARY KEY (lu_id);


--
-- TOC entry 3002 (class 2606 OID 52073)
-- Name: const_hlookup_unikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fclookup
    ADD CONSTRAINT const_hlookup_unikey UNIQUE (lu_cat, lu_code);


--
-- TOC entry 3082 (class 2606 OID 52075)
-- Name: const_martistskill_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY martistskill
    ADD CONSTRAINT const_martistskill_prikey PRIMARY KEY (ma_id);


--
-- TOC entry 3086 (class 2606 OID 52077)
-- Name: const_mcarton_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY mcarton
    ADD CONSTRAINT const_mcarton_prikey PRIMARY KEY (car_id);


--
-- TOC entry 3088 (class 2606 OID 52079)
-- Name: const_mcustmachine_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY mcustmachine_old
    ADD CONSTRAINT const_mcustmachine_prikey PRIMARY KEY (mc_id);


--
-- TOC entry 3090 (class 2606 OID 52081)
-- Name: const_mcustprinter_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY mcustprinter
    ADD CONSTRAINT const_mcustprinter_prikey PRIMARY KEY (cp_id);


--
-- TOC entry 3092 (class 2606 OID 52083)
-- Name: const_mjobbarcode_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY mjobbarcode
    ADD CONSTRAINT const_mjobbarcode_prikey PRIMARY KEY (jbc_id);


--
-- TOC entry 3094 (class 2606 OID 52085)
-- Name: const_mjobcat_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY mjobcat
    ADD CONSTRAINT const_mjobcat_prikey PRIMARY KEY (jc_id);


--
-- TOC entry 3099 (class 2606 OID 52087)
-- Name: const_mjoboutput_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY mjoboutput
    ADD CONSTRAINT const_mjoboutput_prikey PRIMARY KEY (jo_id);


--
-- TOC entry 3102 (class 2606 OID 52089)
-- Name: const_mjoboutputlookup_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY mjoboutputlookup
    ADD CONSTRAINT const_mjoboutputlookup_prikey PRIMARY KEY (jol_id);


--
-- TOC entry 3104 (class 2606 OID 52091)
-- Name: const_mjobsheet_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY mjobsheet
    ADD CONSTRAINT const_mjobsheet_prikey PRIMARY KEY (js_id);


--
-- TOC entry 3110 (class 2606 OID 52093)
-- Name: const_mjscartonvalue_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY mjscartonvalue
    ADD CONSTRAINT const_mjscartonvalue_prikey PRIMARY KEY (caval_id);


--
-- TOC entry 3113 (class 2606 OID 52095)
-- Name: const_mmailtemplate_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY mmailtemplate
    ADD CONSTRAINT const_mmailtemplate_prikey PRIMARY KEY (mt_code);


--
-- TOC entry 3084 (class 2606 OID 52097)
-- Name: const_mmbarcodetype_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY mbarcodetype
    ADD CONSTRAINT const_mmbarcodetype_prikey PRIMARY KEY (bt_code);


--
-- TOC entry 3115 (class 2606 OID 52099)
-- Name: const_mtnc_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY mtnc
    ADD CONSTRAINT const_mtnc_prikey PRIMARY KEY (tc_id);


--
-- TOC entry 3117 (class 2606 OID 52101)
-- Name: const_mtncacceptance_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY mtncacceptance
    ADD CONSTRAINT const_mtncacceptance_prikey PRIMARY KEY (tca_tcid, tca_userid);


--
-- TOC entry 3120 (class 2606 OID 52103)
-- Name: const_pndcontact_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY pndcontact
    ADD CONSTRAINT const_pndcontact_prikey PRIMARY KEY (ct_id);


--
-- TOC entry 3004 (class 2606 OID 52105)
-- Name: const_vmenu_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcmenu
    ADD CONSTRAINT const_vmenu_prikey PRIMARY KEY (mn_id);


--
-- TOC entry 3006 (class 2606 OID 52107)
-- Name: const_vmenu_unikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcmenu
    ADD CONSTRAINT const_vmenu_unikey UNIQUE (mn_code);


--
-- TOC entry 3008 (class 2606 OID 52109)
-- Name: const_vorg_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcorg
    ADD CONSTRAINT const_vorg_prikey PRIMARY KEY (org_id);


--
-- TOC entry 3052 (class 2606 OID 52111)
-- Name: const_vrole_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcrole
    ADD CONSTRAINT const_vrole_prikey PRIMARY KEY (rol_id);


--
-- TOC entry 3054 (class 2606 OID 52113)
-- Name: const_vroleperm_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcroleperm
    ADD CONSTRAINT const_vroleperm_prikey PRIMARY KEY (rp_id);


--
-- TOC entry 3056 (class 2606 OID 52115)
-- Name: const_vroleperm_unikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcroleperm
    ADD CONSTRAINT const_vroleperm_unikey UNIQUE (rp_rolid, rp_pmscode);


--
-- TOC entry 3060 (class 2606 OID 52117)
-- Name: const_vsetting_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcsetting
    ADD CONSTRAINT const_vsetting_prikey PRIMARY KEY (set_id);


--
-- TOC entry 3062 (class 2606 OID 52119)
-- Name: const_vsetting_unikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcsetting
    ADD CONSTRAINT const_vsetting_unikey UNIQUE (set_user, set_code);


--
-- TOC entry 3067 (class 2606 OID 52121)
-- Name: const_vuser_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcuser
    ADD CONSTRAINT const_vuser_prikey PRIMARY KEY (usr_userid);


--
-- TOC entry 3072 (class 2606 OID 52123)
-- Name: const_vuserlogin_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcuserlogin
    ADD CONSTRAINT const_vuserlogin_prikey PRIMARY KEY (ul_id);


--
-- TOC entry 3074 (class 2606 OID 52125)
-- Name: const_vuserorgrole_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcuserorgrole
    ADD CONSTRAINT const_vuserorgrole_prikey PRIMARY KEY (uor_id);


--
-- TOC entry 3076 (class 2606 OID 52127)
-- Name: const_vuserorgrole_unikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcuserorgrole
    ADD CONSTRAINT const_vuserorgrole_unikey UNIQUE (uor_usrid, uor_orgid, uor_rolid);


--
-- TOC entry 3078 (class 2606 OID 52129)
-- Name: const_vusersession_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcusersession
    ADD CONSTRAINT const_vusersession_prikey PRIMARY KEY (us_id);


--
-- TOC entry 3097 (class 2606 OID 52131)
-- Name: cont_mjobcatlookup_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY mjobcatlookup
    ADD CONSTRAINT cont_mjobcatlookup_prikey PRIMARY KEY (jcl_id);


--
-- TOC entry 2981 (class 2606 OID 52133)
-- Name: country_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fccountry
    ADD CONSTRAINT country_prikey PRIMARY KEY (con_code);


--
-- TOC entry 3111 (class 1259 OID 52134)
-- Name: idx_carvalue_jsid; Type: INDEX; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE INDEX idx_carvalue_jsid ON mjscartonvalue USING btree (carval_jsid);


--
-- TOC entry 3027 (class 1259 OID 52135)
-- Name: idx_caseflow_duedate; Type: INDEX; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE INDEX idx_caseflow_duedate ON fcpmcaseflow USING btree (pmf_end_date, pmf_timer_due_date);


--
-- TOC entry 3028 (class 1259 OID 52136)
-- Name: idx_caseflow_endby; Type: INDEX; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE INDEX idx_caseflow_endby ON fcpmcaseflow USING btree (pmf_end_by);


--
-- TOC entry 3029 (class 1259 OID 52137)
-- Name: idx_caseflow_objid_objtype; Type: INDEX; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE INDEX idx_caseflow_objid_objtype ON fcpmcaseflow USING btree (pmf_obj_id, pmf_obj_type);


--
-- TOC entry 3030 (class 1259 OID 52138)
-- Name: idx_caseflow_startdate; Type: INDEX; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE INDEX idx_caseflow_startdate ON fcpmcaseflow USING btree (pmf_start_date);


--
-- TOC entry 3033 (class 1259 OID 52139)
-- Name: idx_caseflowassign_userid_orgid_rolid_pmscode; Type: INDEX; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE INDEX idx_caseflowassign_userid_orgid_rolid_pmscode ON fcpmcaseflowassign USING btree (pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode);


--
-- TOC entry 3070 (class 1259 OID 52140)
-- Name: idx_cat_userid_status; Type: INDEX; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE INDEX idx_cat_userid_status ON fcuserdiary USING btree (di_cat, di_userid, di_status);


--
-- TOC entry 2984 (class 1259 OID 52141)
-- Name: idx_doc_refid_reftype; Type: INDEX; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE INDEX idx_doc_refid_reftype ON fcdoc USING btree (fd_refid, fd_reftype);


--
-- TOC entry 3095 (class 1259 OID 52142)
-- Name: idx_jobcat_jsid; Type: INDEX; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE INDEX idx_jobcat_jsid ON mjobcat USING btree (jc_jsid);


--
-- TOC entry 3100 (class 1259 OID 52143)
-- Name: idx_joboutput_jsid; Type: INDEX; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE INDEX idx_joboutput_jsid ON mjoboutput USING btree (jo_jsid);


--
-- TOC entry 3105 (class 1259 OID 52144)
-- Name: idx_jobsheet_jobcode; Type: INDEX; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE UNIQUE INDEX idx_jobsheet_jobcode ON mjobsheet USING btree (js_code);


--
-- TOC entry 3106 (class 1259 OID 52145)
-- Name: idx_jobsheet_primcat; Type: INDEX; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE INDEX idx_jobsheet_primcat ON mjobsheet USING btree (js_primcat);


--
-- TOC entry 3107 (class 1259 OID 52146)
-- Name: idx_jobsheet_requestdate; Type: INDEX; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE INDEX idx_jobsheet_requestdate ON mjobsheet USING btree (js_request_date, js_request_dateinmth, js_primcat);


--
-- TOC entry 3108 (class 1259 OID 52147)
-- Name: idx_jobsheet_status; Type: INDEX; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE INDEX idx_jobsheet_status ON mjobsheet USING btree (js_status);


--
-- TOC entry 3118 (class 1259 OID 52148)
-- Name: idx_mtncacceptance_userid; Type: INDEX; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE INDEX idx_mtncacceptance_userid ON mtncacceptance USING btree (tca_userid);


--
-- TOC entry 3048 (class 1259 OID 52149)
-- Name: idx_swimlane_userid_orgid_rolid_pmscode; Type: INDEX; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE INDEX idx_swimlane_userid_orgid_rolid_pmscode ON fcpmswimlanesetup USING btree (pmss_userid, pmss_orgid, pmss_rolid, pmss_pmscode);


--
-- TOC entry 3063 (class 1259 OID 52150)
-- Name: idx_vsetting_code_user; Type: INDEX; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE UNIQUE INDEX idx_vsetting_code_user ON fcsetting USING btree (set_user, set_code);


--
-- TOC entry 3079 (class 1259 OID 52151)
-- Name: usersession_idx1; Type: INDEX; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE INDEX usersession_idx1 ON fcusersession USING btree (us_sessid);


--
-- TOC entry 3080 (class 1259 OID 52152)
-- Name: usersession_idx2; Type: INDEX; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE INDEX usersession_idx2 ON fcusersession USING btree (us_userid);


--
-- TOC entry 3121 (class 2620 OID 52153)
-- Name: mjobsheet_upd_trig; Type: TRIGGER; Schema: pnd; Owner: pnd
--

CREATE TRIGGER mjobsheet_upd_trig BEFORE INSERT ON mjobsheet FOR EACH ROW EXECUTE PROCEDURE update_requestdate();


-- Completed on 2014-07-09 16:44:14

--
-- PostgreSQL database dump complete
--

