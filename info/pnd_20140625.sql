--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.4
-- Dumped by pg_dump version 9.3.4
-- Started on 2014-06-25 20:58:42

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 6 (class 2615 OID 50162)
-- Name: pnd; Type: SCHEMA; Schema: -; Owner: pnd
--

CREATE SCHEMA pnd;


ALTER SCHEMA pnd OWNER TO pnd;

SET search_path = pnd, pg_catalog;

--
-- TOC entry 414 (class 1255 OID 50165)
-- Name: cleanqueue(); Type: FUNCTION; Schema: pnd; Owner: pnd
--

CREATE FUNCTION cleanqueue() RETURNS void
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
    
END;
$$;


ALTER FUNCTION pnd.cleanqueue() OWNER TO pnd;

--
-- TOC entry 428 (class 1255 OID 51454)
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

    -- clean up user
    
    
END;
$$;


ALTER FUNCTION pnd.cleanup() OWNER TO pnd;

--
-- TOC entry 421 (class 1255 OID 50166)
-- Name: date_to_char(timestamp without time zone); Type: FUNCTION; Schema: pnd; Owner: pnd
--

CREATE FUNCTION date_to_char(timefield timestamp without time zone) RETURNS text
    LANGUAGE sql IMMUTABLE
    AS $_$
    select to_char($1, 'Mon-YYYY');
$_$;


ALTER FUNCTION pnd.date_to_char(timefield timestamp without time zone) OWNER TO pnd;

--
-- TOC entry 422 (class 1255 OID 50167)
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
-- TOC entry 423 (class 1255 OID 50168)
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
-- TOC entry 427 (class 1255 OID 51445)
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
-- TOC entry 424 (class 1255 OID 50170)
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
-- TOC entry 173 (class 1259 OID 50173)
-- Name: fccountry; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE fccountry (
    con_code character varying(24) NOT NULL,
    con_name character varying(1000)
);


ALTER TABLE pnd.fccountry OWNER TO pnd;

--
-- TOC entry 174 (class 1259 OID 50179)
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
-- TOC entry 175 (class 1259 OID 50186)
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
-- TOC entry 2970 (class 0 OID 0)
-- Dependencies: 175
-- Name: fcdoc_fd_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcdoc_fd_id_seq OWNED BY fcdoc.fd_id;


--
-- TOC entry 403 (class 1259 OID 51488)
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
-- TOC entry 2971 (class 0 OID 0)
-- Dependencies: 403
-- Name: COLUMN fcemailsetting.ms_type; Type: COMMENT; Schema: pnd; Owner: pnd
--

COMMENT ON COLUMN fcemailsetting.ms_type IS 'MAILOUT = send out
MAILIN = receive';


--
-- TOC entry 402 (class 1259 OID 51486)
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
-- TOC entry 2972 (class 0 OID 0)
-- Dependencies: 402
-- Name: fcemailsetting_ms_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcemailsetting_ms_id_seq OWNED BY fcemailsetting.ms_id;


--
-- TOC entry 176 (class 1259 OID 50188)
-- Name: fclang; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE fclang (
    lang_code character varying(5) NOT NULL,
    lang_name character varying(200),
    lang_status character varying(12) DEFAULT 'ACTIVE'::character varying
);


ALTER TABLE pnd.fclang OWNER TO pnd;

--
-- TOC entry 2973 (class 0 OID 0)
-- Dependencies: 176
-- Name: TABLE fclang; Type: COMMENT; Schema: pnd; Owner: pnd
--

COMMENT ON TABLE fclang IS 'ISO 639-1';


--
-- TOC entry 177 (class 1259 OID 50192)
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
-- TOC entry 178 (class 1259 OID 50195)
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
-- TOC entry 179 (class 1259 OID 50199)
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
-- TOC entry 2974 (class 0 OID 0)
-- Dependencies: 179
-- Name: fclocaleholiday_lch_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fclocaleholiday_lch_id_seq OWNED BY fclocaleholiday.lch_id;


--
-- TOC entry 180 (class 1259 OID 50201)
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
-- TOC entry 181 (class 1259 OID 50204)
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
-- TOC entry 2975 (class 0 OID 0)
-- Dependencies: 181
-- Name: fclocaleworkinghour_lcw_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fclocaleworkinghour_lcw_id_seq OWNED BY fclocaleworkinghour.lcw_id;


--
-- TOC entry 182 (class 1259 OID 50206)
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
-- TOC entry 183 (class 1259 OID 50213)
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
-- TOC entry 2976 (class 0 OID 0)
-- Dependencies: 183
-- Name: fclog_log_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fclog_log_id_seq OWNED BY fclog.log_id;


--
-- TOC entry 184 (class 1259 OID 50215)
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
-- TOC entry 185 (class 1259 OID 50220)
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
-- TOC entry 2977 (class 0 OID 0)
-- Dependencies: 185
-- Name: fclookup_lu_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fclookup_lu_id_seq OWNED BY fclookup.lu_id;


--
-- TOC entry 186 (class 1259 OID 50222)
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
    mn_pmscode character varying(50),
    mn_icon_class character varying(100)
);


ALTER TABLE pnd.fcmenu OWNER TO shine;

--
-- TOC entry 187 (class 1259 OID 50229)
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
-- TOC entry 2978 (class 0 OID 0)
-- Dependencies: 187
-- Name: fcmenu_mn_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: shine
--

ALTER SEQUENCE fcmenu_mn_id_seq OWNED BY fcmenu.mn_id;


--
-- TOC entry 188 (class 1259 OID 50231)
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
-- TOC entry 2979 (class 0 OID 0)
-- Dependencies: 188
-- Name: fcmenu_mn_parentid_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: shine
--

ALTER SEQUENCE fcmenu_mn_parentid_seq OWNED BY fcmenu.mn_parentid;


--
-- TOC entry 189 (class 1259 OID 50233)
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
-- TOC entry 2980 (class 0 OID 0)
-- Dependencies: 189
-- Name: COLUMN fcorg.org_lccode; Type: COMMENT; Schema: pnd; Owner: pnd
--

COMMENT ON COLUMN fcorg.org_lccode IS 'Locale';


--
-- TOC entry 190 (class 1259 OID 50242)
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
-- TOC entry 2981 (class 0 OID 0)
-- Dependencies: 190
-- Name: fcorg_org_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcorg_org_id_seq OWNED BY fcorg.org_id;


--
-- TOC entry 191 (class 1259 OID 50244)
-- Name: fcpermission; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE fcpermission (
    pms_code character varying(50) NOT NULL,
    pms_desc character varying(2000)
);


ALTER TABLE pnd.fcpermission OWNER TO pnd;

--
-- TOC entry 192 (class 1259 OID 50250)
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
-- TOC entry 193 (class 1259 OID 50252)
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
-- TOC entry 2982 (class 0 OID 0)
-- Dependencies: 193
-- Name: COLUMN fcpmactivity.pmat_sla_interval; Type: COMMENT; Schema: pnd; Owner: pnd
--

COMMENT ON COLUMN fcpmactivity.pmat_sla_interval IS 'format follow PHP DateInterval interval_spec';


--
-- TOC entry 194 (class 1259 OID 50258)
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
-- TOC entry 195 (class 1259 OID 50262)
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
-- TOC entry 2983 (class 0 OID 0)
-- Dependencies: 195
-- Name: fcpmcase_pmc_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcpmcase_pmc_id_seq OWNED BY fcpmcase.pmc_id;


--
-- TOC entry 196 (class 1259 OID 50264)
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
-- TOC entry 197 (class 1259 OID 50272)
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
-- TOC entry 2984 (class 0 OID 0)
-- Dependencies: 197
-- Name: fcpmcasecomment_pmcc_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcpmcasecomment_pmcc_id_seq OWNED BY fcpmcasecomment.pmcc_id;


--
-- TOC entry 198 (class 1259 OID 50274)
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
-- TOC entry 199 (class 1259 OID 50278)
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
-- TOC entry 2985 (class 0 OID 0)
-- Dependencies: 199
-- Name: fcpmcasecommentread_pmcr_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcpmcasecommentread_pmcr_id_seq OWNED BY fcpmcasecommentread.pmcr_id;


--
-- TOC entry 200 (class 1259 OID 50280)
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
-- TOC entry 201 (class 1259 OID 50284)
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
-- TOC entry 2986 (class 0 OID 0)
-- Dependencies: 201
-- Name: fcpmcaseflag_pmcf_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcpmcaseflag_pmcf_id_seq OWNED BY fcpmcaseflag.pmcf_id;


--
-- TOC entry 202 (class 1259 OID 50286)
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
-- TOC entry 2987 (class 0 OID 0)
-- Dependencies: 202
-- Name: COLUMN fcpmcaseflow.pmf_from_event_gateway; Type: COMMENT; Schema: pnd; Owner: pnd
--

COMMENT ON COLUMN fcpmcaseflow.pmf_from_event_gateway IS 'Last flow is an event gateway';


--
-- TOC entry 203 (class 1259 OID 50290)
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
-- TOC entry 2988 (class 0 OID 0)
-- Dependencies: 203
-- Name: fcpmcaseflow_pmf_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcpmcaseflow_pmf_id_seq OWNED BY fcpmcaseflow.pmf_id;


--
-- TOC entry 204 (class 1259 OID 50292)
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
-- TOC entry 205 (class 1259 OID 50295)
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
-- TOC entry 2989 (class 0 OID 0)
-- Dependencies: 205
-- Name: fcpmcaseflowassign_pmfa_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcpmcaseflowassign_pmfa_id_seq OWNED BY fcpmcaseflowassign.pmfa_id;


--
-- TOC entry 206 (class 1259 OID 50297)
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
-- TOC entry 207 (class 1259 OID 50303)
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
-- TOC entry 208 (class 1259 OID 50306)
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
-- TOC entry 2990 (class 0 OID 0)
-- Dependencies: 208
-- Name: fcpmconnector_pmcn_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcpmconnector_pmcn_id_seq OWNED BY fcpmconnector.pmcn_id;


--
-- TOC entry 209 (class 1259 OID 50308)
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
-- TOC entry 2991 (class 0 OID 0)
-- Dependencies: 209
-- Name: COLUMN fcpmevent.pmev_attach_pmatid; Type: COMMENT; Schema: pnd; Owner: pnd
--

COMMENT ON COLUMN fcpmevent.pmev_attach_pmatid IS 'if event is attached to a activity';


--
-- TOC entry 210 (class 1259 OID 50313)
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
-- TOC entry 2992 (class 0 OID 0)
-- Dependencies: 210
-- Name: fcpmevent_pmev_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcpmevent_pmev_id_seq OWNED BY fcpmevent.pmev_id;


--
-- TOC entry 211 (class 1259 OID 50315)
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
-- TOC entry 212 (class 1259 OID 50318)
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
-- TOC entry 2993 (class 0 OID 0)
-- Dependencies: 212
-- Name: fcpmgateway_pmgw_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcpmgateway_pmgw_id_seq OWNED BY fcpmgateway.pmgw_id;


--
-- TOC entry 213 (class 1259 OID 50320)
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
-- TOC entry 214 (class 1259 OID 50323)
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
-- TOC entry 2994 (class 0 OID 0)
-- Dependencies: 214
-- Name: fcpmswimlane_pmsl_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcpmswimlane_pmsl_id_seq OWNED BY fcpmswimlane.pmsl_id;


--
-- TOC entry 215 (class 1259 OID 50325)
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
-- TOC entry 216 (class 1259 OID 50328)
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
-- TOC entry 2995 (class 0 OID 0)
-- Dependencies: 216
-- Name: fcpmswimlanesetup_pmss_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcpmswimlanesetup_pmss_id_seq OWNED BY fcpmswimlanesetup.pmss_id;


--
-- TOC entry 217 (class 1259 OID 50330)
-- Name: fcpmworkflow; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE fcpmworkflow (
    pmwf_id integer NOT NULL,
    pmwf_name character varying(100)
);


ALTER TABLE pnd.fcpmworkflow OWNER TO pnd;

--
-- TOC entry 218 (class 1259 OID 50333)
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
-- TOC entry 2996 (class 0 OID 0)
-- Dependencies: 218
-- Name: fcpmworkflow_pmwf_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcpmworkflow_pmwf_id_seq OWNED BY fcpmworkflow.pmwf_id;


--
-- TOC entry 219 (class 1259 OID 50335)
-- Name: fcrole; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE fcrole (
    rol_id integer NOT NULL,
    rol_name character varying(2000)
);


ALTER TABLE pnd.fcrole OWNER TO pnd;

--
-- TOC entry 220 (class 1259 OID 50341)
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
-- TOC entry 2997 (class 0 OID 0)
-- Dependencies: 220
-- Name: fcrole_rol_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcrole_rol_id_seq OWNED BY fcrole.rol_id;


--
-- TOC entry 221 (class 1259 OID 50343)
-- Name: fcroleperm; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE fcroleperm (
    rp_id integer NOT NULL,
    rp_rolid integer,
    rp_pmscode character varying(50)
);


ALTER TABLE pnd.fcroleperm OWNER TO pnd;

--
-- TOC entry 222 (class 1259 OID 50346)
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
-- TOC entry 2998 (class 0 OID 0)
-- Dependencies: 222
-- Name: fcroleperm_rp_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcroleperm_rp_id_seq OWNED BY fcroleperm.rp_id;


--
-- TOC entry 223 (class 1259 OID 50348)
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
-- TOC entry 224 (class 1259 OID 50354)
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
-- TOC entry 2999 (class 0 OID 0)
-- Dependencies: 224
-- Name: fcrule_ru_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcrule_ru_id_seq OWNED BY fcrule.ru_id;


--
-- TOC entry 225 (class 1259 OID 50356)
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
-- TOC entry 3000 (class 0 OID 0)
-- Dependencies: 225
-- Name: COLUMN fcsetting.set_id; Type: COMMENT; Schema: pnd; Owner: pnd
--

COMMENT ON COLUMN fcsetting.set_id IS 'setting id';


--
-- TOC entry 3001 (class 0 OID 0)
-- Dependencies: 225
-- Name: COLUMN fcsetting.set_description; Type: COMMENT; Schema: pnd; Owner: pnd
--

COMMENT ON COLUMN fcsetting.set_description IS 'setting description';


--
-- TOC entry 3002 (class 0 OID 0)
-- Dependencies: 225
-- Name: COLUMN fcsetting.set_val; Type: COMMENT; Schema: pnd; Owner: pnd
--

COMMENT ON COLUMN fcsetting.set_val IS 'setting value';


--
-- TOC entry 226 (class 1259 OID 50363)
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
-- TOC entry 3003 (class 0 OID 0)
-- Dependencies: 226
-- Name: fcsetting_set_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcsetting_set_id_seq OWNED BY fcsetting.set_id;


--
-- TOC entry 227 (class 1259 OID 50365)
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
-- TOC entry 228 (class 1259 OID 50372)
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
-- TOC entry 229 (class 1259 OID 50380)
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
-- TOC entry 230 (class 1259 OID 50390)
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
-- TOC entry 3004 (class 0 OID 0)
-- Dependencies: 230
-- Name: fcuserdiary_di_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcuserdiary_di_id_seq OWNED BY fcuserdiary.di_id;


--
-- TOC entry 231 (class 1259 OID 50392)
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
-- TOC entry 232 (class 1259 OID 50398)
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
-- TOC entry 3005 (class 0 OID 0)
-- Dependencies: 232
-- Name: fcuserlogin_ul_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcuserlogin_ul_id_seq OWNED BY fcuserlogin.ul_id;


--
-- TOC entry 233 (class 1259 OID 50400)
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
-- TOC entry 234 (class 1259 OID 50403)
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
-- TOC entry 3006 (class 0 OID 0)
-- Dependencies: 234
-- Name: fcuserorgrole_uor_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcuserorgrole_uor_id_seq OWNED BY fcuserorgrole.uor_id;


--
-- TOC entry 235 (class 1259 OID 50405)
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
-- TOC entry 3007 (class 0 OID 0)
-- Dependencies: 235
-- Name: COLUMN fcusersession.us_sessid; Type: COMMENT; Schema: pnd; Owner: pnd
--

COMMENT ON COLUMN fcusersession.us_sessid IS 'PHP session id';


--
-- TOC entry 236 (class 1259 OID 50411)
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
-- TOC entry 3008 (class 0 OID 0)
-- Dependencies: 236
-- Name: fcusersession_us_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcusersession_us_id_seq OWNED BY fcusersession.us_id;


--
-- TOC entry 237 (class 1259 OID 50413)
-- Name: martistskill; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE martistskill (
    ma_id integer NOT NULL,
    ma_usruserid character varying(50),
    ma_jclid integer
);


ALTER TABLE pnd.martistskill OWNER TO pnd;

--
-- TOC entry 3009 (class 0 OID 0)
-- Dependencies: 237
-- Name: COLUMN martistskill.ma_jclid; Type: COMMENT; Schema: pnd; Owner: pnd
--

COMMENT ON COLUMN martistskill.ma_jclid IS 'foreign key to mjobcatlookup';


--
-- TOC entry 238 (class 1259 OID 50416)
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
-- TOC entry 3010 (class 0 OID 0)
-- Dependencies: 238
-- Name: martistskill_ma_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE martistskill_ma_id_seq OWNED BY martistskill.ma_id;


--
-- TOC entry 404 (class 1259 OID 51503)
-- Name: mbarcodetype; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE mbarcodetype (
    bt_code character varying(50) NOT NULL,
    bt_name character varying(200),
    bt_format character varying(50)
);


ALTER TABLE pnd.mbarcodetype OWNER TO pnd;

--
-- TOC entry 239 (class 1259 OID 50418)
-- Name: mcarton; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE mcarton (
    car_id integer NOT NULL,
    car_name character varying(200),
    car_status character varying(32) DEFAULT 'ACTIVE'::character varying
);


ALTER TABLE pnd.mcarton OWNER TO pnd;

--
-- TOC entry 240 (class 1259 OID 50421)
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
-- TOC entry 3011 (class 0 OID 0)
-- Dependencies: 240
-- Name: mcarton_car_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE mcarton_car_id_seq OWNED BY mcarton.car_id;


--
-- TOC entry 241 (class 1259 OID 50423)
-- Name: mcartonvariable; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE mcartonvariable (
    carv_code character varying(12),
    carv_unit character varying(12),
    carv_carid integer
);


ALTER TABLE pnd.mcartonvariable OWNER TO pnd;

--
-- TOC entry 3012 (class 0 OID 0)
-- Dependencies: 241
-- Name: COLUMN mcartonvariable.carv_carid; Type: COMMENT; Schema: pnd; Owner: pnd
--

COMMENT ON COLUMN mcartonvariable.carv_carid IS 'foreign key to mcarton car_id';


--
-- TOC entry 242 (class 1259 OID 50426)
-- Name: mcustmachine; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE mcustmachine (
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


ALTER TABLE pnd.mcustmachine OWNER TO pnd;

--
-- TOC entry 243 (class 1259 OID 50432)
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
-- TOC entry 3013 (class 0 OID 0)
-- Dependencies: 243
-- Name: mcustmachine_mc_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE mcustmachine_mc_id_seq OWNED BY mcustmachine.mc_id;


--
-- TOC entry 406 (class 1259 OID 51510)
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
-- TOC entry 405 (class 1259 OID 51508)
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
-- TOC entry 3014 (class 0 OID 0)
-- Dependencies: 405
-- Name: mjobbarcode_jbc_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE mjobbarcode_jbc_id_seq OWNED BY mjobbarcode.jbc_id;


--
-- TOC entry 244 (class 1259 OID 50434)
-- Name: mjobcat; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE mjobcat (
    jc_id integer NOT NULL,
    jc_jsid integer,
    jc_jclid integer
);


ALTER TABLE pnd.mjobcat OWNER TO pnd;

--
-- TOC entry 245 (class 1259 OID 50437)
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
-- TOC entry 3015 (class 0 OID 0)
-- Dependencies: 245
-- Name: mjobcat_jc_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE mjobcat_jc_id_seq OWNED BY mjobcat.jc_id;


--
-- TOC entry 246 (class 1259 OID 50439)
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
    jcl_status character varying(32) DEFAULT 'ACTIVE'::character varying
);


ALTER TABLE pnd.mjobcatlookup OWNER TO pnd;

--
-- TOC entry 247 (class 1259 OID 50442)
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
-- TOC entry 3016 (class 0 OID 0)
-- Dependencies: 247
-- Name: mjobcatlookup_jcl_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE mjobcatlookup_jcl_id_seq OWNED BY mjobcatlookup.jcl_id;


--
-- TOC entry 248 (class 1259 OID 50444)
-- Name: mjoboutput; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE mjoboutput (
    jo_id integer NOT NULL,
    jo_jsid integer,
    jo_outputcode character varying(50)
);


ALTER TABLE pnd.mjoboutput OWNER TO pnd;

--
-- TOC entry 401 (class 1259 OID 51479)
-- Name: mjoboutputlookup; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE mjoboutputlookup (
    jol_id integer NOT NULL,
    jol_title character varying(200),
    jol_requiredtime integer,
    jol_status character varying(32) DEFAULT 'ACTIVE'::character varying
);


ALTER TABLE pnd.mjoboutputlookup OWNER TO pnd;

--
-- TOC entry 400 (class 1259 OID 51477)
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
-- TOC entry 3017 (class 0 OID 0)
-- Dependencies: 400
-- Name: mjoboutputlookup_jol_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE mjoboutputlookup_jol_id_seq OWNED BY mjoboutputlookup.jol_id;


--
-- TOC entry 249 (class 1259 OID 50447)
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
    js_month_occur integer
);


ALTER TABLE pnd.mjobsheet OWNER TO pnd;

--
-- TOC entry 3018 (class 0 OID 0)
-- Dependencies: 249
-- Name: COLUMN mjobsheet.js_primcat; Type: COMMENT; Schema: pnd; Owner: pnd
--

COMMENT ON COLUMN mjobsheet.js_primcat IS 'primary job category';


--
-- TOC entry 250 (class 1259 OID 50455)
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
-- TOC entry 3019 (class 0 OID 0)
-- Dependencies: 250
-- Name: mjobsheet_js_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE mjobsheet_js_id_seq OWNED BY mjobsheet.js_id;


--
-- TOC entry 251 (class 1259 OID 50457)
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
-- TOC entry 252 (class 1259 OID 50460)
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
-- TOC entry 3020 (class 0 OID 0)
-- Dependencies: 252
-- Name: mjscartonvalue_caval_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE mjscartonvalue_caval_id_seq OWNED BY mjscartonvalue.caval_id;


--
-- TOC entry 253 (class 1259 OID 50462)
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
-- TOC entry 398 (class 1259 OID 51423)
-- Name: mtnc; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE mtnc (
    tc_id integer NOT NULL,
    tc_text text
);


ALTER TABLE pnd.mtnc OWNER TO pnd;

--
-- TOC entry 397 (class 1259 OID 51421)
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
-- TOC entry 3021 (class 0 OID 0)
-- Dependencies: 397
-- Name: mtnc_tc_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE mtnc_tc_id_seq OWNED BY mtnc.tc_id;


--
-- TOC entry 399 (class 1259 OID 51432)
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
-- TOC entry 254 (class 1259 OID 50469)
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
-- TOC entry 255 (class 1259 OID 50477)
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
-- TOC entry 3022 (class 0 OID 0)
-- Dependencies: 255
-- Name: pndaddress_ad_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE pndaddress_ad_id_seq OWNED BY pndaddress.ad_id;


--
-- TOC entry 256 (class 1259 OID 50479)
-- Name: pndartistskill; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE pndartistskill (
    as_userid character varying(50),
    as_skill character varying(50)
);


ALTER TABLE pnd.pndartistskill OWNER TO pnd;

--
-- TOC entry 257 (class 1259 OID 50482)
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
-- TOC entry 3023 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN pndcontact.ct_concode; Type: COMMENT; Schema: pnd; Owner: pnd
--

COMMENT ON COLUMN pndcontact.ct_concode IS 'Country code';


--
-- TOC entry 258 (class 1259 OID 50485)
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
-- TOC entry 3024 (class 0 OID 0)
-- Dependencies: 258
-- Name: pndcontact_ct_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE pndcontact_ct_id_seq OWNED BY pndcontact.ct_id;


--
-- TOC entry 259 (class 1259 OID 50487)
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
-- TOC entry 3025 (class 0 OID 0)
-- Dependencies: 259
-- Name: pndjoboutput_jo_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE pndjoboutput_jo_id_seq OWNED BY mjoboutput.jo_id;


--
-- TOC entry 260 (class 1259 OID 50489)
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
-- TOC entry 261 (class 1259 OID 50497)
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
-- TOC entry 3026 (class 0 OID 0)
-- Dependencies: 261
-- Name: pndphone_ph_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE pndphone_ph_id_seq OWNED BY pndphone.ph_id;


--
-- TOC entry 2544 (class 2604 OID 51028)
-- Name: fd_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcdoc ALTER COLUMN fd_id SET DEFAULT nextval('fcdoc_fd_id_seq'::regclass);


--
-- TOC entry 2631 (class 2604 OID 51491)
-- Name: ms_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcemailsetting ALTER COLUMN ms_id SET DEFAULT nextval('fcemailsetting_ms_id_seq'::regclass);


--
-- TOC entry 2547 (class 2604 OID 51029)
-- Name: lch_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fclocaleholiday ALTER COLUMN lch_id SET DEFAULT nextval('fclocaleholiday_lch_id_seq'::regclass);


--
-- TOC entry 2549 (class 2604 OID 51030)
-- Name: lcw_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fclocaleworkinghour ALTER COLUMN lcw_id SET DEFAULT nextval('fclocaleworkinghour_lcw_id_seq'::regclass);


--
-- TOC entry 2550 (class 2604 OID 51031)
-- Name: log_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fclog ALTER COLUMN log_id SET DEFAULT nextval('fclog_log_id_seq'::regclass);


--
-- TOC entry 2554 (class 2604 OID 51032)
-- Name: lu_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fclookup ALTER COLUMN lu_id SET DEFAULT nextval('fclookup_lu_id_seq'::regclass);


--
-- TOC entry 2557 (class 2604 OID 51033)
-- Name: mn_id; Type: DEFAULT; Schema: pnd; Owner: shine
--

ALTER TABLE ONLY fcmenu ALTER COLUMN mn_id SET DEFAULT nextval('fcmenu_mn_id_seq'::regclass);


--
-- TOC entry 2556 (class 2604 OID 51034)
-- Name: mn_parentid; Type: DEFAULT; Schema: pnd; Owner: shine
--

ALTER TABLE ONLY fcmenu ALTER COLUMN mn_parentid SET DEFAULT nextval('fcmenu_mn_parentid_seq'::regclass);


--
-- TOC entry 2561 (class 2604 OID 51035)
-- Name: org_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcorg ALTER COLUMN org_id SET DEFAULT nextval('fcorg_org_id_seq'::regclass);


--
-- TOC entry 2565 (class 2604 OID 51036)
-- Name: pmc_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcpmcase ALTER COLUMN pmc_id SET DEFAULT nextval('fcpmcase_pmc_id_seq'::regclass);


--
-- TOC entry 2569 (class 2604 OID 51037)
-- Name: pmcc_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcpmcasecomment ALTER COLUMN pmcc_id SET DEFAULT nextval('fcpmcasecomment_pmcc_id_seq'::regclass);


--
-- TOC entry 2570 (class 2604 OID 51038)
-- Name: pmcr_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcpmcasecommentread ALTER COLUMN pmcr_id SET DEFAULT nextval('fcpmcasecommentread_pmcr_id_seq'::regclass);


--
-- TOC entry 2572 (class 2604 OID 51039)
-- Name: pmcf_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcpmcaseflag ALTER COLUMN pmcf_id SET DEFAULT nextval('fcpmcaseflag_pmcf_id_seq'::regclass);


--
-- TOC entry 2574 (class 2604 OID 51040)
-- Name: pmf_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcpmcaseflow ALTER COLUMN pmf_id SET DEFAULT nextval('fcpmcaseflow_pmf_id_seq'::regclass);


--
-- TOC entry 2576 (class 2604 OID 51041)
-- Name: pmfa_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcpmcaseflowassign ALTER COLUMN pmfa_id SET DEFAULT nextval('fcpmcaseflowassign_pmfa_id_seq'::regclass);


--
-- TOC entry 2577 (class 2604 OID 51042)
-- Name: pmcn_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcpmconnector ALTER COLUMN pmcn_id SET DEFAULT nextval('fcpmconnector_pmcn_id_seq'::regclass);


--
-- TOC entry 2580 (class 2604 OID 51043)
-- Name: pmev_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcpmevent ALTER COLUMN pmev_id SET DEFAULT nextval('fcpmevent_pmev_id_seq'::regclass);


--
-- TOC entry 2581 (class 2604 OID 51044)
-- Name: pmgw_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcpmgateway ALTER COLUMN pmgw_id SET DEFAULT nextval('fcpmgateway_pmgw_id_seq'::regclass);


--
-- TOC entry 2582 (class 2604 OID 51045)
-- Name: pmsl_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcpmswimlane ALTER COLUMN pmsl_id SET DEFAULT nextval('fcpmswimlane_pmsl_id_seq'::regclass);


--
-- TOC entry 2583 (class 2604 OID 51046)
-- Name: pmss_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcpmswimlanesetup ALTER COLUMN pmss_id SET DEFAULT nextval('fcpmswimlanesetup_pmss_id_seq'::regclass);


--
-- TOC entry 2584 (class 2604 OID 51047)
-- Name: pmwf_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcpmworkflow ALTER COLUMN pmwf_id SET DEFAULT nextval('fcpmworkflow_pmwf_id_seq'::regclass);


--
-- TOC entry 2585 (class 2604 OID 51048)
-- Name: rol_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcrole ALTER COLUMN rol_id SET DEFAULT nextval('fcrole_rol_id_seq'::regclass);


--
-- TOC entry 2586 (class 2604 OID 51049)
-- Name: rp_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcroleperm ALTER COLUMN rp_id SET DEFAULT nextval('fcroleperm_rp_id_seq'::regclass);


--
-- TOC entry 2587 (class 2604 OID 51050)
-- Name: ru_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcrule ALTER COLUMN ru_id SET DEFAULT nextval('fcrule_ru_id_seq'::regclass);


--
-- TOC entry 2588 (class 2604 OID 51051)
-- Name: set_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcsetting ALTER COLUMN set_id SET DEFAULT nextval('fcsetting_set_id_seq'::regclass);


--
-- TOC entry 2597 (class 2604 OID 51052)
-- Name: di_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcuserdiary ALTER COLUMN di_id SET DEFAULT nextval('fcuserdiary_di_id_seq'::regclass);


--
-- TOC entry 2601 (class 2604 OID 51053)
-- Name: ul_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcuserlogin ALTER COLUMN ul_id SET DEFAULT nextval('fcuserlogin_ul_id_seq'::regclass);


--
-- TOC entry 2602 (class 2604 OID 51054)
-- Name: uor_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcuserorgrole ALTER COLUMN uor_id SET DEFAULT nextval('fcuserorgrole_uor_id_seq'::regclass);


--
-- TOC entry 2606 (class 2604 OID 51055)
-- Name: us_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcusersession ALTER COLUMN us_id SET DEFAULT nextval('fcusersession_us_id_seq'::regclass);


--
-- TOC entry 2607 (class 2604 OID 51056)
-- Name: ma_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY martistskill ALTER COLUMN ma_id SET DEFAULT nextval('martistskill_ma_id_seq'::regclass);


--
-- TOC entry 2608 (class 2604 OID 51057)
-- Name: car_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY mcarton ALTER COLUMN car_id SET DEFAULT nextval('mcarton_car_id_seq'::regclass);


--
-- TOC entry 2610 (class 2604 OID 51058)
-- Name: mc_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY mcustmachine ALTER COLUMN mc_id SET DEFAULT nextval('mcustmachine_mc_id_seq'::regclass);


--
-- TOC entry 2633 (class 2604 OID 51513)
-- Name: jbc_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY mjobbarcode ALTER COLUMN jbc_id SET DEFAULT nextval('mjobbarcode_jbc_id_seq'::regclass);


--
-- TOC entry 2611 (class 2604 OID 51059)
-- Name: jc_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY mjobcat ALTER COLUMN jc_id SET DEFAULT nextval('mjobcat_jc_id_seq'::regclass);


--
-- TOC entry 2612 (class 2604 OID 51060)
-- Name: jcl_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY mjobcatlookup ALTER COLUMN jcl_id SET DEFAULT nextval('mjobcatlookup_jcl_id_seq'::regclass);


--
-- TOC entry 2614 (class 2604 OID 51061)
-- Name: jo_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY mjoboutput ALTER COLUMN jo_id SET DEFAULT nextval('pndjoboutput_jo_id_seq'::regclass);


--
-- TOC entry 2629 (class 2604 OID 51482)
-- Name: jol_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY mjoboutputlookup ALTER COLUMN jol_id SET DEFAULT nextval('mjoboutputlookup_jol_id_seq'::regclass);


--
-- TOC entry 2616 (class 2604 OID 51062)
-- Name: js_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY mjobsheet ALTER COLUMN js_id SET DEFAULT nextval('mjobsheet_js_id_seq'::regclass);


--
-- TOC entry 2618 (class 2604 OID 51063)
-- Name: caval_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY mjscartonvalue ALTER COLUMN caval_id SET DEFAULT nextval('mjscartonvalue_caval_id_seq'::regclass);


--
-- TOC entry 2627 (class 2604 OID 51426)
-- Name: tc_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY mtnc ALTER COLUMN tc_id SET DEFAULT nextval('mtnc_tc_id_seq'::regclass);


--
-- TOC entry 2622 (class 2604 OID 51064)
-- Name: ad_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY pndaddress ALTER COLUMN ad_id SET DEFAULT nextval('pndaddress_ad_id_seq'::regclass);


--
-- TOC entry 2623 (class 2604 OID 51065)
-- Name: ct_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY pndcontact ALTER COLUMN ct_id SET DEFAULT nextval('pndcontact_ct_id_seq'::regclass);


--
-- TOC entry 2626 (class 2604 OID 51066)
-- Name: ph_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY pndphone ALTER COLUMN ph_id SET DEFAULT nextval('pndphone_ph_id_seq'::regclass);


--
-- TOC entry 2867 (class 0 OID 50173)
-- Dependencies: 173
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
-- TOC entry 2868 (class 0 OID 50179)
-- Dependencies: 174
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
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (16, '2014-06-07 12:06:16.717+08', '', '34', 'car_id', NULL, NULL, 'png', '', NULL);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (17, '2014-06-07 12:11:40.971+08', '', '34', 'car_id', NULL, 'hsc.png', 'png', '', 10963.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (18, '2014-06-07 12:12:25.931+08', '', '34', 'car_id', NULL, 'ind_9.png', 'png', '', 7062.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (19, '2014-06-07 12:38:58.078+08', '', '34', 'car_id', NULL, 'osc_1.png', 'png', '', 10296.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (20, '2014-06-07 12:39:19.295+08', '', '34', 'car_id', NULL, 'osc_1.png', 'png', '', 10296.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (24, '2014-06-07 13:15:49.938+08', '', '34', 'car_id', NULL, 'hsc.png', 'png', '', 10963.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (25, '2014-06-07 13:16:17.242+08', '', '34', 'car_id', NULL, 'hsc.png', 'png', '', 10963.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (26, '2014-06-07 13:16:45.322+08', '', '34', 'car_id', NULL, 'hsc.png', 'png', '', 10963.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (27, '2014-06-07 13:17:19.842+08', '', '34', 'car_id', NULL, 'hsc.png', 'png', '', 10963.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (28, '2014-06-07 13:17:37.655+08', '', '35', 'car_id', NULL, 'hsc.png', 'png', '', 10963.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (29, '2014-06-07 13:18:05.969+08', '', '35', 'car_id', NULL, 'hsc.png', 'png', '', 10963.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (32, '2014-06-07 13:20:01.693+08', '', '40', 'car_id', NULL, 'ind_9.png', 'png', '', 7062.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (36, '2014-06-07 15:30:18.377+08', '', '41', 'car_id', NULL, 'osc_2_joint_3.png', 'png', '', 12580.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (37, '2014-06-07 15:36:52.231+08', '', '41', 'car_id', NULL, 'osc_2.png', 'png', '', 9354.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (38, '2014-06-07 15:36:52.274+08', '', '41', 'car_id', NULL, 'osc_2_joint_1.png', 'png', '', 12726.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (39, '2014-06-07 15:36:52.275+08', '', '41', 'car_id', NULL, 'osc_2_joint_2.png', 'png', '', 11909.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (40, '2014-06-07 15:36:52.276+08', '', '41', 'car_id', NULL, 'osc_2_joint_3.png', 'png', '', 12580.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (41, '2014-06-10 17:53:00.942+08', NULL, '42', 'js_id', NULL, 'rar1', 'rar', '', 33080.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (42, '2014-06-10 17:53:16.653+08', NULL, '43', 'js_id', NULL, 'rar1', 'rar', NULL, 33080.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (43, '2014-06-10 17:53:27.744+08', NULL, '43', 'js_id', NULL, 'rar2', 'rar', NULL, 33080.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (44, '2014-06-10 18:05:44.866+08', 'admin', '27', 'js_id', NULL, 'osc_3.png', 'png', '', 10688.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (45, '2014-06-10 18:05:44.866+08', 'admin', '27', 'js_id', NULL, 'rsc_2_joint.png', 'png', '', 13436.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (46, '2014-06-10 18:08:47.337+08', 'admin', '28', 'js_id', NULL, 'osc_3.png', 'png', '', 10688.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (47, '2014-06-10 18:08:47.337+08', 'admin', '28', 'js_id', NULL, 'rsc_2_joint.png', 'png', '', 13436.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (48, '2014-06-10 18:10:33.782+08', 'admin', '29', 'js_id', NULL, 'osc_3.png', 'png', '', 10688.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (49, '2014-06-10 18:10:33.782+08', 'admin', '29', 'js_id', NULL, 'rsc_2_joint.png', 'png', '', 13436.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (50, '2014-06-10 18:24:45.941+08', 'admin', '50', 'new_id', NULL, 'hsc.png', 'png', '', 10963.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (51, '2014-06-10 18:24:45.968+08', 'admin', '50', 'new_id', NULL, 'ind_6.png', 'png', '', 13315.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (52, '2014-06-10 18:24:45.969+08', 'admin', '50', 'new_id', NULL, 'osc_2_joint_3.png', 'png', '', 12580.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (53, '2014-06-10 18:24:45.971+08', 'admin', '50', 'new_id', NULL, 'osc_3.png', 'png', '', 10688.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (54, '2014-06-10 18:25:03.981+08', 'admin', '30', 'js_id', NULL, 'osc_3.png', 'png', '', 10688.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (55, '2014-06-10 18:25:03.981+08', 'admin', '30', 'js_id', NULL, 'rsc_2_joint.png', 'png', '', 13436.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (56, '2014-06-10 18:26:56.048+08', 'admin', '31', 'js_id', NULL, 'osc_3.png', 'png', '', 10688.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (57, '2014-06-10 18:26:56.048+08', 'admin', '31', 'js_id', NULL, 'rsc_2_joint.png', 'png', '', 13436.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (58, '2014-06-10 19:05:26.862+08', 'admin', '32', 'js_id', NULL, 'newjoberror.rar', 'rar', '', 63047.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (59, '2014-06-10 21:09:22.433+08', 'admin', '33', 'js_id', 'New job file upload', 'newjoberror.rar', 'rar', '', 63047.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (60, '2014-06-10 21:09:22.433+08', 'admin', '33', 'js_id', 'New job file upload', 'accountwebsite.rar', 'rar', '', 129.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (61, '2014-06-10 22:44:42.107+08', 'admin', '34', 'js_id', 'New job file upload', 'hsc.png', 'png', '', 10963.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (62, '2014-06-10 22:44:42.107+08', 'admin', '34', 'js_id', 'New job file upload', 'ind_6.png', 'png', '', 13315.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (63, '2014-06-10 23:06:08.402+08', 'admin', '34', 'js_id', 'Artwork job done', 'osc_3.png', 'png', '', 10688.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (64, '2014-06-10 23:06:08.402+08', 'admin', '34', 'js_id', 'Artwork job done', 'rsc.png', 'png', '', 10260.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (65, '2014-06-10 23:20:47.905+08', 'admin', '34', 'js_id', 'Artwork job done', 'osc_3.png', 'png', '', 10688.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (66, '2014-06-10 23:21:42.452+08', 'admin', '35', 'js_id', 'New job file upload', 'osc_2_joint_3.png', 'png', '', 12580.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (67, '2014-06-10 23:21:42.452+08', 'admin', '35', 'js_id', 'New job file upload', 'osc_3.png', 'png', '', 10688.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (68, '2014-06-10 23:22:41.616+08', 'admin', '35', 'js_id', 'Edit job file', 'hsc - Copy.png', 'png', '', 10963.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (69, '2014-06-10 23:22:41.616+08', 'admin', '35', 'js_id', 'Edit job file', 'five_panel.png', 'png', '', 12095.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (70, '2014-06-11 20:47:02.736+08', 'admin', '36', 'js_id', 'New job file upload', 'ind_9.png', 'png', '', 7062.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (71, '2014-06-11 20:47:02.736+08', 'admin', '36', 'js_id', 'New job file upload', 'osc_2.png', 'png', '', 9354.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (72, '2014-06-11 20:47:02.736+08', 'admin', '36', 'js_id', 'New job file upload', 'osc_2_joint_3.png', 'png', '', 12580.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (73, '2014-06-11 20:47:02.736+08', 'admin', '36', 'js_id', 'New job file upload', 'rsc.png', 'png', '', 10260.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (74, '2014-06-11 20:50:04.312+08', 'admin', '35', 'js_id', 'Artwork job done', 'rsc.png', 'png', '', 10260.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (75, '2014-06-20 13:14:16.219+08', 'admin', '46', 'js_id', NULL, 'astro_banner.jpg', 'jpg', '', 207634.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (76, '2014-06-20 15:17:12.216+08', 'admin', '47', 'js_id', NULL, 'data.TODO', 'TODO', '', 2598.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (77, '2014-06-21 17:56:07.353+08', 'admin2', '48', 'js_id', NULL, 'download.jpg', 'jpg', '', 6195.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (78, '2014-06-21 17:56:07.353+08', 'admin2', '48', 'js_id', NULL, 'saddsa.png', 'png', '', 837.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (79, '2014-06-21 18:09:24.749+08', 'admin2', '57', 'js_id', NULL, 'download.jpg', 'jpg', '', 6195.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (80, '2014-06-21 18:09:24.749+08', 'admin2', '57', 'js_id', NULL, 'saddsa.png', 'png', '', 837.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (81, '2014-06-21 18:40:52.63+08', 'artist1', '57', 'js_id', 'Artwork job done', 'tzdata2014c.tar.gz', 'gz', '', 221322.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (82, '2014-06-21 18:45:26.295+08', 'uat_cust1', '58', 'js_id', NULL, 'Year of the Snake 2013.jpg', 'jpg', '', 595700.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (83, '2014-06-21 18:47:14.918+08', 'uat_cust1', '59', 'js_id', NULL, 'season_greetings.jpg', 'jpg', '', 266885.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (84, '2014-06-21 19:15:41.873+08', 'uat_cust1', '60', 'js_id', NULL, 'dbo_config.png', 'png', '', 103884.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (85, '2014-06-21 21:48:33.818+08', 'uat_artist1', '60', 'js_id', 'Artwork job done', 'cams_banner2.gif', 'gif', '', 24392.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (86, '2014-06-21 21:57:49.784+08', 'uat_cust1', '61', 'js_id', NULL, 'season_greetings.jpg', 'jpg', '', 266885.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (87, '2014-06-21 22:17:30.99+08', 'esp_supervisor', '62', 'js_id', NULL, 'tablist.html', 'html', '', 19015.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (88, '2014-06-21 22:23:53.517+08', 'uat_cust1', '63', 'js_id', NULL, 'Year of the Snake 2013.jpg', 'jpg', '', 595700.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (89, '2014-06-21 22:50:34.985+08', 'uat_artist1', '58', 'js_id', 'Artwork job done', 'dbo_config.png', 'png', '', 103884.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (90, '2014-06-21 23:45:22.963+08', 'uat_artist1', '58', 'js_id', 'Artwork job done', 'dbo_config.png', 'png', '', 103884.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (91, '2014-06-22 14:01:20.343+08', 'uat_supervisor1', '64', 'js_id', NULL, 'cloudcomputer.jpg', 'jpg', '', 341341.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (92, '2014-06-22 15:06:57.158+08', 'uat_cust1', '65', 'js_id', NULL, 'ProcessManager.class.inc.php', 'php', '', 25983.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (93, '2014-06-22 15:09:06.32+08', 'uat_cust1', '66', 'js_id', NULL, 'Operation.inc.php', 'php', '', 3125.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (94, '2014-06-22 15:09:52.378+08', 'uat_cust1', '67', 'js_id', NULL, 'Operation.inc.php', 'php', '', 3125.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (95, '2014-06-22 15:53:21.722+08', 'ysyow', '68', 'js_id', NULL, 'download.jpg', 'jpg', '', 6195.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (96, '2014-06-22 15:53:21.722+08', 'ysyow', '68', 'js_id', NULL, 'saddsa.png', 'png', '', 837.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (97, '2014-06-22 16:02:50.505+08', 'uat_customer1', '69', 'js_id', NULL, 'Diagramming-Crow''s-Foot-ERD-Sample60.png', 'png', '', 81061.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (98, '2014-06-22 16:02:50.505+08', 'uat_customer1', '69', 'js_id', NULL, 'no_date.png', 'png', '', 6857.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (99, '2014-06-22 16:09:46.72+08', 'artist2', '67', 'js_id', 'Artwork job done', 'download.jpg', 'jpg', '', 6195.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (100, '2014-06-22 16:14:09.295+08', 'artist2', '67', 'js_id', 'Artwork job done', 'download.jpg', 'jpg', '', 6195.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (101, '2014-06-22 18:37:00.386+08', 'uat_customer1', '70', 'js_id', NULL, 'no_date.png', 'png', '', 6857.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (102, '2014-06-22 18:37:00.386+08', 'uat_customer1', '70', 'js_id', NULL, 'Diagramming-Crow''s-Foot-ERD-Sample60.png', 'png', '', 81061.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (103, '2014-06-22 19:08:37.392+08', 'uat_customer1', '71', 'js_id', NULL, 'Diagramming-Crow''s-Foot-ERD-Sample60.png', 'png', '', 81061.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (104, '2014-06-22 19:09:29.558+08', 'uat_customer1', '72', 'js_id', NULL, 'Diagramming-Crow''s-Foot-ERD-Sample60.png', 'png', '', 81061.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (105, '2014-06-22 21:20:41.899+08', 'uat_customer2', '74', 'js_id', NULL, 'router-symbol.png', 'png', '', 176839.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (106, '2014-06-22 21:34:06.591+08', 'uat_artist1', '72', 'js_id', 'Artwork job done', 'Diagramming-Crow''s-Foot-ERD-Sample60.png', 'png', '', 81061.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (107, '2014-06-22 22:19:07.119+08', 'uat_customer3', '75', 'js_id', NULL, 'Diagramming-Crow''s-Foot-ERD-Sample60.png', 'png', '', 81061.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (108, '2014-06-22 22:22:00.011+08', 'ysyow', '76', 'js_id', NULL, 'batchjob_list.xlsx', 'xlsx', '', 9496.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (109, '2014-06-22 22:25:19.154+08', 'uat_customer3', '77', 'js_id', NULL, 'Diagramming-Crow''s-Foot-ERD-Sample60.png', 'png', '', 81061.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (110, '2014-06-22 22:25:20.028+08', 'ysyow', '78', 'js_id', NULL, 'batchjob_list.xlsx', 'xlsx', '', 9496.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (111, '2014-06-22 22:26:19.002+08', 'ysyow', '79', 'js_id', NULL, 'batchjob_list.xlsx', 'xlsx', '', 9496.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (112, '2014-06-22 22:27:13.903+08', 'ysyow', '80', 'js_id', NULL, 'ProcessManager.class.inc.php', 'php', '', 26555.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (113, '2014-06-22 22:29:53.155+08', 'ysyow', '81', 'js_id', NULL, 'Shine Points Range 19 May lsx.xlsx', 'xlsx', '', 47078.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (114, '2014-06-22 22:34:15.393+08', 'ysyow', '82', 'js_id', NULL, 'Shine Points Range 19 May lsx.xlsx', 'xlsx', '', 47078.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (115, '2014-06-22 22:41:20.16+08', 'uat_artist2', '76', 'js_id', 'Artwork job done', 'router-symbol.png', 'png', '', 176839.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (116, '2014-06-22 22:42:05.965+08', 'uat_customer3', '83', 'js_id', NULL, 'Diagramming-Crow''s-Foot-ERD-Sample60.png', 'png', '', 81061.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (117, '2014-06-22 23:01:48.442+08', 'uat_artist3', '83', 'js_id', 'Artwork job done', 'Diagramming-Crow''s-Foot-ERD-Sample60.png', 'png', '', 81061.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (118, '2014-06-24 17:17:18.438+08', 'ysyow', '84', 'js_id', NULL, 'download.jpg', 'jpg', '', 6195.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (123, '2014-06-24 18:38:42.963+08', 'ysyow', '111', 'js_id', NULL, 'download.jpg', 'jpg', '', 6195.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (124, '2014-06-24 18:41:09.137+08', 'ysyow', '112', 'js_id', NULL, 'download.jpg', 'jpg', '', 6195.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (125, '2014-06-24 18:47:11.461+08', 'uat_customer1', '113', 'js_id', NULL, 'AirAsia Web Check-In.pdf', 'pdf', '', 179697.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (126, '2014-06-24 19:02:27.525+08', 'uat_artist1', '113', 'js_id', 'Artwork job done', 'httpd.conf', 'conf', '', 20325.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (127, '2014-06-24 19:04:28.117+08', 'uat_artist1', '58', 'js_id', 'Artwork job done', 'httpd.conf', 'conf', '', 20325.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (128, '2014-06-24 19:06:51.238+08', 'uat_customer1', '114', 'js_id', NULL, 'httpd.conf', 'conf', '', 20325.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (129, '2014-06-24 19:07:39.352+08', 'uat_artist1', '114', 'js_id', 'Artwork job done', 'httpd.conf', 'conf', '', 20325.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (130, '2014-06-25 17:47:26.351+08', 'uat_customer4', '115', 'js_id', NULL, 'MoiregcUATNote.rar', 'rar', '', 790.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (131, '2014-06-25 18:03:36.778+08', 'uat_customer4', '116', 'js_id', NULL, 'MoiregcUATNote.rar', 'rar', '', 790.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (132, '2014-06-25 18:09:59.535+08', 'uat_customer4', '117', 'js_id', NULL, 'MoiregcUATNote.rar', 'rar', '', 790.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (133, '2014-06-25 18:17:21.289+08', 'ysyow', '118', 'js_id', NULL, 'udv.rar', 'rar', '', 2327.0000);
INSERT INTO fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) VALUES (134, '2014-06-25 18:25:25.999+08', 'uat_artist4', '116', 'js_id', 'Artwork job done', 'MoiregcUATNote.rar', 'rar', '', 790.0000);


--
-- TOC entry 3027 (class 0 OID 0)
-- Dependencies: 175
-- Name: fcdoc_fd_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcdoc_fd_id_seq', 134, true);


--
-- TOC entry 2962 (class 0 OID 51488)
-- Dependencies: 403
-- Data for Name: fcemailsetting; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fcemailsetting (ms_id, ms_type, ms_hostname, ms_port, ms_username, ms_password) VALUES (1, 'MAILOUT', '202.190.181.92', '25', 'noreply@moiregc.com.my', 'User123');


--
-- TOC entry 3028 (class 0 OID 0)
-- Dependencies: 402
-- Name: fcemailsetting_ms_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcemailsetting_ms_id_seq', 1, true);


--
-- TOC entry 2870 (class 0 OID 50188)
-- Dependencies: 176
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
-- TOC entry 2871 (class 0 OID 50192)
-- Dependencies: 177
-- Data for Name: fclocale; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fclocale (lc_code, lc_description, lc_primary_langcode, lc_tzcode) VALUES ('MYWP', 'Wilayah KL', 'EN-US', 'Asia/Kuala_Lumpur');


--
-- TOC entry 2872 (class 0 OID 50195)
-- Dependencies: 178
-- Data for Name: fclocaleholiday; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fclocaleholiday (lch_id, lch_lccode, lch_date, lch_recurring, lch_description) VALUES (13, 'MYWP', '2012-01-01', 'Y', 'New Year');
INSERT INTO fclocaleholiday (lch_id, lch_lccode, lch_date, lch_recurring, lch_description) VALUES (14, 'MYWP', '2013-05-01', 'Y', 'Labour Day');
INSERT INTO fclocaleholiday (lch_id, lch_lccode, lch_date, lch_recurring, lch_description) VALUES (15, 'MYWP', '2014-08-10', 'N', 'Hari Raya');
INSERT INTO fclocaleholiday (lch_id, lch_lccode, lch_date, lch_recurring, lch_description) VALUES (16, 'MYWP', '2014-01-01', 'N', 'Haha Day');


--
-- TOC entry 3029 (class 0 OID 0)
-- Dependencies: 179
-- Name: fclocaleholiday_lch_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fclocaleholiday_lch_id_seq', 16, true);


--
-- TOC entry 2874 (class 0 OID 50201)
-- Dependencies: 180
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
-- TOC entry 3030 (class 0 OID 0)
-- Dependencies: 181
-- Name: fclocaleworkinghour_lcw_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fclocaleworkinghour_lcw_id_seq', 26, true);


--
-- TOC entry 2876 (class 0 OID 50206)
-- Dependencies: 182
-- Data for Name: fclog; Type: TABLE DATA; Schema: pnd; Owner: pnd
--



--
-- TOC entry 3031 (class 0 OID 0)
-- Dependencies: 183
-- Name: fclog_log_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fclog_log_id_seq', 1, false);


--
-- TOC entry 2878 (class 0 OID 50215)
-- Dependencies: 184
-- Data for Name: fclookup; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('JOBSTATUS', 'REQUIREMENT VERIFICATION', 'ROOT', 'REQUIREMENT VERIFICATION', 'ACTIVE', 123);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('JOBSTATUS', 'PENDING ARTIST ACKNOWLEDGE JOB', 'ROOT', 'PENDING ARTIST ACKNOWLEDGE JOB', 'ACTIVE', 124);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('JOBSTATUS', 'WORK IN PROGRESS', 'ROOT', 'WORK IN PROGRESS', 'ACTIVE', 125);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('JOBSTATUS', 'PENDING QC CHECK', 'ROOT', 'PENDING QC CHECK', 'ACTIVE', 126);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('JOBSTATUS', 'PENDING ACCEPTANCE', 'ROOT', 'PENDING ACCEPTANCE', 'ACTIVE', 128);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('JOBSTATUS', 'COMPLETED', 'ROOT', 'COMPLETED', 'ACTIVE', 129);
INSERT INTO fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) VALUES ('JOBSTATUS', 'PENDING CUSTOMER RESOLUTION', 'ROOT', 'PENDING CUSTOMER RESOLUTION', 'ACTIVE', 137);


--
-- TOC entry 3032 (class 0 OID 0)
-- Dependencies: 185
-- Name: fclookup_lu_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fclookup_lu_id_seq', 137, true);


--
-- TOC entry 2880 (class 0 OID 50222)
-- Dependencies: 186
-- Data for Name: fcmenu; Type: TABLE DATA; Schema: pnd; Owner: shine
--

INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (1, 'HEADERMENU', 0, 'Top Menu', 'ACTIVE', 0, '', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (88, 'SVHOME', 1, 'Home (Supervisor)', 'ACTIVE', 1000, NULL, 'Y', 'Home', NULL, 'supervisorhome', NULL, NULL, 'SUPHOME', 'fa fa-home');
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (86, 'QCHOME', 1, 'Home (QC)', 'ACTIVE', 1000, NULL, 'Y', 'Home', NULL, 'qchome', NULL, NULL, 'QCHOME', 'fa fa-home');
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (87, 'ARTHOME', 1, 'Home (Artist)', 'ACTIVE', 1000, NULL, 'Y', 'Home', NULL, 'artisthome', NULL, NULL, 'ARTHOME', 'fa fa-home');
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (90, 'CUSTHOME', 1, 'Home(Customer)', 'ACTIVE', 1000, NULL, 'Y', 'Home', NULL, 'customerhome', NULL, NULL, 'CUSTHOME', 'fa fa-home');
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (99, 'MAILTEMPLATE', 91, 'Mail Template Setup', 'ACTIVE', 3000, NULL, 'Y', 'Setting', NULL, 'mailtemplatesetup', NULL, NULL, NULL, NULL);
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (95, 'MACHINESETUP', 91, 'Customer machine setting', 'ACTIVE', 6000, NULL, 'Y', 'Setting', NULL, 'machinesetup', NULL, NULL, 'ADMINSETTING', 'fa fa-database');
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (94, 'CUSTOMERSETUP', 91, 'Customer setup', 'ACTIVE', 5000, NULL, 'Y', 'Setting', NULL, 'orgsetup', NULL, NULL, 'ADMINSETTING', 'fa fa-smile-o');
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (93, 'PNDUSERSETUP', 91, 'User setting', 'ACTIVE', 4000, NULL, 'Y', 'Setting', NULL, 'pndusersetting', NULL, NULL, 'ADMINSETTING', 'fa fa-user');
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (96, 'RULESETUP', 6, 'Rule Setting', 'ACTIVE', 3500, NULL, 'Y', 'Rulebuilder', NULL, 'setup', NULL, NULL, 'POSBMENU', 'fa fa-cogs');
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (69, 'MENU', 6, 'Menu Setup', 'ACTIVE', 4400, NULL, 'Y', 'Setting', NULL, 'menusetup', NULL, NULL, 'POSBMENU', 'fa fa-sitemap');
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (50, 'PERMSETUP', 82, 'Permission Setup', 'ACTIVE', 4230, NULL, 'Y', 'Setting', '', 'permsetting', '', '', 'POSBMENU', 'fa fa-cogs');
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (51, 'ROLESETUP', 82, 'Role Setup', 'ACTIVE', 4220, NULL, 'Y', 'Setting', '', 'rolesetting', '', '', 'POSBMENU', 'fa fa-cogs');
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (83, 'LOOKUPSETUP', 6, 'Lookup Setup', 'ACTIVE', 2000, NULL, 'Y', 'Setting', NULL, 'lookupSetup', NULL, NULL, 'POSBMENU', 'fa fa-cogs');
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (6, 'SETTING', 1, 'Setting', 'ACTIVE', 9000, NULL, 'N', NULL, NULL, NULL, NULL, NULL, 'POSBMENU', 'fa fa-wrench');
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (92, 'ARTISTSETUP', 91, 'Artist setup', 'ACTIVE', 3000, NULL, 'Y', 'Setting', NULL, 'artistsetup', NULL, NULL, 'ADMINSETTING', 'fa fa-graduation-cap ');
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (91, 'ADMINSETUP', 1, 'Admin Setup', 'ACTIVE', 5000, NULL, 'N', NULL, NULL, NULL, NULL, NULL, 'ADMINSETTING', 'fa fa-wrench');
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (82, 'USERSETTING', 6, 'POSB User Setting', 'ACTIVE', 2000, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, 'POSBMENU', 'fa fa-user');
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (85, 'CARTONSETUP', 91, 'Carton setup', 'ACTIVE', 2000, NULL, 'Y', 'Setting', NULL, 'cartonSetup', NULL, NULL, 'ADMINSETTING', 'fa fa-dropbox');
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (84, 'JOBCATSETUP', 91, 'Job category setup', 'ACTIVE', 1000, NULL, 'Y', 'Setting', NULL, 'jobcatsetup', NULL, NULL, 'ADMINSETTING', 'fa fa-code-fork');
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (49, 'USERSETUP', 82, 'POSB User Setup', 'ACTIVE', 4210, NULL, 'Y', 'Setting', '', 'usersetting', '', '', 'POSBMENU', 'fa fa-user');
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (97, 'SLASETUP', 91, 'SLA Setup', 'ACTIVE', 2100, NULL, 'Y', 'Setting', NULL, 'timersetup', NULL, NULL, 'ADMINSETTING', NULL);
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (98, 'LOCALE', 6, 'Locale Setup', 'ACTIVE', 100, NULL, 'Y', 'Setting', NULL, 'localesetup', NULL, NULL, NULL, 'fa fa-globe');
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (100, 'CONTACTSETUP', 91, 'Contact Setup', 'ACTIVE', 5500, NULL, 'Y', 'Setting', NULL, 'contactsetup', NULL, NULL, NULL, NULL);
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (101, 'DBOSETUP', 6, 'DBO Setup', 'ACTIVE', 6500, NULL, 'Y', 'Setting', NULL, 'DBO', NULL, NULL, NULL, NULL);
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (102, 'ADVTRANSLATE', 6, 'Translation', 'ACTIVE', 7000, NULL, 'Y', 'Translate', NULL, 'advanceTranslate', NULL, NULL, NULL, NULL);
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (103, 'TNC', 91, 'Terms and Conditions', 'ACTIVE', 5000, NULL, 'Y', 'Setting', NULL, 'tncsetup', NULL, NULL, NULL, NULL);
INSERT INTO fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) VALUES (104, 'JOBOUTPUT', 91, 'Job output setup', 'ACTIVE', 1200, NULL, 'Y', 'Setting', NULL, 'joboutputsetup', NULL, NULL, 'ADMINSETTING', NULL);


--
-- TOC entry 3033 (class 0 OID 0)
-- Dependencies: 187
-- Name: fcmenu_mn_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: shine
--

SELECT pg_catalog.setval('fcmenu_mn_id_seq', 104, true);


--
-- TOC entry 3034 (class 0 OID 0)
-- Dependencies: 188
-- Name: fcmenu_mn_parentid_seq; Type: SEQUENCE SET; Schema: pnd; Owner: shine
--

SELECT pg_catalog.setval('fcmenu_mn_parentid_seq', 6, true);


--
-- TOC entry 2883 (class 0 OID 50233)
-- Dependencies: 189
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


--
-- TOC entry 3035 (class 0 OID 0)
-- Dependencies: 190
-- Name: fcorg_org_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcorg_org_id_seq', 14, true);


--
-- TOC entry 2885 (class 0 OID 50244)
-- Dependencies: 191
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
-- TOC entry 2887 (class 0 OID 50252)
-- Dependencies: 193
-- Data for Name: fcpmactivity; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fcpmactivity (pmat_id, pmat_pmwfid, pmat_pmslid, pmat_name, pmat_type, pmat_function, pmat_sla_interval, pmat_sla_workinghours_only, pmat_show_caseinfo, pmat_performed_message) VALUES (7, 1, NULL, 'Notify Manager On Late Requirement Verification', 'SCRIPT', 'notifyLateVerification', NULL, 'N', 'N', NULL);
INSERT INTO fcpmactivity (pmat_id, pmat_pmwfid, pmat_pmslid, pmat_name, pmat_type, pmat_function, pmat_sla_interval, pmat_sla_workinghours_only, pmat_show_caseinfo, pmat_performed_message) VALUES (8, 1, NULL, 'Notify Supervisor On Late Job Acknowledgement', 'SCRIPT', 'notifyLateAcknowledgement', NULL, 'N', 'N', NULL);
INSERT INTO fcpmactivity (pmat_id, pmat_pmwfid, pmat_pmslid, pmat_name, pmat_type, pmat_function, pmat_sla_interval, pmat_sla_workinghours_only, pmat_show_caseinfo, pmat_performed_message) VALUES (11, 1, NULL, 'Notify Supervisor and Manager On Late WIP', 'SCRIPT', 'notifyLateWIP', NULL, 'N', 'N', NULL);
INSERT INTO fcpmactivity (pmat_id, pmat_pmwfid, pmat_pmslid, pmat_name, pmat_type, pmat_function, pmat_sla_interval, pmat_sla_workinghours_only, pmat_show_caseinfo, pmat_performed_message) VALUES (12, 1, NULL, 'Notify Supervisor and Manager On Late QC Check', 'SCRIPT', 'notifyLateQC', NULL, 'N', 'N', NULL);
INSERT INTO fcpmactivity (pmat_id, pmat_pmwfid, pmat_pmslid, pmat_name, pmat_type, pmat_function, pmat_sla_interval, pmat_sla_workinghours_only, pmat_show_caseinfo, pmat_performed_message) VALUES (13, 1, NULL, 'Auto Accept', 'SCRIPT', 'autoCustomerAccept', NULL, 'N', 'N', NULL);
INSERT INTO fcpmactivity (pmat_id, pmat_pmwfid, pmat_pmslid, pmat_name, pmat_type, pmat_function, pmat_sla_interval, pmat_sla_workinghours_only, pmat_show_caseinfo, pmat_performed_message) VALUES (2, 1, 1, 'Pending resolution ', 'USER', 'pendingRevert', NULL, 'Y', 'N', 'The job has successfully been sent back for verification.');
INSERT INTO fcpmactivity (pmat_id, pmat_pmwfid, pmat_pmslid, pmat_name, pmat_type, pmat_function, pmat_sla_interval, pmat_sla_workinghours_only, pmat_show_caseinfo, pmat_performed_message) VALUES (4, 1, 3, 'Work in progress ', 'USER', 'wip', '[[REQTIMEART]]', 'Y', 'Y', 'The job has successfully been sent to QC for verification.');
INSERT INTO fcpmactivity (pmat_id, pmat_pmwfid, pmat_pmslid, pmat_name, pmat_type, pmat_function, pmat_sla_interval, pmat_sla_workinghours_only, pmat_show_caseinfo, pmat_performed_message) VALUES (10, 1, 3, 'Rework in progress', 'USER', 'wip', '[[REQTIMEQC]]', 'Y', 'Y', 'The job has successfully been sent to QC for verification.');
INSERT INTO fcpmactivity (pmat_id, pmat_pmwfid, pmat_pmslid, pmat_name, pmat_type, pmat_function, pmat_sla_interval, pmat_sla_workinghours_only, pmat_show_caseinfo, pmat_performed_message) VALUES (1, 1, 2, 'Requirement verification', 'USER', 'reqVerification', 'PT30M', 'Y', 'Y', 'The job has successfully been [[RVDEC_DISP]].');
INSERT INTO fcpmactivity (pmat_id, pmat_pmwfid, pmat_pmslid, pmat_name, pmat_type, pmat_function, pmat_sla_interval, pmat_sla_workinghours_only, pmat_show_caseinfo, pmat_performed_message) VALUES (5, 1, 4, 'Pending check (QC)', 'USER', 'pendingQC', '[[REQTIMEQC]]', 'Y', 'Y', 'The job has successfully been [[QCDEC_DISP]].');
INSERT INTO fcpmactivity (pmat_id, pmat_pmwfid, pmat_pmslid, pmat_name, pmat_type, pmat_function, pmat_sla_interval, pmat_sla_workinghours_only, pmat_show_caseinfo, pmat_performed_message) VALUES (6, 1, 1, 'Pending acceptance', 'USER', 'pendingCust', 'PT24H', 'Y', 'Y', 'The job has successfully been [[CUSTDEC_DISP]].');
INSERT INTO fcpmactivity (pmat_id, pmat_pmwfid, pmat_pmslid, pmat_name, pmat_type, pmat_function, pmat_sla_interval, pmat_sla_workinghours_only, pmat_show_caseinfo, pmat_performed_message) VALUES (9, 1, 2, 'Reassign Artist', 'USER', 'reassign', NULL, 'Y', 'Y', 'The job has successfully been assigned to artist.');


--
-- TOC entry 3036 (class 0 OID 0)
-- Dependencies: 192
-- Name: fcpmactivity_pmat_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcpmactivity_pmat_id_seq', 13, true);


--
-- TOC entry 2888 (class 0 OID 50258)
-- Dependencies: 194
-- Data for Name: fcpmcase; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fcpmcase (pmc_id, pmc_created_date, pmc_created_by, pmc_casekey, pmc_casetype, pmc_parentid, pmc_pmwfid, pmc_start_pmevid, pmc_start_date, pmc_end_pmevid, pmc_end_date, pmc_closed) VALUES (105, '2014-06-21 18:45:26+08', 'uat_cust1', 58, 'jobsheet', NULL, 1, 1, '2014-06-21 18:45:26+08', NULL, NULL, 'N');
INSERT INTO fcpmcase (pmc_id, pmc_created_date, pmc_created_by, pmc_casekey, pmc_casetype, pmc_parentid, pmc_pmwfid, pmc_start_pmevid, pmc_start_date, pmc_end_pmevid, pmc_end_date, pmc_closed) VALUES (106, '2014-06-21 18:47:14+08', 'uat_cust1', 59, 'jobsheet', NULL, 1, 1, '2014-06-21 18:47:14+08', NULL, NULL, 'N');
INSERT INTO fcpmcase (pmc_id, pmc_created_date, pmc_created_by, pmc_casekey, pmc_casetype, pmc_parentid, pmc_pmwfid, pmc_start_pmevid, pmc_start_date, pmc_end_pmevid, pmc_end_date, pmc_closed) VALUES (104, '2014-06-21 18:09:24+08', 'admin2', 57, 'jobsheet', NULL, 1, 1, '2014-06-21 18:09:24+08', 6, '2014-06-21 19:04:48+08', 'Y');
INSERT INTO fcpmcase (pmc_id, pmc_created_date, pmc_created_by, pmc_casekey, pmc_casetype, pmc_parentid, pmc_pmwfid, pmc_start_pmevid, pmc_start_date, pmc_end_pmevid, pmc_end_date, pmc_closed) VALUES (108, '2014-06-21 21:57:49+08', 'uat_cust1', 61, 'jobsheet', NULL, 1, 1, '2014-06-21 21:57:49+08', NULL, NULL, 'N');
INSERT INTO fcpmcase (pmc_id, pmc_created_date, pmc_created_by, pmc_casekey, pmc_casetype, pmc_parentid, pmc_pmwfid, pmc_start_pmevid, pmc_start_date, pmc_end_pmevid, pmc_end_date, pmc_closed) VALUES (109, '2014-06-21 22:17:31+08', 'esp_supervisor', 62, 'jobsheet', NULL, 1, 1, '2014-06-21 22:17:31+08', NULL, NULL, 'N');
INSERT INTO fcpmcase (pmc_id, pmc_created_date, pmc_created_by, pmc_casekey, pmc_casetype, pmc_parentid, pmc_pmwfid, pmc_start_pmevid, pmc_start_date, pmc_end_pmevid, pmc_end_date, pmc_closed) VALUES (110, '2014-06-21 22:23:53+08', 'uat_cust1', 63, 'jobsheet', NULL, 1, 1, '2014-06-21 22:23:53+08', NULL, NULL, 'N');
INSERT INTO fcpmcase (pmc_id, pmc_created_date, pmc_created_by, pmc_casekey, pmc_casetype, pmc_parentid, pmc_pmwfid, pmc_start_pmevid, pmc_start_date, pmc_end_pmevid, pmc_end_date, pmc_closed) VALUES (107, '2014-06-21 19:15:41+08', 'uat_cust1', 60, 'jobsheet', NULL, 1, 1, '2014-06-21 19:15:41+08', 6, '2014-06-22 00:31:27+08', 'Y');
INSERT INTO fcpmcase (pmc_id, pmc_created_date, pmc_created_by, pmc_casekey, pmc_casetype, pmc_parentid, pmc_pmwfid, pmc_start_pmevid, pmc_start_date, pmc_end_pmevid, pmc_end_date, pmc_closed) VALUES (111, '2014-06-22 14:01:20+08', 'uat_supervisor1', 64, 'jobsheet', NULL, 1, 1, '2014-06-22 14:01:20+08', NULL, NULL, 'N');
INSERT INTO fcpmcase (pmc_id, pmc_created_date, pmc_created_by, pmc_casekey, pmc_casetype, pmc_parentid, pmc_pmwfid, pmc_start_pmevid, pmc_start_date, pmc_end_pmevid, pmc_end_date, pmc_closed) VALUES (112, '2014-06-22 15:06:57+08', 'uat_cust1', 65, 'jobsheet', NULL, 1, 1, '2014-06-22 15:06:57+08', NULL, NULL, 'N');
INSERT INTO fcpmcase (pmc_id, pmc_created_date, pmc_created_by, pmc_casekey, pmc_casetype, pmc_parentid, pmc_pmwfid, pmc_start_pmevid, pmc_start_date, pmc_end_pmevid, pmc_end_date, pmc_closed) VALUES (113, '2014-06-22 15:09:06+08', 'uat_cust1', 66, 'jobsheet', NULL, 1, 1, '2014-06-22 15:09:06+08', NULL, NULL, 'N');
INSERT INTO fcpmcase (pmc_id, pmc_created_date, pmc_created_by, pmc_casekey, pmc_casetype, pmc_parentid, pmc_pmwfid, pmc_start_pmevid, pmc_start_date, pmc_end_pmevid, pmc_end_date, pmc_closed) VALUES (115, '2014-06-22 15:53:21+08', 'ysyow', 68, 'jobsheet', NULL, 1, 1, '2014-06-22 15:53:21+08', NULL, NULL, 'N');
INSERT INTO fcpmcase (pmc_id, pmc_created_date, pmc_created_by, pmc_casekey, pmc_casetype, pmc_parentid, pmc_pmwfid, pmc_start_pmevid, pmc_start_date, pmc_end_pmevid, pmc_end_date, pmc_closed) VALUES (116, '2014-06-22 16:02:50+08', 'uat_customer1', 69, 'jobsheet', NULL, 1, 1, '2014-06-22 16:02:50+08', NULL, NULL, 'N');
INSERT INTO fcpmcase (pmc_id, pmc_created_date, pmc_created_by, pmc_casekey, pmc_casetype, pmc_parentid, pmc_pmwfid, pmc_start_pmevid, pmc_start_date, pmc_end_pmevid, pmc_end_date, pmc_closed) VALUES (114, '2014-06-22 15:09:52+08', 'uat_cust1', 67, 'jobsheet', NULL, 1, 1, '2014-06-22 15:09:52+08', 6, '2014-06-22 16:14:41+08', 'Y');
INSERT INTO fcpmcase (pmc_id, pmc_created_date, pmc_created_by, pmc_casekey, pmc_casetype, pmc_parentid, pmc_pmwfid, pmc_start_pmevid, pmc_start_date, pmc_end_pmevid, pmc_end_date, pmc_closed) VALUES (117, '2014-06-22 18:37:00+08', 'uat_customer1', 70, 'jobsheet', NULL, 1, 1, '2014-06-22 18:37:00+08', NULL, NULL, 'N');
INSERT INTO fcpmcase (pmc_id, pmc_created_date, pmc_created_by, pmc_casekey, pmc_casetype, pmc_parentid, pmc_pmwfid, pmc_start_pmevid, pmc_start_date, pmc_end_pmevid, pmc_end_date, pmc_closed) VALUES (118, '2014-06-22 19:08:37+08', 'uat_customer1', 71, 'jobsheet', NULL, 1, 1, '2014-06-22 19:08:37+08', NULL, NULL, 'N');
INSERT INTO fcpmcase (pmc_id, pmc_created_date, pmc_created_by, pmc_casekey, pmc_casetype, pmc_parentid, pmc_pmwfid, pmc_start_pmevid, pmc_start_date, pmc_end_pmevid, pmc_end_date, pmc_closed) VALUES (121, '2014-06-22 21:20:41+08', 'uat_customer2', 74, 'jobsheet', NULL, 1, 1, '2014-06-22 21:20:41+08', NULL, NULL, 'N');
INSERT INTO fcpmcase (pmc_id, pmc_created_date, pmc_created_by, pmc_casekey, pmc_casetype, pmc_parentid, pmc_pmwfid, pmc_start_pmevid, pmc_start_date, pmc_end_pmevid, pmc_end_date, pmc_closed) VALUES (122, '2014-06-22 22:19:07+08', 'uat_customer3', 75, 'jobsheet', NULL, 1, 1, '2014-06-22 22:19:07+08', NULL, NULL, 'N');
INSERT INTO fcpmcase (pmc_id, pmc_created_date, pmc_created_by, pmc_casekey, pmc_casetype, pmc_parentid, pmc_pmwfid, pmc_start_pmevid, pmc_start_date, pmc_end_pmevid, pmc_end_date, pmc_closed) VALUES (123, '2014-06-22 22:22:00+08', 'ysyow', 76, 'jobsheet', NULL, 1, 1, '2014-06-22 22:22:00+08', NULL, NULL, 'N');
INSERT INTO fcpmcase (pmc_id, pmc_created_date, pmc_created_by, pmc_casekey, pmc_casetype, pmc_parentid, pmc_pmwfid, pmc_start_pmevid, pmc_start_date, pmc_end_pmevid, pmc_end_date, pmc_closed) VALUES (124, '2014-06-22 22:25:19+08', 'uat_customer3', 77, 'jobsheet', NULL, 1, 1, '2014-06-22 22:25:19+08', NULL, NULL, 'N');
INSERT INTO fcpmcase (pmc_id, pmc_created_date, pmc_created_by, pmc_casekey, pmc_casetype, pmc_parentid, pmc_pmwfid, pmc_start_pmevid, pmc_start_date, pmc_end_pmevid, pmc_end_date, pmc_closed) VALUES (125, '2014-06-22 22:25:20+08', 'ysyow', 78, 'jobsheet', NULL, 1, 1, '2014-06-22 22:25:20+08', NULL, NULL, 'N');
INSERT INTO fcpmcase (pmc_id, pmc_created_date, pmc_created_by, pmc_casekey, pmc_casetype, pmc_parentid, pmc_pmwfid, pmc_start_pmevid, pmc_start_date, pmc_end_pmevid, pmc_end_date, pmc_closed) VALUES (126, '2014-06-22 22:26:19+08', 'ysyow', 79, 'jobsheet', NULL, 1, 1, '2014-06-22 22:26:19+08', NULL, NULL, 'N');
INSERT INTO fcpmcase (pmc_id, pmc_created_date, pmc_created_by, pmc_casekey, pmc_casetype, pmc_parentid, pmc_pmwfid, pmc_start_pmevid, pmc_start_date, pmc_end_pmevid, pmc_end_date, pmc_closed) VALUES (127, '2014-06-22 22:27:13+08', 'ysyow', 80, 'jobsheet', NULL, 1, 1, '2014-06-22 22:27:13+08', NULL, NULL, 'N');
INSERT INTO fcpmcase (pmc_id, pmc_created_date, pmc_created_by, pmc_casekey, pmc_casetype, pmc_parentid, pmc_pmwfid, pmc_start_pmevid, pmc_start_date, pmc_end_pmevid, pmc_end_date, pmc_closed) VALUES (128, '2014-06-22 22:29:53+08', 'ysyow', 81, 'jobsheet', NULL, 1, 1, '2014-06-22 22:29:53+08', NULL, NULL, 'N');
INSERT INTO fcpmcase (pmc_id, pmc_created_date, pmc_created_by, pmc_casekey, pmc_casetype, pmc_parentid, pmc_pmwfid, pmc_start_pmevid, pmc_start_date, pmc_end_pmevid, pmc_end_date, pmc_closed) VALUES (129, '2014-06-22 22:34:15+08', 'ysyow', 82, 'jobsheet', NULL, 1, 1, '2014-06-22 22:34:15+08', NULL, NULL, 'N');
INSERT INTO fcpmcase (pmc_id, pmc_created_date, pmc_created_by, pmc_casekey, pmc_casetype, pmc_parentid, pmc_pmwfid, pmc_start_pmevid, pmc_start_date, pmc_end_pmevid, pmc_end_date, pmc_closed) VALUES (130, '2014-06-22 22:42:05+08', 'uat_customer3', 83, 'jobsheet', NULL, 1, 1, '2014-06-22 22:42:05+08', NULL, NULL, 'N');
INSERT INTO fcpmcase (pmc_id, pmc_created_date, pmc_created_by, pmc_casekey, pmc_casetype, pmc_parentid, pmc_pmwfid, pmc_start_pmevid, pmc_start_date, pmc_end_pmevid, pmc_end_date, pmc_closed) VALUES (119, '2014-06-22 19:09:29+08', 'uat_customer1', 72, 'jobsheet', NULL, 1, 1, '2014-06-22 19:09:29+08', 6, '2014-06-23 00:23:17+08', 'Y');
INSERT INTO fcpmcase (pmc_id, pmc_created_date, pmc_created_by, pmc_casekey, pmc_casetype, pmc_parentid, pmc_pmwfid, pmc_start_pmevid, pmc_start_date, pmc_end_pmevid, pmc_end_date, pmc_closed) VALUES (131, '2014-06-24 17:17:18+08', 'ysyow', 84, 'jobsheet', NULL, 1, 1, '2014-06-24 17:17:18+08', NULL, NULL, 'N');
INSERT INTO fcpmcase (pmc_id, pmc_created_date, pmc_created_by, pmc_casekey, pmc_casetype, pmc_parentid, pmc_pmwfid, pmc_start_pmevid, pmc_start_date, pmc_end_pmevid, pmc_end_date, pmc_closed) VALUES (133, '2014-06-24 18:38:42+08', 'ysyow', 111, 'jobsheet', NULL, 1, 1, '2014-06-24 18:38:42+08', NULL, NULL, 'N');
INSERT INTO fcpmcase (pmc_id, pmc_created_date, pmc_created_by, pmc_casekey, pmc_casetype, pmc_parentid, pmc_pmwfid, pmc_start_pmevid, pmc_start_date, pmc_end_pmevid, pmc_end_date, pmc_closed) VALUES (134, '2014-06-24 18:41:09+08', 'ysyow', 112, 'jobsheet', NULL, 1, 1, '2014-06-24 18:41:09+08', NULL, NULL, 'N');
INSERT INTO fcpmcase (pmc_id, pmc_created_date, pmc_created_by, pmc_casekey, pmc_casetype, pmc_parentid, pmc_pmwfid, pmc_start_pmevid, pmc_start_date, pmc_end_pmevid, pmc_end_date, pmc_closed) VALUES (135, '2014-06-24 18:47:11+08', 'uat_customer1', 113, 'jobsheet', NULL, 1, 1, '2014-06-24 18:47:11+08', NULL, NULL, 'N');
INSERT INTO fcpmcase (pmc_id, pmc_created_date, pmc_created_by, pmc_casekey, pmc_casetype, pmc_parentid, pmc_pmwfid, pmc_start_pmevid, pmc_start_date, pmc_end_pmevid, pmc_end_date, pmc_closed) VALUES (136, '2014-06-24 19:06:51+08', 'uat_customer1', 114, 'jobsheet', NULL, 1, 1, '2014-06-24 19:06:51+08', NULL, NULL, 'N');
INSERT INTO fcpmcase (pmc_id, pmc_created_date, pmc_created_by, pmc_casekey, pmc_casetype, pmc_parentid, pmc_pmwfid, pmc_start_pmevid, pmc_start_date, pmc_end_pmevid, pmc_end_date, pmc_closed) VALUES (137, '2014-06-25 17:47:27+08', 'uat_customer4', 115, 'jobsheet', NULL, 1, 1, '2014-06-25 17:47:27+08', NULL, NULL, 'N');
INSERT INTO fcpmcase (pmc_id, pmc_created_date, pmc_created_by, pmc_casekey, pmc_casetype, pmc_parentid, pmc_pmwfid, pmc_start_pmevid, pmc_start_date, pmc_end_pmevid, pmc_end_date, pmc_closed) VALUES (139, '2014-06-25 18:09:59+08', 'uat_customer4', 117, 'jobsheet', NULL, 1, 1, '2014-06-25 18:09:59+08', NULL, NULL, 'N');
INSERT INTO fcpmcase (pmc_id, pmc_created_date, pmc_created_by, pmc_casekey, pmc_casetype, pmc_parentid, pmc_pmwfid, pmc_start_pmevid, pmc_start_date, pmc_end_pmevid, pmc_end_date, pmc_closed) VALUES (140, '2014-06-25 18:17:21+08', 'ysyow', 118, 'jobsheet', NULL, 1, 1, '2014-06-25 18:17:21+08', NULL, NULL, 'N');
INSERT INTO fcpmcase (pmc_id, pmc_created_date, pmc_created_by, pmc_casekey, pmc_casetype, pmc_parentid, pmc_pmwfid, pmc_start_pmevid, pmc_start_date, pmc_end_pmevid, pmc_end_date, pmc_closed) VALUES (138, '2014-06-25 18:03:36+08', 'uat_customer4', 116, 'jobsheet', NULL, 1, 1, '2014-06-25 18:03:36+08', 6, '2014-06-25 18:30:17+08', 'Y');


--
-- TOC entry 3037 (class 0 OID 0)
-- Dependencies: 195
-- Name: fcpmcase_pmc_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcpmcase_pmc_id_seq', 140, true);


--
-- TOC entry 2890 (class 0 OID 50264)
-- Dependencies: 196
-- Data for Name: fcpmcasecomment; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (168, 104, NULL, '2014-06-21 18:09:24+08', 'admin2', 'Nice job', NULL, NULL, NULL, 'N', 633);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (169, 104, NULL, '2014-06-21 18:14:16+08', 'supervisor', 'work hard pls', NULL, NULL, NULL, 'N', 634);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (170, 104, NULL, '2014-06-21 18:40:52+08', 'artist1', 'gaodim', NULL, NULL, NULL, 'N', 640);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (171, 106, NULL, '2014-06-21 18:47:14+08', 'uat_cust1', 'customer remark is rubbish', NULL, NULL, NULL, 'N', 644);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (172, 104, NULL, '2014-06-21 18:59:30+08', 'qc', 'QC ok', NULL, NULL, NULL, 'N', 641);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (173, 104, NULL, '2014-06-21 19:04:48+08', 'admin2', 'nice work', NULL, NULL, NULL, 'N', 647);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (174, 107, NULL, '2014-06-21 19:15:41+08', 'uat_cust1', 'Test remark', NULL, NULL, NULL, 'N', 650);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (175, 106, NULL, '2014-06-21 20:36:02+08', 'uat_supervisor1', 'first colour change to 333', NULL, NULL, NULL, 'N', 645);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (176, 106, 175, '2014-06-21 20:48:26+08', 'uat_cust1', 'Okay... I will change it now!', NULL, NULL, NULL, 'N', 656);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (177, 107, NULL, '2014-06-21 21:06:53+08', 'uat_supervisor1', 'colour changed to 333', NULL, NULL, NULL, 'N', 651);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (178, 107, NULL, '2014-06-21 21:29:48+08', 'uat_supervisor1', 'urgent case... do it ASAP', NULL, NULL, NULL, 'N', 660);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (179, 107, NULL, '2014-06-21 21:48:33+08', 'uat_artist1', 'for fong to test', NULL, NULL, NULL, 'N', 666);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (180, 108, NULL, '2014-06-21 21:57:49+08', 'uat_cust1', '123', NULL, NULL, NULL, 'N', 668);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (181, 109, NULL, '2014-06-21 22:17:31+08', 'esp_supervisor', '12313', NULL, NULL, NULL, 'N', 686);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (182, 110, NULL, '2014-06-21 22:24:34+08', 'uat_supervisor1', 'urgent please process as soon as possible', NULL, NULL, NULL, 'N', 689);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (183, 105, NULL, '2014-06-21 22:50:34+08', 'uat_artist1', 'This is completed', NULL, NULL, NULL, 'N', 685);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (184, 105, NULL, '2014-06-21 23:21:50+08', 'uat_qc1', '123', NULL, NULL, NULL, 'N', 702);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (185, 108, NULL, '2014-06-21 23:30:54+08', 'uat_qc1', 'need to redo this thing.. a pile of rubbish!!!!', NULL, NULL, NULL, 'N', 701);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (186, 105, NULL, '2014-06-21 23:45:22+08', 'uat_artist1', 'this is an amended artwork', NULL, NULL, NULL, 'N', 704);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (187, 107, NULL, '2014-06-22 00:08:36+08', 'uat_qc1', 'Work is done. Hope you like it.', NULL, NULL, NULL, 'N', 667);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (188, 105, NULL, '2014-06-22 00:09:16+08', 'uat_qc1', 'The work is done. Hope you like it <3', NULL, NULL, NULL, 'N', 707);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (189, 107, NULL, '2014-06-22 00:31:27+08', 'uat_cust1', 'good to go', NULL, NULL, NULL, 'N', 714);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (190, 105, NULL, '2014-06-22 00:34:23+08', 'uat_cust1', 'this case really have to be rework. I don''t like the colour...', NULL, NULL, NULL, 'N', 716);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (191, 111, NULL, '2014-06-22 14:02:47+08', 'uat_supervisor1', 'Please do this first... ad hoc urgent case', NULL, NULL, NULL, 'N', 738);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (192, 116, NULL, '2014-06-22 16:02:50+08', 'uat_customer1', '1234', NULL, NULL, NULL, 'N', 767);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (193, 114, NULL, '2014-06-22 16:14:30+08', 'qc', 'ok', NULL, NULL, NULL, 'N', 794);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (194, 116, NULL, '2014-06-22 18:27:32+08', 'uat_supervisor1', 'This is something wrong!!', NULL, NULL, NULL, 'N', 768);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (195, 117, NULL, '2014-06-22 18:37:00+08', 'uat_customer1', 'Customer remark...中文', NULL, NULL, NULL, 'N', 801);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (196, 117, NULL, '2014-06-22 18:40:11+08', 'uat_supervisor1', '你错了！', NULL, NULL, NULL, 'N', 802);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (197, 118, NULL, '2014-06-22 19:08:37+08', 'uat_customer1', '1231', NULL, NULL, NULL, 'N', 816);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (198, 119, NULL, '2014-06-22 19:09:29+08', 'uat_customer1', '1231', NULL, NULL, NULL, 'N', 818);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (199, 119, NULL, '2014-06-22 19:17:50+08', 'uat_supervisor1', 'Revert!!!!!!!!错错错！', NULL, NULL, NULL, 'N', 819);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (200, 119, NULL, '2014-06-22 21:14:50+08', 'uat_supervisor1', '中文。。。。。', NULL, NULL, NULL, 'N', 822);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (201, 119, NULL, '2014-06-22 21:34:06+08', 'uat_artist1', 'Artwork...', NULL, NULL, NULL, 'N', 830);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (202, 121, NULL, '2014-06-22 22:06:19+08', 'uat_supervisor2', 'test test', NULL, NULL, NULL, 'N', 832);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (203, 122, NULL, '2014-06-22 22:19:07+08', 'uat_customer3', '123', NULL, NULL, NULL, 'N', 843);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (204, 122, NULL, '2014-06-22 22:38:04+08', 'uat_supervisor2', 'pls fast', NULL, NULL, NULL, 'N', 844);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (205, 123, NULL, '2014-06-22 22:41:20+08', 'uat_artist2', 'perfect', NULL, NULL, NULL, 'N', 872);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (206, 130, NULL, '2014-06-22 22:42:06+08', 'uat_customer3', '123', NULL, NULL, NULL, 'N', 874);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (207, 123, NULL, '2014-06-22 22:42:50+08', 'uat_qc2', 'Incomplete job', NULL, NULL, NULL, 'N', 873);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (208, 130, NULL, '2014-06-22 23:00:58+08', 'uat_supervisor3', 'lala', NULL, NULL, NULL, 'N', 875);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (209, 130, NULL, '2014-06-22 23:02:14+08', 'uat_qc3', 'ReverT!!!', NULL, NULL, NULL, 'N', 884);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (210, 135, NULL, '2014-06-24 18:47:11+08', 'uat_customer1', '12341', NULL, NULL, NULL, 'N', 935);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (211, 135, NULL, '2014-06-24 19:01:40+08', 'uat_supervisor1', 'Testing', NULL, NULL, NULL, 'N', 936);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (212, 135, NULL, '2014-06-24 19:02:27+08', 'uat_artist1', '1234', NULL, NULL, NULL, 'N', 942);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (213, 135, NULL, '2014-06-24 19:02:49+08', 'uat_qc1', '1233', NULL, NULL, NULL, 'N', 943);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (214, 135, NULL, '2014-06-24 19:03:32+08', 'uat_customer1', '1234', NULL, NULL, NULL, 'N', 945);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (215, 135, NULL, '2014-06-24 19:03:52+08', 'uat_supervisor1', '1234', NULL, NULL, NULL, 'N', 947);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (216, 105, NULL, '2014-06-24 19:04:28+08', 'uat_artist1', '1241', NULL, NULL, NULL, 'N', 736);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (217, 105, NULL, '2014-06-24 19:05:17+08', 'uat_qc1', '12341', NULL, NULL, NULL, 'N', 954);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (218, 136, NULL, '2014-06-24 19:06:51+08', 'uat_customer1', '123', NULL, NULL, NULL, 'N', 957);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (219, 136, NULL, '2014-06-24 19:07:13+08', 'uat_supervisor1', '12', NULL, NULL, NULL, 'N', 958);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (220, 136, NULL, '2014-06-24 19:07:39+08', 'uat_artist1', '123', NULL, NULL, NULL, 'N', 964);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (221, 136, NULL, '2014-06-24 19:08:52+08', 'uat_qc1', '123', NULL, NULL, NULL, 'N', 965);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (222, 137, NULL, '2014-06-25 17:47:27+08', 'uat_customer4', 'Customer 1', NULL, NULL, NULL, 'N', 968);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (223, 138, NULL, '2014-06-25 18:03:36+08', 'uat_customer4', 'lalala', NULL, NULL, NULL, 'N', 970);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (224, 139, NULL, '2014-06-25 18:09:59+08', 'uat_customer4', '12341', NULL, NULL, NULL, 'N', 972);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (225, 137, NULL, '2014-06-25 18:21:00+08', 'uat_supervisor4', 'Must have remark!!', NULL, NULL, NULL, 'N', 969);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (226, 138, NULL, '2014-06-25 18:21:17+08', 'uat_supervisor4', 'Assign to artist 4', NULL, NULL, NULL, 'N', 971);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (227, 138, NULL, '2014-06-25 18:25:26+08', 'uat_artist4', 'Job finished!!', NULL, NULL, NULL, 'N', 983);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (228, 138, NULL, '2014-06-25 18:27:41+08', 'uat_qc1', 'QC passed!!', NULL, NULL, NULL, 'N', 984);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (229, 137, NULL, '2014-06-25 18:28:59+08', 'uat_customer4', 'updated remark', NULL, NULL, NULL, 'N', 977);
INSERT INTO fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) VALUES (230, 138, NULL, '2014-06-25 18:30:17+08', 'uat_customer4', 'ACCEPT!!', NULL, NULL, NULL, 'N', 986);


--
-- TOC entry 3038 (class 0 OID 0)
-- Dependencies: 197
-- Name: fcpmcasecomment_pmcc_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcpmcasecomment_pmcc_id_seq', 230, true);


--
-- TOC entry 2892 (class 0 OID 50274)
-- Dependencies: 198
-- Data for Name: fcpmcasecommentread; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (167, 168, 'supervisor', '2014-06-21 18:14:09+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (168, 168, 'artist1', '2014-06-21 18:14:25+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (169, 169, 'artist1', '2014-06-21 18:14:25+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (170, 168, 'qc', '2014-06-21 18:54:53+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (171, 169, 'qc', '2014-06-21 18:54:53+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (172, 170, 'qc', '2014-06-21 18:54:53+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (173, 168, 'admin2', '2014-06-21 19:05:17+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (174, 169, 'admin2', '2014-06-21 19:05:17+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (175, 170, 'admin2', '2014-06-21 19:05:17+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (176, 172, 'admin2', '2014-06-21 19:05:17+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (177, 173, 'admin2', '2014-06-21 19:05:17+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (178, 174, 'uat_supervisor1', '2014-06-21 19:18:40+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (179, 171, 'uat_supervisor1', '2014-06-21 19:18:46+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (180, 171, 'uat_cust1', '2014-06-21 20:47:40+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (181, 175, 'uat_cust1', '2014-06-21 20:47:40+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (182, 176, 'uat_cust1', '2014-06-21 20:48:26+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (183, 174, 'uat_cust1', '2014-06-21 21:07:20+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (184, 177, 'uat_cust1', '2014-06-21 21:07:20+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (185, 177, 'uat_supervisor1', '2014-06-21 21:27:35+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (186, 175, 'uat_supervisor1', '2014-06-21 21:27:35+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (187, 176, 'uat_supervisor1', '2014-06-21 21:27:35+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (188, 174, 'uat_artist1', '2014-06-21 21:38:19+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (189, 177, 'uat_artist1', '2014-06-21 21:38:19+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (190, 178, 'uat_artist1', '2014-06-21 21:38:19+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (191, 180, 'uat_supervisor1', '2014-06-21 21:58:14+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (192, 182, 'uat_supervisor1', '2014-06-21 22:31:50+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (193, 180, 'uat_artist1', '2014-06-21 22:42:39+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (194, 174, 'uat_qc1', '2014-06-21 23:01:18+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (195, 177, 'uat_qc1', '2014-06-21 23:01:18+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (196, 178, 'uat_qc1', '2014-06-21 23:01:18+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (197, 179, 'uat_qc1', '2014-06-21 23:01:18+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (198, 180, 'uat_qc1', '2014-06-21 23:25:28+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (199, 183, 'uat_qc1', '2014-06-21 23:52:03+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (200, 184, 'uat_qc1', '2014-06-21 23:52:03+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (201, 186, 'uat_qc1', '2014-06-21 23:52:03+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (202, 178, 'uat_cust1', '2014-06-22 00:31:24+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (203, 179, 'uat_cust1', '2014-06-22 00:31:24+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (204, 187, 'uat_cust1', '2014-06-22 00:31:24+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (205, 183, 'uat_supervisor1', '2014-06-22 00:34:46+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (206, 184, 'uat_supervisor1', '2014-06-22 00:34:46+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (207, 186, 'uat_supervisor1', '2014-06-22 00:34:46+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (208, 188, 'uat_supervisor1', '2014-06-22 00:34:46+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (209, 190, 'uat_supervisor1', '2014-06-22 00:34:46+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (210, 181, 'supervisor', '2014-06-22 16:44:55+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (211, 192, 'supervisor', '2014-06-22 16:45:06+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (212, 191, 'supervisor', '2014-06-22 16:45:09+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (213, 169, 'supervisor', '2014-06-22 16:45:54+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (214, 170, 'supervisor', '2014-06-22 16:45:54+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (215, 172, 'supervisor', '2014-06-22 16:45:54+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (216, 173, 'supervisor', '2014-06-22 16:45:54+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (217, 192, 'uat_supervisor1', '2014-06-22 18:23:52+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (218, 168, 'ysyow', '2014-06-22 18:25:43+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (219, 169, 'ysyow', '2014-06-22 18:25:43+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (220, 170, 'ysyow', '2014-06-22 18:25:43+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (221, 172, 'ysyow', '2014-06-22 18:25:43+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (222, 173, 'ysyow', '2014-06-22 18:25:43+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (223, 195, 'uat_supervisor1', '2014-06-22 18:39:58+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (224, 195, 'uat_customer1', '2014-06-22 19:05:18+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (225, 196, 'uat_customer1', '2014-06-22 19:05:18+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (226, 198, 'uat_customer1', '2014-06-22 19:18:21+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (227, 199, 'uat_customer1', '2014-06-22 19:18:21+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (228, 198, 'uat_supervisor1', '2014-06-22 21:14:29+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (229, 199, 'uat_supervisor1', '2014-06-22 21:14:29+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (230, 198, 'uat_artist1', '2014-06-22 21:15:32+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (231, 199, 'uat_artist1', '2014-06-22 21:15:32+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (232, 200, 'uat_artist1', '2014-06-22 21:15:32+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (233, 181, 'uat_supervisor2', '2014-06-22 22:05:55+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (234, 195, 'uat_supervisor2', '2014-06-22 22:06:00+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (235, 196, 'uat_supervisor2', '2014-06-22 22:06:00+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (236, 197, 'uat_supervisor2', '2014-06-22 22:06:08+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (237, 202, 'uat_supervisor2', '2014-06-22 22:06:19+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (238, 223, 'uat_supervisor4', '2014-06-25 18:16:07+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (239, 223, 'uat_artist4', '2014-06-25 18:21:56+08');
INSERT INTO fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) VALUES (240, 226, 'uat_artist4', '2014-06-25 18:21:56+08');


--
-- TOC entry 3039 (class 0 OID 0)
-- Dependencies: 199
-- Name: fcpmcasecommentread_pmcr_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcpmcasecommentread_pmcr_id_seq', 240, true);


--
-- TOC entry 2894 (class 0 OID 50280)
-- Dependencies: 200
-- Data for Name: fcpmcaseflag; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fcpmcaseflag (pmcf_id, pmcf_pmcid, pmcf_flag_by, pmcf_flag_date, pmcf_flag_type) VALUES (39, 104, 'artist1', '2014-06-21 18:37:57+08', 'blue');
INSERT INTO fcpmcaseflag (pmcf_id, pmcf_pmcid, pmcf_flag_by, pmcf_flag_date, pmcf_flag_type) VALUES (40, 104, 'ysyow', '2014-06-22 19:25:12+08', 'yellow');
INSERT INTO fcpmcaseflag (pmcf_id, pmcf_pmcid, pmcf_flag_by, pmcf_flag_date, pmcf_flag_type) VALUES (43, 112, 'supervisor', '2014-06-22 22:48:02+08', 'red');
INSERT INTO fcpmcaseflag (pmcf_id, pmcf_pmcid, pmcf_flag_by, pmcf_flag_date, pmcf_flag_type) VALUES (44, 117, 'supervisor', '2014-06-22 22:50:38+08', 'blue');
INSERT INTO fcpmcaseflag (pmcf_id, pmcf_pmcid, pmcf_flag_by, pmcf_flag_date, pmcf_flag_type) VALUES (42, 109, 'supervisor', '2014-06-22 23:13:13+08', 'green');


--
-- TOC entry 3040 (class 0 OID 0)
-- Dependencies: 201
-- Name: fcpmcaseflag_pmcf_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcpmcaseflag_pmcf_id_seq', 44, true);


--
-- TOC entry 2896 (class 0 OID 50286)
-- Dependencies: 202
-- Data for Name: fcpmcaseflow; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (650, 107, 1, 'PM_Event', NULL, NULL, '2014-06-21 19:15:41+08', '2014-06-21 19:15:41+08', 'DONE', NULL, '2014-06-21 19:15:41+08', 'uat_cust1', 650, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (643, 105, 1, 'PM_Activity', 642, 1, '2014-06-21 18:45:26+08', '2014-06-21 22:05:36+08', 'DONE', '2014-06-23 09:30:00+08', '2014-06-21 22:05:36+08', 'uat_supervisor1', 643, 'N', NULL, '2014-06-23 09:30:00+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (657, 106, 1, 'PM_Activity', 656, 7, '2014-06-21 21:03:12+08', '2014-06-21 22:05:14+08', 'DONE', '2014-06-21 21:33:12+08', '2014-06-21 22:05:14+08', 'uat_supervisor1', 657, 'N', NULL, '2014-06-21 21:33:12+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (662, 107, 2, 'PM_Gateway', 661, 4, '2014-06-21 21:29:48+08', '2014-06-21 21:29:48+08', 'DONE', NULL, '2014-06-21 21:29:48+08', 'uat_supervisor1', 662, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (670, 106, 1, 'PM_Gateway', 657, 2, '2014-06-21 22:05:14+08', '2014-06-21 22:05:14+08', 'DONE', NULL, '2014-06-21 22:05:14+08', 'uat_supervisor1', 670, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (653, 107, 7, 'PM_Activity', 651, 27, '2014-06-21 19:56:37+08', '2014-06-21 19:56:37+08', 'DONE', NULL, '2014-06-21 19:56:37+08', 'ysyow', 653, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (681, 105, 3, 'PM_Event', 679, 6, '2014-06-21 22:05:36+08', '2014-06-21 22:06:07+08', 'INTERRUPT', NULL, '2014-06-21 22:05:36+08', 'uat_artist1', 680, 'Y', '2014-06-21 22:05:36+08', '2014-06-21 22:35:36+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (654, 107, 5, 'PM_Event', 653, 28, '2014-06-21 19:56:37+08', '2014-06-21 19:56:37+08', 'END', NULL, '2014-06-21 19:56:37+08', 'ysyow', 654, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (671, 106, 2, 'PM_Gateway', 670, 4, '2014-06-21 22:05:14+08', '2014-06-21 22:05:14+08', 'DONE', NULL, '2014-06-21 22:05:14+08', 'uat_supervisor1', 671, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (633, 104, 1, 'PM_Event', NULL, NULL, '2014-06-21 18:09:24+08', '2014-06-21 18:09:24+08', 'DONE', NULL, '2014-06-21 18:09:24+08', 'admin2', 633, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (645, 106, 1, 'PM_Activity', 644, 1, '2014-06-21 18:47:14+08', '2014-06-21 20:36:02+08', 'DONE', '2014-06-23 09:30:00+08', '2014-06-21 20:36:02+08', 'uat_supervisor1', 645, 'N', NULL, '2014-06-23 09:30:00+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (634, 104, 1, 'PM_Activity', 633, 1, '2014-06-21 18:09:24+08', '2014-06-21 18:14:16+08', 'DONE', '2014-06-23 09:30:00+08', '2014-06-21 18:14:16+08', 'supervisor', 634, 'N', NULL, '2014-06-23 09:30:00+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (635, 104, 1, 'PM_Gateway', 634, 2, '2014-06-21 18:14:16+08', '2014-06-21 18:14:16+08', 'DONE', NULL, '2014-06-21 18:14:16+08', 'supervisor', 635, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (655, 106, 1, 'PM_Gateway', 645, 2, '2014-06-21 20:36:02+08', '2014-06-21 20:36:02+08', 'DONE', NULL, '2014-06-21 20:36:02+08', 'uat_supervisor1', 655, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (636, 104, 2, 'PM_Gateway', 635, 4, '2014-06-21 18:14:16+08', '2014-06-21 18:14:16+08', 'DONE', NULL, '2014-06-21 18:14:16+08', 'supervisor', 636, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (638, 104, 3, 'PM_Event', 636, 6, '2014-06-21 18:14:16+08', '2014-06-21 18:38:00+08', 'INTERRUPT', NULL, '2014-06-21 18:14:16+08', 'artist1', 637, 'Y', '2014-06-21 18:14:16+08', '2014-06-23 09:30:00+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (678, 105, 1, 'PM_Gateway', 643, 2, '2014-06-21 22:05:36+08', '2014-06-21 22:05:36+08', 'DONE', NULL, '2014-06-21 22:05:36+08', 'uat_supervisor1', 678, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (637, 104, 2, 'PM_Event', 636, 5, '2014-06-21 18:14:16+08', '2014-06-21 18:38:00+08', 'DONE', NULL, '2014-06-21 18:38:00+08', 'artist1', 637, 'Y', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (639, 104, 4, 'PM_Gateway', 637, 14, '2014-06-21 18:38:00+08', '2014-06-21 18:38:00+08', 'DONE', NULL, '2014-06-21 18:38:00+08', 'artist1', 639, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (656, 106, 2, 'PM_Activity', 655, 3, '2014-06-21 20:36:02+08', '2014-06-21 21:03:12+08', 'DONE', NULL, '2014-06-21 21:03:12+08', 'uat_cust1', 656, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (640, 104, 4, 'PM_Activity', 639, 15, '2014-06-21 18:38:00+08', '2014-06-21 18:40:52+08', 'DONE', '2014-06-23 11:00:00+08', '2014-06-21 18:40:52+08', 'artist1', 640, 'N', NULL, '2014-06-23 11:00:00+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (642, 105, 1, 'PM_Event', NULL, NULL, '2014-06-21 18:45:26+08', '2014-06-21 18:45:26+08', 'DONE', NULL, '2014-06-21 18:45:26+08', 'uat_cust1', 642, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (644, 106, 1, 'PM_Event', NULL, NULL, '2014-06-21 18:47:14+08', '2014-06-21 18:47:14+08', 'DONE', NULL, '2014-06-21 18:47:14+08', 'uat_cust1', 644, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (664, 107, 3, 'PM_Event', 662, 6, '2014-06-21 21:29:48+08', '2014-06-21 21:48:06+08', 'INTERRUPT', NULL, '2014-06-21 21:29:48+08', 'uat_artist1', 663, 'Y', '2014-06-21 21:29:48+08', '2014-06-21 21:59:48+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (641, 104, 5, 'PM_Activity', 640, 17, '2014-06-21 18:40:52+08', '2014-06-21 18:59:30+08', 'DONE', '2014-06-21 18:50:30+08', '2014-06-21 18:59:30+08', 'qc', 641, 'N', NULL, '2014-06-23 09:40:00+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (651, 107, 1, 'PM_Activity', 650, 1, '2014-06-21 19:15:41+08', '2014-06-21 21:06:53+08', 'DONE', '2014-06-21 19:45:41+08', '2014-06-21 21:06:53+08', 'uat_supervisor1', 651, 'N', '2014-06-21 19:56:37+08', '2014-06-21 20:26:37+08', 2);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (687, 109, 1, 'PM_Activity', 686, 1, '2014-06-21 22:17:31+08', NULL, NULL, '2014-06-21 22:47:31+08', '2014-06-23 00:23:14+08', NULL, NULL, 'N', '2014-06-23 00:23:14+08', '2014-06-23 09:30:00+08', 4);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (663, 107, 2, 'PM_Event', 662, 5, '2014-06-21 21:29:48+08', '2014-06-21 21:48:06+08', 'DONE', NULL, '2014-06-21 21:48:06+08', 'uat_artist1', 663, 'Y', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (646, 104, 5, 'PM_Gateway', 641, 18, '2014-06-21 18:59:30+08', '2014-06-21 18:59:30+08', 'DONE', NULL, '2014-06-21 18:59:30+08', 'qc', 646, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (658, 107, 1, 'PM_Gateway', 651, 2, '2014-06-21 21:06:53+08', '2014-06-21 21:06:53+08', 'DONE', NULL, '2014-06-21 21:06:53+08', 'uat_supervisor1', 658, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (647, 104, 6, 'PM_Activity', 646, 23, '2014-06-21 18:59:30+08', '2014-06-21 19:04:48+08', 'DONE', '2014-06-25 15:00:00+08', '2014-06-21 19:04:48+08', 'admin2', 647, 'N', NULL, '2014-06-24 09:00:00+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (685, 105, 4, 'PM_Activity', 684, 15, '2014-06-21 22:06:07+08', '2014-06-21 22:50:35+08', 'DONE', '2014-06-23 09:06:08+08', '2014-06-21 22:50:34+08', 'uat_artist1', 685, 'N', NULL, '2014-06-23 09:06:08+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (648, 104, 6, 'PM_Gateway', 647, 24, '2014-06-21 19:04:48+08', '2014-06-21 19:04:48+08', 'DONE', NULL, '2014-06-21 19:04:48+08', 'admin2', 648, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (659, 107, 2, 'PM_Activity', 658, 3, '2014-06-21 21:06:53+08', '2014-06-21 21:07:27+08', 'DONE', NULL, '2014-06-21 21:07:27+08', 'uat_cust1', 659, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (649, 104, 6, 'PM_Event', 648, 25, '2014-06-21 19:04:48+08', '2014-06-21 19:04:48+08', 'END', NULL, '2014-06-21 19:04:48+08', 'admin2', 649, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (665, 107, 4, 'PM_Gateway', 663, 14, '2014-06-21 21:48:06+08', '2014-06-21 21:48:07+08', 'DONE', NULL, '2014-06-21 21:48:07+08', 'uat_artist1', 665, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (679, 105, 2, 'PM_Gateway', 678, 4, '2014-06-21 22:05:36+08', '2014-06-21 22:05:36+08', 'DONE', NULL, '2014-06-21 22:05:36+08', 'uat_supervisor1', 679, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (669, 108, 1, 'PM_Activity', 668, 1, '2014-06-21 21:57:49+08', '2014-06-21 22:05:26+08', 'DONE', '2014-06-21 22:27:49+08', '2014-06-21 22:05:26+08', 'uat_supervisor1', 669, 'N', NULL, '2014-06-21 22:27:49+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (666, 107, 4, 'PM_Activity', 665, 15, '2014-06-21 21:48:07+08', '2014-06-21 21:48:33+08', 'DONE', '2014-06-21 23:18:07+08', '2014-06-21 21:48:33+08', 'uat_artist1', 666, 'N', NULL, '2014-06-21 23:18:07+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (660, 107, 1, 'PM_Activity', 659, 7, '2014-06-21 21:07:27+08', '2014-06-21 21:29:48+08', 'DONE', '2014-06-21 21:37:27+08', '2014-06-21 21:29:48+08', 'uat_supervisor1', 660, 'N', NULL, '2014-06-21 21:37:27+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (661, 107, 1, 'PM_Gateway', 660, 2, '2014-06-21 21:29:48+08', '2014-06-21 21:29:48+08', 'DONE', NULL, '2014-06-21 21:29:48+08', 'uat_supervisor1', 661, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (674, 108, 1, 'PM_Gateway', 669, 2, '2014-06-21 22:05:26+08', '2014-06-21 22:05:26+08', 'DONE', NULL, '2014-06-21 22:05:26+08', 'uat_supervisor1', 674, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (668, 108, 1, 'PM_Event', NULL, NULL, '2014-06-21 21:57:49+08', '2014-06-21 21:57:49+08', 'DONE', NULL, '2014-06-21 21:57:49+08', 'uat_cust1', 668, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (680, 105, 2, 'PM_Event', 679, 5, '2014-06-21 22:05:36+08', '2014-06-21 22:06:07+08', 'DONE', NULL, '2014-06-21 22:06:07+08', 'uat_artist1', 680, 'Y', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (675, 108, 2, 'PM_Gateway', 674, 4, '2014-06-21 22:05:26+08', '2014-06-21 22:05:26+08', 'DONE', NULL, '2014-06-21 22:05:26+08', 'uat_supervisor1', 675, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (677, 108, 3, 'PM_Event', 675, 6, '2014-06-21 22:05:26+08', '2014-06-21 22:06:07+08', 'INTERRUPT', NULL, '2014-06-21 22:05:26+08', 'uat_artist1', 676, 'Y', '2014-06-21 22:05:26+08', '2014-06-21 22:35:26+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (688, 110, 1, 'PM_Event', NULL, NULL, '2014-06-21 22:23:53+08', '2014-06-21 22:23:53+08', 'DONE', NULL, '2014-06-21 22:23:53+08', 'uat_cust1', 688, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (684, 105, 4, 'PM_Gateway', 680, 14, '2014-06-21 22:06:07+08', '2014-06-21 22:06:07+08', 'DONE', NULL, '2014-06-21 22:06:07+08', 'uat_artist1', 684, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (676, 108, 2, 'PM_Event', 675, 5, '2014-06-21 22:05:26+08', '2014-06-21 22:06:07+08', 'DONE', NULL, '2014-06-21 22:06:07+08', 'uat_artist1', 676, 'Y', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (682, 108, 4, 'PM_Gateway', 676, 14, '2014-06-21 22:06:07+08', '2014-06-21 22:06:07+08', 'DONE', NULL, '2014-06-21 22:06:07+08', 'uat_artist1', 682, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (686, 109, 1, 'PM_Event', NULL, NULL, '2014-06-21 22:17:31+08', '2014-06-21 22:17:31+08', 'DONE', NULL, '2014-06-21 22:17:31+08', 'esp_supervisor', 686, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (690, 110, 1, 'PM_Gateway', 689, 2, '2014-06-21 22:24:34+08', '2014-06-21 22:24:34+08', 'DONE', NULL, '2014-06-21 22:24:34+08', 'uat_supervisor1', 690, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (689, 110, 1, 'PM_Activity', 688, 1, '2014-06-21 22:23:53+08', '2014-06-21 22:24:34+08', 'DONE', '2014-06-21 22:53:53+08', '2014-06-21 22:24:34+08', 'uat_supervisor1', 689, 'N', NULL, '2014-06-21 22:53:53+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (691, 110, 2, 'PM_Gateway', 690, 4, '2014-06-21 22:24:34+08', '2014-06-21 22:24:34+08', 'DONE', NULL, '2014-06-21 22:24:34+08', 'uat_supervisor1', 691, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (693, 110, 3, 'PM_Event', 691, 6, '2014-06-21 22:24:34+08', '2014-06-21 22:27:03+08', 'DONE', NULL, '2014-06-21 22:27:03+08', 'ysyow', 693, 'Y', '2014-06-21 22:27:03+08', '2014-06-21 22:25:34+08', 1);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (692, 110, 2, 'PM_Event', 691, 5, '2014-06-21 22:24:34+08', '2014-06-21 22:27:03+08', 'INTERRUPT', NULL, NULL, 'ysyow', 693, 'Y', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (694, 107, 12, 'PM_Activity', 667, 30, '2014-06-21 22:27:03+08', '2014-06-21 22:27:03+08', 'DONE', NULL, '2014-06-21 22:27:03+08', 'ysyow', 694, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (695, 107, 5, 'PM_Event', 694, 22, '2014-06-21 22:27:03+08', '2014-06-21 22:27:03+08', 'END', NULL, '2014-06-21 22:27:03+08', 'ysyow', 695, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (672, 106, 2, 'PM_Event', 671, 5, '2014-06-21 22:05:14+08', '2014-06-22 13:34:43+08', 'DONE', NULL, '2014-06-22 13:34:43+08', 'uat_artist1', 672, 'Y', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (696, 110, 8, 'PM_Activity', 693, 8, '2014-06-21 22:27:03+08', '2014-06-21 22:27:03+08', 'DONE', NULL, '2014-06-21 22:27:03+08', 'ysyow', 696, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (667, 107, 5, 'PM_Activity', 666, 17, '2014-06-21 21:48:33+08', '2014-06-22 00:08:36+08', 'DONE', '2014-06-21 22:18:33+08', '2014-06-22 00:08:36+08', 'uat_qc1', 667, 'N', '2014-06-21 22:27:03+08', '2014-06-21 22:57:03+08', 1);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (717, 107, 6, 'PM_Gateway', 714, 24, '2014-06-22 00:31:27+08', '2014-06-22 00:31:27+08', 'DONE', NULL, '2014-06-22 00:31:27+08', 'uat_cust1', 717, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (697, 110, 3, 'PM_Gateway', 696, 9, '2014-06-21 22:27:03+08', '2014-06-21 22:27:03+08', 'DONE', NULL, '2014-06-21 22:27:03+08', 'ysyow', 697, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (698, 110, 2, 'PM_Event', 697, 10, '2014-06-21 22:27:03+08', '2014-06-21 22:27:53+08', 'INTERRUPT', NULL, NULL, 'uat_supervisor1', 699, 'Y', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (699, 110, 4, 'PM_Event', 697, 11, '2014-06-21 22:27:03+08', '2014-06-21 22:27:53+08', 'DONE', NULL, '2014-06-21 22:27:53+08', 'uat_supervisor1', 699, 'Y', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (723, 105, 2, 'PM_Event', 722, 5, '2014-06-22 13:34:05+08', '2014-06-22 13:39:03+08', 'INTERRUPT', '2014-06-22 13:35:05+08', NULL, 'admin', 724, 'Y', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (683, 108, 4, 'PM_Activity', 682, 15, '2014-06-21 22:06:07+08', '2014-06-21 22:48:52+08', 'DONE', '2014-06-21 22:36:07+08', '2014-06-21 22:48:52+08', 'uat_artist1', 683, 'N', NULL, '2014-06-21 22:36:07+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (718, 107, 6, 'PM_Event', 717, 25, '2014-06-22 00:31:27+08', '2014-06-22 00:31:27+08', 'END', NULL, '2014-06-22 00:31:27+08', 'uat_cust1', 718, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (742, 111, 3, 'PM_Event', 740, 6, '2014-06-22 14:02:47+08', '2014-06-22 14:21:26+08', 'DONE', NULL, '2014-06-22 14:21:26+08', 'admin', 742, 'Y', '2014-06-22 14:21:26+08', '2014-06-22 14:03:47+08', 1);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (702, 105, 5, 'PM_Activity', 685, 17, '2014-06-21 22:50:35+08', '2014-06-21 23:21:50+08', 'DONE', '2014-06-21 23:30:35+08', '2014-06-21 23:21:50+08', 'uat_qc1', 702, 'N', NULL, '2014-06-21 23:30:35+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (724, 105, 3, 'PM_Event', 722, 6, '2014-06-22 13:34:05+08', '2014-06-22 13:39:03+08', 'DONE', NULL, '2014-06-22 13:39:03+08', 'admin', 724, 'Y', '2014-06-22 13:39:03+08', '2014-06-22 13:35:05+08', 1);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (703, 105, 5, 'PM_Gateway', 702, 18, '2014-06-21 23:21:50+08', '2014-06-21 23:21:50+08', 'DONE', NULL, '2014-06-21 23:21:50+08', 'uat_qc1', 703, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (716, 105, 6, 'PM_Activity', 715, 23, '2014-06-22 00:09:17+08', '2014-06-22 00:34:23+08', 'DONE', '2014-06-25 15:00:00+08', '2014-06-22 00:34:23+08', 'uat_cust1', 716, 'N', NULL, '2014-06-24 09:00:00+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (701, 108, 5, 'PM_Activity', 683, 17, '2014-06-21 22:48:52+08', '2014-06-21 23:30:54+08', 'DONE', '2014-06-21 22:58:52+08', '2014-06-21 23:30:54+08', 'uat_qc1', 701, 'N', NULL, '2014-06-21 22:58:52+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (719, 105, 6, 'PM_Gateway', 716, 24, '2014-06-22 00:34:23+08', '2014-06-22 00:34:23+08', 'DONE', NULL, '2014-06-22 00:34:23+08', 'uat_cust1', 719, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (705, 108, 5, 'PM_Gateway', 701, 18, '2014-06-21 23:30:54+08', '2014-06-21 23:30:54+08', 'DONE', NULL, '2014-06-21 23:30:54+08', 'uat_qc1', 705, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (740, 111, 2, 'PM_Gateway', 739, 4, '2014-06-22 14:02:47+08', '2014-06-22 14:02:47+08', 'DONE', NULL, '2014-06-22 14:02:47+08', 'uat_supervisor1', 740, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (731, 105, 8, 'PM_Activity', 724, 8, '2014-06-22 13:39:03+08', '2014-06-22 13:39:03+08', 'DONE', NULL, '2014-06-22 13:39:03+08', 'admin', 731, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (704, 105, 10, 'PM_Activity', 703, 19, '2014-06-21 23:21:50+08', '2014-06-21 23:45:23+08', 'DONE', '2014-06-23 09:01:51+08', '2014-06-21 23:45:22+08', 'uat_artist1', 704, 'N', NULL, '2014-06-23 09:01:51+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (720, 105, 1, 'PM_Activity', 719, 26, '2014-06-22 00:34:23+08', '2014-06-22 13:34:04+08', 'DONE', '2014-06-23 09:30:00+08', '2014-06-22 13:34:04+08', 'uat_supervisor1', 720, 'N', NULL, '2014-06-23 09:30:00+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (721, 105, 1, 'PM_Gateway', 720, 2, '2014-06-22 13:34:04+08', '2014-06-22 13:34:05+08', 'DONE', NULL, '2014-06-22 13:34:04+08', 'uat_supervisor1', 721, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (700, 110, 9, 'PM_Activity', 699, 12, '2014-06-21 22:27:53+08', '2014-06-22 00:07:32+08', 'DONE', NULL, '2014-06-22 00:07:32+08', 'uat_supervisor1', 700, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (732, 105, 3, 'PM_Gateway', 731, 9, '2014-06-22 13:39:03+08', '2014-06-22 13:39:03+08', 'DONE', NULL, '2014-06-22 13:39:03+08', 'admin', 732, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (708, 110, 2, 'PM_Gateway', 700, 13, '2014-06-22 00:07:32+08', '2014-06-22 00:07:32+08', 'DONE', NULL, '2014-06-22 00:07:32+08', 'uat_supervisor1', 708, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (722, 105, 2, 'PM_Gateway', 721, 4, '2014-06-22 13:34:05+08', '2014-06-22 13:34:05+08', 'DONE', NULL, '2014-06-22 13:34:05+08', 'uat_supervisor1', 722, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (710, 110, 3, 'PM_Event', 708, 6, '2014-06-22 00:07:32+08', '2014-06-22 00:07:59+08', 'INTERRUPT', NULL, '2014-06-22 00:07:32+08', 'uat_artist1', 709, 'Y', '2014-06-22 00:07:32+08', '2014-06-23 09:01:00+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (709, 110, 2, 'PM_Event', 708, 5, '2014-06-22 00:07:32+08', '2014-06-22 00:07:59+08', 'DONE', '2014-06-23 09:01:00+08', '2014-06-22 00:07:59+08', 'uat_artist1', 709, 'Y', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (711, 110, 4, 'PM_Gateway', 709, 14, '2014-06-22 00:07:59+08', '2014-06-22 00:07:59+08', 'DONE', NULL, '2014-06-22 00:07:59+08', 'uat_artist1', 711, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (712, 110, 10, 'PM_Activity', 711, 16, '2014-06-22 00:07:59+08', NULL, NULL, '2014-06-23 09:10:00+08', NULL, NULL, NULL, 'N', NULL, '2014-06-23 09:10:00+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (713, 107, 5, 'PM_Gateway', 667, 18, '2014-06-22 00:08:36+08', '2014-06-22 00:08:36+08', 'DONE', NULL, '2014-06-22 00:08:36+08', 'uat_qc1', 713, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (673, 106, 3, 'PM_Event', 671, 6, '2014-06-21 22:05:14+08', '2014-06-22 13:34:43+08', 'INTERRUPT', NULL, '2014-06-21 22:05:14+08', 'uat_artist1', 672, 'Y', '2014-06-21 22:05:14+08', '2014-06-21 22:35:14+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (707, 105, 5, 'PM_Activity', 704, 20, '2014-06-21 23:45:23+08', '2014-06-22 00:09:17+08', 'DONE', '2014-06-23 09:25:24+08', '2014-06-22 00:09:16+08', 'uat_qc1', 707, 'N', NULL, '2014-06-23 09:25:24+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (734, 105, 4, 'PM_Event', 732, 11, '2014-06-22 13:39:03+08', '2014-06-22 13:41:48+08', 'INTERRUPT', NULL, NULL, 'uat_artist1', 733, 'Y', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (715, 105, 5, 'PM_Gateway', 707, 18, '2014-06-22 00:09:17+08', '2014-06-22 00:09:17+08', 'DONE', NULL, '2014-06-22 00:09:17+08', 'uat_qc1', 715, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (725, 106, 4, 'PM_Gateway', 672, 14, '2014-06-22 13:34:43+08', '2014-06-22 13:34:43+08', 'DONE', NULL, '2014-06-22 13:34:43+08', 'uat_artist1', 725, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (714, 107, 6, 'PM_Activity', 713, 23, '2014-06-22 00:08:36+08', '2014-06-22 00:31:27+08', 'DONE', '2014-06-25 15:00:00+08', '2014-06-22 00:31:27+08', 'uat_cust1', 714, 'N', NULL, '2014-06-24 09:00:00+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (733, 105, 2, 'PM_Event', 732, 10, '2014-06-22 13:39:03+08', '2014-06-22 13:41:48+08', 'DONE', '2014-06-22 13:40:03+08', '2014-06-22 13:41:48+08', 'uat_artist1', 733, 'Y', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (727, 109, 7, 'PM_Activity', 687, 27, '2014-06-22 13:39:02+08', '2014-06-22 13:39:02+08', 'DONE', NULL, '2014-06-22 13:39:02+08', 'admin', 727, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (728, 109, 5, 'PM_Event', 727, 28, '2014-06-22 13:39:02+08', '2014-06-22 13:39:02+08', 'END', NULL, '2014-06-22 13:39:02+08', 'admin', 728, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (745, 106, 11, 'PM_Activity', 726, 31, '2014-06-22 14:21:25+08', '2014-06-22 14:21:26+08', 'DONE', NULL, '2014-06-22 14:21:25+08', 'admin', 745, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (735, 105, 4, 'PM_Gateway', 733, 14, '2014-06-22 13:41:48+08', '2014-06-22 13:41:48+08', 'DONE', NULL, '2014-06-22 13:41:48+08', 'uat_artist1', 735, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (729, 108, 11, 'PM_Activity', 706, 31, '2014-06-22 13:39:02+08', '2014-06-22 13:39:03+08', 'DONE', NULL, '2014-06-22 13:39:02+08', 'admin', 729, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (730, 108, 5, 'PM_Event', 729, 21, '2014-06-22 13:39:03+08', '2014-06-22 13:39:03+08', 'END', NULL, '2014-06-22 13:39:03+08', 'admin', 730, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (737, 111, 1, 'PM_Event', NULL, NULL, '2014-06-22 14:01:20+08', '2014-06-22 14:01:20+08', 'DONE', NULL, '2014-06-22 14:01:20+08', 'uat_supervisor1', 737, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (738, 111, 1, 'PM_Activity', 737, 1, '2014-06-22 14:01:20+08', '2014-06-22 14:02:47+08', 'DONE', '2014-06-22 14:31:20+08', '2014-06-22 14:02:47+08', 'uat_supervisor1', 738, 'N', NULL, '2014-06-22 14:31:20+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (743, 109, 7, 'PM_Activity', 687, 27, '2014-06-22 14:21:25+08', '2014-06-22 14:21:25+08', 'DONE', NULL, '2014-06-22 14:21:25+08', 'admin', 743, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (739, 111, 1, 'PM_Gateway', 738, 2, '2014-06-22 14:02:47+08', '2014-06-22 14:02:47+08', 'DONE', NULL, '2014-06-22 14:02:47+08', 'uat_supervisor1', 739, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (747, 111, 8, 'PM_Activity', 742, 8, '2014-06-22 14:21:26+08', '2014-06-22 14:21:26+08', 'DONE', NULL, '2014-06-22 14:21:26+08', 'admin', 747, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (744, 109, 5, 'PM_Event', 743, 28, '2014-06-22 14:21:25+08', '2014-06-22 14:21:25+08', 'END', NULL, '2014-06-22 14:21:25+08', 'admin', 744, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (746, 106, 5, 'PM_Event', 745, 21, '2014-06-22 14:21:26+08', '2014-06-22 14:21:26+08', 'END', NULL, '2014-06-22 14:21:26+08', 'admin', 746, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (706, 108, 10, 'PM_Activity', 705, 19, '2014-06-21 23:30:54+08', NULL, NULL, '2014-06-21 23:40:54+08', '2014-06-23 00:23:40+08', NULL, NULL, 'N', '2014-06-22 13:39:02+08', '2014-06-22 13:49:02+08', 1);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (751, 111, 9, 'PM_Activity', 750, 12, '2014-06-22 14:40:58+08', '2014-06-22 22:07:09+08', 'DONE', NULL, '2014-06-22 22:07:09+08', 'uat_supervisor2', 751, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (741, 111, 2, 'PM_Event', 740, 5, '2014-06-22 14:02:47+08', '2014-06-22 14:21:26+08', 'INTERRUPT', '2014-06-22 14:03:47+08', NULL, 'admin', 742, 'Y', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (749, 111, 2, 'PM_Event', 748, 10, '2014-06-22 14:21:26+08', '2014-06-22 14:40:58+08', 'INTERRUPT', '2014-06-22 14:22:26+08', NULL, 'uat_supervisor1', 750, 'Y', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (748, 111, 3, 'PM_Gateway', 747, 9, '2014-06-22 14:21:26+08', '2014-06-22 14:21:26+08', 'DONE', NULL, '2014-06-22 14:21:26+08', 'admin', 748, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (750, 111, 4, 'PM_Event', 748, 11, '2014-06-22 14:21:26+08', '2014-06-22 14:40:58+08', 'DONE', NULL, '2014-06-22 14:40:58+08', 'uat_supervisor1', 750, 'Y', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (755, 113, 1, 'PM_Activity', 754, 1, '2014-06-22 15:09:06+08', '2014-06-22 16:04:31+08', 'DONE', '2014-06-22 15:39:06+08', '2014-06-22 16:04:31+08', 'supervisor', 755, 'N', NULL, '2014-06-22 15:39:06+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (752, 112, 1, 'PM_Event', NULL, NULL, '2014-06-22 15:06:57+08', '2014-06-22 15:06:57+08', 'DONE', NULL, '2014-06-22 15:06:57+08', 'uat_cust1', 752, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (754, 113, 1, 'PM_Event', NULL, NULL, '2014-06-22 15:09:06+08', '2014-06-22 15:09:06+08', 'DONE', NULL, '2014-06-22 15:09:06+08', 'uat_cust1', 754, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (756, 114, 1, 'PM_Event', NULL, NULL, '2014-06-22 15:09:52+08', '2014-06-22 15:09:52+08', 'DONE', NULL, '2014-06-22 15:09:52+08', 'uat_cust1', 756, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (758, 115, 1, 'PM_Event', NULL, NULL, '2014-06-22 15:53:21+08', '2014-06-22 15:53:21+08', 'DONE', NULL, '2014-06-22 15:53:21+08', 'ysyow', 758, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (757, 114, 1, 'PM_Activity', 756, 1, '2014-06-22 15:09:52+08', '2014-06-22 16:09:17+08', 'DONE', '2014-06-22 15:39:52+08', '2014-06-22 16:09:17+08', 'supervisor', 757, 'N', NULL, '2014-06-22 15:39:52+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (726, 106, 10, 'PM_Activity', 725, 16, '2014-06-22 13:34:43+08', NULL, NULL, '2014-06-22 14:14:43+08', '2014-06-23 00:23:40+08', NULL, NULL, 'N', '2014-06-22 14:21:25+08', '2014-06-22 15:01:25+08', 1);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (753, 112, 1, 'PM_Activity', 752, 1, '2014-06-22 15:06:57+08', '2014-06-22 15:54:20+08', 'DONE', '2014-06-22 15:36:57+08', '2014-06-22 15:54:20+08', 'supervisor', 753, 'N', NULL, '2014-06-22 15:36:57+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (801, 117, 1, 'PM_Event', NULL, NULL, '2014-06-22 18:37:00+08', '2014-06-22 18:37:00+08', 'DONE', NULL, '2014-06-22 18:37:00+08', 'uat_customer1', 801, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (760, 112, 1, 'PM_Gateway', 753, 2, '2014-06-22 15:54:20+08', '2014-06-22 15:54:20+08', 'DONE', NULL, '2014-06-22 15:54:20+08', 'supervisor', 760, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (794, 114, 5, 'PM_Activity', 793, 20, '2014-06-22 16:14:09+08', '2014-06-22 16:14:30+08', 'DONE', '2014-06-22 16:24:09+08', '2014-06-22 16:14:30+08', 'qc', 794, 'N', NULL, '2014-06-22 16:24:09+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (783, 114, 5, 'PM_Activity', 782, 17, '2014-06-22 16:09:46+08', '2014-06-22 16:10:10+08', 'DONE', '2014-06-22 16:19:46+08', '2014-06-22 16:10:10+08', 'qc', 783, 'N', NULL, '2014-06-22 16:19:46+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (761, 112, 2, 'PM_Activity', 760, 3, '2014-06-22 15:54:20+08', '2014-06-22 15:55:16+08', 'DONE', NULL, '2014-06-22 15:55:16+08', 'ysyow', 761, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (759, 115, 1, 'PM_Activity', 758, 1, '2014-06-22 15:53:21+08', '2014-06-22 15:55:29+08', 'DONE', '2014-06-22 16:23:21+08', '2014-06-22 15:55:29+08', 'supervisor', 759, 'N', NULL, '2014-06-22 16:23:21+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (784, 114, 5, 'PM_Gateway', 783, 18, '2014-06-22 16:10:10+08', '2014-06-22 16:10:10+08', 'DONE', NULL, '2014-06-22 16:10:10+08', 'qc', 784, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (763, 115, 1, 'PM_Gateway', 759, 2, '2014-06-22 15:55:29+08', '2014-06-22 15:55:29+08', 'DONE', NULL, '2014-06-22 15:55:29+08', 'supervisor', 763, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (764, 115, 2, 'PM_Gateway', 763, 4, '2014-06-22 15:55:29+08', '2014-06-22 15:55:29+08', 'DONE', NULL, '2014-06-22 15:55:29+08', 'supervisor', 764, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (795, 114, 5, 'PM_Gateway', 794, 18, '2014-06-22 16:14:30+08', '2014-06-22 16:14:30+08', 'DONE', NULL, '2014-06-22 16:14:30+08', 'qc', 795, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (767, 116, 1, 'PM_Event', NULL, NULL, '2014-06-22 16:02:50+08', '2014-06-22 16:02:50+08', 'DONE', NULL, '2014-06-22 16:02:50+08', 'uat_customer1', 767, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (785, 114, 6, 'PM_Activity', 784, 23, '2014-06-22 16:10:10+08', '2014-06-22 16:13:00+08', 'DONE', '2014-06-24 16:10:11+08', '2014-06-22 16:13:00+08', 'ysyow', 785, 'N', NULL, '2014-06-23 16:10:10+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (769, 113, 1, 'PM_Gateway', 755, 2, '2014-06-22 16:04:31+08', '2014-06-22 16:04:31+08', 'DONE', NULL, '2014-06-22 16:04:31+08', 'supervisor', 769, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (770, 113, 2, 'PM_Gateway', 769, 4, '2014-06-22 16:04:31+08', '2014-06-22 16:04:31+08', 'DONE', NULL, '2014-06-22 16:04:31+08', 'supervisor', 770, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (786, 114, 6, 'PM_Gateway', 785, 24, '2014-06-22 16:13:00+08', '2014-06-22 16:13:00+08', 'DONE', NULL, '2014-06-22 16:13:00+08', 'ysyow', 786, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (766, 115, 3, 'PM_Event', 764, 6, '2014-06-22 15:55:29+08', '2014-06-22 16:05:11+08', 'INTERRUPT', NULL, '2014-06-22 15:55:29+08', 'artist2', 765, 'Y', '2014-06-22 15:55:29+08', '2014-06-22 15:56:29+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (765, 115, 2, 'PM_Event', 764, 5, '2014-06-22 15:55:29+08', '2014-06-22 16:05:11+08', 'DONE', '2014-06-22 15:56:29+08', '2014-06-22 16:05:11+08', 'artist2', 765, 'Y', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (807, 105, 11, 'PM_Activity', 736, 29, '2014-06-22 18:42:27+08', '2014-06-22 18:42:27+08', 'DONE', NULL, '2014-06-22 18:42:27+08', 'qc', 807, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (773, 115, 4, 'PM_Gateway', 765, 14, '2014-06-22 16:05:11+08', '2014-06-22 16:05:11+08', 'DONE', NULL, '2014-06-22 16:05:11+08', 'artist2', 773, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (772, 113, 3, 'PM_Event', 770, 6, '2014-06-22 16:04:31+08', '2014-06-22 16:05:11+08', 'INTERRUPT', NULL, '2014-06-22 16:04:31+08', 'artist2', 771, 'Y', '2014-06-22 16:04:31+08', '2014-06-22 16:05:31+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (771, 113, 2, 'PM_Event', 770, 5, '2014-06-22 16:04:31+08', '2014-06-22 16:05:11+08', 'DONE', '2014-06-22 16:05:31+08', '2014-06-22 16:05:11+08', 'artist2', 771, 'Y', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (787, 114, 1, 'PM_Activity', 786, 26, '2014-06-22 16:13:00+08', '2014-06-22 16:13:26+08', 'DONE', '2014-06-22 16:43:00+08', '2014-06-22 16:13:26+08', 'supervisor', 787, 'N', NULL, '2014-06-22 16:43:00+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (775, 113, 4, 'PM_Gateway', 771, 14, '2014-06-22 16:05:11+08', '2014-06-22 16:05:11+08', 'DONE', NULL, '2014-06-22 16:05:11+08', 'artist2', 775, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (804, 117, 2, 'PM_Activity', 803, 3, '2014-06-22 18:40:11+08', '2014-06-22 19:05:44+08', 'DONE', NULL, '2014-06-22 19:05:44+08', 'uat_customer1', 804, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (777, 114, 1, 'PM_Gateway', 757, 2, '2014-06-22 16:09:17+08', '2014-06-22 16:09:17+08', 'DONE', NULL, '2014-06-22 16:09:17+08', 'supervisor', 777, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (796, 114, 6, 'PM_Activity', 795, 23, '2014-06-22 16:14:30+08', '2014-06-22 16:14:41+08', 'DONE', '2014-06-24 16:14:31+08', '2014-06-22 16:14:41+08', 'ysyow', 796, 'N', NULL, '2014-06-23 16:14:30+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (778, 114, 2, 'PM_Gateway', 777, 4, '2014-06-22 16:09:17+08', '2014-06-22 16:09:17+08', 'DONE', NULL, '2014-06-22 16:09:17+08', 'supervisor', 778, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (788, 114, 1, 'PM_Gateway', 787, 2, '2014-06-22 16:13:26+08', '2014-06-22 16:13:26+08', 'DONE', NULL, '2014-06-22 16:13:26+08', 'supervisor', 788, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (780, 114, 3, 'PM_Event', 778, 6, '2014-06-22 16:09:17+08', '2014-06-22 16:09:28+08', 'INTERRUPT', NULL, '2014-06-22 16:09:17+08', 'artist2', 779, 'Y', '2014-06-22 16:09:17+08', '2014-06-22 16:10:17+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (779, 114, 2, 'PM_Event', 778, 5, '2014-06-22 16:09:17+08', '2014-06-22 16:09:28+08', 'DONE', '2014-06-22 16:10:17+08', '2014-06-22 16:09:28+08', 'artist2', 779, 'Y', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (789, 114, 2, 'PM_Gateway', 788, 4, '2014-06-22 16:13:26+08', '2014-06-22 16:13:26+08', 'DONE', NULL, '2014-06-22 16:13:26+08', 'supervisor', 789, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (781, 114, 4, 'PM_Gateway', 779, 14, '2014-06-22 16:09:28+08', '2014-06-22 16:09:28+08', 'DONE', NULL, '2014-06-22 16:09:28+08', 'artist2', 781, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (782, 114, 4, 'PM_Activity', 781, 15, '2014-06-22 16:09:28+08', '2014-06-22 16:09:46+08', 'DONE', '2014-06-22 16:39:28+08', '2014-06-22 16:09:46+08', 'artist2', 782, 'N', NULL, '2014-06-22 16:39:28+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (802, 117, 1, 'PM_Activity', 801, 1, '2014-06-22 18:37:00+08', '2014-06-22 18:40:11+08', 'DONE', '2014-06-22 19:07:00+08', '2014-06-22 18:40:11+08', 'uat_supervisor1', 802, 'N', NULL, '2014-06-22 19:07:00+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (797, 114, 6, 'PM_Gateway', 796, 24, '2014-06-22 16:14:41+08', '2014-06-22 16:14:41+08', 'DONE', NULL, '2014-06-22 16:14:41+08', 'ysyow', 797, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (791, 114, 3, 'PM_Event', 789, 6, '2014-06-22 16:13:26+08', '2014-06-22 16:13:52+08', 'INTERRUPT', NULL, '2014-06-22 16:13:26+08', 'artist2', 790, 'Y', '2014-06-22 16:13:26+08', '2014-06-22 16:14:26+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (790, 114, 2, 'PM_Event', 789, 5, '2014-06-22 16:13:26+08', '2014-06-22 16:13:52+08', 'DONE', '2014-06-22 16:14:26+08', '2014-06-22 16:13:52+08', 'artist2', 790, 'Y', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (792, 114, 4, 'PM_Gateway', 790, 14, '2014-06-22 16:13:52+08', '2014-06-22 16:13:52+08', 'DONE', NULL, '2014-06-22 16:13:52+08', 'artist2', 792, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (798, 114, 6, 'PM_Event', 797, 25, '2014-06-22 16:14:41+08', '2014-06-22 16:14:41+08', 'END', NULL, '2014-06-22 16:14:41+08', 'ysyow', 798, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (811, 113, 11, 'PM_Activity', 776, 31, '2014-06-22 18:42:27+08', '2014-06-22 18:42:28+08', 'DONE', NULL, '2014-06-22 18:42:27+08', 'qc', 811, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (793, 114, 10, 'PM_Activity', 792, 16, '2014-06-22 16:13:52+08', '2014-06-22 16:14:09+08', 'DONE', '2014-06-22 16:23:52+08', '2014-06-22 16:14:09+08', 'artist2', 793, 'N', NULL, '2014-06-22 16:23:52+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (803, 117, 1, 'PM_Gateway', 802, 2, '2014-06-22 18:40:11+08', '2014-06-22 18:40:11+08', 'DONE', NULL, '2014-06-22 18:40:11+08', 'uat_supervisor1', 803, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (808, 105, 5, 'PM_Event', 807, 21, '2014-06-22 18:42:27+08', '2014-06-22 18:42:27+08', 'END', NULL, '2014-06-22 18:42:27+08', 'qc', 808, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (805, 109, 7, 'PM_Activity', 687, 27, '2014-06-22 18:42:26+08', '2014-06-22 18:42:27+08', 'DONE', NULL, '2014-06-22 18:42:26+08', 'qc', 805, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (768, 116, 1, 'PM_Activity', 767, 1, '2014-06-22 16:02:50+08', '2014-06-22 18:27:32+08', 'DONE', '2014-06-22 16:32:50+08', '2014-06-22 18:27:32+08', 'uat_supervisor1', 768, 'N', NULL, '2014-06-22 16:32:50+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (799, 116, 1, 'PM_Gateway', 768, 2, '2014-06-22 18:27:32+08', '2014-06-22 18:27:32+08', 'DONE', NULL, '2014-06-22 18:27:32+08', 'uat_supervisor1', 799, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (800, 116, 2, 'PM_Activity', 799, 3, '2014-06-22 18:27:32+08', NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (810, 112, 5, 'PM_Event', 809, 28, '2014-06-22 18:42:27+08', '2014-06-22 18:42:27+08', 'END', NULL, '2014-06-22 18:42:27+08', 'qc', 810, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (806, 109, 5, 'PM_Event', 805, 28, '2014-06-22 18:42:27+08', '2014-06-22 18:42:27+08', 'END', NULL, '2014-06-22 18:42:27+08', 'qc', 806, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (762, 112, 1, 'PM_Activity', 761, 7, '2014-06-22 15:55:16+08', NULL, NULL, '2014-06-22 16:25:16+08', '2014-06-23 00:23:15+08', NULL, NULL, 'N', '2014-06-23 00:23:15+08', '2014-06-23 09:30:00+08', 2);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (776, 113, 10, 'PM_Activity', 775, 16, '2014-06-22 16:05:11+08', NULL, NULL, '2014-06-22 17:11:11+08', '2014-06-23 00:23:40+08', NULL, NULL, 'N', '2014-06-22 18:42:27+08', '2014-06-22 19:48:27+08', 1);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (809, 112, 7, 'PM_Activity', 762, 27, '2014-06-22 18:42:27+08', '2014-06-22 18:42:27+08', 'DONE', NULL, '2014-06-22 18:42:27+08', 'qc', 809, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (813, 115, 11, 'PM_Activity', 774, 31, '2014-06-22 18:42:28+08', '2014-06-22 18:42:28+08', 'DONE', NULL, '2014-06-22 18:42:28+08', 'qc', 813, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (774, 115, 10, 'PM_Activity', 773, 16, '2014-06-22 16:05:11+08', NULL, NULL, '2014-06-22 16:35:11+08', '2014-06-23 00:23:40+08', NULL, NULL, 'N', '2014-06-22 18:42:28+08', '2014-06-22 19:12:28+08', 1);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (812, 113, 5, 'PM_Event', 811, 21, '2014-06-22 18:42:28+08', '2014-06-22 18:42:28+08', 'END', NULL, '2014-06-22 18:42:28+08', 'qc', 812, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (814, 115, 5, 'PM_Event', 813, 21, '2014-06-22 18:42:28+08', '2014-06-22 18:42:28+08', 'END', NULL, '2014-06-22 18:42:28+08', 'qc', 814, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (816, 118, 1, 'PM_Event', NULL, NULL, '2014-06-22 19:08:37+08', '2014-06-22 19:08:37+08', 'DONE', NULL, '2014-06-22 19:08:37+08', 'uat_customer1', 816, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (818, 119, 1, 'PM_Event', NULL, NULL, '2014-06-22 19:09:29+08', '2014-06-22 19:09:29+08', 'DONE', NULL, '2014-06-22 19:09:29+08', 'uat_customer1', 818, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (819, 119, 1, 'PM_Activity', 818, 1, '2014-06-22 19:09:29+08', '2014-06-22 19:17:50+08', 'DONE', NULL, '2014-06-22 19:17:50+08', 'uat_supervisor1', 819, 'N', NULL, '2014-06-22 19:09:29+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (820, 119, 1, 'PM_Gateway', 819, 2, '2014-06-22 19:17:50+08', '2014-06-22 19:17:50+08', 'DONE', NULL, '2014-06-22 19:17:50+08', 'uat_supervisor1', 820, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (815, 117, 1, 'PM_Activity', 804, 7, '2014-06-22 19:05:44+08', NULL, NULL, NULL, '2014-06-23 00:23:15+08', NULL, NULL, 'N', '2014-06-23 00:23:15+08', '2014-06-23 09:30:00+08', 1);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (817, 118, 1, 'PM_Activity', 816, 1, '2014-06-22 19:08:37+08', NULL, NULL, NULL, '2014-06-23 00:23:15+08', NULL, NULL, 'N', '2014-06-23 00:23:15+08', '2014-06-23 09:30:00+08', 1);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (849, 125, 1, 'PM_Event', NULL, NULL, '2014-06-22 22:25:20+08', '2014-06-22 22:25:20+08', 'DONE', NULL, '2014-06-22 22:25:20+08', 'ysyow', 849, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (821, 119, 2, 'PM_Activity', 820, 3, '2014-06-22 19:17:50+08', '2014-06-22 19:18:31+08', 'DONE', NULL, '2014-06-22 19:18:31+08', 'uat_customer1', 821, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (851, 126, 1, 'PM_Event', NULL, NULL, '2014-06-22 22:26:19+08', '2014-06-22 22:26:19+08', 'DONE', NULL, '2014-06-22 22:26:19+08', 'ysyow', 851, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (822, 119, 1, 'PM_Activity', 821, 7, '2014-06-22 19:18:31+08', '2014-06-22 21:14:50+08', 'DONE', '2014-06-22 19:48:31+08', '2014-06-22 21:14:49+08', 'uat_supervisor1', 822, 'N', NULL, '2014-06-22 19:18:31+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (825, 119, 1, 'PM_Gateway', 822, 2, '2014-06-22 21:14:50+08', '2014-06-22 21:14:50+08', 'DONE', NULL, '2014-06-22 21:14:50+08', 'uat_supervisor1', 825, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (826, 119, 2, 'PM_Gateway', 825, 4, '2014-06-22 21:14:50+08', '2014-06-22 21:14:50+08', 'DONE', NULL, '2014-06-22 21:14:50+08', 'uat_supervisor1', 826, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (853, 127, 1, 'PM_Event', NULL, NULL, '2014-06-22 22:27:13+08', '2014-06-22 22:27:13+08', 'DONE', NULL, '2014-06-22 22:27:13+08', 'ysyow', 853, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (828, 119, 3, 'PM_Event', 826, 6, '2014-06-22 21:14:50+08', '2014-06-22 21:15:57+08', 'INTERRUPT', NULL, '2014-06-22 21:14:50+08', 'uat_artist1', 827, 'Y', '2014-06-22 21:14:50+08', '2014-06-22 21:15:50+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (827, 119, 2, 'PM_Event', 826, 5, '2014-06-22 21:14:50+08', '2014-06-22 21:15:57+08', 'DONE', '2014-06-22 21:15:50+08', '2014-06-22 21:15:57+08', 'uat_artist1', 827, 'Y', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (855, 128, 1, 'PM_Event', NULL, NULL, '2014-06-22 22:29:53+08', '2014-06-22 22:29:53+08', 'DONE', NULL, '2014-06-22 22:29:53+08', 'ysyow', 855, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (829, 119, 4, 'PM_Gateway', 827, 14, '2014-06-22 21:15:57+08', '2014-06-22 21:15:57+08', 'DONE', NULL, '2014-06-22 21:15:57+08', 'uat_artist1', 829, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (831, 121, 1, 'PM_Event', NULL, NULL, '2014-06-22 21:20:41+08', '2014-06-22 21:20:41+08', 'DONE', NULL, '2014-06-22 21:20:41+08', 'uat_customer2', 831, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (857, 129, 1, 'PM_Event', NULL, NULL, '2014-06-22 22:34:15+08', '2014-06-22 22:34:15+08', 'DONE', NULL, '2014-06-22 22:34:15+08', 'ysyow', 857, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (830, 119, 4, 'PM_Activity', 829, 15, '2014-06-22 21:15:57+08', '2014-06-22 21:34:06+08', 'DONE', '2014-06-23 09:25:58+08', '2014-06-22 21:34:06+08', 'uat_artist1', 830, 'N', NULL, '2014-06-22 21:15:57+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (878, 130, 1, 'PM_Gateway', 875, 2, '2014-06-22 23:00:58+08', '2014-06-22 23:00:58+08', 'DONE', NULL, '2014-06-22 23:00:58+08', 'uat_supervisor3', 878, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (833, 119, 5, 'PM_Activity', 830, 17, '2014-06-22 21:34:06+08', '2014-06-22 21:56:20+08', 'DONE', '2014-06-22 22:37:06+08', '2014-06-22 21:56:20+08', 'uat_qc1', 833, 'N', NULL, '2014-06-22 21:34:06+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (877, 123, 10, 'PM_Activity', 876, 19, '2014-06-22 22:42:50+08', NULL, NULL, '2014-06-22 23:35:50+08', '2014-06-23 00:23:17+08', NULL, NULL, 'N', '2014-06-23 00:23:17+08', '2014-06-23 09:53:00+08', 1);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (834, 119, 5, 'PM_Gateway', 833, 18, '2014-06-22 21:56:20+08', '2014-06-22 21:56:20+08', 'DONE', NULL, '2014-06-22 21:56:20+08', 'uat_qc1', 834, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (846, 123, 1, 'PM_Activity', 845, 1, '2014-06-22 22:22:00+08', '2014-06-22 22:39:44+08', 'DONE', NULL, '2014-06-22 22:39:44+08', 'uat_supervisor2', 846, 'N', NULL, '2014-06-22 22:22:00+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (832, 121, 1, 'PM_Activity', 831, 1, '2014-06-22 21:20:41+08', '2014-06-22 22:06:51+08', 'DONE', NULL, '2014-06-22 22:06:51+08', 'uat_supervisor2', 832, 'N', NULL, '2014-06-22 21:20:41+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (858, 129, 1, 'PM_Activity', 857, 1, '2014-06-22 22:34:15+08', '2014-06-22 22:36:58+08', 'DONE', '2014-06-22 23:04:15+08', '2014-06-22 22:36:58+08', 'supervisor', 858, 'N', NULL, '2014-06-22 23:04:15+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (836, 121, 1, 'PM_Gateway', 832, 2, '2014-06-22 22:06:51+08', '2014-06-22 22:06:51+08', 'DONE', NULL, '2014-06-22 22:06:51+08', 'uat_supervisor2', 836, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (837, 121, 2, 'PM_Gateway', 836, 4, '2014-06-22 22:06:51+08', '2014-06-22 22:06:51+08', 'DONE', NULL, '2014-06-22 22:06:51+08', 'uat_supervisor2', 837, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (872, 123, 4, 'PM_Activity', 871, 15, '2014-06-22 22:40:36+08', '2014-06-22 22:41:20+08', 'DONE', '2014-06-23 10:20:37+08', '2014-06-22 22:41:20+08', 'uat_artist2', 872, 'N', NULL, '2014-06-23 10:20:37+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (862, 129, 3, 'PM_Event', 860, 6, '2014-06-22 22:36:58+08', '2014-06-23 00:23:18+08', 'DONE', NULL, '2014-06-23 00:23:18+08', 'supervisor', 862, 'Y', '2014-06-23 00:23:18+08', '2014-06-22 22:37:58+08', 1);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (859, 129, 1, 'PM_Gateway', 858, 2, '2014-06-22 22:36:58+08', '2014-06-22 22:36:58+08', 'DONE', NULL, '2014-06-22 22:36:58+08', 'supervisor', 859, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (840, 111, 2, 'PM_Gateway', 751, 13, '2014-06-22 22:07:09+08', '2014-06-22 22:07:09+08', 'DONE', NULL, '2014-06-22 22:07:09+08', 'uat_supervisor2', 840, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (841, 111, 2, 'PM_Event', 840, 5, '2014-06-22 22:07:09+08', '2014-06-23 00:23:18+08', 'INTERRUPT', '2014-06-22 22:08:09+08', NULL, 'supervisor', 842, 'Y', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (843, 122, 1, 'PM_Event', NULL, NULL, '2014-06-22 22:19:07+08', '2014-06-22 22:19:07+08', 'DONE', NULL, '2014-06-22 22:19:07+08', 'uat_customer3', 843, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (845, 123, 1, 'PM_Event', NULL, NULL, '2014-06-22 22:22:00+08', '2014-06-22 22:22:00+08', 'DONE', NULL, '2014-06-22 22:22:00+08', 'ysyow', 845, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (847, 124, 1, 'PM_Event', NULL, NULL, '2014-06-22 22:25:19+08', '2014-06-22 22:25:19+08', 'DONE', NULL, '2014-06-22 22:25:19+08', 'uat_customer3', 847, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (867, 123, 1, 'PM_Gateway', 846, 2, '2014-06-22 22:39:44+08', '2014-06-22 22:39:44+08', 'DONE', NULL, '2014-06-22 22:39:44+08', 'uat_supervisor2', 867, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (860, 129, 2, 'PM_Gateway', 859, 4, '2014-06-22 22:36:58+08', '2014-06-22 22:36:58+08', 'DONE', NULL, '2014-06-22 22:36:58+08', 'supervisor', 860, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (861, 129, 2, 'PM_Event', 860, 5, '2014-06-22 22:36:58+08', '2014-06-23 00:23:18+08', 'INTERRUPT', '2014-06-22 22:37:58+08', NULL, 'supervisor', 862, 'Y', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (868, 123, 2, 'PM_Gateway', 867, 4, '2014-06-22 22:39:44+08', '2014-06-22 22:39:44+08', 'DONE', NULL, '2014-06-22 22:39:44+08', 'uat_supervisor2', 868, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (844, 122, 1, 'PM_Activity', 843, 1, '2014-06-22 22:19:07+08', '2014-06-22 22:38:04+08', 'DONE', NULL, '2014-06-22 22:38:04+08', 'uat_supervisor2', 844, 'N', NULL, '2014-06-22 22:19:07+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (863, 122, 1, 'PM_Gateway', 844, 2, '2014-06-22 22:38:04+08', '2014-06-22 22:38:04+08', 'DONE', NULL, '2014-06-22 22:38:04+08', 'uat_supervisor2', 863, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (864, 122, 2, 'PM_Gateway', 863, 4, '2014-06-22 22:38:04+08', '2014-06-22 22:38:04+08', 'DONE', NULL, '2014-06-22 22:38:04+08', 'uat_supervisor2', 864, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (870, 123, 3, 'PM_Event', 868, 6, '2014-06-22 22:39:44+08', '2014-06-22 22:40:36+08', 'INTERRUPT', NULL, '2014-06-22 22:39:44+08', 'uat_artist2', 869, 'Y', '2014-06-22 22:39:44+08', '2014-06-22 22:40:44+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (874, 130, 1, 'PM_Event', NULL, NULL, '2014-06-22 22:42:05+08', '2014-06-22 22:42:06+08', 'DONE', NULL, '2014-06-22 22:42:05+08', 'uat_customer3', 874, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (869, 123, 2, 'PM_Event', 868, 5, '2014-06-22 22:39:44+08', '2014-06-22 22:40:36+08', 'DONE', '2014-06-22 22:40:44+08', '2014-06-22 22:40:36+08', 'uat_artist2', 869, 'Y', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (871, 123, 4, 'PM_Gateway', 869, 14, '2014-06-22 22:40:36+08', '2014-06-22 22:40:36+08', 'DONE', NULL, '2014-06-22 22:40:36+08', 'uat_artist2', 871, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (884, 130, 5, 'PM_Activity', 883, 17, '2014-06-22 23:01:48+08', '2014-06-22 23:02:15+08', 'DONE', '2014-06-22 23:54:48+08', '2014-06-22 23:02:14+08', 'uat_qc3', 884, 'N', NULL, '2014-06-22 23:54:48+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (875, 130, 1, 'PM_Activity', 874, 1, '2014-06-22 22:42:06+08', '2014-06-22 23:00:58+08', 'DONE', '2014-06-22 23:12:06+08', '2014-06-22 23:00:58+08', 'uat_supervisor3', 875, 'N', NULL, '2014-06-22 23:12:06+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (873, 123, 5, 'PM_Activity', 872, 17, '2014-06-22 22:41:20+08', '2014-06-22 22:42:50+08', 'DONE', '2014-06-22 23:34:20+08', '2014-06-22 22:42:50+08', 'uat_qc2', 873, 'N', NULL, '2014-06-22 23:34:20+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (876, 123, 5, 'PM_Gateway', 873, 18, '2014-06-22 22:42:50+08', '2014-06-22 22:42:50+08', 'DONE', NULL, '2014-06-22 22:42:50+08', 'uat_qc2', 876, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (880, 130, 2, 'PM_Event', 879, 5, '2014-06-22 23:00:58+08', '2014-06-22 23:01:20+08', 'DONE', '2014-06-22 23:01:58+08', '2014-06-22 23:01:20+08', 'uat_artist3', 880, 'Y', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (879, 130, 2, 'PM_Gateway', 878, 4, '2014-06-22 23:00:58+08', '2014-06-22 23:00:58+08', 'DONE', NULL, '2014-06-22 23:00:58+08', 'uat_supervisor3', 879, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (881, 130, 3, 'PM_Event', 879, 6, '2014-06-22 23:00:58+08', '2014-06-22 23:01:20+08', 'INTERRUPT', NULL, '2014-06-22 23:00:58+08', 'uat_artist3', 880, 'Y', '2014-06-22 23:00:58+08', '2014-06-22 23:01:58+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (882, 130, 4, 'PM_Gateway', 880, 14, '2014-06-22 23:01:20+08', '2014-06-22 23:01:20+08', 'DONE', NULL, '2014-06-22 23:01:20+08', 'uat_artist3', 882, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (883, 130, 4, 'PM_Activity', 882, 15, '2014-06-22 23:01:20+08', '2014-06-22 23:01:48+08', 'DONE', '2014-06-23 10:41:21+08', '2014-06-22 23:01:48+08', 'uat_artist3', 883, 'N', NULL, '2014-06-23 10:41:21+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (885, 130, 5, 'PM_Gateway', 884, 18, '2014-06-22 23:02:15+08', '2014-06-22 23:02:15+08', 'DONE', NULL, '2014-06-22 23:02:15+08', 'uat_qc3', 885, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (835, 119, 6, 'PM_Activity', 834, 23, '2014-06-22 21:56:20+08', '2014-06-23 00:23:17+08', 'INTERRUPT', '2014-06-25 12:56:21+08', '2014-06-23 00:23:17+08', 'supervisor', 835, 'N', '2014-06-23 00:23:17+08', '2014-06-22 21:56:20+08', 1);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (887, 109, 7, 'PM_Activity', 687, 27, '2014-06-23 00:23:14+08', '2014-06-23 00:23:14+08', 'DONE', NULL, '2014-06-23 00:23:14+08', 'supervisor', 887, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (850, 125, 1, 'PM_Activity', 849, 1, '2014-06-22 22:25:20+08', NULL, NULL, NULL, '2014-06-23 00:23:16+08', NULL, NULL, 'N', '2014-06-23 00:23:16+08', '2014-06-23 09:30:00+08', 1);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (852, 126, 1, 'PM_Activity', 851, 1, '2014-06-22 22:26:19+08', NULL, NULL, NULL, '2014-06-23 00:23:16+08', NULL, NULL, 'N', '2014-06-23 00:23:16+08', '2014-06-23 09:30:00+08', 1);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (854, 127, 1, 'PM_Activity', 853, 1, '2014-06-22 22:27:13+08', NULL, NULL, NULL, '2014-06-23 00:23:17+08', NULL, NULL, 'N', '2014-06-23 00:23:17+08', '2014-06-23 09:30:00+08', 1);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (839, 121, 3, 'PM_Event', 837, 6, '2014-06-22 22:06:51+08', '2014-06-23 00:23:17+08', 'DONE', NULL, '2014-06-23 00:23:17+08', 'supervisor', 839, 'Y', '2014-06-23 00:23:17+08', '2014-06-22 22:07:51+08', 1);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (848, 124, 1, 'PM_Activity', 847, 1, '2014-06-22 22:25:19+08', NULL, NULL, NULL, '2014-06-23 00:23:18+08', NULL, NULL, 'N', '2014-06-23 00:23:18+08', '2014-06-23 09:30:00+08', 1);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (866, 122, 3, 'PM_Event', 864, 6, '2014-06-22 22:38:04+08', '2014-06-23 00:23:18+08', 'DONE', NULL, '2014-06-23 00:23:18+08', 'supervisor', 866, 'Y', '2014-06-23 00:23:18+08', '2014-06-22 22:39:04+08', 1);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (886, 130, 10, 'PM_Activity', 885, 19, '2014-06-22 23:02:15+08', NULL, NULL, '2014-06-22 23:55:15+08', '2014-06-23 00:23:18+08', NULL, NULL, 'N', '2014-06-23 00:23:18+08', '2014-06-23 09:53:00+08', 1);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (888, 109, 5, 'PM_Event', 887, 28, '2014-06-23 00:23:14+08', '2014-06-23 00:23:14+08', 'END', NULL, '2014-06-23 00:23:14+08', 'supervisor', 888, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (914, 111, 4, 'PM_Event', 912, 11, '2014-06-23 00:23:18+08', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (889, 112, 7, 'PM_Activity', 762, 27, '2014-06-23 00:23:15+08', '2014-06-23 00:23:15+08', 'DONE', NULL, '2014-06-23 00:23:15+08', 'supervisor', 889, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (890, 112, 5, 'PM_Event', 889, 28, '2014-06-23 00:23:15+08', '2014-06-23 00:23:15+08', 'END', NULL, '2014-06-23 00:23:15+08', 'supervisor', 890, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (891, 117, 7, 'PM_Activity', 815, 27, '2014-06-23 00:23:15+08', '2014-06-23 00:23:15+08', 'DONE', NULL, '2014-06-23 00:23:15+08', 'supervisor', 891, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (915, 124, 7, 'PM_Activity', 848, 27, '2014-06-23 00:23:18+08', '2014-06-23 00:23:18+08', 'DONE', NULL, '2014-06-23 00:23:18+08', 'supervisor', 915, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (892, 117, 5, 'PM_Event', 891, 28, '2014-06-23 00:23:15+08', '2014-06-23 00:23:15+08', 'END', NULL, '2014-06-23 00:23:15+08', 'supervisor', 892, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (893, 118, 7, 'PM_Activity', 817, 27, '2014-06-23 00:23:15+08', '2014-06-23 00:23:16+08', 'DONE', NULL, '2014-06-23 00:23:15+08', 'supervisor', 893, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (931, 133, 1, 'PM_Event', NULL, NULL, '2014-06-24 18:38:42+08', '2014-06-24 18:38:42+08', 'DONE', NULL, '2014-06-24 18:38:42+08', 'ysyow', 931, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (894, 118, 5, 'PM_Event', 893, 28, '2014-06-23 00:23:16+08', '2014-06-23 00:23:16+08', 'END', NULL, '2014-06-23 00:23:16+08', 'supervisor', 894, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (916, 124, 5, 'PM_Event', 915, 28, '2014-06-23 00:23:18+08', '2014-06-23 00:23:18+08', 'END', NULL, '2014-06-23 00:23:18+08', 'supervisor', 916, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (895, 125, 7, 'PM_Activity', 850, 27, '2014-06-23 00:23:16+08', '2014-06-23 00:23:16+08', 'DONE', NULL, '2014-06-23 00:23:16+08', 'supervisor', 895, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (896, 125, 5, 'PM_Event', 895, 28, '2014-06-23 00:23:16+08', '2014-06-23 00:23:16+08', 'END', NULL, '2014-06-23 00:23:16+08', 'supervisor', 896, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (932, 133, 1, 'PM_Activity', 931, 1, '2014-06-24 18:38:42+08', NULL, NULL, '2014-06-25 09:30:00+08', NULL, NULL, NULL, 'N', NULL, '2014-06-25 09:30:00+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (897, 126, 7, 'PM_Activity', 852, 27, '2014-06-23 00:23:16+08', '2014-06-23 00:23:17+08', 'DONE', NULL, '2014-06-23 00:23:16+08', 'supervisor', 897, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (917, 129, 8, 'PM_Activity', 862, 8, '2014-06-23 00:23:18+08', '2014-06-23 00:23:18+08', 'DONE', NULL, '2014-06-23 00:23:18+08', 'supervisor', 917, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (898, 126, 5, 'PM_Event', 897, 28, '2014-06-23 00:23:17+08', '2014-06-23 00:23:17+08', 'END', NULL, '2014-06-23 00:23:17+08', 'supervisor', 898, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (899, 127, 7, 'PM_Activity', 854, 27, '2014-06-23 00:23:17+08', '2014-06-23 00:23:17+08', 'DONE', NULL, '2014-06-23 00:23:17+08', 'supervisor', 899, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (900, 127, 5, 'PM_Event', 899, 28, '2014-06-23 00:23:17+08', '2014-06-23 00:23:17+08', 'END', NULL, '2014-06-23 00:23:17+08', 'supervisor', 900, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (856, 128, 1, 'PM_Activity', 855, 1, '2014-06-22 22:29:53+08', NULL, NULL, NULL, '2014-06-23 00:23:17+08', NULL, NULL, 'N', '2014-06-23 00:23:17+08', '2014-06-23 09:30:00+08', 1);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (918, 129, 3, 'PM_Gateway', 917, 9, '2014-06-23 00:23:18+08', '2014-06-23 00:23:18+08', 'DONE', NULL, '2014-06-23 00:23:18+08', 'supervisor', 918, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (901, 128, 7, 'PM_Activity', 856, 27, '2014-06-23 00:23:17+08', '2014-06-23 00:23:17+08', 'DONE', NULL, '2014-06-23 00:23:17+08', 'supervisor', 901, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (919, 129, 2, 'PM_Event', 918, 10, '2014-06-23 00:23:18+08', NULL, NULL, '2014-06-23 09:01:00+08', NULL, NULL, NULL, 'Y', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (902, 128, 5, 'PM_Event', 901, 28, '2014-06-23 00:23:17+08', '2014-06-23 00:23:17+08', 'END', NULL, '2014-06-23 00:23:17+08', 'supervisor', 902, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (920, 129, 4, 'PM_Event', 918, 11, '2014-06-23 00:23:18+08', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (903, 123, 11, 'PM_Activity', 877, 31, '2014-06-23 00:23:17+08', '2014-06-23 00:23:17+08', 'DONE', NULL, '2014-06-23 00:23:17+08', 'supervisor', 903, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (865, 122, 2, 'PM_Event', 864, 5, '2014-06-22 22:38:04+08', '2014-06-23 00:23:18+08', 'INTERRUPT', '2014-06-22 22:39:04+08', NULL, 'supervisor', 866, 'Y', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (904, 123, 5, 'PM_Event', 903, 21, '2014-06-23 00:23:17+08', '2014-06-23 00:23:17+08', 'END', NULL, '2014-06-23 00:23:17+08', 'supervisor', 904, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (905, 119, 13, 'PM_Activity', 835, 32, '2014-06-23 00:23:17+08', '2014-06-23 00:23:17+08', 'ERROR', NULL, '2014-06-23 00:23:17+08', 'supervisor', 905, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (933, 134, 1, 'PM_Event', NULL, NULL, '2014-06-24 18:41:09+08', '2014-06-24 18:41:09+08', 'DONE', NULL, '2014-06-24 18:41:09+08', 'ysyow', 933, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (906, 119, 6, 'PM_Event', 905, 33, '2014-06-23 00:23:17+08', '2014-06-23 00:23:17+08', 'END', NULL, '2014-06-23 00:23:17+08', 'supervisor', 906, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (838, 121, 2, 'PM_Event', 837, 5, '2014-06-22 22:06:51+08', '2014-06-23 00:23:17+08', 'INTERRUPT', '2014-06-22 22:07:51+08', NULL, 'supervisor', 839, 'Y', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (921, 122, 8, 'PM_Activity', 866, 8, '2014-06-23 00:23:18+08', '2014-06-23 00:23:18+08', 'DONE', NULL, '2014-06-23 00:23:18+08', 'supervisor', 921, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (907, 121, 8, 'PM_Activity', 839, 8, '2014-06-23 00:23:17+08', '2014-06-23 00:23:17+08', 'DONE', NULL, '2014-06-23 00:23:17+08', 'supervisor', 907, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (908, 121, 3, 'PM_Gateway', 907, 9, '2014-06-23 00:23:17+08', '2014-06-23 00:23:17+08', 'DONE', NULL, '2014-06-23 00:23:17+08', 'supervisor', 908, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (909, 121, 2, 'PM_Event', 908, 10, '2014-06-23 00:23:17+08', NULL, NULL, '2014-06-23 09:01:00+08', NULL, NULL, NULL, 'Y', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (910, 121, 4, 'PM_Event', 908, 11, '2014-06-23 00:23:17+08', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (842, 111, 3, 'PM_Event', 840, 6, '2014-06-22 22:07:09+08', '2014-06-23 00:23:18+08', 'DONE', NULL, '2014-06-23 00:23:17+08', 'supervisor', 842, 'Y', '2014-06-23 00:23:18+08', '2014-06-22 22:08:09+08', 1);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (911, 111, 8, 'PM_Activity', 842, 8, '2014-06-23 00:23:18+08', '2014-06-23 00:23:18+08', 'DONE', NULL, '2014-06-23 00:23:18+08', 'supervisor', 911, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (922, 122, 3, 'PM_Gateway', 921, 9, '2014-06-23 00:23:18+08', '2014-06-23 00:23:18+08', 'DONE', NULL, '2014-06-23 00:23:18+08', 'supervisor', 922, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (912, 111, 3, 'PM_Gateway', 911, 9, '2014-06-23 00:23:18+08', '2014-06-23 00:23:18+08', 'DONE', NULL, '2014-06-23 00:23:18+08', 'supervisor', 912, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (913, 111, 2, 'PM_Event', 912, 10, '2014-06-23 00:23:18+08', NULL, NULL, '2014-06-23 09:01:00+08', NULL, NULL, NULL, 'Y', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (923, 122, 2, 'PM_Event', 922, 10, '2014-06-23 00:23:18+08', NULL, NULL, '2014-06-23 09:01:00+08', NULL, NULL, NULL, 'Y', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (924, 122, 4, 'PM_Event', 922, 11, '2014-06-23 00:23:18+08', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (940, 135, 3, 'PM_Event', 938, 6, '2014-06-24 19:01:40+08', '2014-06-24 19:02:09+08', 'INTERRUPT', NULL, '2014-06-24 19:01:40+08', 'uat_artist1', 939, 'Y', '2014-06-24 19:01:40+08', '2014-06-25 09:01:00+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (925, 130, 11, 'PM_Activity', 886, 31, '2014-06-23 00:23:18+08', '2014-06-23 00:23:18+08', 'DONE', NULL, '2014-06-23 00:23:18+08', 'supervisor', 925, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (926, 130, 5, 'PM_Event', 925, 21, '2014-06-23 00:23:18+08', '2014-06-23 00:23:18+08', 'END', NULL, '2014-06-23 00:23:18+08', 'supervisor', 926, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (736, 105, 4, 'PM_Activity', 735, 15, '2014-06-22 13:41:48+08', '2014-06-24 19:04:28+08', 'DONE', '2014-06-22 15:41:48+08', '2014-06-24 19:04:28+08', 'uat_artist1', 736, 'N', '2014-06-22 18:42:27+08', '2014-06-22 20:42:27+08', 1);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (927, 131, 1, 'PM_Event', NULL, NULL, '2014-06-24 17:17:18+08', '2014-06-24 17:17:18+08', 'DONE', NULL, '2014-06-24 17:17:18+08', 'ysyow', 927, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (928, 131, 1, 'PM_Activity', 927, 1, '2014-06-24 17:17:18+08', NULL, NULL, '2014-06-24 17:47:18+08', NULL, NULL, NULL, 'N', NULL, '2014-06-24 17:47:18+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (936, 135, 1, 'PM_Activity', 935, 1, '2014-06-24 18:47:11+08', '2014-06-24 19:01:40+08', 'DONE', '2014-06-25 09:30:00+08', '2014-06-24 19:01:40+08', 'uat_supervisor1', 936, 'N', NULL, '2014-06-25 09:30:00+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (935, 135, 1, 'PM_Event', NULL, NULL, '2014-06-24 18:47:11+08', '2014-06-24 18:47:11+08', 'DONE', NULL, '2014-06-24 18:47:11+08', 'uat_customer1', 935, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (943, 135, 5, 'PM_Activity', 942, 17, '2014-06-24 19:02:27+08', '2014-06-24 19:02:49+08', 'DONE', '2014-06-25 09:40:00+08', '2014-06-24 19:02:49+08', 'uat_qc1', 943, 'N', NULL, '2014-06-25 09:40:00+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (937, 135, 1, 'PM_Gateway', 936, 2, '2014-06-24 19:01:40+08', '2014-06-24 19:01:40+08', 'DONE', NULL, '2014-06-24 19:01:40+08', 'uat_supervisor1', 937, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (939, 135, 2, 'PM_Event', 938, 5, '2014-06-24 19:01:40+08', '2014-06-24 19:02:09+08', 'DONE', '2014-06-25 09:01:00+08', '2014-06-24 19:02:09+08', 'uat_artist1', 939, 'Y', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (938, 135, 2, 'PM_Gateway', 937, 4, '2014-06-24 19:01:40+08', '2014-06-24 19:01:40+08', 'DONE', NULL, '2014-06-24 19:01:40+08', 'uat_supervisor1', 938, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (945, 135, 6, 'PM_Activity', 944, 23, '2014-06-24 19:02:49+08', '2014-06-24 19:03:32+08', 'DONE', '2014-06-27 15:00:00+08', '2014-06-24 19:03:32+08', 'uat_customer1', 945, 'N', NULL, '2014-06-26 09:00:00+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (942, 135, 4, 'PM_Activity', 941, 15, '2014-06-24 19:02:09+08', '2014-06-24 19:02:27+08', 'DONE', '2014-06-25 11:00:00+08', '2014-06-24 19:02:27+08', 'uat_artist1', 942, 'N', NULL, '2014-06-25 11:00:00+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (941, 135, 4, 'PM_Gateway', 939, 14, '2014-06-24 19:02:09+08', '2014-06-24 19:02:09+08', 'DONE', NULL, '2014-06-24 19:02:09+08', 'uat_artist1', 941, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (944, 135, 5, 'PM_Gateway', 943, 18, '2014-06-24 19:02:49+08', '2014-06-24 19:02:49+08', 'DONE', NULL, '2014-06-24 19:02:49+08', 'uat_qc1', 944, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (947, 135, 1, 'PM_Activity', 946, 26, '2014-06-24 19:03:32+08', '2014-06-24 19:03:53+08', 'DONE', '2014-06-25 09:30:00+08', '2014-06-24 19:03:52+08', 'uat_supervisor1', 947, 'N', NULL, '2014-06-25 09:30:00+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (946, 135, 6, 'PM_Gateway', 945, 24, '2014-06-24 19:03:32+08', '2014-06-24 19:03:32+08', 'DONE', NULL, '2014-06-24 19:03:32+08', 'uat_customer1', 946, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (934, 134, 1, 'PM_Activity', 933, 1, '2014-06-24 18:41:09+08', NULL, NULL, '2014-06-25 09:30:00+08', '2014-06-25 18:19:16+08', NULL, NULL, 'N', NULL, '2014-06-25 09:30:00+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (948, 135, 1, 'PM_Gateway', 947, 2, '2014-06-24 19:03:53+08', '2014-06-24 19:03:53+08', 'DONE', NULL, '2014-06-24 19:03:53+08', 'uat_supervisor1', 948, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (949, 135, 2, 'PM_Gateway', 948, 4, '2014-06-24 19:03:53+08', '2014-06-24 19:03:53+08', 'DONE', NULL, '2014-06-24 19:03:53+08', 'uat_supervisor1', 949, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (982, 138, 4, 'PM_Gateway', 980, 14, '2014-06-25 18:22:01+08', '2014-06-25 18:22:01+08', 'DONE', NULL, '2014-06-25 18:22:01+08', 'uat_artist4', 982, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (951, 135, 3, 'PM_Event', 949, 6, '2014-06-24 19:03:53+08', '2014-06-24 19:04:18+08', 'INTERRUPT', NULL, '2014-06-24 19:03:53+08', 'uat_artist1', 950, 'Y', '2014-06-24 19:03:53+08', '2014-06-25 09:01:00+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (950, 135, 2, 'PM_Event', 949, 5, '2014-06-24 19:03:53+08', '2014-06-24 19:04:18+08', 'DONE', '2014-06-25 09:01:00+08', '2014-06-24 19:04:18+08', 'uat_artist1', 950, 'Y', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (952, 135, 4, 'PM_Gateway', 950, 14, '2014-06-24 19:04:18+08', '2014-06-24 19:04:18+08', 'DONE', NULL, '2014-06-24 19:04:18+08', 'uat_artist1', 952, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (953, 135, 10, 'PM_Activity', 952, 16, '2014-06-24 19:04:18+08', NULL, NULL, '2014-06-25 09:40:00+08', NULL, NULL, NULL, 'N', NULL, '2014-06-25 09:40:00+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (988, 138, 6, 'PM_Gateway', 986, 24, '2014-06-25 18:30:17+08', '2014-06-25 18:30:17+08', 'DONE', NULL, '2014-06-25 18:30:17+08', 'uat_customer4', 988, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (954, 105, 5, 'PM_Activity', 736, 17, '2014-06-24 19:04:28+08', '2014-06-24 19:05:17+08', 'DONE', '2014-06-25 09:40:00+08', '2014-06-24 19:05:17+08', 'uat_qc1', 954, 'N', NULL, '2014-06-25 09:40:00+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (989, 138, 6, 'PM_Event', 988, 25, '2014-06-25 18:30:17+08', '2014-06-25 18:30:17+08', 'END', NULL, '2014-06-25 18:30:17+08', 'uat_customer4', 989, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (955, 105, 5, 'PM_Gateway', 954, 18, '2014-06-24 19:05:17+08', '2014-06-24 19:05:17+08', 'DONE', NULL, '2014-06-24 19:05:17+08', 'uat_qc1', 955, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (956, 105, 6, 'PM_Activity', 955, 23, '2014-06-24 19:05:17+08', NULL, NULL, '2014-06-27 15:00:00+08', NULL, NULL, NULL, 'N', NULL, '2014-06-26 09:00:00+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (957, 136, 1, 'PM_Event', NULL, NULL, '2014-06-24 19:06:51+08', '2014-06-24 19:06:51+08', 'DONE', NULL, '2014-06-24 19:06:51+08', 'uat_customer1', 957, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (983, 138, 4, 'PM_Activity', 982, 15, '2014-06-25 18:22:01+08', '2014-06-25 18:25:26+08', 'DONE', '2014-06-26 11:00:00+08', '2014-06-25 18:25:25+08', 'uat_artist4', 983, 'N', NULL, '2014-06-26 11:00:00+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (958, 136, 1, 'PM_Activity', 957, 1, '2014-06-24 19:06:51+08', '2014-06-24 19:07:13+08', 'DONE', '2014-06-25 09:30:00+08', '2014-06-24 19:07:13+08', 'uat_supervisor1', 958, 'N', NULL, '2014-06-25 09:30:00+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (959, 136, 1, 'PM_Gateway', 958, 2, '2014-06-24 19:07:13+08', '2014-06-24 19:07:13+08', 'DONE', NULL, '2014-06-24 19:07:13+08', 'uat_supervisor1', 959, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (960, 136, 2, 'PM_Gateway', 959, 4, '2014-06-24 19:07:13+08', '2014-06-24 19:07:13+08', 'DONE', NULL, '2014-06-24 19:07:13+08', 'uat_supervisor1', 960, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (962, 136, 3, 'PM_Event', 960, 6, '2014-06-24 19:07:13+08', '2014-06-24 19:07:29+08', 'INTERRUPT', NULL, '2014-06-24 19:07:13+08', 'uat_artist1', 961, 'Y', '2014-06-24 19:07:13+08', '2014-06-25 09:01:00+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (961, 136, 2, 'PM_Event', 960, 5, '2014-06-24 19:07:13+08', '2014-06-24 19:07:29+08', 'DONE', '2014-06-25 09:01:00+08', '2014-06-24 19:07:29+08', 'uat_artist1', 961, 'Y', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (984, 138, 5, 'PM_Activity', 983, 17, '2014-06-25 18:25:26+08', '2014-06-25 18:27:41+08', 'DONE', '2014-06-26 09:40:00+08', '2014-06-25 18:27:41+08', 'uat_qc1', 984, 'N', NULL, '2014-06-26 09:40:00+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (963, 136, 4, 'PM_Gateway', 961, 14, '2014-06-24 19:07:29+08', '2014-06-24 19:07:29+08', 'DONE', NULL, '2014-06-24 19:07:29+08', 'uat_artist1', 963, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (969, 137, 1, 'PM_Activity', 968, 1, '2014-06-25 17:47:27+08', '2014-06-25 18:21:00+08', 'DONE', '2014-06-26 09:17:27+08', '2014-06-25 18:21:00+08', 'uat_supervisor4', 969, 'N', NULL, '2014-06-26 09:17:27+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (964, 136, 4, 'PM_Activity', 963, 15, '2014-06-24 19:07:29+08', '2014-06-24 19:07:39+08', 'DONE', '2014-06-25 11:03:00+08', '2014-06-24 19:07:39+08', 'uat_artist1', 964, 'N', NULL, '2014-06-25 11:03:00+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (976, 137, 1, 'PM_Gateway', 969, 2, '2014-06-25 18:21:00+08', '2014-06-25 18:21:00+08', 'DONE', NULL, '2014-06-25 18:21:00+08', 'uat_supervisor4', 976, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (965, 136, 5, 'PM_Activity', 964, 17, '2014-06-24 19:07:39+08', '2014-06-24 19:08:52+08', 'DONE', '2014-06-25 09:41:00+08', '2014-06-24 19:08:52+08', 'uat_qc1', 965, 'N', NULL, '2014-06-25 09:41:00+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (985, 138, 5, 'PM_Gateway', 984, 18, '2014-06-25 18:27:41+08', '2014-06-25 18:27:41+08', 'DONE', NULL, '2014-06-25 18:27:41+08', 'uat_qc1', 985, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (966, 136, 5, 'PM_Gateway', 965, 18, '2014-06-24 19:08:52+08', '2014-06-24 19:08:52+08', 'DONE', NULL, '2014-06-24 19:08:52+08', 'uat_qc1', 966, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (967, 136, 6, 'PM_Activity', 966, 23, '2014-06-24 19:08:52+08', NULL, NULL, '2014-06-27 15:00:00+08', NULL, NULL, NULL, 'N', NULL, '2014-06-26 09:00:00+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (968, 137, 1, 'PM_Event', NULL, NULL, '2014-06-25 17:47:27+08', '2014-06-25 17:47:27+08', 'DONE', NULL, '2014-06-25 17:47:27+08', 'uat_customer4', 968, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (970, 138, 1, 'PM_Event', NULL, NULL, '2014-06-25 18:03:36+08', '2014-06-25 18:03:36+08', 'DONE', NULL, '2014-06-25 18:03:36+08', 'uat_customer4', 970, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (972, 139, 1, 'PM_Event', NULL, NULL, '2014-06-25 18:09:59+08', '2014-06-25 18:09:59+08', 'DONE', NULL, '2014-06-25 18:09:59+08', 'uat_customer4', 972, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (973, 139, 1, 'PM_Activity', 972, 1, '2014-06-25 18:09:59+08', NULL, NULL, '2014-06-26 09:30:00+08', NULL, NULL, NULL, 'N', NULL, '2014-06-26 09:30:00+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (974, 140, 1, 'PM_Event', NULL, NULL, '2014-06-25 18:17:21+08', '2014-06-25 18:17:21+08', 'DONE', NULL, '2014-06-25 18:17:21+08', 'ysyow', 974, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (971, 138, 1, 'PM_Activity', 970, 1, '2014-06-25 18:03:36+08', '2014-06-25 18:21:17+08', 'DONE', '2014-06-26 09:30:00+08', '2014-06-25 18:21:17+08', 'uat_supervisor4', 971, 'N', NULL, '2014-06-26 09:30:00+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (978, 138, 1, 'PM_Gateway', 971, 2, '2014-06-25 18:21:17+08', '2014-06-25 18:21:17+08', 'DONE', NULL, '2014-06-25 18:21:17+08', 'uat_supervisor4', 978, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (979, 138, 2, 'PM_Gateway', 978, 4, '2014-06-25 18:21:17+08', '2014-06-25 18:21:17+08', 'DONE', NULL, '2014-06-25 18:21:17+08', 'uat_supervisor4', 979, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (977, 137, 2, 'PM_Activity', 976, 3, '2014-06-25 18:21:00+08', '2014-06-25 18:28:59+08', 'DONE', NULL, '2014-06-25 18:28:59+08', 'uat_customer4', 977, 'N', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (981, 138, 3, 'PM_Event', 979, 6, '2014-06-25 18:21:17+08', '2014-06-25 18:22:01+08', 'INTERRUPT', NULL, '2014-06-25 18:21:17+08', 'uat_artist4', 980, 'Y', '2014-06-25 18:21:17+08', '2014-06-26 09:01:00+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (987, 137, 1, 'PM_Activity', 977, 7, '2014-06-25 18:28:59+08', NULL, NULL, '2014-06-26 09:30:00+08', NULL, NULL, NULL, 'N', NULL, '2014-06-26 09:30:00+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (980, 138, 2, 'PM_Event', 979, 5, '2014-06-25 18:21:17+08', '2014-06-25 18:22:01+08', 'DONE', '2014-06-26 09:01:00+08', '2014-06-25 18:22:01+08', 'uat_artist4', 980, 'Y', NULL, NULL, NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (975, 140, 1, 'PM_Activity', 974, 1, '2014-06-25 18:17:21+08', NULL, NULL, '2014-06-26 09:30:00+08', '2014-06-25 18:29:13+08', NULL, NULL, 'N', NULL, '2014-06-26 09:30:00+08', NULL);
INSERT INTO fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) VALUES (986, 138, 6, 'PM_Activity', 985, 23, '2014-06-25 18:27:41+08', '2014-06-25 18:30:17+08', 'DONE', '2014-06-28 15:00:00+08', '2014-06-25 18:30:17+08', 'uat_customer4', 986, 'N', NULL, '2014-06-27 09:00:00+08', NULL);


--
-- TOC entry 3041 (class 0 OID 0)
-- Dependencies: 203
-- Name: fcpmcaseflow_pmf_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcpmcaseflow_pmf_id_seq', 989, true);


--
-- TOC entry 2898 (class 0 OID 50292)
-- Dependencies: 204
-- Data for Name: fcpmcaseflowassign; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (12, 633, NULL, NULL, NULL, 'REQUEST_NEWJOB');
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (13, 634, NULL, 1, 19, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (14, 637, 'artist1', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (15, 640, 'artist1', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (16, 641, NULL, 1, 18, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (17, 642, NULL, NULL, NULL, 'REQUEST_NEWJOB');
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (18, 643, NULL, 1, 19, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (19, 644, NULL, NULL, NULL, 'REQUEST_NEWJOB');
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (20, 645, NULL, 1, 19, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (21, 647, 'admin2', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (22, 650, NULL, NULL, NULL, 'REQUEST_NEWJOB');
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (23, 651, NULL, 1, 19, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (24, 656, 'uat_cust1', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (25, 657, NULL, 1, 19, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (26, 659, 'uat_cust1', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (27, 660, NULL, 1, 19, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (28, 663, 'uat_artist1', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (29, 666, 'uat_artist1', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (30, 667, NULL, 1, 18, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (31, 668, NULL, NULL, NULL, 'REQUEST_NEWJOB');
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (32, 669, NULL, 1, 19, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (33, 672, 'uat_artist1', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (34, 676, 'uat_artist1', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (35, 680, 'uat_artist1', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (36, 683, 'uat_artist1', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (37, 685, 'uat_artist1', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (38, 686, NULL, NULL, NULL, 'REQUEST_NEWJOB');
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (39, 687, NULL, 1, 19, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (40, 688, NULL, NULL, NULL, 'REQUEST_NEWJOB');
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (41, 689, NULL, 1, 19, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (42, 692, 'uat_artist1', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (43, 698, 'uat_artist1', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (44, 699, NULL, 1, 19, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (45, 700, NULL, 1, 19, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (46, 701, NULL, 1, 18, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (47, 702, NULL, 1, 18, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (48, 704, 'uat_artist1', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (49, 706, 'uat_artist1', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (50, 707, NULL, 1, 18, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (51, 709, 'uat_artist1', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (52, 712, 'uat_artist1', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (53, 714, 'uat_cust1', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (54, 716, 'uat_cust1', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (55, 720, NULL, 1, 19, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (56, 723, 'uat_artist1', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (57, 726, 'uat_artist1', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (58, 733, 'uat_artist1', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (59, 734, NULL, 1, 19, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (60, 736, 'uat_artist1', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (61, 737, NULL, NULL, NULL, 'REQUEST_NEWJOB');
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (62, 738, NULL, 1, 19, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (63, 741, 'uat_artist1', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (64, 749, 'uat_artist1', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (65, 750, NULL, 1, 19, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (66, 751, NULL, 1, 19, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (67, 752, NULL, NULL, NULL, 'REQUEST_NEWJOB');
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (68, 753, NULL, 1, 19, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (69, 754, NULL, NULL, NULL, 'REQUEST_NEWJOB');
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (70, 755, NULL, 1, 19, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (71, 756, NULL, NULL, NULL, 'REQUEST_NEWJOB');
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (72, 757, NULL, 1, 19, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (73, 758, NULL, NULL, NULL, 'REQUEST_NEWJOB');
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (74, 759, NULL, 1, 19, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (75, 761, 'ysyow', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (76, 762, NULL, 1, 19, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (77, 765, 'artist2', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (78, 767, NULL, NULL, NULL, 'REQUEST_NEWJOB');
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (79, 768, NULL, 1, 19, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (80, 771, 'artist2', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (81, 774, 'artist2', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (82, 776, 'artist2', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (83, 779, 'artist2', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (84, 782, 'artist2', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (85, 783, NULL, 1, 18, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (86, 785, 'ysyow', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (87, 787, NULL, 1, 19, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (88, 790, 'artist2', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (89, 793, 'artist2', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (90, 794, NULL, 1, 18, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (91, 796, 'ysyow', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (92, 800, 'ysyow', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (93, 801, NULL, NULL, NULL, 'REQUEST_NEWJOB');
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (94, 802, NULL, 1, 19, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (95, 804, 'uat_customer1', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (96, 815, NULL, 1, 19, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (97, 816, NULL, NULL, NULL, 'REQUEST_NEWJOB');
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (98, 817, NULL, 1, 19, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (99, 818, NULL, NULL, NULL, 'REQUEST_NEWJOB');
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (100, 819, NULL, 1, 19, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (101, 821, 'uat_customer1', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (102, 822, NULL, 1, 19, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (105, 827, 'uat_artist1', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (106, 830, 'uat_artist1', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (107, 831, NULL, NULL, NULL, 'REQUEST_NEWJOB');
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (108, 832, NULL, 1, 19, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (109, 833, NULL, 1, 18, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (110, 835, 'uat_customer1', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (111, 838, 'esp_artist', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (112, 841, 'uat_artist3', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (113, 843, NULL, NULL, NULL, 'REQUEST_NEWJOB');
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (114, 844, NULL, 1, 19, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (115, 845, NULL, NULL, NULL, 'REQUEST_NEWJOB');
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (116, 846, NULL, 1, 19, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (117, 847, NULL, NULL, NULL, 'REQUEST_NEWJOB');
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (118, 848, NULL, 1, 19, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (119, 849, NULL, NULL, NULL, 'REQUEST_NEWJOB');
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (120, 850, NULL, 1, 19, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (121, 851, NULL, NULL, NULL, 'REQUEST_NEWJOB');
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (122, 852, NULL, 1, 19, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (123, 853, NULL, NULL, NULL, 'REQUEST_NEWJOB');
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (124, 854, NULL, 1, 19, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (125, 855, NULL, NULL, NULL, 'REQUEST_NEWJOB');
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (126, 856, NULL, 1, 19, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (127, 857, NULL, NULL, NULL, 'REQUEST_NEWJOB');
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (128, 858, NULL, 1, 19, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (129, 861, 'artist2', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (130, 865, 'artist1', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (131, 869, 'uat_artist2', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (132, 872, 'uat_artist2', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (133, 873, NULL, 1, 18, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (134, 874, NULL, NULL, NULL, 'REQUEST_NEWJOB');
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (135, 875, NULL, 1, 19, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (136, 877, 'uat_artist2', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (137, 880, 'uat_artist3', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (138, 883, 'uat_artist3', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (139, 884, NULL, 1, 18, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (140, 886, 'uat_artist3', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (141, 909, 'esp_artist', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (142, 910, NULL, 1, 19, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (143, 913, 'uat_artist3', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (144, 914, NULL, 1, 19, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (145, 919, 'artist2', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (146, 920, NULL, 1, 19, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (147, 923, 'artist1', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (148, 924, NULL, 1, 19, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (149, 927, NULL, NULL, NULL, 'REQUEST_NEWJOB');
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (150, 928, NULL, 1, 19, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (153, 931, NULL, NULL, NULL, 'REQUEST_NEWJOB');
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (154, 932, NULL, 1, 19, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (155, 933, NULL, NULL, NULL, 'REQUEST_NEWJOB');
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (156, 934, NULL, 1, 19, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (157, 935, NULL, NULL, NULL, 'REQUEST_NEWJOB');
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (158, 936, NULL, 1, 19, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (159, 939, 'uat_artist1', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (160, 942, 'uat_artist1', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (161, 943, NULL, 1, 18, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (162, 945, 'uat_customer1', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (163, 947, NULL, 1, 19, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (164, 950, 'uat_artist1', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (165, 953, 'uat_artist1', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (166, 954, NULL, 1, 18, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (167, 956, 'uat_cust1', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (168, 957, NULL, NULL, NULL, 'REQUEST_NEWJOB');
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (169, 958, NULL, 1, 19, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (170, 961, 'uat_artist1', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (171, 964, 'uat_artist1', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (172, 965, NULL, 1, 18, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (173, 967, 'uat_customer1', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (174, 968, NULL, NULL, NULL, 'REQUEST_NEWJOB');
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (175, 969, NULL, 1, 19, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (176, 970, NULL, NULL, NULL, 'REQUEST_NEWJOB');
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (177, 971, NULL, 1, 19, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (178, 972, NULL, NULL, NULL, 'REQUEST_NEWJOB');
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (179, 973, NULL, 1, 19, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (180, 974, NULL, NULL, NULL, 'REQUEST_NEWJOB');
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (181, 975, NULL, 1, 19, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (182, 977, 'uat_customer4', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (183, 980, 'uat_artist4', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (184, 983, 'uat_artist4', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (185, 984, NULL, 1, 18, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (186, 986, 'uat_customer4', NULL, NULL, NULL);
INSERT INTO fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) VALUES (187, 987, NULL, 1, 19, NULL);


--
-- TOC entry 3042 (class 0 OID 0)
-- Dependencies: 205
-- Name: fcpmcaseflowassign_pmfa_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcpmcaseflowassign_pmfa_id_seq', 187, true);


--
-- TOC entry 2900 (class 0 OID 50297)
-- Dependencies: 206
-- Data for Name: fcpmcasetype; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fcpmcasetype (pmct_code, pmct_desc, pmct_table, pmct_key_col, pmct_desc_col, pmct_caseinfo_function) VALUES ('jobsheet', 'jobsheet', 'mjobsheet', 'js_id', 'case when js_code is null then '''' else js_code||'' - '' end ||case when length(js_description) < 23 then js_description else substring(js_description,0,20)||''...'' end', 'viewJobInfo');


--
-- TOC entry 2901 (class 0 OID 50303)
-- Dependencies: 207
-- Data for Name: fcpmconnector; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fcpmconnector (pmcn_id, pmcn_from_type, pmcn_from_id, pmcn_to_type, pmcn_to_id, pmcn_order, pmcn_type, pmcn_rule) VALUES (1, 'PM_Event', 1, 'PM_Activity', 1, 1, 'NORMAL', NULL);
INSERT INTO fcpmconnector (pmcn_id, pmcn_from_type, pmcn_from_id, pmcn_to_type, pmcn_to_id, pmcn_order, pmcn_type, pmcn_rule) VALUES (14, 'PM_Event', 2, 'PM_Gateway', 4, 1, 'NORMAL', NULL);
INSERT INTO fcpmconnector (pmcn_id, pmcn_from_type, pmcn_from_id, pmcn_to_type, pmcn_to_id, pmcn_order, pmcn_type, pmcn_rule) VALUES (2, 'PM_Activity', 1, 'PM_Gateway', 1, 1, 'NORMAL', NULL);
INSERT INTO fcpmconnector (pmcn_id, pmcn_from_type, pmcn_from_id, pmcn_to_type, pmcn_to_id, pmcn_order, pmcn_type, pmcn_rule) VALUES (5, 'PM_Gateway', 2, 'PM_Event', 2, 1, 'NORMAL', NULL);
INSERT INTO fcpmconnector (pmcn_id, pmcn_from_type, pmcn_from_id, pmcn_to_type, pmcn_to_id, pmcn_order, pmcn_type, pmcn_rule) VALUES (17, 'PM_Activity', 4, 'PM_Activity', 5, 1, 'NORMAL', NULL);
INSERT INTO fcpmconnector (pmcn_id, pmcn_from_type, pmcn_from_id, pmcn_to_type, pmcn_to_id, pmcn_order, pmcn_type, pmcn_rule) VALUES (6, 'PM_Gateway', 2, 'PM_Event', 3, 2, 'NORMAL', NULL);
INSERT INTO fcpmconnector (pmcn_id, pmcn_from_type, pmcn_from_id, pmcn_to_type, pmcn_to_id, pmcn_order, pmcn_type, pmcn_rule) VALUES (7, 'PM_Activity', 2, 'PM_Activity', 1, 1, 'NORMAL', NULL);
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
INSERT INTO fcpmconnector (pmcn_id, pmcn_from_type, pmcn_from_id, pmcn_to_type, pmcn_to_id, pmcn_order, pmcn_type, pmcn_rule) VALUES (15, 'PM_Gateway', 4, 'PM_Activity', 4, 1, 'NORMAL', '4::false');
INSERT INTO fcpmconnector (pmcn_id, pmcn_from_type, pmcn_from_id, pmcn_to_type, pmcn_to_id, pmcn_order, pmcn_type, pmcn_rule) VALUES (16, 'PM_Gateway', 4, 'PM_Activity', 10, 2, 'NORMAL', NULL);


--
-- TOC entry 3043 (class 0 OID 0)
-- Dependencies: 208
-- Name: fcpmconnector_pmcn_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcpmconnector_pmcn_id_seq', 33, true);


--
-- TOC entry 2903 (class 0 OID 50308)
-- Dependencies: 209
-- Data for Name: fcpmevent; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fcpmevent (pmev_id, pmev_pmwfid, pmev_pmslid, pmev_name, pmev_type, pmev_type_cat, pmev_intermediate_function, pmev_timer_interval, pmev_timer_workinghours_only, pmev_intermediate_show_task, pmev_attach_pmatid, pmev_timer_non_interrupt_once, pmev_start_function, pmev_performed_message) VALUES (5, 1, NULL, 'Notify End', 'END', NULL, NULL, NULL, 'N', 'N', NULL, NULL, NULL, NULL);
INSERT INTO fcpmevent (pmev_id, pmev_pmwfid, pmev_pmslid, pmev_name, pmev_type, pmev_type_cat, pmev_intermediate_function, pmev_timer_interval, pmev_timer_workinghours_only, pmev_intermediate_show_task, pmev_attach_pmatid, pmev_timer_non_interrupt_once, pmev_start_function, pmev_performed_message) VALUES (6, 1, NULL, 'Job Close', 'END', NULL, NULL, NULL, 'N', 'N', NULL, NULL, NULL, NULL);
INSERT INTO fcpmevent (pmev_id, pmev_pmwfid, pmev_pmslid, pmev_name, pmev_type, pmev_type_cat, pmev_intermediate_function, pmev_timer_interval, pmev_timer_workinghours_only, pmev_intermediate_show_task, pmev_attach_pmatid, pmev_timer_non_interrupt_once, pmev_start_function, pmev_performed_message) VALUES (3, 1, NULL, 'Late Job Acknowledgement', 'TIMER', NULL, NULL, 'PT1M', 'Y', 'N', NULL, NULL, NULL, NULL);
INSERT INTO fcpmevent (pmev_id, pmev_pmwfid, pmev_pmslid, pmev_name, pmev_type, pmev_type_cat, pmev_intermediate_function, pmev_timer_interval, pmev_timer_workinghours_only, pmev_intermediate_show_task, pmev_attach_pmatid, pmev_timer_non_interrupt_once, pmev_start_function, pmev_performed_message) VALUES (7, 1, NULL, 'Late Requirement Verification Timer', 'TIMER', 'NONINTERRUPTING', NULL, 'PT30M', 'Y', 'N', 1, 'N', NULL, NULL);
INSERT INTO fcpmevent (pmev_id, pmev_pmwfid, pmev_pmslid, pmev_name, pmev_type, pmev_type_cat, pmev_intermediate_function, pmev_timer_interval, pmev_timer_workinghours_only, pmev_intermediate_show_task, pmev_attach_pmatid, pmev_timer_non_interrupt_once, pmev_start_function, pmev_performed_message) VALUES (8, 1, NULL, 'Late WIP Timer', 'TIMER', 'NONINTERRUPTING', NULL, '[[REQTIMEART]]', 'Y', 'N', 4, 'Y', NULL, NULL);
INSERT INTO fcpmevent (pmev_id, pmev_pmwfid, pmev_pmslid, pmev_name, pmev_type, pmev_type_cat, pmev_intermediate_function, pmev_timer_interval, pmev_timer_workinghours_only, pmev_intermediate_show_task, pmev_attach_pmatid, pmev_timer_non_interrupt_once, pmev_start_function, pmev_performed_message) VALUES (9, 1, NULL, 'Late QC Timer', 'TIMER', 'NONINTERRUPTING', NULL, '[[REQTIMEQC]]', 'Y', 'N', 5, 'Y', NULL, NULL);
INSERT INTO fcpmevent (pmev_id, pmev_pmwfid, pmev_pmslid, pmev_name, pmev_type, pmev_type_cat, pmev_intermediate_function, pmev_timer_interval, pmev_timer_workinghours_only, pmev_intermediate_show_task, pmev_attach_pmatid, pmev_timer_non_interrupt_once, pmev_start_function, pmev_performed_message) VALUES (10, 1, NULL, 'Late Re-WIP Timer', 'TIMER', 'NONINTERRUPTING', NULL, '[[REQTIMEQC]]', 'Y', 'N', 10, 'Y', NULL, NULL);
INSERT INTO fcpmevent (pmev_id, pmev_pmwfid, pmev_pmslid, pmev_name, pmev_type, pmev_type_cat, pmev_intermediate_function, pmev_timer_interval, pmev_timer_workinghours_only, pmev_intermediate_show_task, pmev_attach_pmatid, pmev_timer_non_interrupt_once, pmev_start_function, pmev_performed_message) VALUES (11, 1, NULL, 'Auto Customer Acceptance Timer', 'TIMER', 'INTERRUPTING', NULL, 'P1D', 'Y', 'N', 6, 'Y', NULL, NULL);
INSERT INTO fcpmevent (pmev_id, pmev_pmwfid, pmev_pmslid, pmev_name, pmev_type, pmev_type_cat, pmev_intermediate_function, pmev_timer_interval, pmev_timer_workinghours_only, pmev_intermediate_show_task, pmev_attach_pmatid, pmev_timer_non_interrupt_once, pmev_start_function, pmev_performed_message) VALUES (1, 1, 5, 'New Job', 'START', NULL, NULL, NULL, 'N', 'N', NULL, NULL, 'newJob', 'Job has been submitted successfully.');
INSERT INTO fcpmevent (pmev_id, pmev_pmwfid, pmev_pmslid, pmev_name, pmev_type, pmev_type_cat, pmev_intermediate_function, pmev_timer_interval, pmev_timer_workinghours_only, pmev_intermediate_show_task, pmev_attach_pmatid, pmev_timer_non_interrupt_once, pmev_start_function, pmev_performed_message) VALUES (4, 1, 2, 'Pull Back', 'INTERMEDIATE', NULL, 'updPullBackStatus', NULL, 'N', 'Y', NULL, NULL, NULL, NULL);
INSERT INTO fcpmevent (pmev_id, pmev_pmwfid, pmev_pmslid, pmev_name, pmev_type, pmev_type_cat, pmev_intermediate_function, pmev_timer_interval, pmev_timer_workinghours_only, pmev_intermediate_show_task, pmev_attach_pmatid, pmev_timer_non_interrupt_once, pmev_start_function, pmev_performed_message) VALUES (2, 1, 3, 'Acknowledge Job', 'INTERMEDIATE', NULL, 'updAcknowdgeJobStatus', 'PT1M', 'Y', 'Y', NULL, NULL, NULL, NULL);


--
-- TOC entry 3044 (class 0 OID 0)
-- Dependencies: 210
-- Name: fcpmevent_pmev_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcpmevent_pmev_id_seq', 11, true);


--
-- TOC entry 2905 (class 0 OID 50315)
-- Dependencies: 211
-- Data for Name: fcpmgateway; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fcpmgateway (pmgw_id, pmgw_pmwfid, pmgw_pmslid, pmgw_name, pmgw_type, pmgw_type_cat) VALUES (2, 1, NULL, 'Acknowledge & Notify', 'EVENTEXCLUSIVE', 'DIVERGENCE');
INSERT INTO fcpmgateway (pmgw_id, pmgw_pmwfid, pmgw_pmslid, pmgw_name, pmgw_type, pmgw_type_cat) VALUES (3, 1, NULL, 'Acknowledge & Pullback', 'EVENTEXCLUSIVE', 'DIVERGENCE');
INSERT INTO fcpmgateway (pmgw_id, pmgw_pmwfid, pmgw_pmslid, pmgw_name, pmgw_type, pmgw_type_cat) VALUES (1, 1, NULL, 'Check Requirement Amendment', 'EXCLUSIVE', 'DIVERGENCE');
INSERT INTO fcpmgateway (pmgw_id, pmgw_pmwfid, pmgw_pmslid, pmgw_name, pmgw_type, pmgw_type_cat) VALUES (4, 1, NULL, 'Check Is Reverted Case', 'EXCLUSIVE', 'DIVERGENCE');
INSERT INTO fcpmgateway (pmgw_id, pmgw_pmwfid, pmgw_pmslid, pmgw_name, pmgw_type, pmgw_type_cat) VALUES (5, 1, NULL, 'Check QC Result', 'EXCLUSIVE', 'DIVERGENCE');
INSERT INTO fcpmgateway (pmgw_id, pmgw_pmwfid, pmgw_pmslid, pmgw_name, pmgw_type, pmgw_type_cat) VALUES (6, 1, NULL, 'Check Customer Acceptance', 'EXCLUSIVE', 'DIVERGENCE');


--
-- TOC entry 3045 (class 0 OID 0)
-- Dependencies: 212
-- Name: fcpmgateway_pmgw_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcpmgateway_pmgw_id_seq', 6, true);


--
-- TOC entry 2907 (class 0 OID 50320)
-- Dependencies: 213
-- Data for Name: fcpmswimlane; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fcpmswimlane (pmsl_id, pmsl_pmwfid, pmsl_name, pmsl_order) VALUES (2, 1, 'Supervisor', 200);
INSERT INTO fcpmswimlane (pmsl_id, pmsl_pmwfid, pmsl_name, pmsl_order) VALUES (3, 1, 'Artist', 300);
INSERT INTO fcpmswimlane (pmsl_id, pmsl_pmwfid, pmsl_name, pmsl_order) VALUES (4, 1, 'QC', 400);
INSERT INTO fcpmswimlane (pmsl_id, pmsl_pmwfid, pmsl_name, pmsl_order) VALUES (5, 1, 'Job Requestors', 50);
INSERT INTO fcpmswimlane (pmsl_id, pmsl_pmwfid, pmsl_name, pmsl_order) VALUES (1, 1, 'Job Requestor', 100);


--
-- TOC entry 3046 (class 0 OID 0)
-- Dependencies: 214
-- Name: fcpmswimlane_pmsl_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcpmswimlane_pmsl_id_seq', 4, true);


--
-- TOC entry 2909 (class 0 OID 50325)
-- Dependencies: 215
-- Data for Name: fcpmswimlanesetup; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fcpmswimlanesetup (pmss_id, pmss_pmslid, pmss_userid, pmss_orgid, pmss_rolid, pmss_pmscode) VALUES (2, 2, NULL, '1', '19', NULL);
INSERT INTO fcpmswimlanesetup (pmss_id, pmss_pmslid, pmss_userid, pmss_orgid, pmss_rolid, pmss_pmscode) VALUES (3, 3, '[[JS_ASSIGN_ARTIST]]', NULL, NULL, NULL);
INSERT INTO fcpmswimlanesetup (pmss_id, pmss_pmslid, pmss_userid, pmss_orgid, pmss_rolid, pmss_pmscode) VALUES (4, 4, NULL, '1', '18', NULL);
INSERT INTO fcpmswimlanesetup (pmss_id, pmss_pmslid, pmss_userid, pmss_orgid, pmss_rolid, pmss_pmscode) VALUES (5, 5, NULL, NULL, NULL, 'REQUEST_NEWJOB');
INSERT INTO fcpmswimlanesetup (pmss_id, pmss_pmslid, pmss_userid, pmss_orgid, pmss_rolid, pmss_pmscode) VALUES (1, 1, '[[JS_REQUESTOR_USERID]]', NULL, NULL, NULL);


--
-- TOC entry 3047 (class 0 OID 0)
-- Dependencies: 216
-- Name: fcpmswimlanesetup_pmss_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcpmswimlanesetup_pmss_id_seq', 1, false);


--
-- TOC entry 2911 (class 0 OID 50330)
-- Dependencies: 217
-- Data for Name: fcpmworkflow; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fcpmworkflow (pmwf_id, pmwf_name) VALUES (1, 'Artwork job');


--
-- TOC entry 3048 (class 0 OID 0)
-- Dependencies: 218
-- Name: fcpmworkflow_pmwf_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcpmworkflow_pmwf_id_seq', 1, true);


--
-- TOC entry 2913 (class 0 OID 50335)
-- Dependencies: 219
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
-- TOC entry 3049 (class 0 OID 0)
-- Dependencies: 220
-- Name: fcrole_rol_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcrole_rol_id_seq', 23, true);


--
-- TOC entry 2915 (class 0 OID 50343)
-- Dependencies: 221
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
-- TOC entry 3050 (class 0 OID 0)
-- Dependencies: 222
-- Name: fcroleperm_rp_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcroleperm_rp_id_seq', 196, true);


--
-- TOC entry 2917 (class 0 OID 50348)
-- Dependencies: 223
-- Data for Name: fcrule; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fcrule (ru_id, ru_name, ru_true_msg, ru_false_msg, ru_data) VALUES (1, 'Requirement verification decision?', 'Assigned', 'Reverted', '[{"oper":"&&","clausetype":"udv","clausecode":"RVDEC","clauseoper":"==","clauseval":"Assign"}]');
INSERT INTO fcrule (ru_id, ru_name, ru_true_msg, ru_false_msg, ru_data) VALUES (2, 'QC check decision', 'Revert', 'Forward to customer', '[{"oper":"&&","clausetype":"udv","clausecode":"QCDEC","clauseoper":"==","clauseval":"Revert"}]');
INSERT INTO fcrule (ru_id, ru_name, ru_true_msg, ru_false_msg, ru_data) VALUES (3, 'Customer acceptance decision?', 'Accept', 'Revert', '[{"oper":"&&","clausetype":"udv","clausecode":"CUSTDEC","clauseoper":"==","clauseval":"Accept"}]');
INSERT INTO fcrule (ru_id, ru_name, ru_true_msg, ru_false_msg, ru_data) VALUES (4, 'Is reverted job?', 'Yes', 'No', '[{"oper":"&&","clausetype":"udv","clausecode":"JS_WIP_BEFORE","clauseoper":"==","clauseval":"Y"}]');


--
-- TOC entry 3051 (class 0 OID 0)
-- Dependencies: 224
-- Name: fcrule_ru_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcrule_ru_id_seq', 4, true);


--
-- TOC entry 2919 (class 0 OID 50356)
-- Dependencies: 225
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
-- TOC entry 3052 (class 0 OID 0)
-- Dependencies: 226
-- Name: fcsetting_set_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcsetting_set_id_seq', 12, true);


--
-- TOC entry 2921 (class 0 OID 50365)
-- Dependencies: 227
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
INSERT INTO fcudv (udv_code, udv_name, udv_query_type, udv_query, udv_return_type, udv_result_type, udv_result_lookup_type, udv_result_lookup, udv_cat) VALUES ('CUSTDEC_DISP', 'Customer acceptance decision display', 'sql', 'select case when js_decision=''Accept'' then ''accepted'' else ''reverted'' end from mjobsheet where js_id = {$CASEKEY}', 'CELL', NULL, NULL, NULL, NULL);
INSERT INTO fcudv (udv_code, udv_name, udv_query_type, udv_query, udv_return_type, udv_result_type, udv_result_lookup_type, udv_result_lookup, udv_cat) VALUES ('JS_WIP_BEFORE', 'Job WIP before', 'sql', 'select case when count(*) > 0 then ''Y'' else ''N'' end from fcpmcaseflow where pmf_pmcid = {$PMCID} and pmf_obj_type=''PM_Activity'' and pmf_obj_id = 4', 'CELL', 'lookup', 'text', 'Y/Yes
N/No', NULL);
INSERT INTO fcudv (udv_code, udv_name, udv_query_type, udv_query, udv_return_type, udv_result_type, udv_result_lookup_type, udv_result_lookup, udv_cat) VALUES ('RVDEC_DISP', 'Requirement verification decision display', 'sql', 'select case when js_decision=''Revert'' then ''reverted'' else ''assigned to artist'' end from mjobsheet where js_id = {$CASEKEY}', 'CELL', NULL, NULL, NULL, NULL);
INSERT INTO fcudv (udv_code, udv_name, udv_query_type, udv_query, udv_return_type, udv_result_type, udv_result_lookup_type, udv_result_lookup, udv_cat) VALUES ('JS_REQUESTOR_USERID', 'Job Requestor Userid', 'sql', 'select usr_userid from mjobsheet join fcuser on js_request_by = usr_userid where js_id = {$CASEKEY}', 'CELL', NULL, NULL, NULL, 'USERID');
INSERT INTO fcudv (udv_code, udv_name, udv_query_type, udv_query, udv_return_type, udv_result_type, udv_result_lookup_type, udv_result_lookup, udv_cat) VALUES ('JS_ASSIGNED_ARTIST_USERID', 'Job Assigned Artist Userid', 'sql', 'select usr_userid from mjobsheet join fcuser on js_assignto = usr_userid where js_id = {$CASEKEY}', 'CELL', NULL, NULL, NULL, 'USERID');


--
-- TOC entry 2922 (class 0 OID 50372)
-- Dependencies: 228
-- Data for Name: fcuser; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('customer', 'b39f008e318efd2bb988d724a161b61c6909677f', '2014-04-24 15:46:41.898+08', 'Customer', 'dannyfoo@phiorion.com', '2014-05-10 10:06:53+08', '2014-05-09 09:56:20+08', '2014-06-22 17:54:18+08', NULL, 'a:4:{s:7:"dbosess";a:8:{s:7:"jobinfo";a:4:{s:6:"lastid";a:1:{s:5:"js_id";s:3:"144";}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:6:"detail";}s:8:"jobcolor";a:4:{s:6:"lastid";a:1:{s:5:"js_id";s:3:"153";}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"edit";}s:8:"jobother";a:4:{s:6:"lastid";a:1:{s:5:"js_id";s:3:"144";}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:6:"detail";}s:20:"pmtask_caseflow_list";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"list";}s:18:"customeracceptance";a:4:{s:6:"lastid";a:1:{s:5:"js_id";s:2:"88";}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"edit";}s:9:"pendingQC";a:4:{s:6:"lastid";a:1:{s:5:"js_id";s:2:"86";}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"edit";}s:15:"reqverification";a:4:{s:6:"lastid";a:1:{s:5:"js_id";s:2:"93";}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"edit";}s:3:"wip";a:4:{s:6:"lastid";a:1:{s:5:"js_id";s:2:"89";}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"edit";}}s:9:"dboconfig";a:0:{}s:11:"PMTask_atid";s:1:"5";s:13:"PMTask_flowid";s:2:"86";}', 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('uat_qc2', '5001bb8bbc319f44083f121452b480400657668a', '2014-06-22 14:41:50.867+08', 'Quality Assurance 2', 'dannyfoo@phiorion.com', '2014-06-22 23:10:13+08', '2014-06-22 23:07:51+08', NULL, NULL, 'a:0:{}', 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('ysyow', '37d18143f0650c34e4ac4e8bc3c106820945319b', '2014-06-21 18:26:11.482+08', 'Yow Yik Shuen', 'dannyfoo@phiorion.com', '2014-06-25 19:01:32+08', '2014-06-25 18:29:31+08', '2014-06-22 18:05:46+08', NULL, 'a:3:{s:7:"dbosess";a:1:{s:8:"jobsheet";a:5:{s:6:"lastid";a:1:{s:5:"js_id";s:3:"112";}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:6:"detail";s:4:"page";i:4;}}s:7:"dboload";s:8:"jobsheet";s:9:"dboconfig";a:0:{}}', 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('artist2', '09c04a14fff8cbd7d0235da2c01bfd31d7826824', '2014-06-09 21:35:00.767+08', 'Artist 2', 'dannyfoo@phiorion.com', '2014-06-22 22:41:12+08', '2014-06-22 22:37:20+08', '2014-06-22 22:37:16+08', NULL, 'a:0:{}', 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('qc', 'd6426af04235d59336c5b6b08f61240cbb6b0f66', '2014-04-30 19:10:06.929+08', 'qc', 'dannyfoo@phiorion.com', '2014-06-22 18:42:28+08', '2014-06-22 16:14:18+08', NULL, NULL, 'a:5:{s:7:"dbosess";a:3:{s:20:"pmtask_caseflow_list";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"list";}s:9:"pendingQC";a:4:{s:6:"lastid";a:1:{s:5:"js_id";i:67;}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"edit";}s:8:"jobsheet";a:4:{s:6:"lastid";a:1:{s:5:"js_id";i:67;}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:6:"detail";}}s:13:"PMTask_taskid";s:1:"5";s:15:"PMTask_tasktype";s:11:"PM_Activity";s:9:"dboconfig";a:0:{}s:13:"PMTask_flowid";s:3:"794";}', 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('uat_artist1', '5001bb8bbc319f44083f121452b480400657668a', '2014-06-21 17:29:02.912+08', 'UAT Artist1', 'dannyfoo@phiorion.com', '2014-06-24 19:07:42+08', '2014-06-24 19:07:22+08', '2014-06-24 19:04:06+08', NULL, 'a:0:{}', 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', '2013-08-15 09:55:18.85+08', 'Administrator', 'dannyfoo@phiorion.com', '2014-06-25 19:15:49+08', '2014-06-25 19:15:41+08', '2014-06-24 18:01:03+08', 'ADMIN', 'a:5:{s:7:"dbosess";a:6:{s:15:"reqverification";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"list";}s:3:"wip";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"list";}s:9:"pendingQC";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"list";}s:18:"customeracceptance";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"list";}s:10:"joblisting";a:4:{s:6:"lastid";a:1:{s:5:"js_id";s:3:"115";}s:4:"sort";a:0:{}s:6:"search";a:6:{s:6:"pmc_id";s:0:"";s:7:"js_code";s:0:"";s:9:"js_status";s:30:"PENDING ARTIST ACKNOWLEDGE JOB";s:15:"js_request_date";s:0:"";s:14:"js_description";s:0:"";s:10:"js_primcat";s:0:"";}s:5:"state";s:4:"list";}s:8:"jobsheet";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:3:"new";}}s:7:"dboload";s:10:"joblisting";s:9:"dboconfig";a:1:{s:10:"joblisting";i:1;}s:13:"PMTask_taskid";s:1:"1";s:15:"PMTask_tasktype";s:8:"PM_Event";}', 'ACTIVE', 'EN-US');
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('artist1', '2cabffd3c7cb40ae6541b7f10a640b41190ccb27', '2014-06-09 21:32:50.011+08', 'Artist 1', 'dannyfoo@phiorion.com', '2014-06-21 18:54:42+08', '2014-06-21 18:10:59+08', NULL, NULL, 'a:0:{}', 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('uat_qc1', '5001bb8bbc319f44083f121452b480400657668a', '2014-06-21 21:50:16.091+08', 'Quality Assurance 1', 'dannyfoo@phiorion.com', '2014-06-25 18:27:45+08', '2014-06-25 18:25:35+08', NULL, NULL, 'a:0:{}', 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('supervisor', '0f4d09e43d208d5e9222322fbc7091ceea1a78c3', '2014-04-30 19:09:48.659+08', 'supervisor', 'dannyfoo@phiorion.com', '2014-06-25 18:29:13+08', '2014-06-25 18:19:06+08', '2014-06-22 22:35:26+08', NULL, 'a:5:{s:7:"dbosess";a:3:{s:20:"pmtask_caseflow_list";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"list";}s:15:"reqverification";a:4:{s:6:"lastid";a:1:{s:5:"js_id";i:118;}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"edit";}s:8:"jobsheet";a:4:{s:6:"lastid";a:1:{s:5:"js_id";i:118;}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:6:"detail";}}s:13:"PMTask_taskid";s:1:"1";s:15:"PMTask_tasktype";s:11:"PM_Activity";s:9:"dboconfig";a:0:{}s:13:"PMTask_flowid";s:3:"975";}', 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('uat_customer2', '5001bb8bbc319f44083f121452b480400657668a', '2014-06-22 13:48:01.232+08', 'Uat customer 2', 'dannyfoo@phiorion.com', '2014-06-22 22:13:37+08', '2014-06-22 22:09:10+08', '2014-06-22 17:54:06+08', NULL, 'a:0:{}', 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('admin2', 'd033e22ae348aeb5660fc2140aec35850c4da997', '2014-01-26 15:39:57.04+08', 'Administrator 2', 'dannyfoo@phiorion.com', '2014-06-25 15:49:17+08', '2014-06-24 18:56:20+08', '2014-06-21 13:31:42+08', 'ADMIN', 'a:0:{}', 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('uat_qc3', '5001bb8bbc319f44083f121452b480400657668a', '2014-06-22 14:42:32.917+08', 'Quality Assurance 3', 'dannyfoo@phiorion.com', '2014-06-22 23:02:18+08', '2014-06-22 23:01:59+08', NULL, NULL, 'a:0:{}', 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('uat_qc4', '5001bb8bbc319f44083f121452b480400657668a', '2014-06-22 14:43:06.84+08', 'Quality Assurance 4', 'dannyfoo@phiorion.com', NULL, NULL, NULL, NULL, NULL, 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('uat_customer3', '5001bb8bbc319f44083f121452b480400657668a', '2014-06-22 13:48:28.496+08', 'Uat customer 3', 'dannyfoo@phiorion.com', '2014-06-22 23:00:11+08', '2014-06-22 22:00:33+08', '2014-06-22 21:59:53+08', NULL, 'a:0:{}', 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('uat_qc5', '5001bb8bbc319f44083f121452b480400657668a', '2014-06-22 14:43:49.935+08', 'Quality Assurance 5', 'dannyfoo@phiorion.com', NULL, NULL, NULL, NULL, NULL, 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('esp', '9afb9d02e0ce944228e1001d2b103b3bb9aa7def', '2014-06-21 18:25:38.5+08', 'Eng Shi Ping', 'dannyfoo@phiorion.com', '2014-06-24 19:01:23+08', '2014-06-24 19:00:10+08', NULL, NULL, 'a:3:{s:7:"dbosess";a:2:{s:0:"";a:3:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}}s:15:"reqverification";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"list";}}s:7:"dboload";s:15:"reqverification";s:9:"dboconfig";a:1:{s:15:"reqverification";i:1;}}', 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('uat_manager2', '5001bb8bbc319f44083f121452b480400657668a', '2014-06-22 14:44:37.191+08', 'UAT Manager2', 'dannyfoo@phiorion.com', NULL, NULL, NULL, NULL, NULL, 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('uat_manager3', '5001bb8bbc319f44083f121452b480400657668a', '2014-06-22 14:45:09.591+08', 'UAT Manager3', 'dannyfoo@phiorion.com', NULL, NULL, NULL, NULL, NULL, 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('esp_artist', '9afb9d02e0ce944228e1001d2b103b3bb9aa7def', '2014-06-21 23:20:39.656+08', 'esp artist', 'esp@phiorion.com', '2014-06-21 23:21:16+08', '2014-06-21 23:20:59+08', NULL, NULL, 'a:0:{}', 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('uat_customer1', '5001bb8bbc319f44083f121452b480400657668a', '2014-06-22 13:50:43.739+08', 'Uat customer 1', 'dannyfoo@phiorion.com', '2014-06-24 19:06:54+08', '2014-06-24 19:05:53+08', '2014-06-22 19:18:07+08', NULL, 'a:0:{}', 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('uat_customer4', '5001bb8bbc319f44083f121452b480400657668a', '2014-06-22 13:54:11.918+08', 'Uat customer 4', 'dannyfoo@phiorion.com', '2014-06-25 19:13:06+08', '2014-06-25 18:27:49+08', NULL, NULL, 'a:5:{s:7:"dbosess";a:4:{s:20:"pmtask_caseflow_list";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"list";}s:8:"jobsheet";a:4:{s:6:"lastid";a:1:{s:5:"js_id";i:116;}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:6:"detail";}s:18:"customeracceptance";a:4:{s:6:"lastid";a:1:{s:5:"js_id";i:116;}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"edit";}s:10:"joblisting";a:4:{s:6:"lastid";a:1:{s:5:"js_id";s:3:"115";}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:6:"detail";}}s:13:"PMTask_taskid";s:1:"6";s:15:"PMTask_tasktype";s:11:"PM_Activity";s:9:"dboconfig";a:0:{}s:13:"PMTask_flowid";s:3:"986";}', 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('uat_customer5', '5001bb8bbc319f44083f121452b480400657668a', '2014-06-22 13:54:37.241+08', 'Uat customer 5', 'dannyfoo@phiorion.com', NULL, NULL, NULL, NULL, NULL, 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('uat_manager4', '5001bb8bbc319f44083f121452b480400657668a', '2014-06-22 14:45:41.681+08', 'UAT Manager 4', 'dannyfoo@phiorion.com', NULL, NULL, NULL, NULL, NULL, 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('esp_supervisor', '9afb9d02e0ce944228e1001d2b103b3bb9aa7def', '2014-06-21 21:28:05.788+08', 'esp supervisor', 'dannyfoo@phiorion.com', '2014-06-21 23:17:39+08', '2014-06-21 23:05:39+08', '2014-06-21 22:21:37+08', NULL, 'a:0:{}', 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('uat_manager5', '5001bb8bbc319f44083f121452b480400657668a', '2014-06-22 14:46:13.293+08', 'UAT Manager5', 'dannyfoo@phiorion.com', NULL, NULL, NULL, NULL, NULL, 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('uat_supervisor2', '5001bb8bbc319f44083f121452b480400657668a', '2014-06-22 13:56:27.344+08', 'Uat supervisor 2', 'dannyfoo@phiorion.com', '2014-06-22 22:39:47+08', '2014-06-22 22:38:47+08', NULL, NULL, 'a:0:{}', 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('uat_supervisor3', '5001bb8bbc319f44083f121452b480400657668a', '2014-06-22 13:56:56.546+08', 'Uat supervisor 3', 'dannyfoo@phiorion.com', '2014-06-22 23:01:03+08', '2014-06-22 23:00:30+08', NULL, NULL, 'a:0:{}', 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('fongadmin', 'd033e22ae348aeb5660fc2140aec35850c4da997', '2014-06-21 19:06:57.321+08', 'Administrator', 'dannyfoo@phiorion.com', '2014-06-22 23:12:39+08', '2014-06-22 19:29:20+08', '2014-06-22 19:29:13+08', NULL, 'a:0:{}', 'ACTIVE', 'EN-US');
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('fongcustomer', 'c3bb51e80fb8801251e17d265e6a84cdd3a65200', '2014-06-21 19:09:47.371+08', 'Fong Customer', 'fong_yeh@hotmail.com', '2014-06-21 19:10:15+08', '2014-06-21 19:10:06+08', NULL, NULL, 'a:4:{s:7:"dbosess";a:1:{s:8:"jobsheet";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:3:"new";}}s:13:"PMTask_taskid";s:1:"1";s:15:"PMTask_tasktype";s:8:"PM_Event";s:9:"dboconfig";a:0:{}}', 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('uat_supervisor4', '5001bb8bbc319f44083f121452b480400657668a', '2014-06-22 13:58:23.837+08', 'Uat supervisor 4', 'dannyfoo@phiorion.com', '2014-06-25 18:21:21+08', '2014-06-25 18:11:33+08', NULL, NULL, 'a:0:{}', 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('uat_supervisor5', '5001bb8bbc319f44083f121452b480400657668a', '2014-06-22 13:58:54.09+08', 'Uat supervisor 5', 'dannyfoo@phiorion.com', NULL, NULL, NULL, NULL, NULL, 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('uat_artist2', '5001bb8bbc319f44083f121452b480400657668a', '2014-06-22 14:38:00.573+08', 'UAT Artist2', 'dannyfoo@phiorion.com', '2014-06-22 23:07:39+08', '2014-06-22 23:07:27+08', NULL, NULL, 'a:0:{}', 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('fongsupervisor', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', '2014-06-21 21:41:13.921+08', 'fongsupervisor', 'dannyfoo@phiorion.com', '2014-06-21 22:37:35+08', '2014-06-21 21:52:33+08', NULL, NULL, 'a:0:{}', 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('uat_artist3', '5001bb8bbc319f44083f121452b480400657668a', '2014-06-22 14:39:27.667+08', 'UAT Artist3', 'dannyfoo@phiorion.com', '2014-06-22 23:02:35+08', '2014-06-22 23:02:27+08', NULL, NULL, 'a:4:{s:7:"dbosess";a:1:{s:20:"pmtask_caseflow_list";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"list";}}s:13:"PMTask_taskid";s:2:"10";s:15:"PMTask_tasktype";s:11:"PM_Activity";s:9:"dboconfig";a:0:{}}', 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('uat_artist4', '5001bb8bbc319f44083f121452b480400657668a', '2014-06-22 14:40:21.405+08', 'UAT Artist4', 'dannyfoo@phiorion.com', '2014-06-25 18:25:30+08', '2014-06-25 18:21:27+08', NULL, NULL, 'a:0:{}', 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('uat_cust1', '5001bb8bbc319f44083f121452b480400657668a', '2014-06-21 17:32:20.338+08', 'UAT Customer1', 'dannyfoo@phiorion.com', '2014-06-22 17:06:05+08', '2014-06-22 17:06:05+08', '2014-06-22 14:22:06+08', NULL, 'a:0:{}', 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('uat_manager1', '5001bb8bbc319f44083f121452b480400657668a', '2014-06-21 17:29:57.603+08', 'UAT Manager1', 'dannyfoo@phiorion.com', NULL, NULL, NULL, NULL, NULL, 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('uat_supervisor1', '5001bb8bbc319f44083f121452b480400657668a', '2014-06-21 17:27:46.394+08', 'UAT Supervisor', 'dannyfoo@phiorion.com', '2014-06-24 19:07:18+08', '2014-06-24 19:07:04+08', '2014-06-22 19:20:27+08', NULL, 'a:0:{}', 'ACTIVE', NULL);
INSERT INTO fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) VALUES ('uat_artist5', '5001bb8bbc319f44083f121452b480400657668a', '2014-06-22 14:40:50.232+08', 'UAT Artist5', 'dannyfoo@phiorion.com', NULL, NULL, NULL, NULL, NULL, 'ACTIVE', NULL);


--
-- TOC entry 2923 (class 0 OID 50380)
-- Dependencies: 229
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
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (77, '2014-06-23 00:23:14.953+08', '*moire', 'uat_supervisor1', NULL, 'NOTICE', '[MOIRE] Late Requirement Verification Notification', '<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "Esp case" job is still pending since 21-Jun-2014 10:17 PM.</p><p><br></p>', 'UNREAD', '2014-06-23 00:23:14.953+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (78, '2014-06-23 00:23:15.418+08', '*moire', 'uat_supervisor1', NULL, 'NOTICE', '[MOIRE] Late Requirement Verification Notification', '<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "Test job" job is still pending since 22-Jun-2014 03:55 PM.</p><p><br></p>', 'UNREAD', '2014-06-23 00:23:15.418+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (79, '2014-06-23 00:23:15.884+08', '*moire', 'uat_supervisor1', NULL, 'NOTICE', '[MOIRE] Late Requirement Verification Notification', '<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "UAT job by ENG -1 " job is still pending since 22-Jun-2014 07:05 PM.</p><p><br></p>', 'UNREAD', '2014-06-23 00:23:15.884+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (80, '2014-06-23 00:23:16.288+08', '*moire', 'uat_supervisor1', NULL, 'NOTICE', '[MOIRE] Late Requirement Verification Notification', '<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "Test revert job" job is still pending since 22-Jun-2014 07:08 PM.</p><p><br></p>', 'UNREAD', '2014-06-23 00:23:16.288+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (81, '2014-06-23 00:23:16.682+08', '*moire', 'uat_supervisor1', NULL, 'NOTICE', '[MOIRE] Late Requirement Verification Notification', '<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "sad" job is still pending since 22-Jun-2014 10:25 PM.</p><p><br></p>', 'UNREAD', '2014-06-23 00:23:16.682+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (82, '2014-06-23 00:23:17.087+08', '*moire', 'uat_supervisor1', NULL, 'NOTICE', '[MOIRE] Late Requirement Verification Notification', '<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "asddsa" job is still pending since 22-Jun-2014 10:26 PM.</p><p><br></p>', 'UNREAD', '2014-06-23 00:23:17.087+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (83, '2014-06-23 00:23:17.477+08', '*moire', 'uat_supervisor1', NULL, 'NOTICE', '[MOIRE] Late Requirement Verification Notification', '<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "1" job is still pending since 22-Jun-2014 10:27 PM.</p><p><br></p>', 'UNREAD', '2014-06-23 00:23:17.477+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (84, '2014-06-23 00:23:17.848+08', '*moire', 'uat_supervisor1', NULL, 'NOTICE', '[MOIRE] Late Requirement Verification Notification', '<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "12asd" job is still pending since 22-Jun-2014 10:29 PM.</p><p><br></p>', 'UNREAD', '2014-06-23 00:23:17.848+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (85, '2014-06-23 00:23:17.891+08', '*moire', 'supervisor', NULL, 'NOTICE', '[MOIRE] Late Job WIP Notification', '<p>Dear Manager and Supervisor,</p><p>This email is to notify that the "asd" job is still WIP from UAT Artist2 since 22-Jun-2014 10:40 PM.</p><div><br></div>', 'UNREAD', '2014-06-23 00:23:17.891+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (86, '2014-06-23 00:23:17.963+08', '*moire', 'supervisor', NULL, 'NOTICE', '[MOIRE] Late Job Acknowledgement Notification', '<p>Dear Supervisor,</p><p>This email is to notify that the "test5" job is still pending acknowledgement from esp artist since 22-Jun-2014 10:06 PM.</p><div><br></div>', 'UNREAD', '2014-06-23 00:23:17.963+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (87, '2014-06-23 00:23:18.025+08', '*moire', 'supervisor', NULL, 'NOTICE', '[MOIRE] Late Job Acknowledgement Notification', '<p>Dear Supervisor,</p><p>This email is to notify that the "Monotone Editing" job is still pending acknowledgement from UAT Artist3 since 22-Jun-2014 10:07 PM.</p><div><br></div>', 'UNREAD', '2014-06-23 00:23:18.025+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (88, '2014-06-23 00:23:18.464+08', '*moire', 'uat_supervisor1', NULL, 'NOTICE', '[MOIRE] Late Requirement Verification Notification', '<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "Oder 2 by eng" job is still pending since 22-Jun-2014 10:25 PM.</p><p><br></p>', 'UNREAD', '2014-06-23 00:23:18.464+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (89, '2014-06-23 00:23:18.506+08', '*moire', 'supervisor', NULL, 'NOTICE', '[MOIRE] Late Job Acknowledgement Notification', '<p>Dear Supervisor,</p><p>This email is to notify that the "123" job is still pending acknowledgement from Artist 2 since 22-Jun-2014 10:36 PM.</p><div><br></div>', 'UNREAD', '2014-06-23 00:23:18.506+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (90, '2014-06-23 00:23:18.566+08', '*moire', 'supervisor', NULL, 'NOTICE', '[MOIRE] Late Job Acknowledgement Notification', '<p>Dear Supervisor,</p><p>This email is to notify that the "Case 1 - eng" job is still pending acknowledgement from Artist 1 since 22-Jun-2014 10:38 PM.</p><div><br></div>', 'UNREAD', '2014-06-23 00:23:18.566+08', NULL, 3);
INSERT INTO fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) VALUES (91, '2014-06-23 00:23:18.623+08', '*moire', 'supervisor', NULL, 'NOTICE', '[MOIRE] Late Job WIP Notification', '<p>Dear Manager and Supervisor,</p><p>This email is to notify that the "new job 3 by eng" job is still WIP from UAT Artist3 since 22-Jun-2014 11:01 PM.</p><div><br></div>', 'UNREAD', '2014-06-23 00:23:18.623+08', NULL, 3);


--
-- TOC entry 3053 (class 0 OID 0)
-- Dependencies: 230
-- Name: fcuserdiary_di_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcuserdiary_di_id_seq', 91, true);


--
-- TOC entry 2925 (class 0 OID 50392)
-- Dependencies: 231
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


--
-- TOC entry 3054 (class 0 OID 0)
-- Dependencies: 232
-- Name: fcuserlogin_ul_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcuserlogin_ul_id_seq', 856, true);


--
-- TOC entry 2927 (class 0 OID 50400)
-- Dependencies: 233
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


--
-- TOC entry 3055 (class 0 OID 0)
-- Dependencies: 234
-- Name: fcuserorgrole_uor_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcuserorgrole_uor_id_seq', 95, true);


--
-- TOC entry 2929 (class 0 OID 50405)
-- Dependencies: 235
-- Data for Name: fcusersession; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO fcusersession (us_id, us_sessid, us_userid, us_ip, us_active, us_created, us_last_active, us_forcecloseby) VALUES (408, '1kkbhl72fl7lktmld4p5d10os0', 'ironman@gmail.com', '127.0.0.1', 'Y', '2014-02-17 15:31:34.882+08', '2014-02-17 15:31:34+08', NULL);
INSERT INTO fcusersession (us_id, us_sessid, us_userid, us_ip, us_active, us_created, us_last_active, us_forcecloseby) VALUES (458, 'h68n7hesc822jhi1caneg5ghl0', 'customer', '127.0.0.1', 'Y', '2014-05-09 09:56:20.674+08', '2014-05-09 09:56:20+08', NULL);
INSERT INTO fcusersession (us_id, us_sessid, us_userid, us_ip, us_active, us_created, us_last_active, us_forcecloseby) VALUES (724, '9kvhl5niddlkdtguhgulocqd52', 'uat_artist3', '192.168.0.124', 'Y', '2014-06-22 23:02:27.408+08', '2014-06-22 23:02:27+08', NULL);
INSERT INTO fcusersession (us_id, us_sessid, us_userid, us_ip, us_active, us_created, us_last_active, us_forcecloseby) VALUES (741, 'bqiu04e3eu0rg4ocr9959iauv6', 'esp', '192.168.0.124', 'Y', '2014-06-24 19:00:10.945+08', '2014-06-24 19:00:10+08', NULL);
INSERT INTO fcusersession (us_id, us_sessid, us_userid, us_ip, us_active, us_created, us_last_active, us_forcecloseby) VALUES (546, 'niamb5anjmlro4064p35o08ik6', 'fongsupervisor', '192.168.0.148', 'Y', '2014-06-21 21:52:33.397+08', '2014-06-21 21:52:33+08', NULL);
INSERT INTO fcusersession (us_id, us_sessid, us_userid, us_ip, us_active, us_created, us_last_active, us_forcecloseby) VALUES (765, 'nf0a9brmobif1uon75er8rcd84', 'uat_customer4', '192.168.0.124', 'Y', '2014-06-25 18:27:49.761+08', '2014-06-25 18:27:49+08', NULL);
INSERT INTO fcusersession (us_id, us_sessid, us_userid, us_ip, us_active, us_created, us_last_active, us_forcecloseby) VALUES (766, 'i0bi8jre7tlmp79e7a03cr0592', 'ysyow', '::1', 'Y', '2014-06-25 18:29:31.779+08', '2014-06-25 18:29:31+08', NULL);
INSERT INTO fcusersession (us_id, us_sessid, us_userid, us_ip, us_active, us_created, us_last_active, us_forcecloseby) VALUES (767, 'v2ekh5la55i8voeb4ufut56ak5', 'admin', '192.168.0.128', 'Y', '2014-06-25 19:15:41.639+08', '2014-06-25 19:15:41+08', NULL);


--
-- TOC entry 3056 (class 0 OID 0)
-- Dependencies: 236
-- Name: fcusersession_us_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcusersession_us_id_seq', 767, true);


--
-- TOC entry 2931 (class 0 OID 50413)
-- Dependencies: 237
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
-- TOC entry 3057 (class 0 OID 0)
-- Dependencies: 238
-- Name: martistskill_ma_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('martistskill_ma_id_seq', 34, true);


--
-- TOC entry 2963 (class 0 OID 51503)
-- Dependencies: 404
-- Data for Name: mbarcodetype; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO mbarcodetype (bt_code, bt_name, bt_format) VALUES ('CODABAR', 'Codabar', NULL);
INSERT INTO mbarcodetype (bt_code, bt_name, bt_format) VALUES ('CODE11', 'Code 11', NULL);
INSERT INTO mbarcodetype (bt_code, bt_name, bt_format) VALUES ('EAN13', 'EAN-13', NULL);
INSERT INTO mbarcodetype (bt_code, bt_name, bt_format) VALUES ('EAN8', 'EAN-8', NULL);
INSERT INTO mbarcodetype (bt_code, bt_name, bt_format) VALUES ('CODE39', 'Code 39', NULL);
INSERT INTO mbarcodetype (bt_code, bt_name, bt_format) VALUES ('CODE128', 'Code 128', NULL);


--
-- TOC entry 2933 (class 0 OID 50418)
-- Dependencies: 239
-- Data for Name: mcarton; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO mcarton (car_id, car_name, car_status) VALUES (38, 'Five panel', 'ACTIVE');
INSERT INTO mcarton (car_id, car_name, car_status) VALUES (39, 'HSC', 'ACTIVE');
INSERT INTO mcarton (car_id, car_name, car_status) VALUES (40, 'OSC 2', 'ACTIVE');
INSERT INTO mcarton (car_id, car_name, car_status) VALUES (41, 'New carton', 'ACTIVE');


--
-- TOC entry 3058 (class 0 OID 0)
-- Dependencies: 240
-- Name: mcarton_car_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('mcarton_car_id_seq', 42, true);


--
-- TOC entry 2935 (class 0 OID 50423)
-- Dependencies: 241
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
-- TOC entry 2936 (class 0 OID 50426)
-- Dependencies: 242
-- Data for Name: mcustmachine; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO mcustmachine (mc_id, mc_orgid, mc_pressmanufacturer, mc_pressyearbuilt, mc_pressmodel, mc_presswidth, mc_presstype, mc_pressspeed, mc_presscylinderrepeat, mc_inkmanufacturer, mc_inkcommercialname, mc_inktype, mc_inktypeother, mc_inkviscosity, mc_inkvicosityother, mc_inkprintingunit_1, mc_inkprintingunit_2, mc_inkprintingunit_3, mc_inkprintingunit_4, mc_inkprintingunit_5, mc_inkvisocity_1, mc_inkvisocity_2, mc_inkvisocity_3, mc_inkvisocity_4, mc_inkvisocity_5, mc_inkph_1, mc_inkph_2, mc_inkph_3, mc_inkph_4, mc_inkph_5, mc_inkdensity_1, mc_inkdensity_2, mc_inkdensity_3, mc_inkdensity_4, mc_inkdensity_5, mc_platemanufacturer, mc_platecommercialname, mc_platetype, mc_platedurometer, mc_platethickness, mc_platerelief, mc_mountingtapemanufacturer, mc_mountingtapename, mc_mountingtapedensity, mc_mountingtapthickness, mc_mountingcarrierthickness, mc_mountingcushionmanufacturer, mc_mountingcushonname, mc_mountingdensity, mc_mountingcushionthickness, mc_cimplevel_1, mc_cimplevel_2, mc_cimplevel_3, mc_cimplevel_4, mc_cimplevel_5, mc_cimpsubstrate_1, mc_cimpsubstrate_2, mc_cimpsubstrate_3, mc_cimpsubstrate_4, mc_cimpsubstrate_5, mc_cimpanlox_1, mc_cimpanlox_2, mc_cimpanlox_3, mc_cimpanlox_4, mc_cimpanlox_5, mc_aniloxmanufacturer, mc_aniloxtype, mc_aniloxengravingangle, mc_aniloxinking, mc_aniloxprintingunit_1, mc_aniloxprintingunit_2, mc_aniloxprintingunit_3, mc_aniloxprintingunit_4, mc_aniloxprintingunit_5, mc_aniloxmanufacturer_1, mc_aniloxmanufacturer_2, mc_aniloxmanufacturer_3, mc_aniloxmanufacturer_4, mc_aniloxmanufacturer_5, mc_aniloxtype_1, mc_aniloxtype_2, mc_aniloxtype_3, mc_aniloxtype_4, mc_aniloxtype_5, mc_aniloxengravingangle_1, mc_aniloxengravingangle_2, mc_aniloxengravingangle_3, mc_aniloxengravingangle_4, mc_aniloxengravingangle_5, mc_aniloxinking_1, mc_aniloxinking_2, mc_aniloxinking_3, mc_aniloxinking_4, mc_aniloxinking_5, mc_aniloxcellcount_1, mc_aniloxcellcount_2, mc_aniloxcellcount_3, mc_aniloxcellcount_4, mc_aniloxcellcount_5, mc_aniloxvolumn_1, mc_aniloxvolumn_2, mc_aniloxvolumn_3, mc_aniloxvolumn_4, mc_aniloxvolumn_5, mc_aniloxdoration_1, mc_aniloxdoration_2, mc_aniloxdoration_3, mc_aniloxdoration_4, mc_aniloxdoration_5, mc_aniloxdoctoring_1, mc_aniloxdoctoring_2, mc_aniloxdoctoring_3, mc_aniloxdoctoring_4, mc_aniloxdoctoring_5, mc_aniloxcontainment_1, mc_aniloxcontainment_2, mc_aniloxcontainment_3, mc_aniloxcontainment_4, mc_aniloxcontainment_5, mc_substratemanufacturer, mc_substratename, mc_substratetype, mc_substratedyna, mc_substrateweight, mc_substrateflute, mc_substratethickness, mc_printer_name) VALUES (1, 2, 'Facture1', '1958', 'Model 1', '1230', 'Stack', '100', '1000', 'Ink manufacturer', 'Ink manufacturer commercial name', 'Water Based', '1234', 'Auto', '1233', 'Ink Printing Unit 1', 'Ink PU2', 'Ink PU3', 'Ink PU4', 'Ink PU5', 'Ink Vis1', 'Ink Vis2', 'Ink Vis3', 'Ink Vis4', 'Ink Vis5', 'Ink ph1', 'Ink ph2', 'Ink ph3', 'Ink ph4', 'Ink ph5', 'Ink des1', 'Ink des2', 'Ink des3', 'Ink des4', 'Ink des5', 'Plate manufacturer', 'plate commercial name', 'Solid, Liquid', 'plate durometer', '123', '123', 'Mounting manufacturer', 'Mounting manufacturer comercial name', 'Mountting Density', '11', '22', 'Mounting carrier manufacturer', 'Mounting carrier manufacturer commercial name', 'Mounting carrier manufacturer density', '123', 'CI imp lvl 1', 'CI imp lvl 2', 'CI imp lvl 3', 'CI imp lvl 4', 'CI imp lvl 5', '11', '22', '33', '44', '55', '123', '123', '123', '123', '13', 'Doctor manufacturer', 'Laser Engraved Ceramic', 'N', 'N', '1', '2', '3', '4', '5', '1', '2', '3', '4', '5', '11', '2', '3', '4', '5', '1', '2', '3', '4', '5', '1', '2', '5', '3', '4', '1', '2', '3', '4', '5', '1', '2', '3', '4', '5', '1', '2', '3', '4', '5', '1', '2', '3', '4', '5', '1', '2', '3', '4', '5', 'Subrate manufacturer', 'Subrate manufacturer 11', 'Film', '2', '2', '11', '11', 'Printer ABC');
INSERT INTO mcustmachine (mc_id, mc_orgid, mc_pressmanufacturer, mc_pressyearbuilt, mc_pressmodel, mc_presswidth, mc_presstype, mc_pressspeed, mc_presscylinderrepeat, mc_inkmanufacturer, mc_inkcommercialname, mc_inktype, mc_inktypeother, mc_inkviscosity, mc_inkvicosityother, mc_inkprintingunit_1, mc_inkprintingunit_2, mc_inkprintingunit_3, mc_inkprintingunit_4, mc_inkprintingunit_5, mc_inkvisocity_1, mc_inkvisocity_2, mc_inkvisocity_3, mc_inkvisocity_4, mc_inkvisocity_5, mc_inkph_1, mc_inkph_2, mc_inkph_3, mc_inkph_4, mc_inkph_5, mc_inkdensity_1, mc_inkdensity_2, mc_inkdensity_3, mc_inkdensity_4, mc_inkdensity_5, mc_platemanufacturer, mc_platecommercialname, mc_platetype, mc_platedurometer, mc_platethickness, mc_platerelief, mc_mountingtapemanufacturer, mc_mountingtapename, mc_mountingtapedensity, mc_mountingtapthickness, mc_mountingcarrierthickness, mc_mountingcushionmanufacturer, mc_mountingcushonname, mc_mountingdensity, mc_mountingcushionthickness, mc_cimplevel_1, mc_cimplevel_2, mc_cimplevel_3, mc_cimplevel_4, mc_cimplevel_5, mc_cimpsubstrate_1, mc_cimpsubstrate_2, mc_cimpsubstrate_3, mc_cimpsubstrate_4, mc_cimpsubstrate_5, mc_cimpanlox_1, mc_cimpanlox_2, mc_cimpanlox_3, mc_cimpanlox_4, mc_cimpanlox_5, mc_aniloxmanufacturer, mc_aniloxtype, mc_aniloxengravingangle, mc_aniloxinking, mc_aniloxprintingunit_1, mc_aniloxprintingunit_2, mc_aniloxprintingunit_3, mc_aniloxprintingunit_4, mc_aniloxprintingunit_5, mc_aniloxmanufacturer_1, mc_aniloxmanufacturer_2, mc_aniloxmanufacturer_3, mc_aniloxmanufacturer_4, mc_aniloxmanufacturer_5, mc_aniloxtype_1, mc_aniloxtype_2, mc_aniloxtype_3, mc_aniloxtype_4, mc_aniloxtype_5, mc_aniloxengravingangle_1, mc_aniloxengravingangle_2, mc_aniloxengravingangle_3, mc_aniloxengravingangle_4, mc_aniloxengravingangle_5, mc_aniloxinking_1, mc_aniloxinking_2, mc_aniloxinking_3, mc_aniloxinking_4, mc_aniloxinking_5, mc_aniloxcellcount_1, mc_aniloxcellcount_2, mc_aniloxcellcount_3, mc_aniloxcellcount_4, mc_aniloxcellcount_5, mc_aniloxvolumn_1, mc_aniloxvolumn_2, mc_aniloxvolumn_3, mc_aniloxvolumn_4, mc_aniloxvolumn_5, mc_aniloxdoration_1, mc_aniloxdoration_2, mc_aniloxdoration_3, mc_aniloxdoration_4, mc_aniloxdoration_5, mc_aniloxdoctoring_1, mc_aniloxdoctoring_2, mc_aniloxdoctoring_3, mc_aniloxdoctoring_4, mc_aniloxdoctoring_5, mc_aniloxcontainment_1, mc_aniloxcontainment_2, mc_aniloxcontainment_3, mc_aniloxcontainment_4, mc_aniloxcontainment_5, mc_substratemanufacturer, mc_substratename, mc_substratetype, mc_substratedyna, mc_substrateweight, mc_substrateflute, mc_substratethickness, mc_printer_name) VALUES (2, 10, 'pressmanufacturer', 'yearbuild', 'model', 'width', 'Stack', 'speed', 'cylinderrepeat', 'inkmanufacturer', 'commercialname', 'U.V', 'typeother', 'Manual', 'viscosityother', 'printingunit1', 'printingunit2', 'printingunit3', 'printingunit4', 'printingunit5', 'viscosity1', 'viscosity2', 'viscosity3', 'viscosity4', 'viscosity5', 'ph1', 'ph2', 'ph3', 'ph4', 'ph5', 'density1', 'density2', 'density3', 'density4', 'density5', 'platesmanufacturer', 'platescommercialname', 'Uncapped', 'durometer', 'tickness', 'relief', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Printer 123');
INSERT INTO mcustmachine (mc_id, mc_orgid, mc_pressmanufacturer, mc_pressyearbuilt, mc_pressmodel, mc_presswidth, mc_presstype, mc_pressspeed, mc_presscylinderrepeat, mc_inkmanufacturer, mc_inkcommercialname, mc_inktype, mc_inktypeother, mc_inkviscosity, mc_inkvicosityother, mc_inkprintingunit_1, mc_inkprintingunit_2, mc_inkprintingunit_3, mc_inkprintingunit_4, mc_inkprintingunit_5, mc_inkvisocity_1, mc_inkvisocity_2, mc_inkvisocity_3, mc_inkvisocity_4, mc_inkvisocity_5, mc_inkph_1, mc_inkph_2, mc_inkph_3, mc_inkph_4, mc_inkph_5, mc_inkdensity_1, mc_inkdensity_2, mc_inkdensity_3, mc_inkdensity_4, mc_inkdensity_5, mc_platemanufacturer, mc_platecommercialname, mc_platetype, mc_platedurometer, mc_platethickness, mc_platerelief, mc_mountingtapemanufacturer, mc_mountingtapename, mc_mountingtapedensity, mc_mountingtapthickness, mc_mountingcarrierthickness, mc_mountingcushionmanufacturer, mc_mountingcushonname, mc_mountingdensity, mc_mountingcushionthickness, mc_cimplevel_1, mc_cimplevel_2, mc_cimplevel_3, mc_cimplevel_4, mc_cimplevel_5, mc_cimpsubstrate_1, mc_cimpsubstrate_2, mc_cimpsubstrate_3, mc_cimpsubstrate_4, mc_cimpsubstrate_5, mc_cimpanlox_1, mc_cimpanlox_2, mc_cimpanlox_3, mc_cimpanlox_4, mc_cimpanlox_5, mc_aniloxmanufacturer, mc_aniloxtype, mc_aniloxengravingangle, mc_aniloxinking, mc_aniloxprintingunit_1, mc_aniloxprintingunit_2, mc_aniloxprintingunit_3, mc_aniloxprintingunit_4, mc_aniloxprintingunit_5, mc_aniloxmanufacturer_1, mc_aniloxmanufacturer_2, mc_aniloxmanufacturer_3, mc_aniloxmanufacturer_4, mc_aniloxmanufacturer_5, mc_aniloxtype_1, mc_aniloxtype_2, mc_aniloxtype_3, mc_aniloxtype_4, mc_aniloxtype_5, mc_aniloxengravingangle_1, mc_aniloxengravingangle_2, mc_aniloxengravingangle_3, mc_aniloxengravingangle_4, mc_aniloxengravingangle_5, mc_aniloxinking_1, mc_aniloxinking_2, mc_aniloxinking_3, mc_aniloxinking_4, mc_aniloxinking_5, mc_aniloxcellcount_1, mc_aniloxcellcount_2, mc_aniloxcellcount_3, mc_aniloxcellcount_4, mc_aniloxcellcount_5, mc_aniloxvolumn_1, mc_aniloxvolumn_2, mc_aniloxvolumn_3, mc_aniloxvolumn_4, mc_aniloxvolumn_5, mc_aniloxdoration_1, mc_aniloxdoration_2, mc_aniloxdoration_3, mc_aniloxdoration_4, mc_aniloxdoration_5, mc_aniloxdoctoring_1, mc_aniloxdoctoring_2, mc_aniloxdoctoring_3, mc_aniloxdoctoring_4, mc_aniloxdoctoring_5, mc_aniloxcontainment_1, mc_aniloxcontainment_2, mc_aniloxcontainment_3, mc_aniloxcontainment_4, mc_aniloxcontainment_5, mc_substratemanufacturer, mc_substratename, mc_substratetype, mc_substratedyna, mc_substrateweight, mc_substrateflute, mc_substratethickness, mc_printer_name) VALUES (3, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Printer for customer 1');
INSERT INTO mcustmachine (mc_id, mc_orgid, mc_pressmanufacturer, mc_pressyearbuilt, mc_pressmodel, mc_presswidth, mc_presstype, mc_pressspeed, mc_presscylinderrepeat, mc_inkmanufacturer, mc_inkcommercialname, mc_inktype, mc_inktypeother, mc_inkviscosity, mc_inkvicosityother, mc_inkprintingunit_1, mc_inkprintingunit_2, mc_inkprintingunit_3, mc_inkprintingunit_4, mc_inkprintingunit_5, mc_inkvisocity_1, mc_inkvisocity_2, mc_inkvisocity_3, mc_inkvisocity_4, mc_inkvisocity_5, mc_inkph_1, mc_inkph_2, mc_inkph_3, mc_inkph_4, mc_inkph_5, mc_inkdensity_1, mc_inkdensity_2, mc_inkdensity_3, mc_inkdensity_4, mc_inkdensity_5, mc_platemanufacturer, mc_platecommercialname, mc_platetype, mc_platedurometer, mc_platethickness, mc_platerelief, mc_mountingtapemanufacturer, mc_mountingtapename, mc_mountingtapedensity, mc_mountingtapthickness, mc_mountingcarrierthickness, mc_mountingcushionmanufacturer, mc_mountingcushonname, mc_mountingdensity, mc_mountingcushionthickness, mc_cimplevel_1, mc_cimplevel_2, mc_cimplevel_3, mc_cimplevel_4, mc_cimplevel_5, mc_cimpsubstrate_1, mc_cimpsubstrate_2, mc_cimpsubstrate_3, mc_cimpsubstrate_4, mc_cimpsubstrate_5, mc_cimpanlox_1, mc_cimpanlox_2, mc_cimpanlox_3, mc_cimpanlox_4, mc_cimpanlox_5, mc_aniloxmanufacturer, mc_aniloxtype, mc_aniloxengravingangle, mc_aniloxinking, mc_aniloxprintingunit_1, mc_aniloxprintingunit_2, mc_aniloxprintingunit_3, mc_aniloxprintingunit_4, mc_aniloxprintingunit_5, mc_aniloxmanufacturer_1, mc_aniloxmanufacturer_2, mc_aniloxmanufacturer_3, mc_aniloxmanufacturer_4, mc_aniloxmanufacturer_5, mc_aniloxtype_1, mc_aniloxtype_2, mc_aniloxtype_3, mc_aniloxtype_4, mc_aniloxtype_5, mc_aniloxengravingangle_1, mc_aniloxengravingangle_2, mc_aniloxengravingangle_3, mc_aniloxengravingangle_4, mc_aniloxengravingangle_5, mc_aniloxinking_1, mc_aniloxinking_2, mc_aniloxinking_3, mc_aniloxinking_4, mc_aniloxinking_5, mc_aniloxcellcount_1, mc_aniloxcellcount_2, mc_aniloxcellcount_3, mc_aniloxcellcount_4, mc_aniloxcellcount_5, mc_aniloxvolumn_1, mc_aniloxvolumn_2, mc_aniloxvolumn_3, mc_aniloxvolumn_4, mc_aniloxvolumn_5, mc_aniloxdoration_1, mc_aniloxdoration_2, mc_aniloxdoration_3, mc_aniloxdoration_4, mc_aniloxdoration_5, mc_aniloxdoctoring_1, mc_aniloxdoctoring_2, mc_aniloxdoctoring_3, mc_aniloxdoctoring_4, mc_aniloxdoctoring_5, mc_aniloxcontainment_1, mc_aniloxcontainment_2, mc_aniloxcontainment_3, mc_aniloxcontainment_4, mc_aniloxcontainment_5, mc_substratemanufacturer, mc_substratename, mc_substratetype, mc_substratedyna, mc_substrateweight, mc_substrateflute, mc_substratethickness, mc_printer_name) VALUES (4, 13, 'Printer 1 for customer 4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Printer 1 for customer 4');


--
-- TOC entry 3059 (class 0 OID 0)
-- Dependencies: 243
-- Name: mcustmachine_mc_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('mcustmachine_mc_id_seq', 4, true);


--
-- TOC entry 2965 (class 0 OID 51510)
-- Dependencies: 406
-- Data for Name: mjobbarcode; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO mjobbarcode (jbc_id, jbc_jsid, jbc_btcode, jbc_value) VALUES (1, 84, 'CODE11', 'saddsa');
INSERT INTO mjobbarcode (jbc_id, jbc_jsid, jbc_btcode, jbc_value) VALUES (30, 112, 'CODE128', '123');
INSERT INTO mjobbarcode (jbc_id, jbc_jsid, jbc_btcode, jbc_value) VALUES (31, 112, 'CODE39', '23');
INSERT INTO mjobbarcode (jbc_id, jbc_jsid, jbc_btcode, jbc_value) VALUES (32, 116, 'CODABAR', 'abc123');
INSERT INTO mjobbarcode (jbc_id, jbc_jsid, jbc_btcode, jbc_value) VALUES (33, 116, 'CODE11', 'bcc241');


--
-- TOC entry 3060 (class 0 OID 0)
-- Dependencies: 405
-- Name: mjobbarcode_jbc_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('mjobbarcode_jbc_id_seq', 33, true);


--
-- TOC entry 2938 (class 0 OID 50434)
-- Dependencies: 244
-- Data for Name: mjobcat; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (244, 112, 6);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (245, 112, 2);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (246, 112, 3);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (247, 114, 2);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (250, 116, 6);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (251, 117, 3);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (252, 117, 4);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (253, 118, 2);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (254, 115, 2);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (255, 115, 1);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (149, 57, 5);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (150, 57, 1);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (151, 58, 5);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (152, 58, 1);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (157, 59, 5);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (158, 59, 1);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (159, 60, 6);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (160, 60, 2);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (161, 61, 2);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (162, 62, 5);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (163, 62, 6);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (164, 63, 8);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (165, 64, 3);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (168, 66, 6);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (169, 66, 7);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (170, 66, 8);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (171, 66, 3);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (172, 67, 2);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (173, 68, 6);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (174, 68, 2);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (175, 65, 5);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (176, 65, 6);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (177, 69, 5);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (178, 69, 6);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (179, 69, 2);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (183, 70, 5);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (184, 70, 6);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (185, 70, 2);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (186, 71, 5);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (187, 71, 6);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (191, 72, 5);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (192, 72, 6);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (193, 72, 2);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (199, 74, 5);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (200, 74, 6);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (201, 74, 7);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (202, 75, 5);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (203, 75, 6);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (204, 76, 5);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (205, 76, 6);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (206, 77, 5);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (207, 77, 6);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (208, 77, 2);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (209, 78, 5);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (210, 78, 6);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (211, 79, 6);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (212, 80, 5);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (213, 80, 6);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (214, 81, 5);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (215, 81, 6);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (216, 82, 5);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (217, 82, 6);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (218, 83, 5);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (219, 83, 6);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (220, 84, 6);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (221, 84, 2);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (234, 111, 2);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (238, 113, 2);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (239, 113, 3);
INSERT INTO mjobcat (jc_id, jc_jsid, jc_jclid) VALUES (240, 113, 4);


--
-- TOC entry 3061 (class 0 OID 0)
-- Dependencies: 245
-- Name: mjobcat_jc_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('mjobcat_jc_id_seq', 255, true);


--
-- TOC entry 2940 (class 0 OID 50439)
-- Dependencies: 246
-- Data for Name: mjobcatlookup; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO mjobcatlookup (jcl_id, jcl_title, jcl_sequence, jcl_requiretime_color_1, jcl_requiretime_color_2, jcl_requiretime_color_3, jcl_requiretime_color_4, jcl_status) VALUES (1, 'Typing', 100, 120, 120, 120, 120, 'ACTIVE');
INSERT INTO mjobcatlookup (jcl_id, jcl_title, jcl_sequence, jcl_requiretime_color_1, jcl_requiretime_color_2, jcl_requiretime_color_3, jcl_requiretime_color_4, jcl_status) VALUES (4, 'Trapping', 400, 180, 180, 360, 360, 'ACTIVE');
INSERT INTO mjobcatlookup (jcl_id, jcl_title, jcl_sequence, jcl_requiretime_color_1, jcl_requiretime_color_2, jcl_requiretime_color_3, jcl_requiretime_color_4, jcl_status) VALUES (2, 'Drawing', 200, 240, 240, 240, 240, 'ACTIVE');
INSERT INTO mjobcatlookup (jcl_id, jcl_title, jcl_sequence, jcl_requiretime_color_1, jcl_requiretime_color_2, jcl_requiretime_color_3, jcl_requiretime_color_4, jcl_status) VALUES (3, 'Monotone', 300, 60, 60, 60, 60, 'ACTIVE');
INSERT INTO mjobcatlookup (jcl_id, jcl_title, jcl_sequence, jcl_requiretime_color_1, jcl_requiretime_color_2, jcl_requiretime_color_3, jcl_requiretime_color_4, jcl_status) VALUES (6, 'Barcode', 600, 30, 30, 30, 30, 'ACTIVE');


--
-- TOC entry 3062 (class 0 OID 0)
-- Dependencies: 247
-- Name: mjobcatlookup_jcl_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('mjobcatlookup_jcl_id_seq', 8, true);


--
-- TOC entry 2942 (class 0 OID 50444)
-- Dependencies: 248
-- Data for Name: mjoboutput; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO mjoboutput (jo_id, jo_jsid, jo_outputcode) VALUES (22, 57, 'TM');
INSERT INTO mjoboutput (jo_id, jo_jsid, jo_outputcode) VALUES (23, 57, ' ARTSEP');
INSERT INTO mjoboutput (jo_id, jo_jsid, jo_outputcode) VALUES (24, 58, 'TM');
INSERT INTO mjoboutput (jo_id, jo_jsid, jo_outputcode) VALUES (28, 59, 'TM');
INSERT INTO mjoboutput (jo_id, jo_jsid, jo_outputcode) VALUES (29, 60, 'TM');
INSERT INTO mjoboutput (jo_id, jo_jsid, jo_outputcode) VALUES (30, 61, 'TM');
INSERT INTO mjoboutput (jo_id, jo_jsid, jo_outputcode) VALUES (31, 62, 'TM');
INSERT INTO mjoboutput (jo_id, jo_jsid, jo_outputcode) VALUES (32, 62, ' ARTSEP');
INSERT INTO mjoboutput (jo_id, jo_jsid, jo_outputcode) VALUES (33, 63, 'MCWC');
INSERT INTO mjoboutput (jo_id, jo_jsid, jo_outputcode) VALUES (34, 64, 'ARTSEP');
INSERT INTO mjoboutput (jo_id, jo_jsid, jo_outputcode) VALUES (35, 64, ' MCNC');
INSERT INTO mjoboutput (jo_id, jo_jsid, jo_outputcode) VALUES (38, 66, 'TM');
INSERT INTO mjoboutput (jo_id, jo_jsid, jo_outputcode) VALUES (39, 66, ' ARTSEP');
INSERT INTO mjoboutput (jo_id, jo_jsid, jo_outputcode) VALUES (40, 67, 'ARTSEP');
INSERT INTO mjoboutput (jo_id, jo_jsid, jo_outputcode) VALUES (41, 68, 'ARTSEP');
INSERT INTO mjoboutput (jo_id, jo_jsid, jo_outputcode) VALUES (42, 68, ' MCWC');
INSERT INTO mjoboutput (jo_id, jo_jsid, jo_outputcode) VALUES (43, 65, 'TM');
INSERT INTO mjoboutput (jo_id, jo_jsid, jo_outputcode) VALUES (44, 69, 'TM');
INSERT INTO mjoboutput (jo_id, jo_jsid, jo_outputcode) VALUES (45, 69, ' ARTSEP');
INSERT INTO mjoboutput (jo_id, jo_jsid, jo_outputcode) VALUES (48, 70, 'TM');
INSERT INTO mjoboutput (jo_id, jo_jsid, jo_outputcode) VALUES (49, 71, 'TM');
INSERT INTO mjoboutput (jo_id, jo_jsid, jo_outputcode) VALUES (50, 71, ' ARTSEP');
INSERT INTO mjoboutput (jo_id, jo_jsid, jo_outputcode) VALUES (53, 72, 'TM');
INSERT INTO mjoboutput (jo_id, jo_jsid, jo_outputcode) VALUES (58, 74, 'ARTSEP');
INSERT INTO mjoboutput (jo_id, jo_jsid, jo_outputcode) VALUES (59, 75, 'TM');
INSERT INTO mjoboutput (jo_id, jo_jsid, jo_outputcode) VALUES (60, 75, ' ARTSEP');
INSERT INTO mjoboutput (jo_id, jo_jsid, jo_outputcode) VALUES (61, 76, 'ARTSEP');
INSERT INTO mjoboutput (jo_id, jo_jsid, jo_outputcode) VALUES (62, 77, 'TM');
INSERT INTO mjoboutput (jo_id, jo_jsid, jo_outputcode) VALUES (63, 77, ' ARTSEP');
INSERT INTO mjoboutput (jo_id, jo_jsid, jo_outputcode) VALUES (64, 78, 'ARTSEP');
INSERT INTO mjoboutput (jo_id, jo_jsid, jo_outputcode) VALUES (65, 79, 'ARTSEP');
INSERT INTO mjoboutput (jo_id, jo_jsid, jo_outputcode) VALUES (66, 80, 'ARTSEP');
INSERT INTO mjoboutput (jo_id, jo_jsid, jo_outputcode) VALUES (67, 81, 'ARTSEP');
INSERT INTO mjoboutput (jo_id, jo_jsid, jo_outputcode) VALUES (68, 82, 'TM');
INSERT INTO mjoboutput (jo_id, jo_jsid, jo_outputcode) VALUES (69, 82, ' ARTSEP');
INSERT INTO mjoboutput (jo_id, jo_jsid, jo_outputcode) VALUES (70, 83, 'TM');
INSERT INTO mjoboutput (jo_id, jo_jsid, jo_outputcode) VALUES (71, 83, ' ARTSEP');
INSERT INTO mjoboutput (jo_id, jo_jsid, jo_outputcode) VALUES (72, 84, '2');
INSERT INTO mjoboutput (jo_id, jo_jsid, jo_outputcode) VALUES (79, 111, '2');
INSERT INTO mjoboutput (jo_id, jo_jsid, jo_outputcode) VALUES (81, 113, '2');
INSERT INTO mjoboutput (jo_id, jo_jsid, jo_outputcode) VALUES (82, 113, ' 1');
INSERT INTO mjoboutput (jo_id, jo_jsid, jo_outputcode) VALUES (84, 112, '2');
INSERT INTO mjoboutput (jo_id, jo_jsid, jo_outputcode) VALUES (85, 114, '2');
INSERT INTO mjoboutput (jo_id, jo_jsid, jo_outputcode) VALUES (87, 116, '2');
INSERT INTO mjoboutput (jo_id, jo_jsid, jo_outputcode) VALUES (88, 117, '3');
INSERT INTO mjoboutput (jo_id, jo_jsid, jo_outputcode) VALUES (89, 118, '2');
INSERT INTO mjoboutput (jo_id, jo_jsid, jo_outputcode) VALUES (90, 115, '2');
INSERT INTO mjoboutput (jo_id, jo_jsid, jo_outputcode) VALUES (91, 115, ' 3');


--
-- TOC entry 2960 (class 0 OID 51479)
-- Dependencies: 401
-- Data for Name: mjoboutputlookup; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO mjoboutputlookup (jol_id, jol_title, jol_requiredtime, jol_status) VALUES (1, 'Technical drawing', 120, 'ACTIVE');
INSERT INTO mjoboutputlookup (jol_id, jol_title, jol_requiredtime, jol_status) VALUES (2, 'Artwork seperation', 60, 'ACTIVE');
INSERT INTO mjoboutputlookup (jol_id, jol_title, jol_requiredtime, jol_status) VALUES (3, 'Master Card', 10, 'ACTIVE');


--
-- TOC entry 3063 (class 0 OID 0)
-- Dependencies: 400
-- Name: mjoboutputlookup_jol_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('mjoboutputlookup_jol_id_seq', 3, true);


--
-- TOC entry 2943 (class 0 OID 50447)
-- Dependencies: 249
-- Data for Name: mjobsheet; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO mjobsheet (js_id, js_orgid, js_ctid, js_request_date, js_request_by, js_title, js_model, js_description, js_material_provided, js_color_1, js_color_2, js_color_3, js_color_4, js_color_5, js_angle_1, js_angle_2, js_angle_3, js_angle_4, js_angle_5, js_bleeding, js_bleeding_remark, js_distortion, js_distortion_value, js_diecut_ind, js_diecut_no, js_trapping_size, js_primcat, js_status, js_completiondate, js_assignto, js_carid, js_decision, js_width, js_height, js_requiretime, js_request_dateinmth, js_jobcolor, js_lpi, js_mcid, js_code, js_month_occur) VALUES (63, 9, 6, '2014-06-21 22:23:53.517+08', 'uat_cust1', NULL, NULL, 'Master card artwork', NULL, '222', '333', '444', '555', NULL, '10', '20', '30', '40', NULL, '7', '7mm standard bleeding', 'X', 4.0000, 'Y', NULL, NULL, 8, 'NEW', NULL, 'uat_artist1', 39, 'Assign', NULL, NULL, 30, 'Jun-2014', '4', NULL, NULL, NULL, NULL);
INSERT INTO mjobsheet (js_id, js_orgid, js_ctid, js_request_date, js_request_by, js_title, js_model, js_description, js_material_provided, js_color_1, js_color_2, js_color_3, js_color_4, js_color_5, js_angle_1, js_angle_2, js_angle_3, js_angle_4, js_angle_5, js_bleeding, js_bleeding_remark, js_distortion, js_distortion_value, js_diecut_ind, js_diecut_no, js_trapping_size, js_primcat, js_status, js_completiondate, js_assignto, js_carid, js_decision, js_width, js_height, js_requiretime, js_request_dateinmth, js_jobcolor, js_lpi, js_mcid, js_code, js_month_occur) VALUES (57, 1, 4, '2014-06-21 18:09:24.749+08', 'admin2', NULL, NULL, 'Yow Yik Shuen Job', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 'COMPLETED', NULL, 'artist1', 38, 'Accept', '200', '300', 120, 'Jun-2014', '1', NULL, NULL, NULL, NULL);
INSERT INTO mjobsheet (js_id, js_orgid, js_ctid, js_request_date, js_request_by, js_title, js_model, js_description, js_material_provided, js_color_1, js_color_2, js_color_3, js_color_4, js_color_5, js_angle_1, js_angle_2, js_angle_3, js_angle_4, js_angle_5, js_bleeding, js_bleeding_remark, js_distortion, js_distortion_value, js_diecut_ind, js_diecut_no, js_trapping_size, js_primcat, js_status, js_completiondate, js_assignto, js_carid, js_decision, js_width, js_height, js_requiretime, js_request_dateinmth, js_jobcolor, js_lpi, js_mcid, js_code, js_month_occur) VALUES (72, 9, 2, '2014-06-22 19:09:29.558+08', 'uat_customer1', NULL, NULL, 'Test revert job -22 有中文！！', NULL, '1231', '123', '123', '123', '1321', '13', '123', '131', '131', '31', '15', NULL, NULL, NULL, 'Y', NULL, 131.0000, 6, 'NEW', NULL, 'uat_artist1', 38, 'Forward to Customer', '1231', '2113', 190, 'Jun-2014', '2', NULL, NULL, NULL, NULL);
INSERT INTO mjobsheet (js_id, js_orgid, js_ctid, js_request_date, js_request_by, js_title, js_model, js_description, js_material_provided, js_color_1, js_color_2, js_color_3, js_color_4, js_color_5, js_angle_1, js_angle_2, js_angle_3, js_angle_4, js_angle_5, js_bleeding, js_bleeding_remark, js_distortion, js_distortion_value, js_diecut_ind, js_diecut_no, js_trapping_size, js_primcat, js_status, js_completiondate, js_assignto, js_carid, js_decision, js_width, js_height, js_requiretime, js_request_dateinmth, js_jobcolor, js_lpi, js_mcid, js_code, js_month_occur) VALUES (60, 9, 2, '2014-06-21 19:15:41.873+08', 'uat_cust1', NULL, NULL, 'Barcode scan and drawing', NULL, '333', '112', '113', NULL, NULL, '5', '6', '7', NULL, NULL, '7', '7mm for bleeding', 'Y', 5.0000, 'Y', NULL, NULL, 6, 'COMPLETED', NULL, 'uat_artist1', 40, 'Accept', '33', '22', 90, 'Jun-2014', '3', NULL, NULL, NULL, NULL);
INSERT INTO mjobsheet (js_id, js_orgid, js_ctid, js_request_date, js_request_by, js_title, js_model, js_description, js_material_provided, js_color_1, js_color_2, js_color_3, js_color_4, js_color_5, js_angle_1, js_angle_2, js_angle_3, js_angle_4, js_angle_5, js_bleeding, js_bleeding_remark, js_distortion, js_distortion_value, js_diecut_ind, js_diecut_no, js_trapping_size, js_primcat, js_status, js_completiondate, js_assignto, js_carid, js_decision, js_width, js_height, js_requiretime, js_request_dateinmth, js_jobcolor, js_lpi, js_mcid, js_code, js_month_occur) VALUES (74, 11, 5, '2014-06-22 21:20:41.899+08', 'uat_customer2', NULL, NULL, 'test5', NULL, 'a', 'a', NULL, NULL, NULL, 'd', 'a', NULL, NULL, NULL, '7', NULL, 'Y', 35.0000, 'Y', NULL, 50.0000, 7, 'NEW', NULL, 'esp_artist', 41, 'Assign', NULL, NULL, 220, 'Jun-2014', '3', NULL, NULL, NULL, NULL);
INSERT INTO mjobsheet (js_id, js_orgid, js_ctid, js_request_date, js_request_by, js_title, js_model, js_description, js_material_provided, js_color_1, js_color_2, js_color_3, js_color_4, js_color_5, js_angle_1, js_angle_2, js_angle_3, js_angle_4, js_angle_5, js_bleeding, js_bleeding_remark, js_distortion, js_distortion_value, js_diecut_ind, js_diecut_no, js_trapping_size, js_primcat, js_status, js_completiondate, js_assignto, js_carid, js_decision, js_width, js_height, js_requiretime, js_request_dateinmth, js_jobcolor, js_lpi, js_mcid, js_code, js_month_occur) VALUES (64, 1, 4, '2014-06-22 14:01:20.343+08', 'uat_supervisor1', NULL, NULL, 'Monotone Editing', NULL, '55', '66', '77', '88', NULL, '1', '2', '3', '4', NULL, '10', 'standard 7mm bleed', 'Y', 3.0000, NULL, NULL, NULL, 3, 'NEW', NULL, 'uat_artist3', 38, 'Assign', NULL, NULL, 50, 'Jun-2014', '4', NULL, NULL, NULL, NULL);
INSERT INTO mjobsheet (js_id, js_orgid, js_ctid, js_request_date, js_request_by, js_title, js_model, js_description, js_material_provided, js_color_1, js_color_2, js_color_3, js_color_4, js_color_5, js_angle_1, js_angle_2, js_angle_3, js_angle_4, js_angle_5, js_bleeding, js_bleeding_remark, js_distortion, js_distortion_value, js_diecut_ind, js_diecut_no, js_trapping_size, js_primcat, js_status, js_completiondate, js_assignto, js_carid, js_decision, js_width, js_height, js_requiretime, js_request_dateinmth, js_jobcolor, js_lpi, js_mcid, js_code, js_month_occur) VALUES (59, 9, 1, '2014-06-21 18:47:14.918+08', 'uat_cust1', NULL, NULL, 'Artwork separation job for customer1', NULL, '33', '34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', 'common bleeding 3mm', 'X', 5.0000, 'Y', NULL, NULL, 5, 'NEW', NULL, 'uat_artist1', 39, 'Assign', NULL, NULL, 120, 'Jun-2014', '2', NULL, NULL, NULL, NULL);
INSERT INTO mjobsheet (js_id, js_orgid, js_ctid, js_request_date, js_request_by, js_title, js_model, js_description, js_material_provided, js_color_1, js_color_2, js_color_3, js_color_4, js_color_5, js_angle_1, js_angle_2, js_angle_3, js_angle_4, js_angle_5, js_bleeding, js_bleeding_remark, js_distortion, js_distortion_value, js_diecut_ind, js_diecut_no, js_trapping_size, js_primcat, js_status, js_completiondate, js_assignto, js_carid, js_decision, js_width, js_height, js_requiretime, js_request_dateinmth, js_jobcolor, js_lpi, js_mcid, js_code, js_month_occur) VALUES (58, 9, 1, '2014-06-21 18:45:26.295+08', 'uat_cust1', NULL, NULL, 'Artwork separation for UAT Customer 1', NULL, '333', '334', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', 'common bleeding of 3mm is enough', 'Y', 5.0000, 'Y', NULL, NULL, 5, 'PENDING ACCEPTANCE', NULL, 'uat_artist1', 38, 'Forward to Customer', '33', '44', 120, 'Jun-2014', '2', NULL, NULL, NULL, NULL);
INSERT INTO mjobsheet (js_id, js_orgid, js_ctid, js_request_date, js_request_by, js_title, js_model, js_description, js_material_provided, js_color_1, js_color_2, js_color_3, js_color_4, js_color_5, js_angle_1, js_angle_2, js_angle_3, js_angle_4, js_angle_5, js_bleeding, js_bleeding_remark, js_distortion, js_distortion_value, js_diecut_ind, js_diecut_no, js_trapping_size, js_primcat, js_status, js_completiondate, js_assignto, js_carid, js_decision, js_width, js_height, js_requiretime, js_request_dateinmth, js_jobcolor, js_lpi, js_mcid, js_code, js_month_occur) VALUES (62, 1, 4, '2014-06-21 22:17:30.99+08', 'esp_supervisor', NULL, NULL, 'Esp case', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'X', NULL, 'N', NULL, 12.0000, 6, 'NEW', NULL, NULL, 41, NULL, NULL, NULL, NULL, 'Jun-2014', '1', NULL, NULL, NULL, NULL);
INSERT INTO mjobsheet (js_id, js_orgid, js_ctid, js_request_date, js_request_by, js_title, js_model, js_description, js_material_provided, js_color_1, js_color_2, js_color_3, js_color_4, js_color_5, js_angle_1, js_angle_2, js_angle_3, js_angle_4, js_angle_5, js_bleeding, js_bleeding_remark, js_distortion, js_distortion_value, js_diecut_ind, js_diecut_no, js_trapping_size, js_primcat, js_status, js_completiondate, js_assignto, js_carid, js_decision, js_width, js_height, js_requiretime, js_request_dateinmth, js_jobcolor, js_lpi, js_mcid, js_code, js_month_occur) VALUES (61, 9, 5, '2014-06-21 21:57:49.784+08', 'uat_cust1', NULL, NULL, 'drawing artwork', NULL, '333', '334', '335', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '10', '10mm bleed', 'X', 5.0000, NULL, NULL, NULL, 2, 'NEW', NULL, 'uat_artist1', 39, 'Revert', NULL, NULL, 30, 'Jun-2014', '3', NULL, NULL, NULL, NULL);
INSERT INTO mjobsheet (js_id, js_orgid, js_ctid, js_request_date, js_request_by, js_title, js_model, js_description, js_material_provided, js_color_1, js_color_2, js_color_3, js_color_4, js_color_5, js_angle_1, js_angle_2, js_angle_3, js_angle_4, js_angle_5, js_bleeding, js_bleeding_remark, js_distortion, js_distortion_value, js_diecut_ind, js_diecut_no, js_trapping_size, js_primcat, js_status, js_completiondate, js_assignto, js_carid, js_decision, js_width, js_height, js_requiretime, js_request_dateinmth, js_jobcolor, js_lpi, js_mcid, js_code, js_month_occur) VALUES (77, 12, 2, '2014-06-22 22:25:19.154+08', 'uat_customer3', NULL, NULL, 'Oder 2 by eng', NULL, '123', '123', '123', '12', '3123', '123', '132', '123', '123', NULL, '0', '123', NULL, 123.0000, 'Y', NULL, 123.0000, 6, 'NEW', NULL, NULL, 38, NULL, NULL, NULL, NULL, 'Jun-2014', '3', NULL, NULL, NULL, NULL);
INSERT INTO mjobsheet (js_id, js_orgid, js_ctid, js_request_date, js_request_by, js_title, js_model, js_description, js_material_provided, js_color_1, js_color_2, js_color_3, js_color_4, js_color_5, js_angle_1, js_angle_2, js_angle_3, js_angle_4, js_angle_5, js_bleeding, js_bleeding_remark, js_distortion, js_distortion_value, js_diecut_ind, js_diecut_no, js_trapping_size, js_primcat, js_status, js_completiondate, js_assignto, js_carid, js_decision, js_width, js_height, js_requiretime, js_request_dateinmth, js_jobcolor, js_lpi, js_mcid, js_code, js_month_occur) VALUES (65, 9, 3, '2014-06-22 15:06:57.158+08', 'uat_cust1', NULL, NULL, 'Test job', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 'NEW', NULL, NULL, 41, 'Revert', NULL, NULL, 160, 'Jun-2014', '2', NULL, NULL, NULL, NULL);
INSERT INTO mjobsheet (js_id, js_orgid, js_ctid, js_request_date, js_request_by, js_title, js_model, js_description, js_material_provided, js_color_1, js_color_2, js_color_3, js_color_4, js_color_5, js_angle_1, js_angle_2, js_angle_3, js_angle_4, js_angle_5, js_bleeding, js_bleeding_remark, js_distortion, js_distortion_value, js_diecut_ind, js_diecut_no, js_trapping_size, js_primcat, js_status, js_completiondate, js_assignto, js_carid, js_decision, js_width, js_height, js_requiretime, js_request_dateinmth, js_jobcolor, js_lpi, js_mcid, js_code, js_month_occur) VALUES (68, 1, 2, '2014-06-22 15:53:21.722+08', 'ysyow', NULL, NULL, 'Test 4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 'NEW', NULL, 'artist2', 38, 'Assign', NULL, NULL, 90, 'Jun-2014', '2', NULL, NULL, NULL, NULL);
INSERT INTO mjobsheet (js_id, js_orgid, js_ctid, js_request_date, js_request_by, js_title, js_model, js_description, js_material_provided, js_color_1, js_color_2, js_color_3, js_color_4, js_color_5, js_angle_1, js_angle_2, js_angle_3, js_angle_4, js_angle_5, js_bleeding, js_bleeding_remark, js_distortion, js_distortion_value, js_diecut_ind, js_diecut_no, js_trapping_size, js_primcat, js_status, js_completiondate, js_assignto, js_carid, js_decision, js_width, js_height, js_requiretime, js_request_dateinmth, js_jobcolor, js_lpi, js_mcid, js_code, js_month_occur) VALUES (66, 9, 4, '2014-06-22 15:09:06.32+08', 'uat_cust1', NULL, NULL, 'test 2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, 8, 'NEW', NULL, 'artist2', 40, 'Assign', NULL, NULL, 200, 'Jun-2014', '3', NULL, NULL, NULL, NULL);
INSERT INTO mjobsheet (js_id, js_orgid, js_ctid, js_request_date, js_request_by, js_title, js_model, js_description, js_material_provided, js_color_1, js_color_2, js_color_3, js_color_4, js_color_5, js_angle_1, js_angle_2, js_angle_3, js_angle_4, js_angle_5, js_bleeding, js_bleeding_remark, js_distortion, js_distortion_value, js_diecut_ind, js_diecut_no, js_trapping_size, js_primcat, js_status, js_completiondate, js_assignto, js_carid, js_decision, js_width, js_height, js_requiretime, js_request_dateinmth, js_jobcolor, js_lpi, js_mcid, js_code, js_month_occur) VALUES (78, 1, 4, '2014-06-22 22:25:20.028+08', 'ysyow', NULL, NULL, 'sad', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 'NEW', NULL, NULL, 38, NULL, NULL, NULL, NULL, 'Jun-2014', '2', NULL, NULL, NULL, NULL);
INSERT INTO mjobsheet (js_id, js_orgid, js_ctid, js_request_date, js_request_by, js_title, js_model, js_description, js_material_provided, js_color_1, js_color_2, js_color_3, js_color_4, js_color_5, js_angle_1, js_angle_2, js_angle_3, js_angle_4, js_angle_5, js_bleeding, js_bleeding_remark, js_distortion, js_distortion_value, js_diecut_ind, js_diecut_no, js_trapping_size, js_primcat, js_status, js_completiondate, js_assignto, js_carid, js_decision, js_width, js_height, js_requiretime, js_request_dateinmth, js_jobcolor, js_lpi, js_mcid, js_code, js_month_occur) VALUES (79, 1, 4, '2014-06-22 22:26:19.002+08', 'ysyow', NULL, NULL, 'asddsa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 'NEW', NULL, NULL, 39, NULL, NULL, NULL, NULL, 'Jun-2014', '3', NULL, NULL, NULL, NULL);
INSERT INTO mjobsheet (js_id, js_orgid, js_ctid, js_request_date, js_request_by, js_title, js_model, js_description, js_material_provided, js_color_1, js_color_2, js_color_3, js_color_4, js_color_5, js_angle_1, js_angle_2, js_angle_3, js_angle_4, js_angle_5, js_bleeding, js_bleeding_remark, js_distortion, js_distortion_value, js_diecut_ind, js_diecut_no, js_trapping_size, js_primcat, js_status, js_completiondate, js_assignto, js_carid, js_decision, js_width, js_height, js_requiretime, js_request_dateinmth, js_jobcolor, js_lpi, js_mcid, js_code, js_month_occur) VALUES (80, 1, 2, '2014-06-22 22:27:13.903+08', 'ysyow', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, 6, 'NEW', NULL, NULL, 39, NULL, NULL, NULL, NULL, 'Jun-2014', '1', NULL, NULL, NULL, NULL);
INSERT INTO mjobsheet (js_id, js_orgid, js_ctid, js_request_date, js_request_by, js_title, js_model, js_description, js_material_provided, js_color_1, js_color_2, js_color_3, js_color_4, js_color_5, js_angle_1, js_angle_2, js_angle_3, js_angle_4, js_angle_5, js_bleeding, js_bleeding_remark, js_distortion, js_distortion_value, js_diecut_ind, js_diecut_no, js_trapping_size, js_primcat, js_status, js_completiondate, js_assignto, js_carid, js_decision, js_width, js_height, js_requiretime, js_request_dateinmth, js_jobcolor, js_lpi, js_mcid, js_code, js_month_occur) VALUES (81, 1, 3, '2014-06-22 22:29:53.155+08', 'ysyow', NULL, NULL, '12asd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 'NEW', NULL, NULL, 38, NULL, NULL, NULL, NULL, 'Jun-2014', '2', NULL, NULL, NULL, NULL);
INSERT INTO mjobsheet (js_id, js_orgid, js_ctid, js_request_date, js_request_by, js_title, js_model, js_description, js_material_provided, js_color_1, js_color_2, js_color_3, js_color_4, js_color_5, js_angle_1, js_angle_2, js_angle_3, js_angle_4, js_angle_5, js_bleeding, js_bleeding_remark, js_distortion, js_distortion_value, js_diecut_ind, js_diecut_no, js_trapping_size, js_primcat, js_status, js_completiondate, js_assignto, js_carid, js_decision, js_width, js_height, js_requiretime, js_request_dateinmth, js_jobcolor, js_lpi, js_mcid, js_code, js_month_occur) VALUES (82, 1, 3, '2014-06-22 22:34:15.393+08', 'ysyow', NULL, NULL, '123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 'NEW', NULL, 'artist2', 41, 'Assign', NULL, NULL, 160, 'Jun-2014', '2', NULL, NULL, NULL, NULL);
INSERT INTO mjobsheet (js_id, js_orgid, js_ctid, js_request_date, js_request_by, js_title, js_model, js_description, js_material_provided, js_color_1, js_color_2, js_color_3, js_color_4, js_color_5, js_angle_1, js_angle_2, js_angle_3, js_angle_4, js_angle_5, js_bleeding, js_bleeding_remark, js_distortion, js_distortion_value, js_diecut_ind, js_diecut_no, js_trapping_size, js_primcat, js_status, js_completiondate, js_assignto, js_carid, js_decision, js_width, js_height, js_requiretime, js_request_dateinmth, js_jobcolor, js_lpi, js_mcid, js_code, js_month_occur) VALUES (75, 12, 2, '2014-06-22 22:19:07.119+08', 'uat_customer3', NULL, NULL, 'Case 1 - eng', NULL, '12', '12', '12', '12', '12', '12', '12', '12', '12', '12', '0', '123', 'X', 12.0000, 'Y', NULL, 123.0000, 6, 'NEW', NULL, 'artist1', 38, 'Assign', NULL, NULL, 160, 'Jun-2014', '2', NULL, NULL, NULL, NULL);
INSERT INTO mjobsheet (js_id, js_orgid, js_ctid, js_request_date, js_request_by, js_title, js_model, js_description, js_material_provided, js_color_1, js_color_2, js_color_3, js_color_4, js_color_5, js_angle_1, js_angle_2, js_angle_3, js_angle_4, js_angle_5, js_bleeding, js_bleeding_remark, js_distortion, js_distortion_value, js_diecut_ind, js_diecut_no, js_trapping_size, js_primcat, js_status, js_completiondate, js_assignto, js_carid, js_decision, js_width, js_height, js_requiretime, js_request_dateinmth, js_jobcolor, js_lpi, js_mcid, js_code, js_month_occur) VALUES (67, 9, 4, '2014-06-22 15:09:52.378+08', 'uat_cust1', NULL, NULL, 'Test 3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'COMPLETED', NULL, 'artist2', 40, 'Accept', '200', '300', 30, 'Jun-2014', '2', NULL, NULL, NULL, NULL);
INSERT INTO mjobsheet (js_id, js_orgid, js_ctid, js_request_date, js_request_by, js_title, js_model, js_description, js_material_provided, js_color_1, js_color_2, js_color_3, js_color_4, js_color_5, js_angle_1, js_angle_2, js_angle_3, js_angle_4, js_angle_5, js_bleeding, js_bleeding_remark, js_distortion, js_distortion_value, js_diecut_ind, js_diecut_no, js_trapping_size, js_primcat, js_status, js_completiondate, js_assignto, js_carid, js_decision, js_width, js_height, js_requiretime, js_request_dateinmth, js_jobcolor, js_lpi, js_mcid, js_code, js_month_occur) VALUES (69, 9, 2, '2014-06-22 16:02:50.505+08', 'uat_customer1', NULL, NULL, 'job description - eng', NULL, '1', '1', '1', '1', '1', '2', '2', '2', '2', '2', '0', '123', 'X', 1.0000, 'Y', NULL, 123.0000, 6, 'NEW', NULL, NULL, 38, 'Revert', NULL, NULL, 190, 'Jun-2014', '2', NULL, NULL, NULL, NULL);
INSERT INTO mjobsheet (js_id, js_orgid, js_ctid, js_request_date, js_request_by, js_title, js_model, js_description, js_material_provided, js_color_1, js_color_2, js_color_3, js_color_4, js_color_5, js_angle_1, js_angle_2, js_angle_3, js_angle_4, js_angle_5, js_bleeding, js_bleeding_remark, js_distortion, js_distortion_value, js_diecut_ind, js_diecut_no, js_trapping_size, js_primcat, js_status, js_completiondate, js_assignto, js_carid, js_decision, js_width, js_height, js_requiretime, js_request_dateinmth, js_jobcolor, js_lpi, js_mcid, js_code, js_month_occur) VALUES (70, 9, 2, '2014-06-22 18:37:00.386+08', 'uat_customer1', NULL, NULL, 'UAT job by ENG -1 ', NULL, '132', '123', '13', '123', NULL, '13', '1', '1', '1', NULL, '3', '123', 'X', 1.0000, 'Y', NULL, 123.0000, 6, 'NEW', NULL, NULL, 38, 'Revert', NULL, NULL, 190, 'Jun-2014', '2', NULL, NULL, NULL, NULL);
INSERT INTO mjobsheet (js_id, js_orgid, js_ctid, js_request_date, js_request_by, js_title, js_model, js_description, js_material_provided, js_color_1, js_color_2, js_color_3, js_color_4, js_color_5, js_angle_1, js_angle_2, js_angle_3, js_angle_4, js_angle_5, js_bleeding, js_bleeding_remark, js_distortion, js_distortion_value, js_diecut_ind, js_diecut_no, js_trapping_size, js_primcat, js_status, js_completiondate, js_assignto, js_carid, js_decision, js_width, js_height, js_requiretime, js_request_dateinmth, js_jobcolor, js_lpi, js_mcid, js_code, js_month_occur) VALUES (71, 9, 2, '2014-06-22 19:08:37.392+08', 'uat_customer1', NULL, NULL, 'Test revert job', NULL, '123', '1123', '1321', '321', '123', '132', '1231', '312', '123', '1231', '0', '1231', NULL, NULL, 'N', NULL, 1231.0000, 6, 'NEW', NULL, NULL, 38, NULL, NULL, NULL, NULL, 'Jun-2014', '2', NULL, NULL, NULL, NULL);
INSERT INTO mjobsheet (js_id, js_orgid, js_ctid, js_request_date, js_request_by, js_title, js_model, js_description, js_material_provided, js_color_1, js_color_2, js_color_3, js_color_4, js_color_5, js_angle_1, js_angle_2, js_angle_3, js_angle_4, js_angle_5, js_bleeding, js_bleeding_remark, js_distortion, js_distortion_value, js_diecut_ind, js_diecut_no, js_trapping_size, js_primcat, js_status, js_completiondate, js_assignto, js_carid, js_decision, js_width, js_height, js_requiretime, js_request_dateinmth, js_jobcolor, js_lpi, js_mcid, js_code, js_month_occur) VALUES (76, 1, 4, '2014-06-22 22:22:00.011+08', 'ysyow', NULL, NULL, 'asd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 'NEW', NULL, 'uat_artist2', 38, 'Revert', '25', '25', 160, 'Jun-2014', '4', NULL, NULL, NULL, NULL);
INSERT INTO mjobsheet (js_id, js_orgid, js_ctid, js_request_date, js_request_by, js_title, js_model, js_description, js_material_provided, js_color_1, js_color_2, js_color_3, js_color_4, js_color_5, js_angle_1, js_angle_2, js_angle_3, js_angle_4, js_angle_5, js_bleeding, js_bleeding_remark, js_distortion, js_distortion_value, js_diecut_ind, js_diecut_no, js_trapping_size, js_primcat, js_status, js_completiondate, js_assignto, js_carid, js_decision, js_width, js_height, js_requiretime, js_request_dateinmth, js_jobcolor, js_lpi, js_mcid, js_code, js_month_occur) VALUES (83, 12, 2, '2014-06-22 22:42:05.965+08', 'uat_customer3', NULL, NULL, 'new job 3 by eng', NULL, '131', '313', '132', '132', '131231', '313', '132', '13', '1231', '123', '0', '123', 'X', 123.0000, 'Y', NULL, 11.0000, 6, 'NEW', NULL, 'uat_artist3', 38, 'Revert', '100', '200', 160, 'Jun-2014', '1', NULL, NULL, NULL, NULL);
INSERT INTO mjobsheet (js_id, js_orgid, js_ctid, js_request_date, js_request_by, js_title, js_model, js_description, js_material_provided, js_color_1, js_color_2, js_color_3, js_color_4, js_color_5, js_angle_1, js_angle_2, js_angle_3, js_angle_4, js_angle_5, js_bleeding, js_bleeding_remark, js_distortion, js_distortion_value, js_diecut_ind, js_diecut_no, js_trapping_size, js_primcat, js_status, js_completiondate, js_assignto, js_carid, js_decision, js_width, js_height, js_requiretime, js_request_dateinmth, js_jobcolor, js_lpi, js_mcid, js_code, js_month_occur) VALUES (84, 1, 3, '2014-06-24 17:17:18.438+08', 'ysyow', NULL, NULL, 'sasda', NULL, '23', '23', '22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'asdsda', NULL, NULL, NULL, NULL, NULL, 6, 'NEW', NULL, NULL, 41, NULL, NULL, NULL, NULL, 'Jun-2014', '3', NULL, NULL, NULL, NULL);
INSERT INTO mjobsheet (js_id, js_orgid, js_ctid, js_request_date, js_request_by, js_title, js_model, js_description, js_material_provided, js_color_1, js_color_2, js_color_3, js_color_4, js_color_5, js_angle_1, js_angle_2, js_angle_3, js_angle_4, js_angle_5, js_bleeding, js_bleeding_remark, js_distortion, js_distortion_value, js_diecut_ind, js_diecut_no, js_trapping_size, js_primcat, js_status, js_completiondate, js_assignto, js_carid, js_decision, js_width, js_height, js_requiretime, js_request_dateinmth, js_jobcolor, js_lpi, js_mcid, js_code, js_month_occur) VALUES (111, 1, NULL, '2014-06-24 18:38:42.963+08', 'ysyow', NULL, NULL, '123213', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'REQUIREMENT VERIFICATION', NULL, NULL, 41, NULL, NULL, NULL, NULL, 'Jun-2014', '2', NULL, NULL, NULL, NULL);
INSERT INTO mjobsheet (js_id, js_orgid, js_ctid, js_request_date, js_request_by, js_title, js_model, js_description, js_material_provided, js_color_1, js_color_2, js_color_3, js_color_4, js_color_5, js_angle_1, js_angle_2, js_angle_3, js_angle_4, js_angle_5, js_bleeding, js_bleeding_remark, js_distortion, js_distortion_value, js_diecut_ind, js_diecut_no, js_trapping_size, js_primcat, js_status, js_completiondate, js_assignto, js_carid, js_decision, js_width, js_height, js_requiretime, js_request_dateinmth, js_jobcolor, js_lpi, js_mcid, js_code, js_month_occur) VALUES (113, 9, NULL, '2014-06-24 18:47:11.461+08', 'uat_customer1', NULL, NULL, 'Test job by Eng', NULL, '1234', NULL, NULL, NULL, NULL, '123', '132', NULL, NULL, NULL, '0', '1234', NULL, NULL, NULL, NULL, NULL, 3, 'WORK IN PROGRESS', NULL, 'uat_artist1', 38, 'Assign', '10', '20', 120, 'Jun-2014', '1', 12, 3, NULL, NULL);
INSERT INTO mjobsheet (js_id, js_orgid, js_ctid, js_request_date, js_request_by, js_title, js_model, js_description, js_material_provided, js_color_1, js_color_2, js_color_3, js_color_4, js_color_5, js_angle_1, js_angle_2, js_angle_3, js_angle_4, js_angle_5, js_bleeding, js_bleeding_remark, js_distortion, js_distortion_value, js_diecut_ind, js_diecut_no, js_trapping_size, js_primcat, js_status, js_completiondate, js_assignto, js_carid, js_decision, js_width, js_height, js_requiretime, js_request_dateinmth, js_jobcolor, js_lpi, js_mcid, js_code, js_month_occur) VALUES (112, 1, NULL, '2014-06-24 18:41:09.137+08', 'ysyow', NULL, NULL, 'test yys', NULL, '12', '3', NULL, NULL, NULL, '1', '3', '4', '5', NULL, '7', '123132', NULL, NULL, NULL, NULL, NULL, 6, 'REQUIREMENT VERIFICATION', NULL, NULL, 41, NULL, NULL, NULL, NULL, 'Jun-2014', '2', 123, NULL, NULL, NULL);
INSERT INTO mjobsheet (js_id, js_orgid, js_ctid, js_request_date, js_request_by, js_title, js_model, js_description, js_material_provided, js_color_1, js_color_2, js_color_3, js_color_4, js_color_5, js_angle_1, js_angle_2, js_angle_3, js_angle_4, js_angle_5, js_bleeding, js_bleeding_remark, js_distortion, js_distortion_value, js_diecut_ind, js_diecut_no, js_trapping_size, js_primcat, js_status, js_completiondate, js_assignto, js_carid, js_decision, js_width, js_height, js_requiretime, js_request_dateinmth, js_jobcolor, js_lpi, js_mcid, js_code, js_month_occur) VALUES (114, 9, NULL, '2014-06-24 19:06:51.238+08', 'uat_customer1', NULL, NULL, 'problem in QC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'PENDING ACCEPTANCE', NULL, 'uat_artist1', 38, 'Forward to Customer', '1', '11', 123, 'Jun-2014', '2', NULL, 3, NULL, NULL);
INSERT INTO mjobsheet (js_id, js_orgid, js_ctid, js_request_date, js_request_by, js_title, js_model, js_description, js_material_provided, js_color_1, js_color_2, js_color_3, js_color_4, js_color_5, js_angle_1, js_angle_2, js_angle_3, js_angle_4, js_angle_5, js_bleeding, js_bleeding_remark, js_distortion, js_distortion_value, js_diecut_ind, js_diecut_no, js_trapping_size, js_primcat, js_status, js_completiondate, js_assignto, js_carid, js_decision, js_width, js_height, js_requiretime, js_request_dateinmth, js_jobcolor, js_lpi, js_mcid, js_code, js_month_occur) VALUES (117, 13, NULL, '2014-06-25 18:09:59.535+08', 'uat_customer4', NULL, NULL, 'required master card!!', NULL, '123', '123', '123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, 'H', 1.2300, 'N', NULL, 1.2100, 3, 'REQUIREMENT VERIFICATION', NULL, NULL, 38, NULL, NULL, NULL, NULL, 'Jun-2014', '3', 123, 4, '2014060002', 2);
INSERT INTO mjobsheet (js_id, js_orgid, js_ctid, js_request_date, js_request_by, js_title, js_model, js_description, js_material_provided, js_color_1, js_color_2, js_color_3, js_color_4, js_color_5, js_angle_1, js_angle_2, js_angle_3, js_angle_4, js_angle_5, js_bleeding, js_bleeding_remark, js_distortion, js_distortion_value, js_diecut_ind, js_diecut_no, js_trapping_size, js_primcat, js_status, js_completiondate, js_assignto, js_carid, js_decision, js_width, js_height, js_requiretime, js_request_dateinmth, js_jobcolor, js_lpi, js_mcid, js_code, js_month_occur) VALUES (118, 1, NULL, '2014-06-25 18:17:21.289+08', 'ysyow', NULL, NULL, 'Test yys', NULL, 'sd', 'asd', 'dsa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', 'adssda', NULL, NULL, 'Y', NULL, NULL, 2, 'REQUIREMENT VERIFICATION', NULL, NULL, NULL, NULL, NULL, NULL, 300, 'Jun-2014', '3', NULL, 1, '2014060003', 3);
INSERT INTO mjobsheet (js_id, js_orgid, js_ctid, js_request_date, js_request_by, js_title, js_model, js_description, js_material_provided, js_color_1, js_color_2, js_color_3, js_color_4, js_color_5, js_angle_1, js_angle_2, js_angle_3, js_angle_4, js_angle_5, js_bleeding, js_bleeding_remark, js_distortion, js_distortion_value, js_diecut_ind, js_diecut_no, js_trapping_size, js_primcat, js_status, js_completiondate, js_assignto, js_carid, js_decision, js_width, js_height, js_requiretime, js_request_dateinmth, js_jobcolor, js_lpi, js_mcid, js_code, js_month_occur) VALUES (115, 13, NULL, '2014-06-25 17:47:26.351+08', 'uat_customer4', NULL, NULL, 'No barcode, no master card, just drawing and typing-- 换了！！', NULL, 'color1', 'colo2', '1231', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'no bleeding', NULL, NULL, 'Y', NULL, NULL, 2, 'PENDING ARTIST ACKNOWLEDGE JOB', NULL, NULL, 38, 'Revert', NULL, NULL, 300, 'Jun-2014', '3', NULL, 4, NULL, NULL);
INSERT INTO mjobsheet (js_id, js_orgid, js_ctid, js_request_date, js_request_by, js_title, js_model, js_description, js_material_provided, js_color_1, js_color_2, js_color_3, js_color_4, js_color_5, js_angle_1, js_angle_2, js_angle_3, js_angle_4, js_angle_5, js_bleeding, js_bleeding_remark, js_distortion, js_distortion_value, js_diecut_ind, js_diecut_no, js_trapping_size, js_primcat, js_status, js_completiondate, js_assignto, js_carid, js_decision, js_width, js_height, js_requiretime, js_request_dateinmth, js_jobcolor, js_lpi, js_mcid, js_code, js_month_occur) VALUES (116, 13, NULL, '2014-06-25 18:03:36.778+08', 'uat_customer4', NULL, NULL, 'Job with barcode', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, 6, 'COMPLETED', NULL, 'uat_artist4', NULL, 'Accept', '10', '50', 120, 'Jun-2014', '1', NULL, 4, '2014060001', 1);


--
-- TOC entry 3064 (class 0 OID 0)
-- Dependencies: 250
-- Name: mjobsheet_js_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('mjobsheet_js_id_seq', 118, true);


--
-- TOC entry 2945 (class 0 OID 50457)
-- Dependencies: 251
-- Data for Name: mjscartonvalue; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (1, 12.0000, 'x.E', 6, 4);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (2, 2.0000, 'x.L1', 6, 4);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (3, 3.0000, 'x.W1', 6, 4);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (4, 1.0000, 'x.L2', 6, 4);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (5, 1.0000, 'x.W2', 6, 4);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (6, 1.0000, 'y.T', 6, 4);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (7, 1.0000, 'y.H', 6, 4);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (8, 1.0000, 'y.B', 6, 4);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (9, 1.0000, 'x.1', 5, 6);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (10, 1.0000, 'x.2', 5, 6);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (11, 1.0000, 'x.3', 5, 6);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (12, 1.0000, 'x.4', 5, 6);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (13, 1.0000, 'x.5', 5, 6);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (14, 11.0000, 'y.1', 5, 6);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (15, 1.0000, 'y.2', 5, 6);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (16, 1.0000, 'y.3', 5, 6);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (17, 1.0000, 'x.1', 38, 7);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (18, 2.0000, 'x.2', 38, 7);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (19, 33.0000, 'x.3', 38, 7);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (20, 4.0000, 'x.4', 38, 7);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (21, 5.0000, 'x.5', 38, 7);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (22, 6.0000, 'y.1', 38, 7);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (23, 77.0000, 'y.2', 38, 7);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (24, 8.0000, 'y.3', 38, 7);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (25, 12.0000, 'x.1', 38, 9);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (26, 2.0000, 'x.2', 38, 9);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (27, 3.0000, 'x.3', 38, 9);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (28, 44.0000, 'x.4', 38, 9);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (29, 5.0000, 'x.5', 38, 9);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (30, 6.0000, 'y.1', 38, 9);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (31, 77.0000, 'y.2', 38, 9);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (32, 8.0000, 'y.3', 38, 9);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (33, 1.0000, 'x.1', 38, 10);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (34, 1.0000, 'x.2', 38, 10);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (35, 1.0000, 'x.3', 38, 10);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (36, 1.0000, 'x.4', 38, 10);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (37, 1.0000, 'x.5', 38, 10);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (38, 1.0000, 'y.1', 38, 10);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (39, 1.0000, 'y.2', 38, 10);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (40, 1.0000, 'y.3', 38, 10);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (41, 1.0000, 'x.1', 38, 11);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (42, 2.0000, 'x.2', 38, 11);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (43, 3.0000, 'x.3', 38, 11);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (44, 4.0000, 'x.4', 38, 11);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (45, 5.0000, 'x.5', 38, 11);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (46, 66.0000, 'y.1', 38, 11);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (47, 7.0000, 'y.2', 38, 11);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (48, 8.0000, 'y.3', 38, 11);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (57, 22.0000, 'x.1', 38, 13);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (58, 2.0000, 'x.2', 38, 13);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (59, 3.0000, 'x.3', 38, 13);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (60, 4.0000, 'x.4', 38, 13);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (61, 5.0000, 'x.5', 38, 13);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (62, 6.0000, 'y.1', 38, 13);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (63, 7.0000, 'y.2', 38, 13);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (64, 8.0000, 'y.3', 38, 13);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (105, 2.0000, 'x.1', 38, 12);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (106, 1.0000, 'x.2', 38, 12);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (107, 21.0000, 'x.3', 38, 12);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (108, 1.0000, 'x.4', 38, 12);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (109, 2.0000, 'x.5', 38, 12);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (110, 1.0000, 'y.1', 38, 12);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (111, 12.0000, 'y.2', 38, 12);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (112, 1.0000, 'y.3', 38, 12);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (113, 12.0000, 'x.1', 38, 14);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (114, 123.0000, 'x.2', 38, 14);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (115, 31.0000, 'x.3', 38, 14);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (116, 12.0000, 'x.4', 38, 14);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (117, 12.0000, 'x.5', 38, 14);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (118, 1.0000, 'y.1', 38, 14);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (119, 1.0000, 'y.2', 38, 14);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (120, 1.0000, 'y.3', 38, 14);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (121, 1.0000, 'x.E', 39, 15);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (122, 1.0000, 'x.L1', 39, 15);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (123, 1.0000, 'x.W1', 39, 15);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (124, 11.0000, 'x.L2', 39, 15);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (125, 1.0000, 'x.W2', 39, 15);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (126, 1.0000, 'y.T', 39, 15);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (127, 1.0000, 'y.H', 39, 15);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (128, 1.0000, 'y.B', 39, 15);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (137, 1.0000, 'x.1', 38, 17);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (138, 2.0000, 'x.2', 38, 17);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (139, 3.0000, 'x.3', 38, 17);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (140, 4.0000, 'x.4', 38, 17);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (141, 5.0000, 'x.5', 38, 17);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (142, 6.0000, 'y.1', 38, 17);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (143, 7.0000, 'y.2', 38, 17);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (144, 8.0000, 'y.3', 38, 17);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (153, 3.3000, 'x.E', 39, 18);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (154, 4.4000, 'x.L1', 39, 18);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (155, 5.5000, 'x.W1', 39, 18);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (156, 6.6000, 'x.L2', 39, 18);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (157, 7.7000, 'x.W2', 39, 18);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (158, 8.8880, 'y.T', 39, 18);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (159, 9.9000, 'y.H', 39, 18);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (160, 10.1000, 'y.B', 39, 18);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (161, 1.0000, 'x.1', 38, 16);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (162, 2.0000, 'x.2', 38, 16);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (163, 3.0000, 'x.3', 38, 16);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (164, 4.0000, 'x.4', 38, 16);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (165, 5.0000, 'x.5', 38, 16);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (166, 6.0000, 'y.1', 38, 16);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (167, 7.0000, 'y.2', 38, 16);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (168, 8.0000, 'y.3', 38, 16);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (169, 1.0000, 'x.1', 38, 19);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (170, 1.0000, 'x.2', 38, 19);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (171, 21.0000, 'x.3', 38, 19);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (172, 312.0000, 'x.4', 38, 19);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (173, 1312.0000, 'x.5', 38, 19);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (174, 3123.0000, 'y.1', 38, 19);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (175, 123.0000, 'y.2', 38, 19);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (176, 2.0000, 'y.3', 38, 19);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (177, 1.0000, 'x.1', 38, 20);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (178, 2.0000, 'x.2', 38, 20);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (179, 3.0000, 'x.3', 38, 20);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (180, 4.0000, 'x.4', 38, 20);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (181, 5.0000, 'x.5', 38, 20);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (182, 6.0000, 'y.1', 38, 20);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (183, 7.0000, 'y.2', 38, 20);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (184, 8.0000, 'y.3', 38, 20);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (185, 2.0000, 'x.1', 38, 21);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (186, 1.0000, 'x.2', 38, 21);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (187, 31.0000, 'x.3', 38, 21);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (188, 1.0000, 'x.4', 38, 21);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (189, 5.0000, 'x.5', 38, 21);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (190, 6.0000, 'y.1', 38, 21);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (191, 1.0000, 'y.2', 38, 21);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (192, 2.0000, 'y.3', 38, 21);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (193, 1.0000, 'x.E', 39, 22);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (194, 2.0000, 'x.L1', 39, 22);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (195, 3.0000, 'x.W1', 39, 22);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (196, 4.0000, 'x.L2', 39, 22);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (197, 5.0000, 'x.W2', 39, 22);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (198, 6.0000, 'y.T', 39, 22);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (199, 7.0000, 'y.H', 39, 22);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (200, 8.0000, 'y.B', 39, 22);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (201, 1.0000, 'x.1', 38, 23);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (202, 22.0000, 'x.2', 38, 23);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (203, 3.0000, 'x.3', 38, 23);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (204, 4.0000, 'x.4', 38, 23);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (205, 5.0000, 'x.5', 38, 23);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (206, 6.0000, 'y.1', 38, 23);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (207, 7.0000, 'y.2', 38, 23);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (208, 88.0000, 'y.3', 38, 23);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (217, 1.0000, 'x.1', 38, 25);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (218, 2.0000, 'x.2', 38, 25);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (219, 3.0000, 'x.3', 38, 25);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (220, 4.0000, 'x.4', 38, 25);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (221, 5.0000, 'x.5', 38, 25);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (222, 6.0000, 'y.1', 38, 25);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (223, 7.0000, 'y.2', 38, 25);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (224, 8.0000, 'y.3', 38, 25);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (225, 1.0000, 'x.1', 38, 26);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (226, 2.0000, 'x.2', 38, 26);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (227, 3.0000, 'x.3', 38, 26);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (228, 4.0000, 'x.4', 38, 26);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (229, 5.0000, 'x.5', 38, 26);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (230, 6.0000, 'y.1', 38, 26);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (231, 7.0000, 'y.2', 38, 26);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (232, 8.0000, 'y.3', 38, 26);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (233, 1.0000, 'x.1', 38, 27);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (234, 2.0000, 'x.2', 38, 27);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (235, 3.0000, 'x.3', 38, 27);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (236, 4.0000, 'x.4', 38, 27);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (237, 5.0000, 'x.5', 38, 27);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (238, 6.0000, 'y.1', 38, 27);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (239, 7.0000, 'y.2', 38, 27);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (240, 8.0000, 'y.3', 38, 27);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (241, 1.0000, 'x.1', 38, 28);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (242, 2.0000, 'x.2', 38, 28);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (243, 3.0000, 'x.3', 38, 28);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (244, 4.0000, 'x.4', 38, 28);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (245, 5.0000, 'x.5', 38, 28);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (246, 6.0000, 'y.1', 38, 28);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (247, 7.0000, 'y.2', 38, 28);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (248, 8.0000, 'y.3', 38, 28);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (249, 1.0000, 'x.1', 38, 29);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (250, 2.0000, 'x.2', 38, 29);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (251, 3.0000, 'x.3', 38, 29);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (252, 4.0000, 'x.4', 38, 29);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (253, 5.0000, 'x.5', 38, 29);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (254, 6.0000, 'y.1', 38, 29);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (255, 7.0000, 'y.2', 38, 29);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (256, 8.0000, 'y.3', 38, 29);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (257, 1.0000, 'x.1', 38, 30);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (258, 2.0000, 'x.2', 38, 30);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (259, 3.0000, 'x.3', 38, 30);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (260, 4.0000, 'x.4', 38, 30);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (261, 5.0000, 'x.5', 38, 30);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (262, 6.0000, 'y.1', 38, 30);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (263, 7.0000, 'y.2', 38, 30);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (264, 8.0000, 'y.3', 38, 30);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (265, 1.0000, 'x.1', 38, 31);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (266, 2.0000, 'x.2', 38, 31);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (267, 3.0000, 'x.3', 38, 31);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (268, 4.0000, 'x.4', 38, 31);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (269, 5.0000, 'x.5', 38, 31);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (270, 6.0000, 'y.1', 38, 31);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (271, 7.0000, 'y.2', 38, 31);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (272, 8.0000, 'y.3', 38, 31);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (273, 1.0000, 'x.1', 38, 32);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (274, 2.0000, 'x.2', 38, 32);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (275, 3.0000, 'x.3', 38, 32);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (276, 4.0000, 'x.4', 38, 32);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (277, 5.0000, 'x.5', 38, 32);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (278, 6.0000, 'y.1', 38, 32);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (279, 7.0000, 'y.2', 38, 32);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (280, 8.0000, 'y.3', 38, 32);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (281, 1.0000, 'x.1', 38, 33);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (282, 2.0000, 'x.2', 38, 33);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (283, 3.0000, 'x.3', 38, 33);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (284, 4.0000, 'x.4', 38, 33);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (285, 5.0000, 'x.5', 38, 33);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (286, 5.0000, 'y.1', 38, 33);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (287, 6.0000, 'y.2', 38, 33);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (288, 7.0000, 'y.3', 38, 33);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (289, 12.0000, 'x.1', 38, 34);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (290, 3.0000, 'x.2', 38, 34);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (291, 4.0000, 'x.3', 38, 34);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (292, 12.0000, 'x.4', 38, 34);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (293, 12.0000, 'x.5', 38, 34);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (294, 1.0000, 'y.1', 38, 34);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (295, 12.0000, 'y.2', 38, 34);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (296, 21.0000, 'y.3', 38, 34);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (305, 1.0000, 'x.1', 38, 35);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (306, 2.0000, 'x.2', 38, 35);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (307, 3.0000, 'x.3', 38, 35);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (308, 4.0000, 'x.4', 38, 35);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (309, 5.0000, 'x.5', 38, 35);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (310, 66.0000, 'y.1', 38, 35);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (311, 77.0000, 'y.2', 38, 35);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (312, 8.0000, 'y.3', 38, 35);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (313, 1.0000, 'x.1', 38, 36);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (314, 2.0000, 'x.2', 38, 36);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (315, 3.0000, 'x.3', 38, 36);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (316, 4.0000, 'x.4', 38, 36);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (317, 5.0000, 'x.5', 38, 36);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (318, 6.0000, 'y.1', 38, 36);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (319, 7.0000, 'y.2', 38, 36);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (320, 8.0000, 'y.3', 38, 36);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (321, 12.0000, 'x.1', 38, 46);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (322, 2.0000, 'x.2', 38, 46);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (323, 3.3300, 'x.3', 38, 46);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (324, 2.0000, 'x.4', 38, 46);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (325, 1.0000, 'x.5', 38, 46);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (326, 2.0000, 'y.1', 38, 46);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (327, 2.0000, 'y.2', 38, 46);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (328, 3.0000, 'y.3', 38, 46);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (329, 123.0000, 'x.1', 38, 47);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (330, 41.0000, 'x.2', 38, 47);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (331, 123.0000, 'x.3', 38, 47);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (332, 132.0000, 'x.4', 38, 47);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (333, 123.0000, 'x.5', 38, 47);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (334, 132.0000, 'y.1', 38, 47);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (335, 123.0000, 'y.2', 38, 47);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (336, 13.0000, 'y.3', 38, 47);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (337, 3.0000, 'x.1', 38, 57);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (338, 2.0000, 'x.2', 38, 57);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (339, 4.0000, 'x.3', 38, 57);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (340, 5.0000, 'x.4', 38, 57);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (341, 2.0000, 'x.5', 38, 57);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (342, 4.0000, 'y.1', 38, 57);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (343, 2.0000, 'y.2', 38, 57);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (344, 3.0000, 'y.3', 38, 57);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (345, 3.0000, 'x.1', 38, 58);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (346, 4.0000, 'x.2', 38, 58);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (347, 5.0000, 'x.3', 38, 58);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (348, 6.0000, 'x.4', 38, 58);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (349, 7.0000, 'x.5', 38, 58);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (350, 8.0000, 'y.1', 38, 58);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (351, 9.0000, 'y.2', 38, 58);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (352, 10.0000, 'y.3', 38, 58);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (369, 3.0000, 'x.E', 39, 59);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (370, 3.0000, 'x.1', 40, 60);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (65, 2.0000, 'x.E', 39, 59);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (66, 2.0000, 'x.L1', 39, 59);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (67, 1.0000, 'x.W1', 39, 59);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (68, 1.0000, 'x.L2', 39, 59);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (69, 1.0000, 'x.W2', 39, 59);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (70, 22.0000, 'y.T', 39, 59);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (71, 2.0000, 'y.H', 39, 59);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (72, 2.0000, 'y.B', 39, 59);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (371, 3.0000, 'x.E', 39, 61);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (372, 4.0000, 'x.L1', 39, 61);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (373, 5.0000, 'x.W1', 39, 61);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (374, 6.0000, 'x.L2', 39, 61);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (375, 7.0000, 'x.W2', 39, 61);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (376, 8.0000, 'y.T', 39, 61);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (377, 9.0000, 'y.H', 39, 61);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (378, 10.0000, 'y.B', 39, 61);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (379, 12.0000, 'x1', 41, 62);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (380, 12.0000, 'x2', 41, 62);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (381, 1.0000, 'x3', 41, 62);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (382, 1.0000, 'y1', 41, 62);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (383, 33.0000, 'x.E', 39, 63);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (384, 44.0000, 'x.L1', 39, 63);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (385, 55.0000, 'x.W1', 39, 63);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (386, 66.0000, 'x.L2', 39, 63);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (387, 77.0000, 'x.W2', 39, 63);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (388, 88.0000, 'y.T', 39, 63);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (389, 99.0000, 'y.H', 39, 63);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (390, 0.0000, 'y.B', 39, 63);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (391, 0.0000, 'x.1', 38, 64);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (392, 11.0000, 'x.2', 38, 64);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (393, 22.0000, 'x.3', 38, 64);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (394, 33.0000, 'x.4', 38, 64);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (395, 44.0000, 'x.5', 38, 64);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (396, 55.0000, 'y.1', 38, 64);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (397, 66.0000, 'y.2', 38, 64);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (398, 77.0000, 'y.3', 38, 64);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (403, 33.0000, 'x.1', 40, 66);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (404, 3.0000, 'x.2', 40, 66);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (405, 2.0000, 'x.3', 40, 66);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (406, 4.0000, 'x.4', 40, 66);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (407, 5.0000, 'x.5', 40, 66);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (408, 6.0000, 'y.1', 40, 66);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (409, 3.0000, 'y.2', 40, 66);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (410, 2.0000, 'y.3', 40, 66);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (411, 2.0000, 'x.1', 40, 67);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (412, 3.0000, 'x.2', 40, 67);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (413, 4.0000, 'x.3', 40, 67);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (414, 3.0000, 'x.4', 40, 67);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (415, 5.0000, 'x.5', 40, 67);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (416, 2.0000, 'y.1', 40, 67);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (417, 5.0000, 'y.2', 40, 67);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (418, 2.0000, 'y.3', 40, 67);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (419, 1.0000, 'x.1', 38, 68);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (420, 22.0000, 'x.2', 38, 68);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (421, 34.0000, 'x.3', 38, 68);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (422, 5.0000, 'x.4', 38, 68);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (423, 3.0000, 'x.5', 38, 68);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (424, 4.0000, 'y.1', 38, 68);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (425, 2.0000, 'y.2', 38, 68);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (426, 5.0000, 'y.3', 38, 68);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (427, 3.0000, 'x1', 41, 65);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (428, 1.0000, 'x.1', 38, 69);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (429, 2.0000, 'x.2', 38, 69);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (430, 3.0000, 'x.3', 38, 69);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (431, 4.0000, 'x.4', 38, 69);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (432, 5.0000, 'x.5', 38, 69);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (433, 6.0000, 'y.1', 38, 69);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (434, 7.0000, 'y.2', 38, 69);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (435, 8.0000, 'y.3', 38, 69);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (444, 1.0000, 'x.1', 38, 70);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (445, 12.0000, 'x.1', 38, 71);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (446, 12.0000, 'x.2', 38, 71);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (447, 1.0000, 'x.3', 38, 71);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (448, 12.0000, 'x.4', 38, 71);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (449, 132.0000, 'x.5', 38, 71);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (450, 123.0000, 'y.1', 38, 71);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (451, 123.0000, 'y.2', 38, 71);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (452, 13.0000, 'y.3', 38, 71);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (461, 123.0000, 'x.1', 38, 72);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (463, 5.0000, 'x1', 41, 74);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (464, 5.0000, 'x2', 41, 74);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (465, 23.0000, 'x3', 41, 74);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (466, 14.0000, 'y1', 41, 74);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (467, 2.0000, 'x.1', 38, 75);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (468, 1.0000, 'x.2', 38, 75);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (469, 3.0000, 'x.3', 38, 75);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (470, 5.0000, 'x.4', 38, 75);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (471, 4.0000, 'x.5', 38, 75);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (472, 12.0000, 'y.1', 38, 75);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (473, 12.0000, 'y.2', 38, 75);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (474, 12.0000, 'y.3', 38, 75);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (475, 1.0000, 'x.1', 38, 76);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (476, 1.0000, 'x.2', 38, 76);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (477, 1.0000, 'x.3', 38, 76);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (478, 1.0000, 'x.4', 38, 76);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (479, 1.0000, 'x.5', 38, 76);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (480, 1.0000, 'y.1', 38, 76);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (481, 1.0000, 'y.2', 38, 76);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (482, 1.0000, 'y.3', 38, 76);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (483, 122.0000, 'x.1', 38, 77);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (484, 3.0000, 'x.2', 38, 77);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (485, 4.0000, 'x.3', 38, 77);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (486, 12.0000, 'x.4', 38, 77);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (487, 12.0000, 'x.5', 38, 77);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (488, 123.0000, 'y.1', 38, 77);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (489, 123.0000, 'y.2', 38, 77);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (490, 123.0000, 'y.3', 38, 77);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (491, 1.0000, 'x.1', 38, 78);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (492, 1.0000, 'x.2', 38, 78);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (493, 1.0000, 'x.3', 38, 78);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (494, 1.0000, 'x.4', 38, 78);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (495, 1.0000, 'x.5', 38, 78);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (496, 1.0000, 'y.1', 38, 78);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (497, 1.0000, 'y.2', 38, 78);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (498, 1.0000, 'y.3', 38, 78);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (499, 1.0000, 'x.E', 39, 79);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (500, 1.0000, 'x.L1', 39, 79);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (501, 1.0000, 'x.W1', 39, 79);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (502, 1.0000, 'x.L2', 39, 79);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (503, 1.0000, 'x.W2', 39, 79);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (504, 1.0000, 'y.T', 39, 79);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (505, 1.0000, 'y.H', 39, 79);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (506, 1.0000, 'y.B', 39, 79);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (507, 1.0000, 'x.E', 39, 80);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (508, 1.0000, 'x.L1', 39, 80);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (509, 1.0000, 'x.W1', 39, 80);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (510, 11.0000, 'x.L2', 39, 80);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (511, 1.0000, 'x.W2', 39, 80);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (512, 1.0000, 'y.T', 39, 80);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (513, 11.0000, 'y.H', 39, 80);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (514, 1.0000, 'y.B', 39, 80);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (515, 1.0000, 'x.1', 38, 81);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (516, 1.0000, 'x.2', 38, 81);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (517, 1.0000, 'x.3', 38, 81);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (518, 1.0000, 'x.4', 38, 81);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (519, 1.0000, 'x.5', 38, 81);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (520, 1.0000, 'y.1', 38, 81);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (521, 1.0000, 'y.2', 38, 81);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (522, 1.0000, 'y.3', 38, 81);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (523, 1.0000, 'x1', 41, 82);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (524, 1.0000, 'x2', 41, 82);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (525, 1.0000, 'x3', 41, 82);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (526, 1.0000, 'y1', 41, 82);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (527, 123.0000, 'x.1', 38, 83);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (528, 1.0000, 'x.2', 38, 83);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (529, 2.0000, 'x.3', 38, 83);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (530, 3.0000, 'x.4', 38, 83);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (531, 4.0000, 'x.5', 38, 83);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (532, 1.0000, 'y.1', 38, 83);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (533, 1.0000, 'y.2', 38, 83);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (534, 12.0000, 'y.3', 38, 83);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (535, 1.0000, 'x1', 41, 84);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (536, 2.0000, 'x2', 41, 84);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (537, 3.0000, 'x3', 41, 84);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (538, 4.0000, 'y1', 41, 84);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (559, 1.0000, 'x1', 41, 111);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (560, 2.0000, 'x2', 41, 111);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (561, 3.0000, 'x3', 41, 111);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (562, 4.0000, 'y1', 41, 111);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (567, 12.0000, 'x.1', 38, 113);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (568, 12.0000, 'x.2', 38, 113);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (569, 12.0000, 'x.3', 38, 113);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (570, 12.0000, 'x.4', 38, 113);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (571, 12.0000, 'x.5', 38, 113);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (572, 12.0000, 'y.1', 38, 113);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (573, 12.0000, 'y.2', 38, 113);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (574, 12.0000, 'y.3', 38, 113);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (579, 12.0000, 'x1', 41, 112);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (580, 3.0000, 'x2', 41, 112);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (581, 123.0000, 'x3', 41, 112);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (582, 23.0000, 'y1', 41, 112);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (583, 1.0000, 'x.1', 38, 114);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (584, 2.0000, 'x.2', 38, 114);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (585, 3.0000, 'x.3', 38, 114);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (586, 4.0000, 'x.4', 38, 114);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (587, 5.0000, 'x.5', 38, 114);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (588, 6.0000, 'y.1', 38, 114);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (589, 7.0000, 'y.2', 38, 114);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (590, 8.0000, 'y.3', 38, 114);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (591, 1.2100, 'x.1', 38, 117);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (592, 12.0000, 'x.2', 38, 117);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (593, 12.1200, 'x.3', 38, 117);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (594, 12.0000, 'x.4', 38, 117);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (595, 1.0000, 'x.5', 38, 117);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (596, 2.0000, 'y.1', 38, 117);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (597, 2.0000, 'y.2', 38, 117);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (598, 3.0000, 'y.3', 38, 117);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (599, 1.0000, 'x.1', 38, 115);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (600, 2.0000, 'x.2', 38, 115);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (601, 3.0000, 'x.3', 38, 115);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (602, 4.0000, 'x.4', 38, 115);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (603, 5.0000, 'x.5', 38, 115);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (604, 6.0000, 'y.1', 38, 115);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (605, 7.0000, 'y.2', 38, 115);
INSERT INTO mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) VALUES (606, 8.0000, 'y.3', 38, 115);


--
-- TOC entry 3065 (class 0 OID 0)
-- Dependencies: 252
-- Name: mjscartonvalue_caval_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('mjscartonvalue_caval_id_seq', 606, true);


--
-- TOC entry 2947 (class 0 OID 50462)
-- Dependencies: 253
-- Data for Name: mmailtemplate; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO mmailtemplate (mt_code, mt_desc, mt_recipient_to, mt_recipient_cc, mt_subject, mt_content, mt_status, mt_internal_userid) VALUES ('NOTIFY_LATE_REQ_VER', 'Late Requirement Verification Notification Email', 'supervisor@gmail.com', 'supervisor@gmail.com', '[MOIRE] Late Requirement Verification Notification', '<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "[[JS_JOB_DESCRIPTION]]" job is still pending since [[REQ_VER_ACTIVITY_START]].</p><p><br></p>', 'ACTIVE', 'uat_supervisor1');
INSERT INTO mmailtemplate (mt_code, mt_desc, mt_recipient_to, mt_recipient_cc, mt_subject, mt_content, mt_status, mt_internal_userid) VALUES ('NOTIFY_LATE_ACKNOWLEDGE', 'Late Job Acknowledgement Notification Email', NULL, '[[JS_ASSIGNED_ARTIST_EMAIL]]', '[MOIRE] Late Job Acknowledgement Notification', '<p>Dear Supervisor,</p><p>This email is to notify that the "[[JS_JOB_DESCRIPTION]]" job is still pending acknowledgement from [[JS_ASSIGN_ARTIST_NAME]] since [[ACKNOWLEDGE_ACTIVITY_START]].</p><div><br></div>', 'ACTIVE', 'supervisor');
INSERT INTO mmailtemplate (mt_code, mt_desc, mt_recipient_to, mt_recipient_cc, mt_subject, mt_content, mt_status, mt_internal_userid) VALUES ('NOTIFY_LATE_WIP', 'Late Job WIP Notification Email', NULL, '[[JS_ASSIGNED_ARTIST_EMAIL]]', '[MOIRE] Late Job WIP Notification', '<p>Dear Manager and Supervisor,</p><p>This email is to notify that the "[[JS_JOB_DESCRIPTION]]" job is still WIP from [[JS_ASSIGN_ARTIST_NAME]] since [[WIP_ACTIVITY_START]].</p><div><br></div>', 'ACTIVE', 'supervisor');
INSERT INTO mmailtemplate (mt_code, mt_desc, mt_recipient_to, mt_recipient_cc, mt_subject, mt_content, mt_status, mt_internal_userid) VALUES ('NOTIFY_LATE_QC', 'Late QC Notification Email', NULL, NULL, '[MOIRE] Late Job QC Notification', '<p>Dear Manager and Supervisor,</p><p>This email is to notify that the "[[JS_JOB_DESCRIPTION]]" job is still pending QC since [[QC_ACTIVITY_START]].</p><div><br></div>', 'ACTIVE', 'supervisor');


--
-- TOC entry 2957 (class 0 OID 51423)
-- Dependencies: 398
-- Data for Name: mtnc; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO mtnc (tc_id, tc_text) VALUES (1, '<div><h5 style="line-height: 20px; margin-left: 10px;"><span style="font-family: Arial;">SAMPLE ANSWERS LTD (INCORPORATING PRIME PROSPECTS) – END USER LICENCE TERMS<br></span><strong style="color: rgb(10, 80, 161); font-family: Arial;">1) DEFINITIONS<br></strong><span style="font-family: Arial;">“Goods” means any goods and/or services provided by the Company as ordered by the Client<br></span><span style="font-family: Arial;">“ Company” means Sample Answers Ltd. incorporating Prime Prospects.<br></span><span style="font-family: Arial;">“ Client” means the person, firm or company placing an order with the Company.<br></span><strong style="color: rgb(10, 80, 161); font-family: Arial;">2) APPLICATION<br></strong><span style="font-family: Arial;">These terms and conditions apply to any provision of services or materials by the Company to the Client.<br></span><strong style="color: rgb(10, 80, 161); font-family: Arial;">3) FORMATION OF CONTRACT<br></strong><span style="font-family: Arial;">All Goods sold by the Company are sold subject to the Company’s standard terms and conditions (as detailed below) which form part of the Client’s contract with the Company. Terms and conditions on the Client’s order form or other similar document shall not be binding on the Company.<br></span><strong style="color: rgb(10, 80, 161); font-family: Arial;">4) QUOTATIONS<br></strong><span style="font-family: Arial;">The prices, quantities and delivery time stated in any quotation are not binding on the Company. They are commercial estimates only which the Company will make reasonable efforts to achieve.<br></span><strong style="color: rgb(10, 80, 161); font-family: Arial;">5) ORDERS<br></strong><span style="font-family: Arial;">5.1 Orders will be deemed to have been placed when an email confirmation has been received from a responsible executive of the client company.<br></span><span style="font-family: Arial;">5.2 For email invitations, online fulfilment projects and direct marketing files (as provided by Prime Prospects) it is a requirement of the Company, that the email piece, online form or mail piece shall be approved by the company before an order can be confirmed and any data despatched.<br></span><strong style="color: rgb(10, 80, 161); font-family: Arial;">6) RIGHT TO SUB CONTRACT<br></strong><span style="font-family: Arial;">Unless otherwise agreed the Company shall be entitled to sub-contract all or any part of the work.<br></span><strong style="color: rgb(10, 80, 161); font-family: Arial;">7) TIMETABLE<br></strong><span style="font-family: Arial;">The Company will use its best endeavours to supply the services or materials within the quoted time (normally within a maximum of seven days from order or otherwise as agreed) but time will not be of the essence within the contract.<br></span><strong style="color: rgb(10, 80, 161); font-family: Arial;">8 ) COPYRIGHT<br></strong><span style="font-family: Arial;">The Client acknowledges that the rights to the Goods are owned by the Company and that the Goods are protected by United Kingdom copyright laws, international treaty provisions and all other applicable national laws.<br></span><strong style="color: rgb(10, 80, 161); font-family: Arial;">9) RISK OF LOSS<br></strong><span style="font-family: Arial;">The risk of loss or damage to the Goods shall pass to the Client upon delivery of the Goods.<br></span><strong style="color: rgb(10, 80, 161); font-family: Arial;">10) PAYMENTS<br></strong><span style="font-family: Arial;">10.1 New clients or other clients out of terms may be expected to pay in advance for their services.<br></span><span style="font-family: Arial;">10.2 All other invoices issued by the Company shall be paid by the Client within thirty (30) days of the date of invoice unless otherwise agreed in writing by the Company. In the event of late payment, the Company may charge interest on the amount outstanding before and after judgement at the rate of five (5) percent above the Base Rate of Barclays Bank plc in force from the due date until the date of payment. In addition, invoices unpaid for more than 60 days after the invoice date will incur a surcharge of either £30 or 5% of the outstanding amount, whichever sum is greater.<br></span><span style="font-family: Arial;">10.3 If any amount of an invoice is disputed then the Client shall inform the Company of the grounds for such dispute within seven days of delivery of the goods and shall pay to the Company the value of the invoice less the disputed amount in accordance with these payment terms. Once settlement of the dispute has been agreed, any sum then outstanding shall also be payable in accordance with these payment terms.<br></span><span style="font-family: Arial;">10.4 The Company reserves the right to increase a quoted fee in the event that the client requests a variation to the work agreed.<br></span><strong style="color: rgb(10, 80, 161); font-family: Arial;">11) CANCELLATION<br></strong><span style="font-family: Arial;">In view of the nature of the service, any order – once confirmed by the Company – is not cancellable. Cancellation of the Order by the Client will only be accepted on condition that any costs, charges and expenses already incurred, including any charges that will be levied by a sub-contractor on account of their expenses, work or cancellation conditions will be reimbursed to the Company forthwith.<br></span><strong style="color: rgb(10, 80, 161); font-family: Arial;">12) DELIVERY<br></strong><span style="font-family: Arial;">12.1 The majority of services as supplied by the company are despatched electronically by email and shall be deemed as having been delivered when the email has been opened by the client.<br></span><span style="font-family: Arial;">12.2 The Company reserves the right to substitute conventional delivery methods without notice or penalty should electronic despatch prove inconvenient; in which case delivery by the Company will be deemed to have taken place when the materials are handed to the custody of the Client at his premises or to a deputed messenger or courier when posted. The Company will be entitled to charge the Client for any expenses of delivery other than normal postage charges.<br></span><strong style="color: rgb(10, 80, 161); font-family: Arial;">13) NOTICE<br></strong><span style="font-family: Arial;">All written notices to be served on or given to the client shall be sent or delivered to the client’s principle place of business and shall be treated as having been given upon receipt.<br></span><strong style="color: rgb(10, 80, 161); font-family: Arial;">14) LOSS OR DAMAGE TO SUPPLIES<br></strong><span style="font-family: Arial;">The Company will take all reasonable steps to ensure the protection from loss, damage or destruction of the services or materials it supplies to the Client (or which may be received from the Client).<br></span><strong style="color: rgb(10, 80, 161); font-family: Arial;">15) USAGE OF THE SERVICES OR MATERIALS<br></strong><span style="font-family: Arial;">Unless otherwise agreed in writing by the Company, the Client (and their clients) shall be entitled to use the services and materials provided as follows: .<br></span><span style="font-family: Arial;">15.1 All files of Consumer and Business data records are for single use and for use within a period of not more than 6 months from date of delivery.<br></span><span style="font-family: Arial;">15.2 Files of Samples of Consumer or Businesses data records are provided solely for the purpose of conducting market research to be carried out in conformity with the recognised ESOMAR/MRS Code of Conduct of the market research industry. The Client shall not otherwise be entitled to store, or to pass on (whether to his/her client or other person) or make any other use of these services and materials.<br></span><span style="font-family: Arial;">15.3 The Client shall bear responsibility for ensuring that all usage of information contained within any service as provided by Sample Answers and Prime Prospects is in accordance with, and does not contravene, any Data Protection or other laws, regulations or other trade customs and practices. The Company bears no liability for any omissions or faults in these respects.<br></span><strong style="color: rgb(10, 80, 161); font-family: Arial;">16) CONFIDENTIALITY<br></strong><span style="font-family: Arial;">Both parties shall maintain strict confidence and shall not disclose to any third party any information or material relating to the other or the other’s business which comes into that party’s possession and shall not use such information and material without written permission by the other party. This provision shall not, however, apply to information or material which is, or becomes, public knowledge by means other than by breach by a party to this clause.<br></span><strong style="color: rgb(10, 80, 161); font-family: Arial;">17) EMPLOYMENT OF PERSONNEL<br></strong><span style="font-family: Arial;">Subject to the prior written consent of the Company the Client shall not induce to employ, whether as an employee, agent, partner or consultant, any employee of the Company directly associated with delivery of the Goods.<br></span><strong style="color: rgb(10, 80, 161); font-family: Arial;">18) WARRANTY<br></strong><span style="font-family: Arial;">18.1 The Company warrants that it has the right to provide the Goods but otherwise the Goods are provided on an “as-is” basis without warranty of any kind, express or implied, oral or written including, without limitation, the implied conditions of merchantable quality, fitness for purpose and description, all of which are specifically and unreservedly excluded. In particular, but without limitation, no warranty is given that the Goods are suitable for the purposes intended by the Client.<br></span><span style="font-family: Arial;">18.2 The Company warrants that the Goods will be supplied using reasonable care and skill. The Company does not warrant that the Goods supplied are error-free, accurate or complete.<br></span><span style="font-family: Arial;">18.3 Both parties warrant that they are registered under the Data Protection Act in respect of the collection, processing and use of the Goods. Each party will comply with the Act including but not limited to its obligations in respect of any personal data which it may supply to or receive from the other party.<br></span><span style="font-family: Arial;">18.4 The Client acknowledges that the Company is required to uphold at all times, in letter and in spirit, the British Codes of Advertising and Sales Promotion.<br></span><strong style="color: rgb(10, 80, 161); font-family: Arial;">19) LIMITATION OF LIABILITY<br></strong><span style="font-family: Arial;">19.1 The Company shall not be liable for any claim arising out of the performance, non-performance, delay in delivery of or defect in the Goods nor for any special, indirect, economic or consequential loss or damage howsoever arising or howsoever caused (including loss of profit or loss of revenue) whether from negligence or otherwise in connection with the supply, functioning or use of the Goods. Any liability of the Company shall in any event be limited to the licence fees paid by the Client in the year in which the event of default arises.<br></span><span style="font-family: Arial;">19.2 Nothing herein shall limit either party’s liability for death or personal injury arising from the proven negligence by itself or its employees or agents.<br></span><span style="font-family: Arial;">19.3 The Client shall fully indemnify the Company against any liability to third parties arising out of the Client’s use of the Goods.<br></span><strong style="color: rgb(10, 80, 161); font-family: Arial;">20) FORCE MAJEURE<br></strong><span style="font-family: Arial;">The Company will not be liable to the Client for any loss or damage suffered by the Client as a direct result of the Company, its sub-contractors or the list-owner from whom the sample or other service or material is derived being unable to perform the Contract in the way agreed by reason of cause beyond its control including Act of God, accident, war, riot, lockout, strike, flood, fire, power failure, breakdown of plant or machinery, delay in transit, postal delay, or any other unexpected or exceptional cause or circumstance.<br></span><strong style="color: rgb(10, 80, 161); font-family: Arial;">21) GOVERNING LAW<br></strong><span style="font-family: Arial;">These Terms of Trading shall be subject to and construed in accordance with the laws of England and the parties hereby submit to the exclusive jurisdiction of the English courts.</span></h5></div> ');


--
-- TOC entry 3066 (class 0 OID 0)
-- Dependencies: 397
-- Name: mtnc_tc_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('mtnc_tc_id_seq', 1, true);


--
-- TOC entry 2958 (class 0 OID 51432)
-- Dependencies: 399
-- Data for Name: mtncacceptance; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO mtncacceptance (tca_tcid, tca_userid, tca_date, tca_result) VALUES (1, 'uat_cust1', '2014-06-22 14:24:17.374+08', 'AGREE');
INSERT INTO mtncacceptance (tca_tcid, tca_userid, tca_date, tca_result) VALUES (1, 'uat_customer1', '2014-06-22 15:53:56.197+08', 'AGREE');
INSERT INTO mtncacceptance (tca_tcid, tca_userid, tca_date, tca_result) VALUES (1, 'uat_customer2', '2014-06-22 17:55:22.83+08', 'AGREE');
INSERT INTO mtncacceptance (tca_tcid, tca_userid, tca_date, tca_result) VALUES (1, 'uat_customer3', '2014-06-22 22:00:39.388+08', 'AGREE');
INSERT INTO mtncacceptance (tca_tcid, tca_userid, tca_date, tca_result) VALUES (1, 'uat_customer4', '2014-06-25 17:43:32.425+08', 'AGREE');


--
-- TOC entry 2948 (class 0 OID 50469)
-- Dependencies: 254
-- Data for Name: pndaddress; Type: TABLE DATA; Schema: pnd; Owner: pnd
--



--
-- TOC entry 3067 (class 0 OID 0)
-- Dependencies: 255
-- Name: pndaddress_ad_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('pndaddress_ad_id_seq', 1, false);


--
-- TOC entry 2950 (class 0 OID 50479)
-- Dependencies: 256
-- Data for Name: pndartistskill; Type: TABLE DATA; Schema: pnd; Owner: pnd
--



--
-- TOC entry 2951 (class 0 OID 50482)
-- Dependencies: 257
-- Data for Name: pndcontact; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

INSERT INTO pndcontact (ct_id, ct_refid, ct_reftype, ct_name, ct_email, ct_concode) VALUES (2, 3, 'ORG_ID', 'Jeremy', 'dannyfoo@phiorion.com', NULL);
INSERT INTO pndcontact (ct_id, ct_refid, ct_reftype, ct_name, ct_email, ct_concode) VALUES (3, 4, 'ORG_ID', 'Mohamad', 'dannyfoo@phiorion.com', NULL);
INSERT INTO pndcontact (ct_id, ct_refid, ct_reftype, ct_name, ct_email, ct_concode) VALUES (4, 5, 'ORG_ID', 'Justin', 'dannyfoo@phiorion.com', NULL);
INSERT INTO pndcontact (ct_id, ct_refid, ct_reftype, ct_name, ct_email, ct_concode) VALUES (5, 6, 'ORG_ID', 'Alvin', 'dannyfoo@phiorion.com', NULL);
INSERT INTO pndcontact (ct_id, ct_refid, ct_reftype, ct_name, ct_email, ct_concode) VALUES (6, 7, 'ORG_ID', 'Tracy', 'dannyfoo@phiorion.com', NULL);
INSERT INTO pndcontact (ct_id, ct_refid, ct_reftype, ct_name, ct_email, ct_concode) VALUES (1, 10, 'ORG_ID', 'Fong Contact', 'dannyfoo@phiorion.com', 'MY');


--
-- TOC entry 3068 (class 0 OID 0)
-- Dependencies: 258
-- Name: pndcontact_ct_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('pndcontact_ct_id_seq', 6, true);


--
-- TOC entry 3069 (class 0 OID 0)
-- Dependencies: 259
-- Name: pndjoboutput_jo_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('pndjoboutput_jo_id_seq', 91, true);


--
-- TOC entry 2954 (class 0 OID 50489)
-- Dependencies: 260
-- Data for Name: pndphone; Type: TABLE DATA; Schema: pnd; Owner: pnd
--



--
-- TOC entry 3070 (class 0 OID 0)
-- Dependencies: 261
-- Name: pndphone_ph_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('pndphone_ph_id_seq', 1, false);


--
-- TOC entry 2637 (class 2606 OID 51125)
-- Name: const_fcdoc_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcdoc
    ADD CONSTRAINT const_fcdoc_prikey PRIMARY KEY (fd_id);


--
-- TOC entry 2753 (class 2606 OID 51494)
-- Name: const_fcemailsetting_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcemailsetting
    ADD CONSTRAINT const_fcemailsetting_prikey PRIMARY KEY (ms_id);


--
-- TOC entry 2639 (class 2606 OID 51127)
-- Name: const_fclang_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fclang
    ADD CONSTRAINT const_fclang_prikey PRIMARY KEY (lang_code);


--
-- TOC entry 2641 (class 2606 OID 51129)
-- Name: const_fclocale_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fclocale
    ADD CONSTRAINT const_fclocale_prikey PRIMARY KEY (lc_code);


--
-- TOC entry 2643 (class 2606 OID 51131)
-- Name: const_fclocaleholiday_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fclocaleholiday
    ADD CONSTRAINT const_fclocaleholiday_prikey PRIMARY KEY (lch_id);


--
-- TOC entry 2645 (class 2606 OID 51133)
-- Name: const_fclocaleworkinghour_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fclocaleworkinghour
    ADD CONSTRAINT const_fclocaleworkinghour_prikey PRIMARY KEY (lcw_id);


--
-- TOC entry 2647 (class 2606 OID 51135)
-- Name: const_fclocaleworkinghour_unikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fclocaleworkinghour
    ADD CONSTRAINT const_fclocaleworkinghour_unikey UNIQUE (lcw_lccode, lcw_day);


--
-- TOC entry 2649 (class 2606 OID 51137)
-- Name: const_fclog_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fclog
    ADD CONSTRAINT const_fclog_prikey PRIMARY KEY (log_id);


--
-- TOC entry 2661 (class 2606 OID 51139)
-- Name: const_fcpermission_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpermission
    ADD CONSTRAINT const_fcpermission_prikey PRIMARY KEY (pms_code);


--
-- TOC entry 2663 (class 2606 OID 51141)
-- Name: const_fcpmactivity_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpmactivity
    ADD CONSTRAINT const_fcpmactivity_prikey PRIMARY KEY (pmat_id);


--
-- TOC entry 2665 (class 2606 OID 51143)
-- Name: const_fcpmcase_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpmcase
    ADD CONSTRAINT const_fcpmcase_prikey PRIMARY KEY (pmc_id);


--
-- TOC entry 2667 (class 2606 OID 51145)
-- Name: const_fcpmcasecomment_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpmcasecomment
    ADD CONSTRAINT const_fcpmcasecomment_prikey PRIMARY KEY (pmcc_id);


--
-- TOC entry 2669 (class 2606 OID 51147)
-- Name: const_fcpmcasecommentread_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpmcasecommentread
    ADD CONSTRAINT const_fcpmcasecommentread_prikey PRIMARY KEY (pmcr_id);


--
-- TOC entry 2671 (class 2606 OID 51149)
-- Name: const_fcpmcasecommentread_unikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpmcasecommentread
    ADD CONSTRAINT const_fcpmcasecommentread_unikey UNIQUE (pmcr_pmccid, pmcr_read_by);


--
-- TOC entry 2673 (class 2606 OID 51151)
-- Name: const_fcpmcaseflag_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpmcaseflag
    ADD CONSTRAINT const_fcpmcaseflag_prikey PRIMARY KEY (pmcf_id);


--
-- TOC entry 2675 (class 2606 OID 51153)
-- Name: const_fcpmcaseflag_unikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpmcaseflag
    ADD CONSTRAINT const_fcpmcaseflag_unikey UNIQUE (pmcf_pmcid, pmcf_flag_by);


--
-- TOC entry 2677 (class 2606 OID 51155)
-- Name: const_fcpmcaseflow_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpmcaseflow
    ADD CONSTRAINT const_fcpmcaseflow_prikey PRIMARY KEY (pmf_id);


--
-- TOC entry 2679 (class 2606 OID 51157)
-- Name: const_fcpmcaseflowassign_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpmcaseflowassign
    ADD CONSTRAINT const_fcpmcaseflowassign_prikey PRIMARY KEY (pmfa_id);


--
-- TOC entry 2681 (class 2606 OID 51159)
-- Name: const_fcpmcasetype_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpmcasetype
    ADD CONSTRAINT const_fcpmcasetype_prikey PRIMARY KEY (pmct_code);


--
-- TOC entry 2683 (class 2606 OID 51161)
-- Name: const_fcpmconnector_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpmconnector
    ADD CONSTRAINT const_fcpmconnector_prikey PRIMARY KEY (pmcn_id);


--
-- TOC entry 2685 (class 2606 OID 51163)
-- Name: const_fcpmconnector_unikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpmconnector
    ADD CONSTRAINT const_fcpmconnector_unikey UNIQUE (pmcn_from_type, pmcn_from_id, pmcn_to_type, pmcn_to_id);


--
-- TOC entry 2687 (class 2606 OID 51165)
-- Name: const_fcpmevent_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpmevent
    ADD CONSTRAINT const_fcpmevent_prikey PRIMARY KEY (pmev_id);


--
-- TOC entry 2689 (class 2606 OID 51167)
-- Name: const_fcpmgateway_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpmgateway
    ADD CONSTRAINT const_fcpmgateway_prikey PRIMARY KEY (pmgw_id);


--
-- TOC entry 2691 (class 2606 OID 51169)
-- Name: const_fcpmswimlane_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpmswimlane
    ADD CONSTRAINT const_fcpmswimlane_prikey PRIMARY KEY (pmsl_id);


--
-- TOC entry 2693 (class 2606 OID 51171)
-- Name: const_fcpmswimlanesetup_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpmswimlanesetup
    ADD CONSTRAINT const_fcpmswimlanesetup_prikey PRIMARY KEY (pmss_id);


--
-- TOC entry 2695 (class 2606 OID 51173)
-- Name: const_fcpmworkflow_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpmworkflow
    ADD CONSTRAINT const_fcpmworkflow_prikey PRIMARY KEY (pmwf_id);


--
-- TOC entry 2703 (class 2606 OID 51175)
-- Name: const_fcrule_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcrule
    ADD CONSTRAINT const_fcrule_prikey PRIMARY KEY (ru_id);


--
-- TOC entry 2710 (class 2606 OID 51177)
-- Name: const_fcudv_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcudv
    ADD CONSTRAINT const_fcudv_prikey PRIMARY KEY (udv_code);


--
-- TOC entry 2714 (class 2606 OID 51179)
-- Name: const_fcuserdiary_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcuserdiary
    ADD CONSTRAINT const_fcuserdiary_prikey PRIMARY KEY (di_id);


--
-- TOC entry 2651 (class 2606 OID 51181)
-- Name: const_hlookup_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fclookup
    ADD CONSTRAINT const_hlookup_prikey PRIMARY KEY (lu_id);


--
-- TOC entry 2653 (class 2606 OID 51183)
-- Name: const_hlookup_unikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fclookup
    ADD CONSTRAINT const_hlookup_unikey UNIQUE (lu_cat, lu_code);


--
-- TOC entry 2726 (class 2606 OID 51185)
-- Name: const_martistskill_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY martistskill
    ADD CONSTRAINT const_martistskill_prikey PRIMARY KEY (ma_id);


--
-- TOC entry 2728 (class 2606 OID 51187)
-- Name: const_mcarton_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY mcarton
    ADD CONSTRAINT const_mcarton_prikey PRIMARY KEY (car_id);


--
-- TOC entry 2730 (class 2606 OID 51189)
-- Name: const_mcustmachine_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY mcustmachine
    ADD CONSTRAINT const_mcustmachine_prikey PRIMARY KEY (mc_id);


--
-- TOC entry 2757 (class 2606 OID 51515)
-- Name: const_mjobbarcode_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY mjobbarcode
    ADD CONSTRAINT const_mjobbarcode_prikey PRIMARY KEY (jbc_id);


--
-- TOC entry 2732 (class 2606 OID 51191)
-- Name: const_mjobcat_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY mjobcat
    ADD CONSTRAINT const_mjobcat_prikey PRIMARY KEY (jc_id);


--
-- TOC entry 2736 (class 2606 OID 51193)
-- Name: const_mjoboutput_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY mjoboutput
    ADD CONSTRAINT const_mjoboutput_prikey PRIMARY KEY (jo_id);


--
-- TOC entry 2751 (class 2606 OID 51485)
-- Name: const_mjoboutputlookup_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY mjoboutputlookup
    ADD CONSTRAINT const_mjoboutputlookup_prikey PRIMARY KEY (jol_id);


--
-- TOC entry 2738 (class 2606 OID 51195)
-- Name: const_mjobsheet_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY mjobsheet
    ADD CONSTRAINT const_mjobsheet_prikey PRIMARY KEY (js_id);


--
-- TOC entry 2741 (class 2606 OID 51197)
-- Name: const_mjscartonvalue_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY mjscartonvalue
    ADD CONSTRAINT const_mjscartonvalue_prikey PRIMARY KEY (caval_id);


--
-- TOC entry 2743 (class 2606 OID 51199)
-- Name: const_mmailtemplate_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY mmailtemplate
    ADD CONSTRAINT const_mmailtemplate_prikey PRIMARY KEY (mt_code);


--
-- TOC entry 2755 (class 2606 OID 51507)
-- Name: const_mmbarcodetype_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY mbarcodetype
    ADD CONSTRAINT const_mmbarcodetype_prikey PRIMARY KEY (bt_code);


--
-- TOC entry 2747 (class 2606 OID 51431)
-- Name: const_mtnc_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY mtnc
    ADD CONSTRAINT const_mtnc_prikey PRIMARY KEY (tc_id);


--
-- TOC entry 2749 (class 2606 OID 51437)
-- Name: const_mtncacceptance_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY mtncacceptance
    ADD CONSTRAINT const_mtncacceptance_prikey PRIMARY KEY (tca_tcid, tca_userid);


--
-- TOC entry 2745 (class 2606 OID 51201)
-- Name: const_pndcontact_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY pndcontact
    ADD CONSTRAINT const_pndcontact_prikey PRIMARY KEY (ct_id);


--
-- TOC entry 2655 (class 2606 OID 51203)
-- Name: const_vmenu_prikey; Type: CONSTRAINT; Schema: pnd; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY fcmenu
    ADD CONSTRAINT const_vmenu_prikey PRIMARY KEY (mn_id);


--
-- TOC entry 2657 (class 2606 OID 51205)
-- Name: const_vmenu_unikey; Type: CONSTRAINT; Schema: pnd; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY fcmenu
    ADD CONSTRAINT const_vmenu_unikey UNIQUE (mn_code);


--
-- TOC entry 2659 (class 2606 OID 51207)
-- Name: const_vorg_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcorg
    ADD CONSTRAINT const_vorg_prikey PRIMARY KEY (org_id);


--
-- TOC entry 2697 (class 2606 OID 51209)
-- Name: const_vrole_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcrole
    ADD CONSTRAINT const_vrole_prikey PRIMARY KEY (rol_id);


--
-- TOC entry 2699 (class 2606 OID 51211)
-- Name: const_vroleperm_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcroleperm
    ADD CONSTRAINT const_vroleperm_prikey PRIMARY KEY (rp_id);


--
-- TOC entry 2701 (class 2606 OID 51213)
-- Name: const_vroleperm_unikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcroleperm
    ADD CONSTRAINT const_vroleperm_unikey UNIQUE (rp_rolid, rp_pmscode);


--
-- TOC entry 2705 (class 2606 OID 51215)
-- Name: const_vsetting_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcsetting
    ADD CONSTRAINT const_vsetting_prikey PRIMARY KEY (set_id);


--
-- TOC entry 2707 (class 2606 OID 51217)
-- Name: const_vsetting_unikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcsetting
    ADD CONSTRAINT const_vsetting_unikey UNIQUE (set_user, set_code);


--
-- TOC entry 2712 (class 2606 OID 51219)
-- Name: const_vuser_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcuser
    ADD CONSTRAINT const_vuser_prikey PRIMARY KEY (usr_userid);


--
-- TOC entry 2716 (class 2606 OID 51221)
-- Name: const_vuserlogin_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcuserlogin
    ADD CONSTRAINT const_vuserlogin_prikey PRIMARY KEY (ul_id);


--
-- TOC entry 2718 (class 2606 OID 51223)
-- Name: const_vuserorgrole_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcuserorgrole
    ADD CONSTRAINT const_vuserorgrole_prikey PRIMARY KEY (uor_id);


--
-- TOC entry 2720 (class 2606 OID 51225)
-- Name: const_vuserorgrole_unikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcuserorgrole
    ADD CONSTRAINT const_vuserorgrole_unikey UNIQUE (uor_usrid, uor_orgid, uor_rolid);


--
-- TOC entry 2722 (class 2606 OID 51227)
-- Name: const_vusersession_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcusersession
    ADD CONSTRAINT const_vusersession_prikey PRIMARY KEY (us_id);


--
-- TOC entry 2734 (class 2606 OID 51229)
-- Name: cont_mjobcatlookup_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY mjobcatlookup
    ADD CONSTRAINT cont_mjobcatlookup_prikey PRIMARY KEY (jcl_id);


--
-- TOC entry 2635 (class 2606 OID 51231)
-- Name: country_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fccountry
    ADD CONSTRAINT country_prikey PRIMARY KEY (con_code);


--
-- TOC entry 2739 (class 1259 OID 51390)
-- Name: idx_requestdate; Type: INDEX; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE INDEX idx_requestdate ON mjobsheet USING btree (js_request_date, js_request_dateinmth, js_primcat);


--
-- TOC entry 2708 (class 1259 OID 51391)
-- Name: idx_vsetting_code_user; Type: INDEX; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE UNIQUE INDEX idx_vsetting_code_user ON fcsetting USING btree (set_user, set_code);


--
-- TOC entry 2723 (class 1259 OID 51392)
-- Name: usersession_idx1; Type: INDEX; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE INDEX usersession_idx1 ON fcusersession USING btree (us_sessid);


--
-- TOC entry 2724 (class 1259 OID 51393)
-- Name: usersession_idx2; Type: INDEX; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE INDEX usersession_idx2 ON fcusersession USING btree (us_userid);


--
-- TOC entry 2758 (class 2620 OID 51400)
-- Name: mjobsheet_upd_trig; Type: TRIGGER; Schema: pnd; Owner: pnd
--

CREATE TRIGGER mjobsheet_upd_trig BEFORE INSERT ON mjobsheet FOR EACH ROW EXECUTE PROCEDURE update_requestdate();


-- Completed on 2014-06-25 20:58:44

--
-- PostgreSQL database dump complete
--

