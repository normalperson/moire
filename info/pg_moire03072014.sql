--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: pnd; Type: SCHEMA; Schema: -; Owner: pnd
--

CREATE SCHEMA pnd;


ALTER SCHEMA pnd OWNER TO pnd;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = pnd, pg_catalog;

--
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
-- Name: date_to_char(timestamp without time zone); Type: FUNCTION; Schema: pnd; Owner: pnd
--

CREATE FUNCTION date_to_char(timefield timestamp without time zone) RETURNS text
    LANGUAGE sql IMMUTABLE
    AS $_$
    select to_char($1, 'Mon-YYYY');
$_$;


ALTER FUNCTION pnd.date_to_char(timefield timestamp without time zone) OWNER TO pnd;

--
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
-- Name: fccountry; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE fccountry (
    con_code character varying(24) NOT NULL,
    con_name character varying(1000)
);


ALTER TABLE pnd.fccountry OWNER TO pnd;

--
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
-- Name: fcdbaudit_dba_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcdbaudit_dba_id_seq OWNED BY fcdbaudit.dba_id;


--
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
-- Name: fcdoc_fd_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcdoc_fd_id_seq OWNED BY fcdoc.fd_id;


--
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
-- Name: COLUMN fcemailsetting.ms_type; Type: COMMENT; Schema: pnd; Owner: pnd
--

COMMENT ON COLUMN fcemailsetting.ms_type IS 'MAILOUT = send out
MAILIN = receive';


--
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
-- Name: fcemailsetting_ms_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcemailsetting_ms_id_seq OWNED BY fcemailsetting.ms_id;


--
-- Name: fclang; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE fclang (
    lang_code character varying(5) NOT NULL,
    lang_name character varying(200),
    lang_status character varying(12) DEFAULT 'ACTIVE'::character varying
);


ALTER TABLE pnd.fclang OWNER TO pnd;

--
-- Name: TABLE fclang; Type: COMMENT; Schema: pnd; Owner: pnd
--

COMMENT ON TABLE fclang IS 'ISO 639-1';


--
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
-- Name: fclocaleholiday_lch_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fclocaleholiday_lch_id_seq OWNED BY fclocaleholiday.lch_id;


--
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
-- Name: fclocaleworkinghour_lcw_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fclocaleworkinghour_lcw_id_seq OWNED BY fclocaleworkinghour.lcw_id;


--
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
-- Name: fclog_log_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fclog_log_id_seq OWNED BY fclog.log_id;


--
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
-- Name: fclookup_lu_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fclookup_lu_id_seq OWNED BY fclookup.lu_id;


--
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
-- Name: fcmenu_mn_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcmenu_mn_id_seq OWNED BY fcmenu.mn_id;


--
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
-- Name: fcmenu_mn_parentid_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcmenu_mn_parentid_seq OWNED BY fcmenu.mn_parentid;


--
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
-- Name: COLUMN fcorg.org_lccode; Type: COMMENT; Schema: pnd; Owner: pnd
--

COMMENT ON COLUMN fcorg.org_lccode IS 'Locale';


--
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
-- Name: fcorg_org_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcorg_org_id_seq OWNED BY fcorg.org_id;


--
-- Name: fcpermission; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE fcpermission (
    pms_code character varying(50) NOT NULL,
    pms_desc character varying(2000)
);


ALTER TABLE pnd.fcpermission OWNER TO pnd;

--
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
-- Name: COLUMN fcpmactivity.pmat_sla_interval; Type: COMMENT; Schema: pnd; Owner: pnd
--

COMMENT ON COLUMN fcpmactivity.pmat_sla_interval IS 'format follow PHP DateInterval interval_spec';


--
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
-- Name: fcpmcase_pmc_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcpmcase_pmc_id_seq OWNED BY fcpmcase.pmc_id;


--
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
-- Name: fcpmcasecomment_pmcc_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcpmcasecomment_pmcc_id_seq OWNED BY fcpmcasecomment.pmcc_id;


--
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
-- Name: fcpmcasecommentread_pmcr_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcpmcasecommentread_pmcr_id_seq OWNED BY fcpmcasecommentread.pmcr_id;


--
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
-- Name: fcpmcaseflag_pmcf_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcpmcaseflag_pmcf_id_seq OWNED BY fcpmcaseflag.pmcf_id;


--
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
-- Name: COLUMN fcpmcaseflow.pmf_from_event_gateway; Type: COMMENT; Schema: pnd; Owner: pnd
--

COMMENT ON COLUMN fcpmcaseflow.pmf_from_event_gateway IS 'Last flow is an event gateway';


--
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
-- Name: fcpmcaseflow_pmf_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcpmcaseflow_pmf_id_seq OWNED BY fcpmcaseflow.pmf_id;


--
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
-- Name: fcpmcaseflowassign_pmfa_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcpmcaseflowassign_pmfa_id_seq OWNED BY fcpmcaseflowassign.pmfa_id;


--
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
-- Name: fcpmconnector_pmcn_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcpmconnector_pmcn_id_seq OWNED BY fcpmconnector.pmcn_id;


--
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
-- Name: COLUMN fcpmevent.pmev_attach_pmatid; Type: COMMENT; Schema: pnd; Owner: pnd
--

COMMENT ON COLUMN fcpmevent.pmev_attach_pmatid IS 'if event is attached to a activity';


--
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
-- Name: fcpmevent_pmev_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcpmevent_pmev_id_seq OWNED BY fcpmevent.pmev_id;


--
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
-- Name: fcpmgateway_pmgw_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcpmgateway_pmgw_id_seq OWNED BY fcpmgateway.pmgw_id;


--
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
-- Name: fcpmswimlane_pmsl_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcpmswimlane_pmsl_id_seq OWNED BY fcpmswimlane.pmsl_id;


--
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
-- Name: fcpmswimlanesetup_pmss_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcpmswimlanesetup_pmss_id_seq OWNED BY fcpmswimlanesetup.pmss_id;


--
-- Name: fcpmworkflow; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE fcpmworkflow (
    pmwf_id integer NOT NULL,
    pmwf_name character varying(100)
);


ALTER TABLE pnd.fcpmworkflow OWNER TO pnd;

--
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
-- Name: fcpmworkflow_pmwf_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcpmworkflow_pmwf_id_seq OWNED BY fcpmworkflow.pmwf_id;


--
-- Name: fcrole; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE fcrole (
    rol_id integer NOT NULL,
    rol_name character varying(2000)
);


ALTER TABLE pnd.fcrole OWNER TO pnd;

--
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
-- Name: fcrole_rol_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcrole_rol_id_seq OWNED BY fcrole.rol_id;


--
-- Name: fcroleperm; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE fcroleperm (
    rp_id integer NOT NULL,
    rp_rolid integer,
    rp_pmscode character varying(50)
);


ALTER TABLE pnd.fcroleperm OWNER TO pnd;

--
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
-- Name: fcroleperm_rp_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcroleperm_rp_id_seq OWNED BY fcroleperm.rp_id;


--
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
-- Name: fcrule_ru_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcrule_ru_id_seq OWNED BY fcrule.ru_id;


--
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
-- Name: COLUMN fcsetting.set_id; Type: COMMENT; Schema: pnd; Owner: pnd
--

COMMENT ON COLUMN fcsetting.set_id IS 'setting id';


--
-- Name: COLUMN fcsetting.set_description; Type: COMMENT; Schema: pnd; Owner: pnd
--

COMMENT ON COLUMN fcsetting.set_description IS 'setting description';


--
-- Name: COLUMN fcsetting.set_val; Type: COMMENT; Schema: pnd; Owner: pnd
--

COMMENT ON COLUMN fcsetting.set_val IS 'setting value';


--
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
-- Name: fcsetting_set_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcsetting_set_id_seq OWNED BY fcsetting.set_id;


--
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
-- Name: fcuserdiary_di_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcuserdiary_di_id_seq OWNED BY fcuserdiary.di_id;


--
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
-- Name: fcuserlogin_ul_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcuserlogin_ul_id_seq OWNED BY fcuserlogin.ul_id;


--
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
-- Name: fcuserorgrole_uor_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcuserorgrole_uor_id_seq OWNED BY fcuserorgrole.uor_id;


--
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
-- Name: COLUMN fcusersession.us_sessid; Type: COMMENT; Schema: pnd; Owner: pnd
--

COMMENT ON COLUMN fcusersession.us_sessid IS 'PHP session id';


--
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
-- Name: fcusersession_us_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE fcusersession_us_id_seq OWNED BY fcusersession.us_id;


--
-- Name: martistskill; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE martistskill (
    ma_id integer NOT NULL,
    ma_usruserid character varying(50),
    ma_jclid integer
);


ALTER TABLE pnd.martistskill OWNER TO pnd;

--
-- Name: COLUMN martistskill.ma_jclid; Type: COMMENT; Schema: pnd; Owner: pnd
--

COMMENT ON COLUMN martistskill.ma_jclid IS 'foreign key to mjobcatlookup';


--
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
-- Name: martistskill_ma_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE martistskill_ma_id_seq OWNED BY martistskill.ma_id;


--
-- Name: mbarcodetype; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE mbarcodetype (
    bt_code character varying(50) NOT NULL,
    bt_name character varying(200),
    bt_format character varying(100)
);


ALTER TABLE pnd.mbarcodetype OWNER TO pnd;

--
-- Name: mcarton; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE mcarton (
    car_id integer NOT NULL,
    car_name character varying(200),
    car_status character varying(32) DEFAULT 'ACTIVE'::character varying
);


ALTER TABLE pnd.mcarton OWNER TO pnd;

--
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
-- Name: mcarton_car_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE mcarton_car_id_seq OWNED BY mcarton.car_id;


--
-- Name: mcartonvariable; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE mcartonvariable (
    carv_code character varying(12),
    carv_unit character varying(12),
    carv_carid integer
);


ALTER TABLE pnd.mcartonvariable OWNER TO pnd;

--
-- Name: COLUMN mcartonvariable.carv_carid; Type: COMMENT; Schema: pnd; Owner: pnd
--

COMMENT ON COLUMN mcartonvariable.carv_carid IS 'foreign key to mcarton car_id';


--
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
-- Name: mcustmachine_mc_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE mcustmachine_mc_id_seq OWNED BY mcustmachine.mc_id;


--
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
-- Name: mjobbarcode_jbc_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE mjobbarcode_jbc_id_seq OWNED BY mjobbarcode.jbc_id;


--
-- Name: mjobcat; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE mjobcat (
    jc_id integer NOT NULL,
    jc_jsid integer,
    jc_jclid integer
);


ALTER TABLE pnd.mjobcat OWNER TO pnd;

--
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
-- Name: mjobcat_jc_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE mjobcat_jc_id_seq OWNED BY mjobcat.jc_id;


--
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
-- Name: mjobcatlookup_jcl_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE mjobcatlookup_jcl_id_seq OWNED BY mjobcatlookup.jcl_id;


--
-- Name: mjoboutput; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE mjoboutput (
    jo_id integer NOT NULL,
    jo_jsid integer,
    jo_outputcode character varying(50)
);


ALTER TABLE pnd.mjoboutput OWNER TO pnd;

--
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
-- Name: mjoboutputlookup_jol_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE mjoboutputlookup_jol_id_seq OWNED BY mjoboutputlookup.jol_id;


--
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
    js_outputheight integer
);


ALTER TABLE pnd.mjobsheet OWNER TO pnd;

--
-- Name: COLUMN mjobsheet.js_primcat; Type: COMMENT; Schema: pnd; Owner: pnd
--

COMMENT ON COLUMN mjobsheet.js_primcat IS 'primary job category';


--
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
-- Name: mjobsheet_js_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE mjobsheet_js_id_seq OWNED BY mjobsheet.js_id;


--
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
-- Name: mjscartonvalue_caval_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE mjscartonvalue_caval_id_seq OWNED BY mjscartonvalue.caval_id;


--
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
-- Name: mtnc; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE mtnc (
    tc_id integer NOT NULL,
    tc_text text
);


ALTER TABLE pnd.mtnc OWNER TO pnd;

--
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
-- Name: mtnc_tc_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE mtnc_tc_id_seq OWNED BY mtnc.tc_id;


--
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
-- Name: pndaddress_ad_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE pndaddress_ad_id_seq OWNED BY pndaddress.ad_id;


--
-- Name: pndartistskill; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE pndartistskill (
    as_userid character varying(50),
    as_skill character varying(50)
);


ALTER TABLE pnd.pndartistskill OWNER TO pnd;

--
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
-- Name: COLUMN pndcontact.ct_concode; Type: COMMENT; Schema: pnd; Owner: pnd
--

COMMENT ON COLUMN pndcontact.ct_concode IS 'Country code';


--
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
-- Name: pndcontact_ct_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE pndcontact_ct_id_seq OWNED BY pndcontact.ct_id;


--
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
-- Name: pndjoboutput_jo_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE pndjoboutput_jo_id_seq OWNED BY mjoboutput.jo_id;


--
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
-- Name: pndphone_ph_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE pndphone_ph_id_seq OWNED BY pndphone.ph_id;


--
-- Name: dba_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcdbaudit ALTER COLUMN dba_id SET DEFAULT nextval('fcdbaudit_dba_id_seq'::regclass);


--
-- Name: fd_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcdoc ALTER COLUMN fd_id SET DEFAULT nextval('fcdoc_fd_id_seq'::regclass);


--
-- Name: ms_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcemailsetting ALTER COLUMN ms_id SET DEFAULT nextval('fcemailsetting_ms_id_seq'::regclass);


--
-- Name: lch_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fclocaleholiday ALTER COLUMN lch_id SET DEFAULT nextval('fclocaleholiday_lch_id_seq'::regclass);


--
-- Name: lcw_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fclocaleworkinghour ALTER COLUMN lcw_id SET DEFAULT nextval('fclocaleworkinghour_lcw_id_seq'::regclass);


--
-- Name: log_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fclog ALTER COLUMN log_id SET DEFAULT nextval('fclog_log_id_seq'::regclass);


--
-- Name: lu_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fclookup ALTER COLUMN lu_id SET DEFAULT nextval('fclookup_lu_id_seq'::regclass);


--
-- Name: mn_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcmenu ALTER COLUMN mn_id SET DEFAULT nextval('fcmenu_mn_id_seq'::regclass);


--
-- Name: mn_parentid; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcmenu ALTER COLUMN mn_parentid SET DEFAULT nextval('fcmenu_mn_parentid_seq'::regclass);


--
-- Name: org_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcorg ALTER COLUMN org_id SET DEFAULT nextval('fcorg_org_id_seq'::regclass);


--
-- Name: pmc_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcpmcase ALTER COLUMN pmc_id SET DEFAULT nextval('fcpmcase_pmc_id_seq'::regclass);


--
-- Name: pmcc_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcpmcasecomment ALTER COLUMN pmcc_id SET DEFAULT nextval('fcpmcasecomment_pmcc_id_seq'::regclass);


--
-- Name: pmcr_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcpmcasecommentread ALTER COLUMN pmcr_id SET DEFAULT nextval('fcpmcasecommentread_pmcr_id_seq'::regclass);


--
-- Name: pmcf_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcpmcaseflag ALTER COLUMN pmcf_id SET DEFAULT nextval('fcpmcaseflag_pmcf_id_seq'::regclass);


--
-- Name: pmf_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcpmcaseflow ALTER COLUMN pmf_id SET DEFAULT nextval('fcpmcaseflow_pmf_id_seq'::regclass);


--
-- Name: pmfa_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcpmcaseflowassign ALTER COLUMN pmfa_id SET DEFAULT nextval('fcpmcaseflowassign_pmfa_id_seq'::regclass);


--
-- Name: pmcn_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcpmconnector ALTER COLUMN pmcn_id SET DEFAULT nextval('fcpmconnector_pmcn_id_seq'::regclass);


--
-- Name: pmev_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcpmevent ALTER COLUMN pmev_id SET DEFAULT nextval('fcpmevent_pmev_id_seq'::regclass);


--
-- Name: pmgw_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcpmgateway ALTER COLUMN pmgw_id SET DEFAULT nextval('fcpmgateway_pmgw_id_seq'::regclass);


--
-- Name: pmsl_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcpmswimlane ALTER COLUMN pmsl_id SET DEFAULT nextval('fcpmswimlane_pmsl_id_seq'::regclass);


--
-- Name: pmss_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcpmswimlanesetup ALTER COLUMN pmss_id SET DEFAULT nextval('fcpmswimlanesetup_pmss_id_seq'::regclass);


--
-- Name: pmwf_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcpmworkflow ALTER COLUMN pmwf_id SET DEFAULT nextval('fcpmworkflow_pmwf_id_seq'::regclass);


--
-- Name: rol_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcrole ALTER COLUMN rol_id SET DEFAULT nextval('fcrole_rol_id_seq'::regclass);


--
-- Name: rp_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcroleperm ALTER COLUMN rp_id SET DEFAULT nextval('fcroleperm_rp_id_seq'::regclass);


--
-- Name: ru_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcrule ALTER COLUMN ru_id SET DEFAULT nextval('fcrule_ru_id_seq'::regclass);


--
-- Name: set_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcsetting ALTER COLUMN set_id SET DEFAULT nextval('fcsetting_set_id_seq'::regclass);


--
-- Name: di_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcuserdiary ALTER COLUMN di_id SET DEFAULT nextval('fcuserdiary_di_id_seq'::regclass);


--
-- Name: ul_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcuserlogin ALTER COLUMN ul_id SET DEFAULT nextval('fcuserlogin_ul_id_seq'::regclass);


--
-- Name: uor_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcuserorgrole ALTER COLUMN uor_id SET DEFAULT nextval('fcuserorgrole_uor_id_seq'::regclass);


--
-- Name: us_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcusersession ALTER COLUMN us_id SET DEFAULT nextval('fcusersession_us_id_seq'::regclass);


--
-- Name: ma_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY martistskill ALTER COLUMN ma_id SET DEFAULT nextval('martistskill_ma_id_seq'::regclass);


--
-- Name: car_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY mcarton ALTER COLUMN car_id SET DEFAULT nextval('mcarton_car_id_seq'::regclass);


--
-- Name: mc_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY mcustmachine ALTER COLUMN mc_id SET DEFAULT nextval('mcustmachine_mc_id_seq'::regclass);


--
-- Name: jbc_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY mjobbarcode ALTER COLUMN jbc_id SET DEFAULT nextval('mjobbarcode_jbc_id_seq'::regclass);


--
-- Name: jc_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY mjobcat ALTER COLUMN jc_id SET DEFAULT nextval('mjobcat_jc_id_seq'::regclass);


--
-- Name: jcl_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY mjobcatlookup ALTER COLUMN jcl_id SET DEFAULT nextval('mjobcatlookup_jcl_id_seq'::regclass);


--
-- Name: jo_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY mjoboutput ALTER COLUMN jo_id SET DEFAULT nextval('pndjoboutput_jo_id_seq'::regclass);


--
-- Name: jol_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY mjoboutputlookup ALTER COLUMN jol_id SET DEFAULT nextval('mjoboutputlookup_jol_id_seq'::regclass);


--
-- Name: js_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY mjobsheet ALTER COLUMN js_id SET DEFAULT nextval('mjobsheet_js_id_seq'::regclass);


--
-- Name: caval_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY mjscartonvalue ALTER COLUMN caval_id SET DEFAULT nextval('mjscartonvalue_caval_id_seq'::regclass);


--
-- Name: tc_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY mtnc ALTER COLUMN tc_id SET DEFAULT nextval('mtnc_tc_id_seq'::regclass);


--
-- Name: ad_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY pndaddress ALTER COLUMN ad_id SET DEFAULT nextval('pndaddress_ad_id_seq'::regclass);


--
-- Name: ct_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY pndcontact ALTER COLUMN ct_id SET DEFAULT nextval('pndcontact_ct_id_seq'::regclass);


--
-- Name: ph_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY pndphone ALTER COLUMN ph_id SET DEFAULT nextval('pndphone_ph_id_seq'::regclass);


--
-- Data for Name: fccountry; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY fccountry (con_code, con_name) FROM stdin;
FJ	Fiji
FI	Finland
FR	France
GF	French Guiana
PF	French Polynesia
TF	French Southern Territories
GA	Gabon
GM	Gambia
GE	Georgia
DE	Germany
GH	Ghana
GI	Gibraltar
GR	Greece
GL	Greenland
GD	Grenada
GP	Guadeloupe
GU	Guam
GT	Guatemala
GG	Guernsey
GN	Guinea
GW	Guinea-bissau
GY	Guyana
HT	Haiti
HM	Heard Island and Mcdonald Islands
HN	Honduras
HK	Hong Kong
HU	Hungary
IS	Iceland
IN	India
ID	Indonesia
TG	Togo
MY	Malaysia
MV	Maldives
ML	Mali
MT	Malta
MH	Marshall Islands
MQ	Martinique
MR	Mauritania
MU	Mauritius
YT	Mayotte
MX	Mexico
FM	Micronesia, Federated States of
MD	Moldova, Republic of
MC	Monaco
MN	Mongolia
ME	Montenegro
MS	Montserrat
MA	Morocco
MZ	Mozambique
MM	Myanmar
NA	Namibia
NR	Nauru
NP	Nepal
NL	Netherlands
AN	Netherlands Antilles
NC	New Caledonia
NZ	New Zealand
NI	Nicaragua
NE	Niger
NG	Nigeria
NU	Niue
NF	Norfolk Island
MP	Northern Mariana Islands
NO	Norway
OM	Oman
PK	Pakistan
PW	Palau
PS	Palestinian Territory, Occupied
PA	Panama
PG	Papua New Guinea
PY	Paraguay
PE	Peru
PH	Philippines
PN	Pitcairn
PL	Poland
PT	Portugal
PR	Puerto Rico
QA	Qatar
RE	Reunion
RO	Romania
RU	Russian Federation
RW	Rwanda
SH	Saint Helena
KN	Saint Kitts and Nevis
LC	Saint Lucia
PM	Saint Pierre and Miquelon
VC	Saint Vincent and The Grenadines
WS	Samoa
SM	San Marino
ST	Sao Tome and Principe
SA	Saudi Arabia
SN	Senegal
RS	Serbia
SC	Seychelles
SL	Sierra Leone
SG	Singapore
SK	Slovakia
SI	Slovenia
SB	Solomon Islands
SO	Somalia
ZA	South Africa
GS	South Georgia and The South Sandwich Islands
ES	Spain
LK	Sri Lanka
SD	Sudan
SR	Suriname
SJ	Svalbard and Jan Mayen
SZ	Swaziland
SE	Sweden
CH	Switzerland
SY	Syrian Arab Republic
TW	Taiwan, Province of China
TJ	Tajikistan
TZ	Tanzania, United Republic of
TH	Thailand
TL	Timor-leste
TK	Tokelau
TO	Tonga
TT	Trinidad and Tobago
TN	Tunisia
TR	Turkey
TM	Turkmenistan
TC	Turks and Caicos Islands
TV	Tuvalu
UG	Uganda
UA	Ukraine
AE	United Arab Emirates
GB	United Kingdom
US	United States
UM	United States Minor Outlying Islands
UY	Uruguay
UZ	Uzbekistan
VU	Vanuatu
VE	Venezuela
VG	Virgin Islands, British
VI	Virgin Islands, U.S.
WF	Wallis and Futuna
EH	Western Sahara
YE	Yemen
ZM	Zambia
ZW	Zimbabwe
AX	Aland Islands
AL	Albania
DZ	Algeria
AS	American Samoa
AD	Andorra
AO	Angola
AI	Anguilla
AQ	Antarctica
AG	Antigua and Barbuda
AR	Argentina
AM	Armenia
AW	Aruba
AU	Australia
AT	Austria
AZ	Azerbaijan
BS	Bahamas
BH	Bahrain
BD	Bangladesh
BB	Barbados
BY	Belarus
BE	Belgium
BZ	Belize
BJ	Benin
BM	Bermuda
BT	Bhutan
BO	Bolivia
BA	Bosnia and Herzegovina
BW	Botswana
BV	Bouvet Island
BR	Brazil
IO	British Indian Ocean Territory
BN	Brunei Darussalam
BG	Bulgaria
BF	Burkina Faso
BI	Burundi
KH	Cambodia
CM	Cameroon
CA	Canada
CV	Cape Verde
KY	Cayman Islands
CF	Central African Republic
TD	Chad
CL	Chile
CN	China
CX	Christmas Island
CC	Cocos (Keeling) Islands
CO	Colombia
KM	Comoros
CG	Congo
CK	Cook Islands
CR	Costa Rica
CI	Cote D'ivoire
HR	Croatia
CU	Cuba
CY	Cyprus
CZ	Czech Republic
DK	Denmark
DJ	Djibouti
DM	Dominica
DO	Dominican Republic
EC	Ecuador
EG	Egypt
SV	El Salvador
GQ	Equatorial Guinea
ER	Eritrea
EE	Estonia
ET	Ethiopia
FK	Falkland Islands (Malvinas)
FO	Faroe Islands
IQ	Iraq
IE	Ireland
IM	Isle of Man
IL	Israel
IT	Italy
JM	Jamaica
JP	Japan
JE	Jersey
JO	Jordan
KZ	Kazakhstan
KE	Kenya
KI	Kiribati
KW	Kuwait
KG	Kyrgyzstan
LA	Lao People's Democratic Republic
LV	Latvia
LB	Lebanon
LS	Lesotho
LR	Liberia
LY	Libyan Arab Jamahiriya
LI	Liechtenstein
LT	Lithuania
LU	Luxembourg
MO	Macao
MG	Madagascar
MW	Malawi
AF	Afghanistan
VN	Vietnam
VA	Vatican City
IR	Iran
KP	Korea (South)
KR	Korea (North)
MK	Macedonia
\.


--
-- Data for Name: fcdbaudit; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY fcdbaudit (dba_id, dba_created, dba_userid, dba_table, dba_column, dba_oldvalue, dba_newvalue, dba_keys, dba_key1, dba_key2, dba_key3, dba_key4, dba_key5) FROM stdin;
\.


--
-- Name: fcdbaudit_dba_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcdbaudit_dba_id_seq', 1, false);


--
-- Data for Name: fcdoc; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) FROM stdin;
2	2014-04-24 13:29:58.09+08	\N	5	car_id	\N	5.png	png		12095.0000
3	2014-04-24 13:31:09.326+08	\N	6	car_id	\N	6.png	png		10963.0000
4	2014-04-28 19:45:42.897+08	\N	7	car_id	\N	7.png	png	\N	23347.0000
5	2014-04-28 19:46:38.762+08	\N	8	car_id	\N	8.png	png		13436.0000
6	2014-04-28 21:23:03.646+08	\N	14	car_id	\N	14.	png		7062.0000
7	2014-04-28 21:33:27.757+08	\N	16	car_id	\N	\N	\N		\N
8	2014-04-28 21:35:08.971+08	\N	17	car_id	\N	\N	\N		\N
9	2014-04-28 21:35:20.551+08	\N	18	car_id	\N	\N	\N		\N
10	2014-04-28 21:36:05.078+08	\N	19	car_id	\N	\N	\N		\N
11	2014-04-28 21:43:29.514+08	\N	21	car_id	\N	21.xls	xls		27136.0000
12	2014-04-28 21:44:00.845+08	\N	22	car_id	\N	22.xls	xls		27136.0000
13	2014-04-28 21:46:53.704+08	\N	24	car_id	\N	\N	\N		\N
14	2014-04-28 21:54:30.45+08	\N	31	car_id	\N	31.png	png		7062.0000
15	2014-05-01 16:32:55.239+08	\N	33	car_id	\N	33.png	png		23347.0000
16	2014-06-07 12:06:16.717+08		34	car_id	\N	\N	png		\N
17	2014-06-07 12:11:40.971+08		34	car_id	\N	hsc.png	png		10963.0000
18	2014-06-07 12:12:25.931+08		34	car_id	\N	ind_9.png	png		7062.0000
19	2014-06-07 12:38:58.078+08		34	car_id	\N	osc_1.png	png		10296.0000
20	2014-06-07 12:39:19.295+08		34	car_id	\N	osc_1.png	png		10296.0000
24	2014-06-07 13:15:49.938+08		34	car_id	\N	hsc.png	png		10963.0000
25	2014-06-07 13:16:17.242+08		34	car_id	\N	hsc.png	png		10963.0000
26	2014-06-07 13:16:45.322+08		34	car_id	\N	hsc.png	png		10963.0000
27	2014-06-07 13:17:19.842+08		34	car_id	\N	hsc.png	png		10963.0000
28	2014-06-07 13:17:37.655+08		35	car_id	\N	hsc.png	png		10963.0000
29	2014-06-07 13:18:05.969+08		35	car_id	\N	hsc.png	png		10963.0000
32	2014-06-07 13:20:01.693+08		40	car_id	\N	ind_9.png	png		7062.0000
36	2014-06-07 15:30:18.377+08		41	car_id	\N	osc_2_joint_3.png	png		12580.0000
37	2014-06-07 15:36:52.231+08		41	car_id	\N	osc_2.png	png		9354.0000
38	2014-06-07 15:36:52.274+08		41	car_id	\N	osc_2_joint_1.png	png		12726.0000
39	2014-06-07 15:36:52.275+08		41	car_id	\N	osc_2_joint_2.png	png		11909.0000
40	2014-06-07 15:36:52.276+08		41	car_id	\N	osc_2_joint_3.png	png		12580.0000
41	2014-06-10 17:53:00.942+08	\N	42	js_id	\N	rar1	rar		33080.0000
42	2014-06-10 17:53:16.653+08	\N	43	js_id	\N	rar1	rar	\N	33080.0000
43	2014-06-10 17:53:27.744+08	\N	43	js_id	\N	rar2	rar	\N	33080.0000
44	2014-06-10 18:05:44.866+08	admin	27	js_id	\N	osc_3.png	png		10688.0000
45	2014-06-10 18:05:44.866+08	admin	27	js_id	\N	rsc_2_joint.png	png		13436.0000
46	2014-06-10 18:08:47.337+08	admin	28	js_id	\N	osc_3.png	png		10688.0000
47	2014-06-10 18:08:47.337+08	admin	28	js_id	\N	rsc_2_joint.png	png		13436.0000
48	2014-06-10 18:10:33.782+08	admin	29	js_id	\N	osc_3.png	png		10688.0000
49	2014-06-10 18:10:33.782+08	admin	29	js_id	\N	rsc_2_joint.png	png		13436.0000
50	2014-06-10 18:24:45.941+08	admin	50	new_id	\N	hsc.png	png		10963.0000
51	2014-06-10 18:24:45.968+08	admin	50	new_id	\N	ind_6.png	png		13315.0000
52	2014-06-10 18:24:45.969+08	admin	50	new_id	\N	osc_2_joint_3.png	png		12580.0000
53	2014-06-10 18:24:45.971+08	admin	50	new_id	\N	osc_3.png	png		10688.0000
54	2014-06-10 18:25:03.981+08	admin	30	js_id	\N	osc_3.png	png		10688.0000
55	2014-06-10 18:25:03.981+08	admin	30	js_id	\N	rsc_2_joint.png	png		13436.0000
56	2014-06-10 18:26:56.048+08	admin	31	js_id	\N	osc_3.png	png		10688.0000
57	2014-06-10 18:26:56.048+08	admin	31	js_id	\N	rsc_2_joint.png	png		13436.0000
58	2014-06-10 19:05:26.862+08	admin	32	js_id	\N	newjoberror.rar	rar		63047.0000
59	2014-06-10 21:09:22.433+08	admin	33	js_id	New job file upload	newjoberror.rar	rar		63047.0000
60	2014-06-10 21:09:22.433+08	admin	33	js_id	New job file upload	accountwebsite.rar	rar		129.0000
61	2014-06-10 22:44:42.107+08	admin	34	js_id	New job file upload	hsc.png	png		10963.0000
62	2014-06-10 22:44:42.107+08	admin	34	js_id	New job file upload	ind_6.png	png		13315.0000
63	2014-06-10 23:06:08.402+08	admin	34	js_id	Artwork job done	osc_3.png	png		10688.0000
64	2014-06-10 23:06:08.402+08	admin	34	js_id	Artwork job done	rsc.png	png		10260.0000
65	2014-06-10 23:20:47.905+08	admin	34	js_id	Artwork job done	osc_3.png	png		10688.0000
66	2014-06-10 23:21:42.452+08	admin	35	js_id	New job file upload	osc_2_joint_3.png	png		12580.0000
67	2014-06-10 23:21:42.452+08	admin	35	js_id	New job file upload	osc_3.png	png		10688.0000
68	2014-06-10 23:22:41.616+08	admin	35	js_id	Edit job file	hsc - Copy.png	png		10963.0000
69	2014-06-10 23:22:41.616+08	admin	35	js_id	Edit job file	five_panel.png	png		12095.0000
70	2014-06-11 20:47:02.736+08	admin	36	js_id	New job file upload	ind_9.png	png		7062.0000
71	2014-06-11 20:47:02.736+08	admin	36	js_id	New job file upload	osc_2.png	png		9354.0000
72	2014-06-11 20:47:02.736+08	admin	36	js_id	New job file upload	osc_2_joint_3.png	png		12580.0000
73	2014-06-11 20:47:02.736+08	admin	36	js_id	New job file upload	rsc.png	png		10260.0000
74	2014-06-11 20:50:04.312+08	admin	35	js_id	Artwork job done	rsc.png	png		10260.0000
75	2014-06-20 13:14:16.219+08	admin	46	js_id	\N	astro_banner.jpg	jpg		207634.0000
76	2014-06-20 15:17:12.216+08	admin	47	js_id	\N	data.TODO	TODO		2598.0000
77	2014-06-21 17:56:07.353+08	admin2	48	js_id	\N	download.jpg	jpg		6195.0000
78	2014-06-21 17:56:07.353+08	admin2	48	js_id	\N	saddsa.png	png		837.0000
79	2014-06-21 18:09:24.749+08	admin2	57	js_id	\N	download.jpg	jpg		6195.0000
80	2014-06-21 18:09:24.749+08	admin2	57	js_id	\N	saddsa.png	png		837.0000
81	2014-06-21 18:40:52.63+08	artist1	57	js_id	Artwork job done	tzdata2014c.tar.gz	gz		221322.0000
82	2014-06-21 18:45:26.295+08	uat_cust1	58	js_id	\N	Year of the Snake 2013.jpg	jpg		595700.0000
83	2014-06-21 18:47:14.918+08	uat_cust1	59	js_id	\N	season_greetings.jpg	jpg		266885.0000
84	2014-06-21 19:15:41.873+08	uat_cust1	60	js_id	\N	dbo_config.png	png		103884.0000
85	2014-06-21 21:48:33.818+08	uat_artist1	60	js_id	Artwork job done	cams_banner2.gif	gif		24392.0000
86	2014-06-21 21:57:49.784+08	uat_cust1	61	js_id	\N	season_greetings.jpg	jpg		266885.0000
87	2014-06-21 22:17:30.99+08	esp_supervisor	62	js_id	\N	tablist.html	html		19015.0000
88	2014-06-21 22:23:53.517+08	uat_cust1	63	js_id	\N	Year of the Snake 2013.jpg	jpg		595700.0000
89	2014-06-21 22:50:34.985+08	uat_artist1	58	js_id	Artwork job done	dbo_config.png	png		103884.0000
90	2014-06-21 23:45:22.963+08	uat_artist1	58	js_id	Artwork job done	dbo_config.png	png		103884.0000
91	2014-06-22 14:01:20.343+08	uat_supervisor1	64	js_id	\N	cloudcomputer.jpg	jpg		341341.0000
92	2014-06-22 15:06:57.158+08	uat_cust1	65	js_id	\N	ProcessManager.class.inc.php	php		25983.0000
93	2014-06-22 15:09:06.32+08	uat_cust1	66	js_id	\N	Operation.inc.php	php		3125.0000
94	2014-06-22 15:09:52.378+08	uat_cust1	67	js_id	\N	Operation.inc.php	php		3125.0000
95	2014-06-22 15:53:21.722+08	ysyow	68	js_id	\N	download.jpg	jpg		6195.0000
96	2014-06-22 15:53:21.722+08	ysyow	68	js_id	\N	saddsa.png	png		837.0000
97	2014-06-22 16:02:50.505+08	uat_customer1	69	js_id	\N	Diagramming-Crow's-Foot-ERD-Sample60.png	png		81061.0000
98	2014-06-22 16:02:50.505+08	uat_customer1	69	js_id	\N	no_date.png	png		6857.0000
99	2014-06-22 16:09:46.72+08	artist2	67	js_id	Artwork job done	download.jpg	jpg		6195.0000
100	2014-06-22 16:14:09.295+08	artist2	67	js_id	Artwork job done	download.jpg	jpg		6195.0000
101	2014-06-22 18:37:00.386+08	uat_customer1	70	js_id	\N	no_date.png	png		6857.0000
102	2014-06-22 18:37:00.386+08	uat_customer1	70	js_id	\N	Diagramming-Crow's-Foot-ERD-Sample60.png	png		81061.0000
103	2014-06-22 19:08:37.392+08	uat_customer1	71	js_id	\N	Diagramming-Crow's-Foot-ERD-Sample60.png	png		81061.0000
104	2014-06-22 19:09:29.558+08	uat_customer1	72	js_id	\N	Diagramming-Crow's-Foot-ERD-Sample60.png	png		81061.0000
105	2014-06-22 21:20:41.899+08	uat_customer2	74	js_id	\N	router-symbol.png	png		176839.0000
106	2014-06-22 21:34:06.591+08	uat_artist1	72	js_id	Artwork job done	Diagramming-Crow's-Foot-ERD-Sample60.png	png		81061.0000
107	2014-06-22 22:19:07.119+08	uat_customer3	75	js_id	\N	Diagramming-Crow's-Foot-ERD-Sample60.png	png		81061.0000
108	2014-06-22 22:22:00.011+08	ysyow	76	js_id	\N	batchjob_list.xlsx	xlsx		9496.0000
109	2014-06-22 22:25:19.154+08	uat_customer3	77	js_id	\N	Diagramming-Crow's-Foot-ERD-Sample60.png	png		81061.0000
110	2014-06-22 22:25:20.028+08	ysyow	78	js_id	\N	batchjob_list.xlsx	xlsx		9496.0000
111	2014-06-22 22:26:19.002+08	ysyow	79	js_id	\N	batchjob_list.xlsx	xlsx		9496.0000
112	2014-06-22 22:27:13.903+08	ysyow	80	js_id	\N	ProcessManager.class.inc.php	php		26555.0000
113	2014-06-22 22:29:53.155+08	ysyow	81	js_id	\N	Shine Points Range 19 May lsx.xlsx	xlsx		47078.0000
114	2014-06-22 22:34:15.393+08	ysyow	82	js_id	\N	Shine Points Range 19 May lsx.xlsx	xlsx		47078.0000
115	2014-06-22 22:41:20.16+08	uat_artist2	76	js_id	Artwork job done	router-symbol.png	png		176839.0000
116	2014-06-22 22:42:05.965+08	uat_customer3	83	js_id	\N	Diagramming-Crow's-Foot-ERD-Sample60.png	png		81061.0000
117	2014-06-22 23:01:48.442+08	uat_artist3	83	js_id	Artwork job done	Diagramming-Crow's-Foot-ERD-Sample60.png	png		81061.0000
118	2014-06-24 17:17:18.438+08	ysyow	84	js_id	\N	download.jpg	jpg		6195.0000
123	2014-06-24 18:38:42.963+08	ysyow	111	js_id	\N	download.jpg	jpg		6195.0000
124	2014-06-24 18:41:09.137+08	ysyow	112	js_id	\N	download.jpg	jpg		6195.0000
125	2014-06-24 18:47:11.461+08	uat_customer1	113	js_id	\N	AirAsia Web Check-In.pdf	pdf		179697.0000
126	2014-06-24 19:02:27.525+08	uat_artist1	113	js_id	Artwork job done	httpd.conf	conf		20325.0000
127	2014-06-24 19:04:28.117+08	uat_artist1	58	js_id	Artwork job done	httpd.conf	conf		20325.0000
128	2014-06-24 19:06:51.238+08	uat_customer1	114	js_id	\N	httpd.conf	conf		20325.0000
129	2014-06-24 19:07:39.352+08	uat_artist1	114	js_id	Artwork job done	httpd.conf	conf		20325.0000
130	2014-06-25 17:47:26.351+08	uat_customer4	115	js_id	\N	MoiregcUATNote.rar	rar		790.0000
131	2014-06-25 18:03:36.778+08	uat_customer4	116	js_id	\N	MoiregcUATNote.rar	rar		790.0000
132	2014-06-25 18:09:59.535+08	uat_customer4	117	js_id	\N	MoiregcUATNote.rar	rar		790.0000
133	2014-06-25 18:17:21.289+08	ysyow	118	js_id	\N	udv.rar	rar		2327.0000
134	2014-06-25 18:25:25.999+08	uat_artist4	116	js_id	Artwork job done	MoiregcUATNote.rar	rar		790.0000
135	2014-06-26 11:01:54.669+08	uat_customer4	119	js_id	\N	MoiregcUATNote.rar	rar		790.0000
136	2014-06-26 16:27:29.824+08	ysyow	120	js_id	\N	udv.rar	rar		2327.0000
137	2014-06-30 14:43:13.728+08	admin	121	js_id	\N	udv.rar	rar		2327.0000
138	2014-06-30 14:46:46.022+08	artist2	121	js_id	Artwork job done	Rule.rar	rar		12892.0000
139	2014-07-01 05:16:12.552816+08	uat_customer1	122	js_id	\N	router-symbol.rar	rar		147411.0000
140	2014-07-01 06:20:51.312605+08	uat_artist1	117	js_id	Artwork job done	router-symbol.rar	rar		147411.0000
141	2014-07-01 11:03:33.008717+08	uat_customer4	123	js_id	\N	Operation Planning - Daniel.zip	zip		12885.0000
142	2014-07-03 12:42:15.915+08	uat_customer1	124	js_id	\N	MoiregcUATNote.rar	rar		790.0000
143	2014-07-03 12:43:59.943+08	uat_customer1	125	js_id	\N	MoiregcUATNote.rar	rar		790.0000
\.


--
-- Name: fcdoc_fd_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcdoc_fd_id_seq', 143, true);


--
-- Data for Name: fcemailsetting; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY fcemailsetting (ms_id, ms_type, ms_hostname, ms_port, ms_username, ms_password) FROM stdin;
1	MAILOUT	202.190.181.92	25	noreply@moiregc.com.my	User123
\.


--
-- Name: fcemailsetting_ms_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcemailsetting_ms_id_seq', 1, true);


--
-- Data for Name: fclang; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY fclang (lang_code, lang_name, lang_status) FROM stdin;
AF	Afrikaans	ACTIVE
SQ	Albanian	ACTIVE
AM	Amharic	ACTIVE
AR-DZ	Arabic - Algeria	ACTIVE
AR-BH	Arabic - Bahrain	ACTIVE
AR-EG	Arabic - Egypt	ACTIVE
AR-IQ	Arabic - Iraq	ACTIVE
AR-JO	Arabic - Jordan	ACTIVE
AR-KW	Arabic - Kuwait	ACTIVE
AR-LB	Arabic - Lebanon	ACTIVE
AR-LY	Arabic - Libya	ACTIVE
AR-MA	Arabic - Morocco	ACTIVE
AR-OM	Arabic - Oman	ACTIVE
AR-QA	Arabic - Qatar	ACTIVE
AR-SA	Arabic - Saudi Arabia	ACTIVE
AR-SY	Arabic - Syria	ACTIVE
AR-TN	Arabic - Tunisia	ACTIVE
AR-AE	Arabic - United Arab Emirates	ACTIVE
AR-YE	Arabic - Yemen	ACTIVE
HY	Armenian	ACTIVE
AS	Assamese	ACTIVE
AZ-AZ	Azeri - Latin	ACTIVE
EU	Basque	ACTIVE
BE	Belarusian	ACTIVE
BN	Bengali - Bangladesh	ACTIVE
BS	Bosnian	ACTIVE
BG	Bulgarian	ACTIVE
MY	Burmese	ACTIVE
CA	Catalan	ACTIVE
ZH-CN	Chinese - China	ACTIVE
ZH-HK	Chinese - Hong Kong SAR	ACTIVE
ZH-MO	Chinese - Macau SAR	ACTIVE
ZH-SG	Chinese - Singapore	ACTIVE
ZH-TW	Chinese - Taiwan	ACTIVE
HR	Croatian	ACTIVE
CS	Czech	ACTIVE
DA	Danish	ACTIVE
DV	Divehi; Dhivehi; Maldivian	ACTIVE
NL-BE	Dutch - Belgium	ACTIVE
NL-NL	Dutch - Netherlands	ACTIVE
EN-AU	English - Australia	ACTIVE
EN-BZ	English - Belize	ACTIVE
EN-CA	English - Canada	ACTIVE
EN-CB	English - Caribbean	ACTIVE
EN-GB	English - Great Britain	ACTIVE
EN-IN	English - India	ACTIVE
EN-IE	English - Ireland	ACTIVE
EN-JM	English - Jamaica	ACTIVE
EN-NZ	English - New Zealand	ACTIVE
EN-PH	English - Phillippines	ACTIVE
EN-ZA	English - Southern Africa	ACTIVE
EN-TT	English - Trinidad	ACTIVE
EN-US	English - United States	ACTIVE
ET	Estonian	ACTIVE
FO	Faroese	ACTIVE
FA	Farsi - Persian	ACTIVE
FI	Finnish	ACTIVE
FR-BE	French - Belgium	ACTIVE
FR-CA	French - Canada	ACTIVE
FR-FR	French - France	ACTIVE
FR-LU	French - Luxembourg	ACTIVE
FR-CH	French - Switzerland	ACTIVE
MK	FYRO Macedonia	ACTIVE
GD-IE	Gaelic - Ireland	ACTIVE
GD	Gaelic - Scotland	ACTIVE
DE-AT	German - Austria	ACTIVE
DE-DE	German - Germany	ACTIVE
DE-LI	German - Liechtenstein	ACTIVE
DE-LU	German - Luxembourg	ACTIVE
DE-CH	German - Switzerland	ACTIVE
EL	Greek	ACTIVE
GN	Guarani - Paraguay	ACTIVE
GU	Gujarati	ACTIVE
HE	Hebrew	ACTIVE
HI	Hindi	ACTIVE
HU	Hungarian	ACTIVE
IS	Icelandic	ACTIVE
ID	Indonesian	ACTIVE
IT-IT	Italian - Italy	ACTIVE
IT-CH	Italian - Switzerland	ACTIVE
JA	Japanese	ACTIVE
KN	Kannada	ACTIVE
KS	Kashmiri	ACTIVE
KK	Kazakh	ACTIVE
KM	Khmer	ACTIVE
KO	Korean	ACTIVE
LO	Lao	ACTIVE
LA	Latin	ACTIVE
LV	Latvian	ACTIVE
LT	Lithuanian	ACTIVE
MS-BN	Malay - Brunei	ACTIVE
MS-MY	Malay - Malaysia	ACTIVE
ML	Malayalam	ACTIVE
MT	Maltese	ACTIVE
MI	Maori	ACTIVE
MR	Marathi	ACTIVE
MN	Mongolian	ACTIVE
NE	Nepali	ACTIVE
NO-NO	Norwegian - Bokml	ACTIVE
OR	Oriya	ACTIVE
PL	Polish	ACTIVE
PT-BR	Portuguese - Brazil	ACTIVE
PT-PT	Portuguese - Portugal	ACTIVE
PA	Punjabi	ACTIVE
RM	Raeto-Romance	ACTIVE
RO-MO	Romanian - Moldova	ACTIVE
RO	Romanian - Romania	ACTIVE
RU	Russian	ACTIVE
RU-MO	Russian - Moldova	ACTIVE
SA	Sanskrit	ACTIVE
SR-SP	Serbian - Cyrillic	ACTIVE
TN	Setsuana	ACTIVE
SD	Sindhi	ACTIVE
SI	Sinhala; Sinhalese	ACTIVE
SK	Slovak	ACTIVE
SL	Slovenian	ACTIVE
SO	Somali	ACTIVE
SB	Sorbian	ACTIVE
ES-AR	Spanish - Argentina	ACTIVE
ES-BO	Spanish - Bolivia	ACTIVE
ES-CL	Spanish - Chile	ACTIVE
ES-CO	Spanish - Colombia	ACTIVE
ES-CR	Spanish - Costa Rica	ACTIVE
ES-DO	Spanish - Dominican Republic	ACTIVE
ES-EC	Spanish - Ecuador	ACTIVE
ES-SV	Spanish - El Salvador	ACTIVE
ES-GT	Spanish - Guatemala	ACTIVE
ES-HN	Spanish - Honduras	ACTIVE
ES-MX	Spanish - Mexico	ACTIVE
ES-NI	Spanish - Nicaragua	ACTIVE
ES-PA	Spanish - Panama	ACTIVE
ES-PY	Spanish - Paraguay	ACTIVE
ES-PE	Spanish - Peru	ACTIVE
ES-PR	Spanish - Puerto Rico	ACTIVE
ES-ES	Spanish - Spain (Traditional)	ACTIVE
ES-UY	Spanish - Uruguay	ACTIVE
ES-VE	Spanish - Venezuela	ACTIVE
SW	Swahili	ACTIVE
SV-FI	Swedish - Finland	ACTIVE
SV-SE	Swedish - Sweden	ACTIVE
TG	Tajik	ACTIVE
TA	Tamil	ACTIVE
TT	Tatar	ACTIVE
TE	Telugu	ACTIVE
TH	Thai	ACTIVE
BO	Tibetan	ACTIVE
TS	Tsonga	ACTIVE
TR	Turkish	ACTIVE
TK	Turkmen	ACTIVE
UK	Ukrainian	ACTIVE
UTF-8	Unicode	ACTIVE
UR	Urdu	ACTIVE
UZ-UZ	Uzbek - Cyrillic	ACTIVE
VI	Vietnamese	ACTIVE
CY	Welsh	ACTIVE
XH	Xhosa	ACTIVE
YI	Yiddish	ACTIVE
ZU	Zulu	ACTIVE
\.


--
-- Data for Name: fclocale; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY fclocale (lc_code, lc_description, lc_primary_langcode, lc_tzcode) FROM stdin;
MYWP	Wilayah KL	EN-US	Asia/Kuala_Lumpur
\.


--
-- Data for Name: fclocaleholiday; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY fclocaleholiday (lch_id, lch_lccode, lch_date, lch_recurring, lch_description) FROM stdin;
13	MYWP	2012-01-01	Y	New Year
14	MYWP	2013-05-01	Y	Labour Day
15	MYWP	2014-08-10	N	Hari Raya
16	MYWP	2014-01-01	N	Haha Day
\.


--
-- Name: fclocaleholiday_lch_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fclocaleholiday_lch_id_seq', 16, true);


--
-- Data for Name: fclocaleworkinghour; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY fclocaleworkinghour (lcw_id, lcw_lccode, lcw_day, lcw_start_time, lcw_end_time) FROM stdin;
20	MYWP	Mon	09:00:00	18:00:00
21	MYWP	Tue	09:00:00	18:00:00
22	MYWP	Wed	09:00:00	18:00:00
23	MYWP	Thu	09:00:00	18:00:00
24	MYWP	Fri	09:00:00	18:00:00
25	MYWP	Sat	00:00:00	23:59:59
26	MYWP	Sun	00:00:00	23:59:59
\.


--
-- Name: fclocaleworkinghour_lcw_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fclocaleworkinghour_lcw_id_seq', 26, true);


--
-- Data for Name: fclog; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY fclog (log_id, log_created, log_cat, log_cat2, log_ref, log_ref2, log_ref3, log_desc, log_desc2) FROM stdin;
\.


--
-- Name: fclog_log_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fclog_log_id_seq', 1, false);


--
-- Data for Name: fclookup; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) FROM stdin;
JOBSTATUS	REQUIREMENT VERIFICATION	ROOT	REQUIREMENT VERIFICATION	ACTIVE	123
JOBSTATUS	PENDING ARTIST ACKNOWLEDGE JOB	ROOT	PENDING ARTIST ACKNOWLEDGE JOB	ACTIVE	124
JOBSTATUS	WORK IN PROGRESS	ROOT	WORK IN PROGRESS	ACTIVE	125
JOBSTATUS	PENDING QC CHECK	ROOT	PENDING QC CHECK	ACTIVE	126
JOBSTATUS	PENDING ACCEPTANCE	ROOT	PENDING ACCEPTANCE	ACTIVE	128
JOBSTATUS	COMPLETED	ROOT	COMPLETED	ACTIVE	129
JOBSTATUS	PENDING CUSTOMER RESOLUTION	ROOT	PENDING CUSTOMER RESOLUTION	ACTIVE	137
OUTPUTTYPE	IMGSETTLE	ROOT	Image settle	ACTIVE	138
OUTPUTTYPE	INKJET	ROOT	Inkjet film	ACTIVE	139
\.


--
-- Name: fclookup_lu_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fclookup_lu_id_seq', 139, true);


--
-- Data for Name: fcmenu; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode, mn_icon_class) FROM stdin;
88	SVHOME	1	Home (Supervisor)	ACTIVE	1000	\N	Y	Home	\N	supervisorhome	\N	\N	SUPHOME	fa fa-home
86	QCHOME	1	Home (QC)	ACTIVE	1000	\N	Y	Home	\N	qchome	\N	\N	QCHOME	fa fa-home
87	ARTHOME	1	Home (Artist)	ACTIVE	1000	\N	Y	Home	\N	artisthome	\N	\N	ARTHOME	fa fa-home
90	CUSTHOME	1	Home(Customer)	ACTIVE	1000	\N	Y	Home	\N	customerhome	\N	\N	CUSTHOME	fa fa-home
6	SETTING	1	Setting	ACTIVE	9000	\N	N	\N	\N	\N	\N	\N	POSBMENU	fa fa-wrench
91	ADMINSETUP	1	Admin Setup	ACTIVE	5000	\N	N	\N	\N	\N	\N	\N	ADMINSETTING	fa fa-wrench
103	TNC	106	Terms and Conditions	ACTIVE	5000	\N	Y	Setting	\N	tncsetup	\N	\N	\N	\N
92	ARTISTSETUP	107	Artist setup	ACTIVE	3000	\N	Y	Setting	\N	artistsetup	\N	\N	ADMINSETTING	\N
93	PNDUSERSETUP	107	User setting	ACTIVE	4000	\N	Y	Setting	\N	pndusersetting	\N	\N	ADMINSETTING	\N
1	HEADERMENU	0	Top Menu	ACTIVE	0		Y	\N	\N	\N	\N	\N	\N	\N
96	RULESETUP	6	Rule Setting	ACTIVE	3500	\N	Y	Rulebuilder	\N	setup	\N	\N	POSBMENU	\N
69	MENU	6	Menu Setup	ACTIVE	4400	\N	Y	Setting	\N	menusetup	\N	\N	POSBMENU	\N
50	PERMSETUP	82	Permission Setup	ACTIVE	4230	\N	Y	Setting		permsetting			POSBMENU	\N
51	ROLESETUP	82	Role Setup	ACTIVE	4220	\N	Y	Setting		rolesetting			POSBMENU	\N
83	LOOKUPSETUP	6	Lookup Setup	ACTIVE	2000	\N	Y	Setting	\N	lookupSetup	\N	\N	POSBMENU	\N
82	USERSETTING	6	POSB User Setting	ACTIVE	2000	\N	Y	\N	\N	\N	\N	\N	POSBMENU	\N
107	INTUSERSETTING	91	Internal user setup	ACTIVE	3000	\N	Y	\N	\N	\N	\N	\N	\N	\N
108	EXUSERSETTING	91	External user setup	ACTIVE	4000	\N	Y	\N	\N	\N	\N	\N	\N	\N
49	USERSETUP	82	POSB User Setup	ACTIVE	4210	\N	Y	Setting		usersetting			POSBMENU	\N
98	LOCALE	6	Locale Setup	ACTIVE	100	\N	Y	Setting	\N	localesetup	\N	\N	\N	\N
101	DBOSETUP	6	DBO Setup	ACTIVE	6500	\N	Y	Setting	\N	DBO	\N	\N	\N	\N
102	ADVTRANSLATE	6	Translation	ACTIVE	7000	\N	Y	Translate	\N	advanceTranslate	\N	\N	\N	\N
105	JOBSETUP	91	Job related setup	ACTIVE	1000	\N	Y	\N	\N	\N	\N	\N	\N	\N
84	JOBCATSETUP	105	Job category setup	ACTIVE	1000	\N	Y	Setting	\N	jobcatsetup	\N	\N	ADMINSETTING	\N
104	JOBOUTPUT	105	Job output setup	ACTIVE	1200	\N	Y	Setting	\N	joboutputsetup	\N	\N	ADMINSETTING	\N
85	CARTONSETUP	105	Carton setup	ACTIVE	2000	\N	Y	Setting	\N	cartonSetup	\N	\N	ADMINSETTING	\N
106	WFSETUP	91	Workflow related setup	ACTIVE	2000	\N	Y	\N	\N	\N	\N	\N	ADMINSETTING	\N
97	SLASETUP	106	SLA Setup	ACTIVE	2100	\N	Y	Setting	\N	timersetup	\N	\N	ADMINSETTING	\N
99	MAILTEMPLATE	105	Mail Template Setup	ACTIVE	3000	\N	Y	Setting	\N	mailtemplatesetup	\N	\N	\N	\N
95	MACHINESETUP	108	Customer machine setting	ACTIVE	2000	\N	Y	Setting	\N	machinesetup	\N	\N	ADMINSETTING	\N
94	CUSTOMERSETUP	108	Customer setup	ACTIVE	1000	\N	Y	Setting	\N	orgsetup	\N	\N	ADMINSETTING	\N
100	CONTACTSETUP	108	Contact Setup	ACTIVE	3000	\N	Y	Setting	\N	contactsetup	\N	\N	\N	\N
109	CUSTUSER	108	Customer user setup	ACTIVE	300	\N	Y	Setting	\N	custusersetting	\N	\N	ADMINSETTING	\N
\.


--
-- Name: fcmenu_mn_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcmenu_mn_id_seq', 109, true);


--
-- Name: fcmenu_mn_parentid_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcmenu_mn_parentid_seq', 6, true);


--
-- Data for Name: fcorg; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY fcorg (org_id, org_type, org_external, org_name, org_parentid, org_primaryid, org_address, org_contactno, org_status, org_lccode, org_concode) FROM stdin;
2	\N	Y	Carton box	0	\N	\N	\N	ACTIVE	\N	\N
3	\N	Y	Grand fortune	0	\N	\N	\N	ACTIVE	\N	\N
4	\N	Y	New box	0	\N	\N	\N	ACTIVE	\N	\N
5	\N	Y	Deswell	0	\N	\N	\N	ACTIVE	\N	\N
6	\N	Y	Darun	0	\N	\N	\N	ACTIVE	\N	\N
7	\N	Y	Harta	0	\N	\N	\N	ACTIVE	\N	\N
8	\N	Y	Genting 	0	\N	\N	\N	ACTIVE	\N	\N
1	\N	N	PND	0	\N	\N	\N	ACTIVE	\N	\N
10	\N	Y	Fong Corp	1	\N	Jalan Fong 1	0120120123	ACTIVE	\N	\N
9	\N	Y	UAT Customer 1	1	\N	1 Jln Customer	0123456789	ACTIVE	\N	\N
11	\N	Y	Uat Customer 2	1	\N	Jalan customer 2	012345678	ACTIVE	\N	\N
12	\N	Y	Uat Customer 3	1	\N	Jalan customer 3	123456789	ACTIVE	\N	\N
13	\N	Y	Uat Customer 4	1	\N	Jalan customer 4	012345678	ACTIVE	\N	\N
14	\N	Y	Uat Customer 5	1	\N	Jalan customer 5	1234	ACTIVE	\N	\N
15	\N	Y	Test new	1	\N	Test new	Test new	ACTIVE	\N	\N
\.


--
-- Name: fcorg_org_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcorg_org_id_seq', 15, true);


--
-- Data for Name: fcpermission; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY fcpermission (pms_code, pms_desc) FROM stdin;
MENU_REPORT	VIEW REPORT
MENU_SETTING	VIEW SETTINGS
REQUEST_NEWJOB	Request new job
QCHOME	View QC home
ARTHOME	View artist home
SUPHOME	View supervisor home
CUSTHOME	View customer home
ADMINSETTING	View Admin Setting
POSBMENU	For POSB Admin
ADMIN	IT Admin
SEARCH_PMC	Search PM Case
\.


--
-- Data for Name: fcpmactivity; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY fcpmactivity (pmat_id, pmat_pmwfid, pmat_pmslid, pmat_name, pmat_type, pmat_function, pmat_sla_interval, pmat_sla_workinghours_only, pmat_show_caseinfo, pmat_performed_message) FROM stdin;
7	1	\N	Notify Manager On Late Requirement Verification	SCRIPT	notifyLateVerification	\N	N	N	\N
8	1	\N	Notify Supervisor On Late Job Acknowledgement	SCRIPT	notifyLateAcknowledgement	\N	N	N	\N
11	1	\N	Notify Supervisor and Manager On Late WIP	SCRIPT	notifyLateWIP	\N	N	N	\N
12	1	\N	Notify Supervisor and Manager On Late QC Check	SCRIPT	notifyLateQC	\N	N	N	\N
13	1	\N	Auto Accept	SCRIPT	autoCustomerAccept	\N	N	N	\N
2	1	1	Pending resolution 	USER	pendingRevert	\N	Y	N	The job has successfully been sent back for verification.
4	1	3	Work in progress 	USER	wip	[[REQTIMEART]]	Y	Y	The job has successfully been sent to QC for verification.
10	1	3	Rework in progress	USER	wip	[[REQTIMEQC]]	Y	Y	The job has successfully been sent to QC for verification.
1	1	2	Requirement verification	USER	reqVerification	PT30M	Y	Y	The job has successfully been [[RVDEC_DISP]].
5	1	4	Pending check (QC)	USER	pendingQC	[[REQTIMEQC]]	Y	Y	The job has successfully been [[QCDEC_DISP]].
6	1	1	Pending acceptance	USER	pendingCust	PT24H	Y	Y	The job has successfully been [[CUSTDEC_DISP]].
9	1	2	Reassign Artist	USER	reassign	\N	Y	Y	The job has successfully been assigned to artist.
14	1	\N	Notify Customer Task Acknowledged	SCRIPT	notifyCustomerAck	\N	N	N	\N
\.


--
-- Name: fcpmactivity_pmat_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcpmactivity_pmat_id_seq', 14, true);


--
-- Data for Name: fcpmcase; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY fcpmcase (pmc_id, pmc_created_date, pmc_created_by, pmc_casekey, pmc_casetype, pmc_parentid, pmc_pmwfid, pmc_start_pmevid, pmc_start_date, pmc_end_pmevid, pmc_end_date, pmc_closed) FROM stdin;
106	2014-06-21 18:47:14+08	uat_cust1	59	jobsheet	\N	1	1	2014-06-21 18:47:14+08	\N	\N	N
104	2014-06-21 18:09:24+08	admin2	57	jobsheet	\N	1	1	2014-06-21 18:09:24+08	6	2014-06-21 19:04:48+08	Y
108	2014-06-21 21:57:49+08	uat_cust1	61	jobsheet	\N	1	1	2014-06-21 21:57:49+08	\N	\N	N
109	2014-06-21 22:17:31+08	esp_supervisor	62	jobsheet	\N	1	1	2014-06-21 22:17:31+08	\N	\N	N
110	2014-06-21 22:23:53+08	uat_cust1	63	jobsheet	\N	1	1	2014-06-21 22:23:53+08	\N	\N	N
107	2014-06-21 19:15:41+08	uat_cust1	60	jobsheet	\N	1	1	2014-06-21 19:15:41+08	6	2014-06-22 00:31:27+08	Y
111	2014-06-22 14:01:20+08	uat_supervisor1	64	jobsheet	\N	1	1	2014-06-22 14:01:20+08	\N	\N	N
112	2014-06-22 15:06:57+08	uat_cust1	65	jobsheet	\N	1	1	2014-06-22 15:06:57+08	\N	\N	N
113	2014-06-22 15:09:06+08	uat_cust1	66	jobsheet	\N	1	1	2014-06-22 15:09:06+08	\N	\N	N
115	2014-06-22 15:53:21+08	ysyow	68	jobsheet	\N	1	1	2014-06-22 15:53:21+08	\N	\N	N
116	2014-06-22 16:02:50+08	uat_customer1	69	jobsheet	\N	1	1	2014-06-22 16:02:50+08	\N	\N	N
114	2014-06-22 15:09:52+08	uat_cust1	67	jobsheet	\N	1	1	2014-06-22 15:09:52+08	6	2014-06-22 16:14:41+08	Y
117	2014-06-22 18:37:00+08	uat_customer1	70	jobsheet	\N	1	1	2014-06-22 18:37:00+08	\N	\N	N
118	2014-06-22 19:08:37+08	uat_customer1	71	jobsheet	\N	1	1	2014-06-22 19:08:37+08	\N	\N	N
121	2014-06-22 21:20:41+08	uat_customer2	74	jobsheet	\N	1	1	2014-06-22 21:20:41+08	\N	\N	N
122	2014-06-22 22:19:07+08	uat_customer3	75	jobsheet	\N	1	1	2014-06-22 22:19:07+08	\N	\N	N
123	2014-06-22 22:22:00+08	ysyow	76	jobsheet	\N	1	1	2014-06-22 22:22:00+08	\N	\N	N
124	2014-06-22 22:25:19+08	uat_customer3	77	jobsheet	\N	1	1	2014-06-22 22:25:19+08	\N	\N	N
125	2014-06-22 22:25:20+08	ysyow	78	jobsheet	\N	1	1	2014-06-22 22:25:20+08	\N	\N	N
126	2014-06-22 22:26:19+08	ysyow	79	jobsheet	\N	1	1	2014-06-22 22:26:19+08	\N	\N	N
127	2014-06-22 22:27:13+08	ysyow	80	jobsheet	\N	1	1	2014-06-22 22:27:13+08	\N	\N	N
128	2014-06-22 22:29:53+08	ysyow	81	jobsheet	\N	1	1	2014-06-22 22:29:53+08	\N	\N	N
129	2014-06-22 22:34:15+08	ysyow	82	jobsheet	\N	1	1	2014-06-22 22:34:15+08	\N	\N	N
130	2014-06-22 22:42:05+08	uat_customer3	83	jobsheet	\N	1	1	2014-06-22 22:42:05+08	\N	\N	N
119	2014-06-22 19:09:29+08	uat_customer1	72	jobsheet	\N	1	1	2014-06-22 19:09:29+08	6	2014-06-23 00:23:17+08	Y
131	2014-06-24 17:17:18+08	ysyow	84	jobsheet	\N	1	1	2014-06-24 17:17:18+08	\N	\N	N
133	2014-06-24 18:38:42+08	ysyow	111	jobsheet	\N	1	1	2014-06-24 18:38:42+08	\N	\N	N
134	2014-06-24 18:41:09+08	ysyow	112	jobsheet	\N	1	1	2014-06-24 18:41:09+08	\N	\N	N
135	2014-06-24 18:47:11+08	uat_customer1	113	jobsheet	\N	1	1	2014-06-24 18:47:11+08	\N	\N	N
137	2014-06-25 17:47:27+08	uat_customer4	115	jobsheet	\N	1	1	2014-06-25 17:47:27+08	\N	\N	N
139	2014-06-25 18:09:59+08	uat_customer4	117	jobsheet	\N	1	1	2014-06-25 18:09:59+08	\N	\N	N
140	2014-06-25 18:17:21+08	ysyow	118	jobsheet	\N	1	1	2014-06-25 18:17:21+08	\N	\N	N
138	2014-06-25 18:03:36+08	uat_customer4	116	jobsheet	\N	1	1	2014-06-25 18:03:36+08	6	2014-06-25 18:30:17+08	Y
141	2014-06-26 11:01:54+08	uat_customer4	119	jobsheet	\N	1	1	2014-06-26 11:01:54+08	\N	\N	N
142	2014-06-26 16:27:30+08	ysyow	120	jobsheet	\N	1	1	2014-06-26 16:27:30+08	\N	\N	N
143	2014-06-30 14:43:13+08	admin	121	jobsheet	\N	1	1	2014-06-30 14:43:13+08	\N	\N	N
105	2014-06-21 18:45:26+08	uat_cust1	58	jobsheet	\N	1	1	2014-06-21 18:45:26+08	6	2014-07-01 05:43:30+08	Y
136	2014-06-24 19:06:51+08	uat_customer1	114	jobsheet	\N	1	1	2014-06-24 19:06:51+08	6	2014-07-01 05:43:30+08	Y
144	2014-07-01 17:16:12+08	uat_customer1	122	jobsheet	\N	1	1	2014-07-01 17:16:12+08	\N	\N	N
145	2014-07-01 23:03:33+08	uat_customer4	123	jobsheet	\N	1	1	2014-07-01 23:03:33+08	\N	\N	N
146	2014-07-03 12:42:16+08	uat_customer1	124	jobsheet	\N	1	1	2014-07-03 12:42:16+08	\N	\N	N
147	2014-07-03 12:43:59+08	uat_customer1	125	jobsheet	\N	1	1	2014-07-03 12:43:59+08	\N	\N	N
\.


--
-- Name: fcpmcase_pmc_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcpmcase_pmc_id_seq', 147, true);


--
-- Data for Name: fcpmcasecomment; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) FROM stdin;
168	104	\N	2014-06-21 18:09:24+08	admin2	Nice job	\N	\N	\N	N	633
169	104	\N	2014-06-21 18:14:16+08	supervisor	work hard pls	\N	\N	\N	N	634
170	104	\N	2014-06-21 18:40:52+08	artist1	gaodim	\N	\N	\N	N	640
171	106	\N	2014-06-21 18:47:14+08	uat_cust1	customer remark is rubbish	\N	\N	\N	N	644
172	104	\N	2014-06-21 18:59:30+08	qc	QC ok	\N	\N	\N	N	641
173	104	\N	2014-06-21 19:04:48+08	admin2	nice work	\N	\N	\N	N	647
174	107	\N	2014-06-21 19:15:41+08	uat_cust1	Test remark	\N	\N	\N	N	650
175	106	\N	2014-06-21 20:36:02+08	uat_supervisor1	first colour change to 333	\N	\N	\N	N	645
176	106	175	2014-06-21 20:48:26+08	uat_cust1	Okay... I will change it now!	\N	\N	\N	N	656
177	107	\N	2014-06-21 21:06:53+08	uat_supervisor1	colour changed to 333	\N	\N	\N	N	651
178	107	\N	2014-06-21 21:29:48+08	uat_supervisor1	urgent case... do it ASAP	\N	\N	\N	N	660
179	107	\N	2014-06-21 21:48:33+08	uat_artist1	for fong to test	\N	\N	\N	N	666
180	108	\N	2014-06-21 21:57:49+08	uat_cust1	123	\N	\N	\N	N	668
181	109	\N	2014-06-21 22:17:31+08	esp_supervisor	12313	\N	\N	\N	N	686
182	110	\N	2014-06-21 22:24:34+08	uat_supervisor1	urgent please process as soon as possible	\N	\N	\N	N	689
183	105	\N	2014-06-21 22:50:34+08	uat_artist1	This is completed	\N	\N	\N	N	685
184	105	\N	2014-06-21 23:21:50+08	uat_qc1	123	\N	\N	\N	N	702
185	108	\N	2014-06-21 23:30:54+08	uat_qc1	need to redo this thing.. a pile of rubbish!!!!	\N	\N	\N	N	701
186	105	\N	2014-06-21 23:45:22+08	uat_artist1	this is an amended artwork	\N	\N	\N	N	704
187	107	\N	2014-06-22 00:08:36+08	uat_qc1	Work is done. Hope you like it.	\N	\N	\N	N	667
188	105	\N	2014-06-22 00:09:16+08	uat_qc1	The work is done. Hope you like it <3	\N	\N	\N	N	707
189	107	\N	2014-06-22 00:31:27+08	uat_cust1	good to go	\N	\N	\N	N	714
190	105	\N	2014-06-22 00:34:23+08	uat_cust1	this case really have to be rework. I don't like the colour...	\N	\N	\N	N	716
191	111	\N	2014-06-22 14:02:47+08	uat_supervisor1	Please do this first... ad hoc urgent case	\N	\N	\N	N	738
192	116	\N	2014-06-22 16:02:50+08	uat_customer1	1234	\N	\N	\N	N	767
193	114	\N	2014-06-22 16:14:30+08	qc	ok	\N	\N	\N	N	794
194	116	\N	2014-06-22 18:27:32+08	uat_supervisor1	This is something wrong!!	\N	\N	\N	N	768
195	117	\N	2014-06-22 18:37:00+08	uat_customer1	Customer remark...中文	\N	\N	\N	N	801
196	117	\N	2014-06-22 18:40:11+08	uat_supervisor1	你错了！	\N	\N	\N	N	802
197	118	\N	2014-06-22 19:08:37+08	uat_customer1	1231	\N	\N	\N	N	816
198	119	\N	2014-06-22 19:09:29+08	uat_customer1	1231	\N	\N	\N	N	818
199	119	\N	2014-06-22 19:17:50+08	uat_supervisor1	Revert!!!!!!!!错错错！	\N	\N	\N	N	819
200	119	\N	2014-06-22 21:14:50+08	uat_supervisor1	中文。。。。。	\N	\N	\N	N	822
201	119	\N	2014-06-22 21:34:06+08	uat_artist1	Artwork...	\N	\N	\N	N	830
202	121	\N	2014-06-22 22:06:19+08	uat_supervisor2	test test	\N	\N	\N	N	832
203	122	\N	2014-06-22 22:19:07+08	uat_customer3	123	\N	\N	\N	N	843
204	122	\N	2014-06-22 22:38:04+08	uat_supervisor2	pls fast	\N	\N	\N	N	844
205	123	\N	2014-06-22 22:41:20+08	uat_artist2	perfect	\N	\N	\N	N	872
206	130	\N	2014-06-22 22:42:06+08	uat_customer3	123	\N	\N	\N	N	874
207	123	\N	2014-06-22 22:42:50+08	uat_qc2	Incomplete job	\N	\N	\N	N	873
208	130	\N	2014-06-22 23:00:58+08	uat_supervisor3	lala	\N	\N	\N	N	875
209	130	\N	2014-06-22 23:02:14+08	uat_qc3	ReverT!!!	\N	\N	\N	N	884
210	135	\N	2014-06-24 18:47:11+08	uat_customer1	12341	\N	\N	\N	N	935
211	135	\N	2014-06-24 19:01:40+08	uat_supervisor1	Testing	\N	\N	\N	N	936
212	135	\N	2014-06-24 19:02:27+08	uat_artist1	1234	\N	\N	\N	N	942
213	135	\N	2014-06-24 19:02:49+08	uat_qc1	1233	\N	\N	\N	N	943
214	135	\N	2014-06-24 19:03:32+08	uat_customer1	1234	\N	\N	\N	N	945
215	135	\N	2014-06-24 19:03:52+08	uat_supervisor1	1234	\N	\N	\N	N	947
216	105	\N	2014-06-24 19:04:28+08	uat_artist1	1241	\N	\N	\N	N	736
217	105	\N	2014-06-24 19:05:17+08	uat_qc1	12341	\N	\N	\N	N	954
218	136	\N	2014-06-24 19:06:51+08	uat_customer1	123	\N	\N	\N	N	957
219	136	\N	2014-06-24 19:07:13+08	uat_supervisor1	12	\N	\N	\N	N	958
220	136	\N	2014-06-24 19:07:39+08	uat_artist1	123	\N	\N	\N	N	964
221	136	\N	2014-06-24 19:08:52+08	uat_qc1	123	\N	\N	\N	N	965
222	137	\N	2014-06-25 17:47:27+08	uat_customer4	Customer 1	\N	\N	\N	N	968
223	138	\N	2014-06-25 18:03:36+08	uat_customer4	lalala	\N	\N	\N	N	970
224	139	\N	2014-06-25 18:09:59+08	uat_customer4	12341	\N	\N	\N	N	972
225	137	\N	2014-06-25 18:21:00+08	uat_supervisor4	Must have remark!!	\N	\N	\N	N	969
226	138	\N	2014-06-25 18:21:17+08	uat_supervisor4	Assign to artist 4	\N	\N	\N	N	971
227	138	\N	2014-06-25 18:25:26+08	uat_artist4	Job finished!!	\N	\N	\N	N	983
228	138	\N	2014-06-25 18:27:41+08	uat_qc1	QC passed!!	\N	\N	\N	N	984
229	137	\N	2014-06-25 18:28:59+08	uat_customer4	updated remark	\N	\N	\N	N	977
230	138	\N	2014-06-25 18:30:17+08	uat_customer4	ACCEPT!!	\N	\N	\N	N	986
231	141	\N	2014-06-26 11:01:54+08	uat_customer4	rar file	\N	\N	\N	N	990
232	141	\N	2014-06-26 11:16:18+08	uat_supervisor2	1234	\N	\N	\N	N	991
233	142	\N	2014-06-26 16:27:30+08	ysyow	Hahaa	\N	\N	\N	N	998
234	142	\N	2014-06-26 16:33:00+08	supervisor	Ok man	\N	\N	\N	N	999
235	143	\N	2014-06-30 14:44:38+08	supervisor	asddsadas	\N	\N	\N	N	1008
236	143	\N	2014-06-30 14:46:46+08	artist2	asddsa	\N	\N	\N	N	1015
237	140	\N	2014-07-01 17:43:12+08	uat_supervisor1	Pls fill up the size	\N	\N	\N	N	975
238	139	\N	2014-07-01 17:43:57+08	uat_supervisor1	Pls do it fast	\N	\N	\N	N	973
239	134	\N	2014-07-01 17:48:19+08	uat_supervisor1	weweasd	\N	\N	\N	N	934
240	139	\N	2014-07-01 18:20:51+08	uat_artist1	done	\N	\N	\N	N	1097
241	143	\N	2014-07-01 18:44:26+08	uat_qc2	Smooth job	\N	\N	\N	N	1016
242	139	\N	2014-07-01 18:46:16+08	uat_qc2	Incomplete job	\N	\N	\N	N	1098
243	145	\N	2014-07-01 23:03:33+08	uat_customer4	okie okie	\N	\N	\N	N	1103
244	146	\N	2014-07-03 12:42:16+08	uat_customer1	1234	\N	\N	\N	N	1105
245	146	\N	2014-07-03 12:42:54+08	uat_supervisor1	12341	\N	\N	\N	N	1106
246	147	\N	2014-07-03 12:43:59+08	uat_customer1	12341	\N	\N	\N	N	1114
247	147	\N	2014-07-03 12:44:21+08	uat_supervisor1	123	\N	\N	\N	N	1115
\.


--
-- Name: fcpmcasecomment_pmcc_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcpmcasecomment_pmcc_id_seq', 247, true);


--
-- Data for Name: fcpmcasecommentread; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) FROM stdin;
167	168	supervisor	2014-06-21 18:14:09+08
168	168	artist1	2014-06-21 18:14:25+08
169	169	artist1	2014-06-21 18:14:25+08
170	168	qc	2014-06-21 18:54:53+08
171	169	qc	2014-06-21 18:54:53+08
172	170	qc	2014-06-21 18:54:53+08
173	168	admin2	2014-06-21 19:05:17+08
174	169	admin2	2014-06-21 19:05:17+08
175	170	admin2	2014-06-21 19:05:17+08
176	172	admin2	2014-06-21 19:05:17+08
177	173	admin2	2014-06-21 19:05:17+08
178	174	uat_supervisor1	2014-06-21 19:18:40+08
179	171	uat_supervisor1	2014-06-21 19:18:46+08
180	171	uat_cust1	2014-06-21 20:47:40+08
181	175	uat_cust1	2014-06-21 20:47:40+08
182	176	uat_cust1	2014-06-21 20:48:26+08
183	174	uat_cust1	2014-06-21 21:07:20+08
184	177	uat_cust1	2014-06-21 21:07:20+08
185	177	uat_supervisor1	2014-06-21 21:27:35+08
186	175	uat_supervisor1	2014-06-21 21:27:35+08
187	176	uat_supervisor1	2014-06-21 21:27:35+08
188	174	uat_artist1	2014-06-21 21:38:19+08
189	177	uat_artist1	2014-06-21 21:38:19+08
190	178	uat_artist1	2014-06-21 21:38:19+08
191	180	uat_supervisor1	2014-06-21 21:58:14+08
192	182	uat_supervisor1	2014-06-21 22:31:50+08
193	180	uat_artist1	2014-06-21 22:42:39+08
194	174	uat_qc1	2014-06-21 23:01:18+08
195	177	uat_qc1	2014-06-21 23:01:18+08
196	178	uat_qc1	2014-06-21 23:01:18+08
197	179	uat_qc1	2014-06-21 23:01:18+08
198	180	uat_qc1	2014-06-21 23:25:28+08
199	183	uat_qc1	2014-06-21 23:52:03+08
200	184	uat_qc1	2014-06-21 23:52:03+08
201	186	uat_qc1	2014-06-21 23:52:03+08
202	178	uat_cust1	2014-06-22 00:31:24+08
203	179	uat_cust1	2014-06-22 00:31:24+08
204	187	uat_cust1	2014-06-22 00:31:24+08
205	183	uat_supervisor1	2014-06-22 00:34:46+08
206	184	uat_supervisor1	2014-06-22 00:34:46+08
207	186	uat_supervisor1	2014-06-22 00:34:46+08
208	188	uat_supervisor1	2014-06-22 00:34:46+08
209	190	uat_supervisor1	2014-06-22 00:34:46+08
210	181	supervisor	2014-06-22 16:44:55+08
211	192	supervisor	2014-06-22 16:45:06+08
212	191	supervisor	2014-06-22 16:45:09+08
213	169	supervisor	2014-06-22 16:45:54+08
214	170	supervisor	2014-06-22 16:45:54+08
215	172	supervisor	2014-06-22 16:45:54+08
216	173	supervisor	2014-06-22 16:45:54+08
217	192	uat_supervisor1	2014-06-22 18:23:52+08
218	168	ysyow	2014-06-22 18:25:43+08
219	169	ysyow	2014-06-22 18:25:43+08
220	170	ysyow	2014-06-22 18:25:43+08
221	172	ysyow	2014-06-22 18:25:43+08
222	173	ysyow	2014-06-22 18:25:43+08
223	195	uat_supervisor1	2014-06-22 18:39:58+08
224	195	uat_customer1	2014-06-22 19:05:18+08
225	196	uat_customer1	2014-06-22 19:05:18+08
226	198	uat_customer1	2014-06-22 19:18:21+08
227	199	uat_customer1	2014-06-22 19:18:21+08
228	198	uat_supervisor1	2014-06-22 21:14:29+08
229	199	uat_supervisor1	2014-06-22 21:14:29+08
230	198	uat_artist1	2014-06-22 21:15:32+08
231	199	uat_artist1	2014-06-22 21:15:32+08
232	200	uat_artist1	2014-06-22 21:15:32+08
233	181	uat_supervisor2	2014-06-22 22:05:55+08
234	195	uat_supervisor2	2014-06-22 22:06:00+08
235	196	uat_supervisor2	2014-06-22 22:06:00+08
236	197	uat_supervisor2	2014-06-22 22:06:08+08
237	202	uat_supervisor2	2014-06-22 22:06:19+08
238	223	uat_supervisor4	2014-06-25 18:16:07+08
239	223	uat_artist4	2014-06-25 18:21:56+08
240	226	uat_artist4	2014-06-25 18:21:56+08
241	181	uat_supervisor1	2014-07-03 14:02:22+08
\.


--
-- Name: fcpmcasecommentread_pmcr_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcpmcasecommentread_pmcr_id_seq', 241, true);


--
-- Data for Name: fcpmcaseflag; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY fcpmcaseflag (pmcf_id, pmcf_pmcid, pmcf_flag_by, pmcf_flag_date, pmcf_flag_type) FROM stdin;
39	104	artist1	2014-06-21 18:37:57+08	blue
40	104	ysyow	2014-06-22 19:25:12+08	yellow
43	112	supervisor	2014-06-22 22:48:02+08	red
44	117	supervisor	2014-06-22 22:50:38+08	blue
42	109	supervisor	2014-06-22 23:13:13+08	green
\.


--
-- Name: fcpmcaseflag_pmcf_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcpmcaseflag_pmcf_id_seq', 44, true);


--
-- Data for Name: fcpmcaseflow; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) FROM stdin;
650	107	1	PM_Event	\N	\N	2014-06-21 19:15:41+08	2014-06-21 19:15:41+08	DONE	\N	2014-06-21 19:15:41+08	uat_cust1	650	N	\N	\N	\N
643	105	1	PM_Activity	642	1	2014-06-21 18:45:26+08	2014-06-21 22:05:36+08	DONE	2014-06-23 09:30:00+08	2014-06-21 22:05:36+08	uat_supervisor1	643	N	\N	2014-06-23 09:30:00+08	\N
657	106	1	PM_Activity	656	7	2014-06-21 21:03:12+08	2014-06-21 22:05:14+08	DONE	2014-06-21 21:33:12+08	2014-06-21 22:05:14+08	uat_supervisor1	657	N	\N	2014-06-21 21:33:12+08	\N
662	107	2	PM_Gateway	661	4	2014-06-21 21:29:48+08	2014-06-21 21:29:48+08	DONE	\N	2014-06-21 21:29:48+08	uat_supervisor1	662	N	\N	\N	\N
670	106	1	PM_Gateway	657	2	2014-06-21 22:05:14+08	2014-06-21 22:05:14+08	DONE	\N	2014-06-21 22:05:14+08	uat_supervisor1	670	N	\N	\N	\N
653	107	7	PM_Activity	651	27	2014-06-21 19:56:37+08	2014-06-21 19:56:37+08	DONE	\N	2014-06-21 19:56:37+08	ysyow	653	N	\N	\N	\N
681	105	3	PM_Event	679	6	2014-06-21 22:05:36+08	2014-06-21 22:06:07+08	INTERRUPT	\N	2014-06-21 22:05:36+08	uat_artist1	680	Y	2014-06-21 22:05:36+08	2014-06-21 22:35:36+08	\N
654	107	5	PM_Event	653	28	2014-06-21 19:56:37+08	2014-06-21 19:56:37+08	END	\N	2014-06-21 19:56:37+08	ysyow	654	N	\N	\N	\N
671	106	2	PM_Gateway	670	4	2014-06-21 22:05:14+08	2014-06-21 22:05:14+08	DONE	\N	2014-06-21 22:05:14+08	uat_supervisor1	671	N	\N	\N	\N
633	104	1	PM_Event	\N	\N	2014-06-21 18:09:24+08	2014-06-21 18:09:24+08	DONE	\N	2014-06-21 18:09:24+08	admin2	633	N	\N	\N	\N
645	106	1	PM_Activity	644	1	2014-06-21 18:47:14+08	2014-06-21 20:36:02+08	DONE	2014-06-23 09:30:00+08	2014-06-21 20:36:02+08	uat_supervisor1	645	N	\N	2014-06-23 09:30:00+08	\N
634	104	1	PM_Activity	633	1	2014-06-21 18:09:24+08	2014-06-21 18:14:16+08	DONE	2014-06-23 09:30:00+08	2014-06-21 18:14:16+08	supervisor	634	N	\N	2014-06-23 09:30:00+08	\N
635	104	1	PM_Gateway	634	2	2014-06-21 18:14:16+08	2014-06-21 18:14:16+08	DONE	\N	2014-06-21 18:14:16+08	supervisor	635	N	\N	\N	\N
655	106	1	PM_Gateway	645	2	2014-06-21 20:36:02+08	2014-06-21 20:36:02+08	DONE	\N	2014-06-21 20:36:02+08	uat_supervisor1	655	N	\N	\N	\N
636	104	2	PM_Gateway	635	4	2014-06-21 18:14:16+08	2014-06-21 18:14:16+08	DONE	\N	2014-06-21 18:14:16+08	supervisor	636	N	\N	\N	\N
638	104	3	PM_Event	636	6	2014-06-21 18:14:16+08	2014-06-21 18:38:00+08	INTERRUPT	\N	2014-06-21 18:14:16+08	artist1	637	Y	2014-06-21 18:14:16+08	2014-06-23 09:30:00+08	\N
678	105	1	PM_Gateway	643	2	2014-06-21 22:05:36+08	2014-06-21 22:05:36+08	DONE	\N	2014-06-21 22:05:36+08	uat_supervisor1	678	N	\N	\N	\N
637	104	2	PM_Event	636	5	2014-06-21 18:14:16+08	2014-06-21 18:38:00+08	DONE	\N	2014-06-21 18:38:00+08	artist1	637	Y	\N	\N	\N
639	104	4	PM_Gateway	637	14	2014-06-21 18:38:00+08	2014-06-21 18:38:00+08	DONE	\N	2014-06-21 18:38:00+08	artist1	639	N	\N	\N	\N
656	106	2	PM_Activity	655	3	2014-06-21 20:36:02+08	2014-06-21 21:03:12+08	DONE	\N	2014-06-21 21:03:12+08	uat_cust1	656	N	\N	\N	\N
640	104	4	PM_Activity	639	15	2014-06-21 18:38:00+08	2014-06-21 18:40:52+08	DONE	2014-06-23 11:00:00+08	2014-06-21 18:40:52+08	artist1	640	N	\N	2014-06-23 11:00:00+08	\N
642	105	1	PM_Event	\N	\N	2014-06-21 18:45:26+08	2014-06-21 18:45:26+08	DONE	\N	2014-06-21 18:45:26+08	uat_cust1	642	N	\N	\N	\N
644	106	1	PM_Event	\N	\N	2014-06-21 18:47:14+08	2014-06-21 18:47:14+08	DONE	\N	2014-06-21 18:47:14+08	uat_cust1	644	N	\N	\N	\N
664	107	3	PM_Event	662	6	2014-06-21 21:29:48+08	2014-06-21 21:48:06+08	INTERRUPT	\N	2014-06-21 21:29:48+08	uat_artist1	663	Y	2014-06-21 21:29:48+08	2014-06-21 21:59:48+08	\N
641	104	5	PM_Activity	640	17	2014-06-21 18:40:52+08	2014-06-21 18:59:30+08	DONE	2014-06-21 18:50:30+08	2014-06-21 18:59:30+08	qc	641	N	\N	2014-06-23 09:40:00+08	\N
651	107	1	PM_Activity	650	1	2014-06-21 19:15:41+08	2014-06-21 21:06:53+08	DONE	2014-06-21 19:45:41+08	2014-06-21 21:06:53+08	uat_supervisor1	651	N	2014-06-21 19:56:37+08	2014-06-21 20:26:37+08	2
663	107	2	PM_Event	662	5	2014-06-21 21:29:48+08	2014-06-21 21:48:06+08	DONE	\N	2014-06-21 21:48:06+08	uat_artist1	663	Y	\N	\N	\N
646	104	5	PM_Gateway	641	18	2014-06-21 18:59:30+08	2014-06-21 18:59:30+08	DONE	\N	2014-06-21 18:59:30+08	qc	646	N	\N	\N	\N
658	107	1	PM_Gateway	651	2	2014-06-21 21:06:53+08	2014-06-21 21:06:53+08	DONE	\N	2014-06-21 21:06:53+08	uat_supervisor1	658	N	\N	\N	\N
647	104	6	PM_Activity	646	23	2014-06-21 18:59:30+08	2014-06-21 19:04:48+08	DONE	2014-06-25 15:00:00+08	2014-06-21 19:04:48+08	admin2	647	N	\N	2014-06-24 09:00:00+08	\N
685	105	4	PM_Activity	684	15	2014-06-21 22:06:07+08	2014-06-21 22:50:35+08	DONE	2014-06-23 09:06:08+08	2014-06-21 22:50:34+08	uat_artist1	685	N	\N	2014-06-23 09:06:08+08	\N
648	104	6	PM_Gateway	647	24	2014-06-21 19:04:48+08	2014-06-21 19:04:48+08	DONE	\N	2014-06-21 19:04:48+08	admin2	648	N	\N	\N	\N
659	107	2	PM_Activity	658	3	2014-06-21 21:06:53+08	2014-06-21 21:07:27+08	DONE	\N	2014-06-21 21:07:27+08	uat_cust1	659	N	\N	\N	\N
649	104	6	PM_Event	648	25	2014-06-21 19:04:48+08	2014-06-21 19:04:48+08	END	\N	2014-06-21 19:04:48+08	admin2	649	N	\N	\N	\N
665	107	4	PM_Gateway	663	14	2014-06-21 21:48:06+08	2014-06-21 21:48:07+08	DONE	\N	2014-06-21 21:48:07+08	uat_artist1	665	N	\N	\N	\N
679	105	2	PM_Gateway	678	4	2014-06-21 22:05:36+08	2014-06-21 22:05:36+08	DONE	\N	2014-06-21 22:05:36+08	uat_supervisor1	679	N	\N	\N	\N
669	108	1	PM_Activity	668	1	2014-06-21 21:57:49+08	2014-06-21 22:05:26+08	DONE	2014-06-21 22:27:49+08	2014-06-21 22:05:26+08	uat_supervisor1	669	N	\N	2014-06-21 22:27:49+08	\N
666	107	4	PM_Activity	665	15	2014-06-21 21:48:07+08	2014-06-21 21:48:33+08	DONE	2014-06-21 23:18:07+08	2014-06-21 21:48:33+08	uat_artist1	666	N	\N	2014-06-21 23:18:07+08	\N
660	107	1	PM_Activity	659	7	2014-06-21 21:07:27+08	2014-06-21 21:29:48+08	DONE	2014-06-21 21:37:27+08	2014-06-21 21:29:48+08	uat_supervisor1	660	N	\N	2014-06-21 21:37:27+08	\N
661	107	1	PM_Gateway	660	2	2014-06-21 21:29:48+08	2014-06-21 21:29:48+08	DONE	\N	2014-06-21 21:29:48+08	uat_supervisor1	661	N	\N	\N	\N
674	108	1	PM_Gateway	669	2	2014-06-21 22:05:26+08	2014-06-21 22:05:26+08	DONE	\N	2014-06-21 22:05:26+08	uat_supervisor1	674	N	\N	\N	\N
668	108	1	PM_Event	\N	\N	2014-06-21 21:57:49+08	2014-06-21 21:57:49+08	DONE	\N	2014-06-21 21:57:49+08	uat_cust1	668	N	\N	\N	\N
680	105	2	PM_Event	679	5	2014-06-21 22:05:36+08	2014-06-21 22:06:07+08	DONE	\N	2014-06-21 22:06:07+08	uat_artist1	680	Y	\N	\N	\N
675	108	2	PM_Gateway	674	4	2014-06-21 22:05:26+08	2014-06-21 22:05:26+08	DONE	\N	2014-06-21 22:05:26+08	uat_supervisor1	675	N	\N	\N	\N
677	108	3	PM_Event	675	6	2014-06-21 22:05:26+08	2014-06-21 22:06:07+08	INTERRUPT	\N	2014-06-21 22:05:26+08	uat_artist1	676	Y	2014-06-21 22:05:26+08	2014-06-21 22:35:26+08	\N
688	110	1	PM_Event	\N	\N	2014-06-21 22:23:53+08	2014-06-21 22:23:53+08	DONE	\N	2014-06-21 22:23:53+08	uat_cust1	688	N	\N	\N	\N
684	105	4	PM_Gateway	680	14	2014-06-21 22:06:07+08	2014-06-21 22:06:07+08	DONE	\N	2014-06-21 22:06:07+08	uat_artist1	684	N	\N	\N	\N
676	108	2	PM_Event	675	5	2014-06-21 22:05:26+08	2014-06-21 22:06:07+08	DONE	\N	2014-06-21 22:06:07+08	uat_artist1	676	Y	\N	\N	\N
682	108	4	PM_Gateway	676	14	2014-06-21 22:06:07+08	2014-06-21 22:06:07+08	DONE	\N	2014-06-21 22:06:07+08	uat_artist1	682	N	\N	\N	\N
686	109	1	PM_Event	\N	\N	2014-06-21 22:17:31+08	2014-06-21 22:17:31+08	DONE	\N	2014-06-21 22:17:31+08	esp_supervisor	686	N	\N	\N	\N
690	110	1	PM_Gateway	689	2	2014-06-21 22:24:34+08	2014-06-21 22:24:34+08	DONE	\N	2014-06-21 22:24:34+08	uat_supervisor1	690	N	\N	\N	\N
689	110	1	PM_Activity	688	1	2014-06-21 22:23:53+08	2014-06-21 22:24:34+08	DONE	2014-06-21 22:53:53+08	2014-06-21 22:24:34+08	uat_supervisor1	689	N	\N	2014-06-21 22:53:53+08	\N
691	110	2	PM_Gateway	690	4	2014-06-21 22:24:34+08	2014-06-21 22:24:34+08	DONE	\N	2014-06-21 22:24:34+08	uat_supervisor1	691	N	\N	\N	\N
693	110	3	PM_Event	691	6	2014-06-21 22:24:34+08	2014-06-21 22:27:03+08	DONE	\N	2014-06-21 22:27:03+08	ysyow	693	Y	2014-06-21 22:27:03+08	2014-06-21 22:25:34+08	1
692	110	2	PM_Event	691	5	2014-06-21 22:24:34+08	2014-06-21 22:27:03+08	INTERRUPT	\N	\N	ysyow	693	Y	\N	\N	\N
694	107	12	PM_Activity	667	30	2014-06-21 22:27:03+08	2014-06-21 22:27:03+08	DONE	\N	2014-06-21 22:27:03+08	ysyow	694	N	\N	\N	\N
695	107	5	PM_Event	694	22	2014-06-21 22:27:03+08	2014-06-21 22:27:03+08	END	\N	2014-06-21 22:27:03+08	ysyow	695	N	\N	\N	\N
672	106	2	PM_Event	671	5	2014-06-21 22:05:14+08	2014-06-22 13:34:43+08	DONE	\N	2014-06-22 13:34:43+08	uat_artist1	672	Y	\N	\N	\N
696	110	8	PM_Activity	693	8	2014-06-21 22:27:03+08	2014-06-21 22:27:03+08	DONE	\N	2014-06-21 22:27:03+08	ysyow	696	N	\N	\N	\N
667	107	5	PM_Activity	666	17	2014-06-21 21:48:33+08	2014-06-22 00:08:36+08	DONE	2014-06-21 22:18:33+08	2014-06-22 00:08:36+08	uat_qc1	667	N	2014-06-21 22:27:03+08	2014-06-21 22:57:03+08	1
717	107	6	PM_Gateway	714	24	2014-06-22 00:31:27+08	2014-06-22 00:31:27+08	DONE	\N	2014-06-22 00:31:27+08	uat_cust1	717	N	\N	\N	\N
697	110	3	PM_Gateway	696	9	2014-06-21 22:27:03+08	2014-06-21 22:27:03+08	DONE	\N	2014-06-21 22:27:03+08	ysyow	697	N	\N	\N	\N
698	110	2	PM_Event	697	10	2014-06-21 22:27:03+08	2014-06-21 22:27:53+08	INTERRUPT	\N	\N	uat_supervisor1	699	Y	\N	\N	\N
699	110	4	PM_Event	697	11	2014-06-21 22:27:03+08	2014-06-21 22:27:53+08	DONE	\N	2014-06-21 22:27:53+08	uat_supervisor1	699	Y	\N	\N	\N
723	105	2	PM_Event	722	5	2014-06-22 13:34:05+08	2014-06-22 13:39:03+08	INTERRUPT	2014-06-22 13:35:05+08	\N	admin	724	Y	\N	\N	\N
683	108	4	PM_Activity	682	15	2014-06-21 22:06:07+08	2014-06-21 22:48:52+08	DONE	2014-06-21 22:36:07+08	2014-06-21 22:48:52+08	uat_artist1	683	N	\N	2014-06-21 22:36:07+08	\N
718	107	6	PM_Event	717	25	2014-06-22 00:31:27+08	2014-06-22 00:31:27+08	END	\N	2014-06-22 00:31:27+08	uat_cust1	718	N	\N	\N	\N
742	111	3	PM_Event	740	6	2014-06-22 14:02:47+08	2014-06-22 14:21:26+08	DONE	\N	2014-06-22 14:21:26+08	admin	742	Y	2014-06-22 14:21:26+08	2014-06-22 14:03:47+08	1
702	105	5	PM_Activity	685	17	2014-06-21 22:50:35+08	2014-06-21 23:21:50+08	DONE	2014-06-21 23:30:35+08	2014-06-21 23:21:50+08	uat_qc1	702	N	\N	2014-06-21 23:30:35+08	\N
724	105	3	PM_Event	722	6	2014-06-22 13:34:05+08	2014-06-22 13:39:03+08	DONE	\N	2014-06-22 13:39:03+08	admin	724	Y	2014-06-22 13:39:03+08	2014-06-22 13:35:05+08	1
703	105	5	PM_Gateway	702	18	2014-06-21 23:21:50+08	2014-06-21 23:21:50+08	DONE	\N	2014-06-21 23:21:50+08	uat_qc1	703	N	\N	\N	\N
716	105	6	PM_Activity	715	23	2014-06-22 00:09:17+08	2014-06-22 00:34:23+08	DONE	2014-06-25 15:00:00+08	2014-06-22 00:34:23+08	uat_cust1	716	N	\N	2014-06-24 09:00:00+08	\N
701	108	5	PM_Activity	683	17	2014-06-21 22:48:52+08	2014-06-21 23:30:54+08	DONE	2014-06-21 22:58:52+08	2014-06-21 23:30:54+08	uat_qc1	701	N	\N	2014-06-21 22:58:52+08	\N
719	105	6	PM_Gateway	716	24	2014-06-22 00:34:23+08	2014-06-22 00:34:23+08	DONE	\N	2014-06-22 00:34:23+08	uat_cust1	719	N	\N	\N	\N
705	108	5	PM_Gateway	701	18	2014-06-21 23:30:54+08	2014-06-21 23:30:54+08	DONE	\N	2014-06-21 23:30:54+08	uat_qc1	705	N	\N	\N	\N
740	111	2	PM_Gateway	739	4	2014-06-22 14:02:47+08	2014-06-22 14:02:47+08	DONE	\N	2014-06-22 14:02:47+08	uat_supervisor1	740	N	\N	\N	\N
731	105	8	PM_Activity	724	8	2014-06-22 13:39:03+08	2014-06-22 13:39:03+08	DONE	\N	2014-06-22 13:39:03+08	admin	731	N	\N	\N	\N
704	105	10	PM_Activity	703	19	2014-06-21 23:21:50+08	2014-06-21 23:45:23+08	DONE	2014-06-23 09:01:51+08	2014-06-21 23:45:22+08	uat_artist1	704	N	\N	2014-06-23 09:01:51+08	\N
720	105	1	PM_Activity	719	26	2014-06-22 00:34:23+08	2014-06-22 13:34:04+08	DONE	2014-06-23 09:30:00+08	2014-06-22 13:34:04+08	uat_supervisor1	720	N	\N	2014-06-23 09:30:00+08	\N
721	105	1	PM_Gateway	720	2	2014-06-22 13:34:04+08	2014-06-22 13:34:05+08	DONE	\N	2014-06-22 13:34:04+08	uat_supervisor1	721	N	\N	\N	\N
700	110	9	PM_Activity	699	12	2014-06-21 22:27:53+08	2014-06-22 00:07:32+08	DONE	\N	2014-06-22 00:07:32+08	uat_supervisor1	700	N	\N	\N	\N
732	105	3	PM_Gateway	731	9	2014-06-22 13:39:03+08	2014-06-22 13:39:03+08	DONE	\N	2014-06-22 13:39:03+08	admin	732	N	\N	\N	\N
708	110	2	PM_Gateway	700	13	2014-06-22 00:07:32+08	2014-06-22 00:07:32+08	DONE	\N	2014-06-22 00:07:32+08	uat_supervisor1	708	N	\N	\N	\N
722	105	2	PM_Gateway	721	4	2014-06-22 13:34:05+08	2014-06-22 13:34:05+08	DONE	\N	2014-06-22 13:34:05+08	uat_supervisor1	722	N	\N	\N	\N
710	110	3	PM_Event	708	6	2014-06-22 00:07:32+08	2014-06-22 00:07:59+08	INTERRUPT	\N	2014-06-22 00:07:32+08	uat_artist1	709	Y	2014-06-22 00:07:32+08	2014-06-23 09:01:00+08	\N
709	110	2	PM_Event	708	5	2014-06-22 00:07:32+08	2014-06-22 00:07:59+08	DONE	2014-06-23 09:01:00+08	2014-06-22 00:07:59+08	uat_artist1	709	Y	\N	\N	\N
711	110	4	PM_Gateway	709	14	2014-06-22 00:07:59+08	2014-06-22 00:07:59+08	DONE	\N	2014-06-22 00:07:59+08	uat_artist1	711	N	\N	\N	\N
713	107	5	PM_Gateway	667	18	2014-06-22 00:08:36+08	2014-06-22 00:08:36+08	DONE	\N	2014-06-22 00:08:36+08	uat_qc1	713	N	\N	\N	\N
673	106	3	PM_Event	671	6	2014-06-21 22:05:14+08	2014-06-22 13:34:43+08	INTERRUPT	\N	2014-06-21 22:05:14+08	uat_artist1	672	Y	2014-06-21 22:05:14+08	2014-06-21 22:35:14+08	\N
707	105	5	PM_Activity	704	20	2014-06-21 23:45:23+08	2014-06-22 00:09:17+08	DONE	2014-06-23 09:25:24+08	2014-06-22 00:09:16+08	uat_qc1	707	N	\N	2014-06-23 09:25:24+08	\N
734	105	4	PM_Event	732	11	2014-06-22 13:39:03+08	2014-06-22 13:41:48+08	INTERRUPT	\N	\N	uat_artist1	733	Y	\N	\N	\N
715	105	5	PM_Gateway	707	18	2014-06-22 00:09:17+08	2014-06-22 00:09:17+08	DONE	\N	2014-06-22 00:09:17+08	uat_qc1	715	N	\N	\N	\N
725	106	4	PM_Gateway	672	14	2014-06-22 13:34:43+08	2014-06-22 13:34:43+08	DONE	\N	2014-06-22 13:34:43+08	uat_artist1	725	N	\N	\N	\N
714	107	6	PM_Activity	713	23	2014-06-22 00:08:36+08	2014-06-22 00:31:27+08	DONE	2014-06-25 15:00:00+08	2014-06-22 00:31:27+08	uat_cust1	714	N	\N	2014-06-24 09:00:00+08	\N
733	105	2	PM_Event	732	10	2014-06-22 13:39:03+08	2014-06-22 13:41:48+08	DONE	2014-06-22 13:40:03+08	2014-06-22 13:41:48+08	uat_artist1	733	Y	\N	\N	\N
727	109	7	PM_Activity	687	27	2014-06-22 13:39:02+08	2014-06-22 13:39:02+08	DONE	\N	2014-06-22 13:39:02+08	admin	727	N	\N	\N	\N
728	109	5	PM_Event	727	28	2014-06-22 13:39:02+08	2014-06-22 13:39:02+08	END	\N	2014-06-22 13:39:02+08	admin	728	N	\N	\N	\N
745	106	11	PM_Activity	726	31	2014-06-22 14:21:25+08	2014-06-22 14:21:26+08	DONE	\N	2014-06-22 14:21:25+08	admin	745	N	\N	\N	\N
735	105	4	PM_Gateway	733	14	2014-06-22 13:41:48+08	2014-06-22 13:41:48+08	DONE	\N	2014-06-22 13:41:48+08	uat_artist1	735	N	\N	\N	\N
729	108	11	PM_Activity	706	31	2014-06-22 13:39:02+08	2014-06-22 13:39:03+08	DONE	\N	2014-06-22 13:39:02+08	admin	729	N	\N	\N	\N
730	108	5	PM_Event	729	21	2014-06-22 13:39:03+08	2014-06-22 13:39:03+08	END	\N	2014-06-22 13:39:03+08	admin	730	N	\N	\N	\N
737	111	1	PM_Event	\N	\N	2014-06-22 14:01:20+08	2014-06-22 14:01:20+08	DONE	\N	2014-06-22 14:01:20+08	uat_supervisor1	737	N	\N	\N	\N
738	111	1	PM_Activity	737	1	2014-06-22 14:01:20+08	2014-06-22 14:02:47+08	DONE	2014-06-22 14:31:20+08	2014-06-22 14:02:47+08	uat_supervisor1	738	N	\N	2014-06-22 14:31:20+08	\N
743	109	7	PM_Activity	687	27	2014-06-22 14:21:25+08	2014-06-22 14:21:25+08	DONE	\N	2014-06-22 14:21:25+08	admin	743	N	\N	\N	\N
739	111	1	PM_Gateway	738	2	2014-06-22 14:02:47+08	2014-06-22 14:02:47+08	DONE	\N	2014-06-22 14:02:47+08	uat_supervisor1	739	N	\N	\N	\N
747	111	8	PM_Activity	742	8	2014-06-22 14:21:26+08	2014-06-22 14:21:26+08	DONE	\N	2014-06-22 14:21:26+08	admin	747	N	\N	\N	\N
744	109	5	PM_Event	743	28	2014-06-22 14:21:25+08	2014-06-22 14:21:25+08	END	\N	2014-06-22 14:21:25+08	admin	744	N	\N	\N	\N
746	106	5	PM_Event	745	21	2014-06-22 14:21:26+08	2014-06-22 14:21:26+08	END	\N	2014-06-22 14:21:26+08	admin	746	N	\N	\N	\N
751	111	9	PM_Activity	750	12	2014-06-22 14:40:58+08	2014-06-22 22:07:09+08	DONE	\N	2014-06-22 22:07:09+08	uat_supervisor2	751	N	\N	\N	\N
741	111	2	PM_Event	740	5	2014-06-22 14:02:47+08	2014-06-22 14:21:26+08	INTERRUPT	2014-06-22 14:03:47+08	\N	admin	742	Y	\N	\N	\N
749	111	2	PM_Event	748	10	2014-06-22 14:21:26+08	2014-06-22 14:40:58+08	INTERRUPT	2014-06-22 14:22:26+08	\N	uat_supervisor1	750	Y	\N	\N	\N
748	111	3	PM_Gateway	747	9	2014-06-22 14:21:26+08	2014-06-22 14:21:26+08	DONE	\N	2014-06-22 14:21:26+08	admin	748	N	\N	\N	\N
750	111	4	PM_Event	748	11	2014-06-22 14:21:26+08	2014-06-22 14:40:58+08	DONE	\N	2014-06-22 14:40:58+08	uat_supervisor1	750	Y	\N	\N	\N
755	113	1	PM_Activity	754	1	2014-06-22 15:09:06+08	2014-06-22 16:04:31+08	DONE	2014-06-22 15:39:06+08	2014-06-22 16:04:31+08	supervisor	755	N	\N	2014-06-22 15:39:06+08	\N
752	112	1	PM_Event	\N	\N	2014-06-22 15:06:57+08	2014-06-22 15:06:57+08	DONE	\N	2014-06-22 15:06:57+08	uat_cust1	752	N	\N	\N	\N
754	113	1	PM_Event	\N	\N	2014-06-22 15:09:06+08	2014-06-22 15:09:06+08	DONE	\N	2014-06-22 15:09:06+08	uat_cust1	754	N	\N	\N	\N
756	114	1	PM_Event	\N	\N	2014-06-22 15:09:52+08	2014-06-22 15:09:52+08	DONE	\N	2014-06-22 15:09:52+08	uat_cust1	756	N	\N	\N	\N
758	115	1	PM_Event	\N	\N	2014-06-22 15:53:21+08	2014-06-22 15:53:21+08	DONE	\N	2014-06-22 15:53:21+08	ysyow	758	N	\N	\N	\N
757	114	1	PM_Activity	756	1	2014-06-22 15:09:52+08	2014-06-22 16:09:17+08	DONE	2014-06-22 15:39:52+08	2014-06-22 16:09:17+08	supervisor	757	N	\N	2014-06-22 15:39:52+08	\N
753	112	1	PM_Activity	752	1	2014-06-22 15:06:57+08	2014-06-22 15:54:20+08	DONE	2014-06-22 15:36:57+08	2014-06-22 15:54:20+08	supervisor	753	N	\N	2014-06-22 15:36:57+08	\N
801	117	1	PM_Event	\N	\N	2014-06-22 18:37:00+08	2014-06-22 18:37:00+08	DONE	\N	2014-06-22 18:37:00+08	uat_customer1	801	N	\N	\N	\N
760	112	1	PM_Gateway	753	2	2014-06-22 15:54:20+08	2014-06-22 15:54:20+08	DONE	\N	2014-06-22 15:54:20+08	supervisor	760	N	\N	\N	\N
794	114	5	PM_Activity	793	20	2014-06-22 16:14:09+08	2014-06-22 16:14:30+08	DONE	2014-06-22 16:24:09+08	2014-06-22 16:14:30+08	qc	794	N	\N	2014-06-22 16:24:09+08	\N
783	114	5	PM_Activity	782	17	2014-06-22 16:09:46+08	2014-06-22 16:10:10+08	DONE	2014-06-22 16:19:46+08	2014-06-22 16:10:10+08	qc	783	N	\N	2014-06-22 16:19:46+08	\N
761	112	2	PM_Activity	760	3	2014-06-22 15:54:20+08	2014-06-22 15:55:16+08	DONE	\N	2014-06-22 15:55:16+08	ysyow	761	N	\N	\N	\N
706	108	10	PM_Activity	705	19	2014-06-21 23:30:54+08	\N	\N	2014-06-21 23:40:54+08	2014-07-01 23:16:01+08	\N	\N	N	2014-06-22 13:39:02+08	2014-06-22 13:49:02+08	1
726	106	10	PM_Activity	725	16	2014-06-22 13:34:43+08	\N	\N	2014-06-22 14:14:43+08	2014-07-01 23:16:01+08	\N	\N	N	2014-06-22 14:21:25+08	2014-06-22 15:01:25+08	1
759	115	1	PM_Activity	758	1	2014-06-22 15:53:21+08	2014-06-22 15:55:29+08	DONE	2014-06-22 16:23:21+08	2014-06-22 15:55:29+08	supervisor	759	N	\N	2014-06-22 16:23:21+08	\N
784	114	5	PM_Gateway	783	18	2014-06-22 16:10:10+08	2014-06-22 16:10:10+08	DONE	\N	2014-06-22 16:10:10+08	qc	784	N	\N	\N	\N
763	115	1	PM_Gateway	759	2	2014-06-22 15:55:29+08	2014-06-22 15:55:29+08	DONE	\N	2014-06-22 15:55:29+08	supervisor	763	N	\N	\N	\N
764	115	2	PM_Gateway	763	4	2014-06-22 15:55:29+08	2014-06-22 15:55:29+08	DONE	\N	2014-06-22 15:55:29+08	supervisor	764	N	\N	\N	\N
795	114	5	PM_Gateway	794	18	2014-06-22 16:14:30+08	2014-06-22 16:14:30+08	DONE	\N	2014-06-22 16:14:30+08	qc	795	N	\N	\N	\N
767	116	1	PM_Event	\N	\N	2014-06-22 16:02:50+08	2014-06-22 16:02:50+08	DONE	\N	2014-06-22 16:02:50+08	uat_customer1	767	N	\N	\N	\N
785	114	6	PM_Activity	784	23	2014-06-22 16:10:10+08	2014-06-22 16:13:00+08	DONE	2014-06-24 16:10:11+08	2014-06-22 16:13:00+08	ysyow	785	N	\N	2014-06-23 16:10:10+08	\N
769	113	1	PM_Gateway	755	2	2014-06-22 16:04:31+08	2014-06-22 16:04:31+08	DONE	\N	2014-06-22 16:04:31+08	supervisor	769	N	\N	\N	\N
770	113	2	PM_Gateway	769	4	2014-06-22 16:04:31+08	2014-06-22 16:04:31+08	DONE	\N	2014-06-22 16:04:31+08	supervisor	770	N	\N	\N	\N
786	114	6	PM_Gateway	785	24	2014-06-22 16:13:00+08	2014-06-22 16:13:00+08	DONE	\N	2014-06-22 16:13:00+08	ysyow	786	N	\N	\N	\N
766	115	3	PM_Event	764	6	2014-06-22 15:55:29+08	2014-06-22 16:05:11+08	INTERRUPT	\N	2014-06-22 15:55:29+08	artist2	765	Y	2014-06-22 15:55:29+08	2014-06-22 15:56:29+08	\N
765	115	2	PM_Event	764	5	2014-06-22 15:55:29+08	2014-06-22 16:05:11+08	DONE	2014-06-22 15:56:29+08	2014-06-22 16:05:11+08	artist2	765	Y	\N	\N	\N
807	105	11	PM_Activity	736	29	2014-06-22 18:42:27+08	2014-06-22 18:42:27+08	DONE	\N	2014-06-22 18:42:27+08	qc	807	N	\N	\N	\N
773	115	4	PM_Gateway	765	14	2014-06-22 16:05:11+08	2014-06-22 16:05:11+08	DONE	\N	2014-06-22 16:05:11+08	artist2	773	N	\N	\N	\N
772	113	3	PM_Event	770	6	2014-06-22 16:04:31+08	2014-06-22 16:05:11+08	INTERRUPT	\N	2014-06-22 16:04:31+08	artist2	771	Y	2014-06-22 16:04:31+08	2014-06-22 16:05:31+08	\N
771	113	2	PM_Event	770	5	2014-06-22 16:04:31+08	2014-06-22 16:05:11+08	DONE	2014-06-22 16:05:31+08	2014-06-22 16:05:11+08	artist2	771	Y	\N	\N	\N
787	114	1	PM_Activity	786	26	2014-06-22 16:13:00+08	2014-06-22 16:13:26+08	DONE	2014-06-22 16:43:00+08	2014-06-22 16:13:26+08	supervisor	787	N	\N	2014-06-22 16:43:00+08	\N
775	113	4	PM_Gateway	771	14	2014-06-22 16:05:11+08	2014-06-22 16:05:11+08	DONE	\N	2014-06-22 16:05:11+08	artist2	775	N	\N	\N	\N
804	117	2	PM_Activity	803	3	2014-06-22 18:40:11+08	2014-06-22 19:05:44+08	DONE	\N	2014-06-22 19:05:44+08	uat_customer1	804	N	\N	\N	\N
777	114	1	PM_Gateway	757	2	2014-06-22 16:09:17+08	2014-06-22 16:09:17+08	DONE	\N	2014-06-22 16:09:17+08	supervisor	777	N	\N	\N	\N
796	114	6	PM_Activity	795	23	2014-06-22 16:14:30+08	2014-06-22 16:14:41+08	DONE	2014-06-24 16:14:31+08	2014-06-22 16:14:41+08	ysyow	796	N	\N	2014-06-23 16:14:30+08	\N
778	114	2	PM_Gateway	777	4	2014-06-22 16:09:17+08	2014-06-22 16:09:17+08	DONE	\N	2014-06-22 16:09:17+08	supervisor	778	N	\N	\N	\N
788	114	1	PM_Gateway	787	2	2014-06-22 16:13:26+08	2014-06-22 16:13:26+08	DONE	\N	2014-06-22 16:13:26+08	supervisor	788	N	\N	\N	\N
780	114	3	PM_Event	778	6	2014-06-22 16:09:17+08	2014-06-22 16:09:28+08	INTERRUPT	\N	2014-06-22 16:09:17+08	artist2	779	Y	2014-06-22 16:09:17+08	2014-06-22 16:10:17+08	\N
779	114	2	PM_Event	778	5	2014-06-22 16:09:17+08	2014-06-22 16:09:28+08	DONE	2014-06-22 16:10:17+08	2014-06-22 16:09:28+08	artist2	779	Y	\N	\N	\N
789	114	2	PM_Gateway	788	4	2014-06-22 16:13:26+08	2014-06-22 16:13:26+08	DONE	\N	2014-06-22 16:13:26+08	supervisor	789	N	\N	\N	\N
781	114	4	PM_Gateway	779	14	2014-06-22 16:09:28+08	2014-06-22 16:09:28+08	DONE	\N	2014-06-22 16:09:28+08	artist2	781	N	\N	\N	\N
782	114	4	PM_Activity	781	15	2014-06-22 16:09:28+08	2014-06-22 16:09:46+08	DONE	2014-06-22 16:39:28+08	2014-06-22 16:09:46+08	artist2	782	N	\N	2014-06-22 16:39:28+08	\N
802	117	1	PM_Activity	801	1	2014-06-22 18:37:00+08	2014-06-22 18:40:11+08	DONE	2014-06-22 19:07:00+08	2014-06-22 18:40:11+08	uat_supervisor1	802	N	\N	2014-06-22 19:07:00+08	\N
797	114	6	PM_Gateway	796	24	2014-06-22 16:14:41+08	2014-06-22 16:14:41+08	DONE	\N	2014-06-22 16:14:41+08	ysyow	797	N	\N	\N	\N
791	114	3	PM_Event	789	6	2014-06-22 16:13:26+08	2014-06-22 16:13:52+08	INTERRUPT	\N	2014-06-22 16:13:26+08	artist2	790	Y	2014-06-22 16:13:26+08	2014-06-22 16:14:26+08	\N
790	114	2	PM_Event	789	5	2014-06-22 16:13:26+08	2014-06-22 16:13:52+08	DONE	2014-06-22 16:14:26+08	2014-06-22 16:13:52+08	artist2	790	Y	\N	\N	\N
792	114	4	PM_Gateway	790	14	2014-06-22 16:13:52+08	2014-06-22 16:13:52+08	DONE	\N	2014-06-22 16:13:52+08	artist2	792	N	\N	\N	\N
798	114	6	PM_Event	797	25	2014-06-22 16:14:41+08	2014-06-22 16:14:41+08	END	\N	2014-06-22 16:14:41+08	ysyow	798	N	\N	\N	\N
811	113	11	PM_Activity	776	31	2014-06-22 18:42:27+08	2014-06-22 18:42:28+08	DONE	\N	2014-06-22 18:42:27+08	qc	811	N	\N	\N	\N
793	114	10	PM_Activity	792	16	2014-06-22 16:13:52+08	2014-06-22 16:14:09+08	DONE	2014-06-22 16:23:52+08	2014-06-22 16:14:09+08	artist2	793	N	\N	2014-06-22 16:23:52+08	\N
803	117	1	PM_Gateway	802	2	2014-06-22 18:40:11+08	2014-06-22 18:40:11+08	DONE	\N	2014-06-22 18:40:11+08	uat_supervisor1	803	N	\N	\N	\N
808	105	5	PM_Event	807	21	2014-06-22 18:42:27+08	2014-06-22 18:42:27+08	END	\N	2014-06-22 18:42:27+08	qc	808	N	\N	\N	\N
805	109	7	PM_Activity	687	27	2014-06-22 18:42:26+08	2014-06-22 18:42:27+08	DONE	\N	2014-06-22 18:42:26+08	qc	805	N	\N	\N	\N
768	116	1	PM_Activity	767	1	2014-06-22 16:02:50+08	2014-06-22 18:27:32+08	DONE	2014-06-22 16:32:50+08	2014-06-22 18:27:32+08	uat_supervisor1	768	N	\N	2014-06-22 16:32:50+08	\N
799	116	1	PM_Gateway	768	2	2014-06-22 18:27:32+08	2014-06-22 18:27:32+08	DONE	\N	2014-06-22 18:27:32+08	uat_supervisor1	799	N	\N	\N	\N
810	112	5	PM_Event	809	28	2014-06-22 18:42:27+08	2014-06-22 18:42:27+08	END	\N	2014-06-22 18:42:27+08	qc	810	N	\N	\N	\N
806	109	5	PM_Event	805	28	2014-06-22 18:42:27+08	2014-06-22 18:42:27+08	END	\N	2014-06-22 18:42:27+08	qc	806	N	\N	\N	\N
809	112	7	PM_Activity	762	27	2014-06-22 18:42:27+08	2014-06-22 18:42:27+08	DONE	\N	2014-06-22 18:42:27+08	qc	809	N	\N	\N	\N
813	115	11	PM_Activity	774	31	2014-06-22 18:42:28+08	2014-06-22 18:42:28+08	DONE	\N	2014-06-22 18:42:28+08	qc	813	N	\N	\N	\N
812	113	5	PM_Event	811	21	2014-06-22 18:42:28+08	2014-06-22 18:42:28+08	END	\N	2014-06-22 18:42:28+08	qc	812	N	\N	\N	\N
814	115	5	PM_Event	813	21	2014-06-22 18:42:28+08	2014-06-22 18:42:28+08	END	\N	2014-06-22 18:42:28+08	qc	814	N	\N	\N	\N
816	118	1	PM_Event	\N	\N	2014-06-22 19:08:37+08	2014-06-22 19:08:37+08	DONE	\N	2014-06-22 19:08:37+08	uat_customer1	816	N	\N	\N	\N
818	119	1	PM_Event	\N	\N	2014-06-22 19:09:29+08	2014-06-22 19:09:29+08	DONE	\N	2014-06-22 19:09:29+08	uat_customer1	818	N	\N	\N	\N
819	119	1	PM_Activity	818	1	2014-06-22 19:09:29+08	2014-06-22 19:17:50+08	DONE	\N	2014-06-22 19:17:50+08	uat_supervisor1	819	N	\N	2014-06-22 19:09:29+08	\N
800	116	2	PM_Activity	799	3	2014-06-22 18:27:32+08	\N	\N	\N	2014-06-28 15:11:29+08	\N	\N	N	\N	\N	\N
820	119	1	PM_Gateway	819	2	2014-06-22 19:17:50+08	2014-06-22 19:17:50+08	DONE	\N	2014-06-22 19:17:50+08	uat_supervisor1	820	N	\N	\N	\N
849	125	1	PM_Event	\N	\N	2014-06-22 22:25:20+08	2014-06-22 22:25:20+08	DONE	\N	2014-06-22 22:25:20+08	ysyow	849	N	\N	\N	\N
821	119	2	PM_Activity	820	3	2014-06-22 19:17:50+08	2014-06-22 19:18:31+08	DONE	\N	2014-06-22 19:18:31+08	uat_customer1	821	N	\N	\N	\N
851	126	1	PM_Event	\N	\N	2014-06-22 22:26:19+08	2014-06-22 22:26:19+08	DONE	\N	2014-06-22 22:26:19+08	ysyow	851	N	\N	\N	\N
822	119	1	PM_Activity	821	7	2014-06-22 19:18:31+08	2014-06-22 21:14:50+08	DONE	2014-06-22 19:48:31+08	2014-06-22 21:14:49+08	uat_supervisor1	822	N	\N	2014-06-22 19:18:31+08	\N
825	119	1	PM_Gateway	822	2	2014-06-22 21:14:50+08	2014-06-22 21:14:50+08	DONE	\N	2014-06-22 21:14:50+08	uat_supervisor1	825	N	\N	\N	\N
826	119	2	PM_Gateway	825	4	2014-06-22 21:14:50+08	2014-06-22 21:14:50+08	DONE	\N	2014-06-22 21:14:50+08	uat_supervisor1	826	N	\N	\N	\N
853	127	1	PM_Event	\N	\N	2014-06-22 22:27:13+08	2014-06-22 22:27:13+08	DONE	\N	2014-06-22 22:27:13+08	ysyow	853	N	\N	\N	\N
828	119	3	PM_Event	826	6	2014-06-22 21:14:50+08	2014-06-22 21:15:57+08	INTERRUPT	\N	2014-06-22 21:14:50+08	uat_artist1	827	Y	2014-06-22 21:14:50+08	2014-06-22 21:15:50+08	\N
827	119	2	PM_Event	826	5	2014-06-22 21:14:50+08	2014-06-22 21:15:57+08	DONE	2014-06-22 21:15:50+08	2014-06-22 21:15:57+08	uat_artist1	827	Y	\N	\N	\N
776	113	10	PM_Activity	775	16	2014-06-22 16:05:11+08	\N	\N	2014-06-22 17:11:11+08	2014-07-01 23:16:01+08	\N	\N	N	2014-06-22 18:42:27+08	2014-06-22 19:48:27+08	1
774	115	10	PM_Activity	773	16	2014-06-22 16:05:11+08	\N	\N	2014-06-22 16:35:11+08	2014-07-01 23:16:01+08	\N	\N	N	2014-06-22 18:42:28+08	2014-06-22 19:12:28+08	1
815	117	1	PM_Activity	804	7	2014-06-22 19:05:44+08	\N	\N	\N	2014-07-01 17:59:02+08	\N	\N	N	2014-07-01 17:59:02+08	2014-07-01 21:15:00+08	3
817	118	1	PM_Activity	816	1	2014-06-22 19:08:37+08	\N	\N	\N	2014-07-01 17:59:03+08	\N	\N	N	2014-07-01 17:59:03+08	2014-07-01 21:15:00+08	3
855	128	1	PM_Event	\N	\N	2014-06-22 22:29:53+08	2014-06-22 22:29:53+08	DONE	\N	2014-06-22 22:29:53+08	ysyow	855	N	\N	\N	\N
829	119	4	PM_Gateway	827	14	2014-06-22 21:15:57+08	2014-06-22 21:15:57+08	DONE	\N	2014-06-22 21:15:57+08	uat_artist1	829	N	\N	\N	\N
831	121	1	PM_Event	\N	\N	2014-06-22 21:20:41+08	2014-06-22 21:20:41+08	DONE	\N	2014-06-22 21:20:41+08	uat_customer2	831	N	\N	\N	\N
857	129	1	PM_Event	\N	\N	2014-06-22 22:34:15+08	2014-06-22 22:34:15+08	DONE	\N	2014-06-22 22:34:15+08	ysyow	857	N	\N	\N	\N
830	119	4	PM_Activity	829	15	2014-06-22 21:15:57+08	2014-06-22 21:34:06+08	DONE	2014-06-23 09:25:58+08	2014-06-22 21:34:06+08	uat_artist1	830	N	\N	2014-06-22 21:15:57+08	\N
878	130	1	PM_Gateway	875	2	2014-06-22 23:00:58+08	2014-06-22 23:00:58+08	DONE	\N	2014-06-22 23:00:58+08	uat_supervisor3	878	N	\N	\N	\N
833	119	5	PM_Activity	830	17	2014-06-22 21:34:06+08	2014-06-22 21:56:20+08	DONE	2014-06-22 22:37:06+08	2014-06-22 21:56:20+08	uat_qc1	833	N	\N	2014-06-22 21:34:06+08	\N
834	119	5	PM_Gateway	833	18	2014-06-22 21:56:20+08	2014-06-22 21:56:20+08	DONE	\N	2014-06-22 21:56:20+08	uat_qc1	834	N	\N	\N	\N
846	123	1	PM_Activity	845	1	2014-06-22 22:22:00+08	2014-06-22 22:39:44+08	DONE	\N	2014-06-22 22:39:44+08	uat_supervisor2	846	N	\N	2014-06-22 22:22:00+08	\N
832	121	1	PM_Activity	831	1	2014-06-22 21:20:41+08	2014-06-22 22:06:51+08	DONE	\N	2014-06-22 22:06:51+08	uat_supervisor2	832	N	\N	2014-06-22 21:20:41+08	\N
858	129	1	PM_Activity	857	1	2014-06-22 22:34:15+08	2014-06-22 22:36:58+08	DONE	2014-06-22 23:04:15+08	2014-06-22 22:36:58+08	supervisor	858	N	\N	2014-06-22 23:04:15+08	\N
836	121	1	PM_Gateway	832	2	2014-06-22 22:06:51+08	2014-06-22 22:06:51+08	DONE	\N	2014-06-22 22:06:51+08	uat_supervisor2	836	N	\N	\N	\N
837	121	2	PM_Gateway	836	4	2014-06-22 22:06:51+08	2014-06-22 22:06:51+08	DONE	\N	2014-06-22 22:06:51+08	uat_supervisor2	837	N	\N	\N	\N
872	123	4	PM_Activity	871	15	2014-06-22 22:40:36+08	2014-06-22 22:41:20+08	DONE	2014-06-23 10:20:37+08	2014-06-22 22:41:20+08	uat_artist2	872	N	\N	2014-06-23 10:20:37+08	\N
862	129	3	PM_Event	860	6	2014-06-22 22:36:58+08	2014-06-23 00:23:18+08	DONE	\N	2014-06-23 00:23:18+08	supervisor	862	Y	2014-06-23 00:23:18+08	2014-06-22 22:37:58+08	1
859	129	1	PM_Gateway	858	2	2014-06-22 22:36:58+08	2014-06-22 22:36:58+08	DONE	\N	2014-06-22 22:36:58+08	supervisor	859	N	\N	\N	\N
840	111	2	PM_Gateway	751	13	2014-06-22 22:07:09+08	2014-06-22 22:07:09+08	DONE	\N	2014-06-22 22:07:09+08	uat_supervisor2	840	N	\N	\N	\N
841	111	2	PM_Event	840	5	2014-06-22 22:07:09+08	2014-06-23 00:23:18+08	INTERRUPT	2014-06-22 22:08:09+08	\N	supervisor	842	Y	\N	\N	\N
843	122	1	PM_Event	\N	\N	2014-06-22 22:19:07+08	2014-06-22 22:19:07+08	DONE	\N	2014-06-22 22:19:07+08	uat_customer3	843	N	\N	\N	\N
845	123	1	PM_Event	\N	\N	2014-06-22 22:22:00+08	2014-06-22 22:22:00+08	DONE	\N	2014-06-22 22:22:00+08	ysyow	845	N	\N	\N	\N
847	124	1	PM_Event	\N	\N	2014-06-22 22:25:19+08	2014-06-22 22:25:19+08	DONE	\N	2014-06-22 22:25:19+08	uat_customer3	847	N	\N	\N	\N
867	123	1	PM_Gateway	846	2	2014-06-22 22:39:44+08	2014-06-22 22:39:44+08	DONE	\N	2014-06-22 22:39:44+08	uat_supervisor2	867	N	\N	\N	\N
860	129	2	PM_Gateway	859	4	2014-06-22 22:36:58+08	2014-06-22 22:36:58+08	DONE	\N	2014-06-22 22:36:58+08	supervisor	860	N	\N	\N	\N
861	129	2	PM_Event	860	5	2014-06-22 22:36:58+08	2014-06-23 00:23:18+08	INTERRUPT	2014-06-22 22:37:58+08	\N	supervisor	862	Y	\N	\N	\N
868	123	2	PM_Gateway	867	4	2014-06-22 22:39:44+08	2014-06-22 22:39:44+08	DONE	\N	2014-06-22 22:39:44+08	uat_supervisor2	868	N	\N	\N	\N
844	122	1	PM_Activity	843	1	2014-06-22 22:19:07+08	2014-06-22 22:38:04+08	DONE	\N	2014-06-22 22:38:04+08	uat_supervisor2	844	N	\N	2014-06-22 22:19:07+08	\N
863	122	1	PM_Gateway	844	2	2014-06-22 22:38:04+08	2014-06-22 22:38:04+08	DONE	\N	2014-06-22 22:38:04+08	uat_supervisor2	863	N	\N	\N	\N
864	122	2	PM_Gateway	863	4	2014-06-22 22:38:04+08	2014-06-22 22:38:04+08	DONE	\N	2014-06-22 22:38:04+08	uat_supervisor2	864	N	\N	\N	\N
870	123	3	PM_Event	868	6	2014-06-22 22:39:44+08	2014-06-22 22:40:36+08	INTERRUPT	\N	2014-06-22 22:39:44+08	uat_artist2	869	Y	2014-06-22 22:39:44+08	2014-06-22 22:40:44+08	\N
874	130	1	PM_Event	\N	\N	2014-06-22 22:42:05+08	2014-06-22 22:42:06+08	DONE	\N	2014-06-22 22:42:05+08	uat_customer3	874	N	\N	\N	\N
869	123	2	PM_Event	868	5	2014-06-22 22:39:44+08	2014-06-22 22:40:36+08	DONE	2014-06-22 22:40:44+08	2014-06-22 22:40:36+08	uat_artist2	869	Y	\N	\N	\N
871	123	4	PM_Gateway	869	14	2014-06-22 22:40:36+08	2014-06-22 22:40:36+08	DONE	\N	2014-06-22 22:40:36+08	uat_artist2	871	N	\N	\N	\N
884	130	5	PM_Activity	883	17	2014-06-22 23:01:48+08	2014-06-22 23:02:15+08	DONE	2014-06-22 23:54:48+08	2014-06-22 23:02:14+08	uat_qc3	884	N	\N	2014-06-22 23:54:48+08	\N
875	130	1	PM_Activity	874	1	2014-06-22 22:42:06+08	2014-06-22 23:00:58+08	DONE	2014-06-22 23:12:06+08	2014-06-22 23:00:58+08	uat_supervisor3	875	N	\N	2014-06-22 23:12:06+08	\N
873	123	5	PM_Activity	872	17	2014-06-22 22:41:20+08	2014-06-22 22:42:50+08	DONE	2014-06-22 23:34:20+08	2014-06-22 22:42:50+08	uat_qc2	873	N	\N	2014-06-22 23:34:20+08	\N
876	123	5	PM_Gateway	873	18	2014-06-22 22:42:50+08	2014-06-22 22:42:50+08	DONE	\N	2014-06-22 22:42:50+08	uat_qc2	876	N	\N	\N	\N
880	130	2	PM_Event	879	5	2014-06-22 23:00:58+08	2014-06-22 23:01:20+08	DONE	2014-06-22 23:01:58+08	2014-06-22 23:01:20+08	uat_artist3	880	Y	\N	\N	\N
879	130	2	PM_Gateway	878	4	2014-06-22 23:00:58+08	2014-06-22 23:00:58+08	DONE	\N	2014-06-22 23:00:58+08	uat_supervisor3	879	N	\N	\N	\N
881	130	3	PM_Event	879	6	2014-06-22 23:00:58+08	2014-06-22 23:01:20+08	INTERRUPT	\N	2014-06-22 23:00:58+08	uat_artist3	880	Y	2014-06-22 23:00:58+08	2014-06-22 23:01:58+08	\N
882	130	4	PM_Gateway	880	14	2014-06-22 23:01:20+08	2014-06-22 23:01:20+08	DONE	\N	2014-06-22 23:01:20+08	uat_artist3	882	N	\N	\N	\N
883	130	4	PM_Activity	882	15	2014-06-22 23:01:20+08	2014-06-22 23:01:48+08	DONE	2014-06-23 10:41:21+08	2014-06-22 23:01:48+08	uat_artist3	883	N	\N	2014-06-23 10:41:21+08	\N
885	130	5	PM_Gateway	884	18	2014-06-22 23:02:15+08	2014-06-22 23:02:15+08	DONE	\N	2014-06-22 23:02:15+08	uat_qc3	885	N	\N	\N	\N
835	119	6	PM_Activity	834	23	2014-06-22 21:56:20+08	2014-06-23 00:23:17+08	INTERRUPT	2014-06-25 12:56:21+08	2014-06-23 00:23:17+08	supervisor	835	N	2014-06-23 00:23:17+08	2014-06-22 21:56:20+08	1
887	109	7	PM_Activity	687	27	2014-06-23 00:23:14+08	2014-06-23 00:23:14+08	DONE	\N	2014-06-23 00:23:14+08	supervisor	887	N	\N	\N	\N
839	121	3	PM_Event	837	6	2014-06-22 22:06:51+08	2014-06-23 00:23:17+08	DONE	\N	2014-06-23 00:23:17+08	supervisor	839	Y	2014-06-23 00:23:17+08	2014-06-22 22:07:51+08	1
866	122	3	PM_Event	864	6	2014-06-22 22:38:04+08	2014-06-23 00:23:18+08	DONE	\N	2014-06-23 00:23:18+08	supervisor	866	Y	2014-06-23 00:23:18+08	2014-06-22 22:39:04+08	1
888	109	5	PM_Event	887	28	2014-06-23 00:23:14+08	2014-06-23 00:23:14+08	END	\N	2014-06-23 00:23:14+08	supervisor	888	N	\N	\N	\N
914	111	4	PM_Event	912	11	2014-06-23 00:23:18+08	\N	\N	\N	\N	\N	\N	Y	\N	\N	\N
889	112	7	PM_Activity	762	27	2014-06-23 00:23:15+08	2014-06-23 00:23:15+08	DONE	\N	2014-06-23 00:23:15+08	supervisor	889	N	\N	\N	\N
890	112	5	PM_Event	889	28	2014-06-23 00:23:15+08	2014-06-23 00:23:15+08	END	\N	2014-06-23 00:23:15+08	supervisor	890	N	\N	\N	\N
891	117	7	PM_Activity	815	27	2014-06-23 00:23:15+08	2014-06-23 00:23:15+08	DONE	\N	2014-06-23 00:23:15+08	supervisor	891	N	\N	\N	\N
915	124	7	PM_Activity	848	27	2014-06-23 00:23:18+08	2014-06-23 00:23:18+08	DONE	\N	2014-06-23 00:23:18+08	supervisor	915	N	\N	\N	\N
892	117	5	PM_Event	891	28	2014-06-23 00:23:15+08	2014-06-23 00:23:15+08	END	\N	2014-06-23 00:23:15+08	supervisor	892	N	\N	\N	\N
893	118	7	PM_Activity	817	27	2014-06-23 00:23:15+08	2014-06-23 00:23:16+08	DONE	\N	2014-06-23 00:23:15+08	supervisor	893	N	\N	\N	\N
931	133	1	PM_Event	\N	\N	2014-06-24 18:38:42+08	2014-06-24 18:38:42+08	DONE	\N	2014-06-24 18:38:42+08	ysyow	931	N	\N	\N	\N
894	118	5	PM_Event	893	28	2014-06-23 00:23:16+08	2014-06-23 00:23:16+08	END	\N	2014-06-23 00:23:16+08	supervisor	894	N	\N	\N	\N
916	124	5	PM_Event	915	28	2014-06-23 00:23:18+08	2014-06-23 00:23:18+08	END	\N	2014-06-23 00:23:18+08	supervisor	916	N	\N	\N	\N
895	125	7	PM_Activity	850	27	2014-06-23 00:23:16+08	2014-06-23 00:23:16+08	DONE	\N	2014-06-23 00:23:16+08	supervisor	895	N	\N	\N	\N
886	130	10	PM_Activity	885	19	2014-06-22 23:02:15+08	\N	\N	2014-06-22 23:55:15+08	2014-07-01 23:16:01+08	\N	\N	N	2014-06-23 00:23:18+08	2014-06-23 09:53:00+08	1
850	125	1	PM_Activity	849	1	2014-06-22 22:25:20+08	\N	\N	\N	2014-07-01 17:59:04+08	\N	\N	N	2014-07-01 17:59:04+08	2014-07-01 21:15:00+08	3
852	126	1	PM_Activity	851	1	2014-06-22 22:26:19+08	\N	\N	\N	2014-07-01 17:59:05+08	\N	\N	N	2014-07-01 17:59:05+08	2014-07-01 21:15:00+08	3
854	127	1	PM_Activity	853	1	2014-06-22 22:27:13+08	\N	\N	\N	2014-07-01 17:59:06+08	\N	\N	N	2014-07-01 17:59:06+08	2014-07-01 21:15:00+08	3
848	124	1	PM_Activity	847	1	2014-06-22 22:25:19+08	\N	\N	\N	2014-07-01 17:59:06+08	\N	\N	N	2014-07-01 17:59:06+08	2014-07-01 21:15:00+08	3
896	125	5	PM_Event	895	28	2014-06-23 00:23:16+08	2014-06-23 00:23:16+08	END	\N	2014-06-23 00:23:16+08	supervisor	896	N	\N	\N	\N
897	126	7	PM_Activity	852	27	2014-06-23 00:23:16+08	2014-06-23 00:23:17+08	DONE	\N	2014-06-23 00:23:16+08	supervisor	897	N	\N	\N	\N
917	129	8	PM_Activity	862	8	2014-06-23 00:23:18+08	2014-06-23 00:23:18+08	DONE	\N	2014-06-23 00:23:18+08	supervisor	917	N	\N	\N	\N
898	126	5	PM_Event	897	28	2014-06-23 00:23:17+08	2014-06-23 00:23:17+08	END	\N	2014-06-23 00:23:17+08	supervisor	898	N	\N	\N	\N
899	127	7	PM_Activity	854	27	2014-06-23 00:23:17+08	2014-06-23 00:23:17+08	DONE	\N	2014-06-23 00:23:17+08	supervisor	899	N	\N	\N	\N
900	127	5	PM_Event	899	28	2014-06-23 00:23:17+08	2014-06-23 00:23:17+08	END	\N	2014-06-23 00:23:17+08	supervisor	900	N	\N	\N	\N
918	129	3	PM_Gateway	917	9	2014-06-23 00:23:18+08	2014-06-23 00:23:18+08	DONE	\N	2014-06-23 00:23:18+08	supervisor	918	N	\N	\N	\N
901	128	7	PM_Activity	856	27	2014-06-23 00:23:17+08	2014-06-23 00:23:17+08	DONE	\N	2014-06-23 00:23:17+08	supervisor	901	N	\N	\N	\N
919	129	2	PM_Event	918	10	2014-06-23 00:23:18+08	\N	\N	2014-06-23 09:01:00+08	\N	\N	\N	Y	\N	\N	\N
902	128	5	PM_Event	901	28	2014-06-23 00:23:17+08	2014-06-23 00:23:17+08	END	\N	2014-06-23 00:23:17+08	supervisor	902	N	\N	\N	\N
920	129	4	PM_Event	918	11	2014-06-23 00:23:18+08	\N	\N	\N	\N	\N	\N	Y	\N	\N	\N
903	123	11	PM_Activity	877	31	2014-06-23 00:23:17+08	2014-06-23 00:23:17+08	DONE	\N	2014-06-23 00:23:17+08	supervisor	903	N	\N	\N	\N
865	122	2	PM_Event	864	5	2014-06-22 22:38:04+08	2014-06-23 00:23:18+08	INTERRUPT	2014-06-22 22:39:04+08	\N	supervisor	866	Y	\N	\N	\N
904	123	5	PM_Event	903	21	2014-06-23 00:23:17+08	2014-06-23 00:23:17+08	END	\N	2014-06-23 00:23:17+08	supervisor	904	N	\N	\N	\N
905	119	13	PM_Activity	835	32	2014-06-23 00:23:17+08	2014-06-23 00:23:17+08	ERROR	\N	2014-06-23 00:23:17+08	supervisor	905	N	\N	\N	\N
933	134	1	PM_Event	\N	\N	2014-06-24 18:41:09+08	2014-06-24 18:41:09+08	DONE	\N	2014-06-24 18:41:09+08	ysyow	933	N	\N	\N	\N
906	119	6	PM_Event	905	33	2014-06-23 00:23:17+08	2014-06-23 00:23:17+08	END	\N	2014-06-23 00:23:17+08	supervisor	906	N	\N	\N	\N
838	121	2	PM_Event	837	5	2014-06-22 22:06:51+08	2014-06-23 00:23:17+08	INTERRUPT	2014-06-22 22:07:51+08	\N	supervisor	839	Y	\N	\N	\N
921	122	8	PM_Activity	866	8	2014-06-23 00:23:18+08	2014-06-23 00:23:18+08	DONE	\N	2014-06-23 00:23:18+08	supervisor	921	N	\N	\N	\N
907	121	8	PM_Activity	839	8	2014-06-23 00:23:17+08	2014-06-23 00:23:17+08	DONE	\N	2014-06-23 00:23:17+08	supervisor	907	N	\N	\N	\N
908	121	3	PM_Gateway	907	9	2014-06-23 00:23:17+08	2014-06-23 00:23:17+08	DONE	\N	2014-06-23 00:23:17+08	supervisor	908	N	\N	\N	\N
909	121	2	PM_Event	908	10	2014-06-23 00:23:17+08	\N	\N	2014-06-23 09:01:00+08	\N	\N	\N	Y	\N	\N	\N
910	121	4	PM_Event	908	11	2014-06-23 00:23:17+08	\N	\N	\N	\N	\N	\N	Y	\N	\N	\N
842	111	3	PM_Event	840	6	2014-06-22 22:07:09+08	2014-06-23 00:23:18+08	DONE	\N	2014-06-23 00:23:17+08	supervisor	842	Y	2014-06-23 00:23:18+08	2014-06-22 22:08:09+08	1
911	111	8	PM_Activity	842	8	2014-06-23 00:23:18+08	2014-06-23 00:23:18+08	DONE	\N	2014-06-23 00:23:18+08	supervisor	911	N	\N	\N	\N
922	122	3	PM_Gateway	921	9	2014-06-23 00:23:18+08	2014-06-23 00:23:18+08	DONE	\N	2014-06-23 00:23:18+08	supervisor	922	N	\N	\N	\N
912	111	3	PM_Gateway	911	9	2014-06-23 00:23:18+08	2014-06-23 00:23:18+08	DONE	\N	2014-06-23 00:23:18+08	supervisor	912	N	\N	\N	\N
913	111	2	PM_Event	912	10	2014-06-23 00:23:18+08	\N	\N	2014-06-23 09:01:00+08	\N	\N	\N	Y	\N	\N	\N
923	122	2	PM_Event	922	10	2014-06-23 00:23:18+08	\N	\N	2014-06-23 09:01:00+08	\N	\N	\N	Y	\N	\N	\N
924	122	4	PM_Event	922	11	2014-06-23 00:23:18+08	\N	\N	\N	\N	\N	\N	Y	\N	\N	\N
940	135	3	PM_Event	938	6	2014-06-24 19:01:40+08	2014-06-24 19:02:09+08	INTERRUPT	\N	2014-06-24 19:01:40+08	uat_artist1	939	Y	2014-06-24 19:01:40+08	2014-06-25 09:01:00+08	\N
925	130	11	PM_Activity	886	31	2014-06-23 00:23:18+08	2014-06-23 00:23:18+08	DONE	\N	2014-06-23 00:23:18+08	supervisor	925	N	\N	\N	\N
926	130	5	PM_Event	925	21	2014-06-23 00:23:18+08	2014-06-23 00:23:18+08	END	\N	2014-06-23 00:23:18+08	supervisor	926	N	\N	\N	\N
736	105	4	PM_Activity	735	15	2014-06-22 13:41:48+08	2014-06-24 19:04:28+08	DONE	2014-06-22 15:41:48+08	2014-06-24 19:04:28+08	uat_artist1	736	N	2014-06-22 18:42:27+08	2014-06-22 20:42:27+08	1
927	131	1	PM_Event	\N	\N	2014-06-24 17:17:18+08	2014-06-24 17:17:18+08	DONE	\N	2014-06-24 17:17:18+08	ysyow	927	N	\N	\N	\N
936	135	1	PM_Activity	935	1	2014-06-24 18:47:11+08	2014-06-24 19:01:40+08	DONE	2014-06-25 09:30:00+08	2014-06-24 19:01:40+08	uat_supervisor1	936	N	\N	2014-06-25 09:30:00+08	\N
935	135	1	PM_Event	\N	\N	2014-06-24 18:47:11+08	2014-06-24 18:47:11+08	DONE	\N	2014-06-24 18:47:11+08	uat_customer1	935	N	\N	\N	\N
943	135	5	PM_Activity	942	17	2014-06-24 19:02:27+08	2014-06-24 19:02:49+08	DONE	2014-06-25 09:40:00+08	2014-06-24 19:02:49+08	uat_qc1	943	N	\N	2014-06-25 09:40:00+08	\N
937	135	1	PM_Gateway	936	2	2014-06-24 19:01:40+08	2014-06-24 19:01:40+08	DONE	\N	2014-06-24 19:01:40+08	uat_supervisor1	937	N	\N	\N	\N
939	135	2	PM_Event	938	5	2014-06-24 19:01:40+08	2014-06-24 19:02:09+08	DONE	2014-06-25 09:01:00+08	2014-06-24 19:02:09+08	uat_artist1	939	Y	\N	\N	\N
938	135	2	PM_Gateway	937	4	2014-06-24 19:01:40+08	2014-06-24 19:01:40+08	DONE	\N	2014-06-24 19:01:40+08	uat_supervisor1	938	N	\N	\N	\N
945	135	6	PM_Activity	944	23	2014-06-24 19:02:49+08	2014-06-24 19:03:32+08	DONE	2014-06-27 15:00:00+08	2014-06-24 19:03:32+08	uat_customer1	945	N	\N	2014-06-26 09:00:00+08	\N
942	135	4	PM_Activity	941	15	2014-06-24 19:02:09+08	2014-06-24 19:02:27+08	DONE	2014-06-25 11:00:00+08	2014-06-24 19:02:27+08	uat_artist1	942	N	\N	2014-06-25 11:00:00+08	\N
941	135	4	PM_Gateway	939	14	2014-06-24 19:02:09+08	2014-06-24 19:02:09+08	DONE	\N	2014-06-24 19:02:09+08	uat_artist1	941	N	\N	\N	\N
944	135	5	PM_Gateway	943	18	2014-06-24 19:02:49+08	2014-06-24 19:02:49+08	DONE	\N	2014-06-24 19:02:49+08	uat_qc1	944	N	\N	\N	\N
947	135	1	PM_Activity	946	26	2014-06-24 19:03:32+08	2014-06-24 19:03:53+08	DONE	2014-06-25 09:30:00+08	2014-06-24 19:03:52+08	uat_supervisor1	947	N	\N	2014-06-25 09:30:00+08	\N
946	135	6	PM_Gateway	945	24	2014-06-24 19:03:32+08	2014-06-24 19:03:32+08	DONE	\N	2014-06-24 19:03:32+08	uat_customer1	946	N	\N	\N	\N
948	135	1	PM_Gateway	947	2	2014-06-24 19:03:53+08	2014-06-24 19:03:53+08	DONE	\N	2014-06-24 19:03:53+08	uat_supervisor1	948	N	\N	\N	\N
949	135	2	PM_Gateway	948	4	2014-06-24 19:03:53+08	2014-06-24 19:03:53+08	DONE	\N	2014-06-24 19:03:53+08	uat_supervisor1	949	N	\N	\N	\N
982	138	4	PM_Gateway	980	14	2014-06-25 18:22:01+08	2014-06-25 18:22:01+08	DONE	\N	2014-06-25 18:22:01+08	uat_artist4	982	N	\N	\N	\N
951	135	3	PM_Event	949	6	2014-06-24 19:03:53+08	2014-06-24 19:04:18+08	INTERRUPT	\N	2014-06-24 19:03:53+08	uat_artist1	950	Y	2014-06-24 19:03:53+08	2014-06-25 09:01:00+08	\N
950	135	2	PM_Event	949	5	2014-06-24 19:03:53+08	2014-06-24 19:04:18+08	DONE	2014-06-25 09:01:00+08	2014-06-24 19:04:18+08	uat_artist1	950	Y	\N	\N	\N
994	141	2	PM_Event	993	5	2014-06-26 11:16:18+08	2014-06-26 11:16:44+08	DONE	2014-06-26 11:17:18+08	2014-06-26 11:16:44+08	uat_artist4	994	Y	\N	\N	\N
952	135	4	PM_Gateway	950	14	2014-06-24 19:04:18+08	2014-06-24 19:04:18+08	DONE	\N	2014-06-24 19:04:18+08	uat_artist1	952	N	\N	\N	\N
988	138	6	PM_Gateway	986	24	2014-06-25 18:30:17+08	2014-06-25 18:30:17+08	DONE	\N	2014-06-25 18:30:17+08	uat_customer4	988	N	\N	\N	\N
954	105	5	PM_Activity	736	17	2014-06-24 19:04:28+08	2014-06-24 19:05:17+08	DONE	2014-06-25 09:40:00+08	2014-06-24 19:05:17+08	uat_qc1	954	N	\N	2014-06-25 09:40:00+08	\N
989	138	6	PM_Event	988	25	2014-06-25 18:30:17+08	2014-06-25 18:30:17+08	END	\N	2014-06-25 18:30:17+08	uat_customer4	989	N	\N	\N	\N
955	105	5	PM_Gateway	954	18	2014-06-24 19:05:17+08	2014-06-24 19:05:17+08	DONE	\N	2014-06-24 19:05:17+08	uat_qc1	955	N	\N	\N	\N
957	136	1	PM_Event	\N	\N	2014-06-24 19:06:51+08	2014-06-24 19:06:51+08	DONE	\N	2014-06-24 19:06:51+08	uat_customer1	957	N	\N	\N	\N
983	138	4	PM_Activity	982	15	2014-06-25 18:22:01+08	2014-06-25 18:25:26+08	DONE	2014-06-26 11:00:00+08	2014-06-25 18:25:25+08	uat_artist4	983	N	\N	2014-06-26 11:00:00+08	\N
958	136	1	PM_Activity	957	1	2014-06-24 19:06:51+08	2014-06-24 19:07:13+08	DONE	2014-06-25 09:30:00+08	2014-06-24 19:07:13+08	uat_supervisor1	958	N	\N	2014-06-25 09:30:00+08	\N
956	105	6	PM_Activity	955	23	2014-06-24 19:05:17+08	2014-07-01 05:43:30+08	INTERRUPT	2014-06-27 15:00:00+08	2014-07-01 05:43:30+08		956	N	2014-07-01 05:43:30+08	2014-06-26 09:00:00+08	1
856	128	1	PM_Activity	855	1	2014-06-22 22:29:53+08	\N	\N	\N	2014-07-01 17:59:07+08	\N	\N	N	2014-07-01 17:59:07+08	2014-07-01 21:15:00+08	3
953	135	10	PM_Activity	952	16	2014-06-24 19:04:18+08	\N	\N	2014-06-25 09:40:00+08	2014-07-01 18:24:02+08	\N	\N	N	2014-07-01 05:43:30+08	2014-07-01 21:23:30+08	1
959	136	1	PM_Gateway	958	2	2014-06-24 19:07:13+08	2014-06-24 19:07:13+08	DONE	\N	2014-06-24 19:07:13+08	uat_supervisor1	959	N	\N	\N	\N
990	141	1	PM_Event	\N	\N	2014-06-26 11:01:54+08	2014-06-26 11:01:54+08	DONE	\N	2014-06-26 11:01:54+08	uat_customer4	990	N	\N	\N	\N
960	136	2	PM_Gateway	959	4	2014-06-24 19:07:13+08	2014-06-24 19:07:13+08	DONE	\N	2014-06-24 19:07:13+08	uat_supervisor1	960	N	\N	\N	\N
1001	142	2	PM_Gateway	1000	4	2014-06-26 16:33:00+08	2014-06-26 16:33:00+08	DONE	\N	2014-06-26 16:33:00+08	supervisor	1001	N	\N	\N	\N
962	136	3	PM_Event	960	6	2014-06-24 19:07:13+08	2014-06-24 19:07:29+08	INTERRUPT	\N	2014-06-24 19:07:13+08	uat_artist1	961	Y	2014-06-24 19:07:13+08	2014-06-25 09:01:00+08	\N
996	141	4	PM_Gateway	994	14	2014-06-26 11:16:44+08	2014-06-26 11:16:44+08	DONE	\N	2014-06-26 11:16:44+08	uat_artist4	996	N	\N	\N	\N
961	136	2	PM_Event	960	5	2014-06-24 19:07:13+08	2014-06-24 19:07:29+08	DONE	2014-06-25 09:01:00+08	2014-06-24 19:07:29+08	uat_artist1	961	Y	\N	\N	\N
984	138	5	PM_Activity	983	17	2014-06-25 18:25:26+08	2014-06-25 18:27:41+08	DONE	2014-06-26 09:40:00+08	2014-06-25 18:27:41+08	uat_qc1	984	N	\N	2014-06-26 09:40:00+08	\N
963	136	4	PM_Gateway	961	14	2014-06-24 19:07:29+08	2014-06-24 19:07:29+08	DONE	\N	2014-06-24 19:07:29+08	uat_artist1	963	N	\N	\N	\N
969	137	1	PM_Activity	968	1	2014-06-25 17:47:27+08	2014-06-25 18:21:00+08	DONE	2014-06-26 09:17:27+08	2014-06-25 18:21:00+08	uat_supervisor4	969	N	\N	2014-06-26 09:17:27+08	\N
964	136	4	PM_Activity	963	15	2014-06-24 19:07:29+08	2014-06-24 19:07:39+08	DONE	2014-06-25 11:03:00+08	2014-06-24 19:07:39+08	uat_artist1	964	N	\N	2014-06-25 11:03:00+08	\N
991	141	1	PM_Activity	990	1	2014-06-26 11:01:54+08	2014-06-26 11:16:18+08	DONE	2014-06-26 11:31:54+08	2014-06-26 11:16:18+08	uat_supervisor2	991	N	\N	2014-06-26 11:31:54+08	\N
976	137	1	PM_Gateway	969	2	2014-06-25 18:21:00+08	2014-06-25 18:21:00+08	DONE	\N	2014-06-25 18:21:00+08	uat_supervisor4	976	N	\N	\N	\N
965	136	5	PM_Activity	964	17	2014-06-24 19:07:39+08	2014-06-24 19:08:52+08	DONE	2014-06-25 09:41:00+08	2014-06-24 19:08:52+08	uat_qc1	965	N	\N	2014-06-25 09:41:00+08	\N
985	138	5	PM_Gateway	984	18	2014-06-25 18:27:41+08	2014-06-25 18:27:41+08	DONE	\N	2014-06-25 18:27:41+08	uat_qc1	985	N	\N	\N	\N
966	136	5	PM_Gateway	965	18	2014-06-24 19:08:52+08	2014-06-24 19:08:52+08	DONE	\N	2014-06-24 19:08:52+08	uat_qc1	966	N	\N	\N	\N
968	137	1	PM_Event	\N	\N	2014-06-25 17:47:27+08	2014-06-25 17:47:27+08	DONE	\N	2014-06-25 17:47:27+08	uat_customer4	968	N	\N	\N	\N
970	138	1	PM_Event	\N	\N	2014-06-25 18:03:36+08	2014-06-25 18:03:36+08	DONE	\N	2014-06-25 18:03:36+08	uat_customer4	970	N	\N	\N	\N
972	139	1	PM_Event	\N	\N	2014-06-25 18:09:59+08	2014-06-25 18:09:59+08	DONE	\N	2014-06-25 18:09:59+08	uat_customer4	972	N	\N	\N	\N
974	140	1	PM_Event	\N	\N	2014-06-25 18:17:21+08	2014-06-25 18:17:21+08	DONE	\N	2014-06-25 18:17:21+08	ysyow	974	N	\N	\N	\N
971	138	1	PM_Activity	970	1	2014-06-25 18:03:36+08	2014-06-25 18:21:17+08	DONE	2014-06-26 09:30:00+08	2014-06-25 18:21:17+08	uat_supervisor4	971	N	\N	2014-06-26 09:30:00+08	\N
978	138	1	PM_Gateway	971	2	2014-06-25 18:21:17+08	2014-06-25 18:21:17+08	DONE	\N	2014-06-25 18:21:17+08	uat_supervisor4	978	N	\N	\N	\N
992	141	1	PM_Gateway	991	2	2014-06-26 11:16:18+08	2014-06-26 11:16:18+08	DONE	\N	2014-06-26 11:16:18+08	uat_supervisor2	992	N	\N	\N	\N
979	138	2	PM_Gateway	978	4	2014-06-25 18:21:17+08	2014-06-25 18:21:17+08	DONE	\N	2014-06-25 18:21:17+08	uat_supervisor4	979	N	\N	\N	\N
977	137	2	PM_Activity	976	3	2014-06-25 18:21:00+08	2014-06-25 18:28:59+08	DONE	\N	2014-06-25 18:28:59+08	uat_customer4	977	N	\N	\N	\N
981	138	3	PM_Event	979	6	2014-06-25 18:21:17+08	2014-06-25 18:22:01+08	INTERRUPT	\N	2014-06-25 18:21:17+08	uat_artist4	980	Y	2014-06-25 18:21:17+08	2014-06-26 09:01:00+08	\N
980	138	2	PM_Event	979	5	2014-06-25 18:21:17+08	2014-06-25 18:22:01+08	DONE	2014-06-26 09:01:00+08	2014-06-25 18:22:01+08	uat_artist4	980	Y	\N	\N	\N
993	141	2	PM_Gateway	992	4	2014-06-26 11:16:18+08	2014-06-26 11:16:18+08	DONE	\N	2014-06-26 11:16:18+08	uat_supervisor2	993	N	\N	\N	\N
986	138	6	PM_Activity	985	23	2014-06-25 18:27:41+08	2014-06-25 18:30:17+08	DONE	2014-06-28 15:00:00+08	2014-06-25 18:30:17+08	uat_customer4	986	N	\N	2014-06-27 09:00:00+08	\N
998	142	1	PM_Event	\N	\N	2014-06-26 16:27:30+08	2014-06-26 16:27:30+08	DONE	\N	2014-06-26 16:27:30+08	ysyow	998	N	\N	\N	\N
995	141	3	PM_Event	993	6	2014-06-26 11:16:18+08	2014-06-26 11:16:44+08	INTERRUPT	\N	2014-06-26 11:16:18+08	uat_artist4	994	Y	2014-06-26 11:16:18+08	2014-06-26 11:17:18+08	\N
1002	142	2	PM_Event	1001	5	2014-06-26 16:33:00+08	2014-06-26 16:33:40+08	DONE	2014-06-26 16:34:00+08	2014-06-26 16:33:40+08	artist2	1002	Y	\N	\N	\N
999	142	1	PM_Activity	998	1	2014-06-26 16:27:30+08	2014-06-26 16:33:00+08	DONE	2014-06-26 16:57:30+08	2014-06-26 16:33:00+08	supervisor	999	N	\N	2014-06-26 16:57:30+08	\N
1003	142	3	PM_Event	1001	6	2014-06-26 16:33:00+08	2014-06-26 16:33:40+08	INTERRUPT	\N	2014-06-26 16:33:00+08	artist2	1002	Y	2014-06-26 16:33:00+08	2014-06-26 16:34:00+08	\N
1000	142	1	PM_Gateway	999	2	2014-06-26 16:33:00+08	2014-06-26 16:33:00+08	DONE	\N	2014-06-26 16:33:00+08	supervisor	1000	N	\N	\N	\N
1005	142	14	PM_Activity	1004	15	2014-06-26 16:33:40+08	2014-06-26 16:33:40+08	DONE	\N	2014-06-26 16:33:40+08	artist2	1005	N	\N	\N	\N
1004	142	4	PM_Gateway	1002	14	2014-06-26 16:33:40+08	2014-06-26 16:33:40+08	DONE	\N	2014-06-26 16:33:40+08	artist2	1004	N	\N	\N	\N
1007	143	1	PM_Event	\N	\N	2014-06-30 14:43:13+08	2014-06-30 14:43:14+08	DONE	\N	2014-06-30 14:43:13+08	admin	1007	N	\N	\N	\N
1008	143	1	PM_Activity	1007	1	2014-06-30 14:43:14+08	2014-06-30 14:44:38+08	DONE	2014-06-30 15:13:14+08	2014-06-30 14:44:38+08	supervisor	1008	N	\N	2014-06-30 14:58:14+08	\N
1009	143	1	PM_Gateway	1008	2	2014-06-30 14:44:38+08	2014-06-30 14:44:38+08	DONE	\N	2014-06-30 14:44:38+08	supervisor	1009	N	\N	\N	\N
1010	143	2	PM_Gateway	1009	4	2014-06-30 14:44:38+08	2014-06-30 14:44:38+08	DONE	\N	2014-06-30 14:44:38+08	supervisor	1010	N	\N	\N	\N
1012	143	3	PM_Event	1010	6	2014-06-30 14:44:38+08	2014-06-30 14:46:15+08	INTERRUPT	\N	2014-06-30 14:44:38+08	artist2	1011	Y	2014-06-30 14:44:38+08	2014-06-30 14:49:38+08	\N
1011	143	2	PM_Event	1010	5	2014-06-30 14:44:38+08	2014-06-30 14:46:15+08	DONE	2014-06-30 14:45:38+08	2014-06-30 14:46:15+08	artist2	1011	Y	\N	\N	\N
1013	143	4	PM_Gateway	1011	14	2014-06-30 14:46:15+08	2014-06-30 14:46:15+08	DONE	\N	2014-06-30 14:46:15+08	artist2	1013	N	\N	\N	\N
1014	143	14	PM_Activity	1013	15	2014-06-30 14:46:15+08	2014-06-30 14:46:15+08	DONE	\N	2014-06-30 14:46:15+08	artist2	1014	N	\N	\N	\N
1015	143	4	PM_Activity	1014	34	2014-06-30 14:46:15+08	2014-06-30 14:46:46+08	DONE	2014-07-01 10:46:15+08	2014-06-30 14:46:45+08	artist2	1015	N	\N	2014-07-01 10:46:15+08	\N
975	140	1	PM_Activity	974	1	2014-06-25 18:17:21+08	2014-07-01 17:43:12+08	DONE	2014-06-26 09:30:00+08	2014-07-01 17:43:12+08	uat_supervisor1	975	N	2014-07-01 05:43:32+08	2014-07-01 05:58:32+08	1
1017	109	7	PM_Activity	687	27	2014-07-01 05:43:20+08	2014-07-01 05:43:22+08	DONE	\N	2014-07-01 05:43:20+08		1017	N	\N	\N	\N
1018	109	5	PM_Event	1017	28	2014-07-01 05:43:22+08	2014-07-01 05:43:22+08	END	\N	2014-07-01 05:43:22+08		1018	N	\N	\N	\N
1019	110	11	PM_Activity	712	31	2014-07-01 05:43:22+08	2014-07-01 05:43:22+08	DONE	\N	2014-07-01 05:43:22+08		1019	N	\N	\N	\N
1020	110	5	PM_Event	1019	21	2014-07-01 05:43:22+08	2014-07-01 05:43:22+08	END	\N	2014-07-01 05:43:22+08		1020	N	\N	\N	\N
762	112	1	PM_Activity	761	7	2014-06-22 15:55:16+08	\N	\N	2014-06-22 16:25:16+08	2014-07-01 17:59:08+08	\N	\N	N	2014-07-01 17:59:08+08	2014-07-01 21:15:00+08	4
1021	112	7	PM_Activity	762	27	2014-07-01 05:43:22+08	2014-07-01 05:43:23+08	DONE	\N	2014-07-01 05:43:22+08		1021	N	\N	\N	\N
1022	112	5	PM_Event	1021	28	2014-07-01 05:43:23+08	2014-07-01 05:43:23+08	END	\N	2014-07-01 05:43:23+08		1022	N	\N	\N	\N
1023	117	7	PM_Activity	815	27	2014-07-01 05:43:23+08	2014-07-01 05:43:23+08	DONE	\N	2014-07-01 05:43:23+08		1023	N	\N	\N	\N
1024	117	5	PM_Event	1023	28	2014-07-01 05:43:23+08	2014-07-01 05:43:23+08	END	\N	2014-07-01 05:43:23+08		1024	N	\N	\N	\N
1025	118	7	PM_Activity	817	27	2014-07-01 05:43:23+08	2014-07-01 05:43:24+08	DONE	\N	2014-07-01 05:43:23+08		1025	N	\N	\N	\N
712	110	10	PM_Activity	711	16	2014-06-22 00:07:59+08	\N	\N	2014-06-23 09:10:00+08	2014-07-01 23:16:01+08	\N	\N	N	2014-07-01 05:43:22+08	2014-07-01 05:53:22+08	1
997	141	4	PM_Activity	996	15	2014-06-26 11:16:44+08	\N	\N	2014-06-26 16:16:44+08	2014-07-01 05:43:31+08	\N	\N	N	2014-07-01 05:43:31+08	2014-07-02 01:43:31+08	1
987	137	1	PM_Activity	977	7	2014-06-25 18:28:59+08	\N	\N	2014-06-26 09:30:00+08	2014-07-01 17:59:09+08	\N	\N	N	2014-07-01 17:59:09+08	2014-07-01 21:15:00+08	2
973	139	1	PM_Activity	972	1	2014-06-25 18:09:59+08	2014-07-01 17:43:57+08	DONE	2014-06-26 09:30:00+08	2014-07-01 17:43:57+08	uat_supervisor1	973	N	2014-07-01 05:43:30+08	2014-07-01 05:58:30+08	1
1006	142	4	PM_Activity	1005	34	2014-06-26 16:33:40+08	\N	\N	2014-06-27 12:33:40+08	2014-07-01 05:43:33+08	\N	\N	N	2014-07-01 05:43:33+08	2014-07-02 01:43:33+08	1
1026	118	5	PM_Event	1025	28	2014-07-01 05:43:24+08	2014-07-01 05:43:24+08	END	\N	2014-07-01 05:43:24+08		1026	N	\N	\N	\N
1027	125	7	PM_Activity	850	27	2014-07-01 05:43:24+08	2014-07-01 05:43:25+08	DONE	\N	2014-07-01 05:43:24+08		1027	N	\N	\N	\N
1049	139	7	PM_Activity	973	27	2014-07-01 05:43:30+08	2014-07-01 05:43:31+08	DONE	\N	2014-07-01 05:43:30+08		1049	N	\N	\N	\N
1028	125	5	PM_Event	1027	28	2014-07-01 05:43:25+08	2014-07-01 05:43:25+08	END	\N	2014-07-01 05:43:25+08		1028	N	\N	\N	\N
1029	126	7	PM_Activity	852	27	2014-07-01 05:43:25+08	2014-07-01 05:43:26+08	DONE	\N	2014-07-01 05:43:25+08		1029	N	\N	\N	\N
1076	125	5	PM_Event	1075	28	2014-07-01 17:59:05+08	2014-07-01 17:59:05+08	END	\N	2014-07-01 17:59:05+08		1076	N	\N	\N	\N
1030	126	5	PM_Event	1029	28	2014-07-01 05:43:26+08	2014-07-01 05:43:26+08	END	\N	2014-07-01 05:43:26+08		1030	N	\N	\N	\N
1050	139	5	PM_Event	1049	28	2014-07-01 05:43:31+08	2014-07-01 05:43:31+08	END	\N	2014-07-01 05:43:31+08		1050	N	\N	\N	\N
1031	127	7	PM_Activity	854	27	2014-07-01 05:43:26+08	2014-07-01 05:43:26+08	DONE	\N	2014-07-01 05:43:26+08		1031	N	\N	\N	\N
1032	127	5	PM_Event	1031	28	2014-07-01 05:43:26+08	2014-07-01 05:43:26+08	END	\N	2014-07-01 05:43:26+08		1032	N	\N	\N	\N
1073	118	7	PM_Activity	817	27	2014-07-01 17:59:03+08	2014-07-01 17:59:04+08	DONE	\N	2014-07-01 17:59:03+08		1073	N	\N	\N	\N
1033	124	7	PM_Activity	848	27	2014-07-01 05:43:26+08	2014-07-01 05:43:27+08	DONE	\N	2014-07-01 05:43:26+08		1033	N	\N	\N	\N
1051	141	11	PM_Activity	997	29	2014-07-01 05:43:31+08	2014-07-01 05:43:31+08	DONE	\N	2014-07-01 05:43:31+08		1051	N	\N	\N	\N
1034	124	5	PM_Event	1033	28	2014-07-01 05:43:27+08	2014-07-01 05:43:27+08	END	\N	2014-07-01 05:43:27+08		1034	N	\N	\N	\N
932	133	1	PM_Activity	931	1	2014-06-24 18:38:42+08	\N	\N	2014-06-25 09:30:00+08	2014-07-01 17:59:10+08	\N	\N	N	2014-07-01 17:59:10+08	2014-07-01 21:15:00+08	2
1035	133	7	PM_Activity	932	27	2014-07-01 05:43:27+08	2014-07-01 05:43:28+08	DONE	\N	2014-07-01 05:43:27+08		1035	N	\N	\N	\N
1036	133	5	PM_Event	1035	28	2014-07-01 05:43:28+08	2014-07-01 05:43:28+08	END	\N	2014-07-01 05:43:28+08		1036	N	\N	\N	\N
1052	141	5	PM_Event	1051	21	2014-07-01 05:43:31+08	2014-07-01 05:43:31+08	END	\N	2014-07-01 05:43:31+08		1052	N	\N	\N	\N
1037	131	7	PM_Activity	928	27	2014-07-01 05:43:28+08	2014-07-01 05:43:29+08	DONE	\N	2014-07-01 05:43:28+08		1037	N	\N	\N	\N
1038	131	5	PM_Event	1037	28	2014-07-01 05:43:29+08	2014-07-01 05:43:29+08	END	\N	2014-07-01 05:43:29+08		1038	N	\N	\N	\N
1039	128	7	PM_Activity	856	27	2014-07-01 05:43:29+08	2014-07-01 05:43:29+08	DONE	\N	2014-07-01 05:43:29+08		1039	N	\N	\N	\N
1053	137	7	PM_Activity	987	27	2014-07-01 05:43:31+08	2014-07-01 05:43:32+08	DONE	\N	2014-07-01 05:43:31+08		1053	N	\N	\N	\N
1040	128	5	PM_Event	1039	28	2014-07-01 05:43:29+08	2014-07-01 05:43:29+08	END	\N	2014-07-01 05:43:29+08		1040	N	\N	\N	\N
1041	134	7	PM_Activity	934	27	2014-07-01 05:43:29+08	2014-07-01 05:43:30+08	DONE	\N	2014-07-01 05:43:29+08		1041	N	\N	\N	\N
934	134	1	PM_Activity	933	1	2014-06-24 18:41:09+08	2014-07-01 17:48:19+08	DONE	2014-06-25 09:30:00+08	2014-07-01 17:48:19+08	uat_supervisor1	934	N	2014-07-01 05:43:29+08	2014-07-01 05:58:29+08	1
1042	134	5	PM_Event	1041	28	2014-07-01 05:43:30+08	2014-07-01 05:43:30+08	END	\N	2014-07-01 05:43:30+08		1042	N	\N	\N	\N
1054	137	5	PM_Event	1053	28	2014-07-01 05:43:32+08	2014-07-01 05:43:32+08	END	\N	2014-07-01 05:43:32+08		1054	N	\N	\N	\N
1043	135	11	PM_Activity	953	31	2014-07-01 05:43:30+08	2014-07-01 05:43:30+08	DONE	\N	2014-07-01 05:43:30+08		1043	N	\N	\N	\N
1044	135	5	PM_Event	1043	21	2014-07-01 05:43:30+08	2014-07-01 05:43:30+08	END	\N	2014-07-01 05:43:30+08		1044	N	\N	\N	\N
1045	105	13	PM_Activity	956	32	2014-07-01 05:43:30+08	2014-07-01 05:43:30+08	ERROR	\N	2014-07-01 05:43:30+08		1045	N	\N	\N	\N
1055	140	7	PM_Activity	975	27	2014-07-01 05:43:32+08	2014-07-01 05:43:33+08	DONE	\N	2014-07-01 05:43:32+08		1055	N	\N	\N	\N
1046	105	6	PM_Event	1045	33	2014-07-01 05:43:30+08	2014-07-01 05:43:30+08	END	\N	2014-07-01 05:43:30+08		1046	N	\N	\N	\N
967	136	6	PM_Activity	966	23	2014-06-24 19:08:52+08	2014-07-01 05:43:30+08	INTERRUPT	2014-06-27 15:00:00+08	2014-07-01 05:43:30+08		967	N	2014-07-01 05:43:30+08	2014-06-26 09:00:00+08	1
1047	136	13	PM_Activity	967	32	2014-07-01 05:43:30+08	2014-07-01 05:43:30+08	ERROR	\N	2014-07-01 05:43:30+08		1047	N	\N	\N	\N
877	123	10	PM_Activity	876	19	2014-06-22 22:42:50+08	\N	\N	2014-06-22 23:35:50+08	2014-07-01 23:16:01+08	\N	\N	N	2014-06-23 00:23:17+08	2014-06-23 09:53:00+08	1
1048	136	6	PM_Event	1047	33	2014-07-01 05:43:30+08	2014-07-01 05:43:30+08	END	\N	2014-07-01 05:43:30+08		1048	N	\N	\N	\N
1056	140	5	PM_Event	1055	28	2014-07-01 05:43:33+08	2014-07-01 05:43:33+08	END	\N	2014-07-01 05:43:33+08		1056	N	\N	\N	\N
1057	142	11	PM_Activity	1006	29	2014-07-01 05:43:33+08	2014-07-01 05:43:33+08	DONE	\N	2014-07-01 05:43:33+08		1057	N	\N	\N	\N
1058	142	5	PM_Event	1057	21	2014-07-01 05:43:33+08	2014-07-01 05:43:33+08	END	\N	2014-07-01 05:43:33+08		1058	N	\N	\N	\N
1063	140	1	PM_Gateway	975	2	2014-07-01 17:43:12+08	2014-07-01 17:43:13+08	DONE	\N	2014-07-01 17:43:12+08	uat_supervisor1	1063	N	\N	\N	\N
1059	143	12	PM_Activity	1016	30	2014-07-01 05:43:33+08	2014-07-01 05:43:33+08	DONE	\N	2014-07-01 05:43:33+08		1059	N	\N	\N	\N
1064	140	2	PM_Activity	1063	3	2014-07-01 17:43:13+08	\N	\N	\N	\N	\N	\N	N	\N	\N	\N
1060	143	5	PM_Event	1059	22	2014-07-01 05:43:33+08	2014-07-01 05:43:33+08	END	\N	2014-07-01 05:43:33+08		1060	N	\N	\N	\N
1069	134	1	PM_Gateway	934	2	2014-07-01 17:48:19+08	2014-07-01 17:48:19+08	DONE	\N	2014-07-01 17:48:19+08	uat_supervisor1	1069	N	\N	\N	\N
1065	139	1	PM_Gateway	973	2	2014-07-01 17:43:57+08	2014-07-01 17:43:57+08	DONE	\N	2014-07-01 17:43:57+08	uat_supervisor1	1065	N	\N	\N	\N
1070	134	2	PM_Activity	1069	3	2014-07-01 17:48:19+08	\N	\N	\N	\N	\N	\N	N	\N	\N	\N
1066	139	2	PM_Gateway	1065	4	2014-07-01 17:43:57+08	2014-07-01 17:43:57+08	DONE	\N	2014-07-01 17:43:57+08	uat_supervisor1	1066	N	\N	\N	\N
1061	144	1	PM_Event	\N	\N	2014-07-01 17:16:12+08	2014-07-01 17:16:12+08	DONE	\N	2014-07-01 17:16:12+08	uat_customer1	1061	N	\N	\N	\N
1062	144	1	PM_Activity	1061	1	2014-07-01 17:16:12+08	\N	\N	2014-07-01 21:30:00+08	\N	\N	\N	N	\N	2014-07-01 21:15:00+08	\N
1074	118	5	PM_Event	1073	28	2014-07-01 17:59:04+08	2014-07-01 17:59:04+08	END	\N	2014-07-01 17:59:04+08		1074	N	\N	\N	\N
1071	117	7	PM_Activity	815	27	2014-07-01 17:59:02+08	2014-07-01 17:59:03+08	DONE	\N	2014-07-01 17:59:02+08		1071	N	\N	\N	\N
1016	143	5	PM_Activity	1015	17	2014-06-30 14:46:46+08	2014-07-01 18:44:27+08	DONE	2014-06-30 16:26:46+08	2014-07-01 18:44:26+08	uat_qc2	1016	N	2014-07-01 05:43:33+08	2014-07-01 22:23:33+08	1
1078	126	5	PM_Event	1077	28	2014-07-01 17:59:06+08	2014-07-01 17:59:06+08	END	\N	2014-07-01 17:59:06+08		1078	N	\N	\N	\N
1072	117	5	PM_Event	1071	28	2014-07-01 17:59:03+08	2014-07-01 17:59:03+08	END	\N	2014-07-01 17:59:03+08		1072	N	\N	\N	\N
1075	125	7	PM_Activity	850	27	2014-07-01 17:59:04+08	2014-07-01 17:59:05+08	DONE	\N	2014-07-01 17:59:04+08		1075	N	\N	\N	\N
1077	126	7	PM_Activity	852	27	2014-07-01 17:59:05+08	2014-07-01 17:59:06+08	DONE	\N	2014-07-01 17:59:05+08		1077	N	\N	\N	\N
1080	127	5	PM_Event	1079	28	2014-07-01 17:59:06+08	2014-07-01 17:59:06+08	END	\N	2014-07-01 17:59:06+08		1080	N	\N	\N	\N
1079	127	7	PM_Activity	854	27	2014-07-01 17:59:06+08	2014-07-01 17:59:06+08	DONE	\N	2014-07-01 17:59:06+08		1079	N	\N	\N	\N
1081	124	7	PM_Activity	848	27	2014-07-01 17:59:06+08	2014-07-01 17:59:07+08	DONE	\N	2014-07-01 17:59:06+08		1081	N	\N	\N	\N
1082	124	5	PM_Event	1081	28	2014-07-01 17:59:07+08	2014-07-01 17:59:07+08	END	\N	2014-07-01 17:59:07+08		1082	N	\N	\N	\N
1083	128	7	PM_Activity	856	27	2014-07-01 17:59:07+08	2014-07-01 17:59:08+08	DONE	\N	2014-07-01 17:59:07+08		1083	N	\N	\N	\N
1084	128	5	PM_Event	1083	28	2014-07-01 17:59:08+08	2014-07-01 17:59:08+08	END	\N	2014-07-01 17:59:08+08		1084	N	\N	\N	\N
1085	112	7	PM_Activity	762	27	2014-07-01 17:59:08+08	2014-07-01 17:59:08+08	DONE	\N	2014-07-01 17:59:08+08		1085	N	\N	\N	\N
1086	112	5	PM_Event	1085	28	2014-07-01 17:59:08+08	2014-07-01 17:59:08+08	END	\N	2014-07-01 17:59:08+08		1086	N	\N	\N	\N
1067	139	2	PM_Event	1066	5	2014-07-01 17:43:57+08	2014-07-01 18:04:19+08	DONE	2014-07-01 21:01:00+08	2014-07-01 18:04:19+08	uat_artist1	1067	Y	\N	\N	\N
1087	109	7	PM_Activity	687	27	2014-07-01 17:59:09+08	2014-07-01 17:59:09+08	DONE	\N	2014-07-01 17:59:09+08		1087	N	\N	\N	\N
1088	109	5	PM_Event	1087	28	2014-07-01 17:59:09+08	2014-07-01 17:59:09+08	END	\N	2014-07-01 17:59:09+08		1088	N	\N	\N	\N
1089	137	7	PM_Activity	987	27	2014-07-01 17:59:09+08	2014-07-01 17:59:10+08	DONE	\N	2014-07-01 17:59:09+08		1089	N	\N	\N	\N
1090	137	5	PM_Event	1089	28	2014-07-01 17:59:10+08	2014-07-01 17:59:10+08	END	\N	2014-07-01 17:59:10+08		1090	N	\N	\N	\N
1091	133	7	PM_Activity	932	27	2014-07-01 17:59:10+08	2014-07-01 17:59:11+08	DONE	\N	2014-07-01 17:59:10+08		1091	N	\N	\N	\N
1092	133	5	PM_Event	1091	28	2014-07-01 17:59:11+08	2014-07-01 17:59:11+08	END	\N	2014-07-01 17:59:11+08		1092	N	\N	\N	\N
1093	131	7	PM_Activity	928	27	2014-07-01 17:59:11+08	2014-07-01 17:59:11+08	DONE	\N	2014-07-01 17:59:11+08		1093	N	\N	\N	\N
1094	131	5	PM_Event	1093	28	2014-07-01 17:59:11+08	2014-07-01 17:59:11+08	END	\N	2014-07-01 17:59:11+08		1094	N	\N	\N	\N
1068	139	3	PM_Event	1066	6	2014-07-01 17:43:57+08	2014-07-01 18:04:19+08	INTERRUPT	\N	2014-07-01 17:43:57+08	uat_artist1	1067	Y	2014-07-01 17:43:57+08	2014-07-01 21:05:00+08	\N
1095	139	4	PM_Gateway	1067	14	2014-07-01 18:04:19+08	2014-07-01 18:04:19+08	DONE	\N	2014-07-01 18:04:19+08	uat_artist1	1095	N	\N	\N	\N
1096	139	14	PM_Activity	1095	15	2014-07-01 18:04:19+08	2014-07-01 18:04:19+08	DONE	\N	2014-07-01 18:04:19+08	uat_artist1	1096	N	\N	\N	\N
1097	139	4	PM_Activity	1096	34	2014-07-01 18:04:19+08	2014-07-01 18:20:51+08	DONE	2014-07-02 01:10:00+08	2014-07-01 18:20:51+08	uat_artist1	1097	N	\N	2014-07-02 01:10:00+08	\N
1099	143	5	PM_Gateway	1016	18	2014-07-01 18:44:27+08	2014-07-01 18:44:27+08	DONE	\N	2014-07-01 18:44:27+08	uat_qc2	1099	N	\N	\N	\N
1098	139	5	PM_Activity	1097	17	2014-07-01 18:20:51+08	2014-07-01 18:46:16+08	DONE	2014-07-01 22:23:00+08	2014-07-01 18:46:16+08	uat_qc2	1098	N	\N	2014-07-01 22:23:00+08	\N
1101	139	5	PM_Gateway	1098	18	2014-07-01 18:46:16+08	2014-07-01 18:46:17+08	DONE	\N	2014-07-01 18:46:16+08	uat_qc2	1101	N	\N	\N	\N
1102	139	10	PM_Activity	1101	19	2014-07-01 18:46:17+08	\N	\N	2014-07-01 22:23:00+08	\N	\N	\N	N	\N	2014-07-01 22:23:00+08	\N
1103	145	1	PM_Event	\N	\N	2014-07-01 23:03:33+08	2014-07-01 23:03:33+08	DONE	\N	2014-07-01 23:03:33+08	uat_customer4	1103	N	\N	\N	\N
1104	145	1	PM_Activity	1103	1	2014-07-01 23:03:33+08	\N	\N	2014-07-01 23:33:33+08	\N	\N	\N	N	\N	2014-07-01 23:18:33+08	\N
1119	147	3	PM_Event	1117	6	2014-07-03 12:44:22+08	2014-07-03 14:08:34+08	INTERRUPT	\N	2014-07-03 12:44:22+08	uat_artist1	1118	Y	2014-07-03 12:44:22+08	2014-07-03 12:49:22+08	\N
1100	143	6	PM_Activity	1099	23	2014-07-01 18:44:27+08	\N	\N	2014-07-04 03:00:00+08	2014-07-01 15:49:27+08	\N	\N	N	\N	2014-07-02 21:00:00+08	\N
1118	147	2	PM_Event	1117	5	2014-07-03 12:44:22+08	2014-07-03 14:08:34+08	DONE	2014-07-03 12:45:22+08	2014-07-03 14:08:34+08	uat_artist1	1118	Y	\N	\N	\N
928	131	1	PM_Activity	927	1	2014-06-24 17:17:18+08	\N	\N	2014-06-24 17:47:18+08	2014-07-03 10:14:35+08	\N	\N	N	2014-07-01 17:59:11+08	2014-07-01 21:15:00+08	2
1105	146	1	PM_Event	\N	\N	2014-07-03 12:42:16+08	2014-07-03 12:42:16+08	DONE	\N	2014-07-03 12:42:16+08	uat_customer1	1105	N	\N	\N	\N
1106	146	1	PM_Activity	1105	1	2014-07-03 12:42:16+08	2014-07-03 12:42:55+08	DONE	2014-07-03 13:12:16+08	2014-07-03 12:42:54+08	uat_supervisor1	1106	N	\N	2014-07-03 12:57:16+08	\N
1120	147	4	PM_Gateway	1118	14	2014-07-03 14:08:34+08	2014-07-03 14:08:34+08	DONE	\N	2014-07-03 14:08:34+08	uat_artist1	1120	N	\N	\N	\N
1107	146	1	PM_Gateway	1106	2	2014-07-03 12:42:55+08	2014-07-03 12:42:55+08	DONE	\N	2014-07-03 12:42:55+08	uat_supervisor1	1107	N	\N	\N	\N
1108	146	2	PM_Gateway	1107	4	2014-07-03 12:42:55+08	2014-07-03 12:42:55+08	DONE	\N	2014-07-03 12:42:55+08	uat_supervisor1	1108	N	\N	\N	\N
1121	147	14	PM_Activity	1120	15	2014-07-03 14:08:34+08	2014-07-03 14:08:34+08	DONE	\N	2014-07-03 14:08:34+08	uat_artist1	1121	N	\N	\N	\N
1110	146	3	PM_Event	1108	6	2014-07-03 12:42:55+08	2014-07-03 12:43:10+08	INTERRUPT	\N	2014-07-03 12:42:55+08	uat_artist1	1109	Y	2014-07-03 12:42:55+08	2014-07-03 12:47:55+08	\N
1122	147	4	PM_Activity	1121	34	2014-07-03 14:08:34+08	\N	\N	2014-07-04 09:08:34+08	\N	\N	\N	N	\N	2014-07-04 09:08:34+08	\N
1109	146	2	PM_Event	1108	5	2014-07-03 12:42:55+08	2014-07-03 12:43:10+08	DONE	2014-07-03 12:43:55+08	2014-07-03 12:43:10+08	uat_artist1	1109	Y	\N	\N	\N
1111	146	4	PM_Gateway	1109	14	2014-07-03 12:43:10+08	2014-07-03 12:43:10+08	DONE	\N	2014-07-03 12:43:10+08	uat_artist1	1111	N	\N	\N	\N
1112	146	14	PM_Activity	1111	15	2014-07-03 12:43:10+08	2014-07-03 12:43:11+08	DONE	\N	2014-07-03 12:43:10+08	uat_artist1	1112	N	\N	\N	\N
1113	146	4	PM_Activity	1112	34	2014-07-03 12:43:11+08	\N	\N	2014-07-03 17:43:11+08	\N	\N	\N	N	\N	2014-07-03 17:43:11+08	\N
1114	147	1	PM_Event	\N	\N	2014-07-03 12:43:59+08	2014-07-03 12:43:59+08	DONE	\N	2014-07-03 12:43:59+08	uat_customer1	1114	N	\N	\N	\N
1115	147	1	PM_Activity	1114	1	2014-07-03 12:43:59+08	2014-07-03 12:44:21+08	DONE	2014-07-03 13:13:59+08	2014-07-03 12:44:21+08	uat_supervisor1	1115	N	\N	2014-07-03 12:58:59+08	\N
1116	147	1	PM_Gateway	1115	2	2014-07-03 12:44:21+08	2014-07-03 12:44:21+08	DONE	\N	2014-07-03 12:44:21+08	uat_supervisor1	1116	N	\N	\N	\N
1117	147	2	PM_Gateway	1116	4	2014-07-03 12:44:21+08	2014-07-03 12:44:22+08	DONE	\N	2014-07-03 12:44:21+08	uat_supervisor1	1117	N	\N	\N	\N
687	109	1	PM_Activity	686	1	2014-06-21 22:17:31+08	\N	\N	2014-06-21 22:47:31+08	2014-07-03 14:07:45+08	\N	\N	N	2014-07-01 17:59:09+08	2014-07-01 21:15:00+08	6
\.


--
-- Name: fcpmcaseflow_pmf_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcpmcaseflow_pmf_id_seq', 1122, true);


--
-- Data for Name: fcpmcaseflowassign; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) FROM stdin;
12	633	\N	\N	\N	REQUEST_NEWJOB
13	634	\N	1	19	\N
14	637	artist1	\N	\N	\N
15	640	artist1	\N	\N	\N
16	641	\N	1	18	\N
17	642	\N	\N	\N	REQUEST_NEWJOB
18	643	\N	1	19	\N
19	644	\N	\N	\N	REQUEST_NEWJOB
20	645	\N	1	19	\N
21	647	admin2	\N	\N	\N
22	650	\N	\N	\N	REQUEST_NEWJOB
23	651	\N	1	19	\N
24	656	uat_cust1	\N	\N	\N
25	657	\N	1	19	\N
26	659	uat_cust1	\N	\N	\N
27	660	\N	1	19	\N
28	663	uat_artist1	\N	\N	\N
29	666	uat_artist1	\N	\N	\N
30	667	\N	1	18	\N
31	668	\N	\N	\N	REQUEST_NEWJOB
32	669	\N	1	19	\N
33	672	uat_artist1	\N	\N	\N
34	676	uat_artist1	\N	\N	\N
35	680	uat_artist1	\N	\N	\N
36	683	uat_artist1	\N	\N	\N
37	685	uat_artist1	\N	\N	\N
38	686	\N	\N	\N	REQUEST_NEWJOB
39	687	\N	1	19	\N
40	688	\N	\N	\N	REQUEST_NEWJOB
41	689	\N	1	19	\N
42	692	uat_artist1	\N	\N	\N
43	698	uat_artist1	\N	\N	\N
44	699	\N	1	19	\N
45	700	\N	1	19	\N
46	701	\N	1	18	\N
47	702	\N	1	18	\N
48	704	uat_artist1	\N	\N	\N
49	706	uat_artist1	\N	\N	\N
50	707	\N	1	18	\N
51	709	uat_artist1	\N	\N	\N
52	712	uat_artist1	\N	\N	\N
53	714	uat_cust1	\N	\N	\N
54	716	uat_cust1	\N	\N	\N
55	720	\N	1	19	\N
56	723	uat_artist1	\N	\N	\N
57	726	uat_artist1	\N	\N	\N
58	733	uat_artist1	\N	\N	\N
59	734	\N	1	19	\N
60	736	uat_artist1	\N	\N	\N
61	737	\N	\N	\N	REQUEST_NEWJOB
62	738	\N	1	19	\N
63	741	uat_artist1	\N	\N	\N
64	749	uat_artist1	\N	\N	\N
65	750	\N	1	19	\N
66	751	\N	1	19	\N
67	752	\N	\N	\N	REQUEST_NEWJOB
68	753	\N	1	19	\N
69	754	\N	\N	\N	REQUEST_NEWJOB
70	755	\N	1	19	\N
71	756	\N	\N	\N	REQUEST_NEWJOB
72	757	\N	1	19	\N
73	758	\N	\N	\N	REQUEST_NEWJOB
74	759	\N	1	19	\N
75	761	ysyow	\N	\N	\N
76	762	\N	1	19	\N
77	765	artist2	\N	\N	\N
78	767	\N	\N	\N	REQUEST_NEWJOB
79	768	\N	1	19	\N
80	771	artist2	\N	\N	\N
81	774	artist2	\N	\N	\N
82	776	artist2	\N	\N	\N
83	779	artist2	\N	\N	\N
84	782	artist2	\N	\N	\N
85	783	\N	1	18	\N
86	785	ysyow	\N	\N	\N
87	787	\N	1	19	\N
88	790	artist2	\N	\N	\N
89	793	artist2	\N	\N	\N
90	794	\N	1	18	\N
91	796	ysyow	\N	\N	\N
92	800	ysyow	\N	\N	\N
93	801	\N	\N	\N	REQUEST_NEWJOB
94	802	\N	1	19	\N
95	804	uat_customer1	\N	\N	\N
96	815	\N	1	19	\N
97	816	\N	\N	\N	REQUEST_NEWJOB
98	817	\N	1	19	\N
99	818	\N	\N	\N	REQUEST_NEWJOB
100	819	\N	1	19	\N
101	821	uat_customer1	\N	\N	\N
102	822	\N	1	19	\N
105	827	uat_artist1	\N	\N	\N
106	830	uat_artist1	\N	\N	\N
107	831	\N	\N	\N	REQUEST_NEWJOB
108	832	\N	1	19	\N
109	833	\N	1	18	\N
110	835	uat_customer1	\N	\N	\N
111	838	esp_artist	\N	\N	\N
112	841	uat_artist3	\N	\N	\N
113	843	\N	\N	\N	REQUEST_NEWJOB
114	844	\N	1	19	\N
115	845	\N	\N	\N	REQUEST_NEWJOB
116	846	\N	1	19	\N
117	847	\N	\N	\N	REQUEST_NEWJOB
118	848	\N	1	19	\N
119	849	\N	\N	\N	REQUEST_NEWJOB
120	850	\N	1	19	\N
121	851	\N	\N	\N	REQUEST_NEWJOB
122	852	\N	1	19	\N
123	853	\N	\N	\N	REQUEST_NEWJOB
124	854	\N	1	19	\N
125	855	\N	\N	\N	REQUEST_NEWJOB
126	856	\N	1	19	\N
127	857	\N	\N	\N	REQUEST_NEWJOB
128	858	\N	1	19	\N
129	861	artist2	\N	\N	\N
130	865	artist1	\N	\N	\N
131	869	uat_artist2	\N	\N	\N
132	872	uat_artist2	\N	\N	\N
133	873	\N	1	18	\N
134	874	\N	\N	\N	REQUEST_NEWJOB
135	875	\N	1	19	\N
136	877	uat_artist2	\N	\N	\N
137	880	uat_artist3	\N	\N	\N
138	883	uat_artist3	\N	\N	\N
139	884	\N	1	18	\N
140	886	uat_artist3	\N	\N	\N
141	909	esp_artist	\N	\N	\N
142	910	\N	1	19	\N
143	913	uat_artist3	\N	\N	\N
144	914	\N	1	19	\N
145	919	artist2	\N	\N	\N
146	920	\N	1	19	\N
147	923	artist1	\N	\N	\N
148	924	\N	1	19	\N
149	927	\N	\N	\N	REQUEST_NEWJOB
150	928	\N	1	19	\N
153	931	\N	\N	\N	REQUEST_NEWJOB
154	932	\N	1	19	\N
155	933	\N	\N	\N	REQUEST_NEWJOB
156	934	\N	1	19	\N
157	935	\N	\N	\N	REQUEST_NEWJOB
158	936	\N	1	19	\N
159	939	uat_artist1	\N	\N	\N
160	942	uat_artist1	\N	\N	\N
161	943	\N	1	18	\N
162	945	uat_customer1	\N	\N	\N
163	947	\N	1	19	\N
164	950	uat_artist1	\N	\N	\N
165	953	uat_artist1	\N	\N	\N
166	954	\N	1	18	\N
167	956	uat_cust1	\N	\N	\N
168	957	\N	\N	\N	REQUEST_NEWJOB
169	958	\N	1	19	\N
170	961	uat_artist1	\N	\N	\N
171	964	uat_artist1	\N	\N	\N
172	965	\N	1	18	\N
173	967	uat_customer1	\N	\N	\N
174	968	\N	\N	\N	REQUEST_NEWJOB
175	969	\N	1	19	\N
176	970	\N	\N	\N	REQUEST_NEWJOB
177	971	\N	1	19	\N
178	972	\N	\N	\N	REQUEST_NEWJOB
179	973	\N	1	19	\N
180	974	\N	\N	\N	REQUEST_NEWJOB
181	975	\N	1	19	\N
182	977	uat_customer4	\N	\N	\N
183	980	uat_artist4	\N	\N	\N
184	983	uat_artist4	\N	\N	\N
185	984	\N	1	18	\N
186	986	uat_customer4	\N	\N	\N
187	987	\N	1	19	\N
188	990	\N	\N	\N	REQUEST_NEWJOB
189	991	\N	1	19	\N
190	994	uat_artist4	\N	\N	\N
191	997	uat_artist4	\N	\N	\N
192	998	\N	\N	\N	REQUEST_NEWJOB
193	999	\N	1	19	\N
194	1002	artist2	\N	\N	\N
195	1006	artist2	\N	\N	\N
196	1007	\N	\N	\N	REQUEST_NEWJOB
197	1008	\N	1	19	\N
198	1011	artist2	\N	\N	\N
199	1015	artist2	\N	\N	\N
200	1016	\N	1	18	\N
201	1061	\N	\N	\N	REQUEST_NEWJOB
202	1062	\N	1	19	\N
203	1064	ysyow	\N	\N	\N
204	1067	uat_artist1	\N	\N	\N
205	1070	ysyow	\N	\N	\N
206	1097	uat_artist1	\N	\N	\N
207	1098	\N	1	18	\N
208	1100	admin	\N	\N	\N
209	1102	uat_artist1	\N	\N	\N
210	1103	\N	\N	\N	REQUEST_NEWJOB
211	1104	\N	1	19	\N
212	1105	\N	\N	\N	REQUEST_NEWJOB
213	1106	\N	1	19	\N
214	1109	uat_artist1	\N	\N	\N
215	1113	uat_artist1	\N	\N	\N
216	1114	\N	\N	\N	REQUEST_NEWJOB
217	1115	\N	1	19	\N
218	1118	uat_artist1	\N	\N	\N
219	1122	uat_artist1	\N	\N	\N
\.


--
-- Name: fcpmcaseflowassign_pmfa_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcpmcaseflowassign_pmfa_id_seq', 219, true);


--
-- Data for Name: fcpmcasetype; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY fcpmcasetype (pmct_code, pmct_desc, pmct_table, pmct_key_col, pmct_desc_col, pmct_caseinfo_function) FROM stdin;
jobsheet	jobsheet	mjobsheet	js_id	case when js_code is null then '' else js_code||' - ' end ||case when length(js_description) < 23 then js_description else substring(js_description,0,20)||'...' end	viewJobInfo
\.


--
-- Data for Name: fcpmconnector; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY fcpmconnector (pmcn_id, pmcn_from_type, pmcn_from_id, pmcn_to_type, pmcn_to_id, pmcn_order, pmcn_type, pmcn_rule) FROM stdin;
1	PM_Event	1	PM_Activity	1	1	NORMAL	\N
14	PM_Event	2	PM_Gateway	4	1	NORMAL	\N
2	PM_Activity	1	PM_Gateway	1	1	NORMAL	\N
5	PM_Gateway	2	PM_Event	2	1	NORMAL	\N
17	PM_Activity	4	PM_Activity	5	1	NORMAL	\N
6	PM_Gateway	2	PM_Event	3	2	NORMAL	\N
7	PM_Activity	2	PM_Activity	1	1	NORMAL	\N
18	PM_Activity	5	PM_Gateway	5	1	NORMAL	\N
8	PM_Event	3	PM_Activity	8	1	NORMAL	\N
9	PM_Activity	8	PM_Gateway	3	1	NORMAL	\N
10	PM_Gateway	3	PM_Event	2	1	NORMAL	\N
20	PM_Activity	10	PM_Activity	5	1	NORMAL	\N
11	PM_Gateway	3	PM_Event	4	2	NORMAL	\N
12	PM_Event	4	PM_Activity	9	1	NORMAL	\N
21	PM_Activity	11	PM_Event	5	1	NORMAL	\N
13	PM_Activity	9	PM_Gateway	2	1	NORMAL	\N
22	PM_Activity	12	PM_Event	5	1	NORMAL	\N
24	PM_Activity	6	PM_Gateway	6	1	NORMAL	\N
27	PM_Event	7	PM_Activity	7	1	NORMAL	\N
28	PM_Activity	7	PM_Event	5	1	NORMAL	\N
29	PM_Event	8	PM_Activity	11	1	NORMAL	\N
30	PM_Event	9	PM_Activity	12	1	NORMAL	\N
31	PM_Event	10	PM_Activity	11	1	NORMAL	\N
32	PM_Event	11	PM_Activity	13	1	NORMAL	\N
33	PM_Activity	13	PM_Event	6	1	NORMAL	\N
4	PM_Gateway	1	PM_Gateway	2	1	NORMAL	1::true
3	PM_Gateway	1	PM_Activity	2	2	NORMAL	1::false
23	PM_Gateway	5	PM_Activity	6	1	NORMAL	2::false
19	PM_Gateway	5	PM_Activity	10	2	NORMAL	2::true
26	PM_Gateway	6	PM_Activity	1	2	NORMAL	3::false
25	PM_Gateway	6	PM_Event	6	1	NORMAL	3::true
16	PM_Gateway	4	PM_Activity	10	2	NORMAL	\N
15	PM_Gateway	4	PM_Activity	14	1	NORMAL	4::false
34	PM_Activity	14	PM_Activity	4	1	NORMAL	\N
\.


--
-- Name: fcpmconnector_pmcn_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcpmconnector_pmcn_id_seq', 34, true);


--
-- Data for Name: fcpmevent; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY fcpmevent (pmev_id, pmev_pmwfid, pmev_pmslid, pmev_name, pmev_type, pmev_type_cat, pmev_intermediate_function, pmev_timer_interval, pmev_timer_workinghours_only, pmev_intermediate_show_task, pmev_attach_pmatid, pmev_timer_non_interrupt_once, pmev_start_function, pmev_performed_message) FROM stdin;
5	1	\N	Notify End	END	\N	\N	\N	N	N	\N	\N	\N	\N
6	1	\N	Job Close	END	\N	\N	\N	N	N	\N	\N	\N	\N
8	1	\N	Late WIP Timer	TIMER	NONINTERRUPTING	\N	[[REQTIMEART]]	Y	N	4	Y	\N	\N
9	1	\N	Late QC Timer	TIMER	NONINTERRUPTING	\N	[[REQTIMEQC]]	Y	N	5	Y	\N	\N
10	1	\N	Late Re-WIP Timer	TIMER	NONINTERRUPTING	\N	[[REQTIMEQC]]	Y	N	10	Y	\N	\N
11	1	\N	Auto Customer Acceptance Timer	TIMER	INTERRUPTING	\N	P1D	Y	N	6	Y	\N	\N
1	1	5	New Job	START	\N	\N	\N	N	N	\N	\N	newJob	Job has been submitted successfully.
4	1	2	Pull Back	INTERMEDIATE	\N	updPullBackStatus	\N	N	Y	\N	\N	\N	\N
2	1	3	Acknowledge Job	INTERMEDIATE	\N	updAcknowdgeJobStatus	PT1M	Y	Y	\N	\N	\N	\N
7	1	\N	Late Requirement Verification Timer	TIMER	NONINTERRUPTING	\N	PT15M	Y	N	1	N	\N	\N
3	1	\N	Late Job Acknowledgement	TIMER	\N	\N	PT5M	Y	N	\N	\N	\N	\N
\.


--
-- Name: fcpmevent_pmev_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcpmevent_pmev_id_seq', 11, true);


--
-- Data for Name: fcpmgateway; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY fcpmgateway (pmgw_id, pmgw_pmwfid, pmgw_pmslid, pmgw_name, pmgw_type, pmgw_type_cat) FROM stdin;
2	1	\N	Acknowledge & Notify	EVENTEXCLUSIVE	DIVERGENCE
3	1	\N	Acknowledge & Pullback	EVENTEXCLUSIVE	DIVERGENCE
1	1	\N	Check Requirement Amendment	EXCLUSIVE	DIVERGENCE
4	1	\N	Check Is Reverted Case	EXCLUSIVE	DIVERGENCE
5	1	\N	Check QC Result	EXCLUSIVE	DIVERGENCE
6	1	\N	Check Customer Acceptance	EXCLUSIVE	DIVERGENCE
\.


--
-- Name: fcpmgateway_pmgw_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcpmgateway_pmgw_id_seq', 6, true);


--
-- Data for Name: fcpmswimlane; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY fcpmswimlane (pmsl_id, pmsl_pmwfid, pmsl_name, pmsl_order) FROM stdin;
2	1	Supervisor	200
3	1	Artist	300
4	1	QC	400
5	1	Job Requestors	50
1	1	Job Requestor	100
\.


--
-- Name: fcpmswimlane_pmsl_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcpmswimlane_pmsl_id_seq', 4, true);


--
-- Data for Name: fcpmswimlanesetup; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY fcpmswimlanesetup (pmss_id, pmss_pmslid, pmss_userid, pmss_orgid, pmss_rolid, pmss_pmscode) FROM stdin;
2	2	\N	1	19	\N
3	3	[[JS_ASSIGN_ARTIST]]	\N	\N	\N
4	4	\N	1	18	\N
5	5	\N	\N	\N	REQUEST_NEWJOB
1	1	[[JS_REQUESTOR_USERID]]	\N	\N	\N
\.


--
-- Name: fcpmswimlanesetup_pmss_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcpmswimlanesetup_pmss_id_seq', 1, false);


--
-- Data for Name: fcpmworkflow; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY fcpmworkflow (pmwf_id, pmwf_name) FROM stdin;
1	Artwork job
\.


--
-- Name: fcpmworkflow_pmwf_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcpmworkflow_pmwf_id_seq', 1, true);


--
-- Data for Name: fcrole; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY fcrole (rol_id, rol_name) FROM stdin;
18	QC
14	Customer
20	Artist
22	PND Admin
19	Supervisor
23	Manager
10	admin
\.


--
-- Name: fcrole_rol_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcrole_rol_id_seq', 23, true);


--
-- Data for Name: fcroleperm; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY fcroleperm (rp_id, rp_rolid, rp_pmscode) FROM stdin;
31	4	\N
32	4	\N
33	4	\N
34	4	\N
42	3	\N
43	3	\N
44	3	\N
45	3	\N
46	3	\N
47	3	\N
48	3	\N
49	3	\N
50	3	\N
62	1	\N
63	1	\N
64	1	\N
65	1	\N
66	1	\N
67	1	\N
68	1	\N
69	1	\N
70	1	\N
71	1	\N
72	1	\N
73	1	\N
116	12	\N
117	12	\N
118	13	\N
119	13	\N
120	13	\N
121	11	\N
122	11	\N
123	11	\N
124	11	\N
126	\N	MENU_HOME
127	\N	REQUEST_NEWJOB
137	15	MENU_HOME
145	17	ARTHOME
146	18	QCHOME
148	16	ARTHOME
150	14	REQUEST_NEWJOB
151	14	CUSTHOME
159	20	ARTHOME
169	22	MENU_REPORT
170	22	REQUEST_NEWJOB
171	22	QCHOME
172	22	ARTHOME
173	22	SUPHOME
174	22	CUSTHOME
175	22	ADMINSETTING
176	19	REQUEST_NEWJOB
177	19	SUPHOME
178	23	MENU_REPORT
179	23	MENU_SETTING
180	23	REQUEST_NEWJOB
181	23	QCHOME
182	23	ARTHOME
183	23	SUPHOME
184	23	CUSTHOME
185	23	ADMINSETTING
186	10	MENU_REPORT
187	10	MENU_SETTING
188	10	REQUEST_NEWJOB
189	10	QCHOME
190	10	ARTHOME
191	10	SUPHOME
192	10	CUSTHOME
193	10	ADMINSETTING
194	10	POSBMENU
195	10	ADMIN
196	10	SEARCH_PMC
\.


--
-- Name: fcroleperm_rp_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcroleperm_rp_id_seq', 196, true);


--
-- Data for Name: fcrule; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY fcrule (ru_id, ru_name, ru_true_msg, ru_false_msg, ru_data) FROM stdin;
1	Requirement verification decision?	Assigned	Reverted	[{"oper":"&&","clausetype":"udv","clausecode":"RVDEC","clauseoper":"==","clauseval":"Assign"}]
2	QC check decision	Revert	Forward to customer	[{"oper":"&&","clausetype":"udv","clausecode":"QCDEC","clauseoper":"==","clauseval":"Revert"}]
3	Customer acceptance decision?	Accept	Revert	[{"oper":"&&","clausetype":"udv","clausecode":"CUSTDEC","clauseoper":"==","clauseval":"Accept"}]
4	Is reverted job?	Yes	No	[{"oper":"&&","clausetype":"udv","clausecode":"JS_WIP_BEFORE","clauseoper":"==","clauseval":"Y"}]
\.


--
-- Name: fcrule_ru_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcrule_ru_id_seq', 4, true);


--
-- Data for Name: fcsetting; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY fcsetting (set_id, set_user, set_code, set_description, set_val) FROM stdin;
5	*	THEME	Theme	pixeladmin
1	*	LANG	Default Language	EN-US
8	*	SERVERLOCALE	Server Locale	MYWP
2	*	MAXLIFETIME	Maximum Idle Time (in second)	1800
10	*	EMAILPORT	Email Server Port	25
11	*	EMAILUSERNAME	Email Server Username	noreply@moiregc.com.my
12	*	EMAILPASSWORD	Email Server Password	User123
9	*	EMAILHOST	Domain / IP of Email Server	202.190.181.92
\.


--
-- Name: fcsetting_set_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcsetting_set_id_seq', 12, true);


--
-- Data for Name: fcudv; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY fcudv (udv_code, udv_name, udv_query_type, udv_query, udv_return_type, udv_result_type, udv_result_lookup_type, udv_result_lookup, udv_cat) FROM stdin;
RVDEC	Requirement verification decision	sql	select js_decision from mjobsheet where js_id = {$CASEKEY}	CELL	lookup	text	Revert\r\nAssign	\N
CUSTDEC	Customer acceptance decision	sql	select js_decision from mjobsheet where js_id = {$CASEKEY}	CELL	lookup	text	Revert\r\nAccept	\N
ACKNOWLEDGE_ACTIVITY_START	Job Acknowledgement Activity Start Time	sql	select to_char(max(pmf_start_date),'DD-Mon-YYYY HH:MI AM') from fcpmcaseflow where pmf_pmcid = {$PMCID} and pmf_obj_type = 'PM_Event' and pmf_obj_id = 2	CELL	\N	\N	\N	\N
REQTIMEART	Required time for artist	sql	select 'PT'||js_requiretime||'M' from mjobsheet where js_id = {$CASEKEY}	CELL	char	\N	\N	\N
REQTIMEQC	Required time for QC	sql	select 'PT'||(js_requiretime/3)||'M' from mjobsheet where js_id = {$CASEKEY}	CELL	char	\N	\N	\N
JS_CUSTOMER_ORG	Customer Org	sql	select js_orgid from mjobsheet where js_id = {$CASEKEY}	CELL	\N	\N	\N	\N
JS_ASSIGN_ARTIST	Jobsheet Assigned Artist	sql	select js_assignto from mjobsheet where js_id = {$CASEKEY}	CELL	\N	\N	\N	\N
JS_CONTACT_PERSON_EMAIL	Job Requestor Contact Person Email	sql	select ct_email from mjobsheet join pndcontact on ct_id = js_ctid\r\nwhere js_id = {$CASEKEY}	CELL	\N	\N	\N	EMAIL_RECIPIENT
JS_REQUESTOR_EMAIL	Job Requestor Email	sql	select usr_email from mjobsheet join fcuser on js_request_by = usr_userid\r\nwhere js_id = {$CASEKEY}	CELL	\N	\N	\N	EMAIL_RECIPIENT
JS_ASSIGNED_ARTIST_EMAIL	Job Assigned Artist Email	sql	select usr_email from mjobsheet join fcuser on js_assignto = usr_userid\r\nwhere js_id = {$CASEKEY}	CELL	\N	\N	\N	EMAIL_RECIPIENT
JS_JOB_DESCRIPTION	Jobsheet Short Description	sql	select js_description from mjobsheet where js_id = {$CASEKEY}	CELL	\N	\N	\N	\N
WIP_ACTIVITY_START	Job WIP Activity Start Time	sql	select to_char(max(pmf_start_date),'DD-Mon-YYYY HH:MI AM') from fcpmcaseflow where pmf_pmcid = {$PMCID} and pmf_obj_type = 'PM_Activity' and pmf_obj_id = 4	CELL	\N	\N	\N	\N
JS_ASSIGN_ARTIST_NAME	Job Assigned Artist Name	sql	select usr_name from mjobsheet join fcuser on js_assignto = usr_userid where js_id = {$CASEKEY}	CELL	\N	\N	\N	\N
REQ_VER_ACTIVITY_START	Requirement Verification Activity Start Time	sql	select to_char(max(pmf_start_date),'DD-Mon-YYYY HH:MI AM') from fcpmcaseflow where pmf_pmcid = {$PMCID} and pmf_obj_type = 'PM_Activity' and pmf_obj_id = 1	CELL	\N	\N	\N	\N
QC_ACTIVITY_START	Job QC Activity Start Time	sql	select to_char(max(pmf_start_date),'DD-Mon-YYYY HH:MI AM') from fcpmcaseflow where pmf_pmcid = {$PMCID} and pmf_obj_type = 'PM_Activity' and pmf_obj_id = 5	CELL	\N	\N	\N	\N
QCDEC	QC check decision	sql	select js_decision from mjobsheet where js_id = {$CASEKEY}	CELL	lookup	text	Revert\r\nForward to Customer	\N
QCDEC_DISP	QC check decision display	sql	select case when js_decision = 'Forward to Customer' then 'forwarded to customer' else 'reverted' end from mjobsheet where js_id = {$CASEKEY}	CELL	\N	\N	\N	\N
JS_REQUIRE_MIN	Estimate job required time	sql	select js_requiretime||' minutes' from mjobsheet where js_id = {$CASEKEY}	CELL	char	\N	\N	\N
CUSTDEC_DISP	Customer acceptance decision display	sql	select case when js_decision='Accept' then 'accepted' else 'reverted' end from mjobsheet where js_id = {$CASEKEY}	CELL	\N	\N	\N	\N
JS_WIP_BEFORE	Job WIP before	sql	select case when count(*) > 0 then 'Y' else 'N' end from fcpmcaseflow where pmf_pmcid = {$PMCID} and pmf_obj_type='PM_Activity' and pmf_obj_id = 4	CELL	lookup	text	Y/Yes\r\nN/No	\N
RVDEC_DISP	Requirement verification decision display	sql	select case when js_decision='Revert' then 'reverted' else 'assigned to artist' end from mjobsheet where js_id = {$CASEKEY}	CELL	\N	\N	\N	\N
JS_REQUESTOR_USERID	Job Requestor Userid	sql	select usr_userid from mjobsheet join fcuser on js_request_by = usr_userid where js_id = {$CASEKEY}	CELL	\N	\N	\N	USERID
JS_ASSIGNED_ARTIST_USERID	Job Assigned Artist Userid	sql	select usr_userid from mjobsheet join fcuser on js_assignto = usr_userid where js_id = {$CASEKEY}	CELL	\N	\N	\N	USERID
JS_EST_COMPLETE_TIME	Job estimate completion time	php	calculateCompletion({$CASEKEY})	CELL	\N	\N	\N	\N
JS_REQUESTOR_NAME	Job Requestor Name	sql	select usr_name from mjobsheet join fcuser on js_request_by = usr_userid where js_id = {$CASEKEY}	CELL	\N	\N	\N	\N
\.


--
-- Data for Name: fcuser; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) FROM stdin;
qc	d6426af04235d59336c5b6b08f61240cbb6b0f66	2014-04-30 19:10:06.929+08	qc	dannyfoo@phiorion.com	2014-06-22 18:42:28+08	2014-06-22 16:14:18+08	\N	\N	a:5:{s:7:"dbosess";a:3:{s:20:"pmtask_caseflow_list";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"list";}s:9:"pendingQC";a:4:{s:6:"lastid";a:1:{s:5:"js_id";i:67;}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"edit";}s:8:"jobsheet";a:4:{s:6:"lastid";a:1:{s:5:"js_id";i:67;}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:6:"detail";}}s:13:"PMTask_taskid";s:1:"5";s:15:"PMTask_tasktype";s:11:"PM_Activity";s:9:"dboconfig";a:0:{}s:13:"PMTask_flowid";s:3:"794";}	ACTIVE	\N
artist1	2cabffd3c7cb40ae6541b7f10a640b41190ccb27	2014-06-09 21:32:50.011+08	Artist 1	dannyfoo@phiorion.com	2014-06-21 18:54:42+08	2014-06-21 18:10:59+08	\N	\N	a:0:{}	ACTIVE	\N
ysyow	37d18143f0650c34e4ac4e8bc3c106820945319b	2014-06-21 18:26:11.482+08	Yow Yik Shuen	dannyfoo@phiorion.com	2014-06-28 16:49:31+08	2014-06-28 15:26:58+08	2014-06-28 15:04:12+08	\N	a:4:{s:7:"dbosess";a:2:{s:20:"pmtask_caseflow_list";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:4:{s:6:"pmc_id";s:0:"";s:8:"casedesc";s:3:"eng";s:14:"pmf_start_date";s:0:"";s:5:"isdue";s:0:"";}s:5:"state";s:4:"list";}s:10:"joblisting";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"list";}}s:13:"PMTask_taskid";s:1:"2";s:15:"PMTask_tasktype";s:11:"PM_Activity";s:9:"dboconfig";a:0:{}}	ACTIVE	\N
supervisor	0f4d09e43d208d5e9222322fbc7091ceea1a78c3	2014-04-30 19:09:48.659+08	supervisor	dannyfoo@phiorion.com	2014-06-30 14:46:02+08	2014-06-30 14:43:51+08	2014-06-30 14:43:47+08	\N	a:0:{}	ACTIVE	\N
admin2	d033e22ae348aeb5660fc2140aec35850c4da997	2014-01-26 15:39:57.04+08	Administrator 2	dannyfoo@phiorion.com	2014-06-28 17:55:20+08	2014-06-28 16:51:17+08	2014-06-26 11:53:19+08	ADMIN	a:4:{s:7:"dbosess";a:3:{s:11:"jobcatsetup";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"list";}s:14:"joboutputsetup";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"list";}s:8:"jobsheet";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:3:"new";}}s:9:"dboconfig";a:0:{}s:13:"PMTask_taskid";s:1:"1";s:15:"PMTask_tasktype";s:8:"PM_Event";}	ACTIVE	\N
uat_qc3	5001bb8bbc319f44083f121452b480400657668a	2014-06-22 14:42:32.917+08	Quality Assurance 3	dannyfoo@phiorion.com	2014-06-22 23:02:18+08	2014-06-22 23:01:59+08	\N	\N	a:0:{}	ACTIVE	\N
customer	b39f008e318efd2bb988d724a161b61c6909677f	2014-04-24 15:46:41.898+08	Customer	dannyfoo@phiorion.com	2014-06-28 22:12:25+08	2014-06-28 22:10:50+08	2014-06-22 17:54:18+08	\N	a:0:{}	ACTIVE	\N
uat_qc4	5001bb8bbc319f44083f121452b480400657668a	2014-06-22 14:43:06.84+08	Quality Assurance 4	dannyfoo@phiorion.com	\N	\N	\N	\N	\N	ACTIVE	\N
uat_customer3	5001bb8bbc319f44083f121452b480400657668a	2014-06-22 13:48:28.496+08	Uat customer 3	dannyfoo@phiorion.com	2014-06-22 23:00:11+08	2014-06-22 22:00:33+08	2014-06-22 21:59:53+08	\N	a:0:{}	ACTIVE	\N
uat_qc5	5001bb8bbc319f44083f121452b480400657668a	2014-06-22 14:43:49.935+08	Quality Assurance 5	dannyfoo@phiorion.com	\N	\N	\N	\N	\N	ACTIVE	\N
uat_manager3	5001bb8bbc319f44083f121452b480400657668a	2014-06-22 14:45:09.591+08	UAT Manager3	dannyfoo@phiorion.com	\N	\N	\N	\N	\N	ACTIVE	\N
esp_artist	9afb9d02e0ce944228e1001d2b103b3bb9aa7def	2014-06-21 23:20:39.656+08	esp artist	esp@phiorion.com	2014-06-21 23:21:16+08	2014-06-21 23:20:59+08	\N	\N	a:0:{}	ACTIVE	\N
uat_customer5	5001bb8bbc319f44083f121452b480400657668a	2014-06-22 13:54:37.241+08	Uat customer 5	dannyfoo@phiorion.com	\N	\N	\N	\N	\N	ACTIVE	\N
uat_manager4	5001bb8bbc319f44083f121452b480400657668a	2014-06-22 14:45:41.681+08	UAT Manager 4	dannyfoo@phiorion.com	\N	\N	\N	\N	\N	ACTIVE	\N
esp_supervisor	9afb9d02e0ce944228e1001d2b103b3bb9aa7def	2014-06-21 21:28:05.788+08	esp supervisor	dannyfoo@phiorion.com	2014-06-21 23:17:39+08	2014-06-21 23:05:39+08	2014-06-21 22:21:37+08	\N	a:0:{}	ACTIVE	\N
uat_manager5	5001bb8bbc319f44083f121452b480400657668a	2014-06-22 14:46:13.293+08	UAT Manager5	dannyfoo@phiorion.com	\N	\N	\N	\N	\N	ACTIVE	\N
fongadmin	d033e22ae348aeb5660fc2140aec35850c4da997	2014-06-21 19:06:57.321+08	Administrator	dannyfoo@phiorion.com	2014-06-28 16:49:14+08	2014-06-28 15:46:39+08	2014-06-22 19:29:13+08	\N	a:4:{s:7:"dbosess";a:2:{s:8:"jobsheet";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:3:"new";}s:10:"joblisting";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"list";}}s:13:"PMTask_taskid";s:1:"1";s:15:"PMTask_tasktype";s:8:"PM_Event";s:9:"dboconfig";a:1:{s:8:"jobsheet";i:1;}}	ACTIVE	EN-US
uat_supervisor3	5001bb8bbc319f44083f121452b480400657668a	2014-06-22 13:56:56.546+08	Uat supervisor 3	dannyfoo@phiorion.com	2014-06-22 23:01:03+08	2014-06-22 23:00:30+08	\N	\N	a:0:{}	ACTIVE	\N
uat_manager2	5001bb8bbc319f44083f121452b480400657668a	2014-06-22 14:44:37.191+08	UAT Manager2	dannyfoo@phiorion.com	2014-07-01 15:59:39+08	\N	\N	\N	a:0:{}	ACTIVE	\N
fongcustomer	c3bb51e80fb8801251e17d265e6a84cdd3a65200	2014-06-21 19:09:47.371+08	Fong Customer	fong_yeh@hotmail.com	2014-06-21 19:10:15+08	2014-06-21 19:10:06+08	\N	\N	a:4:{s:7:"dbosess";a:1:{s:8:"jobsheet";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:3:"new";}}s:13:"PMTask_taskid";s:1:"1";s:15:"PMTask_tasktype";s:8:"PM_Event";s:9:"dboconfig";a:0:{}}	ACTIVE	\N
uat_supervisor4	5001bb8bbc319f44083f121452b480400657668a	2014-06-22 13:58:23.837+08	Uat supervisor 4	dannyfoo@phiorion.com	2014-06-26 12:29:16+08	2014-06-26 12:27:03+08	\N	\N	a:0:{}	ACTIVE	\N
uat_supervisor5	5001bb8bbc319f44083f121452b480400657668a	2014-06-22 13:58:54.09+08	Uat supervisor 5	dannyfoo@phiorion.com	\N	\N	\N	\N	\N	ACTIVE	\N
uat_qc1	5001bb8bbc319f44083f121452b480400657668a	2014-06-21 21:50:16.091+08	Quality Assurance 1	dannyfoo@phiorion.com	2014-07-03 12:41:29+08	2014-07-03 12:41:04+08	\N	\N	a:0:{}	ACTIVE	\N
uat_customer1	5001bb8bbc319f44083f121452b480400657668a	2014-06-22 13:50:43.739+08	Uat customer 1	dannyfoo@phiorion.com	2014-07-03 12:44:04+08	2014-07-03 12:43:35+08	2014-07-01 22:42:58+08	\N	a:0:{}	ACTIVE	\N
artist2	09c04a14fff8cbd7d0235da2c01bfd31d7826824	2014-06-09 21:35:00.767+08	Artist 2	dannyfoo@phiorion.com	2014-06-30 16:40:49+08	2014-06-30 14:46:07+08	2014-06-22 22:37:16+08	\N	a:7:{s:7:"dbosess";a:5:{s:26:"pmtask_caseflow_list_event";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"list";}s:20:"pmtask_caseflow_list";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"list";}s:3:"wip";a:4:{s:6:"lastid";a:1:{s:5:"js_id";i:121;}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"edit";}s:8:"jobsheet";a:4:{s:6:"lastid";a:1:{s:5:"js_id";i:121;}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:6:"detail";}s:11:"flowsummary";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:6:{s:6:"pmc_id";s:0:"";s:7:"js_code";s:0:"";s:9:"js_status";s:0:"";s:15:"js_request_date";s:0:"";s:14:"js_description";s:0:"";s:10:"js_primcat";s:0:"";}s:5:"state";s:4:"list";}}s:13:"PMTask_taskid";s:2:"10";s:15:"PMTask_tasktype";s:11:"PM_Activity";s:9:"dboconfig";a:0:{}s:13:"PMTask_flowid";s:4:"1015";s:4:"type";s:11:"PM_Activity";s:6:"actvid";s:1:"4";}	ACTIVE	\N
fongsupervisor	5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8	2014-06-21 21:41:13.921+08	fongsupervisor	dannyfoo@phiorion.com	2014-06-21 22:37:35+08	2014-06-21 21:52:33+08	\N	\N	a:0:{}	ACTIVE	\N
uat_artist3	5001bb8bbc319f44083f121452b480400657668a	2014-06-22 14:39:27.667+08	UAT Artist3	dannyfoo@phiorion.com	2014-06-22 23:02:35+08	2014-06-22 23:02:27+08	\N	\N	a:4:{s:7:"dbosess";a:1:{s:20:"pmtask_caseflow_list";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"list";}}s:13:"PMTask_taskid";s:2:"10";s:15:"PMTask_tasktype";s:11:"PM_Activity";s:9:"dboconfig";a:0:{}}	ACTIVE	\N
uat_artist4	5001bb8bbc319f44083f121452b480400657668a	2014-06-22 14:40:21.405+08	UAT Artist4	dannyfoo@phiorion.com	2014-06-26 12:03:39+08	2014-06-26 11:45:43+08	\N	\N	a:0:{}	ACTIVE	\N
uat_cust1	5001bb8bbc319f44083f121452b480400657668a	2014-06-21 17:32:20.338+08	UAT Customer1	dannyfoo@phiorion.com	2014-06-22 17:06:05+08	2014-06-22 17:06:05+08	2014-06-22 14:22:06+08	\N	a:0:{}	ACTIVE	\N
uat_manager1	5001bb8bbc319f44083f121452b480400657668a	2014-06-21 17:29:57.603+08	UAT Manager1	dannyfoo@phiorion.com	\N	\N	\N	\N	\N	ACTIVE	\N
uat_artist5	5001bb8bbc319f44083f121452b480400657668a	2014-06-22 14:40:50.232+08	UAT Artist5	dannyfoo@phiorion.com	\N	\N	\N	\N	\N	ACTIVE	\N
uat_artist2	5001bb8bbc319f44083f121452b480400657668a	2014-06-22 14:38:00.573+08	UAT Artist2	dannyfoo@phiorion.com	2014-07-01 18:26:32+08	2014-07-01 17:49:47+08	\N	\N	a:0:{}	ACTIVE	\N
uat_supervisor2	5001bb8bbc319f44083f121452b480400657668a	2014-06-22 13:56:27.344+08	Uat supervisor 2	dannyfoo@phiorion.com	2014-07-01 17:25:05+08	2014-07-01 17:24:36+08	2014-06-26 11:15:55+08	\N	a:0:{}	ACTIVE	\N
uat_qc2	5001bb8bbc319f44083f121452b480400657668a	2014-06-22 14:41:50.867+08	Quality Assurance 2	dannyfoo@phiorion.com	2014-07-01 18:49:20+08	2014-07-01 18:26:58+08	\N	\N	a:0:{}	ACTIVE	\N
uat_customer2	5001bb8bbc319f44083f121452b480400657668a	2014-06-22 13:48:01.232+08	Uat customer 2	dannyfoo@phiorion.com	2014-07-01 22:33:41+08	2014-07-01 22:32:57+08	2014-06-22 17:54:06+08	\N	a:0:{}	ACTIVE	\N
uat_customer4	5001bb8bbc319f44083f121452b480400657668a	2014-06-22 13:54:11.918+08	Uat customer 4	dannyfoo@phiorion.com	2014-07-01 11:19:04+08	2014-07-01 22:57:09+08	\N	\N	a:0:{}	ACTIVE	\N
uat_supervisor1	5001bb8bbc319f44083f121452b480400657668a	2014-06-21 17:27:46.394+08	UAT Supervisor	dannyfoo@phiorion.com	2014-07-03 14:07:58+08	2014-07-03 12:44:10+08	2014-06-22 19:20:27+08	\N	a:0:{}	ACTIVE	\N
uat_artist1	5001bb8bbc319f44083f121452b480400657668a	2014-06-21 17:29:02.912+08	UAT Artist1	dannyfoo@phiorion.com	2014-07-03 14:33:58+08	2014-07-03 14:08:06+08	2014-06-24 19:04:06+08	\N	a:0:{}	ACTIVE	\N
admin	d033e22ae348aeb5660fc2140aec35850c4da997	2013-08-15 09:55:18.85+08	Administrator	dannyfoo@phiorion.com	2014-07-03 14:56:19+08	2014-07-03 12:33:34+08	2014-06-24 18:01:03+08	ADMIN	a:5:{s:7:"dbosess";a:4:{s:8:"jobsheet";a:4:{s:6:"lastid";a:1:{s:5:"js_id";s:2:"57";}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"list";}s:11:"flowsummary";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"list";}s:14:"flowsummarymtd";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"list";}s:10:"joblisting";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"list";}}s:7:"dboload";s:8:"jobsheet";s:9:"dboconfig";a:0:{}s:4:"type";s:11:"PM_Activity";s:6:"actvid";s:1:"5";}	ACTIVE	EN-US
esp	9afb9d02e0ce944228e1001d2b103b3bb9aa7def	2014-06-21 18:25:38.5+08	Eng Shi Ping	dannyfoo@phiorion.com	2014-07-03 14:33:08+08	2014-07-03 12:33:24+08	\N	\N	a:5:{s:7:"dbosess";a:6:{s:11:"jobcatsetup";a:4:{s:6:"lastid";a:1:{s:6:"jcl_id";s:1:"2";}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"edit";}s:14:"joboutputsetup";a:4:{s:6:"lastid";a:1:{s:6:"jol_id";s:1:"3";}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"list";}s:8:"jobsheet";a:4:{s:6:"lastid";a:1:{s:5:"js_id";s:2:"57";}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:6:"detail";}s:10:"joblisting";a:4:{s:6:"lastid";a:1:{s:5:"js_id";s:2:"57";}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:6:"detail";}s:11:"flowsummary";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"list";}s:14:"flowsummarymtd";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"list";}}s:9:"dboconfig";a:0:{}s:13:"PMTask_taskid";s:1:"1";s:15:"PMTask_tasktype";s:8:"PM_Event";s:7:"dboload";s:14:"flowsummarymtd";}	ACTIVE	\N
\.


--
-- Data for Name: fcuserdiary; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date, di_cat2, di_severity) FROM stdin;
1	2014-05-29 23:35:52.378+08	admin	admin	\N	MESSAGE	asddsa	\N	READ	2014-05-29 23:35:52.378+08	\N	3
2	2014-05-30 00:03:11.89+08	admin	admin	\N	MESSAGE	asddsacacsa	\N	READ	2014-05-30 00:03:11.89+08	\N	3
3	2014-05-30 00:08:27.371+08	admin	admin	\N	MESSAGE	asdcccc	\N	DELETED	2014-05-30 00:08:27.371+08	\N	3
4	2014-06-01 15:33:31.541+08	admin	admin	\N	MESSAGE	zsfddfsfds	\N	READ	2014-06-01 15:33:31.541+08	\N	3
5	2014-06-01 17:55:52.513+08	admin	admin	\N	MESSAGE	asdasdas	\N	DELETED	2014-06-01 17:55:52.513+08	\N	3
7	2014-06-04 16:39:17.28+08	admin	admin	\N	MESSAGE	Are you happy today?	\N	READ	2014-06-04 16:39:17.28+08	\N	3
8	2014-06-04 16:39:51.61+08	admin	admin	\N	MESSAGE	Am I registered?	\N	READ	2014-06-04 16:39:51.61+08	\N	3
9	2014-06-04 23:23:40.801+08	admin	admin	\N	MESSAGE	Ausi is cantik	\N	READ	2014-06-04 23:23:40.801+08	\N	3
10	2014-06-04 23:26:04.521+08	admin	admin	\N	MESSAGE	Danny is gendut!!	\N	READ	2014-06-04 23:26:04.521+08	\N	3
11	2014-06-05 19:00:10.904+08	admin	admin	\N	MESSAGE	Dr. Tang is here	\N	READ	2014-06-05 19:00:10.904+08	\N	3
12	2014-06-09 09:34:58.606+08	admin	admin	\N	MESSAGE	Today is moire presentation	\N	READ	2014-06-09 09:34:58.606+08	\N	3
13	2014-06-09 09:35:41.073+08	admin	admin	\N	MESSAGE	Daniel is here!	\N	READ	2014-06-09 09:35:41.073+08	\N	3
14	2014-06-09 13:25:46.48+08	admin	admin	\N	MESSAGE	Hi Vikki...	\N	READ	2014-06-09 13:25:46.48+08	\N	3
15	2014-06-15 01:21:22.256+08	admin	admin	\N	MESSAGE	Hello world	\N	READ	2014-06-15 01:21:22.256+08	\N	3
6	2014-06-01 17:55:52.515+08	admin	admin2	\N	MESSAGE	asdasdas	\N	READ	2014-06-01 17:55:52.515+08	\N	3
52	2014-06-21 19:56:37.358+08	*moire	ysyow	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "Barcode scan and drawing" job is still pending since 21-Jun-2014 07:15 PM.</p><p><br></p>	READ	2014-06-21 19:56:37.358+08	\N	3
46	2014-06-21 17:57:42.741+08	uat_cust1	uat_cust1	\N	MESSAGE	I love Moire	\N	DELETED	2014-06-21 17:57:42.741+08	\N	3
47	2014-06-21 18:02:22.053+08	uat_cust1	uat_cust1	\N	MESSAGE	asdklfj asdkfjasdk asdlkfjalsk dfalksjdf aklsdj falksdjf alksdjf asldkjf aslkdjf asdlkfj alskdjf asl	\N	DELETED	2014-06-21 18:02:22.053+08	\N	3
53	2014-06-21 21:58:36.009+08	ysyow	ysyow	\N	MESSAGE	asdasdasd	\N	READ	2014-06-21 21:58:36.009+08	\N	3
48	2014-06-21 18:52:51.898+08	ysyow	artist1	\N	MESSAGE	hello	\N	READ	2014-06-21 18:52:51.898+08	\N	3
54	2014-06-21 22:00:31.345+08	ysyow	ysyow	\N	MESSAGE	adminasd	\N	READ	2014-06-21 22:00:31.345+08	\N	3
50	2014-06-21 18:53:49.427+08	ysyow	artist1	\N	MESSAGE	asddsadsa	\N	READ	2014-06-21 18:53:49.427+08	\N	3
51	2014-06-21 19:56:37.358+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "Barcode scan and drawing" job is still pending since 21-Jun-2014 07:15 PM.</p><p><br></p>	READ	2014-06-21 19:56:37.358+08	\N	3
49	2014-06-21 18:53:33.781+08	artist1	ysyow	\N	MESSAGE	cool man	\N	DELETED	2014-06-21 18:53:33.781+08	\N	3
65	2014-06-22 16:57:49.568+08	supervisor	supervisor	\N	MESSAGE	HELLO\r\n	\N	READ	2014-06-22 16:57:49.568+08	\N	3
55	2014-06-21 22:13:47.217+08	ysyow	ysyow	\N	MESSAGE	asd	\N	DELETED	2014-06-21 22:13:47.217+08	\N	3
62	2014-06-22 14:21:25.415+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "Esp case" job is still pending since 21-Jun-2014 10:17 PM.</p><p><br></p>	READ	2014-06-22 14:21:25.415+08	\N	3
56	2014-06-21 22:16:17.371+08	ysyow	ysyow	\N	MESSAGE	asddsa	\N	READ	2014-06-21 22:16:17.371+08	\N	3
59	2014-06-22 13:39:02.645+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "Esp case" job is still pending since 21-Jun-2014 10:17 PM.</p><p><br></p>	READ	2014-06-22 13:39:02.645+08	\N	3
57	2014-06-21 22:27:03.088+08	*moire	supervisor	\N	NOTICE	[MOIRE] Late Job QC Notification	<p>Dear Manager and Supervisor,</p><p>This email is to notify that the  "Barcode scan and drawing" job is still pending QC since 21-Jun-2014 09:48 PM.</p><div><br></div>	READ	2014-06-21 22:27:03.088+08	\N	3
58	2014-06-21 22:27:03.157+08	*moire	supervisor	\N	NOTICE	[MOIRE] Late Job Acknowledgement Notification	<p>Dear Supervisor,</p><p>This email is to notify that the  "Master card artwork" job is still pending acknowledgement from UAT Artist1 since 21-Jun-2014 10:24 PM.</p><div><br></div>	READ	2014-06-21 22:27:03.157+08	\N	3
60	2014-06-22 13:39:03.177+08	*moire	supervisor	\N	NOTICE	[MOIRE] Late Job WIP Notification	<p>Dear Manager and Supervisor,</p><p>This email is to notify that the  "drawing artwork" job is still WIP from UAT Artist1 since 21-Jun-2014 10:06 PM.</p><div><br></div>	READ	2014-06-22 13:39:03.177+08	\N	3
61	2014-06-22 13:39:03.604+08	*moire	supervisor	\N	NOTICE	[MOIRE] Late Job Acknowledgement Notification	<p>Dear Supervisor,</p><p>This email is to notify that the  "Artwork separation for UAT Customer 1" job is still pending acknowledgement from UAT Artist1 since 22-Jun-2014 01:34 PM.</p><div><br></div>	READ	2014-06-22 13:39:03.604+08	\N	3
63	2014-06-22 14:21:26.058+08	*moire	supervisor	\N	NOTICE	[MOIRE] Late Job WIP Notification	<p>Dear Manager and Supervisor,</p><p>This email is to notify that the  "Artwork separation job for customer1" job is still WIP from UAT Artist1 since .</p><div><br></div>	READ	2014-06-22 14:21:26.058+08	\N	3
64	2014-06-22 14:21:26.471+08	*moire	supervisor	\N	NOTICE	[MOIRE] Late Job Acknowledgement Notification	<p>Dear Supervisor,</p><p>This email is to notify that the  "Monotone Editing" job is still pending acknowledgement from UAT Artist1 since 22-Jun-2014 02:02 PM.</p><div><br></div>	READ	2014-06-22 14:21:26.471+08	\N	3
66	2014-06-22 18:39:00.845+08	uat_customer2	uat_customer2	\N	MESSAGE	Testing 123 123 123 	\N	DELETED	2014-06-22 18:39:00.845+08	\N	3
67	2014-06-22 18:41:41.165+08	uat_customer2	uat_customer2	\N	MESSAGE	1234567890123456789012345678901234567890123456789012345678901234567890123145678901234567890123456789	\N	READ	2014-06-22 18:41:41.165+08	\N	3
73	2014-06-22 18:43:25.031+08	uat_customer2	uat_customer2	\N	MESSAGE	test 2	\N	READ	2014-06-22 18:43:25.031+08	\N	3
74	2014-06-22 18:43:43.911+08	uat_customer2	uat_customer2	\N	MESSAGE	test3	\N	READ	2014-06-22 18:43:43.911+08	\N	3
75	2014-06-22 19:05:27.723+08	uat_customer2	uat_customer2	\N	MESSAGE	1233452525 1243434 2352352535 235325235325 23523535 2523523 523523 5235235 3523523525 35235 35235235	\N	READ	2014-06-22 19:05:27.723+08	\N	3
68	2014-06-22 18:42:27.017+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "Esp case" job is still pending since 21-Jun-2014 10:17 PM.</p><p><br></p>	READ	2014-06-22 18:42:27.017+08	\N	3
70	2014-06-22 18:42:27.872+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "Test job" job is still pending since 22-Jun-2014 03:55 PM.</p><p><br></p>	READ	2014-06-22 18:42:27.872+08	\N	3
69	2014-06-22 18:42:27.472+08	*moire	supervisor	\N	NOTICE	[MOIRE] Late Job WIP Notification	<p>Dear Manager and Supervisor,</p><p>This email is to notify that the  "Artwork separation for UAT Customer 1" job is still WIP from UAT Artist1 since 22-Jun-2014 01:41 PM.</p><div><br></div>	READ	2014-06-22 18:42:27.472+08	\N	3
76	2014-06-22 22:02:36.486+08	uat_supervisor2	uat_supervisor2	\N	MESSAGE	test test test	\N	DELETED	2014-06-22 22:02:36.486+08	\N	3
71	2014-06-22 18:42:28.293+08	*moire	supervisor	\N	NOTICE	[MOIRE] Late Job WIP Notification	<p>Dear Manager and Supervisor,</p><p>This email is to notify that the  "test 2" job is still WIP from Artist 2 since .</p><div><br></div>	READ	2014-06-22 18:42:28.293+08	\N	3
72	2014-06-22 18:42:28.689+08	*moire	supervisor	\N	NOTICE	[MOIRE] Late Job WIP Notification	<p>Dear Manager and Supervisor,</p><p>This email is to notify that the  "Test 4" job is still WIP from Artist 2 since .</p><div><br></div>	READ	2014-06-22 18:42:28.689+08	\N	3
77	2014-06-23 00:23:14.953+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "Esp case" job is still pending since 21-Jun-2014 10:17 PM.</p><p><br></p>	UNREAD	2014-06-23 00:23:14.953+08	\N	3
78	2014-06-23 00:23:15.418+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "Test job" job is still pending since 22-Jun-2014 03:55 PM.</p><p><br></p>	UNREAD	2014-06-23 00:23:15.418+08	\N	3
79	2014-06-23 00:23:15.884+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "UAT job by ENG -1 " job is still pending since 22-Jun-2014 07:05 PM.</p><p><br></p>	UNREAD	2014-06-23 00:23:15.884+08	\N	3
80	2014-06-23 00:23:16.288+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "Test revert job" job is still pending since 22-Jun-2014 07:08 PM.</p><p><br></p>	UNREAD	2014-06-23 00:23:16.288+08	\N	3
81	2014-06-23 00:23:16.682+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "sad" job is still pending since 22-Jun-2014 10:25 PM.</p><p><br></p>	UNREAD	2014-06-23 00:23:16.682+08	\N	3
82	2014-06-23 00:23:17.087+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "asddsa" job is still pending since 22-Jun-2014 10:26 PM.</p><p><br></p>	UNREAD	2014-06-23 00:23:17.087+08	\N	3
83	2014-06-23 00:23:17.477+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "1" job is still pending since 22-Jun-2014 10:27 PM.</p><p><br></p>	UNREAD	2014-06-23 00:23:17.477+08	\N	3
84	2014-06-23 00:23:17.848+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "12asd" job is still pending since 22-Jun-2014 10:29 PM.</p><p><br></p>	UNREAD	2014-06-23 00:23:17.848+08	\N	3
88	2014-06-23 00:23:18.464+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "Oder 2 by eng" job is still pending since 22-Jun-2014 10:25 PM.</p><p><br></p>	UNREAD	2014-06-23 00:23:18.464+08	\N	3
85	2014-06-23 00:23:17.891+08	*moire	supervisor	\N	NOTICE	[MOIRE] Late Job WIP Notification	<p>Dear Manager and Supervisor,</p><p>This email is to notify that the "asd" job is still WIP from UAT Artist2 since 22-Jun-2014 10:40 PM.</p><div><br></div>	READ	2014-06-23 00:23:17.891+08	\N	3
86	2014-06-23 00:23:17.963+08	*moire	supervisor	\N	NOTICE	[MOIRE] Late Job Acknowledgement Notification	<p>Dear Supervisor,</p><p>This email is to notify that the "test5" job is still pending acknowledgement from esp artist since 22-Jun-2014 10:06 PM.</p><div><br></div>	READ	2014-06-23 00:23:17.963+08	\N	3
87	2014-06-23 00:23:18.025+08	*moire	supervisor	\N	NOTICE	[MOIRE] Late Job Acknowledgement Notification	<p>Dear Supervisor,</p><p>This email is to notify that the "Monotone Editing" job is still pending acknowledgement from UAT Artist3 since 22-Jun-2014 10:07 PM.</p><div><br></div>	READ	2014-06-23 00:23:18.025+08	\N	3
89	2014-06-23 00:23:18.506+08	*moire	supervisor	\N	NOTICE	[MOIRE] Late Job Acknowledgement Notification	<p>Dear Supervisor,</p><p>This email is to notify that the "123" job is still pending acknowledgement from Artist 2 since 22-Jun-2014 10:36 PM.</p><div><br></div>	READ	2014-06-23 00:23:18.506+08	\N	3
90	2014-06-23 00:23:18.566+08	*moire	supervisor	\N	NOTICE	[MOIRE] Late Job Acknowledgement Notification	<p>Dear Supervisor,</p><p>This email is to notify that the "Case 1 - eng" job is still pending acknowledgement from Artist 1 since 22-Jun-2014 10:38 PM.</p><div><br></div>	READ	2014-06-23 00:23:18.566+08	\N	3
91	2014-06-23 00:23:18.623+08	*moire	supervisor	\N	NOTICE	[MOIRE] Late Job WIP Notification	<p>Dear Manager and Supervisor,</p><p>This email is to notify that the "new job 3 by eng" job is still WIP from UAT Artist3 since 22-Jun-2014 11:01 PM.</p><div><br></div>	READ	2014-06-23 00:23:18.623+08	\N	3
92	2014-06-26 16:33:40.38+08	*moire	ysyow	\N	NOTICE	[MOIRE] Job Acknowledgement	<p>Dear Yow Yik Shuen,</p><p>This email is to inform that your job request "YYYSSS" is now confirmed and acknowledged. </p><p><br></p><p>Estimate Time Required : 300 minutes (Working hour)</p><p>Estimate Completion Time : 27-Jun-2014 12:33 PM</p><div><br></div>	READ	2014-06-26 16:33:40.38+08	\N	3
93	2014-06-30 14:46:15.876+08	*moire	admin	\N	NOTICE	[MOIRE] Job Acknowledgement	<p>Dear Administrator,</p><p>This email is to inform that your job request "test yys" is now confirmed and acknowledged. </p><p><br></p><p>Estimate Time Required : 300 minutes (Working hour)</p><p>Estimate Completion Time : 1-Jul-2014 10:46 AM</p><div><br></div>	READ	2014-06-30 14:46:15.876+08	\N	3
94	2014-06-30 17:42:05.827167+08	admin	admin	\N	MESSAGE	test	\N	READ	2014-06-30 17:42:05.827167+08	\N	3
95	2014-06-30 17:43:22.135222+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "Esp case" job is still pending since 21-Jun-2014 10:17 AM.</p><p><br></p>	UNREAD	2014-06-30 17:43:22.135222+08	\N	3
96	2014-06-30 17:43:22.234932+08	*moire	supervisor	\N	NOTICE	[MOIRE] Late Job WIP Notification	<p>Dear Manager and Supervisor,</p><p>This email is to notify that the "Master card artwork" job is still WIP from UAT Artist1 since .</p><div><br></div>	UNREAD	2014-06-30 17:43:22.234932+08	\N	3
97	2014-06-30 17:43:23.010533+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "Test job" job is still pending since 22-Jun-2014 03:55 AM.</p><p><br></p>	UNREAD	2014-06-30 17:43:23.010533+08	\N	3
98	2014-06-30 17:43:23.760528+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "UAT job by ENG -1 " job is still pending since 22-Jun-2014 07:05 AM.</p><p><br></p>	UNREAD	2014-06-30 17:43:23.760528+08	\N	3
99	2014-06-30 17:43:24.525236+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "Test revert job" job is still pending since 22-Jun-2014 07:08 AM.</p><p><br></p>	UNREAD	2014-06-30 17:43:24.525236+08	\N	3
100	2014-06-30 17:43:25.269224+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "sad" job is still pending since 22-Jun-2014 10:25 AM.</p><p><br></p>	UNREAD	2014-06-30 17:43:25.269224+08	\N	3
101	2014-06-30 17:43:26.032959+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "asddsa" job is still pending since 22-Jun-2014 10:26 AM.</p><p><br></p>	UNREAD	2014-06-30 17:43:26.032959+08	\N	3
102	2014-06-30 17:43:26.775047+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "1" job is still pending since 22-Jun-2014 10:27 AM.</p><p><br></p>	UNREAD	2014-06-30 17:43:26.775047+08	\N	3
103	2014-06-30 17:43:27.492331+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "Oder 2 by eng" job is still pending since 22-Jun-2014 10:25 AM.</p><p><br></p>	UNREAD	2014-06-30 17:43:27.492331+08	\N	3
104	2014-06-30 17:43:28.376057+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "123213" job is still pending since 24-Jun-2014 06:38 AM.</p><p><br></p>	UNREAD	2014-06-30 17:43:28.376057+08	\N	3
105	2014-06-30 17:43:29.18841+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "sasda" job is still pending since 24-Jun-2014 05:17 AM.</p><p><br></p>	UNREAD	2014-06-30 17:43:29.18841+08	\N	3
106	2014-06-30 17:43:29.878136+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "12asd" job is still pending since 22-Jun-2014 10:29 AM.</p><p><br></p>	UNREAD	2014-06-30 17:43:29.878136+08	\N	3
107	2014-06-30 17:43:30.657928+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "test yys" job is still pending since 24-Jun-2014 06:41 AM.</p><p><br></p>	UNREAD	2014-06-30 17:43:30.657928+08	\N	3
108	2014-06-30 17:43:30.739247+08	*moire	supervisor	\N	NOTICE	[MOIRE] Late Job WIP Notification	<p>Dear Manager and Supervisor,</p><p>This email is to notify that the "Test job by Eng" job is still WIP from UAT Artist1 since 24-Jun-2014 07:02 AM.</p><div><br></div>	UNREAD	2014-06-30 17:43:30.739247+08	\N	3
109	2014-06-30 17:43:31.689868+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "required master card!!" job is still pending since 25-Jun-2014 06:09 AM.</p><p><br></p>	UNREAD	2014-06-30 17:43:31.689868+08	\N	3
110	2014-06-30 17:43:31.778216+08	*moire	supervisor	\N	NOTICE	[MOIRE] Late Job WIP Notification	<p>Dear Manager and Supervisor,</p><p>This email is to notify that the "A job with a lot details" job is still WIP from UAT Artist4 since 25-Jun-2014 11:16 PM.</p><div><br></div>	UNREAD	2014-06-30 17:43:31.778216+08	\N	3
111	2014-06-30 17:43:32.511544+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "No barcode, no master card, just drawing and typing-- æ¢äºï¼ï¼" job is still pending since 25-Jun-2014 06:28 AM.</p><p><br></p>	UNREAD	2014-06-30 17:43:32.511544+08	\N	3
112	2014-06-30 17:43:33.211413+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "Test yys" job is still pending since 25-Jun-2014 06:17 AM.</p><p><br></p>	UNREAD	2014-06-30 17:43:33.211413+08	\N	3
113	2014-06-30 17:43:33.258755+08	*moire	supervisor	\N	NOTICE	[MOIRE] Late Job WIP Notification	<p>Dear Manager and Supervisor,</p><p>This email is to notify that the "YYYSSS" job is still WIP from Artist 2 since 26-Jun-2014 04:33 AM.</p><div><br></div>	UNREAD	2014-06-30 17:43:33.258755+08	\N	3
114	2014-06-30 17:43:33.303587+08	*moire	supervisor	\N	NOTICE	[MOIRE] Late Job QC Notification	<p>Dear Manager and Supervisor,</p><p>This email is to notify that the "test yys" job is still pending QC since 30-Jun-2014 02:46 AM.</p><div><br></div>	UNREAD	2014-06-30 17:43:33.303587+08	\N	3
115	2014-06-30 17:57:29.763632+08	admin	admin	\N	MESSAGE	test2	\N	UNREAD	2014-06-30 17:57:29.763632+08	\N	3
116	2014-07-01 05:59:03.223507+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "UAT job by ENG -1 " job is still pending since 22-Jun-2014 07:05 AM.</p><p><br></p>	UNREAD	2014-07-01 05:59:03.223507+08	\N	3
117	2014-07-01 05:59:04.371237+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "Test revert job" job is still pending since 22-Jun-2014 07:08 AM.</p><p><br></p>	UNREAD	2014-07-01 05:59:04.371237+08	\N	3
118	2014-07-01 05:59:05.100017+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "sad" job is still pending since 22-Jun-2014 10:25 AM.</p><p><br></p>	UNREAD	2014-07-01 05:59:05.100017+08	\N	3
119	2014-07-01 05:59:06.13688+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "asddsa" job is still pending since 22-Jun-2014 10:26 AM.</p><p><br></p>	UNREAD	2014-07-01 05:59:06.13688+08	\N	3
120	2014-07-01 05:59:06.847278+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "1" job is still pending since 22-Jun-2014 10:27 AM.</p><p><br></p>	UNREAD	2014-07-01 05:59:06.847278+08	\N	3
121	2014-07-01 05:59:07.571121+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "Oder 2 by eng" job is still pending since 22-Jun-2014 10:25 AM.</p><p><br></p>	UNREAD	2014-07-01 05:59:07.571121+08	\N	3
122	2014-07-01 05:59:08.280895+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "12asd" job is still pending since 22-Jun-2014 10:29 AM.</p><p><br></p>	UNREAD	2014-07-01 05:59:08.280895+08	\N	3
123	2014-07-01 05:59:08.988355+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "Test job" job is still pending since 22-Jun-2014 03:55 AM.</p><p><br></p>	UNREAD	2014-07-01 05:59:08.988355+08	\N	3
124	2014-07-01 05:59:09.742204+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "Esp case" job is still pending since 21-Jun-2014 10:17 AM.</p><p><br></p>	UNREAD	2014-07-01 05:59:09.742204+08	\N	3
125	2014-07-01 05:59:10.490144+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "No barcode, no master card, just drawing and typing-- æ¢äºï¼ï¼" job is still pending since 25-Jun-2014 06:28 AM.</p><p><br></p>	UNREAD	2014-07-01 05:59:10.490144+08	\N	3
126	2014-07-01 05:59:11.18635+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "123213" job is still pending since 24-Jun-2014 06:38 AM.</p><p><br></p>	UNREAD	2014-07-01 05:59:11.18635+08	\N	3
127	2014-07-01 05:59:11.868212+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "sasda" job is still pending since 24-Jun-2014 05:17 AM.</p><p><br></p>	UNREAD	2014-07-01 05:59:11.868212+08	\N	3
128	2014-07-01 06:04:19.646586+08	*moire	uat_customer4	\N	NOTICE	[MOIRE] Job Acknowledgement	<p>Dear Uat customer 4,</p><p>This email is to inform that your job request "required master card!!" is now confirmed and acknowledged. </p><p><br></p><p>Estimate Time Required : 250 minutes (Working hour)</p><p>Estimate Completion Time : 1-Jul-2014 1:10 PM</p><div><br></div>	UNREAD	2014-07-01 06:04:19.646586+08	\N	3
129	2014-07-03 12:43:11.029+08	*moire	uat_customer1	\N	NOTICE	[MOIRE] Job Acknowledgement	<p>Dear Uat customer 1,</p><p>This email is to inform that your job request "Check fields" is now confirmed and acknowledged. </p><p><br></p><p>Estimate Time Required : 300 minutes (Working hour)</p><p>Estimate Completion Time : 3-Jul-2014 5:43 PM</p><div><br></div>	UNREAD	2014-07-03 12:43:11.029+08	\N	3
130	2014-07-03 14:08:34.973+08	*moire	uat_customer1	\N	NOTICE	[MOIRE] Job Acknowledgement	<p>Dear Uat customer 1,</p><p>This email is to inform that your job request "new job exceed SLA" is now confirmed and acknowledged. </p><p><br></p><p>Estimate Time Required : 240 minutes (Working hour)</p><p>Estimate Completion Time : 4-Jul-2014 9:08 AM</p><div><br></div>	UNREAD	2014-07-03 14:08:34.973+08	\N	3
\.


--
-- Name: fcuserdiary_di_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcuserdiary_di_id_seq', 130, true);


--
-- Data for Name: fcuserlogin; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY fcuserlogin (ul_id, ul_userid, ul_ip, ul_success, ul_created, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) FROM stdin;
1	admin	127.0.0.1	Y	2013-08-15 09:55:42.735+08	2013-08-15 09:55:42.735+08	\N	N	\N
2	admin	127.0.0.1	Y	2013-08-15 10:59:43.076+08	2013-08-15 10:59:43.076+08	\N	N	\N
3	admin	127.0.0.1	Y	2013-08-15 10:59:45.466+08	2013-08-15 10:59:45.466+08	\N	N	\N
4	admin	127.0.0.1	Y	2013-08-15 12:31:47.582+08	2013-08-15 12:31:47.582+08	\N	N	\N
5	admin	127.0.0.1	Y	2013-08-15 12:31:50.866+08	2013-08-15 12:31:50.866+08	\N	N	\N
6	admin	127.0.0.1	Y	2013-08-16 09:31:41.219+08	2013-08-16 09:31:41.219+08	\N	N	\N
7	admin	127.0.0.1	Y	2013-08-16 09:31:45.152+08	2013-08-16 09:31:45.152+08	\N	N	\N
8	admin	127.0.0.1	Y	2013-08-16 19:30:04.873+08	2013-08-16 19:30:04.873+08	\N	N	\N
9	admin	127.0.0.1	Y	2013-08-16 19:30:06.887+08	2013-08-16 19:30:06.887+08	\N	N	\N
10	admin	127.0.0.1	Y	2013-08-17 12:03:56.022+08	2013-08-17 12:03:56.022+08	\N	N	\N
11	admin	127.0.0.1	Y	2013-08-17 12:03:58.864+08	2013-08-17 12:03:58.864+08	\N	N	\N
12	admin	127.0.0.1	Y	2013-08-18 00:07:07.289+08	2013-08-18 00:07:07.289+08	\N	N	\N
13	admin	127.0.0.1	Y	2013-08-18 00:07:09.755+08	2013-08-18 00:07:09.755+08	\N	N	\N
14	admin	127.0.0.1	Y	2013-08-19 09:49:37.24+08	2013-08-19 09:49:37.24+08	\N	N	\N
15	admin	127.0.0.1	Y	2013-08-19 09:49:40.679+08	2013-08-19 09:49:40.679+08	\N	N	\N
16	admin	127.0.0.1	Y	2013-08-19 14:05:24.028+08	2013-08-19 14:05:24.028+08	\N	N	\N
17	admin	127.0.0.1	Y	2013-08-19 14:05:27.188+08	2013-08-19 14:05:27.188+08	\N	N	\N
18	admin	127.0.0.1	N	2013-08-20 08:55:06.083+08	2013-08-20 08:55:06.083+08	\N	N	\N
19	admin	127.0.0.1	Y	2013-08-20 08:55:09.355+08	2013-08-20 08:55:09.355+08	\N	N	\N
20	admin	127.0.0.1	Y	2013-08-20 08:55:13.336+08	2013-08-20 08:55:13.336+08	\N	N	\N
21	admin	127.0.0.1	Y	2013-08-20 20:50:37.253+08	2013-08-20 20:50:37.253+08	\N	N	\N
22	admin	127.0.0.1	Y	2013-08-20 20:50:40.93+08	2013-08-20 20:50:40.93+08	\N	N	\N
23	admin	127.0.0.1	Y	2013-08-21 00:05:39.414+08	2013-08-21 00:05:39.414+08	\N	N	\N
24	admin	127.0.0.1	Y	2013-08-21 00:05:42.393+08	2013-08-21 00:05:42.393+08	\N	N	\N
25	admin	127.0.0.1	Y	2013-08-21 09:18:20.614+08	2013-08-21 09:18:20.614+08	\N	N	\N
26	admin	127.0.0.1	Y	2013-08-21 09:18:23.152+08	2013-08-21 09:18:23.152+08	\N	N	\N
27	admin	127.0.0.1	Y	2013-08-21 18:05:58.803+08	2013-08-21 18:05:58.803+08	\N	N	\N
28	admin	127.0.0.1	Y	2013-08-21 18:06:02.117+08	2013-08-21 18:06:02.117+08	\N	N	\N
29	admin	127.0.0.1	Y	2013-08-21 21:57:25.853+08	2013-08-21 21:57:25.853+08	\N	N	\N
30	admin	127.0.0.1	Y	2013-08-21 21:57:28.086+08	2013-08-21 21:57:28.086+08	\N	N	\N
31	admin	127.0.0.1	Y	2013-08-21 21:59:38.092+08	2013-08-21 21:59:38.092+08	\N	N	\N
32	admin	127.0.0.1	Y	2013-08-22 09:15:22.625+08	2013-08-22 09:15:22.625+08	\N	N	\N
33	admin	127.0.0.1	Y	2013-08-22 09:39:36.632+08	2013-08-22 09:39:36.632+08	\N	N	\N
34	admin	127.0.0.1	Y	2013-08-22 17:58:43.615+08	2013-08-22 17:58:43.615+08	\N	N	\N
35	admin	127.0.0.1	Y	2013-08-22 17:58:49.349+08	2013-08-22 17:58:49.349+08	\N	N	\N
36	admin	127.0.0.1	Y	2013-08-22 17:58:52.295+08	2013-08-22 17:58:52.295+08	\N	N	\N
37	admin	127.0.0.1	Y	2013-08-23 10:16:44.943+08	2013-08-23 10:16:44.943+08	\N	N	\N
38	admin	127.0.0.1	Y	2013-08-23 10:17:09.147+08	2013-08-23 10:17:09.147+08	\N	N	\N
39	admin	127.0.0.1	Y	2013-08-23 10:18:45.831+08	2013-08-23 10:18:45.831+08	\N	N	\N
40	admin	127.0.0.1	Y	2013-08-24 09:28:55.443+08	2013-08-24 09:28:55.443+08	\N	N	\N
41	admin	127.0.0.1	Y	2013-08-24 09:29:00.016+08	2013-08-24 09:29:00.016+08	\N	N	\N
42	admin	127.0.0.1	Y	2013-08-24 09:29:05.438+08	2013-08-24 09:29:05.438+08	\N	N	\N
43	admin	127.0.0.1	Y	2013-08-25 20:55:31.684+08	2013-08-25 20:55:31.684+08	\N	N	\N
44	admin	127.0.0.1	Y	2013-08-25 20:55:33.356+08	2013-08-25 20:55:33.356+08	\N	N	\N
45	admin	127.0.0.1	Y	2013-08-25 21:38:38.285+08	2013-08-25 21:38:38.285+08	\N	N	\N
46	admin	127.0.0.1	Y	2013-08-25 21:38:40.849+08	2013-08-25 21:38:40.849+08	\N	N	\N
47	admin	127.0.0.1	Y	2013-08-26 09:23:28.223+08	2013-08-26 09:23:28.223+08	\N	N	\N
48	admin	127.0.0.1	Y	2013-08-26 09:23:33.083+08	2013-08-26 09:23:33.083+08	\N	N	\N
49	admin	127.0.0.1	Y	2013-08-26 20:33:59.158+08	2013-08-26 20:33:59.158+08	\N	N	\N
50	admin	127.0.0.1	Y	2013-08-26 20:34:02.152+08	2013-08-26 20:34:02.152+08	\N	N	\N
51	admin	127.0.0.1	Y	2013-08-26 20:34:06.07+08	2013-08-26 20:34:06.07+08	\N	N	\N
52	admin	127.0.0.1	Y	2013-08-26 22:39:10.781+08	2013-08-26 22:39:10.781+08	\N	N	\N
53	admin	127.0.0.1	Y	2013-08-26 22:39:13.451+08	2013-08-26 22:39:13.451+08	\N	N	\N
54	admin	127.0.0.1	Y	2013-08-27 00:08:21.181+08	2013-08-27 00:08:21.181+08	\N	N	\N
55	admin	127.0.0.1	Y	2013-08-27 00:08:24.244+08	2013-08-27 00:08:24.244+08	\N	N	\N
56	admin	127.0.0.1	Y	2013-08-27 00:58:48.192+08	2013-08-27 00:58:48.192+08	\N	N	\N
57	admin	127.0.0.1	Y	2013-08-27 00:58:50.481+08	2013-08-27 00:58:50.481+08	\N	N	\N
58	admin	127.0.0.1	Y	2013-08-27 10:14:03.181+08	2013-08-27 10:14:03.181+08	\N	N	\N
59	admin	127.0.0.1	Y	2013-08-27 10:14:05.169+08	2013-08-27 10:14:05.169+08	\N	N	\N
60	admin	127.0.0.1	Y	2013-08-27 19:12:18.387+08	2013-08-27 19:12:18.387+08	\N	N	\N
61	admin	127.0.0.1	Y	2013-08-27 19:12:21.251+08	2013-08-27 19:12:21.251+08	\N	N	\N
62	admin	127.0.0.1	Y	2013-08-28 09:58:45.286+08	2013-08-28 09:58:45.286+08	\N	N	\N
63	admin	127.0.0.1	Y	2013-08-28 10:00:04.487+08	2013-08-28 10:00:04.487+08	\N	N	\N
64	admin	127.0.0.1	Y	2013-08-28 17:52:51.188+08	2013-08-28 17:52:51.188+08	\N	N	\N
65	admin	127.0.0.1	Y	2013-08-28 17:52:55.592+08	2013-08-28 17:52:55.592+08	\N	N	\N
66	admin	127.0.0.1	Y	2013-08-29 08:50:38.201+08	2013-08-29 08:50:38.201+08	\N	N	\N
67	admin	127.0.0.1	Y	2013-08-29 08:50:41.23+08	2013-08-29 08:50:41.23+08	\N	N	\N
68	admin	127.0.0.1	Y	2013-08-29 08:50:43.856+08	2013-08-29 08:50:43.856+08	\N	N	\N
69	admin	127.0.0.1	Y	2013-08-29 12:43:53.389+08	2013-08-29 12:43:53.389+08	\N	N	\N
70	admin	127.0.0.1	Y	2013-08-29 12:43:55.179+08	2013-08-29 12:43:55.179+08	\N	N	\N
71	admin	127.0.0.1	Y	2013-08-30 09:35:54.327+08	2013-08-30 09:35:54.327+08	\N	N	\N
72	admin	127.0.0.1	Y	2013-08-30 09:36:58.461+08	2013-08-30 09:36:58.461+08	\N	N	\N
73	admin	127.0.0.1	Y	2013-08-31 08:37:13.902+08	2013-08-31 08:37:13.902+08	\N	N	\N
74	admin	127.0.0.1	Y	2013-08-31 08:37:16.208+08	2013-08-31 08:37:16.208+08	\N	N	\N
75	admin	127.0.0.1	Y	2013-08-31 09:32:58.611+08	2013-08-31 09:32:58.611+08	\N	N	\N
76	admin	127.0.0.1	Y	2013-08-31 09:33:00.466+08	2013-08-31 09:33:00.466+08	\N	N	\N
77	admin	127.0.0.1	Y	2013-08-31 11:18:25.865+08	2013-08-31 11:18:25.865+08	\N	N	\N
78	admin	127.0.0.1	Y	2013-08-31 11:18:27.803+08	2013-08-31 11:18:27.803+08	\N	N	\N
79	admin	127.0.0.1	Y	2013-09-02 13:10:26.206+08	2013-09-02 13:10:26.206+08	\N	N	\N
80	admin	127.0.0.1	Y	2013-09-02 13:10:27.862+08	2013-09-02 13:10:27.862+08	\N	N	\N
81	admin	127.0.0.1	Y	2013-09-03 09:08:40.399+08	2013-09-03 09:08:40.399+08	\N	N	\N
82	admin	127.0.0.1	Y	2013-09-03 09:08:43.518+08	2013-09-03 09:08:43.518+08	\N	N	\N
83	admin	127.0.0.1	Y	2013-09-06 10:12:01.974+08	2013-09-06 10:12:01.974+08	\N	N	\N
84	admin	127.0.0.1	Y	2013-09-06 10:12:03.774+08	2013-09-06 10:12:03.774+08	\N	N	\N
85	admin	127.0.0.1	Y	2013-09-07 12:20:53.798+08	2013-09-07 12:20:53.798+08	\N	N	\N
86	admin	127.0.0.1	Y	2013-09-07 12:20:57.195+08	2013-09-07 12:20:57.195+08	\N	N	\N
87	admin	127.0.0.1	Y	2013-09-07 12:20:59.784+08	2013-09-07 12:20:59.784+08	\N	N	\N
88	admin	127.0.0.1	Y	2013-09-07 12:21:03.776+08	2013-09-07 12:21:03.776+08	\N	N	\N
89	admin	127.0.0.1	Y	2013-09-07 15:45:14.401+08	2013-09-07 15:45:14.401+08	\N	N	\N
90	admin	127.0.0.1	Y	2013-09-07 15:45:16.955+08	2013-09-07 15:45:16.955+08	\N	N	\N
91	admin	127.0.0.1	Y	2013-09-07 18:25:27.659+08	2013-09-07 18:25:27.659+08	\N	N	\N
92	admin	127.0.0.1	Y	2013-09-07 19:32:35.48+08	2013-09-07 19:32:35.48+08	\N	N	\N
93	admin	127.0.0.1	Y	2013-09-07 19:32:37.781+08	2013-09-07 19:32:37.781+08	\N	N	\N
94	admin	127.0.0.1	Y	2013-09-07 19:34:29.907+08	2013-09-07 19:34:29.907+08	\N	N	\N
95	admin	127.0.0.1	Y	2013-09-07 19:34:31.561+08	2013-09-07 19:34:31.561+08	\N	N	\N
96	admin	127.0.0.1	Y	2013-09-09 10:15:45.436+08	2013-09-09 10:15:45.436+08	\N	N	\N
97	admin	127.0.0.1	Y	2013-09-09 10:15:47.617+08	2013-09-09 10:15:47.617+08	\N	N	\N
98	admin	127.0.0.1	Y	2013-09-10 14:35:37.484+08	2013-09-10 14:35:37.484+08	\N	N	\N
99	admin	127.0.0.1	Y	2013-09-10 14:35:39.392+08	2013-09-10 14:35:39.392+08	\N	N	\N
100	admin	127.0.0.1	Y	2013-09-13 21:38:29.62+08	2013-09-13 21:38:29.62+08	\N	N	\N
101	admin	127.0.0.1	Y	2013-09-13 21:38:31.866+08	2013-09-13 21:38:31.866+08	\N	N	\N
102	admin	127.0.0.1	Y	2013-09-13 22:33:34.777+08	2013-09-13 22:33:34.777+08	\N	N	\N
103	admin	127.0.0.1	Y	2013-09-13 22:33:36.607+08	2013-09-13 22:33:36.607+08	\N	N	\N
104	admin	127.0.0.1	Y	2013-09-16 14:48:44.486+08	2013-09-16 14:48:44.486+08	\N	N	\N
105	admin	127.0.0.1	Y	2013-09-16 14:48:48.249+08	2013-09-16 14:48:48.249+08	\N	N	\N
106	admin	127.0.0.1	Y	2013-09-17 10:20:51.025+08	2013-09-17 10:20:51.025+08	\N	N	\N
107	admin	127.0.0.1	Y	2013-09-17 10:20:54.016+08	2013-09-17 10:20:54.016+08	\N	N	\N
108	admin	127.0.0.1	Y	2013-09-19 00:23:01.133+08	2013-09-19 00:23:01.133+08	\N	N	\N
109	admin	127.0.0.1	Y	2013-09-19 00:23:03.503+08	2013-09-19 00:23:03.503+08	\N	N	\N
110	admin	127.0.0.1	Y	2013-09-21 20:04:50.781+08	2013-09-21 20:04:50.781+08	\N	N	\N
111	admin	127.0.0.1	Y	2013-09-21 20:04:52.838+08	2013-09-21 20:04:52.838+08	\N	N	\N
112	admin	127.0.0.1	Y	2013-09-22 14:35:34.275+08	2013-09-22 14:35:34.275+08	\N	N	\N
113	admin	127.0.0.1	Y	2013-09-22 14:35:36.409+08	2013-09-22 14:35:36.409+08	\N	N	\N
114	admin	127.0.0.1	Y	2013-09-22 14:35:38.461+08	2013-09-22 14:35:38.461+08	\N	N	\N
115	admin	127.0.0.1	Y	2013-09-23 09:04:35.926+08	2013-09-23 09:04:35.926+08	\N	N	\N
116	admin	127.0.0.1	Y	2013-09-23 09:04:38.078+08	2013-09-23 09:04:38.078+08	\N	N	\N
117	admin	127.0.0.1	Y	2013-09-23 23:38:32.332+08	2013-09-23 23:38:32.332+08	\N	N	\N
118	admin	127.0.0.1	Y	2013-09-23 23:38:34.625+08	2013-09-23 23:38:34.625+08	\N	N	\N
119	admin	127.0.0.1	Y	2013-09-24 22:30:17.903+08	2013-09-24 22:30:17.903+08	\N	N	\N
120	admin	127.0.0.1	Y	2013-09-24 22:30:20.395+08	2013-09-24 22:30:20.395+08	\N	N	\N
121	admin	127.0.0.1	Y	2013-09-24 22:30:22.489+08	2013-09-24 22:30:22.489+08	\N	N	\N
122	admin	127.0.0.1	Y	2013-09-25 09:36:08.39+08	2013-09-25 09:36:08.39+08	\N	N	\N
123	admin	127.0.0.1	Y	2013-09-25 09:36:10.385+08	2013-09-25 09:36:10.385+08	\N	N	\N
124	admin	127.0.0.1	Y	2013-09-25 11:31:52.533+08	2013-09-25 11:31:52.533+08	\N	N	\N
125	admin	127.0.0.1	Y	2013-09-25 11:32:04.645+08	2013-09-25 11:32:04.645+08	\N	N	\N
126	admin	127.0.0.1	Y	2013-09-26 13:23:38.882+08	2013-09-26 13:23:38.882+08	\N	N	\N
127	admin	127.0.0.1	Y	2013-09-26 13:23:40.469+08	2013-09-26 13:23:40.469+08	\N	N	\N
128	admin	127.0.0.1	Y	2013-09-26 21:57:02.123+08	2013-09-26 21:57:02.123+08	\N	N	\N
129	admin	127.0.0.1	Y	2013-09-26 21:57:03.969+08	2013-09-26 21:57:03.969+08	\N	N	\N
130	admin	127.0.0.1	Y	2013-09-27 09:59:36.073+08	2013-09-27 09:59:36.073+08	\N	N	\N
131	admin	127.0.0.1	Y	2013-09-27 09:59:39.084+08	2013-09-27 09:59:39.084+08	\N	N	\N
132	admin	127.0.0.1	Y	2013-09-29 10:12:39.029+08	2013-09-29 10:12:39.029+08	\N	N	\N
133	admin	127.0.0.1	Y	2013-09-29 10:12:41.766+08	2013-09-29 10:12:41.766+08	\N	N	\N
134	admin	127.0.0.1	Y	2013-10-02 10:54:59.046+08	2013-10-02 10:54:59.046+08	\N	N	\N
135	admin	127.0.0.1	Y	2013-10-02 10:55:04.847+08	2013-10-02 10:55:04.847+08	\N	N	\N
136	admin	127.0.0.1	Y	2013-10-03 20:06:27.669+08	2013-10-03 20:06:27.669+08	\N	N	\N
137	admin	127.0.0.1	Y	2013-10-03 20:06:29.218+08	2013-10-03 20:06:29.218+08	\N	N	\N
138	admin	127.0.0.1	Y	2013-10-04 09:27:57.896+08	2013-10-04 09:27:57.896+08	\N	N	\N
139	admin	127.0.0.1	Y	2013-10-04 09:28:00.399+08	2013-10-04 09:28:00.399+08	\N	N	\N
140	admin	127.0.0.1	Y	2013-10-04 18:42:58.016+08	2013-10-04 18:42:58.016+08	\N	N	\N
141	admin	127.0.0.1	Y	2013-10-04 18:42:59.955+08	2013-10-04 18:42:59.955+08	\N	N	\N
142	admin	127.0.0.1	Y	2013-10-05 10:41:20.053+08	2013-10-05 10:41:20.053+08	\N	N	\N
143	admin	127.0.0.1	Y	2013-10-05 10:41:22.181+08	2013-10-05 10:41:22.181+08	\N	N	\N
144	admin	127.0.0.1	Y	2013-10-05 22:58:31.446+08	2013-10-05 22:58:31.446+08	\N	N	\N
145	admin	127.0.0.1	Y	2013-10-05 22:58:33.867+08	2013-10-05 22:58:33.867+08	\N	N	\N
146	admin	127.0.0.1	Y	2013-10-06 14:18:45.871+08	2013-10-06 14:18:45.871+08	\N	N	\N
147	admin	127.0.0.1	Y	2013-10-06 14:18:48.788+08	2013-10-06 14:18:48.788+08	\N	N	\N
148	admin	127.0.0.1	Y	2013-10-23 10:48:24.152+08	2013-10-23 10:48:24.152+08	\N	N	\N
149	admin	127.0.0.1	Y	2013-10-23 10:48:28.017+08	2013-10-23 10:48:28.017+08	\N	N	\N
150	admin	127.0.0.1	Y	2013-10-30 10:24:15.54+08	2013-10-30 10:24:15.54+08	\N	N	\N
151	admin	127.0.0.1	Y	2013-10-30 10:24:19.365+08	2013-10-30 10:24:19.365+08	\N	N	\N
152	admin	127.0.0.1	Y	2013-10-31 14:42:12.578+08	2013-10-31 14:42:12.578+08	\N	N	\N
153	admin	\N	\N	2013-10-31 14:46:14.082+08	2013-10-31 14:46:14.082+08	\N	N	\N
154	admin	127.0.0.1	Y	2013-10-31 14:46:27.394+08	2013-10-31 14:46:27.394+08	\N	N	\N
155	admin	127.0.0.1	Y	2013-10-31 14:57:26.95+08	2013-10-31 14:57:26.95+08	\N	N	\N
156	admin	127.0.0.1	Y	2013-10-31 14:57:44.07+08	2013-10-31 14:57:44.07+08	\N	N	\N
157	admin	127.0.0.1	Y	2013-11-01 09:45:44.23+08	2013-11-01 09:45:44.23+08	\N	N	\N
158	admin	127.0.0.1	Y	2013-11-01 09:45:46.037+08	2013-11-01 09:45:46.037+08	\N	N	\N
159	admin	127.0.0.1	Y	2013-11-01 11:00:52.227+08	2013-11-01 11:00:52.227+08	\N	N	\N
160	admin	127.0.0.1	Y	2013-11-01 11:00:54.655+08	2013-11-01 11:00:54.655+08	\N	N	\N
161	admin	127.0.0.1	Y	2013-11-01 11:07:38.056+08	2013-11-01 11:07:38.056+08	\N	N	\N
162	admin	127.0.0.1	Y	2013-11-01 11:07:40.391+08	2013-11-01 11:07:40.391+08	\N	N	\N
163	admin	127.0.0.1	Y	2013-11-02 13:20:41.309+08	2013-11-02 13:20:41.309+08	\N	N	\N
164	admin	127.0.0.1	Y	2013-11-02 13:20:43.179+08	2013-11-02 13:20:43.179+08	\N	N	\N
165	admin	127.0.0.1	Y	2013-11-04 09:16:28.638+08	2013-11-04 09:16:28.638+08	\N	N	\N
166	admin	127.0.0.1	Y	2013-11-04 09:16:31.862+08	2013-11-04 09:16:31.862+08	\N	N	\N
167	admin	127.0.0.1	Y	2013-11-05 14:59:33.6+08	2013-11-05 14:59:33.6+08	\N	N	\N
168	admin	127.0.0.1	Y	2013-11-05 14:59:35.718+08	2013-11-05 14:59:35.718+08	\N	N	\N
169	admin	127.0.0.1	Y	2013-11-06 09:27:25.89+08	2013-11-06 09:27:25.89+08	\N	N	\N
170	admin	127.0.0.1	Y	2013-11-06 09:27:27.768+08	2013-11-06 09:27:27.768+08	\N	N	\N
171	admin	127.0.0.1	Y	2013-11-07 09:45:39.252+08	2013-11-07 09:45:39.252+08	\N	N	\N
172	admin	127.0.0.1	Y	2013-11-07 09:45:41.428+08	2013-11-07 09:45:41.428+08	\N	N	\N
173	admin	127.0.0.1	Y	2013-11-08 09:37:02.189+08	2013-11-08 09:37:02.189+08	\N	N	\N
174	admin	127.0.0.1	Y	2013-11-08 09:37:04.044+08	2013-11-08 09:37:04.044+08	\N	N	\N
175	admin	127.0.0.1	Y	2013-11-09 16:46:06.871+08	2013-11-09 16:46:06.871+08	\N	N	\N
176	admin	127.0.0.1	Y	2013-11-09 21:00:13.526+08	2013-11-09 21:00:13.526+08	\N	N	\N
177	admin	127.0.0.1	Y	2013-11-10 11:18:52.874+08	2013-11-10 11:18:52.874+08	\N	N	\N
178	admin	127.0.0.1	Y	2013-11-14 14:44:49.498+08	2013-11-14 14:44:49.498+08	\N	N	\N
179	admin	127.0.0.1	Y	2013-11-20 09:12:51.809+08	2013-11-20 09:12:51.809+08	\N	N	\N
180	admin	127.0.0.1	N	2013-11-21 10:32:41.729+08	2013-11-21 10:32:41.729+08	\N	N	\N
181	admin	127.0.0.1	Y	2013-11-21 10:32:44.281+08	2013-11-21 10:32:44.281+08	\N	N	\N
182	admin	127.0.0.1	Y	2013-11-22 10:51:46.084+08	2013-11-22 10:51:46.084+08	\N	N	\N
183	admin	127.0.0.1	Y	2013-11-22 16:08:08.657+08	2013-11-22 16:08:08.657+08	\N	N	\N
184	admin	127.0.0.1	Y	2013-11-23 09:45:11.308+08	2013-11-23 09:45:11.308+08	\N	N	\N
185	admin	127.0.0.1	Y	2013-11-23 18:14:02.841+08	2013-11-23 18:14:02.841+08	\N	N	\N
186	admin	127.0.0.1	Y	2013-11-23 21:11:38.002+08	2013-11-23 21:11:38.002+08	\N	N	\N
187	admin	127.0.0.1	Y	2013-11-24 14:09:16.854+08	2013-11-24 14:09:16.854+08	\N	N	\N
188	tony	127.0.0.1	Y	2013-11-24 17:50:59.487+08	2013-11-24 17:50:59.487+08	\N	N	\N
189	natasha	127.0.0.1	Y	2013-11-24 17:56:36.418+08	2013-11-24 17:56:36.418+08	\N	N	\N
190	nick	127.0.0.1	Y	2013-11-24 17:56:46.738+08	2013-11-24 17:56:46.738+08	\N	N	\N
191	admin	127.0.0.1	Y	2013-11-24 18:14:12.104+08	2013-11-24 18:14:12.104+08	\N	N	\N
192	admin	127.0.0.1	Y	2013-11-25 09:37:12.186+08	2013-11-25 09:37:12.186+08	\N	N	\N
193	nick	127.0.0.1	Y	2013-11-25 10:44:30.515+08	2013-11-25 10:44:30.515+08	\N	N	\N
194	admin	127.0.0.1	Y	2013-11-25 10:47:26.275+08	2013-11-25 10:47:26.275+08	\N	N	\N
195	tony	127.0.0.1	Y	2013-11-25 10:48:33.676+08	2013-11-25 10:48:33.676+08	\N	N	\N
196	natasha	127.0.0.1	Y	2013-11-25 10:50:17.64+08	2013-11-25 10:50:17.64+08	\N	N	\N
197	admin	127.0.0.1	Y	2013-11-25 11:13:55.937+08	2013-11-25 11:13:55.937+08	\N	N	\N
198	admin	127.0.0.1	Y	2013-11-25 12:25:04.239+08	2013-11-25 12:25:04.239+08	\N	N	\N
199	admin	127.0.0.1	Y	2013-11-25 12:34:54.949+08	2013-11-25 12:34:54.949+08	\N	N	\N
200	tony	127.0.0.1	N	2013-11-25 14:17:11.72+08	2013-11-25 14:17:11.72+08	\N	N	\N
201	tony	127.0.0.1	Y	2013-11-25 14:17:13.919+08	2013-11-25 14:17:13.919+08	\N	N	\N
202	tony	127.0.0.1	Y	2013-11-25 14:33:30.064+08	2013-11-25 14:33:30.064+08	\N	N	\N
203	natasha	127.0.0.1	Y	2013-11-25 14:46:15.673+08	2013-11-25 14:46:15.673+08	\N	N	\N
204	tony	127.0.0.1	Y	2013-11-25 14:48:15.818+08	2013-11-25 14:48:15.818+08	\N	N	\N
205	tony	127.0.0.1	Y	2013-11-25 14:48:34.005+08	2013-11-25 14:48:34.005+08	\N	N	\N
206	natasha	127.0.0.1	Y	2013-11-25 14:48:49.656+08	2013-11-25 14:48:49.656+08	\N	N	\N
207	nick	127.0.0.1	Y	2013-11-25 14:49:07.325+08	2013-11-25 14:49:07.325+08	\N	N	\N
208	admin	127.0.0.1	Y	2013-11-25 14:58:52.671+08	2013-11-25 14:58:52.671+08	\N	N	\N
209	tony	127.0.0.1	Y	2013-11-25 19:52:49.706+08	2013-11-25 19:52:49.706+08	\N	N	\N
210	admin	127.0.0.1	Y	2013-11-25 23:23:59.094+08	2013-11-25 23:23:59.094+08	\N	N	\N
211	nick	127.0.0.1	Y	2013-11-26 12:27:06.107+08	2013-11-26 12:27:06.107+08	\N	N	\N
212	admin	127.0.0.1	Y	2013-11-26 12:36:16.254+08	2013-11-26 12:36:16.254+08	\N	N	\N
213	nick	127.0.0.1	Y	2013-11-26 14:58:52.051+08	2013-11-26 14:58:52.051+08	\N	N	\N
214	tony	127.0.0.1	Y	2013-11-26 15:00:45.139+08	2013-11-26 15:00:45.139+08	\N	N	\N
215	nick	127.0.0.1	Y	2013-11-26 15:09:35.599+08	2013-11-26 15:09:35.599+08	\N	N	\N
216	tony	127.0.0.1	Y	2013-11-26 15:10:02.122+08	2013-11-26 15:10:02.122+08	\N	N	\N
217	nick	127.0.0.1	Y	2013-11-26 15:51:45.464+08	2013-11-26 15:51:45.464+08	\N	N	\N
218	admin	127.0.0.1	Y	2013-11-26 16:10:29.808+08	2013-11-26 16:10:29.808+08	\N	N	\N
219	tony	127.0.0.1	Y	2013-11-26 16:28:42.108+08	2013-11-26 16:28:42.108+08	\N	N	\N
220	nick	127.0.0.1	Y	2013-11-26 16:29:16.028+08	2013-11-26 16:29:16.028+08	\N	N	\N
221	natasha	127.0.0.1	Y	2013-11-26 16:35:05.488+08	2013-11-26 16:35:05.488+08	\N	N	\N
222	admin	127.0.0.1	Y	2013-11-26 16:53:11.921+08	2013-11-26 16:53:11.921+08	\N	N	\N
223	tony	127.0.0.1	Y	2013-11-26 20:38:30.797+08	2013-11-26 20:38:30.797+08	\N	N	\N
224	nick	127.0.0.1	Y	2013-11-26 20:39:12.744+08	2013-11-26 20:39:12.744+08	\N	N	\N
225	natasha	127.0.0.1	Y	2013-11-26 20:39:59.958+08	2013-11-26 20:39:59.958+08	\N	N	\N
226	admin	127.0.0.1	Y	2013-11-26 21:23:07.392+08	2013-11-26 21:23:07.392+08	\N	N	\N
227	admin	127.0.0.1	Y	2013-11-26 21:23:37.626+08	2013-11-26 21:23:37.626+08	\N	N	\N
228	natasha	127.0.0.1	Y	2013-11-27 09:34:02.151+08	2013-11-27 09:34:02.151+08	\N	N	\N
229	admin	127.0.0.1	Y	2013-11-27 09:34:21.143+08	2013-11-27 09:34:21.143+08	\N	N	\N
230	natasha	127.0.0.1	Y	2013-11-27 10:19:38.899+08	2013-11-27 10:19:38.899+08	\N	N	\N
231	admin	127.0.0.1	Y	2013-11-27 10:22:52.898+08	2013-11-27 10:22:52.898+08	\N	N	\N
232	admin	127.0.0.1	N	2013-11-27 10:42:28.623+08	2013-11-27 10:42:28.623+08	\N	N	\N
233	admin	127.0.0.1	Y	2013-11-27 10:42:32.828+08	2013-11-27 10:42:32.828+08	\N	N	\N
234	admin	127.0.0.1	Y	2013-11-27 10:44:22.839+08	2013-11-27 10:44:22.839+08	\N	N	\N
235	tony	127.0.0.1	Y	2013-11-27 13:03:06.793+08	2013-11-27 13:03:06.793+08	\N	N	\N
236	nick	127.0.0.1	Y	2013-11-27 13:04:01.525+08	2013-11-27 13:04:01.525+08	\N	N	\N
237	admin	127.0.0.1	Y	2013-11-27 14:33:17.252+08	2013-11-27 14:33:17.252+08	\N	N	\N
238	tony	127.0.0.1	Y	2013-11-28 14:24:40.75+08	2013-11-28 14:24:40.75+08	\N	N	\N
239	tony	127.0.0.1	Y	2013-11-28 14:26:29.491+08	2013-11-28 14:26:29.491+08	\N	N	\N
240	admin	127.0.0.1	Y	2013-11-28 14:45:55.276+08	2013-11-28 14:45:55.276+08	\N	N	\N
241	nick	127.0.0.1	Y	2013-11-28 14:52:49.363+08	2013-11-28 14:52:49.363+08	\N	N	\N
242	tony	127.0.0.1	Y	2013-11-28 15:25:10.773+08	2013-11-28 15:25:10.773+08	\N	N	\N
243	nick	127.0.0.1	Y	2013-11-28 15:25:29.49+08	2013-11-28 15:25:29.49+08	\N	N	\N
244	admin	127.0.0.1	Y	2013-11-28 15:27:12.801+08	2013-11-28 15:27:12.801+08	\N	N	\N
245	tony	127.0.0.1	Y	2013-11-28 15:40:01.198+08	2013-11-28 15:40:01.198+08	\N	N	\N
246	nick	127.0.0.1	Y	2013-11-28 15:41:21.845+08	2013-11-28 15:41:21.845+08	\N	N	\N
247	natasha	127.0.0.1	Y	2013-11-28 15:42:30.769+08	2013-11-28 15:42:30.769+08	\N	N	\N
248	admin	127.0.0.1	Y	2013-11-28 16:06:49.251+08	2013-11-28 16:06:49.251+08	\N	N	\N
249	tony	127.0.0.1	Y	2013-11-28 17:35:58.967+08	2013-11-28 17:35:58.967+08	\N	N	\N
250	nick	127.0.0.1	Y	2013-11-28 17:36:48.889+08	2013-11-28 17:36:48.889+08	\N	N	\N
251	natasha	127.0.0.1	Y	2013-11-28 17:37:51.256+08	2013-11-28 17:37:51.256+08	\N	N	\N
252	tony	127.0.0.1	N	2013-11-28 19:31:10.365+08	2013-11-28 19:31:10.365+08	\N	N	\N
253	tony	127.0.0.1	Y	2013-11-28 19:31:14.57+08	2013-11-28 19:31:14.57+08	\N	N	\N
254	nick	127.0.0.1	Y	2013-11-28 19:31:44.152+08	2013-11-28 19:31:44.152+08	\N	N	\N
255	tony	127.0.0.1	Y	2013-11-28 19:37:39.098+08	2013-11-28 19:37:39.098+08	\N	N	\N
256	nick	127.0.0.1	Y	2013-11-28 19:41:31.554+08	2013-11-28 19:41:31.554+08	\N	N	\N
257	natasha	127.0.0.1	Y	2013-11-28 19:41:54.518+08	2013-11-28 19:41:54.518+08	\N	N	\N
258	nick	127.0.0.1	Y	2013-11-28 19:42:13.066+08	2013-11-28 19:42:13.066+08	\N	N	\N
259	admin	127.0.0.1	Y	2013-11-28 20:08:09.43+08	2013-11-28 20:08:09.43+08	\N	N	\N
260	tony	127.0.0.1	Y	2013-11-28 20:40:29.085+08	2013-11-28 20:40:29.085+08	\N	N	\N
261	tony	127.0.0.1	Y	2013-11-28 20:50:29.748+08	2013-11-28 20:50:29.748+08	\N	N	\N
262	admin	127.0.0.1	Y	2013-11-28 21:04:20.095+08	2013-11-28 21:04:20.095+08	\N	N	\N
263	tony	127.0.0.1	Y	2013-11-28 21:22:58.046+08	2013-11-28 21:22:58.046+08	\N	N	\N
264	admin	127.0.0.1	Y	2013-11-28 21:23:50.045+08	2013-11-28 21:23:50.045+08	\N	N	\N
265	tony	127.0.0.1	Y	2013-11-29 11:42:40.314+08	2013-11-29 11:42:40.314+08	\N	N	\N
266	admin	127.0.0.1	Y	2013-11-29 11:43:15.952+08	2013-11-29 11:43:15.952+08	\N	N	\N
267	natasha	127.0.0.1	Y	2013-11-29 11:52:05.436+08	2013-11-29 11:52:05.436+08	\N	N	\N
268	admin	127.0.0.1	Y	2013-11-29 12:00:02.36+08	2013-11-29 12:00:02.36+08	\N	N	\N
269	natasha	127.0.0.1	Y	2013-11-29 12:22:08.644+08	2013-11-29 12:22:08.644+08	\N	N	\N
270	admin	127.0.0.1	Y	2013-11-29 12:38:27.372+08	2013-11-29 12:38:27.372+08	\N	N	\N
271	admin	127.0.0.1	Y	2013-11-29 12:40:18.491+08	2013-11-29 12:40:18.491+08	\N	N	\N
272	natasha	127.0.0.1	Y	2013-11-29 12:40:55.223+08	2013-11-29 12:40:55.223+08	\N	N	\N
273	admin	127.0.0.1	Y	2013-11-29 12:51:25.689+08	2013-11-29 12:51:25.689+08	\N	N	\N
274	natasha	127.0.0.1	Y	2013-11-29 12:51:50.58+08	2013-11-29 12:51:50.58+08	\N	N	\N
275	admin	127.0.0.1	Y	2013-11-29 13:15:27.596+08	2013-11-29 13:15:27.596+08	\N	N	\N
276	natasha	127.0.0.1	Y	2013-11-29 13:29:34.638+08	2013-11-29 13:29:34.638+08	\N	N	\N
277	tony	127.0.0.1	Y	2013-11-29 13:30:23.481+08	2013-11-29 13:30:23.481+08	\N	N	\N
278	admin	127.0.0.1	Y	2013-11-29 14:32:02.953+08	2013-11-29 14:32:02.953+08	\N	N	\N
279	tony	127.0.0.1	Y	2013-11-29 19:17:40.191+08	2013-11-29 19:17:40.191+08	\N	N	\N
280	nick	127.0.0.1	Y	2013-11-29 19:21:08.217+08	2013-11-29 19:21:08.217+08	\N	N	\N
281	natasha	127.0.0.1	Y	2013-11-29 19:25:33.71+08	2013-11-29 19:25:33.71+08	\N	N	\N
282	nick	127.0.0.1	Y	2013-11-29 19:26:32.094+08	2013-11-29 19:26:32.094+08	\N	N	\N
283	tony	127.0.0.1	Y	2013-11-29 19:28:26.37+08	2013-11-29 19:28:26.37+08	\N	N	\N
284	nick	127.0.0.1	Y	2013-11-29 19:29:47.83+08	2013-11-29 19:29:47.83+08	\N	N	\N
285	natasha	127.0.0.1	Y	2013-11-29 21:14:51.79+08	2013-11-29 21:14:51.79+08	\N	N	\N
286	tony	127.0.0.1	Y	2013-11-29 21:32:42.912+08	2013-11-29 21:32:42.912+08	\N	N	\N
287	nick	127.0.0.1	Y	2013-11-29 21:35:09.796+08	2013-11-29 21:35:09.796+08	\N	N	\N
288	natasha	127.0.0.1	Y	2013-11-29 21:36:21.972+08	2013-11-29 21:36:21.972+08	\N	N	\N
289	nick	127.0.0.1	Y	2013-11-29 21:37:38.57+08	2013-11-29 21:37:38.57+08	\N	N	\N
290	tony	127.0.0.1	Y	2013-11-29 21:39:48.356+08	2013-11-29 21:39:48.356+08	\N	N	\N
291	admin	127.0.0.1	Y	2013-11-29 21:49:15.688+08	2013-11-29 21:49:15.688+08	\N	N	\N
292	tony	127.0.0.1	Y	2013-11-30 13:01:19.093+08	2013-11-30 13:01:19.093+08	\N	N	\N
293	nick	127.0.0.1	Y	2013-11-30 13:02:30.721+08	2013-11-30 13:02:30.721+08	\N	N	\N
294	tony	127.0.0.1	Y	2013-11-30 13:03:18.394+08	2013-11-30 13:03:18.394+08	\N	N	\N
295	natasha	127.0.0.1	Y	2013-11-30 13:03:48.977+08	2013-11-30 13:03:48.977+08	\N	N	\N
296	nick	127.0.0.1	Y	2013-11-30 13:06:45.153+08	2013-11-30 13:06:45.153+08	\N	N	\N
297	tony	127.0.0.1	Y	2013-11-30 13:07:48.975+08	2013-11-30 13:07:48.975+08	\N	N	\N
298	nick	127.0.0.1	Y	2013-11-30 13:11:12.262+08	2013-11-30 13:11:12.262+08	\N	N	\N
299	admin	127.0.0.1	Y	2013-12-15 10:43:15.96+08	2013-12-15 10:43:15.96+08	\N	N	\N
300	admin	127.0.0.1	Y	2013-12-15 10:51:32.096+08	2013-12-15 10:51:32.096+08	\N	N	\N
301	admin	127.0.0.1	Y	2013-12-18 13:57:10.326+08	2013-12-18 13:57:10.326+08	\N	N	\N
302	admin	127.0.0.1	Y	2013-12-19 15:20:04.691+08	2013-12-19 15:20:04.691+08	\N	N	\N
303	admin	127.0.0.1	Y	2013-12-22 17:08:06.88+08	2013-12-22 17:08:06.88+08	\N	N	\N
304	admin	127.0.0.1	N	2014-01-03 10:29:47.483+08	2014-01-03 10:29:47.483+08	\N	N	\N
305	admin	127.0.0.1	N	2014-01-03 10:29:50.753+08	2014-01-03 10:29:50.753+08	\N	N	\N
306	admin	127.0.0.1	Y	2014-01-10 12:53:08.377+08	2014-01-10 12:53:08.377+08	\N	N	\N
307	admin	127.0.0.1	Y	2014-01-11 20:56:35.439+08	2014-01-11 20:56:35.439+08	\N	N	\N
308	tony	127.0.0.1	Y	2014-01-12 23:47:24.988+08	2014-01-12 23:47:24.988+08	\N	N	\N
309	tony	127.0.0.1	Y	2014-01-13 09:41:20.264+08	2014-01-13 09:41:20.264+08	\N	N	\N
310	admin	127.0.0.1	Y	2014-01-16 15:35:34.96+08	2014-01-16 15:35:34.96+08	\N	N	\N
311	admin	127.0.0.1	Y	2014-01-17 12:40:35.831+08	2014-01-17 12:40:35.831+08	\N	N	\N
312	admin	127.0.0.1	Y	2014-01-17 14:33:36.204+08	2014-01-17 14:33:36.204+08	\N	N	\N
313	admin	127.0.0.1	N	2014-01-18 12:00:58.387+08	2014-01-18 12:00:58.387+08	\N	N	\N
314	admin	127.0.0.1	Y	2014-01-18 12:01:00.479+08	2014-01-18 12:01:00.479+08	\N	N	\N
315	nick	127.0.0.1	Y	2014-01-18 12:22:29.181+08	2014-01-18 12:22:29.181+08	\N	N	\N
316	tony	127.0.0.1	Y	2014-01-18 12:24:32.012+08	2014-01-18 12:24:32.012+08	\N	N	\N
317	admin	127.0.0.1	Y	2014-01-18 12:41:23.91+08	2014-01-18 12:41:23.91+08	\N	N	\N
318	tony	127.0.0.1	Y	2014-01-18 12:50:12.068+08	2014-01-18 12:50:12.068+08	\N	N	\N
319	admin	127.0.0.1	N	2014-01-18 12:53:03.729+08	2014-01-18 12:53:03.729+08	\N	N	\N
320	admin	127.0.0.1	Y	2014-01-18 12:53:05.857+08	2014-01-18 12:53:05.857+08	\N	N	\N
321	tony	127.0.0.1	Y	2014-01-18 12:53:28.579+08	2014-01-18 12:53:28.579+08	\N	N	\N
322	admin	127.0.0.1	Y	2014-01-18 16:21:10.308+08	2014-01-18 16:21:10.308+08	\N	N	\N
323	tony	127.0.0.1	Y	2014-01-18 17:15:24.33+08	2014-01-18 17:15:24.33+08	\N	N	\N
324	nick	127.0.0.1	Y	2014-01-18 17:16:17.367+08	2014-01-18 17:16:17.367+08	\N	N	\N
325	admin	127.0.0.1	Y	2014-01-18 19:58:13.255+08	2014-01-18 19:58:13.255+08	\N	N	\N
326	admin	127.0.0.1	Y	2014-01-18 20:12:35.43+08	2014-01-18 20:12:35.43+08	\N	N	\N
327	tony	127.0.0.1	Y	2014-01-18 20:19:28.457+08	2014-01-18 20:19:28.457+08	\N	N	\N
328	nick	127.0.0.1	Y	2014-01-18 20:21:51.353+08	2014-01-18 20:21:51.353+08	\N	N	\N
329	tony	127.0.0.1	Y	2014-01-18 20:22:14.546+08	2014-01-18 20:22:14.546+08	\N	N	\N
330	admin	127.0.0.1	Y	2014-01-18 20:22:30.117+08	2014-01-18 20:22:30.117+08	\N	N	\N
331	tony	127.0.0.1	Y	2014-01-18 21:11:21.773+08	2014-01-18 21:11:21.773+08	\N	N	\N
332	tony	127.0.0.1	Y	2014-01-18 21:17:01.307+08	2014-01-18 21:17:01.307+08	\N	N	\N
333	nick	127.0.0.1	Y	2014-01-18 21:19:51.36+08	2014-01-18 21:19:51.36+08	\N	N	\N
334	admin	127.0.0.1	Y	2014-01-18 21:21:34.926+08	2014-01-18 21:21:34.926+08	\N	N	\N
335	tony	127.0.0.1	Y	2014-01-20 09:46:39.624+08	2014-01-20 09:46:39.624+08	\N	N	\N
336	nick	127.0.0.1	Y	2014-01-20 09:49:27.614+08	2014-01-20 09:49:27.614+08	\N	N	\N
337	tony	127.0.0.1	Y	2014-01-20 09:50:06.093+08	2014-01-20 09:50:06.093+08	\N	N	\N
338	admin	127.0.0.1	Y	2014-01-20 09:50:45.45+08	2014-01-20 09:50:45.45+08	\N	N	\N
339	tony	127.0.0.1	Y	2014-01-20 09:51:56.707+08	2014-01-20 09:51:56.707+08	\N	N	\N
340	admin	192.168.0.147	Y	2014-01-25 17:22:36.743+08	2014-01-25 17:22:36.743+08	\N	N	\N
341	admin	127.0.0.1	Y	2014-01-25 21:06:10.78+08	2014-01-25 21:06:10.78+08	\N	N	\N
342	admin	127.0.0.1	Y	2014-01-26 14:36:38.325+08	2014-01-26 14:36:38.325+08	\N	N	\N
343	admin	192.168.1.81	Y	2014-01-26 15:26:33.159+08	2014-01-26 15:26:33.159+08	\N	N	\N
344	admin2	192.168.1.81	N	2014-01-26 15:40:50.103+08	2014-01-26 15:40:50.103+08	\N	N	\N
345	admin2	192.168.1.81	N	2014-01-26 15:40:54.051+08	2014-01-26 15:40:54.051+08	\N	N	\N
346	admin2	192.168.1.81	N	2014-01-26 15:40:59.057+08	2014-01-26 15:40:59.057+08	\N	N	\N
347	admin2	192.168.1.81	Y	2014-01-26 15:41:52.659+08	2014-01-26 15:41:52.659+08	\N	N	\N
348	admin2	192.168.1.81	Y	2014-01-26 15:42:05.493+08	2014-01-26 15:42:05.493+08	\N	N	\N
349	admin2	192.168.1.81	Y	2014-01-26 15:42:28.532+08	2014-01-26 15:42:28.532+08	\N	N	\N
350	admin	127.0.0.1	Y	2014-01-26 15:51:44.874+08	2014-01-26 15:51:44.874+08	\N	N	\N
351	admin2	192.168.1.81	Y	2014-01-26 15:52:20.571+08	2014-01-26 15:52:20.571+08	\N	N	\N
352	admin2	192.168.1.81	Y	2014-01-26 18:29:50.854+08	2014-01-26 18:29:50.854+08	\N	N	\N
353	tony	127.0.0.1	Y	2014-01-27 11:09:34.69+08	2014-01-27 11:09:34.69+08	\N	N	\N
354	nick	127.0.0.1	Y	2014-01-27 11:12:34.513+08	2014-01-27 11:12:34.513+08	\N	N	\N
355	tony	127.0.0.1	Y	2014-01-27 11:13:07.965+08	2014-01-27 11:13:07.965+08	\N	N	\N
356	admin	127.0.0.1	Y	2014-01-27 11:14:03.07+08	2014-01-27 11:14:03.07+08	\N	N	\N
357	tony	127.0.0.1	Y	2014-01-27 11:15:26.869+08	2014-01-27 11:15:26.869+08	\N	N	\N
358	tony	127.0.0.1	Y	2014-01-27 11:16:43.624+08	2014-01-27 11:16:43.624+08	\N	N	\N
359	tony	127.0.0.1	Y	2014-01-28 10:30:47.069+08	2014-01-28 10:30:47.069+08	\N	N	\N
360	nick	127.0.0.1	Y	2014-01-28 10:32:55.089+08	2014-01-28 10:32:55.089+08	\N	N	\N
361	tony	127.0.0.1	Y	2014-01-28 10:33:28.254+08	2014-01-28 10:33:28.254+08	\N	N	\N
362	tony	127.0.0.1	Y	2014-01-28 10:35:09.488+08	2014-01-28 10:35:09.488+08	\N	N	\N
363	admin	127.0.0.1	Y	2014-01-28 10:35:19.558+08	2014-01-28 10:35:19.558+08	\N	N	\N
364	tony	127.0.0.1	Y	2014-01-28 10:36:27.541+08	2014-01-28 10:36:27.541+08	\N	N	\N
365	admin	127.0.0.1	Y	2014-01-28 15:01:27.136+08	2014-01-28 15:01:27.136+08	\N	N	\N
366	admin	127.0.0.1	Y	2014-02-03 17:32:06.641+08	2014-02-03 17:32:06.641+08	\N	N	\N
367	admin	127.0.0.1	Y	2014-02-04 09:31:08.036+08	2014-02-04 09:31:08.036+08	\N	N	\N
368	admin	127.0.0.1	Y	2014-02-04 19:09:05.842+08	2014-02-04 19:09:05.842+08	\N	N	\N
369	admin	127.0.0.1	Y	2014-02-04 19:19:34.804+08	2014-02-04 19:19:34.804+08	\N	N	\N
370	admin	127.0.0.1	Y	2014-02-05 13:10:42.449+08	2014-02-05 13:10:42.449+08	\N	N	\N
371	danny	192.168.1.20	N	2014-02-05 15:30:14.062+08	2014-02-05 15:30:14.062+08	\N	N	\N
372	admin2	192.168.1.20	N	2014-02-05 15:30:41.206+08	2014-02-05 15:30:41.206+08	\N	N	\N
373	admin2	192.168.1.20	N	2014-02-05 15:30:53.486+08	2014-02-05 15:30:53.486+08	\N	N	\N
374	admin	192.168.1.20	Y	2014-02-05 15:30:57.535+08	2014-02-05 15:30:57.535+08	\N	N	\N
375	admin2	127.0.0.1	Y	2014-02-05 15:34:51.962+08	2014-02-05 15:34:51.962+08	\N	N	\N
376	admin	127.0.0.1	Y	2014-02-06 12:24:29.892+08	2014-02-06 12:24:29.892+08	\N	N	\N
377	admin	127.0.0.1	Y	2014-02-07 11:34:05.737+08	2014-02-07 11:34:05.737+08	\N	N	\N
378	admin2	192.168.1.20	Y	2014-02-08 11:56:37.581+08	2014-02-08 11:56:37.581+08	\N	N	\N
379	admin	127.0.0.1	Y	2014-02-10 09:28:46.529+08	2014-02-10 09:28:46.529+08	\N	N	\N
380	admin	127.0.0.1	Y	2014-02-10 21:13:56.378+08	2014-02-10 21:13:56.378+08	\N	N	\N
381	admin	127.0.0.1	Y	2014-02-11 10:45:11.124+08	2014-02-11 10:45:11.124+08	\N	N	\N
382	admin	127.0.0.1	Y	2014-02-11 10:48:39.732+08	2014-02-11 10:48:39.732+08	\N	N	\N
383	admin	127.0.0.1	Y	2014-02-11 11:02:45.539+08	2014-02-11 11:02:45.539+08	\N	N	\N
384	admin	127.0.0.1	Y	2014-02-11 11:13:51.348+08	2014-02-11 11:13:51.348+08	\N	N	\N
385	ispadmin	127.0.0.1	N	2014-02-11 11:14:50.158+08	2014-02-11 11:14:50.158+08	\N	N	\N
386	ispadmin	127.0.0.1	Y	2014-02-11 11:14:53.107+08	2014-02-11 11:14:53.107+08	\N	N	\N
387	admin	127.0.0.1	Y	2014-02-11 11:16:53.535+08	2014-02-11 11:16:53.535+08	\N	N	\N
388	admin	127.0.0.1	Y	2014-02-11 11:18:59.751+08	2014-02-11 11:18:59.751+08	\N	N	\N
389	lampard7824@gmail.com	127.0.0.1	N	2014-02-11 12:05:48.883+08	2014-02-11 12:05:48.883+08	\N	N	\N
390	lampard7824@gmail.com	127.0.0.1	Y	2014-02-11 12:06:12.218+08	2014-02-11 12:06:12.218+08	\N	N	\N
391	yyyyss@gmail.com	127.0.0.1	Y	2014-02-11 12:07:18.609+08	2014-02-11 12:07:18.609+08	\N	N	\N
392	admin	127.0.0.1	Y	2014-02-11 12:14:53.864+08	2014-02-11 12:14:53.864+08	\N	N	\N
393	ispadmin	127.0.0.1	Y	2014-02-11 12:21:11.819+08	2014-02-11 12:21:11.819+08	\N	N	\N
394	esp@phiorion.com	127.0.0.1	N	2014-02-11 12:32:12.863+08	2014-02-11 12:32:12.863+08	\N	N	\N
395	esp@phiorion.com	127.0.0.1	N	2014-02-11 12:32:22.532+08	2014-02-11 12:32:22.532+08	\N	N	\N
396	esp@phiorion.com	127.0.0.1	N	2014-02-11 12:32:28.651+08	2014-02-11 12:32:28.651+08	\N	N	\N
397	esp@phiorion.com	127.0.0.1	Y	2014-02-11 12:34:02.364+08	2014-02-11 12:34:02.364+08	\N	N	\N
398	ispadmin	127.0.0.1	N	2014-02-11 12:34:55.781+08	2014-02-11 12:34:55.781+08	\N	N	\N
399	ispadmin	127.0.0.1	Y	2014-02-11 12:34:59.276+08	2014-02-11 12:34:59.276+08	\N	N	\N
400	esp@phiorion.com	127.0.0.1	Y	2014-02-11 12:35:17.407+08	2014-02-11 12:35:17.407+08	\N	N	\N
401	admin	127.0.0.1	Y	2014-02-11 14:31:01.158+08	2014-02-11 14:31:01.158+08	\N	N	\N
402	admin	127.0.0.1	Y	2014-02-12 12:35:25.904+08	2014-02-12 12:35:25.904+08	\N	N	\N
403	ispadmin	127.0.0.1	Y	2014-02-12 12:51:42.72+08	2014-02-12 12:51:42.72+08	\N	N	\N
404	admin	127.0.0.1	Y	2014-02-12 13:50:04.748+08	2014-02-12 13:50:04.748+08	\N	N	\N
405	esp@phiorion.com	127.0.0.1	Y	2014-02-12 13:52:57.388+08	2014-02-12 13:52:57.388+08	\N	N	\N
406	ispadmin	127.0.0.1	N	2014-02-12 13:56:09.598+08	2014-02-12 13:56:09.598+08	\N	N	\N
407	ispadmin	127.0.0.1	Y	2014-02-12 13:56:13.399+08	2014-02-12 13:56:13.399+08	\N	N	\N
408	esp@phiorion.com	127.0.0.1	Y	2014-02-12 13:58:29.495+08	2014-02-12 13:58:29.495+08	\N	N	\N
409	admin	127.0.0.1	Y	2014-02-12 13:58:52.797+08	2014-02-12 13:58:52.797+08	\N	N	\N
410	esp@phiorion.com	127.0.0.1	Y	2014-02-12 14:13:50.786+08	2014-02-12 14:13:50.786+08	\N	N	\N
411	admin	127.0.0.1	Y	2014-02-12 14:13:59.1+08	2014-02-12 14:13:59.1+08	\N	N	\N
412	esp@phiorion.com	127.0.0.1	Y	2014-02-12 14:14:53.643+08	2014-02-12 14:14:53.643+08	\N	N	\N
413	ispadmin	127.0.0.1	Y	2014-02-12 14:15:09.974+08	2014-02-12 14:15:09.974+08	\N	N	\N
414	esp@phiorion.com	127.0.0.1	Y	2014-02-12 14:43:17.037+08	2014-02-12 14:43:17.037+08	\N	N	\N
415	admin	127.0.0.1	Y	2014-02-12 21:32:52.964+08	2014-02-12 21:32:52.964+08	\N	N	\N
416	ispadmin	127.0.0.1	N	2014-02-12 21:59:02.459+08	2014-02-12 21:59:02.459+08	\N	N	\N
417	ispadmin	127.0.0.1	Y	2014-02-12 21:59:06.216+08	2014-02-12 21:59:06.216+08	\N	N	\N
418	admin	127.0.0.1	Y	2014-02-12 22:14:04.024+08	2014-02-12 22:14:04.024+08	\N	N	\N
419	ispadmin	127.0.0.1	N	2014-02-13 15:42:07.117+08	2014-02-13 15:42:07.117+08	\N	N	\N
420	ispadmin	127.0.0.1	Y	2014-02-13 15:42:10.763+08	2014-02-13 15:42:10.763+08	\N	N	\N
421	admin	127.0.0.1	Y	2014-02-14 14:31:58.736+08	2014-02-14 14:31:58.736+08	\N	N	\N
422	admin	127.0.0.1	Y	2014-02-15 13:52:52.213+08	2014-02-15 13:52:52.213+08	\N	N	\N
423	admin	127.0.0.1	Y	2014-02-16 14:45:21.209+08	2014-02-16 14:45:21.209+08	\N	N	\N
424	esp@phiorion.com	127.0.0.1	Y	2014-02-16 14:52:30.109+08	2014-02-16 14:52:30.109+08	\N	N	\N
425	ispadmin	127.0.0.1	Y	2014-02-16 14:52:48.994+08	2014-02-16 14:52:48.994+08	\N	N	\N
426	esp@phiorion.com	127.0.0.1	Y	2014-02-16 14:53:52.639+08	2014-02-16 14:53:52.639+08	\N	N	\N
427	admin	127.0.0.1	Y	2014-02-16 15:06:13.216+08	2014-02-16 15:06:13.216+08	\N	N	\N
428	admin	127.0.0.1	Y	2014-02-17 14:22:14.934+08	2014-02-17 14:22:14.934+08	\N	N	\N
429	ironman@gmail.com	127.0.0.1	Y	2014-02-17 14:55:35.657+08	2014-02-17 14:55:35.657+08	\N	N	\N
430	ispadmin	127.0.0.1	Y	2014-02-17 14:55:54.499+08	2014-02-17 14:55:54.499+08	\N	N	\N
431	ironman@gmail.com	127.0.0.1	Y	2014-02-17 14:56:19.633+08	2014-02-17 14:56:19.633+08	\N	N	\N
432	admin	127.0.0.1	Y	2014-02-17 15:00:37.66+08	2014-02-17 15:00:37.66+08	\N	N	\N
433	ironman@gmail.com	127.0.0.1	Y	2014-02-17 15:31:34.877+08	2014-02-17 15:31:34.877+08	\N	N	\N
434	admin	127.0.0.1	Y	2014-02-26 09:40:46.654+08	2014-02-26 09:40:46.654+08	\N	N	\N
435	admin	127.0.0.1	Y	2014-02-27 13:48:18.995+08	2014-02-27 13:48:18.995+08	\N	N	\N
436	admin	127.0.0.1	Y	2014-02-28 09:53:56.131+08	2014-02-28 09:53:56.131+08	\N	N	\N
437	admin	127.0.0.1	Y	2014-03-01 11:16:19.357+08	2014-03-01 11:16:19.357+08	\N	N	\N
438	admin2	192.168.0.117	Y	2014-03-01 15:38:05.861+08	2014-03-01 15:38:05.861+08	\N	N	\N
439	admin	127.0.0.1	Y	2014-03-23 11:22:21.502+08	2014-03-23 11:22:21.502+08	\N	N	\N
440	admin	127.0.0.1	Y	2014-03-23 16:37:17.655+08	2014-03-23 16:37:17.655+08	\N	N	\N
441	admin	127.0.0.1	Y	2014-03-23 20:02:48.867+08	2014-03-23 20:02:48.867+08	\N	N	\N
442	admin	127.0.0.1	Y	2014-03-25 20:43:23.761+08	2014-03-25 20:43:23.761+08	\N	N	\N
443	admin	127.0.0.1	N	2014-03-26 18:54:54.858+08	2014-03-26 18:54:54.858+08	\N	N	\N
444	admin	127.0.0.1	Y	2014-03-26 18:54:58.551+08	2014-03-26 18:54:58.551+08	\N	N	\N
445	admin	127.0.0.1	Y	2014-03-28 07:42:29.948+08	2014-03-28 07:42:29.948+08	\N	N	\N
446	admin	127.0.0.1	Y	2014-03-31 17:31:16.949+08	2014-03-31 17:31:16.949+08	\N	N	\N
447	admin	127.0.0.1	Y	2014-03-31 17:41:10.627+08	2014-03-31 17:41:10.627+08	\N	N	\N
448	admin	127.0.0.1	Y	2014-03-31 17:58:35.099+08	2014-03-31 17:58:35.099+08	\N	N	\N
449	admin	127.0.0.1	Y	2014-04-02 09:14:59.471+08	2014-04-02 09:14:59.471+08	\N	N	\N
450	admin	127.0.0.1	Y	2014-04-03 10:12:34.749+08	2014-04-03 10:12:34.749+08	\N	N	\N
451	admin	127.0.0.1	Y	2014-04-03 21:43:15.846+08	2014-04-03 21:43:15.846+08	\N	N	\N
452	admin	127.0.0.1	Y	2014-04-03 21:53:55.524+08	2014-04-03 21:53:55.524+08	\N	N	\N
453	admin	127.0.0.1	Y	2014-04-10 09:37:07.046+08	2014-04-10 09:37:07.046+08	\N	N	\N
454	admin	127.0.0.1	Y	2014-04-11 09:28:09.319+08	2014-04-11 09:28:09.319+08	\N	N	\N
455	admin	127.0.0.1	Y	2014-04-12 11:06:57.422+08	2014-04-12 11:06:57.422+08	\N	N	\N
456	severus	127.0.0.1	Y	2014-04-12 11:11:10.794+08	2014-04-12 11:11:10.794+08	\N	N	\N
457	admin	127.0.0.1	Y	2014-04-12 11:11:27.138+08	2014-04-12 11:11:27.138+08	\N	N	\N
458	admin	192.168.0.105	Y	2014-04-21 22:31:32.482+08	2014-04-21 22:31:32.482+08	\N	N	\N
459	admin	127.0.0.1	Y	2014-04-23 09:53:42.491+08	2014-04-23 09:53:42.491+08	\N	N	\N
460	admin	127.0.0.1	Y	2014-04-24 11:17:13.437+08	2014-04-24 11:17:13.437+08	\N	N	\N
461	customer	127.0.0.1	Y	2014-04-24 15:46:53.098+08	2014-04-24 15:46:53.098+08	\N	N	\N
462	admin	127.0.0.1	Y	2014-04-28 09:50:49.284+08	2014-04-28 09:50:49.284+08	\N	N	\N
463	admin	127.0.0.1	Y	2014-04-28 14:44:53.291+08	2014-04-28 14:44:53.291+08	\N	N	\N
464	admin	127.0.0.1	Y	2014-04-28 14:54:50.946+08	2014-04-28 14:54:50.946+08	\N	N	\N
465	admin	127.0.0.1	Y	2014-04-29 19:21:49.298+08	2014-04-29 19:21:49.298+08	\N	N	\N
466	artist1	127.0.0.1	Y	2014-04-30 19:24:26.652+08	2014-04-30 19:24:26.652+08	\N	N	\N
467	admin	127.0.0.1	Y	2014-04-30 19:24:34.041+08	2014-04-30 19:24:34.041+08	\N	N	\N
468	artist1	127.0.0.1	Y	2014-04-30 19:24:56.742+08	2014-04-30 19:24:56.742+08	\N	N	\N
469	admin	127.0.0.1	Y	2014-04-30 19:25:06.673+08	2014-04-30 19:25:06.673+08	\N	N	\N
470	artist1	127.0.0.1	Y	2014-04-30 19:25:46.503+08	2014-04-30 19:25:46.503+08	\N	N	\N
471	admin	127.0.0.1	Y	2014-04-30 19:26:10.567+08	2014-04-30 19:26:10.567+08	\N	N	\N
472	artist1	127.0.0.1	Y	2014-04-30 19:27:03.453+08	2014-04-30 19:27:03.453+08	\N	N	\N
473	admin	127.0.0.1	Y	2014-04-30 19:27:10.942+08	2014-04-30 19:27:10.942+08	\N	N	\N
474	artist1	127.0.0.1	Y	2014-04-30 19:27:31.456+08	2014-04-30 19:27:31.456+08	\N	N	\N
475	supervisor	127.0.0.1	Y	2014-04-30 19:28:19.5+08	2014-04-30 19:28:19.5+08	\N	N	\N
476	artist1	127.0.0.1	Y	2014-04-30 19:35:31.144+08	2014-04-30 19:35:31.144+08	\N	N	\N
477	qc	127.0.0.1	Y	2014-04-30 19:36:04.812+08	2014-04-30 19:36:04.812+08	\N	N	\N
478	supervisor	127.0.0.1	Y	2014-04-30 19:36:54.913+08	2014-04-30 19:36:54.913+08	\N	N	\N
479	admin	127.0.0.1	Y	2014-04-30 19:37:48.292+08	2014-04-30 19:37:48.292+08	\N	N	\N
480	artist1	127.0.0.1	Y	2014-05-01 14:26:25.788+08	2014-05-01 14:26:25.788+08	\N	N	\N
481	admin	127.0.0.1	Y	2014-05-01 14:27:23.184+08	2014-05-01 14:27:23.184+08	\N	N	\N
482	admin	127.0.0.1	Y	2014-05-01 16:28:41.12+08	2014-05-01 16:28:41.12+08	\N	N	\N
483	admin2	127.0.0.1	Y	2014-05-01 17:54:44.547+08	2014-05-01 17:54:44.547+08	\N	N	\N
484	customer	127.0.0.1	Y	2014-05-09 09:56:20.449+08	2014-05-09 09:56:20.449+08	\N	N	\N
485	admin	192.168.1.2	Y	2014-05-09 22:00:37.02+08	2014-05-09 22:00:37.02+08	\N	N	\N
486	admin	192.168.1.2	Y	2014-05-09 23:47:50.532+08	2014-05-09 23:47:50.532+08	\N	N	\N
487	admin	192.168.1.2	Y	2014-05-09 23:49:09.856+08	2014-05-09 23:49:09.856+08	\N	N	\N
488	admin	127.0.0.1	Y	2014-05-10 16:28:50.901+08	2014-05-10 16:28:50.901+08	\N	N	\N
489	admin	127.0.0.1	Y	2014-05-10 21:24:30.195+08	2014-05-10 21:24:30.195+08	\N	N	\N
490	admin	127.0.0.1	Y	2014-05-10 21:26:50.955+08	2014-05-10 21:26:50.955+08	\N	N	\N
491	admin	192.168.0.106	Y	2014-05-11 14:51:36.435+08	2014-05-11 14:51:36.435+08	\N	N	\N
492	admin	::1	Y	2014-05-13 01:11:01.772+08	2014-05-13 01:11:01.772+08	\N	N	\N
493	admin	192.168.0.106	Y	2014-05-13 01:11:40.044+08	2014-05-13 01:11:40.044+08	\N	N	\N
494	admin	192.168.0.106	N	2014-05-13 12:00:53.723+08	2014-05-13 12:00:53.723+08	\N	N	\N
495	admin	192.168.0.106	Y	2014-05-13 12:01:04.548+08	2014-05-13 12:01:04.548+08	\N	N	\N
496	admin	::1	Y	2014-05-13 15:15:04.337+08	2014-05-13 15:15:04.337+08	\N	N	\N
497	admin	192.168.0.106	Y	2014-05-14 23:46:58.04+08	2014-05-14 23:46:58.04+08	\N	N	\N
498	admin	::1	Y	2014-05-16 10:39:56.608+08	2014-05-16 10:39:56.608+08	\N	N	\N
499	admin	::1	Y	2014-05-17 10:05:16.692+08	2014-05-17 10:05:16.692+08	\N	N	\N
500	admin	192.168.0.106	Y	2014-05-18 18:13:28.994+08	2014-05-18 18:13:28.994+08	\N	N	\N
501	admin	192.168.0.106	Y	2014-05-18 18:56:16.496+08	2014-05-18 18:56:16.496+08	\N	N	\N
502	admin	192.168.0.106	Y	2014-05-18 19:00:31.127+08	2014-05-18 19:00:31.127+08	\N	N	\N
503	admin	::1	Y	2014-05-19 11:45:13.35+08	2014-05-19 11:45:13.35+08	\N	N	\N
504	admin	192.168.0.106	Y	2014-05-20 00:24:25.105+08	2014-05-20 00:24:25.105+08	\N	N	\N
505	admin	::1	Y	2014-05-24 10:51:17.118+08	2014-05-24 10:51:17.118+08	\N	N	\N
506	admin	::1	Y	2014-05-24 13:33:52.031+08	2014-05-24 13:33:52.031+08	\N	N	\N
507	admin	::1	Y	2014-05-27 15:52:50.703+08	2014-05-27 15:52:50.703+08	\N	N	\N
508	admin	192.168.0.106	Y	2014-05-29 23:22:51.732+08	2014-05-29 23:22:51.732+08	\N	N	\N
509	admin	::1	Y	2014-06-01 13:19:33.769+08	2014-06-01 13:19:33.769+08	\N	N	\N
510	admin	127.0.0.1	Y	2014-06-03 10:53:40.408+08	2014-06-03 10:53:40.408+08	\N	N	\N
511	admin	127.0.0.1	Y	2014-06-03 12:40:53.247+08	2014-06-03 12:40:53.247+08	\N	N	\N
512	admin	127.0.0.1	Y	2014-06-06 12:18:06.178+08	2014-06-06 12:18:06.178+08	\N	N	\N
513	admin	127.0.0.1	Y	2014-06-07 17:11:12.735+08	2014-06-07 17:11:12.735+08	\N	N	\N
514	admin	127.0.0.1	Y	2014-06-10 15:41:10.638+08	2014-06-10 15:41:10.638+08	\N	N	\N
515	admin	127.0.0.1	Y	2014-06-10 16:37:07.829+08	2014-06-10 16:37:07.829+08	\N	N	\N
516	admin	127.0.0.1	Y	2014-06-11 20:45:23.434+08	2014-06-11 20:45:23.434+08	\N	N	\N
517	admin	127.0.0.1	Y	2014-06-12 20:56:27.182+08	2014-06-12 20:56:27.182+08	\N	N	\N
518	admin	127.0.0.1	Y	2014-06-13 11:59:26.789+08	2014-06-13 11:59:26.789+08	\N	N	\N
519	admin	127.0.0.1	Y	2014-06-13 22:36:55.495+08	2014-06-13 22:36:55.495+08	\N	N	\N
520	admin	127.0.0.1	Y	2014-06-15 01:21:00.515+08	2014-06-15 01:21:00.515+08	\N	N	\N
521	admin	127.0.0.1	Y	2014-06-17 15:23:24.99+08	2014-06-17 15:23:24.99+08	\N	N	\N
522	artist1	127.0.0.1	Y	2014-06-19 22:49:35.881+08	2014-06-19 22:49:35.881+08	\N	N	\N
523	admin	127.0.0.1	Y	2014-06-19 22:49:59.177+08	2014-06-19 22:49:59.177+08	\N	N	\N
524	admin	192.168.0.128	Y	2014-06-20 15:39:53.869+08	2014-06-20 15:39:53.869+08	\N	N	\N
525	admin	127.0.0.1	Y	2014-06-20 16:54:54.21+08	2014-06-20 16:54:54.21+08	\N	N	\N
526	admin2	192.168.0.128	N	2014-06-20 17:14:34.08+08	2014-06-20 17:14:34.08+08	\N	N	\N
527	admin2	192.168.0.128	Y	2014-06-20 17:14:40.386+08	2014-06-20 17:14:40.386+08	\N	N	\N
528	admin	192.168.0.128	Y	2014-06-20 19:07:29.732+08	2014-06-20 19:07:29.732+08	\N	N	\N
529	admin	127.0.0.1	Y	2014-06-20 19:09:03.369+08	2014-06-20 19:09:03.369+08	\N	N	\N
530	supervisor	192.168.0.128	Y	2014-06-20 19:09:25.684+08	2014-06-20 19:09:25.684+08	\N	N	\N
531	admin	127.0.0.1	Y	2014-06-21 12:52:39.792+08	2014-06-21 12:52:39.792+08	\N	N	\N
532	admin	127.0.0.1	Y	2014-06-21 12:55:29.019+08	2014-06-21 12:55:29.019+08	\N	N	\N
533	admin	127.0.0.1	Y	2014-06-21 13:28:21.799+08	2014-06-21 13:28:21.799+08	\N	N	\N
534	admin2	192.168.0.128	N	2014-06-21 13:31:42.113+08	2014-06-21 13:31:42.113+08	\N	N	\N
535	admin2	192.168.0.128	Y	2014-06-21 13:31:46.38+08	2014-06-21 13:31:46.38+08	\N	N	\N
536	admin	192.168.220.1	Y	2014-06-21 17:21:02.601+08	2014-06-21 17:21:02.601+08	\N	N	\N
537	admin	192.168.220.50	Y	2014-06-21 17:26:22.019+08	2014-06-21 17:26:22.019+08	\N	N	\N
538	admin2	192.168.220.1	Y	2014-06-21 17:26:35.905+08	2014-06-21 17:26:35.905+08	\N	N	\N
539	uat_cust1	192.168.220.50	Y	2014-06-21 17:38:43.773+08	2014-06-21 17:38:43.773+08	\N	N	\N
540	supervisor	192.168.220.1	Y	2014-06-21 18:10:07.278+08	2014-06-21 18:10:07.278+08	\N	N	\N
541	supervisor	192.168.220.1	N	2014-06-21 18:10:40.339+08	2014-06-21 18:10:40.339+08	\N	N	\N
542	supervisor	192.168.220.1	Y	2014-06-21 18:10:44.684+08	2014-06-21 18:10:44.684+08	\N	N	\N
543	artist1	::1	Y	2014-06-21 18:10:59.767+08	2014-06-21 18:10:59.767+08	\N	N	\N
544	admin2	192.168.0.148	Y	2014-06-21 18:16:01.645+08	2014-06-21 18:16:01.645+08	\N	N	\N
545	admin	192.168.220.1	Y	2014-06-21 18:24:54.722+08	2014-06-21 18:24:54.722+08	\N	N	\N
546	ysyow	192.168.220.1	N	2014-06-21 18:26:20.309+08	2014-06-21 18:26:20.309+08	\N	N	\N
547	ysyow	192.168.220.1	Y	2014-06-21 18:26:24.692+08	2014-06-21 18:26:24.692+08	\N	N	\N
548	esp	192.168.220.51	Y	2014-06-21 18:26:28.016+08	2014-06-21 18:26:28.016+08	\N	N	\N
549	ysyow	192.168.220.1	Y	2014-06-21 18:44:16.411+08	2014-06-21 18:44:16.411+08	\N	N	\N
550	qc	::1	Y	2014-06-21 18:54:44.43+08	2014-06-21 18:54:44.43+08	\N	N	\N
551	admin	::1	Y	2014-06-21 18:59:46.986+08	2014-06-21 18:59:46.986+08	\N	N	\N
552	uat_supervisor1	192.168.220.50	Y	2014-06-21 18:59:51.768+08	2014-06-21 18:59:51.768+08	\N	N	\N
553	admin2	::1	Y	2014-06-21 19:04:21.409+08	2014-06-21 19:04:21.409+08	\N	N	\N
554	fongadmin	192.168.0.148	Y	2014-06-21 19:07:03.035+08	2014-06-21 19:07:03.035+08	\N	N	\N
555	admin	192.168.220.50	Y	2014-06-21 19:08:32.532+08	2014-06-21 19:08:32.532+08	\N	N	\N
556	fongcustomer	192.168.0.148	Y	2014-06-21 19:10:06.051+08	2014-06-21 19:10:06.051+08	\N	N	\N
557	uat_customer1	192.168.220.50	N	2014-06-21 19:13:57.433+08	2014-06-21 19:13:57.433+08	\N	N	\N
558	uat_cust1	192.168.220.50	Y	2014-06-21 19:14:13.413+08	2014-06-21 19:14:13.413+08	\N	N	\N
559	uat_supervisor1	192.168.220.50	Y	2014-06-21 19:18:21.427+08	2014-06-21 19:18:21.427+08	\N	N	\N
560	uat_customer1	192.168.220.50	N	2014-06-21 20:36:24.956+08	2014-06-21 20:36:24.956+08	\N	N	\N
561	uat_cust1	192.168.220.50	Y	2014-06-21 20:36:34.993+08	2014-06-21 20:36:34.993+08	\N	N	\N
562	uat_supervisor1	192.168.220.50	Y	2014-06-21 21:05:48.915+08	2014-06-21 21:05:48.915+08	\N	N	\N
563	uat_cust1	192.168.220.50	Y	2014-06-21 21:07:08.904+08	2014-06-21 21:07:08.904+08	\N	N	\N
564	uat_supervisor1	192.168.220.50	Y	2014-06-21 21:15:49.895+08	2014-06-21 21:15:49.895+08	\N	N	\N
565	admin	192.168.220.51	Y	2014-06-21 21:17:39.929+08	2014-06-21 21:17:39.929+08	\N	N	\N
566	esp	192.168.220.51	Y	2014-06-21 21:17:47.498+08	2014-06-21 21:17:47.498+08	\N	N	\N
567	uat_supervisor1	192.168.220.51	Y	2014-06-21 21:17:59.376+08	2014-06-21 21:17:59.376+08	\N	N	\N
568	admin	192.168.220.51	Y	2014-06-21 21:18:54.566+08	2014-06-21 21:18:54.566+08	\N	N	\N
569	uat_supervisor1	192.168.220.50	Y	2014-06-21 21:26:32.195+08	2014-06-21 21:26:32.195+08	\N	N	\N
570	esp	192.168.220.51	Y	2014-06-21 21:27:08.347+08	2014-06-21 21:27:08.347+08	\N	N	\N
571	esp_supervisor	192.168.220.51	Y	2014-06-21 21:28:13.917+08	2014-06-21 21:28:13.917+08	\N	N	\N
572	uat_artist1	192.168.220.50	Y	2014-06-21 21:31:22.868+08	2014-06-21 21:31:22.868+08	\N	N	\N
573	fongsupervisor	192.168.0.148	Y	2014-06-21 21:41:25.349+08	2014-06-21 21:41:25.349+08	\N	N	\N
574	fongsupervisor	192.168.0.148	Y	2014-06-21 21:44:09.982+08	2014-06-21 21:44:09.982+08	\N	N	\N
575	uat_supervisor1	192.168.220.50	Y	2014-06-21 21:48:57.105+08	2014-06-21 21:48:57.105+08	\N	N	\N
576	admin	192.168.220.50	Y	2014-06-21 21:49:28.696+08	2014-06-21 21:49:28.696+08	\N	N	\N
577	uat_qc	192.168.220.50	N	2014-06-21 21:50:32+08	2014-06-21 21:50:32+08	\N	N	\N
578	uat_qc1	192.168.220.50	Y	2014-06-21 21:50:46.171+08	2014-06-21 21:50:46.171+08	\N	N	\N
579	uat_supervisor1	192.168.220.50	Y	2014-06-21 21:52:00.531+08	2014-06-21 21:52:00.531+08	\N	N	\N
580	fongsupervisor	192.168.0.148	Y	2014-06-21 21:52:33.384+08	2014-06-21 21:52:33.384+08	\N	N	\N
581	uat_cust1	192.168.220.50	Y	2014-06-21 21:54:19.609+08	2014-06-21 21:54:19.609+08	\N	N	\N
582	uat_supervisor1	192.168.220.50	Y	2014-06-21 21:58:00.992+08	2014-06-21 21:58:00.992+08	\N	N	\N
583	esp_supervisor	192.168.220.51	Y	2014-06-21 22:03:16.241+08	2014-06-21 22:03:16.241+08	\N	N	\N
584	uat_artist1	192.168.220.50	Y	2014-06-21 22:05:50.344+08	2014-06-21 22:05:50.344+08	\N	N	\N
585	esp_supervisor	192.168.220.51	Y	2014-06-21 22:15:48.493+08	2014-06-21 22:15:48.493+08	\N	N	\N
586	admin	192.168.220.50	Y	2014-06-21 22:18:32.299+08	2014-06-21 22:18:32.299+08	\N	N	\N
587	esp_supervisor	192.168.220.51	N	2014-06-21 22:21:37.523+08	2014-06-21 22:21:37.523+08	\N	N	\N
588	uat_cust1	192.168.220.50	Y	2014-06-21 22:22:04.605+08	2014-06-21 22:22:04.605+08	\N	N	\N
589	uat_supervisor1	192.168.220.50	Y	2014-06-21 22:24:05.377+08	2014-06-21 22:24:05.377+08	\N	N	\N
590	uat_artist1	192.168.220.50	Y	2014-06-21 22:25:48.018+08	2014-06-21 22:25:48.018+08	\N	N	\N
591	uat_supervisor1	192.168.220.50	Y	2014-06-21 22:27:30.026+08	2014-06-21 22:27:30.026+08	\N	N	\N
592	uat_artist1	192.168.220.50	Y	2014-06-21 22:28:18.492+08	2014-06-21 22:28:18.492+08	\N	N	\N
593	uat_supervisor1	192.168.220.50	Y	2014-06-21 22:30:40.145+08	2014-06-21 22:30:40.145+08	\N	N	\N
594	uat_supervisor1	192.168.220.50	Y	2014-06-21 22:39:13.931+08	2014-06-21 22:39:13.931+08	\N	N	\N
595	fongadmin	192.168.0.148	N	2014-06-21 22:39:52.95+08	2014-06-21 22:39:52.95+08	\N	N	\N
596	fongadmin	192.168.0.148	N	2014-06-21 22:39:59.152+08	2014-06-21 22:39:59.152+08	\N	N	\N
597	esp_supervisor	192.168.0.148	Y	2014-06-21 22:40:40.993+08	2014-06-21 22:40:40.993+08	\N	N	\N
598	uat_artist1	192.168.220.50	Y	2014-06-21 22:42:19.319+08	2014-06-21 22:42:19.319+08	\N	N	\N
599	uat_qc1	192.168.220.50	Y	2014-06-21 22:54:26.388+08	2014-06-21 22:54:26.388+08	\N	N	\N
600	esp_supervisor	192.168.220.51	Y	2014-06-21 22:55:08.47+08	2014-06-21 22:55:08.47+08	\N	N	\N
601	admin	192.168.220.50	Y	2014-06-21 22:57:09.156+08	2014-06-21 22:57:09.156+08	\N	N	\N
602	uat_qc1	192.168.220.50	Y	2014-06-21 22:57:50.318+08	2014-06-21 22:57:50.318+08	\N	N	\N
603	esp_supervisor	192.168.220.51	Y	2014-06-21 23:05:39.128+08	2014-06-21 23:05:39.128+08	\N	N	\N
604	esp	192.168.220.51	Y	2014-06-21 23:10:38.805+08	2014-06-21 23:10:38.805+08	\N	N	\N
605	esp_artist	192.168.220.51	Y	2014-06-21 23:17:46.3+08	2014-06-21 23:17:46.3+08	\N	N	\N
606	esp_artist1	192.168.220.51	N	2014-06-21 23:20:54.621+08	2014-06-21 23:20:54.621+08	\N	N	\N
607	esp_artist	192.168.220.51	Y	2014-06-21 23:20:59.985+08	2014-06-21 23:20:59.985+08	\N	N	\N
608	uat_artist1	192.168.220.51	Y	2014-06-21 23:21:35.596+08	2014-06-21 23:21:35.596+08	\N	N	\N
609	uat_artist1	192.168.220.51	Y	2014-06-21 23:21:57.789+08	2014-06-21 23:21:57.789+08	\N	N	\N
610	esp	192.168.220.51	Y	2014-06-21 23:23:28.32+08	2014-06-21 23:23:28.32+08	\N	N	\N
611	fongadmin	192.168.0.148	N	2014-06-21 23:23:35.793+08	2014-06-21 23:23:35.793+08	\N	N	\N
612	fongadmin	192.168.0.148	Y	2014-06-21 23:24:18.644+08	2014-06-21 23:24:18.644+08	\N	N	\N
613	esp	192.168.220.51	Y	2014-06-21 23:25:01.178+08	2014-06-21 23:25:01.178+08	\N	N	\N
614	uat_artist1	192.168.220.50	Y	2014-06-21 23:32:32.581+08	2014-06-21 23:32:32.581+08	\N	N	\N
615	ysyow	192.168.220.1	Y	2014-06-21 23:37:58.457+08	2014-06-21 23:37:58.457+08	\N	N	\N
616	uat_cust1	192.168.220.1	N	2014-06-21 23:39:12.709+08	2014-06-21 23:39:12.709+08	\N	N	\N
617	uat_cust1	192.168.220.1	Y	2014-06-21 23:39:19.204+08	2014-06-21 23:39:19.204+08	\N	N	\N
618	uat_cust1	192.168.220.1	Y	2014-06-21 23:39:22.161+08	2014-06-21 23:39:22.161+08	\N	N	\N
619	uat_cust1	192.168.220.1	Y	2014-06-21 23:41:02.812+08	2014-06-21 23:41:02.812+08	\N	N	\N
620	uat_cust1	192.168.220.1	Y	2014-06-21 23:41:04.801+08	2014-06-21 23:41:04.801+08	\N	N	\N
621	uat_cust1	192.168.220.1	Y	2014-06-21 23:41:33.921+08	2014-06-21 23:41:33.921+08	\N	N	\N
622	uat_cust1	192.168.220.1	Y	2014-06-21 23:41:35.523+08	2014-06-21 23:41:35.523+08	\N	N	\N
623	uat_cust1	192.168.220.1	Y	2014-06-21 23:41:37.185+08	2014-06-21 23:41:37.185+08	\N	N	\N
624	uat_cust1	192.168.220.1	Y	2014-06-21 23:41:38.368+08	2014-06-21 23:41:38.368+08	\N	N	\N
625	uat_cust1	192.168.220.1	Y	2014-06-21 23:41:39.379+08	2014-06-21 23:41:39.379+08	\N	N	\N
626	uat_cust1	192.168.220.1	Y	2014-06-21 23:41:40.329+08	2014-06-21 23:41:40.329+08	\N	N	\N
627	uat_cust1	192.168.220.1	Y	2014-06-21 23:41:41.396+08	2014-06-21 23:41:41.396+08	\N	N	\N
628	uat_cust1	192.168.220.1	Y	2014-06-21 23:41:42.435+08	2014-06-21 23:41:42.435+08	\N	N	\N
629	uat_cust1	192.168.220.1	Y	2014-06-21 23:41:43.355+08	2014-06-21 23:41:43.355+08	\N	N	\N
630	uat_cust1	192.168.220.1	Y	2014-06-21 23:41:44.246+08	2014-06-21 23:41:44.246+08	\N	N	\N
631	uat_cust1	192.168.220.1	Y	2014-06-21 23:41:45.308+08	2014-06-21 23:41:45.308+08	\N	N	\N
632	uat_cust1	192.168.220.1	Y	2014-06-21 23:41:46.262+08	2014-06-21 23:41:46.262+08	\N	N	\N
633	uat_cust1	192.168.220.1	Y	2014-06-21 23:41:47.137+08	2014-06-21 23:41:47.137+08	\N	N	\N
634	uat_cust1	192.168.220.1	Y	2014-06-21 23:45:42.722+08	2014-06-21 23:45:42.722+08	\N	N	\N
635	uat_cust1	192.168.220.1	Y	2014-06-21 23:46:00.566+08	2014-06-21 23:46:00.566+08	\N	N	\N
636	uat_cust1	192.168.220.1	Y	2014-06-21 23:46:04.128+08	2014-06-21 23:46:04.128+08	\N	N	\N
637	uat_qc1	192.168.220.50	Y	2014-06-21 23:46:42.655+08	2014-06-21 23:46:42.655+08	\N	N	\N
638	uat_cust1	192.168.220.1	Y	2014-06-21 23:47:32.845+08	2014-06-21 23:47:32.845+08	\N	N	\N
639	uat_cust1	192.168.220.1	Y	2014-06-21 23:47:34.909+08	2014-06-21 23:47:34.909+08	\N	N	\N
640	uat_cust1	192.168.220.1	Y	2014-06-21 23:47:36.169+08	2014-06-21 23:47:36.169+08	\N	N	\N
641	uat_cust1	192.168.220.1	Y	2014-06-21 23:47:37.408+08	2014-06-21 23:47:37.408+08	\N	N	\N
642	uat_cust1	192.168.220.1	Y	2014-06-21 23:48:04.05+08	2014-06-21 23:48:04.05+08	\N	N	\N
643	uat_cust1	192.168.220.1	Y	2014-06-21 23:48:05.876+08	2014-06-21 23:48:05.876+08	\N	N	\N
644	uat_cust1	192.168.220.1	Y	2014-06-21 23:48:07.201+08	2014-06-21 23:48:07.201+08	\N	N	\N
645	uat_cust1	192.168.220.1	Y	2014-06-21 23:48:16.773+08	2014-06-21 23:48:16.773+08	\N	N	\N
646	uat_cust1	192.168.220.1	N	2014-06-21 23:49:27.808+08	2014-06-21 23:49:27.808+08	\N	N	\N
647	uat_cust1	192.168.220.1	Y	2014-06-21 23:49:35.063+08	2014-06-21 23:49:35.063+08	\N	N	\N
648	uat_cust1	192.168.220.1	Y	2014-06-21 23:50:04.073+08	2014-06-21 23:50:04.073+08	\N	N	\N
649	uat_cust1	192.168.220.1	Y	2014-06-21 23:50:53.989+08	2014-06-21 23:50:53.989+08	\N	N	\N
650	uat_artist	192.168.220.51	N	2014-06-22 00:04:14.563+08	2014-06-22 00:04:14.563+08	\N	N	\N
651	uat_artist1	192.168.220.51	Y	2014-06-22 00:04:43.264+08	2014-06-22 00:04:43.264+08	\N	N	\N
652	uat_supervisor	192.168.220.51	N	2014-06-22 00:05:29.862+08	2014-06-22 00:05:29.862+08	\N	N	\N
653	uat_supervisor1	192.168.220.51	Y	2014-06-22 00:05:42.534+08	2014-06-22 00:05:42.534+08	\N	N	\N
654	uat_artist1	192.168.220.51	Y	2014-06-22 00:07:50.019+08	2014-06-22 00:07:50.019+08	\N	N	\N
655	uat_cust1	192.168.220.50	Y	2014-06-22 00:11:36.568+08	2014-06-22 00:11:36.568+08	\N	N	\N
656	uat_customer1	192.168.220.50	N	2014-06-22 00:11:46.015+08	2014-06-22 00:11:46.015+08	\N	N	\N
657	fongadmin	192.168.0.148	Y	2014-06-22 00:30:22.819+08	2014-06-22 00:30:22.819+08	\N	N	\N
658	uat_supervisor1	192.168.220.50	Y	2014-06-22 00:34:35.011+08	2014-06-22 00:34:35.011+08	\N	N	\N
659	ysyow	192.168.220.1	Y	2014-06-22 13:24:36.172+08	2014-06-22 13:24:36.172+08	\N	N	\N
660	ysyow	192.168.220.1	Y	2014-06-22 13:27:07.936+08	2014-06-22 13:27:07.936+08	\N	N	\N
661	uat_cust1	192.168.220.1	Y	2014-06-22 13:28:22.87+08	2014-06-22 13:28:22.87+08	\N	N	\N
662	admin	192.168.220.50	Y	2014-06-22 13:32:21.224+08	2014-06-22 13:32:21.224+08	\N	N	\N
663	uat_supervisor1	192.168.220.50	Y	2014-06-22 13:33:35.336+08	2014-06-22 13:33:35.336+08	\N	N	\N
664	uat_artist1	192.168.220.50	Y	2014-06-22 13:34:22.73+08	2014-06-22 13:34:22.73+08	\N	N	\N
665	admin	::1	Y	2014-06-22 13:38:59.673+08	2014-06-22 13:38:59.673+08	\N	N	\N
666	uat_supervisor	192.168.220.50	N	2014-06-22 13:40:18.35+08	2014-06-22 13:40:18.35+08	\N	N	\N
667	uat_supervisor1	192.168.220.50	Y	2014-06-22 13:40:23.608+08	2014-06-22 13:40:23.608+08	\N	N	\N
668	uat_artist1	192.168.220.50	Y	2014-06-22 13:41:35.489+08	2014-06-22 13:41:35.489+08	\N	N	\N
669	uat_supervisor1	192.168.220.50	Y	2014-06-22 13:41:58.294+08	2014-06-22 13:41:58.294+08	\N	N	\N
670	uat_supervisor1	192.168.220.50	Y	2014-06-22 13:58:00.778+08	2014-06-22 13:58:00.778+08	\N	N	\N
671	uat_artist1	192.168.220.50	Y	2014-06-22 14:03:05.363+08	2014-06-22 14:03:05.363+08	\N	N	\N
672	uat_cust1	192.168.220.1	Y	2014-06-22 14:17:38.369+08	2014-06-22 14:17:38.369+08	\N	N	\N
673	uat_cust1	192.168.220.1	Y	2014-06-22 14:18:50.861+08	2014-06-22 14:18:50.861+08	\N	N	\N
674	uat_cust1	192.168.220.1	Y	2014-06-22 14:21:46.565+08	2014-06-22 14:21:46.565+08	\N	N	\N
675	uat_cust1	192.168.220.1	Y	2014-06-22 14:21:54.562+08	2014-06-22 14:21:54.562+08	\N	N	\N
676	uat_cust1	192.168.220.1	N	2014-06-22 14:22:06.087+08	2014-06-22 14:22:06.087+08	\N	N	\N
677	uat_cust1	192.168.220.1	Y	2014-06-22 14:22:10.911+08	2014-06-22 14:22:10.911+08	\N	N	\N
678	uat_cust1	192.168.220.1	Y	2014-06-22 14:23:11.814+08	2014-06-22 14:23:11.814+08	\N	N	\N
679	admin	192.168.220.1	Y	2014-06-22 14:23:18.561+08	2014-06-22 14:23:18.561+08	\N	N	\N
680	uat_supervisor1	192.168.220.50	Y	2014-06-22 14:23:34.511+08	2014-06-22 14:23:34.511+08	\N	N	\N
681	uat_cust1	::1	Y	2014-06-22 14:24:04.331+08	2014-06-22 14:24:04.331+08	\N	N	\N
682	uat_cust1	::1	Y	2014-06-22 14:24:15.343+08	2014-06-22 14:24:15.343+08	\N	N	\N
683	uat_cust1	::1	Y	2014-06-22 14:24:28.294+08	2014-06-22 14:24:28.294+08	\N	N	\N
684	ysyow	::1	Y	2014-06-22 15:22:57.069+08	2014-06-22 15:22:57.069+08	\N	N	\N
685	uat_customer1	192.168.0.124	N	2014-06-22 15:52:19.249+08	2014-06-22 15:52:19.249+08	\N	N	\N
686	uat_customer1	192.168.0.124	Y	2014-06-22 15:52:27.703+08	2014-06-22 15:52:27.703+08	\N	N	\N
687	uat_customer1	192.168.0.124	Y	2014-06-22 15:53:52.39+08	2014-06-22 15:53:52.39+08	\N	N	\N
688	ysyow	192.168.220.1	Y	2014-06-22 15:53:53.779+08	2014-06-22 15:53:53.779+08	\N	N	\N
689	supervisor	192.168.220.1	Y	2014-06-22 15:54:05.906+08	2014-06-22 15:54:05.906+08	\N	N	\N
690	ysyow	::1	Y	2014-06-22 15:55:07.871+08	2014-06-22 15:55:07.871+08	\N	N	\N
691	artist2	::1	Y	2014-06-22 16:04:55.146+08	2014-06-22 16:04:55.146+08	\N	N	\N
692	abc	192.168.0.148	N	2014-06-22 16:06:10.975+08	2014-06-22 16:06:10.975+08	\N	N	\N
693	ysyow	192.168.0.152	Y	2014-06-22 16:07:27.761+08	2014-06-22 16:07:27.761+08	\N	N	\N
694	abc	192.168.0.148	N	2014-06-22 16:08:18.496+08	2014-06-22 16:08:18.496+08	\N	N	\N
695	abc	192.168.0.148	N	2014-06-22 16:09:25.158+08	2014-06-22 16:09:25.158+08	\N	N	\N
696	qc	::1	Y	2014-06-22 16:09:57.203+08	2014-06-22 16:09:57.203+08	\N	N	\N
697	abc	192.168.0.148	N	2014-06-22 16:11:48.404+08	2014-06-22 16:11:48.404+08	\N	N	\N
698	abc	192.168.0.148	N	2014-06-22 16:12:10.054+08	2014-06-22 16:12:10.054+08	\N	N	\N
699	abc	192.168.0.148	N	2014-06-22 16:12:20.926+08	2014-06-22 16:12:20.926+08	\N	N	\N
700	admin	192.168.0.148	Y	2014-06-22 16:12:31.483+08	2014-06-22 16:12:31.483+08	\N	N	\N
701	esp	192.168.0.124	Y	2014-06-22 16:12:46.934+08	2014-06-22 16:12:46.934+08	\N	N	\N
702	admin	192.168.0.148	Y	2014-06-22 16:12:54.308+08	2014-06-22 16:12:54.308+08	\N	N	\N
703	artist2	::1	Y	2014-06-22 16:13:38.002+08	2014-06-22 16:13:38.002+08	\N	N	\N
704	qc	::1	Y	2014-06-22 16:14:18.431+08	2014-06-22 16:14:18.431+08	\N	N	\N
705	admin	192.168.0.148	Y	2014-06-22 16:23:58.886+08	2014-06-22 16:23:58.886+08	\N	N	\N
706	esp	192.168.220.50	Y	2014-06-22 16:24:35.898+08	2014-06-22 16:24:35.898+08	\N	N	\N
707	fongadmin	192.168.0.148	Y	2014-06-22 16:25:11.016+08	2014-06-22 16:25:11.016+08	\N	N	\N
708	fongadmin	192.168.0.148	N	2014-06-22 16:25:20.221+08	2014-06-22 16:25:20.221+08	\N	N	\N
709	fongadmin	192.168.0.148	Y	2014-06-22 16:25:28.176+08	2014-06-22 16:25:28.176+08	\N	N	\N
710	fongadmin	192.168.0.148	N	2014-06-22 16:28:22.479+08	2014-06-22 16:28:22.479+08	\N	N	\N
711	fongadmin	192.168.0.148	Y	2014-06-22 16:28:28.912+08	2014-06-22 16:28:28.912+08	\N	N	\N
712	fongadmin	192.168.0.148	Y	2014-06-22 16:31:21.309+08	2014-06-22 16:31:21.309+08	\N	N	\N
713	fongadmin	192.168.0.148	Y	2014-06-22 16:37:33.892+08	2014-06-22 16:37:33.892+08	\N	N	\N
714	fongadmin	192.168.0.148	Y	2014-06-22 16:37:42.148+08	2014-06-22 16:37:42.148+08	\N	N	\N
715	supervisor	192.168.0.152	Y	2014-06-22 16:39:43.017+08	2014-06-22 16:39:43.017+08	\N	N	\N
716	supervisor	192.168.0.152	Y	2014-06-22 16:39:49.025+08	2014-06-22 16:39:49.025+08	\N	N	\N
717	esp	192.168.0.124	Y	2014-06-22 16:42:43.018+08	2014-06-22 16:42:43.018+08	\N	N	\N
718	esp	192.168.0.124	Y	2014-06-22 16:42:48.479+08	2014-06-22 16:42:48.479+08	\N	N	\N
719	fongadmin	192.168.0.148	N	2014-06-22 16:45:02.01+08	2014-06-22 16:45:02.01+08	\N	N	\N
720	fongadmin	192.168.0.148	Y	2014-06-22 16:45:06.67+08	2014-06-22 16:45:06.67+08	\N	N	\N
721	fongadmin	192.168.0.148	Y	2014-06-22 16:45:43.709+08	2014-06-22 16:45:43.709+08	\N	N	\N
722	uat_cust1	192.168.0.152	Y	2014-06-22 17:06:05.277+08	2014-06-22 17:06:05.277+08	\N	N	\N
723	ysyow	192.168.0.152	Y	2014-06-22 17:06:08.629+08	2014-06-22 17:06:08.629+08	\N	N	\N
724	uat_supervisor	192.168.0.124	N	2014-06-22 17:12:36.934+08	2014-06-22 17:12:36.934+08	\N	N	\N
725	ab	192.168.0.148	N	2014-06-22 17:15:33.232+08	2014-06-22 17:15:33.232+08	\N	N	\N
726	ab	192.168.0.148	N	2014-06-22 17:15:48.113+08	2014-06-22 17:15:48.113+08	\N	N	\N
727	ab	192.168.0.148	N	2014-06-22 17:16:13.87+08	2014-06-22 17:16:13.87+08	\N	N	\N
728	ab	192.168.0.148	N	2014-06-22 17:16:24.097+08	2014-06-22 17:16:24.097+08	\N	N	\N
729	ab	192.168.0.148	N	2014-06-22 17:16:34.973+08	2014-06-22 17:16:34.973+08	\N	N	\N
730	ab	192.168.0.148	N	2014-06-22 17:16:47.222+08	2014-06-22 17:16:47.222+08	\N	N	\N
731	uat_supervisor1	192.168.0.124	Y	2014-06-22 17:16:53.815+08	2014-06-22 17:16:53.815+08	\N	N	\N
732	ab	192.168.0.148	N	2014-06-22 17:16:54.579+08	2014-06-22 17:16:54.579+08	\N	N	\N
733	ab	192.168.0.148	N	2014-06-22 17:17:02.512+08	2014-06-22 17:17:02.512+08	\N	N	\N
734	uat_supervisor1	192.168.0.124	Y	2014-06-22 17:17:05.521+08	2014-06-22 17:17:05.521+08	\N	N	\N
735	ab	192.168.0.148	N	2014-06-22 17:17:18.236+08	2014-06-22 17:17:18.236+08	\N	N	\N
736	ab	192.168.0.148	N	2014-06-22 17:18:20.766+08	2014-06-22 17:18:20.766+08	\N	N	\N
737	uat_customer1	192.168.0.124	Y	2014-06-22 17:21:21.198+08	2014-06-22 17:21:21.198+08	\N	N	\N
738	sadsad	192.168.0.152	N	2014-06-22 17:21:23.276+08	2014-06-22 17:21:23.276+08	\N	N	\N
739	uat_customer1	192.168.0.124	Y	2014-06-22 17:21:28.858+08	2014-06-22 17:21:28.858+08	\N	N	\N
740	ab	192.168.0.148	N	2014-06-22 17:21:39.172+08	2014-06-22 17:21:39.172+08	\N	N	\N
741	sadsad	192.168.0.152	N	2014-06-22 17:28:07.203+08	2014-06-22 17:28:07.203+08	\N	N	\N
742	sadsad	192.168.0.152	N	2014-06-22 17:28:13.125+08	2014-06-22 17:28:13.125+08	\N	N	\N
743	uat_customer1	192.168.0.124	Y	2014-06-22 17:28:38.835+08	2014-06-22 17:28:38.835+08	\N	N	\N
744	uat_customer1	192.168.0.124	Y	2014-06-22 17:28:45.145+08	2014-06-22 17:28:45.145+08	\N	N	\N
745	uat_customer2	192.168.0.154	N	2014-06-22 17:53:55.22+08	2014-06-22 17:53:55.22+08	\N	N	\N
746	uat_customer2	192.168.0.154	N	2014-06-22 17:54:06.108+08	2014-06-22 17:54:06.108+08	\N	N	\N
747	customer	192.168.0.154	N	2014-06-22 17:54:18.346+08	2014-06-22 17:54:18.346+08	\N	N	\N
748	uat_customer2	192.168.0.154	Y	2014-06-22 17:54:50.588+08	2014-06-22 17:54:50.588+08	\N	N	\N
749	uat_customer2	192.168.0.124	Y	2014-06-22 17:55:14.257+08	2014-06-22 17:55:14.257+08	\N	N	\N
750	uat_customer2	192.168.0.154	Y	2014-06-22 17:55:35.421+08	2014-06-22 17:55:35.421+08	\N	N	\N
751	uat_customer2	192.168.0.154	Y	2014-06-22 17:55:49.125+08	2014-06-22 17:55:49.125+08	\N	N	\N
752	uat_customer2	192.168.0.154	Y	2014-06-22 17:56:05.804+08	2014-06-22 17:56:05.804+08	\N	N	\N
753	uat_customer2	192.168.0.154	Y	2014-06-22 17:56:11.85+08	2014-06-22 17:56:11.85+08	\N	N	\N
754	ysyow	192.168.0.152	Y	2014-06-22 17:56:34.084+08	2014-06-22 17:56:34.084+08	\N	N	\N
755	ysyow	192.168.0.152	Y	2014-06-22 17:56:43.233+08	2014-06-22 17:56:43.233+08	\N	N	\N
756	ysyow	192.168.0.152	Y	2014-06-22 17:56:50.099+08	2014-06-22 17:56:50.099+08	\N	N	\N
757	ysyow	192.168.0.152	N	2014-06-22 17:58:12.63+08	2014-06-22 17:58:12.63+08	\N	N	\N
758	ysyow	192.168.0.152	Y	2014-06-22 17:58:20.321+08	2014-06-22 17:58:20.321+08	\N	N	\N
759	ysyow	192.168.0.152	Y	2014-06-22 17:58:56.913+08	2014-06-22 17:58:56.913+08	\N	N	\N
760	ysyow	192.168.0.152	Y	2014-06-22 17:59:23.21+08	2014-06-22 17:59:23.21+08	\N	N	\N
761	ysyow	192.168.0.152	N	2014-06-22 18:05:46.4+08	2014-06-22 18:05:46.4+08	\N	N	\N
762	ysyow	192.168.0.152	Y	2014-06-22 18:05:51.174+08	2014-06-22 18:05:51.174+08	\N	N	\N
763	uat_supervisor1	192.168.0.124	Y	2014-06-22 18:07:27.869+08	2014-06-22 18:07:27.869+08	\N	N	\N
764	esp	192.168.0.124	Y	2014-06-22 18:15:05.508+08	2014-06-22 18:15:05.508+08	\N	N	\N
765	uat_customer2	192.168.0.154	Y	2014-06-22 18:17:38.369+08	2014-06-22 18:17:38.369+08	\N	N	\N
766	uat_customer1	192.168.0.124	Y	2014-06-22 18:27:50.268+08	2014-06-22 18:27:50.268+08	\N	N	\N
767	uat_supervisor1	192.168.0.124	Y	2014-06-22 18:29:09.417+08	2014-06-22 18:29:09.417+08	\N	N	\N
768	uat_customer2	192.168.0.154	Y	2014-06-22 18:31:31.265+08	2014-06-22 18:31:31.265+08	\N	N	\N
769	uat_customer1	192.168.0.124	Y	2014-06-22 18:35:38.31+08	2014-06-22 18:35:38.31+08	\N	N	\N
770	uat_supervisor1	192.168.0.124	N	2014-06-22 18:38:19.684+08	2014-06-22 18:38:19.684+08	\N	N	\N
771	uat_supervisor1	192.168.0.124	N	2014-06-22 18:38:26.421+08	2014-06-22 18:38:26.421+08	\N	N	\N
772	uat_supervisor1	192.168.0.124	N	2014-06-22 18:38:36.279+08	2014-06-22 18:38:36.279+08	\N	N	\N
773	uat_supervisor	192.168.0.124	N	2014-06-22 18:38:44.97+08	2014-06-22 18:38:44.97+08	\N	N	\N
774	uat_supervisor1	192.168.0.124	Y	2014-06-22 18:38:59.479+08	2014-06-22 18:38:59.479+08	\N	N	\N
775	fongadmin	192.168.0.148	Y	2014-06-22 18:39:04.171+08	2014-06-22 18:39:04.171+08	\N	N	\N
776	uat_customer1	192.168.0.124	Y	2014-06-22 18:40:21.265+08	2014-06-22 18:40:21.265+08	\N	N	\N
777	uat_supervisor1	192.168.0.124	Y	2014-06-22 19:11:42.416+08	2014-06-22 19:11:42.416+08	\N	N	\N
778	uat_customer1	192.168.0.124	N	2014-06-22 19:18:07.13+08	2014-06-22 19:18:07.13+08	\N	N	\N
779	uat_customer1	192.168.0.124	Y	2014-06-22 19:18:14.038+08	2014-06-22 19:18:14.038+08	\N	N	\N
780	uat_supervisor1	192.168.0.124	N	2014-06-22 19:20:27.854+08	2014-06-22 19:20:27.854+08	\N	N	\N
781	uat_customer1	192.168.0.124	Y	2014-06-22 19:20:33.614+08	2014-06-22 19:20:33.614+08	\N	N	\N
782	fongadmin	192.168.0.148	N	2014-06-22 19:29:13.811+08	2014-06-22 19:29:13.811+08	\N	N	\N
783	fongadmin	192.168.0.148	Y	2014-06-22 19:29:20.825+08	2014-06-22 19:29:20.825+08	\N	N	\N
784	uat_customer2	192.168.0.154	Y	2014-06-22 21:13:25.115+08	2014-06-22 21:13:25.115+08	\N	N	\N
785	uat_supervisor1	192.168.0.124	Y	2014-06-22 21:14:19.623+08	2014-06-22 21:14:19.623+08	\N	N	\N
786	uat_artist1	192.168.0.124	Y	2014-06-22 21:15:05.208+08	2014-06-22 21:15:05.208+08	\N	N	\N
787	uat_supervisor2	192.168.0.154	Y	2014-06-22 21:32:14.144+08	2014-06-22 21:32:14.144+08	\N	N	\N
788	uat_qc1	192.168.0.124	Y	2014-06-22 21:34:56.835+08	2014-06-22 21:34:56.835+08	\N	N	\N
789	uat_customer3	192.168.0.124	N	2014-06-22 21:59:53.291+08	2014-06-22 21:59:53.291+08	\N	N	\N
790	uat_customer3	192.168.0.124	Y	2014-06-22 22:00:33.823+08	2014-06-22 22:00:33.823+08	\N	N	\N
791	uat_customer2	192.168.0.154	Y	2014-06-22 22:09:10.863+08	2014-06-22 22:09:10.863+08	\N	N	\N
792	uat_artist2	192.168.0.154	Y	2014-06-22 22:13:50.724+08	2014-06-22 22:13:50.724+08	\N	N	\N
793	uat_qc2	192.168.0.154	Y	2014-06-22 22:15:13.062+08	2014-06-22 22:15:13.062+08	\N	N	\N
794	uat_artist2	192.168.0.154	Y	2014-06-22 22:16:07.003+08	2014-06-22 22:16:07.003+08	\N	N	\N
795	uat_artist2	192.168.0.154	Y	2014-06-22 22:22:45.386+08	2014-06-22 22:22:45.386+08	\N	N	\N
796	supervisor	::1	N	2014-06-22 22:35:26.144+08	2014-06-22 22:35:26.144+08	\N	N	\N
797	supervisor	::1	Y	2014-06-22 22:35:51.297+08	2014-06-22 22:35:51.297+08	\N	N	\N
798	artist2	::1	N	2014-06-22 22:37:16.261+08	2014-06-22 22:37:16.261+08	\N	N	\N
799	artist2	::1	Y	2014-06-22 22:37:20.689+08	2014-06-22 22:37:20.689+08	\N	N	\N
800	uat_supervisor2	192.168.0.154	Y	2014-06-22 22:37:32.432+08	2014-06-22 22:37:32.432+08	\N	N	\N
801	uat_artist2	192.168.0.154	Y	2014-06-22 22:38:17.765+08	2014-06-22 22:38:17.765+08	\N	N	\N
802	uat_supervisor2	192.168.0.154	Y	2014-06-22 22:38:47.732+08	2014-06-22 22:38:47.732+08	\N	N	\N
803	uat_artist2	192.168.0.154	Y	2014-06-22 22:39:56.098+08	2014-06-22 22:39:56.098+08	\N	N	\N
804	supervisor	::1	Y	2014-06-22 22:41:17.055+08	2014-06-22 22:41:17.055+08	\N	N	\N
805	uat_qc2	192.168.0.154	Y	2014-06-22 22:41:36.378+08	2014-06-22 22:41:36.378+08	\N	N	\N
806	uat_artist2	192.168.0.154	Y	2014-06-22 22:43:03.648+08	2014-06-22 22:43:03.648+08	\N	N	\N
807	uat_supervisor3	192.168.0.124	Y	2014-06-22 23:00:30.678+08	2014-06-22 23:00:30.678+08	\N	N	\N
808	uat_artist3	192.168.0.124	Y	2014-06-22 23:01:13.198+08	2014-06-22 23:01:13.198+08	\N	N	\N
809	uat_qc3	192.168.0.124	Y	2014-06-22 23:01:59.677+08	2014-06-22 23:01:59.677+08	\N	N	\N
810	uat_artist3	192.168.0.124	Y	2014-06-22 23:02:27.397+08	2014-06-22 23:02:27.397+08	\N	N	\N
811	uat_artist2	192.168.0.154	Y	2014-06-22 23:07:27.973+08	2014-06-22 23:07:27.973+08	\N	N	\N
812	uat_qc2	192.168.0.154	Y	2014-06-22 23:07:51.189+08	2014-06-22 23:07:51.189+08	\N	N	\N
813	uat_customer1	::1	Y	2014-06-23 10:50:18.964+08	2014-06-23 10:50:18.964+08	\N	N	\N
814	admin	::1	Y	2014-06-23 12:09:11.478+08	2014-06-23 12:09:11.478+08	\N	N	\N
815	admin	::1	N	2014-06-23 13:58:53.528+08	2014-06-23 13:58:53.528+08	\N	N	\N
816	admin	::1	Y	2014-06-23 13:58:57.342+08	2014-06-23 13:58:57.342+08	\N	N	\N
817	admin	::1	Y	2014-06-23 14:02:42.639+08	2014-06-23 14:02:42.639+08	\N	N	\N
818	ysyow	::1	Y	2014-06-24 16:34:32.866+08	2014-06-24 16:34:32.866+08	\N	N	\N
819	admin	192.168.0.124	N	2014-06-24 18:01:03.59+08	2014-06-24 18:01:03.59+08	\N	N	\N
820	admin	192.168.0.124	Y	2014-06-24 18:01:07.201+08	2014-06-24 18:01:07.201+08	\N	N	\N
821	admin	192.168.0.124	Y	2014-06-24 18:26:53.912+08	2014-06-24 18:26:53.912+08	\N	N	\N
822	uat_customer1	192.168.0.124	Y	2014-06-24 18:40:58.768+08	2014-06-24 18:40:58.768+08	\N	N	\N
823	supervisor	::1	Y	2014-06-24 18:41:24.878+08	2014-06-24 18:41:24.878+08	\N	N	\N
824	admin	192.168.0.124	Y	2014-06-24 18:41:43.92+08	2014-06-24 18:41:43.92+08	\N	N	\N
825	ysyow	::1	Y	2014-06-24 18:43:00.118+08	2014-06-24 18:43:00.118+08	\N	N	\N
826	uat_customer1	192.168.0.124	Y	2014-06-24 18:45:06.128+08	2014-06-24 18:45:06.128+08	\N	N	\N
827	uat_supervisor1	192.168.0.124	Y	2014-06-24 18:47:24.417+08	2014-06-24 18:47:24.417+08	\N	N	\N
828	admin2	::1	Y	2014-06-24 18:56:20.438+08	2014-06-24 18:56:20.438+08	\N	N	\N
829	esp	192.168.0.124	Y	2014-06-24 19:00:10.935+08	2014-06-24 19:00:10.935+08	\N	N	\N
830	uat_artist1	192.168.0.124	Y	2014-06-24 19:02:03.663+08	2014-06-24 19:02:03.663+08	\N	N	\N
831	uat_qc1	192.168.0.124	Y	2014-06-24 19:02:42.668+08	2014-06-24 19:02:42.668+08	\N	N	\N
832	uat_customer1	192.168.0.124	Y	2014-06-24 19:03:24.343+08	2014-06-24 19:03:24.343+08	\N	N	\N
833	uat_supervisor1	192.168.0.124	Y	2014-06-24 19:03:42.046+08	2014-06-24 19:03:42.046+08	\N	N	\N
834	uat_artist1	192.168.0.124	N	2014-06-24 19:04:06.613+08	2014-06-24 19:04:06.613+08	\N	N	\N
835	uat_artist1	192.168.0.124	Y	2014-06-24 19:04:11.898+08	2014-06-24 19:04:11.898+08	\N	N	\N
836	uat_qc1	192.168.0.124	Y	2014-06-24 19:04:37.17+08	2014-06-24 19:04:37.17+08	\N	N	\N
837	uat_customer1	192.168.0.124	Y	2014-06-24 19:05:53.646+08	2014-06-24 19:05:53.646+08	\N	N	\N
838	uat_supervisor1	192.168.0.124	Y	2014-06-24 19:07:04.369+08	2014-06-24 19:07:04.369+08	\N	N	\N
839	uat_artist1	192.168.0.124	Y	2014-06-24 19:07:22.506+08	2014-06-24 19:07:22.506+08	\N	N	\N
840	uat_qc1	192.168.0.124	Y	2014-06-24 19:07:47.586+08	2014-06-24 19:07:47.586+08	\N	N	\N
841	admin	192.168.0.124	Y	2014-06-24 19:09:36.116+08	2014-06-24 19:09:36.116+08	\N	N	\N
842	admin	192.168.0.128	Y	2014-06-25 15:30:00.588+08	2014-06-25 15:30:00.588+08	\N	N	\N
843	admin	::1	Y	2014-06-25 15:49:25.367+08	2014-06-25 15:49:25.367+08	\N	N	\N
844	ysyow	::1	Y	2014-06-25 15:54:39.712+08	2014-06-25 15:54:39.712+08	\N	N	\N
845	uat_customer4	192.168.0.124	Y	2014-06-25 17:39:15.19+08	2014-06-25 17:39:15.19+08	\N	N	\N
846	admin	192.168.0.124	Y	2014-06-25 17:44:05.359+08	2014-06-25 17:44:05.359+08	\N	N	\N
847	uat_customer4	192.168.0.124	Y	2014-06-25 17:44:35.294+08	2014-06-25 17:44:35.294+08	\N	N	\N
848	ysyow	192.168.0.128	Y	2014-06-25 18:06:22.929+08	2014-06-25 18:06:22.929+08	\N	N	\N
849	uat_supervisor4	192.168.0.124	Y	2014-06-25 18:11:33.252+08	2014-06-25 18:11:33.252+08	\N	N	\N
850	admin	192.168.0.124	Y	2014-06-25 18:16:49.201+08	2014-06-25 18:16:49.201+08	\N	N	\N
851	supervisor	192.168.0.128	Y	2014-06-25 18:19:06.579+08	2014-06-25 18:19:06.579+08	\N	N	\N
852	uat_artist4	192.168.0.124	Y	2014-06-25 18:21:27.287+08	2014-06-25 18:21:27.287+08	\N	N	\N
853	uat_qc1	192.168.0.124	Y	2014-06-25 18:25:35.256+08	2014-06-25 18:25:35.256+08	\N	N	\N
854	uat_customer4	192.168.0.124	Y	2014-06-25 18:27:49.751+08	2014-06-25 18:27:49.751+08	\N	N	\N
855	ysyow	::1	Y	2014-06-25 18:29:31.727+08	2014-06-25 18:29:31.727+08	\N	N	\N
856	admin	192.168.0.128	Y	2014-06-25 19:15:41.609+08	2014-06-25 19:15:41.609+08	\N	N	\N
857	uat_customer4	192.168.0.124	Y	2014-06-26 10:55:14.119+08	2014-06-26 10:55:14.119+08	\N	N	\N
858	admin	192.168.0.124	Y	2014-06-26 11:03:40.312+08	2014-06-26 11:03:40.312+08	\N	N	\N
859	ysyow	192.168.0.128	Y	2014-06-26 11:04:00.577+08	2014-06-26 11:04:00.577+08	\N	N	\N
860	esp	192.168.0.124	Y	2014-06-26 11:09:49.633+08	2014-06-26 11:09:49.633+08	\N	N	\N
861	admin2	192.168.0.124	Y	2014-06-26 11:15:19.569+08	2014-06-26 11:15:19.569+08	\N	N	\N
862	uat_supervisor2	192.168.0.124	N	2014-06-26 11:15:55.098+08	2014-06-26 11:15:55.098+08	\N	N	\N
863	uat_supervisor2	192.168.0.124	Y	2014-06-26 11:16:01.29+08	2014-06-26 11:16:01.29+08	\N	N	\N
864	uat_artist4	192.168.0.124	Y	2014-06-26 11:16:27.865+08	2014-06-26 11:16:27.865+08	\N	N	\N
865	uat_aritst4	192.168.0.124	N	2014-06-26 11:45:34.078+08	2014-06-26 11:45:34.078+08	\N	N	\N
866	uat_artist4	192.168.0.124	Y	2014-06-26 11:45:43.45+08	2014-06-26 11:45:43.45+08	\N	N	\N
867	admin2	::1	N	2014-06-26 11:53:19.01+08	2014-06-26 11:53:19.01+08	\N	N	\N
868	admin	192.168.0.124	Y	2014-06-26 12:03:42.463+08	2014-06-26 12:03:42.463+08	\N	N	\N
869	esp	192.168.0.124	Y	2014-06-26 12:06:22.464+08	2014-06-26 12:06:22.464+08	\N	N	\N
870	uat_supervisor	192.168.0.124	N	2014-06-26 12:26:56.874+08	2014-06-26 12:26:56.874+08	\N	N	\N
871	uat_supervisor4	192.168.0.124	Y	2014-06-26 12:27:03.306+08	2014-06-26 12:27:03.306+08	\N	N	\N
872	esp	192.168.0.124	Y	2014-06-26 12:29:20.358+08	2014-06-26 12:29:20.358+08	\N	N	\N
873	uat_customer1	192.168.0.124	Y	2014-06-26 12:32:50.54+08	2014-06-26 12:32:50.54+08	\N	N	\N
874	supervisor	192.168.0.128	Y	2014-06-26 16:27:41.378+08	2014-06-26 16:27:41.378+08	\N	N	\N
875	ysyow	::1	Y	2014-06-26 16:28:36.653+08	2014-06-26 16:28:36.653+08	\N	N	\N
876	artist2	192.168.0.128	Y	2014-06-26 16:33:28.956+08	2014-06-26 16:33:28.956+08	\N	N	\N
877	esp	192.168.0.124	Y	2014-06-26 16:33:37.403+08	2014-06-26 16:33:37.403+08	\N	N	\N
878	ysyow	::1	Y	2014-06-26 17:14:36.888+08	2014-06-26 17:14:36.888+08	\N	N	\N
879	ysyow	::1	N	2014-06-28 15:04:12.339+08	2014-06-28 15:04:12.339+08	\N	N	\N
880	ysyow	::1	Y	2014-06-28 15:04:16.212+08	2014-06-28 15:04:16.212+08	\N	N	\N
881	supervisor	::1	Y	2014-06-28 15:12:29.232+08	2014-06-28 15:12:29.232+08	\N	N	\N
882	ysyow	192.168.0.152	Y	2014-06-28 15:26:58.995+08	2014-06-28 15:26:58.995+08	\N	N	\N
883	fongadmin	192.168.0.148	Y	2014-06-28 15:46:39.195+08	2014-06-28 15:46:39.195+08	\N	N	\N
884	admin2	::1	Y	2014-06-28 16:51:17.686+08	2014-06-28 16:51:17.686+08	\N	N	\N
885	admin	::1	Y	2014-06-28 18:39:27.601+08	2014-06-28 18:39:27.601+08	\N	N	\N
886	customer	::1	Y	2014-06-28 19:41:49.354+08	2014-06-28 19:41:49.354+08	\N	N	\N
887	customer	::1	Y	2014-06-28 22:10:50.421+08	2014-06-28 22:10:50.421+08	\N	N	\N
888	admin	::1	Y	2014-06-28 22:12:29.469+08	2014-06-28 22:12:29.469+08	\N	N	\N
889	supervisor	192.168.0.128	N	2014-06-30 14:43:46.999+08	2014-06-30 14:43:46.999+08	\N	N	\N
890	supervisor	192.168.0.128	Y	2014-06-30 14:43:51.814+08	2014-06-30 14:43:51.814+08	\N	N	\N
891	artist2	192.168.0.128	Y	2014-06-30 14:46:07.419+08	2014-06-30 14:46:07.419+08	\N	N	\N
892	admin	175.140.67.160	Y	2014-06-30 17:40:15.171679+08	2014-06-30 17:40:15.171679+08	\N	N	\N
893	uat_customer	203.106.158.254	N	2014-06-30 17:54:31.464295+08	2014-06-30 17:54:31.464295+08	\N	N	\N
894	uat_customer4	203.106.158.254	Y	2014-06-30 17:54:44.952621+08	2014-06-30 17:54:44.952621+08	\N	N	\N
895	uat_artis	203.106.158.254	N	2014-06-30 20:09:41.058471+08	2014-06-30 20:09:41.058471+08	\N	N	\N
896	uat_supervisor2	203.106.158.254	Y	2014-06-30 20:09:57.651314+08	2014-06-30 20:09:57.651314+08	\N	N	\N
897	uat_customer2	60.51.119.130	Y	2014-07-01 03:58:44.047823+08	2014-07-01 03:58:44.047823+08	\N	N	\N
898	uat_customer1	60.51.119.130	Y	2014-07-01 04:36:39.658623+08	2014-07-01 04:36:39.658623+08	\N	N	\N
899	uat_customer2	60.51.119.130	Y	2014-07-01 04:36:59.373908+08	2014-07-01 04:36:59.373908+08	\N	N	\N
900	uat_customer2	60.51.119.130	Y	2014-07-01 05:05:22.279089+08	2014-07-01 05:05:22.279089+08	\N	N	\N
901	uat_customer1	60.51.119.130	Y	2014-07-01 05:05:44.670023+08	2014-07-01 05:05:44.670023+08	\N	N	\N
902	uat_supervisor1	60.51.119.130	Y	2014-07-01 05:23:41.360978+08	2014-07-01 05:23:41.360978+08	\N	N	\N
903	uat_supervisor2	60.51.119.130	Y	2014-07-01 05:24:36.04643+08	2014-07-01 05:24:36.04643+08	\N	N	\N
904	uat_customer2	60.51.119.130	Y	2014-07-01 05:25:16.938423+08	2014-07-01 05:25:16.938423+08	\N	N	\N
905	uat_artist1	60.51.119.130	Y	2014-07-01 05:49:32.702338+08	2014-07-01 05:49:32.702338+08	\N	N	\N
906	uat_artist2	60.51.119.130	Y	2014-07-01 05:49:47.242507+08	2014-07-01 05:49:47.242507+08	\N	N	\N
907	uat_qc1	60.51.119.130	Y	2014-07-01 06:26:46.051137+08	2014-07-01 06:26:46.051137+08	\N	N	\N
908	uat_qc2	60.51.119.130	Y	2014-07-01 06:26:58.873385+08	2014-07-01 06:26:58.873385+08	\N	N	\N
909	uat_customer1	60.51.119.130	Y	2014-07-01 06:49:32.112716+08	2014-07-01 06:49:32.112716+08	\N	N	\N
910	uat_customer1	60.51.119.130	Y	2014-07-01 06:49:59.86349+08	2014-07-01 06:49:59.86349+08	\N	N	\N
911	uat_customer2	60.51.119.130	Y	2014-07-01 06:50:33.642989+08	2014-07-01 06:50:33.642989+08	\N	N	\N
912	uat_customer1	175.139.126.176	Y	2014-07-01 07:07:14.899085+08	2014-07-01 07:07:14.899085+08	\N	N	\N
913	uat_customer2	175.139.126.176	Y	2014-07-01 07:07:25.841795+08	2014-07-01 07:07:25.841795+08	\N	N	\N
914	uat_customer4	175.139.126.176	Y	2014-07-01 07:07:34.117567+08	2014-07-01 07:07:34.117567+08	\N	N	\N
915	uat_customer1	203.106.158.254	Y	2014-07-01 10:31:17.909022+08	2014-07-01 10:31:17.909022+08	\N	N	\N
916	uat_customer1	203.106.158.254	Y	2014-07-01 10:31:56.536019+08	2014-07-01 10:31:56.536019+08	\N	N	\N
917	uat_customer2	203.106.158.254	Y	2014-07-01 10:32:57.620068+08	2014-07-01 10:32:57.620068+08	\N	N	\N
918	uat_customer1	203.106.158.254	Y	2014-07-01 10:33:48.860774+08	2014-07-01 10:33:48.860774+08	\N	N	\N
919	uat_customer1	203.106.158.254	N	2014-07-01 10:42:58.326562+08	2014-07-01 10:42:58.326562+08	\N	N	\N
920	uat_customer4	203.106.158.254	Y	2014-07-01 10:57:09.313652+08	2014-07-01 10:57:09.313652+08	\N	N	\N
924	admin	127.0.0.1	Y	2014-07-01 11:19:09.373+08	2014-07-01 11:19:09.373+08	\N	N	\N
925	uat_supervisor1	127.0.0.1	Y	2014-07-03 10:12:24.513+08	2014-07-03 10:12:24.513+08	\N	N	\N
926	admin	127.0.0.1	Y	2014-07-03 10:18:38.81+08	2014-07-03 10:18:38.81+08	\N	N	\N
927	esp	127.0.0.1	Y	2014-07-03 10:19:10.456+08	2014-07-03 10:19:10.456+08	\N	N	\N
928	esp	127.0.0.1	Y	2014-07-03 10:22:06.793+08	2014-07-03 10:22:06.793+08	\N	N	\N
929	admin	127.0.0.1	Y	2014-07-03 10:41:56.708+08	2014-07-03 10:41:56.708+08	\N	N	\N
930	uat_artist1	127.0.0.1	Y	2014-07-03 12:32:42.351+08	2014-07-03 12:32:42.351+08	\N	N	\N
931	esp	127.0.0.1	Y	2014-07-03 12:33:24.345+08	2014-07-03 12:33:24.345+08	\N	N	\N
932	admin	127.0.0.1	Y	2014-07-03 12:33:34.743+08	2014-07-03 12:33:34.743+08	\N	N	\N
933	uat_artist1	127.0.0.1	Y	2014-07-03 12:35:18.276+08	2014-07-03 12:35:18.276+08	\N	N	\N
934	uat_qc1	127.0.0.1	Y	2014-07-03 12:41:04.943+08	2014-07-03 12:41:04.943+08	\N	N	\N
935	uat_customer1	127.0.0.1	Y	2014-07-03 12:41:34.001+08	2014-07-03 12:41:34.001+08	\N	N	\N
936	uat_supervisor1	127.0.0.1	Y	2014-07-03 12:42:25.561+08	2014-07-03 12:42:25.561+08	\N	N	\N
937	uat_artist1	127.0.0.1	Y	2014-07-03 12:43:04.632+08	2014-07-03 12:43:04.632+08	\N	N	\N
938	uat_customer1	127.0.0.1	Y	2014-07-03 12:43:35.764+08	2014-07-03 12:43:35.764+08	\N	N	\N
939	uat_supervisor1	127.0.0.1	Y	2014-07-03 12:44:10.503+08	2014-07-03 12:44:10.503+08	\N	N	\N
940	uat_artist1	127.0.0.1	Y	2014-07-03 14:08:06.915+08	2014-07-03 14:08:06.915+08	\N	N	\N
\.


--
-- Name: fcuserlogin_ul_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcuserlogin_ul_id_seq', 940, true);


--
-- Data for Name: fcuserorgrole; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY fcuserorgrole (uor_id, uor_usrid, uor_orgid, uor_rolid, uor_seq) FROM stdin;
2	tony	1	2	\N
3	nick	1	3	\N
4	natasha	1	4	\N
6	lampard7824@gmail.com	1	2	1
11	yys1988@gmail.com	1	5	1
17	admin	1	10	1
18	admin2	1	10	1
19	esp@phiorion.com	1	2	1
20	danny@phiorion.com	1	2	1
21	hongyee@phiorion.com	1	2	1
22	fong@phiorion.com	1	2	1
23	yow@phiorion.com	1	2	1
26	thor@gmail.com	1	2	1
27	superman@gmail.com	1	2	1
29	harry	1	12	1
30	fred	1	12	1
31	severus	1	13	1
32	albus	1	11	1
33	customer	1	14	1
36	supervisor	1	19	1
37	qc	1	18	1
40	artist1	1	20	1
41	artist2	1	20	1
50	Test	1	20	1
51	uat_supervisor1	1	19	1
52	uat_artist1	1	20	1
53	uat_manager1	1	23	1
54	uat_cust1	9	14	1
57	ysyow	1	10	1
55	esp	1	10	1
58	fongartist	1	20	1
59	fongadmin	1	10	1
60	fongcustomer	10	14	1
61	esp_supervisor	1	19	1
62	fongsupervisor	1	19	1
65	esp_artist	1	20	1
68	uat_customer1	9	14	1
75	uat_supervisor2	1	19	1
76	uat_supervisor3	1	19	1
77	uat_supervisor4	1	19	1
78	uat_supervisor5	1	19	1
79	uat_artist2	1	20	1
80	uat_artist3	1	20	1
81	uat_artist4	1	20	1
82	uat_artist5	1	20	1
83	uat_qc1	1	18	1
84	uat_qc2	1	18	1
85	uat_qc3	1	18	1
86	uat_qc4	1	18	1
87	uat_qc5	1	18	1
88	uat_manager2	1	23	1
89	uat_manager3	1	23	1
90	uat_manager4	1	23	1
91	uat_manager5	1	23	1
92	uat_customer2	11	14	1
93	uat_customer3	12	14	1
94	uat_customer4	13	14	1
95	uat_customer5	14	14	1
\.


--
-- Name: fcuserorgrole_uor_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcuserorgrole_uor_id_seq', 95, true);


--
-- Data for Name: fcusersession; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY fcusersession (us_id, us_sessid, us_userid, us_ip, us_active, us_created, us_last_active, us_forcecloseby) FROM stdin;
408	1kkbhl72fl7lktmld4p5d10os0	ironman@gmail.com	127.0.0.1	Y	2014-02-17 15:31:34.882+08	2014-02-17 15:31:34+08	\N
724	9kvhl5niddlkdtguhgulocqd52	uat_artist3	192.168.0.124	Y	2014-06-22 23:02:27.408+08	2014-06-22 23:02:27+08	\N
788	895mrre7tou5jpfqip6pjhjb04	ysyow	192.168.0.152	Y	2014-06-28 15:26:59.005+08	2014-06-28 15:26:59+08	\N
789	mkdspgfc7pfcja7bg4bd74eki4	fongadmin	192.168.0.148	Y	2014-06-28 15:46:39.263+08	2014-06-28 15:46:39+08	\N
790	d3k0qeq69b90rv24lbhc3umsg1	admin2	::1	Y	2014-06-28 16:51:17.696+08	2014-06-28 16:51:17+08	\N
796	v2ekh5la55i8voeb4ufut56ak5	artist2	192.168.0.128	Y	2014-06-30 14:46:07.456+08	2014-06-30 14:46:07+08	\N
546	niamb5anjmlro4064p35o08ik6	fongsupervisor	192.168.0.148	Y	2014-06-21 21:52:33.397+08	2014-06-21 21:52:33+08	\N
822	mclranlibq8n29dcqous479j13	uat_customer4	203.106.158.254	Y	2014-07-01 10:57:09.3224+08	2014-07-01 22:57:09+08	\N
831	pf010gkvgur96dnm9s6cm7h3s0	esp	127.0.0.1	Y	2014-07-03 12:33:24.544+08	2014-07-03 12:33:24+08	\N
832	cjv01g4m1js3qvjgg7bl50vkl7	admin	127.0.0.1	Y	2014-07-03 12:33:34.782+08	2014-07-03 12:33:34+08	\N
\.


--
-- Name: fcusersession_us_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcusersession_us_id_seq', 840, true);


--
-- Data for Name: martistskill; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY martistskill (ma_id, ma_usruserid, ma_jclid) FROM stdin;
1	artist1	5
2	artist1	6
3	artist2	5
4	artist1	2
5	artist1	7
6	Test	5
7	Test	6
8	Test	2
9	Test2	5
10	Test2	6
11	Test2	2
12	fongartist	5
13	fongartist	6
14	fongartist	2
15	fongartist	7
16	fongartist	8
17	fongartist	3
18	fongartist	4
19	fongartist	1
20	esp_artist	5
21	esp_artist	6
22	esp_artist	2
23	uat_artist2	5
24	uat_artist2	6
25	uat_artist2	2
26	uat_artist3	5
27	uat_artist3	7
28	uat_artist3	8
29	uat_artist4	6
30	uat_artist4	2
31	uat_artist4	7
32	uat_artist5	5
33	uat_artist5	6
34	uat_artist5	2
\.


--
-- Name: martistskill_ma_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('martistskill_ma_id_seq', 34, true);


--
-- Data for Name: mbarcodetype; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY mbarcodetype (bt_code, bt_name, bt_format) FROM stdin;
CODEBAR	CodeBar	9999999999999999999999999999
CODE128	Code128	99999999999999999999999999999999999999999999999999999999999999999
ISBN	ISBN	999999999
CODE25	Code25	99999999999999999999999999999
EAN8	EAN-8	9999999
ITF	ITF	99999999999999999999999999999999999999
JAN13	Jan-13	9999999999
UPCA	UPC(A)	9999999999
CODE39	Code-39	*****************************
EAN13	EAN-13	99999999999
ITF14	ITF-14	99999999999
JAN8	Jan-8	9999999
UPCE	UPC(E)	999999
\.


--
-- Data for Name: mcarton; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY mcarton (car_id, car_name, car_status) FROM stdin;
38	Five panel	ACTIVE
39	HSC	ACTIVE
40	OSC 2	ACTIVE
41	New carton	ACTIVE
\.


--
-- Name: mcarton_car_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('mcarton_car_id_seq', 42, true);


--
-- Data for Name: mcartonvariable; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY mcartonvariable (carv_code, carv_unit, carv_carid) FROM stdin;
x.1	mm	38
x.2	mm	38
x.3	mm	38
x.4	mm	38
x.5	mm	38
y.1	mm	38
y.2	mm	38
y.3	mm	38
x.E	mm	39
x.L1	mm	39
x.W1	mm	39
x.L2	mm	39
x.W2	mm	39
y.T	mm	39
y.H	mm	39
y.B	mm	39
x.1	mm	40
x.2	mm	40
x.3	mm	40
x.4	mm	40
x.5	mm	40
y.1	mm	40
y.2	mm	40
y.3	mm	40
x1	mm	41
x2	mm	41
x3	mm	41
y1	mm	41
\.


--
-- Data for Name: mcustmachine; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY mcustmachine (mc_id, mc_orgid, mc_pressmanufacturer, mc_pressyearbuilt, mc_pressmodel, mc_presswidth, mc_presstype, mc_pressspeed, mc_presscylinderrepeat, mc_inkmanufacturer, mc_inkcommercialname, mc_inktype, mc_inktypeother, mc_inkviscosity, mc_inkvicosityother, mc_inkprintingunit_1, mc_inkprintingunit_2, mc_inkprintingunit_3, mc_inkprintingunit_4, mc_inkprintingunit_5, mc_inkvisocity_1, mc_inkvisocity_2, mc_inkvisocity_3, mc_inkvisocity_4, mc_inkvisocity_5, mc_inkph_1, mc_inkph_2, mc_inkph_3, mc_inkph_4, mc_inkph_5, mc_inkdensity_1, mc_inkdensity_2, mc_inkdensity_3, mc_inkdensity_4, mc_inkdensity_5, mc_platemanufacturer, mc_platecommercialname, mc_platetype, mc_platedurometer, mc_platethickness, mc_platerelief, mc_mountingtapemanufacturer, mc_mountingtapename, mc_mountingtapedensity, mc_mountingtapthickness, mc_mountingcarrierthickness, mc_mountingcushionmanufacturer, mc_mountingcushonname, mc_mountingdensity, mc_mountingcushionthickness, mc_cimplevel_1, mc_cimplevel_2, mc_cimplevel_3, mc_cimplevel_4, mc_cimplevel_5, mc_cimpsubstrate_1, mc_cimpsubstrate_2, mc_cimpsubstrate_3, mc_cimpsubstrate_4, mc_cimpsubstrate_5, mc_cimpanlox_1, mc_cimpanlox_2, mc_cimpanlox_3, mc_cimpanlox_4, mc_cimpanlox_5, mc_aniloxmanufacturer, mc_aniloxtype, mc_aniloxengravingangle, mc_aniloxinking, mc_aniloxprintingunit_1, mc_aniloxprintingunit_2, mc_aniloxprintingunit_3, mc_aniloxprintingunit_4, mc_aniloxprintingunit_5, mc_aniloxmanufacturer_1, mc_aniloxmanufacturer_2, mc_aniloxmanufacturer_3, mc_aniloxmanufacturer_4, mc_aniloxmanufacturer_5, mc_aniloxtype_1, mc_aniloxtype_2, mc_aniloxtype_3, mc_aniloxtype_4, mc_aniloxtype_5, mc_aniloxengravingangle_1, mc_aniloxengravingangle_2, mc_aniloxengravingangle_3, mc_aniloxengravingangle_4, mc_aniloxengravingangle_5, mc_aniloxinking_1, mc_aniloxinking_2, mc_aniloxinking_3, mc_aniloxinking_4, mc_aniloxinking_5, mc_aniloxcellcount_1, mc_aniloxcellcount_2, mc_aniloxcellcount_3, mc_aniloxcellcount_4, mc_aniloxcellcount_5, mc_aniloxvolumn_1, mc_aniloxvolumn_2, mc_aniloxvolumn_3, mc_aniloxvolumn_4, mc_aniloxvolumn_5, mc_aniloxdoration_1, mc_aniloxdoration_2, mc_aniloxdoration_3, mc_aniloxdoration_4, mc_aniloxdoration_5, mc_aniloxdoctoring_1, mc_aniloxdoctoring_2, mc_aniloxdoctoring_3, mc_aniloxdoctoring_4, mc_aniloxdoctoring_5, mc_aniloxcontainment_1, mc_aniloxcontainment_2, mc_aniloxcontainment_3, mc_aniloxcontainment_4, mc_aniloxcontainment_5, mc_substratemanufacturer, mc_substratename, mc_substratetype, mc_substratedyna, mc_substrateweight, mc_substrateflute, mc_substratethickness, mc_printer_name) FROM stdin;
1	2	Facture1	1958	Model 1	1230	Stack	100	1000	Ink manufacturer	Ink manufacturer commercial name	Water Based	1234	Auto	1233	Ink Printing Unit 1	Ink PU2	Ink PU3	Ink PU4	Ink PU5	Ink Vis1	Ink Vis2	Ink Vis3	Ink Vis4	Ink Vis5	Ink ph1	Ink ph2	Ink ph3	Ink ph4	Ink ph5	Ink des1	Ink des2	Ink des3	Ink des4	Ink des5	Plate manufacturer	plate commercial name	Solid, Liquid	plate durometer	123	123	Mounting manufacturer	Mounting manufacturer comercial name	Mountting Density	11	22	Mounting carrier manufacturer	Mounting carrier manufacturer commercial name	Mounting carrier manufacturer density	123	CI imp lvl 1	CI imp lvl 2	CI imp lvl 3	CI imp lvl 4	CI imp lvl 5	11	22	33	44	55	123	123	123	123	13	Doctor manufacturer	Laser Engraved Ceramic	N	N	1	2	3	4	5	1	2	3	4	5	11	2	3	4	5	1	2	3	4	5	1	2	5	3	4	1	2	3	4	5	1	2	3	4	5	1	2	3	4	5	1	2	3	4	5	1	2	3	4	5	Subrate manufacturer	Subrate manufacturer 11	Film	2	2	11	11	Printer ABC
2	10	pressmanufacturer	yearbuild	model	width	Stack	speed	cylinderrepeat	inkmanufacturer	commercialname	U.V	typeother	Manual	viscosityother	printingunit1	printingunit2	printingunit3	printingunit4	printingunit5	viscosity1	viscosity2	viscosity3	viscosity4	viscosity5	ph1	ph2	ph3	ph4	ph5	density1	density2	density3	density4	density5	platesmanufacturer	platescommercialname	Uncapped	durometer	tickness	relief	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Printer 123
3	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Printer for customer 1
4	13	Printer 1 for customer 4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Printer 1 for customer 4
\.


--
-- Name: mcustmachine_mc_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('mcustmachine_mc_id_seq', 4, true);


--
-- Data for Name: mjobbarcode; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY mjobbarcode (jbc_id, jbc_jsid, jbc_btcode, jbc_value) FROM stdin;
\.


--
-- Name: mjobbarcode_jbc_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('mjobbarcode_jbc_id_seq', 50, true);


--
-- Data for Name: mjobcat; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY mjobcat (jc_id, jc_jsid, jc_jclid) FROM stdin;
244	112	6
245	112	2
246	112	3
247	114	2
250	116	6
251	117	3
252	117	4
253	118	2
254	115	2
255	115	1
256	119	6
257	119	2
258	119	3
259	119	4
260	120	6
261	120	2
262	121	6
263	121	2
264	121	3
149	57	5
150	57	1
151	58	5
152	58	1
157	59	5
158	59	1
159	60	6
160	60	2
161	61	2
162	62	5
163	62	6
164	63	8
165	64	3
168	66	6
169	66	7
170	66	8
171	66	3
172	67	2
173	68	6
174	68	2
175	65	5
176	65	6
177	69	5
178	69	6
179	69	2
183	70	5
184	70	6
185	70	2
186	71	5
187	71	6
191	72	5
192	72	6
193	72	2
199	74	5
200	74	6
201	74	7
202	75	5
203	75	6
204	76	5
205	76	6
206	77	5
207	77	6
208	77	2
209	78	5
210	78	6
211	79	6
212	80	5
213	80	6
214	81	5
215	81	6
216	82	5
217	82	6
218	83	5
219	83	6
220	84	6
221	84	2
234	111	2
238	113	2
239	113	3
240	113	4
265	122	2
266	122	3
267	123	6
268	123	2
269	123	3
270	123	4
271	123	1
272	124	2
273	125	2
\.


--
-- Name: mjobcat_jc_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('mjobcat_jc_id_seq', 273, true);


--
-- Data for Name: mjobcatlookup; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY mjobcatlookup (jcl_id, jcl_title, jcl_sequence, jcl_requiretime_color_1, jcl_requiretime_color_2, jcl_requiretime_color_3, jcl_requiretime_color_4, jcl_status, jcl_price_cat, jcl_price_color_1, jcl_price_color_2, jcl_price_color_3, jcl_price_color_4, jcl_price_per_unit) FROM stdin;
6	Barcode	600	30	30	30	30	ACTIVE	UNIT	\N	\N	\N	\N	5.0000
2	Drawing	200	240	240	240	240	ACTIVE	COLOR	5.0000	5.0000	5.0000	5.0000	\N
3	Monotone	300	60	60	60	60	ACTIVE	COLOR	5.0000	5.0000	5.0000	5.0000	\N
4	Trapping	400	180	180	360	360	ACTIVE	COLOR	5.0000	5.0000	5.0000	5.0000	\N
1	Typing	100	120	120	120	120	ACTIVE	COLOR	5.0000	5.0000	5.0000	5.0000	\N
\.


--
-- Name: mjobcatlookup_jcl_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('mjobcatlookup_jcl_id_seq', 8, true);


--
-- Data for Name: mjoboutput; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY mjoboutput (jo_id, jo_jsid, jo_outputcode) FROM stdin;
22	57	TM
23	57	 ARTSEP
24	58	TM
28	59	TM
29	60	TM
30	61	TM
31	62	TM
32	62	 ARTSEP
33	63	MCWC
34	64	ARTSEP
35	64	 MCNC
38	66	TM
39	66	 ARTSEP
40	67	ARTSEP
41	68	ARTSEP
42	68	 MCWC
43	65	TM
44	69	TM
45	69	 ARTSEP
48	70	TM
49	71	TM
50	71	 ARTSEP
53	72	TM
58	74	ARTSEP
59	75	TM
60	75	 ARTSEP
61	76	ARTSEP
62	77	TM
63	77	 ARTSEP
64	78	ARTSEP
65	79	ARTSEP
66	80	ARTSEP
67	81	ARTSEP
68	82	TM
69	82	 ARTSEP
70	83	TM
71	83	 ARTSEP
72	84	2
79	111	2
81	113	2
82	113	 1
84	112	2
85	114	2
87	116	2
88	117	3
89	118	2
90	115	2
91	115	 3
92	119	2
93	120	2
94	121	2
95	122	3
96	123	2
97	123	 3
98	123	 1
99	124	2
100	125	
\.


--
-- Data for Name: mjoboutputlookup; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY mjoboutputlookup (jol_id, jol_title, jol_requiredtime, jol_status, jol_price_color_1, jol_price_color_2, jol_price_color_3, jol_price_color_4) FROM stdin;
1	Technical drawing	120	ACTIVE	10.0000	15.0000	20.0000	25.0000
2	Artwork seperation	60	ACTIVE	10.0000	15.0000	20.0000	25.0000
3	Master Card	10	ACTIVE	10.0000	15.0000	20.0000	25.0000
\.


--
-- Name: mjoboutputlookup_jol_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('mjoboutputlookup_jol_id_seq', 3, true);


--
-- Data for Name: mjobsheet; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY mjobsheet (js_id, js_orgid, js_ctid, js_request_date, js_request_by, js_title, js_model, js_description, js_material_provided, js_color_1, js_color_2, js_color_3, js_color_4, js_color_5, js_angle_1, js_angle_2, js_angle_3, js_angle_4, js_angle_5, js_bleeding, js_bleeding_remark, js_distortion, js_distortion_value, js_diecut_ind, js_diecut_no, js_trapping_size, js_primcat, js_status, js_completiondate, js_assignto, js_carid, js_decision, js_width, js_height, js_requiretime, js_request_dateinmth, js_jobcolor, js_lpi, js_mcid, js_code, js_month_occur, js_price, js_outputtype, js_outputwidth, js_outputheight) FROM stdin;
63	9	6	2014-06-21 22:23:53.517+08	uat_cust1	\N	\N	Master card artwork	\N	222	333	444	555	\N	10	20	30	40	\N	7	7mm standard bleeding	X	4.0000	Y	\N	\N	8	NEW	\N	uat_artist1	39	Assign	\N	\N	30	Jun-2014	4	\N	\N	\N	\N	\N	\N	\N	\N
57	1	4	2014-06-21 18:09:24.749+08	admin2	\N	\N	Yow Yik Shuen Job	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5	COMPLETED	\N	artist1	38	Accept	200	300	120	Jun-2014	1	\N	\N	\N	\N	\N	\N	\N	\N
72	9	2	2014-06-22 19:09:29.558+08	uat_customer1	\N	\N	Test revert job -22 有中文！！	\N	1231	123	123	123	1321	13	123	131	131	31	15	\N	\N	\N	Y	\N	131.0000	6	NEW	\N	uat_artist1	38	Forward to Customer	1231	2113	190	Jun-2014	2	\N	\N	\N	\N	\N	\N	\N	\N
60	9	2	2014-06-21 19:15:41.873+08	uat_cust1	\N	\N	Barcode scan and drawing	\N	333	112	113	\N	\N	5	6	7	\N	\N	7	7mm for bleeding	Y	5.0000	Y	\N	\N	6	COMPLETED	\N	uat_artist1	40	Accept	33	22	90	Jun-2014	3	\N	\N	\N	\N	\N	\N	\N	\N
74	11	5	2014-06-22 21:20:41.899+08	uat_customer2	\N	\N	test5	\N	a	a	\N	\N	\N	d	a	\N	\N	\N	7	\N	Y	35.0000	Y	\N	50.0000	7	NEW	\N	esp_artist	41	Assign	\N	\N	220	Jun-2014	3	\N	\N	\N	\N	\N	\N	\N	\N
64	1	4	2014-06-22 14:01:20.343+08	uat_supervisor1	\N	\N	Monotone Editing	\N	55	66	77	88	\N	1	2	3	4	\N	10	standard 7mm bleed	Y	3.0000	\N	\N	\N	3	NEW	\N	uat_artist3	38	Assign	\N	\N	50	Jun-2014	4	\N	\N	\N	\N	\N	\N	\N	\N
59	9	1	2014-06-21 18:47:14.918+08	uat_cust1	\N	\N	Artwork separation job for customer1	\N	33	34	\N	\N	\N	\N	\N	\N	\N	\N	3	common bleeding 3mm	X	5.0000	Y	\N	\N	5	NEW	\N	uat_artist1	39	Assign	\N	\N	120	Jun-2014	2	\N	\N	\N	\N	\N	\N	\N	\N
58	9	1	2014-06-21 18:45:26.295+08	uat_cust1	\N	\N	Artwork separation for UAT Customer 1	\N	333	334	\N	\N	\N	\N	\N	\N	\N	\N	3	common bleeding of 3mm is enough	Y	5.0000	Y	\N	\N	5	PENDING ACCEPTANCE	\N	uat_artist1	38	Forward to Customer	33	44	120	Jun-2014	2	\N	\N	\N	\N	\N	\N	\N	\N
62	1	4	2014-06-21 22:17:30.99+08	esp_supervisor	\N	\N	Esp case	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	X	\N	N	\N	12.0000	6	NEW	\N	\N	41	\N	\N	\N	\N	Jun-2014	1	\N	\N	\N	\N	\N	\N	\N	\N
61	9	5	2014-06-21 21:57:49.784+08	uat_cust1	\N	\N	drawing artwork	\N	333	334	335	\N	\N	\N	\N	\N	\N	\N	10	10mm bleed	X	5.0000	\N	\N	\N	2	NEW	\N	uat_artist1	39	Revert	\N	\N	30	Jun-2014	3	\N	\N	\N	\N	\N	\N	\N	\N
77	12	2	2014-06-22 22:25:19.154+08	uat_customer3	\N	\N	Oder 2 by eng	\N	123	123	123	12	3123	123	132	123	123	\N	0	123	\N	123.0000	Y	\N	123.0000	6	NEW	\N	\N	38	\N	\N	\N	\N	Jun-2014	3	\N	\N	\N	\N	\N	\N	\N	\N
65	9	3	2014-06-22 15:06:57.158+08	uat_cust1	\N	\N	Test job	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	NEW	\N	\N	41	Revert	\N	\N	160	Jun-2014	2	\N	\N	\N	\N	\N	\N	\N	\N
68	1	2	2014-06-22 15:53:21.722+08	ysyow	\N	\N	Test 4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	NEW	\N	artist2	38	Assign	\N	\N	90	Jun-2014	2	\N	\N	\N	\N	\N	\N	\N	\N
66	9	4	2014-06-22 15:09:06.32+08	uat_cust1	\N	\N	test 2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Y	\N	\N	8	NEW	\N	artist2	40	Assign	\N	\N	200	Jun-2014	3	\N	\N	\N	\N	\N	\N	\N	\N
78	1	4	2014-06-22 22:25:20.028+08	ysyow	\N	\N	sad	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	NEW	\N	\N	38	\N	\N	\N	\N	Jun-2014	2	\N	\N	\N	\N	\N	\N	\N	\N
79	1	4	2014-06-22 22:26:19.002+08	ysyow	\N	\N	asddsa	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	NEW	\N	\N	39	\N	\N	\N	\N	Jun-2014	3	\N	\N	\N	\N	\N	\N	\N	\N
80	1	2	2014-06-22 22:27:13.903+08	ysyow	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Y	\N	\N	6	NEW	\N	\N	39	\N	\N	\N	\N	Jun-2014	1	\N	\N	\N	\N	\N	\N	\N	\N
81	1	3	2014-06-22 22:29:53.155+08	ysyow	\N	\N	12asd	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	NEW	\N	\N	38	\N	\N	\N	\N	Jun-2014	2	\N	\N	\N	\N	\N	\N	\N	\N
82	1	3	2014-06-22 22:34:15.393+08	ysyow	\N	\N	123	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	NEW	\N	artist2	41	Assign	\N	\N	160	Jun-2014	2	\N	\N	\N	\N	\N	\N	\N	\N
75	12	2	2014-06-22 22:19:07.119+08	uat_customer3	\N	\N	Case 1 - eng	\N	12	12	12	12	12	12	12	12	12	12	0	123	X	12.0000	Y	\N	123.0000	6	NEW	\N	artist1	38	Assign	\N	\N	160	Jun-2014	2	\N	\N	\N	\N	\N	\N	\N	\N
67	9	4	2014-06-22 15:09:52.378+08	uat_cust1	\N	\N	Test 3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	COMPLETED	\N	artist2	40	Accept	200	300	30	Jun-2014	2	\N	\N	\N	\N	\N	\N	\N	\N
69	9	2	2014-06-22 16:02:50.505+08	uat_customer1	\N	\N	job description - eng	\N	1	1	1	1	1	2	2	2	2	2	0	123	X	1.0000	Y	\N	123.0000	6	NEW	\N	\N	38	Revert	\N	\N	190	Jun-2014	2	\N	\N	\N	\N	\N	\N	\N	\N
84	1	3	2014-06-24 17:17:18.438+08	ysyow	\N	\N	sasda	\N	23	23	22	\N	\N	\N	\N	\N	\N	\N	0	asdsda	\N	\N	\N	\N	\N	6	NEW	\N	\N	41	\N	\N	\N	\N	Jun-2014	3	\N	\N	华语	\N	\N	\N	\N	\N
70	9	2	2014-06-22 18:37:00.386+08	uat_customer1	\N	\N	UAT job by ENG -1 	\N	132	123	13	123	\N	13	1	1	1	\N	3	123	X	1.0000	Y	\N	123.0000	6	NEW	\N	\N	38	Revert	\N	\N	190	Jun-2014	2	\N	\N	\N	\N	\N	\N	\N	\N
71	9	2	2014-06-22 19:08:37.392+08	uat_customer1	\N	\N	Test revert job	\N	123	1123	1321	321	123	132	1231	312	123	1231	0	1231	\N	\N	N	\N	1231.0000	6	NEW	\N	\N	38	\N	\N	\N	\N	Jun-2014	2	\N	\N	\N	\N	\N	\N	\N	\N
76	1	4	2014-06-22 22:22:00.011+08	ysyow	\N	\N	asd	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	NEW	\N	uat_artist2	38	Revert	25	25	160	Jun-2014	4	\N	\N	\N	\N	\N	\N	\N	\N
83	12	2	2014-06-22 22:42:05.965+08	uat_customer3	\N	\N	new job 3 by eng	\N	131	313	132	132	131231	313	132	13	1231	123	0	123	X	123.0000	Y	\N	11.0000	6	NEW	\N	uat_artist3	38	Revert	100	200	160	Jun-2014	1	\N	\N	\N	\N	\N	\N	\N	\N
111	1	\N	2014-06-24 18:38:42.963+08	ysyow	\N	\N	123213	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	REQUIREMENT VERIFICATION	\N	\N	41	\N	\N	\N	\N	Jun-2014	2	\N	\N	\N	\N	\N	\N	\N	\N
113	9	\N	2014-06-24 18:47:11.461+08	uat_customer1	\N	\N	Test job by Eng	\N	1234	\N	\N	\N	\N	123	132	\N	\N	\N	0	1234	\N	\N	\N	\N	\N	3	WORK IN PROGRESS	\N	uat_artist1	38	Assign	10	20	120	Jun-2014	1	12	3	\N	\N	\N	\N	\N	\N
114	9	\N	2014-06-24 19:06:51.238+08	uat_customer1	\N	\N	problem in QC	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	PENDING ACCEPTANCE	\N	uat_artist1	38	Forward to Customer	1	11	123	Jun-2014	2	\N	3	\N	\N	\N	\N	\N	\N
115	13	\N	2014-06-25 17:47:26.351+08	uat_customer4	\N	\N	No barcode, no master card, just drawing and typing-- 换了！！	\N	color1	colo2	1231	\N	\N	\N	\N	\N	\N	\N	0	no bleeding	\N	\N	Y	\N	\N	2	PENDING ARTIST ACKNOWLEDGE JOB	\N	\N	38	Revert	\N	\N	300	Jun-2014	3	\N	4	\N	\N	\N	\N	\N	\N
116	13	\N	2014-06-25 18:03:36.778+08	uat_customer4	\N	\N	Job with barcode	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Y	\N	\N	6	COMPLETED	\N	uat_artist4	\N	Accept	10	50	120	Jun-2014	1	\N	4	2014060001	1	\N	\N	\N	\N
119	13	\N	2014-06-26 11:01:54.669+08	uat_customer4	\N	\N	A job with a lot details	\N	123	\N	\N	\N	\N	123	\N	\N	\N	\N	0	123	H	\N	Y	\N	1.2200	6	WORK IN PROGRESS	\N	uat_artist4	\N	Assign	\N	\N	300	Jun-2014	1	123	4	2014060004	4	\N	\N	\N	\N
120	1	\N	2014-06-26 16:27:29.824+08	ysyow	\N	\N	YYYSSS	\N	3	2	\N	\N	\N	\N	\N	\N	\N	\N	3	sadsads	H	133.0000	Y	\N	\N	2	WORK IN PROGRESS	\N	artist2	\N	Assign	\N	\N	300	Jun-2014	2	\N	2	2014060005	5	25.0000	\N	\N	\N
122	9	\N	2014-07-01 05:16:12.552816+08	uat_customer1	\N	\N	Training1	\N	white	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	N	\N	\N	3	REQUIREMENT VERIFICATION	\N	\N	40	\N	\N	\N	250	Jun-2014	1	\N	3	2014070001	1	20.0000	\N	\N	\N
118	1	\N	2014-06-25 18:17:21.289+08	ysyow	\N	\N	Test yys	\N	sd	asd	dsa	\N	\N	\N	\N	\N	\N	\N	3	adssda	\N	\N	Y	\N	\N	2	PENDING CUSTOMER RESOLUTION	\N	\N	\N	Revert	\N	\N	300	Jun-2014	3	\N	1	2014060003	3	\N	\N	\N	\N
121	1	\N	2014-06-30 14:43:13.728+08	admin	\N	\N	test yys	\N	21	23	\N	\N	\N	123	231	231	2	\N	3	\N	V	23.0000	Y	\N	\N	3	PENDING ACCEPTANCE	\N	artist2	\N	Forward to Customer	23	23	300	Jun-2014	2	\N	1	2014060006	6	40.0000	\N	\N	\N
112	1	\N	2014-06-24 18:41:09.137+08	ysyow	\N	\N	test yys	\N	12	3	\N	\N	\N	1	3	4	5	\N	7	123132	\N	\N	\N	\N	\N	6	PENDING CUSTOMER RESOLUTION	\N	\N	41	Revert	\N	\N	11	Jun-2014	2	123	\N	\N	\N	\N	\N	\N	\N
117	13	\N	2014-06-25 18:09:59.535+08	uat_customer4	\N	\N	required master card!!	\N	123	123	123	\N	\N	\N	\N	\N	\N	\N	0	\N	H	1.2300	N	\N	1.2100	3	WORK IN PROGRESS	\N	uat_artist1	38	Revert	5	5	250	Jun-2014	3	123	4	2014060002	2	\N	\N	\N	\N
123	13	\N	2014-07-01 11:03:33.008717+08	uat_customer4	\N	\N	Testing Job 1	\N	red	blue	green	yellow	\N	45	45	45	45	\N	3	\N	H	20.0000	Y	\N	3.0000	1	REQUIREMENT VERIFICATION	\N	\N	39	\N	\N	\N	480	Jun-2014	4	65	4	2014070001	1	155.0000	\N	\N	\N
124	9	\N	2014-07-03 12:42:15.915+08	uat_customer1	\N	\N	Check fields	\N	12	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Y	\N	\N	2	WORK IN PROGRESS	\N	uat_artist1	\N	Assign	\N	\N	300	Jul-2014	1	\N	\N	2014070002	2	10.0000	IMGSETTLE	12	12
125	9	\N	2014-07-03 12:43:59.943+08	uat_customer1	\N	\N	new job exceed SLA	\N	12	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Y	\N	\N	2	WORK IN PROGRESS	\N	uat_artist1	\N	Assign	\N	\N	240	Jul-2014	1	\N	\N	2014070003	3	5.0000	\N	\N	\N
\.


--
-- Name: mjobsheet_js_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('mjobsheet_js_id_seq', 125, true);


--
-- Data for Name: mjscartonvalue; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) FROM stdin;
1	12.0000	x.E	6	4
2	2.0000	x.L1	6	4
3	3.0000	x.W1	6	4
4	1.0000	x.L2	6	4
5	1.0000	x.W2	6	4
6	1.0000	y.T	6	4
7	1.0000	y.H	6	4
8	1.0000	y.B	6	4
9	1.0000	x.1	5	6
10	1.0000	x.2	5	6
11	1.0000	x.3	5	6
12	1.0000	x.4	5	6
13	1.0000	x.5	5	6
14	11.0000	y.1	5	6
15	1.0000	y.2	5	6
16	1.0000	y.3	5	6
17	1.0000	x.1	38	7
18	2.0000	x.2	38	7
19	33.0000	x.3	38	7
20	4.0000	x.4	38	7
21	5.0000	x.5	38	7
22	6.0000	y.1	38	7
23	77.0000	y.2	38	7
24	8.0000	y.3	38	7
25	12.0000	x.1	38	9
26	2.0000	x.2	38	9
27	3.0000	x.3	38	9
28	44.0000	x.4	38	9
29	5.0000	x.5	38	9
30	6.0000	y.1	38	9
31	77.0000	y.2	38	9
32	8.0000	y.3	38	9
33	1.0000	x.1	38	10
34	1.0000	x.2	38	10
35	1.0000	x.3	38	10
36	1.0000	x.4	38	10
37	1.0000	x.5	38	10
38	1.0000	y.1	38	10
39	1.0000	y.2	38	10
40	1.0000	y.3	38	10
41	1.0000	x.1	38	11
42	2.0000	x.2	38	11
43	3.0000	x.3	38	11
44	4.0000	x.4	38	11
45	5.0000	x.5	38	11
46	66.0000	y.1	38	11
47	7.0000	y.2	38	11
48	8.0000	y.3	38	11
57	22.0000	x.1	38	13
58	2.0000	x.2	38	13
59	3.0000	x.3	38	13
60	4.0000	x.4	38	13
61	5.0000	x.5	38	13
62	6.0000	y.1	38	13
63	7.0000	y.2	38	13
64	8.0000	y.3	38	13
105	2.0000	x.1	38	12
106	1.0000	x.2	38	12
107	21.0000	x.3	38	12
108	1.0000	x.4	38	12
109	2.0000	x.5	38	12
110	1.0000	y.1	38	12
111	12.0000	y.2	38	12
112	1.0000	y.3	38	12
113	12.0000	x.1	38	14
114	123.0000	x.2	38	14
115	31.0000	x.3	38	14
116	12.0000	x.4	38	14
117	12.0000	x.5	38	14
118	1.0000	y.1	38	14
119	1.0000	y.2	38	14
120	1.0000	y.3	38	14
121	1.0000	x.E	39	15
122	1.0000	x.L1	39	15
123	1.0000	x.W1	39	15
124	11.0000	x.L2	39	15
125	1.0000	x.W2	39	15
126	1.0000	y.T	39	15
127	1.0000	y.H	39	15
128	1.0000	y.B	39	15
137	1.0000	x.1	38	17
138	2.0000	x.2	38	17
139	3.0000	x.3	38	17
140	4.0000	x.4	38	17
141	5.0000	x.5	38	17
142	6.0000	y.1	38	17
143	7.0000	y.2	38	17
144	8.0000	y.3	38	17
153	3.3000	x.E	39	18
154	4.4000	x.L1	39	18
155	5.5000	x.W1	39	18
156	6.6000	x.L2	39	18
157	7.7000	x.W2	39	18
158	8.8880	y.T	39	18
159	9.9000	y.H	39	18
160	10.1000	y.B	39	18
161	1.0000	x.1	38	16
162	2.0000	x.2	38	16
163	3.0000	x.3	38	16
164	4.0000	x.4	38	16
165	5.0000	x.5	38	16
166	6.0000	y.1	38	16
167	7.0000	y.2	38	16
168	8.0000	y.3	38	16
169	1.0000	x.1	38	19
170	1.0000	x.2	38	19
171	21.0000	x.3	38	19
172	312.0000	x.4	38	19
173	1312.0000	x.5	38	19
174	3123.0000	y.1	38	19
175	123.0000	y.2	38	19
176	2.0000	y.3	38	19
177	1.0000	x.1	38	20
178	2.0000	x.2	38	20
179	3.0000	x.3	38	20
180	4.0000	x.4	38	20
181	5.0000	x.5	38	20
182	6.0000	y.1	38	20
183	7.0000	y.2	38	20
184	8.0000	y.3	38	20
185	2.0000	x.1	38	21
186	1.0000	x.2	38	21
187	31.0000	x.3	38	21
188	1.0000	x.4	38	21
189	5.0000	x.5	38	21
190	6.0000	y.1	38	21
191	1.0000	y.2	38	21
192	2.0000	y.3	38	21
193	1.0000	x.E	39	22
194	2.0000	x.L1	39	22
195	3.0000	x.W1	39	22
196	4.0000	x.L2	39	22
197	5.0000	x.W2	39	22
198	6.0000	y.T	39	22
199	7.0000	y.H	39	22
200	8.0000	y.B	39	22
201	1.0000	x.1	38	23
202	22.0000	x.2	38	23
203	3.0000	x.3	38	23
204	4.0000	x.4	38	23
205	5.0000	x.5	38	23
206	6.0000	y.1	38	23
207	7.0000	y.2	38	23
208	88.0000	y.3	38	23
217	1.0000	x.1	38	25
218	2.0000	x.2	38	25
219	3.0000	x.3	38	25
220	4.0000	x.4	38	25
221	5.0000	x.5	38	25
222	6.0000	y.1	38	25
223	7.0000	y.2	38	25
224	8.0000	y.3	38	25
225	1.0000	x.1	38	26
226	2.0000	x.2	38	26
227	3.0000	x.3	38	26
228	4.0000	x.4	38	26
229	5.0000	x.5	38	26
230	6.0000	y.1	38	26
231	7.0000	y.2	38	26
232	8.0000	y.3	38	26
233	1.0000	x.1	38	27
234	2.0000	x.2	38	27
235	3.0000	x.3	38	27
236	4.0000	x.4	38	27
237	5.0000	x.5	38	27
238	6.0000	y.1	38	27
239	7.0000	y.2	38	27
240	8.0000	y.3	38	27
241	1.0000	x.1	38	28
242	2.0000	x.2	38	28
243	3.0000	x.3	38	28
244	4.0000	x.4	38	28
245	5.0000	x.5	38	28
246	6.0000	y.1	38	28
247	7.0000	y.2	38	28
248	8.0000	y.3	38	28
249	1.0000	x.1	38	29
250	2.0000	x.2	38	29
251	3.0000	x.3	38	29
252	4.0000	x.4	38	29
253	5.0000	x.5	38	29
254	6.0000	y.1	38	29
255	7.0000	y.2	38	29
256	8.0000	y.3	38	29
257	1.0000	x.1	38	30
258	2.0000	x.2	38	30
259	3.0000	x.3	38	30
260	4.0000	x.4	38	30
261	5.0000	x.5	38	30
262	6.0000	y.1	38	30
263	7.0000	y.2	38	30
264	8.0000	y.3	38	30
265	1.0000	x.1	38	31
266	2.0000	x.2	38	31
267	3.0000	x.3	38	31
268	4.0000	x.4	38	31
269	5.0000	x.5	38	31
270	6.0000	y.1	38	31
271	7.0000	y.2	38	31
272	8.0000	y.3	38	31
273	1.0000	x.1	38	32
274	2.0000	x.2	38	32
275	3.0000	x.3	38	32
276	4.0000	x.4	38	32
277	5.0000	x.5	38	32
278	6.0000	y.1	38	32
279	7.0000	y.2	38	32
280	8.0000	y.3	38	32
281	1.0000	x.1	38	33
282	2.0000	x.2	38	33
283	3.0000	x.3	38	33
284	4.0000	x.4	38	33
285	5.0000	x.5	38	33
286	5.0000	y.1	38	33
287	6.0000	y.2	38	33
288	7.0000	y.3	38	33
289	12.0000	x.1	38	34
290	3.0000	x.2	38	34
291	4.0000	x.3	38	34
292	12.0000	x.4	38	34
293	12.0000	x.5	38	34
294	1.0000	y.1	38	34
295	12.0000	y.2	38	34
296	21.0000	y.3	38	34
305	1.0000	x.1	38	35
306	2.0000	x.2	38	35
307	3.0000	x.3	38	35
308	4.0000	x.4	38	35
309	5.0000	x.5	38	35
310	66.0000	y.1	38	35
311	77.0000	y.2	38	35
312	8.0000	y.3	38	35
313	1.0000	x.1	38	36
314	2.0000	x.2	38	36
315	3.0000	x.3	38	36
316	4.0000	x.4	38	36
317	5.0000	x.5	38	36
318	6.0000	y.1	38	36
319	7.0000	y.2	38	36
320	8.0000	y.3	38	36
321	12.0000	x.1	38	46
322	2.0000	x.2	38	46
323	3.3300	x.3	38	46
324	2.0000	x.4	38	46
325	1.0000	x.5	38	46
326	2.0000	y.1	38	46
327	2.0000	y.2	38	46
328	3.0000	y.3	38	46
329	123.0000	x.1	38	47
330	41.0000	x.2	38	47
331	123.0000	x.3	38	47
332	132.0000	x.4	38	47
333	123.0000	x.5	38	47
334	132.0000	y.1	38	47
335	123.0000	y.2	38	47
336	13.0000	y.3	38	47
337	3.0000	x.1	38	57
338	2.0000	x.2	38	57
339	4.0000	x.3	38	57
340	5.0000	x.4	38	57
341	2.0000	x.5	38	57
342	4.0000	y.1	38	57
343	2.0000	y.2	38	57
344	3.0000	y.3	38	57
345	3.0000	x.1	38	58
346	4.0000	x.2	38	58
347	5.0000	x.3	38	58
348	6.0000	x.4	38	58
349	7.0000	x.5	38	58
350	8.0000	y.1	38	58
351	9.0000	y.2	38	58
352	10.0000	y.3	38	58
369	3.0000	x.E	39	59
370	3.0000	x.1	40	60
65	2.0000	x.E	39	59
66	2.0000	x.L1	39	59
67	1.0000	x.W1	39	59
68	1.0000	x.L2	39	59
69	1.0000	x.W2	39	59
70	22.0000	y.T	39	59
71	2.0000	y.H	39	59
72	2.0000	y.B	39	59
371	3.0000	x.E	39	61
372	4.0000	x.L1	39	61
373	5.0000	x.W1	39	61
374	6.0000	x.L2	39	61
375	7.0000	x.W2	39	61
376	8.0000	y.T	39	61
377	9.0000	y.H	39	61
378	10.0000	y.B	39	61
379	12.0000	x1	41	62
380	12.0000	x2	41	62
381	1.0000	x3	41	62
382	1.0000	y1	41	62
383	33.0000	x.E	39	63
384	44.0000	x.L1	39	63
385	55.0000	x.W1	39	63
386	66.0000	x.L2	39	63
387	77.0000	x.W2	39	63
388	88.0000	y.T	39	63
389	99.0000	y.H	39	63
390	0.0000	y.B	39	63
391	0.0000	x.1	38	64
392	11.0000	x.2	38	64
393	22.0000	x.3	38	64
394	33.0000	x.4	38	64
395	44.0000	x.5	38	64
396	55.0000	y.1	38	64
397	66.0000	y.2	38	64
398	77.0000	y.3	38	64
403	33.0000	x.1	40	66
404	3.0000	x.2	40	66
405	2.0000	x.3	40	66
406	4.0000	x.4	40	66
407	5.0000	x.5	40	66
408	6.0000	y.1	40	66
409	3.0000	y.2	40	66
410	2.0000	y.3	40	66
411	2.0000	x.1	40	67
412	3.0000	x.2	40	67
413	4.0000	x.3	40	67
414	3.0000	x.4	40	67
415	5.0000	x.5	40	67
416	2.0000	y.1	40	67
417	5.0000	y.2	40	67
418	2.0000	y.3	40	67
419	1.0000	x.1	38	68
420	22.0000	x.2	38	68
421	34.0000	x.3	38	68
422	5.0000	x.4	38	68
423	3.0000	x.5	38	68
424	4.0000	y.1	38	68
425	2.0000	y.2	38	68
426	5.0000	y.3	38	68
427	3.0000	x1	41	65
428	1.0000	x.1	38	69
429	2.0000	x.2	38	69
430	3.0000	x.3	38	69
431	4.0000	x.4	38	69
432	5.0000	x.5	38	69
433	6.0000	y.1	38	69
434	7.0000	y.2	38	69
435	8.0000	y.3	38	69
444	1.0000	x.1	38	70
445	12.0000	x.1	38	71
446	12.0000	x.2	38	71
447	1.0000	x.3	38	71
448	12.0000	x.4	38	71
449	132.0000	x.5	38	71
450	123.0000	y.1	38	71
451	123.0000	y.2	38	71
452	13.0000	y.3	38	71
461	123.0000	x.1	38	72
463	5.0000	x1	41	74
464	5.0000	x2	41	74
465	23.0000	x3	41	74
466	14.0000	y1	41	74
467	2.0000	x.1	38	75
468	1.0000	x.2	38	75
469	3.0000	x.3	38	75
470	5.0000	x.4	38	75
471	4.0000	x.5	38	75
472	12.0000	y.1	38	75
473	12.0000	y.2	38	75
474	12.0000	y.3	38	75
475	1.0000	x.1	38	76
476	1.0000	x.2	38	76
477	1.0000	x.3	38	76
478	1.0000	x.4	38	76
479	1.0000	x.5	38	76
480	1.0000	y.1	38	76
481	1.0000	y.2	38	76
482	1.0000	y.3	38	76
483	122.0000	x.1	38	77
484	3.0000	x.2	38	77
485	4.0000	x.3	38	77
486	12.0000	x.4	38	77
487	12.0000	x.5	38	77
488	123.0000	y.1	38	77
489	123.0000	y.2	38	77
490	123.0000	y.3	38	77
491	1.0000	x.1	38	78
492	1.0000	x.2	38	78
493	1.0000	x.3	38	78
494	1.0000	x.4	38	78
495	1.0000	x.5	38	78
496	1.0000	y.1	38	78
497	1.0000	y.2	38	78
498	1.0000	y.3	38	78
499	1.0000	x.E	39	79
500	1.0000	x.L1	39	79
501	1.0000	x.W1	39	79
502	1.0000	x.L2	39	79
503	1.0000	x.W2	39	79
504	1.0000	y.T	39	79
505	1.0000	y.H	39	79
506	1.0000	y.B	39	79
507	1.0000	x.E	39	80
508	1.0000	x.L1	39	80
509	1.0000	x.W1	39	80
510	11.0000	x.L2	39	80
511	1.0000	x.W2	39	80
512	1.0000	y.T	39	80
513	11.0000	y.H	39	80
514	1.0000	y.B	39	80
515	1.0000	x.1	38	81
516	1.0000	x.2	38	81
517	1.0000	x.3	38	81
518	1.0000	x.4	38	81
519	1.0000	x.5	38	81
520	1.0000	y.1	38	81
521	1.0000	y.2	38	81
522	1.0000	y.3	38	81
523	1.0000	x1	41	82
524	1.0000	x2	41	82
525	1.0000	x3	41	82
526	1.0000	y1	41	82
527	123.0000	x.1	38	83
528	1.0000	x.2	38	83
529	2.0000	x.3	38	83
530	3.0000	x.4	38	83
531	4.0000	x.5	38	83
532	1.0000	y.1	38	83
533	1.0000	y.2	38	83
534	12.0000	y.3	38	83
535	1.0000	x1	41	84
536	2.0000	x2	41	84
537	3.0000	x3	41	84
538	4.0000	y1	41	84
559	1.0000	x1	41	111
560	2.0000	x2	41	111
561	3.0000	x3	41	111
562	4.0000	y1	41	111
567	12.0000	x.1	38	113
568	12.0000	x.2	38	113
569	12.0000	x.3	38	113
570	12.0000	x.4	38	113
571	12.0000	x.5	38	113
572	12.0000	y.1	38	113
573	12.0000	y.2	38	113
574	12.0000	y.3	38	113
579	12.0000	x1	41	112
580	3.0000	x2	41	112
581	123.0000	x3	41	112
582	23.0000	y1	41	112
583	1.0000	x.1	38	114
584	2.0000	x.2	38	114
585	3.0000	x.3	38	114
586	4.0000	x.4	38	114
587	5.0000	x.5	38	114
588	6.0000	y.1	38	114
589	7.0000	y.2	38	114
590	8.0000	y.3	38	114
591	1.2100	x.1	38	117
592	12.0000	x.2	38	117
593	12.1200	x.3	38	117
594	12.0000	x.4	38	117
595	1.0000	x.5	38	117
596	2.0000	y.1	38	117
597	2.0000	y.2	38	117
598	3.0000	y.3	38	117
599	1.0000	x.1	38	115
600	2.0000	x.2	38	115
601	3.0000	x.3	38	115
602	4.0000	x.4	38	115
603	5.0000	x.5	38	115
604	6.0000	y.1	38	115
605	7.0000	y.2	38	115
606	8.0000	y.3	38	115
607	5.0000	x.1	40	122
608	5.0000	x.2	40	122
609	5.0000	x.3	40	122
610	5.0000	x.4	40	122
611	5.0000	x.5	40	122
612	5.0000	y.1	40	122
613	5.0000	y.2	40	122
614	5.0000	y.3	40	122
615	10.0000	x.E	39	123
616	10.0000	x.L1	39	123
617	10.0000	x.W1	39	123
618	10.0000	x.L2	39	123
619	10.0000	x.W2	39	123
620	10.0000	y.T	39	123
621	10.0000	y.H	39	123
622	10.0000	y.B	39	123
\.


--
-- Name: mjscartonvalue_caval_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('mjscartonvalue_caval_id_seq', 622, true);


--
-- Data for Name: mmailtemplate; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY mmailtemplate (mt_code, mt_desc, mt_recipient_to, mt_recipient_cc, mt_subject, mt_content, mt_status, mt_internal_userid) FROM stdin;
NOTIFY_LATE_REQ_VER	Late Requirement Verification Notification Email	supervisor@gmail.com	supervisor@gmail.com	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "[[JS_JOB_DESCRIPTION]]" job is still pending since [[REQ_VER_ACTIVITY_START]].</p><p><br></p>	ACTIVE	uat_supervisor1
NOTIFY_LATE_ACKNOWLEDGE	Late Job Acknowledgement Notification Email	\N	[[JS_ASSIGNED_ARTIST_EMAIL]]	[MOIRE] Late Job Acknowledgement Notification	<p>Dear Supervisor,</p><p>This email is to notify that the "[[JS_JOB_DESCRIPTION]]" job is still pending acknowledgement from [[JS_ASSIGN_ARTIST_NAME]] since [[ACKNOWLEDGE_ACTIVITY_START]].</p><div><br></div>	ACTIVE	supervisor
NOTIFY_LATE_WIP	Late Job WIP Notification Email	\N	[[JS_ASSIGNED_ARTIST_EMAIL]]	[MOIRE] Late Job WIP Notification	<p>Dear Manager and Supervisor,</p><p>This email is to notify that the "[[JS_JOB_DESCRIPTION]]" job is still WIP from [[JS_ASSIGN_ARTIST_NAME]] since [[WIP_ACTIVITY_START]].</p><div><br></div>	ACTIVE	supervisor
NOTIFY_LATE_QC	Late QC Notification Email	\N	\N	[MOIRE] Late Job QC Notification	<p>Dear Manager and Supervisor,</p><p>This email is to notify that the "[[JS_JOB_DESCRIPTION]]" job is still pending QC since [[QC_ACTIVITY_START]].</p><div><br></div>	ACTIVE	supervisor
NOTIFY_CUSTOMER_ACK	Notify Customer Job Has Been Acknowledged	[[JS_REQUESTOR_EMAIL]]	[[JS_ASSIGNED_ARTIST_EMAIL]], dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com, dannyfoo@phiorion.com	[MOIRE] Job Acknowledgement	<p>Dear [[JS_REQUESTOR_NAME]],</p><p>This email is to inform that your job request "[[JS_JOB_DESCRIPTION]]" is now confirmed and acknowledged. </p><p><br></p><p>Estimate Time Required : [[JS_REQUIRE_MIN]] (Working hour)</p><p>Estimate Completion Time : [[JS_EST_COMPLETE_TIME]]</p><div><br></div>	ACTIVE	[[JS_REQUESTOR_USERID]]
\.


--
-- Data for Name: mtnc; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY mtnc (tc_id, tc_text) FROM stdin;
1	<div><h5 style="line-height: 20px; margin-left: 10px;"><span style="font-family: Arial;">SAMPLE ANSWERS LTD (INCORPORATING PRIME PROSPECTS) – END USER LICENCE TERMS<br></span><strong style="color: rgb(10, 80, 161); font-family: Arial;">1) DEFINITIONS<br></strong><span style="font-family: Arial;">“Goods” means any goods and/or services provided by the Company as ordered by the Client<br></span><span style="font-family: Arial;">“ Company” means Sample Answers Ltd. incorporating Prime Prospects.<br></span><span style="font-family: Arial;">“ Client” means the person, firm or company placing an order with the Company.<br></span><strong style="color: rgb(10, 80, 161); font-family: Arial;">2) APPLICATION<br></strong><span style="font-family: Arial;">These terms and conditions apply to any provision of services or materials by the Company to the Client.<br></span><strong style="color: rgb(10, 80, 161); font-family: Arial;">3) FORMATION OF CONTRACT<br></strong><span style="font-family: Arial;">All Goods sold by the Company are sold subject to the Company’s standard terms and conditions (as detailed below) which form part of the Client’s contract with the Company. Terms and conditions on the Client’s order form or other similar document shall not be binding on the Company.<br></span><strong style="color: rgb(10, 80, 161); font-family: Arial;">4) QUOTATIONS<br></strong><span style="font-family: Arial;">The prices, quantities and delivery time stated in any quotation are not binding on the Company. They are commercial estimates only which the Company will make reasonable efforts to achieve.<br></span><strong style="color: rgb(10, 80, 161); font-family: Arial;">5) ORDERS<br></strong><span style="font-family: Arial;">5.1 Orders will be deemed to have been placed when an email confirmation has been received from a responsible executive of the client company.<br></span><span style="font-family: Arial;">5.2 For email invitations, online fulfilment projects and direct marketing files (as provided by Prime Prospects) it is a requirement of the Company, that the email piece, online form or mail piece shall be approved by the company before an order can be confirmed and any data despatched.<br></span><strong style="color: rgb(10, 80, 161); font-family: Arial;">6) RIGHT TO SUB CONTRACT<br></strong><span style="font-family: Arial;">Unless otherwise agreed the Company shall be entitled to sub-contract all or any part of the work.<br></span><strong style="color: rgb(10, 80, 161); font-family: Arial;">7) TIMETABLE<br></strong><span style="font-family: Arial;">The Company will use its best endeavours to supply the services or materials within the quoted time (normally within a maximum of seven days from order or otherwise as agreed) but time will not be of the essence within the contract.<br></span><strong style="color: rgb(10, 80, 161); font-family: Arial;">8 ) COPYRIGHT<br></strong><span style="font-family: Arial;">The Client acknowledges that the rights to the Goods are owned by the Company and that the Goods are protected by United Kingdom copyright laws, international treaty provisions and all other applicable national laws.<br></span><strong style="color: rgb(10, 80, 161); font-family: Arial;">9) RISK OF LOSS<br></strong><span style="font-family: Arial;">The risk of loss or damage to the Goods shall pass to the Client upon delivery of the Goods.<br></span><strong style="color: rgb(10, 80, 161); font-family: Arial;">10) PAYMENTS<br></strong><span style="font-family: Arial;">10.1 New clients or other clients out of terms may be expected to pay in advance for their services.<br></span><span style="font-family: Arial;">10.2 All other invoices issued by the Company shall be paid by the Client within thirty (30) days of the date of invoice unless otherwise agreed in writing by the Company. In the event of late payment, the Company may charge interest on the amount outstanding before and after judgement at the rate of five (5) percent above the Base Rate of Barclays Bank plc in force from the due date until the date of payment. In addition, invoices unpaid for more than 60 days after the invoice date will incur a surcharge of either £30 or 5% of the outstanding amount, whichever sum is greater.<br></span><span style="font-family: Arial;">10.3 If any amount of an invoice is disputed then the Client shall inform the Company of the grounds for such dispute within seven days of delivery of the goods and shall pay to the Company the value of the invoice less the disputed amount in accordance with these payment terms. Once settlement of the dispute has been agreed, any sum then outstanding shall also be payable in accordance with these payment terms.<br></span><span style="font-family: Arial;">10.4 The Company reserves the right to increase a quoted fee in the event that the client requests a variation to the work agreed.<br></span><strong style="color: rgb(10, 80, 161); font-family: Arial;">11) CANCELLATION<br></strong><span style="font-family: Arial;">In view of the nature of the service, any order – once confirmed by the Company – is not cancellable. Cancellation of the Order by the Client will only be accepted on condition that any costs, charges and expenses already incurred, including any charges that will be levied by a sub-contractor on account of their expenses, work or cancellation conditions will be reimbursed to the Company forthwith.<br></span><strong style="color: rgb(10, 80, 161); font-family: Arial;">12) DELIVERY<br></strong><span style="font-family: Arial;">12.1 The majority of services as supplied by the company are despatched electronically by email and shall be deemed as having been delivered when the email has been opened by the client.<br></span><span style="font-family: Arial;">12.2 The Company reserves the right to substitute conventional delivery methods without notice or penalty should electronic despatch prove inconvenient; in which case delivery by the Company will be deemed to have taken place when the materials are handed to the custody of the Client at his premises or to a deputed messenger or courier when posted. The Company will be entitled to charge the Client for any expenses of delivery other than normal postage charges.<br></span><strong style="color: rgb(10, 80, 161); font-family: Arial;">13) NOTICE<br></strong><span style="font-family: Arial;">All written notices to be served on or given to the client shall be sent or delivered to the client’s principle place of business and shall be treated as having been given upon receipt.<br></span><strong style="color: rgb(10, 80, 161); font-family: Arial;">14) LOSS OR DAMAGE TO SUPPLIES<br></strong><span style="font-family: Arial;">The Company will take all reasonable steps to ensure the protection from loss, damage or destruction of the services or materials it supplies to the Client (or which may be received from the Client).<br></span><strong style="color: rgb(10, 80, 161); font-family: Arial;">15) USAGE OF THE SERVICES OR MATERIALS<br></strong><span style="font-family: Arial;">Unless otherwise agreed in writing by the Company, the Client (and their clients) shall be entitled to use the services and materials provided as follows: .<br></span><span style="font-family: Arial;">15.1 All files of Consumer and Business data records are for single use and for use within a period of not more than 6 months from date of delivery.<br></span><span style="font-family: Arial;">15.2 Files of Samples of Consumer or Businesses data records are provided solely for the purpose of conducting market research to be carried out in conformity with the recognised ESOMAR/MRS Code of Conduct of the market research industry. The Client shall not otherwise be entitled to store, or to pass on (whether to his/her client or other person) or make any other use of these services and materials.<br></span><span style="font-family: Arial;">15.3 The Client shall bear responsibility for ensuring that all usage of information contained within any service as provided by Sample Answers and Prime Prospects is in accordance with, and does not contravene, any Data Protection or other laws, regulations or other trade customs and practices. The Company bears no liability for any omissions or faults in these respects.<br></span><strong style="color: rgb(10, 80, 161); font-family: Arial;">16) CONFIDENTIALITY<br></strong><span style="font-family: Arial;">Both parties shall maintain strict confidence and shall not disclose to any third party any information or material relating to the other or the other’s business which comes into that party’s possession and shall not use such information and material without written permission by the other party. This provision shall not, however, apply to information or material which is, or becomes, public knowledge by means other than by breach by a party to this clause.<br></span><strong style="color: rgb(10, 80, 161); font-family: Arial;">17) EMPLOYMENT OF PERSONNEL<br></strong><span style="font-family: Arial;">Subject to the prior written consent of the Company the Client shall not induce to employ, whether as an employee, agent, partner or consultant, any employee of the Company directly associated with delivery of the Goods.<br></span><strong style="color: rgb(10, 80, 161); font-family: Arial;">18) WARRANTY<br></strong><span style="font-family: Arial;">18.1 The Company warrants that it has the right to provide the Goods but otherwise the Goods are provided on an “as-is” basis without warranty of any kind, express or implied, oral or written including, without limitation, the implied conditions of merchantable quality, fitness for purpose and description, all of which are specifically and unreservedly excluded. In particular, but without limitation, no warranty is given that the Goods are suitable for the purposes intended by the Client.<br></span><span style="font-family: Arial;">18.2 The Company warrants that the Goods will be supplied using reasonable care and skill. The Company does not warrant that the Goods supplied are error-free, accurate or complete.<br></span><span style="font-family: Arial;">18.3 Both parties warrant that they are registered under the Data Protection Act in respect of the collection, processing and use of the Goods. Each party will comply with the Act including but not limited to its obligations in respect of any personal data which it may supply to or receive from the other party.<br></span><span style="font-family: Arial;">18.4 The Client acknowledges that the Company is required to uphold at all times, in letter and in spirit, the British Codes of Advertising and Sales Promotion.<br></span><strong style="color: rgb(10, 80, 161); font-family: Arial;">19) LIMITATION OF LIABILITY<br></strong><span style="font-family: Arial;">19.1 The Company shall not be liable for any claim arising out of the performance, non-performance, delay in delivery of or defect in the Goods nor for any special, indirect, economic or consequential loss or damage howsoever arising or howsoever caused (including loss of profit or loss of revenue) whether from negligence or otherwise in connection with the supply, functioning or use of the Goods. Any liability of the Company shall in any event be limited to the licence fees paid by the Client in the year in which the event of default arises.<br></span><span style="font-family: Arial;">19.2 Nothing herein shall limit either party’s liability for death or personal injury arising from the proven negligence by itself or its employees or agents.<br></span><span style="font-family: Arial;">19.3 The Client shall fully indemnify the Company against any liability to third parties arising out of the Client’s use of the Goods.<br></span><strong style="color: rgb(10, 80, 161); font-family: Arial;">20) FORCE MAJEURE<br></strong><span style="font-family: Arial;">The Company will not be liable to the Client for any loss or damage suffered by the Client as a direct result of the Company, its sub-contractors or the list-owner from whom the sample or other service or material is derived being unable to perform the Contract in the way agreed by reason of cause beyond its control including Act of God, accident, war, riot, lockout, strike, flood, fire, power failure, breakdown of plant or machinery, delay in transit, postal delay, or any other unexpected or exceptional cause or circumstance.<br></span><strong style="color: rgb(10, 80, 161); font-family: Arial;">21) GOVERNING LAW<br></strong><span style="font-family: Arial;">These Terms of Trading shall be subject to and construed in accordance with the laws of England and the parties hereby submit to the exclusive jurisdiction of the English courts.</span></h5></div> 
\.


--
-- Name: mtnc_tc_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('mtnc_tc_id_seq', 1, true);


--
-- Data for Name: mtncacceptance; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY mtncacceptance (tca_tcid, tca_userid, tca_date, tca_result) FROM stdin;
1	uat_customer4	2014-06-30 17:54:49.327589+08	AGREE
1	uat_customer2	2014-07-01 04:36:16.873047+08	AGREE
1	uat_customer1	2014-07-01 04:36:42.985212+08	AGREE
\.


--
-- Data for Name: pndaddress; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY pndaddress (ad_id, ad_refid, ad_reftype, ad_order, ad_type, ad_addr_line1, ad_addr_line2, ad_addr_line3, ad_addr_line4, ad_addr_line5, ad_postcode, ad_city, ad_state, ad_concode, ad_remark, ad_status) FROM stdin;
\.


--
-- Name: pndaddress_ad_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('pndaddress_ad_id_seq', 1, false);


--
-- Data for Name: pndartistskill; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY pndartistskill (as_userid, as_skill) FROM stdin;
\.


--
-- Data for Name: pndcontact; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY pndcontact (ct_id, ct_refid, ct_reftype, ct_name, ct_email, ct_concode) FROM stdin;
2	3	ORG_ID	Jeremy	dannyfoo@phiorion.com	\N
3	4	ORG_ID	Mohamad	dannyfoo@phiorion.com	\N
4	5	ORG_ID	Justin	dannyfoo@phiorion.com	\N
5	6	ORG_ID	Alvin	dannyfoo@phiorion.com	\N
6	7	ORG_ID	Tracy	dannyfoo@phiorion.com	\N
1	10	ORG_ID	Fong Contact	dannyfoo@phiorion.com	MY
\.


--
-- Name: pndcontact_ct_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('pndcontact_ct_id_seq', 6, true);


--
-- Name: pndjoboutput_jo_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('pndjoboutput_jo_id_seq', 100, true);


--
-- Data for Name: pndphone; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY pndphone (ph_id, ph_refid, ph_reftype, ph_order, ph_type, ph_number, ph_extension, ph_remark, ph_status) FROM stdin;
\.


--
-- Name: pndphone_ph_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('pndphone_ph_id_seq', 1, false);


--
-- Name: const_fcdoc_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcdoc
    ADD CONSTRAINT const_fcdoc_prikey PRIMARY KEY (fd_id);


--
-- Name: const_fcemailsetting_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcemailsetting
    ADD CONSTRAINT const_fcemailsetting_prikey PRIMARY KEY (ms_id);


--
-- Name: const_fclang_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fclang
    ADD CONSTRAINT const_fclang_prikey PRIMARY KEY (lang_code);


--
-- Name: const_fclocale_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fclocale
    ADD CONSTRAINT const_fclocale_prikey PRIMARY KEY (lc_code);


--
-- Name: const_fclocaleholiday_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fclocaleholiday
    ADD CONSTRAINT const_fclocaleholiday_prikey PRIMARY KEY (lch_id);


--
-- Name: const_fclocaleworkinghour_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fclocaleworkinghour
    ADD CONSTRAINT const_fclocaleworkinghour_prikey PRIMARY KEY (lcw_id);


--
-- Name: const_fclocaleworkinghour_unikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fclocaleworkinghour
    ADD CONSTRAINT const_fclocaleworkinghour_unikey UNIQUE (lcw_lccode, lcw_day);


--
-- Name: const_fclog_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fclog
    ADD CONSTRAINT const_fclog_prikey PRIMARY KEY (log_id);


--
-- Name: const_fcpermission_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpermission
    ADD CONSTRAINT const_fcpermission_prikey PRIMARY KEY (pms_code);


--
-- Name: const_fcpmactivity_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpmactivity
    ADD CONSTRAINT const_fcpmactivity_prikey PRIMARY KEY (pmat_id);


--
-- Name: const_fcpmcase_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpmcase
    ADD CONSTRAINT const_fcpmcase_prikey PRIMARY KEY (pmc_id);


--
-- Name: const_fcpmcasecomment_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpmcasecomment
    ADD CONSTRAINT const_fcpmcasecomment_prikey PRIMARY KEY (pmcc_id);


--
-- Name: const_fcpmcasecommentread_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpmcasecommentread
    ADD CONSTRAINT const_fcpmcasecommentread_prikey PRIMARY KEY (pmcr_id);


--
-- Name: const_fcpmcasecommentread_unikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpmcasecommentread
    ADD CONSTRAINT const_fcpmcasecommentread_unikey UNIQUE (pmcr_pmccid, pmcr_read_by);


--
-- Name: const_fcpmcaseflag_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpmcaseflag
    ADD CONSTRAINT const_fcpmcaseflag_prikey PRIMARY KEY (pmcf_id);


--
-- Name: const_fcpmcaseflag_unikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpmcaseflag
    ADD CONSTRAINT const_fcpmcaseflag_unikey UNIQUE (pmcf_pmcid, pmcf_flag_by);


--
-- Name: const_fcpmcaseflow_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpmcaseflow
    ADD CONSTRAINT const_fcpmcaseflow_prikey PRIMARY KEY (pmf_id);


--
-- Name: const_fcpmcaseflowassign_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpmcaseflowassign
    ADD CONSTRAINT const_fcpmcaseflowassign_prikey PRIMARY KEY (pmfa_id);


--
-- Name: const_fcpmcasetype_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpmcasetype
    ADD CONSTRAINT const_fcpmcasetype_prikey PRIMARY KEY (pmct_code);


--
-- Name: const_fcpmconnector_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpmconnector
    ADD CONSTRAINT const_fcpmconnector_prikey PRIMARY KEY (pmcn_id);


--
-- Name: const_fcpmconnector_unikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpmconnector
    ADD CONSTRAINT const_fcpmconnector_unikey UNIQUE (pmcn_from_type, pmcn_from_id, pmcn_to_type, pmcn_to_id);


--
-- Name: const_fcpmevent_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpmevent
    ADD CONSTRAINT const_fcpmevent_prikey PRIMARY KEY (pmev_id);


--
-- Name: const_fcpmgateway_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpmgateway
    ADD CONSTRAINT const_fcpmgateway_prikey PRIMARY KEY (pmgw_id);


--
-- Name: const_fcpmswimlane_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpmswimlane
    ADD CONSTRAINT const_fcpmswimlane_prikey PRIMARY KEY (pmsl_id);


--
-- Name: const_fcpmswimlanesetup_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpmswimlanesetup
    ADD CONSTRAINT const_fcpmswimlanesetup_prikey PRIMARY KEY (pmss_id);


--
-- Name: const_fcpmworkflow_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpmworkflow
    ADD CONSTRAINT const_fcpmworkflow_prikey PRIMARY KEY (pmwf_id);


--
-- Name: const_fcrule_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcrule
    ADD CONSTRAINT const_fcrule_prikey PRIMARY KEY (ru_id);


--
-- Name: const_fcudv_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcudv
    ADD CONSTRAINT const_fcudv_prikey PRIMARY KEY (udv_code);


--
-- Name: const_fcuserdiary_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcuserdiary
    ADD CONSTRAINT const_fcuserdiary_prikey PRIMARY KEY (di_id);


--
-- Name: const_hlookup_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fclookup
    ADD CONSTRAINT const_hlookup_prikey PRIMARY KEY (lu_id);


--
-- Name: const_hlookup_unikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fclookup
    ADD CONSTRAINT const_hlookup_unikey UNIQUE (lu_cat, lu_code);


--
-- Name: const_martistskill_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY martistskill
    ADD CONSTRAINT const_martistskill_prikey PRIMARY KEY (ma_id);


--
-- Name: const_mcarton_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY mcarton
    ADD CONSTRAINT const_mcarton_prikey PRIMARY KEY (car_id);


--
-- Name: const_mcustmachine_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY mcustmachine
    ADD CONSTRAINT const_mcustmachine_prikey PRIMARY KEY (mc_id);


--
-- Name: const_mjobbarcode_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY mjobbarcode
    ADD CONSTRAINT const_mjobbarcode_prikey PRIMARY KEY (jbc_id);


--
-- Name: const_mjobcat_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY mjobcat
    ADD CONSTRAINT const_mjobcat_prikey PRIMARY KEY (jc_id);


--
-- Name: const_mjoboutput_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY mjoboutput
    ADD CONSTRAINT const_mjoboutput_prikey PRIMARY KEY (jo_id);


--
-- Name: const_mjoboutputlookup_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY mjoboutputlookup
    ADD CONSTRAINT const_mjoboutputlookup_prikey PRIMARY KEY (jol_id);


--
-- Name: const_mjobsheet_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY mjobsheet
    ADD CONSTRAINT const_mjobsheet_prikey PRIMARY KEY (js_id);


--
-- Name: const_mjscartonvalue_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY mjscartonvalue
    ADD CONSTRAINT const_mjscartonvalue_prikey PRIMARY KEY (caval_id);


--
-- Name: const_mmailtemplate_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY mmailtemplate
    ADD CONSTRAINT const_mmailtemplate_prikey PRIMARY KEY (mt_code);


--
-- Name: const_mmbarcodetype_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY mbarcodetype
    ADD CONSTRAINT const_mmbarcodetype_prikey PRIMARY KEY (bt_code);


--
-- Name: const_mtnc_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY mtnc
    ADD CONSTRAINT const_mtnc_prikey PRIMARY KEY (tc_id);


--
-- Name: const_mtncacceptance_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY mtncacceptance
    ADD CONSTRAINT const_mtncacceptance_prikey PRIMARY KEY (tca_tcid, tca_userid);


--
-- Name: const_pndcontact_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY pndcontact
    ADD CONSTRAINT const_pndcontact_prikey PRIMARY KEY (ct_id);


--
-- Name: const_vmenu_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcmenu
    ADD CONSTRAINT const_vmenu_prikey PRIMARY KEY (mn_id);


--
-- Name: const_vmenu_unikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcmenu
    ADD CONSTRAINT const_vmenu_unikey UNIQUE (mn_code);


--
-- Name: const_vorg_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcorg
    ADD CONSTRAINT const_vorg_prikey PRIMARY KEY (org_id);


--
-- Name: const_vrole_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcrole
    ADD CONSTRAINT const_vrole_prikey PRIMARY KEY (rol_id);


--
-- Name: const_vroleperm_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcroleperm
    ADD CONSTRAINT const_vroleperm_prikey PRIMARY KEY (rp_id);


--
-- Name: const_vroleperm_unikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcroleperm
    ADD CONSTRAINT const_vroleperm_unikey UNIQUE (rp_rolid, rp_pmscode);


--
-- Name: const_vsetting_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcsetting
    ADD CONSTRAINT const_vsetting_prikey PRIMARY KEY (set_id);


--
-- Name: const_vsetting_unikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcsetting
    ADD CONSTRAINT const_vsetting_unikey UNIQUE (set_user, set_code);


--
-- Name: const_vuser_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcuser
    ADD CONSTRAINT const_vuser_prikey PRIMARY KEY (usr_userid);


--
-- Name: const_vuserlogin_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcuserlogin
    ADD CONSTRAINT const_vuserlogin_prikey PRIMARY KEY (ul_id);


--
-- Name: const_vuserorgrole_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcuserorgrole
    ADD CONSTRAINT const_vuserorgrole_prikey PRIMARY KEY (uor_id);


--
-- Name: const_vuserorgrole_unikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcuserorgrole
    ADD CONSTRAINT const_vuserorgrole_unikey UNIQUE (uor_usrid, uor_orgid, uor_rolid);


--
-- Name: const_vusersession_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcusersession
    ADD CONSTRAINT const_vusersession_prikey PRIMARY KEY (us_id);


--
-- Name: cont_mjobcatlookup_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY mjobcatlookup
    ADD CONSTRAINT cont_mjobcatlookup_prikey PRIMARY KEY (jcl_id);


--
-- Name: country_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fccountry
    ADD CONSTRAINT country_prikey PRIMARY KEY (con_code);


--
-- Name: idx_requestdate; Type: INDEX; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE INDEX idx_requestdate ON mjobsheet USING btree (js_request_date, js_request_dateinmth, js_primcat);


--
-- Name: idx_vsetting_code_user; Type: INDEX; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE UNIQUE INDEX idx_vsetting_code_user ON fcsetting USING btree (set_user, set_code);


--
-- Name: usersession_idx1; Type: INDEX; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE INDEX usersession_idx1 ON fcusersession USING btree (us_sessid);


--
-- Name: usersession_idx2; Type: INDEX; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE INDEX usersession_idx2 ON fcusersession USING btree (us_userid);


--
-- Name: mjobsheet_upd_trig; Type: TRIGGER; Schema: pnd; Owner: pnd
--

CREATE TRIGGER mjobsheet_upd_trig BEFORE INSERT ON mjobsheet FOR EACH ROW EXECUTE PROCEDURE update_requestdate();


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

