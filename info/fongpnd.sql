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

SET search_path = pnd, pg_catalog;

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
    delete from fcdoc;
    delete from mjscartonvalue;
    
    
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
-- Name: fccurrency; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE fccurrency (
    cr_code character varying(8) NOT NULL,
    cr_name character varying(50),
    cr_rate numeric(20,4),
    cr_symbol character varying(50),
    cr_format character varying(50),
    cr_decimalsep character varying(8),
    cr_thousandsep character varying(8),
    cr_precision integer
);


ALTER TABLE pnd.fccurrency OWNER TO pnd;

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
    org_concode character varying(24),
    org_region character varying(50),
    org_created timestamp with time zone DEFAULT now()
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
-- Name: mcmanilox_ma_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE mcmanilox_ma_id_seq OWNED BY mcmanilox.ma_id;


--
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
-- Name: mcmcylplate_mcp_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE mcmcylplate_mcp_id_seq OWNED BY mcmcylplate.mcp_id;


--
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
-- Name: mcmcylrepeat_mcr_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE mcmcylrepeat_mcr_id_seq OWNED BY mcmcylrepeat.mcr_id;


--
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
-- Name: mcmcylsubstrate_mcs_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE mcmcylsubstrate_mcs_id_seq OWNED BY mcmcylsubstrate.mcs_id;


--
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
-- Name: mcmline_ml_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE mcmline_ml_id_seq OWNED BY mcmline.ml_id;


--
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

ALTER SEQUENCE mcustmachine_mc_id_seq OWNED BY mcustmachine_old.mc_id;


--
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
-- Name: mcustmachine_mc_id_seq1; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE mcustmachine_mc_id_seq1 OWNED BY mcustmachine.mc_id;


--
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
-- Name: mcustprinter_cp_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE mcustprinter_cp_id_seq OWNED BY mcustprinter.cp_id;


--
-- Name: minvoice; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE minvoice (
    iv_id integer NOT NULL,
    iv_invoicedate timestamp with time zone,
    iv_created timestamp with time zone DEFAULT now(),
    iv_orgid integer,
    iv_amount numeric(20,4),
    iv_paid character varying(4) DEFAULT 'N'::character varying,
    iv_paydate timestamp with time zone,
    iv_currency character varying(50),
    iv_jsid integer
);


ALTER TABLE pnd.minvoice OWNER TO pnd;

--
-- Name: COLUMN minvoice.iv_paid; Type: COMMENT; Schema: pnd; Owner: pnd
--

COMMENT ON COLUMN minvoice.iv_paid IS 'Y-fully paid/N-not fully paid';


--
-- Name: minvoice_iv_id_seq; Type: SEQUENCE; Schema: pnd; Owner: pnd
--

CREATE SEQUENCE minvoice_iv_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd.minvoice_iv_id_seq OWNER TO pnd;

--
-- Name: minvoice_iv_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE minvoice_iv_id_seq OWNED BY minvoice.iv_id;


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
    js_outputheight integer,
    js_qcchecked character varying(2000),
    js_currency character varying(50),
    js_finalprice numeric(20,4),
    js_rate numeric(20,4),
    js_totalinch numeric(20,4)
);


ALTER TABLE pnd.mjobsheet OWNER TO pnd;

--
-- Name: COLUMN mjobsheet.js_primcat; Type: COMMENT; Schema: pnd; Owner: pnd
--

COMMENT ON COLUMN mjobsheet.js_primcat IS 'primary job category';


--
-- Name: COLUMN mjobsheet.js_currency; Type: COMMENT; Schema: pnd; Owner: pnd
--

COMMENT ON COLUMN mjobsheet.js_currency IS 'Client currency code by region';


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
-- Name: mpayment; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE mpayment (
    pay_id integer NOT NULL,
    pay_created timestamp with time zone DEFAULT now(),
    pay_amount numeric(20,4) DEFAULT 0,
    pay_currency character varying(8),
    pay_allocatedamount numeric(20,4) DEFAULT 0,
    pay_orgid integer,
    pay_status character varying(4) DEFAULT 'A'::character varying
);


ALTER TABLE pnd.mpayment OWNER TO pnd;

--
-- Name: COLUMN mpayment.pay_status; Type: COMMENT; Schema: pnd; Owner: pnd
--

COMMENT ON COLUMN mpayment.pay_status IS 'A:Active, D:Deleted';


--
-- Name: mpayment_pay_id_seq; Type: SEQUENCE; Schema: pnd; Owner: pnd
--

CREATE SEQUENCE mpayment_pay_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd.mpayment_pay_id_seq OWNER TO pnd;

--
-- Name: mpayment_pay_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE mpayment_pay_id_seq OWNED BY mpayment.pay_id;


--
-- Name: mpaymentinvoice; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE mpaymentinvoice (
    pi_id integer NOT NULL,
    pi_created timestamp with time zone DEFAULT now(),
    pi_payid integer,
    pi_ivid integer,
    pi_amount numeric(20,4)
);


ALTER TABLE pnd.mpaymentinvoice OWNER TO pnd;

--
-- Name: mpaymentinvoice_pi_id_seq; Type: SEQUENCE; Schema: pnd; Owner: pnd
--

CREATE SEQUENCE mpaymentinvoice_pi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd.mpaymentinvoice_pi_id_seq OWNER TO pnd;

--
-- Name: mpaymentinvoice_pi_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE mpaymentinvoice_pi_id_seq OWNED BY mpaymentinvoice.pi_id;


--
-- Name: mregion; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE mregion (
    rg_code character varying(50) NOT NULL,
    rg_currency character varying(12),
    rg_convert character varying(4) DEFAULT 'N'::character varying
);


ALTER TABLE pnd.mregion OWNER TO pnd;

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
-- Name: ma_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY mcmanilox ALTER COLUMN ma_id SET DEFAULT nextval('mcmanilox_ma_id_seq'::regclass);


--
-- Name: mcp_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY mcmcylplate ALTER COLUMN mcp_id SET DEFAULT nextval('mcmcylplate_mcp_id_seq'::regclass);


--
-- Name: mcr_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY mcmcylrepeat ALTER COLUMN mcr_id SET DEFAULT nextval('mcmcylrepeat_mcr_id_seq'::regclass);


--
-- Name: mcs_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY mcmcylsubstrate ALTER COLUMN mcs_id SET DEFAULT nextval('mcmcylsubstrate_mcs_id_seq'::regclass);


--
-- Name: ml_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY mcmline ALTER COLUMN ml_id SET DEFAULT nextval('mcmline_ml_id_seq'::regclass);


--
-- Name: mc_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY mcustmachine ALTER COLUMN mc_id SET DEFAULT nextval('mcustmachine_mc_id_seq1'::regclass);


--
-- Name: mc_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY mcustmachine_old ALTER COLUMN mc_id SET DEFAULT nextval('mcustmachine_mc_id_seq'::regclass);


--
-- Name: cp_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY mcustprinter ALTER COLUMN cp_id SET DEFAULT nextval('mcustprinter_cp_id_seq'::regclass);


--
-- Name: iv_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY minvoice ALTER COLUMN iv_id SET DEFAULT nextval('minvoice_iv_id_seq'::regclass);


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
-- Name: pay_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY mpayment ALTER COLUMN pay_id SET DEFAULT nextval('mpayment_pay_id_seq'::regclass);


--
-- Name: pi_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY mpaymentinvoice ALTER COLUMN pi_id SET DEFAULT nextval('mpaymentinvoice_pi_id_seq'::regclass);


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
-- Data for Name: fccurrency; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY fccurrency (cr_code, cr_name, cr_rate, cr_symbol, cr_format, cr_decimalsep, cr_thousandsep, cr_precision) FROM stdin;
MYR	Malaysian Ringgit	1.0000	RM	\N	\N	\N	\N
USD	United States Dollar	3.3100	$	\N	\N	\N	\N
\.


--
-- Data for Name: fcdbaudit; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY fcdbaudit (dba_id, dba_created, dba_userid, dba_table, dba_column, dba_oldvalue, dba_newvalue, dba_keys, dba_key1, dba_key2, dba_key3, dba_key4, dba_key5) FROM stdin;
1	2014-07-13 22:35:43+08	admin	minvoice	iv_paid	N	Y	iv_id=18	18	\N	\N	\N	\N
2	2014-07-13 22:37:51+08	admin	minvoice	iv_paid	N	Y	iv_id=20	20	\N	\N	\N	\N
3	2014-07-13 22:41:39+08	admin	minvoice	iv_paid	N	Y	iv_id=19	19	\N	\N	\N	\N
4	2014-07-13 22:42:34+08	admin	minvoice	iv_paid	Y	N	iv_id=18	18	\N	\N	\N	\N
5	2014-07-13 22:42:59+08	admin	minvoice	iv_paid	Y	N	iv_id=20	20	\N	\N	\N	\N
6	2014-07-13 22:54:07+08	admin	minvoice	iv_paid	N	Y	iv_id=20	20	\N	\N	\N	\N
7	2014-07-15 18:27:01+08	admin	fccurrency	cr_rate	3.3000	3.3100	cr_code=USD	USD	\N	\N	\N	\N
11	2014-07-20 16:00:56+08	admin	mpayment	pay_status	A	D	pay_id=9	9	\N	\N	\N	\N
\.


--
-- Name: fcdbaudit_dba_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcdbaudit_dba_id_seq', 11, true);


--
-- Data for Name: fcdoc; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY fcdoc (fd_id, fd_created_date, fd_created_by, fd_refid, fd_reftype, fd_description, fd_file_name, fd_file_ext, fd_tags, fd_file_size) FROM stdin;
151	2014-07-09 10:27:17.78+08	uat_customer1	132	js_id	\N	Nescafe.rar	rar		790.0000
\.


--
-- Name: fcdoc_fd_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcdoc_fd_id_seq', 151, true);


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
ANILOXTYPE	CEWDB	ROOT	Ceramic with Doctor Blade	ACTIVE	140
ANILOXTYPE	CEXDB	ROOT	Ceramic without Doctor Blade	ACTIVE	141
ANILOXTYPE	CHWDB	ROOT	Chrome with Doctor Blade	ACTIVE	142
ANILOXTYPE	CHXDB	ROOT	Chrome without Doctor Blade	ACTIVE	143
QCLIST	SIZE	ROOT	Size passed	ACTIVE	154
QCLIST	BCTYPE	ROOT	Barcode type passed	ACTIVE	155
QCLIST	BCNUMBER	ROOT	Barcode number passed	ACTIVE	156
QCLIST	COLORSEP	ROOT	Color seperation passed	ACTIVE	157
QCLIST	DISTORTION	ROOT	Distortion passed	ACTIVE	158
QCLIST	IMAGEPOS	ROOT	Image position passed	ACTIVE	159
QCLIST	OVERLAPPING	ROOT	Overlapping passed	ACTIVE	160
QCLIST	COLORTRAPPING	ROOT	Color Trapping passed	ACTIVE	161
QCLIST	SCREENING	ROOT	Screening passed	ACTIVE	162
QCLIST	SCREENINGANGLE	ROOT	Screening Angle passed	ACTIVE	163
QCLIST	FINELINETEXT	ROOT	Fine Line / Text passed	ACTIVE	164
QCLIST	REVERSEDLINE	ROOT	Reverse Line / Text passed	ACTIVE	165
QCLIST	SPEELING	ROOT	Speeling passed	ACTIVE	166
QCLIST	EMULSION	ROOT	Emulsion Surface passed	ACTIVE	167
JOBSTATUS	CANCELLED	ROOT	CANCELLED	ACTIVE	168
\.


--
-- Name: fclookup_lu_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fclookup_lu_id_seq', 168, true);


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
110	INVOICEADM	1	Invoice	ACTIVE	1100	\N	Y	Moire	\N	invoiceadm	\N	\N	SUPHOME	\N
111	INVOICEAGING	1	Debtors Aging	ACTIVE	1200	\N	Y	Moire	\N	debtorsaging	\N	\N	SUPHOME	\N
112	CURRENCYSETUP	6	Currency Setup	ACTIVE	2500	\N	Y	Setting	\N	currencySetup	\N	\N	POSBMENU	\N
113	MREGIONSETUP	6	Region Setup	ACTIVE	2600	\N	Y	Setting	\N	mregionSetup	\N	\N	POSBMENU	\N
114	PAYMENTADM	1	Payment	ACTIVE	1300	\N	Y	Moire	\N	paymentadm	\N	\N	SUPHOME	\N
\.


--
-- Name: fcmenu_mn_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcmenu_mn_id_seq', 114, true);


--
-- Name: fcmenu_mn_parentid_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcmenu_mn_parentid_seq', 6, true);


--
-- Data for Name: fcorg; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY fcorg (org_id, org_type, org_external, org_name, org_parentid, org_primaryid, org_address, org_contactno, org_status, org_lccode, org_concode, org_region, org_created) FROM stdin;
3	\N	Y	Grand fortune	0	\N	\N	\N	ACTIVE	\N	\N	LOCAL	2014-07-19 12:58:51.42+08
4	\N	Y	New box	0	\N	\N	\N	ACTIVE	\N	\N	LOCAL	2014-07-19 12:58:51.42+08
5	\N	Y	Deswell	0	\N	\N	\N	ACTIVE	\N	\N	LOCAL	2014-07-19 12:58:51.42+08
6	\N	Y	Darun	0	\N	\N	\N	ACTIVE	\N	\N	LOCAL	2014-07-19 12:58:51.42+08
7	\N	Y	Harta	0	\N	\N	\N	ACTIVE	\N	\N	LOCAL	2014-07-19 12:58:51.42+08
8	\N	Y	Genting 	0	\N	\N	\N	ACTIVE	\N	\N	LOCAL	2014-07-19 12:58:51.42+08
1	\N	N	PND	0	\N	\N	\N	ACTIVE	\N	\N	LOCAL	2014-07-19 12:58:51.42+08
10	\N	Y	Fong Corp	1	\N	Jalan Fong 1	0120120123	ACTIVE	\N	\N	LOCAL	2014-07-19 12:58:51.42+08
9	\N	Y	UAT Customer 1	1	\N	1 Jln Customer	0123456789	ACTIVE	\N	\N	LOCAL	2014-07-19 12:58:51.42+08
11	\N	Y	Uat Customer 2	1	\N	Jalan customer 2	012345678	ACTIVE	\N	\N	LOCAL	2014-07-19 12:58:51.42+08
12	\N	Y	Uat Customer 3	1	\N	Jalan customer 3	123456789	ACTIVE	\N	\N	LOCAL	2014-07-19 12:58:51.42+08
13	\N	Y	Uat Customer 4	1	\N	Jalan customer 4	012345678	ACTIVE	\N	\N	LOCAL	2014-07-19 12:58:51.42+08
14	\N	Y	Uat Customer 5	1	\N	Jalan customer 5	1234	ACTIVE	\N	\N	LOCAL	2014-07-19 12:58:51.42+08
15	\N	Y	Test new	1	\N	Test new	Test new	ACTIVE	\N	\N	LOCAL	2014-07-19 12:58:51.42+08
2	\N	Y	Carton box	0	\N	\N	\N	ACTIVE	\N	\N	LOCAL	2014-07-19 12:58:51.42+08
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
INVOICE	Invoice
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
4	1	3	Work in progress 	USER	wip	[[REQTIMEART]]	Y	Y	The job has successfully been sent to QC for verification.
10	1	3	Rework in progress	USER	wip	[[REQTIMEQC]]	Y	Y	The job has successfully been sent to QC for verification.
5	1	4	Pending check (QC)	USER	pendingQC	[[REQTIMEQC]]	Y	Y	The job has successfully been [[QCDEC_DISP]].
6	1	1	Pending acceptance	USER	pendingCust	PT24H	Y	Y	The job has successfully been [[CUSTDEC_DISP]].
9	1	2	Reassign Artist	USER	reassign	\N	Y	Y	The job has successfully been assigned to artist.
14	1	\N	Notify Customer Task Acknowledged	SCRIPT	notifyCustomerAck	\N	N	N	\N
1	1	2	Requirement verification	USER	reqVerification	PT15M	Y	Y	The job has successfully been [[RVDEC_DISP]].
2	1	1	Pending resolution 	USER	pendingRevert	\N	Y	N	The job has successfully been [[CUSTRESODEC_DISP]].
\.


--
-- Name: fcpmactivity_pmat_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcpmactivity_pmat_id_seq', 14, true);


--
-- Data for Name: fcpmcase; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY fcpmcase (pmc_id, pmc_created_date, pmc_created_by, pmc_casekey, pmc_casetype, pmc_parentid, pmc_pmwfid, pmc_start_pmevid, pmc_start_date, pmc_end_pmevid, pmc_end_date, pmc_closed) FROM stdin;
154	2014-07-09 10:27:17+08	uat_customer1	132	jobsheet	\N	1	1	2014-07-09 10:27:17+08	\N	\N	N
\.


--
-- Name: fcpmcase_pmc_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcpmcase_pmc_id_seq', 154, true);


--
-- Data for Name: fcpmcasecomment; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY fcpmcasecomment (pmcc_id, pmcc_pmcid, pmcc_parentid, pmcc_created_date, pmcc_created_by, pmcc_comment, pmcc_pin, pmcc_pin_date, pmcc_pin_by, pmcc_delete, pmcc_pmfid) FROM stdin;
260	154	\N	2014-07-09 10:27:18+08	uat_customer1	Urgent!	\N	\N	\N	N	1158
\.


--
-- Name: fcpmcasecomment_pmcc_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcpmcasecomment_pmcc_id_seq', 260, true);


--
-- Data for Name: fcpmcasecommentread; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY fcpmcasecommentread (pmcr_id, pmcr_pmccid, pmcr_read_by, pmcr_read_date) FROM stdin;
\.


--
-- Name: fcpmcasecommentread_pmcr_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcpmcasecommentread_pmcr_id_seq', 241, true);


--
-- Data for Name: fcpmcaseflag; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY fcpmcaseflag (pmcf_id, pmcf_pmcid, pmcf_flag_by, pmcf_flag_date, pmcf_flag_type) FROM stdin;
\.


--
-- Name: fcpmcaseflag_pmcf_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcpmcaseflag_pmcf_id_seq', 44, true);


--
-- Data for Name: fcpmcaseflow; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_end_by, pmf_end_pmfid, pmf_from_event_gateway, pmf_last_timer_check_date, pmf_timer_due_date, pmf_timer_due_count) FROM stdin;
1158	154	1	PM_Event	\N	\N	2014-07-09 10:27:17+08	2014-07-09 10:27:17+08	DONE	\N	2014-07-09 10:27:17+08	uat_customer1	1158	N	\N	\N	\N
1159	154	1	PM_Activity	1158	1	2014-07-09 10:27:17+08	\N	\N	2014-07-10 00:15:00+08	\N	\N	\N	N	\N	2014-07-10 00:15:00+08	\N
\.


--
-- Name: fcpmcaseflow_pmf_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcpmcaseflow_pmf_id_seq', 1159, true);


--
-- Data for Name: fcpmcaseflowassign; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY fcpmcaseflowassign (pmfa_id, pmfa_pmfid, pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode) FROM stdin;
242	1158	\N	\N	\N	REQUEST_NEWJOB
243	1159	\N	1	19	\N
\.


--
-- Name: fcpmcaseflowassign_pmfa_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcpmcaseflowassign_pmfa_id_seq', 243, true);


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
7	PM_Activity	2	PM_Gateway	7	1	NORMAL	\N
36	PM_Gateway	7	PM_Activity	1	1	NORMAL	5::false
37	PM_Gateway	7	PM_Event	12	2	NORMAL	5::true
\.


--
-- Name: fcpmconnector_pmcn_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcpmconnector_pmcn_id_seq', 37, true);


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
12	1	\N	Job Canceled	END	\N	\N	\N	N	N	\N	\N	\N	\N
\.


--
-- Name: fcpmevent_pmev_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcpmevent_pmev_id_seq', 12, true);


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
7	1	\N	Check Customer Resolution	EXCLUSIVE	DIVERGENCE
\.


--
-- Name: fcpmgateway_pmgw_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcpmgateway_pmgw_id_seq', 7, true);


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
5	Customer Resolution Cancelled?	Cancelled	Not Cancelled	[{"oper":"&&","clausetype":"udv","clausecode":"CUSTRESODEC","clauseoper":"==","clauseval":"Cancel"}]
\.


--
-- Name: fcrule_ru_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcrule_ru_id_seq', 5, true);


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
13	*	CURRENCYBASE	Currency Base Code	MYR
\.


--
-- Name: fcsetting_set_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcsetting_set_id_seq', 13, true);


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
CUSTRESODEC_DISP	Customer Resolution Decision Display	sql	select case when js_decision='Cancel' then 'cancelled' else 'sent back for verification' end from mjobsheet where js_id = {$CASEKEY}	CELL	\N	\N	\N	\N
CUSTRESODEC	Customer resolution decision	sql	select js_decision from mjobsheet where js_id = {$CASEKEY}	CELL	lookup	text	Cancel	\N
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
uat_manager4	5001bb8bbc319f44083f121452b480400657668a	2014-06-22 14:45:41.681+08	UAT Manager 4	dannyfoo@phiorion.com	\N	\N	\N	\N	\N	ACTIVE	\N
esp_supervisor	9afb9d02e0ce944228e1001d2b103b3bb9aa7def	2014-06-21 21:28:05.788+08	esp supervisor	dannyfoo@phiorion.com	2014-06-21 23:17:39+08	2014-06-21 23:05:39+08	2014-06-21 22:21:37+08	\N	a:0:{}	ACTIVE	\N
uat_manager5	5001bb8bbc319f44083f121452b480400657668a	2014-06-22 14:46:13.293+08	UAT Manager5	dannyfoo@phiorion.com	\N	\N	\N	\N	\N	ACTIVE	\N
fongadmin	d033e22ae348aeb5660fc2140aec35850c4da997	2014-06-21 19:06:57.321+08	Administrator	dannyfoo@phiorion.com	2014-06-28 16:49:14+08	2014-06-28 15:46:39+08	2014-06-22 19:29:13+08	\N	a:4:{s:7:"dbosess";a:2:{s:8:"jobsheet";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:3:"new";}s:10:"joblisting";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"list";}}s:13:"PMTask_taskid";s:1:"1";s:15:"PMTask_tasktype";s:8:"PM_Event";s:9:"dboconfig";a:1:{s:8:"jobsheet";i:1;}}	ACTIVE	EN-US
uat_supervisor3	5001bb8bbc319f44083f121452b480400657668a	2014-06-22 13:56:56.546+08	Uat supervisor 3	dannyfoo@phiorion.com	2014-06-22 23:01:03+08	2014-06-22 23:00:30+08	\N	\N	a:0:{}	ACTIVE	\N
uat_manager2	5001bb8bbc319f44083f121452b480400657668a	2014-06-22 14:44:37.191+08	UAT Manager2	dannyfoo@phiorion.com	2014-07-01 15:59:39+08	\N	\N	\N	a:0:{}	ACTIVE	\N
fongcustomer	c3bb51e80fb8801251e17d265e6a84cdd3a65200	2014-06-21 19:09:47.371+08	Fong Customer	fong_yeh@hotmail.com	2014-06-21 19:10:15+08	2014-06-21 19:10:06+08	\N	\N	a:4:{s:7:"dbosess";a:1:{s:8:"jobsheet";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:3:"new";}}s:13:"PMTask_taskid";s:1:"1";s:15:"PMTask_tasktype";s:8:"PM_Event";s:9:"dboconfig";a:0:{}}	ACTIVE	\N
uat_supervisor4	5001bb8bbc319f44083f121452b480400657668a	2014-06-22 13:58:23.837+08	Uat supervisor 4	dannyfoo@phiorion.com	2014-06-26 12:29:16+08	2014-06-26 12:27:03+08	\N	\N	a:0:{}	ACTIVE	\N
uat_customer5	5001bb8bbc319f44083f121452b480400657668a	2014-06-22 13:54:37.241+08	Uat customer 5	dannyfoo@phiorion.com	2014-07-04 14:01:58+08	2014-07-04 11:52:54+08	\N	\N	a:0:{}	ACTIVE	\N
uat_supervisor5	5001bb8bbc319f44083f121452b480400657668a	2014-06-22 13:58:54.09+08	Uat supervisor 5	dannyfoo@phiorion.com	2014-07-04 15:36:18+08	2014-07-04 15:35:54+08	\N	\N	a:0:{}	ACTIVE	EN-US
artist2	09c04a14fff8cbd7d0235da2c01bfd31d7826824	2014-06-09 21:35:00.767+08	Artist 2	dannyfoo@phiorion.com	2014-06-30 16:40:49+08	2014-06-30 14:46:07+08	2014-06-22 22:37:16+08	\N	a:7:{s:7:"dbosess";a:5:{s:26:"pmtask_caseflow_list_event";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"list";}s:20:"pmtask_caseflow_list";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"list";}s:3:"wip";a:4:{s:6:"lastid";a:1:{s:5:"js_id";i:121;}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"edit";}s:8:"jobsheet";a:4:{s:6:"lastid";a:1:{s:5:"js_id";i:121;}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:6:"detail";}s:11:"flowsummary";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:6:{s:6:"pmc_id";s:0:"";s:7:"js_code";s:0:"";s:9:"js_status";s:0:"";s:15:"js_request_date";s:0:"";s:14:"js_description";s:0:"";s:10:"js_primcat";s:0:"";}s:5:"state";s:4:"list";}}s:13:"PMTask_taskid";s:2:"10";s:15:"PMTask_tasktype";s:11:"PM_Activity";s:9:"dboconfig";a:0:{}s:13:"PMTask_flowid";s:4:"1015";s:4:"type";s:11:"PM_Activity";s:6:"actvid";s:1:"4";}	ACTIVE	\N
fongsupervisor	5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8	2014-06-21 21:41:13.921+08	fongsupervisor	dannyfoo@phiorion.com	2014-06-21 22:37:35+08	2014-06-21 21:52:33+08	\N	\N	a:0:{}	ACTIVE	\N
uat_artist3	5001bb8bbc319f44083f121452b480400657668a	2014-06-22 14:39:27.667+08	UAT Artist3	dannyfoo@phiorion.com	2014-06-22 23:02:35+08	2014-06-22 23:02:27+08	\N	\N	a:4:{s:7:"dbosess";a:1:{s:20:"pmtask_caseflow_list";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"list";}}s:13:"PMTask_taskid";s:2:"10";s:15:"PMTask_tasktype";s:11:"PM_Activity";s:9:"dboconfig";a:0:{}}	ACTIVE	\N
uat_artist4	5001bb8bbc319f44083f121452b480400657668a	2014-06-22 14:40:21.405+08	UAT Artist4	dannyfoo@phiorion.com	2014-06-26 12:03:39+08	2014-06-26 11:45:43+08	\N	\N	a:0:{}	ACTIVE	\N
uat_manager1	5001bb8bbc319f44083f121452b480400657668a	2014-06-21 17:29:57.603+08	UAT Manager1	dannyfoo@phiorion.com	\N	\N	\N	\N	\N	ACTIVE	\N
uat_artist5	5001bb8bbc319f44083f121452b480400657668a	2014-06-22 14:40:50.232+08	UAT Artist5	dannyfoo@phiorion.com	\N	\N	\N	\N	\N	ACTIVE	\N
uat_artist2	5001bb8bbc319f44083f121452b480400657668a	2014-06-22 14:38:00.573+08	UAT Artist2	dannyfoo@phiorion.com	2014-07-01 18:26:32+08	2014-07-01 17:49:47+08	\N	\N	a:0:{}	ACTIVE	\N
uat_supervisor2	5001bb8bbc319f44083f121452b480400657668a	2014-06-22 13:56:27.344+08	Uat supervisor 2	dannyfoo@phiorion.com	2014-07-01 17:25:05+08	2014-07-01 17:24:36+08	2014-06-26 11:15:55+08	\N	a:0:{}	ACTIVE	\N
uat_qc2	5001bb8bbc319f44083f121452b480400657668a	2014-06-22 14:41:50.867+08	Quality Assurance 2	dannyfoo@phiorion.com	2014-07-01 18:49:20+08	2014-07-01 18:26:58+08	\N	\N	a:0:{}	ACTIVE	\N
uat_customer4	5001bb8bbc319f44083f121452b480400657668a	2014-06-22 13:54:11.918+08	Uat customer 4	dannyfoo@phiorion.com	2014-07-01 11:19:04+08	2014-07-01 22:57:09+08	\N	\N	a:0:{}	ACTIVE	\N
newcust	5001bb8bbc319f44083f121452b480400657668a	2014-07-03 15:39:05.684+08	New customer in chinese	cust@cust.com	2014-07-03 15:39:22+08	2014-07-03 15:39:16+08	2014-07-03 15:39:12+08	\N	a:0:{}	ACTIVE	ZH-CN
uat_qc1	5001bb8bbc319f44083f121452b480400657668a	2014-06-21 21:50:16.091+08	Quality Assurance 1	dannyfoo@phiorion.com	2014-07-08 16:56:49+08	2014-07-08 16:56:13+08	\N	\N	a:0:{}	ACTIVE	\N
uat_supervisor1	5001bb8bbc319f44083f121452b480400657668a	2014-06-21 17:27:46.394+08	UAT Supervisor	dannyfoo@phiorion.com	2014-07-08 16:54:34+08	2014-07-08 16:53:56+08	2014-07-08 16:49:00+08	\N	a:0:{}	ACTIVE	EN-US
uat_artist1	5001bb8bbc319f44083f121452b480400657668a	2014-06-21 17:29:02.912+08	UAT Artist1	dannyfoo@phiorion.com	2014-07-08 16:56:08+08	2014-07-08 16:55:52+08	2014-07-08 16:54:54+08	\N	a:0:{}	ACTIVE	\N
esp	9afb9d02e0ce944228e1001d2b103b3bb9aa7def	2014-06-21 18:25:38.5+08	Eng Shi Ping	dannyfoo@phiorion.com	2014-07-11 17:05:16+08	2014-07-11 11:38:53+08	2014-07-08 07:14:56+08	\N	a:4:{s:7:"dbosess";a:2:{s:20:"pmtask_caseflow_list";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"list";}s:8:"jobsheet";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:3:"new";}}s:13:"PMTask_taskid";s:1:"1";s:15:"PMTask_tasktype";s:8:"PM_Event";s:9:"dboconfig";a:0:{}}	ACTIVE	EN-US
uat_customer1	5001bb8bbc319f44083f121452b480400657668a	2014-06-22 13:50:43.739+08	Uat customer 1	fong_yeh@hotmail.com	2014-07-24 14:30:38+08	2014-07-24 14:30:17+08	2014-07-14 01:14:31+08	\N	a:2:{s:7:"dbosess";a:2:{s:12:"debtorsaging";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"list";}s:10:"invoiceall";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"list";}}s:9:"dboconfig";a:0:{}}	ACTIVE	EN-US
uat_customer2	5001bb8bbc319f44083f121452b480400657668a	2014-06-22 13:48:01.232+08	Uat customer 2	dannyfoo@phiorion.com	2014-07-14 01:14:25+08	2014-07-14 01:11:35+08	2014-06-22 17:54:06+08	\N	a:0:{}	ACTIVE	\N
admin	d033e22ae348aeb5660fc2140aec35850c4da997	2013-08-15 09:55:18.85+08	Administrator	dannyfoo@phiorion.com	2014-07-24 18:14:39+08	2014-07-24 14:17:10+08	2014-06-24 18:01:03+08	ADMIN	a:5:{s:7:"dbosess";a:6:{s:9:"fonginput";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"list";}s:8:"jobsheet";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:3:"new";}s:12:"debtorsaging";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"list";}s:10:"invoiceall";a:5:{s:6:"lastid";a:0:{}s:4:"sort";a:1:{s:14:"iv_invoicedate";s:4:"desc";}s:6:"search";a:4:{s:8:"iv_orgid";s:1:"9";s:14:"iv_invoicedate";s:0:"";s:7:"iv_paid";s:0:"";s:10:"iv_paydate";s:0:"";}s:5:"state";s:4:"list";s:5:"dbost";b:1;}s:0:"";a:3:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}}s:10:"paymentall";a:4:{s:6:"lastid";a:1:{s:6:"pay_id";s:1:"8";}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:3:"new";}}s:9:"dboconfig";a:1:{s:8:"jobsheet";i:1;}s:13:"PMTask_taskid";s:1:"1";s:15:"PMTask_tasktype";s:8:"PM_Event";s:7:"dboload";s:10:"paymentall";}	ACTIVE	EN-US
uat_cust1	5001bb8bbc319f44083f121452b480400657668a	2014-06-21 17:32:20.338+08	UAT Customer1	fong@phiorion.com	2014-06-22 17:06:05+08	2014-06-22 17:06:05+08	2014-06-22 14:22:06+08	\N	a:0:{}	ACTIVE	\N
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
85	2014-06-23 00:23:17.891+08	*moire	supervisor	\N	NOTICE	[MOIRE] Late Job WIP Notification	<p>Dear Manager and Supervisor,</p><p>This email is to notify that the "asd" job is still WIP from UAT Artist2 since 22-Jun-2014 10:40 PM.</p><div><br></div>	READ	2014-06-23 00:23:17.891+08	\N	3
86	2014-06-23 00:23:17.963+08	*moire	supervisor	\N	NOTICE	[MOIRE] Late Job Acknowledgement Notification	<p>Dear Supervisor,</p><p>This email is to notify that the "test5" job is still pending acknowledgement from esp artist since 22-Jun-2014 10:06 PM.</p><div><br></div>	READ	2014-06-23 00:23:17.963+08	\N	3
87	2014-06-23 00:23:18.025+08	*moire	supervisor	\N	NOTICE	[MOIRE] Late Job Acknowledgement Notification	<p>Dear Supervisor,</p><p>This email is to notify that the "Monotone Editing" job is still pending acknowledgement from UAT Artist3 since 22-Jun-2014 10:07 PM.</p><div><br></div>	READ	2014-06-23 00:23:18.025+08	\N	3
89	2014-06-23 00:23:18.506+08	*moire	supervisor	\N	NOTICE	[MOIRE] Late Job Acknowledgement Notification	<p>Dear Supervisor,</p><p>This email is to notify that the "123" job is still pending acknowledgement from Artist 2 since 22-Jun-2014 10:36 PM.</p><div><br></div>	READ	2014-06-23 00:23:18.506+08	\N	3
90	2014-06-23 00:23:18.566+08	*moire	supervisor	\N	NOTICE	[MOIRE] Late Job Acknowledgement Notification	<p>Dear Supervisor,</p><p>This email is to notify that the "Case 1 - eng" job is still pending acknowledgement from Artist 1 since 22-Jun-2014 10:38 PM.</p><div><br></div>	READ	2014-06-23 00:23:18.566+08	\N	3
91	2014-06-23 00:23:18.623+08	*moire	supervisor	\N	NOTICE	[MOIRE] Late Job WIP Notification	<p>Dear Manager and Supervisor,</p><p>This email is to notify that the "new job 3 by eng" job is still WIP from UAT Artist3 since 22-Jun-2014 11:01 PM.</p><div><br></div>	READ	2014-06-23 00:23:18.623+08	\N	3
92	2014-06-26 16:33:40.38+08	*moire	ysyow	\N	NOTICE	[MOIRE] Job Acknowledgement	<p>Dear Yow Yik Shuen,</p><p>This email is to inform that your job request "YYYSSS" is now confirmed and acknowledged. </p><p><br></p><p>Estimate Time Required : 300 minutes (Working hour)</p><p>Estimate Completion Time : 27-Jun-2014 12:33 PM</p><div><br></div>	READ	2014-06-26 16:33:40.38+08	\N	3
93	2014-06-30 14:46:15.876+08	*moire	admin	\N	NOTICE	[MOIRE] Job Acknowledgement	<p>Dear Administrator,</p><p>This email is to inform that your job request "test yys" is now confirmed and acknowledged. </p><p><br></p><p>Estimate Time Required : 300 minutes (Working hour)</p><p>Estimate Completion Time : 1-Jul-2014 10:46 AM</p><div><br></div>	READ	2014-06-30 14:46:15.876+08	\N	3
94	2014-06-30 17:42:05.827167+08	admin	admin	\N	MESSAGE	test	\N	READ	2014-06-30 17:42:05.827167+08	\N	3
96	2014-06-30 17:43:22.234932+08	*moire	supervisor	\N	NOTICE	[MOIRE] Late Job WIP Notification	<p>Dear Manager and Supervisor,</p><p>This email is to notify that the "Master card artwork" job is still WIP from UAT Artist1 since .</p><div><br></div>	UNREAD	2014-06-30 17:43:22.234932+08	\N	3
108	2014-06-30 17:43:30.739247+08	*moire	supervisor	\N	NOTICE	[MOIRE] Late Job WIP Notification	<p>Dear Manager and Supervisor,</p><p>This email is to notify that the "Test job by Eng" job is still WIP from UAT Artist1 since 24-Jun-2014 07:02 AM.</p><div><br></div>	UNREAD	2014-06-30 17:43:30.739247+08	\N	3
110	2014-06-30 17:43:31.778216+08	*moire	supervisor	\N	NOTICE	[MOIRE] Late Job WIP Notification	<p>Dear Manager and Supervisor,</p><p>This email is to notify that the "A job with a lot details" job is still WIP from UAT Artist4 since 25-Jun-2014 11:16 PM.</p><div><br></div>	UNREAD	2014-06-30 17:43:31.778216+08	\N	3
113	2014-06-30 17:43:33.258755+08	*moire	supervisor	\N	NOTICE	[MOIRE] Late Job WIP Notification	<p>Dear Manager and Supervisor,</p><p>This email is to notify that the "YYYSSS" job is still WIP from Artist 2 since 26-Jun-2014 04:33 AM.</p><div><br></div>	UNREAD	2014-06-30 17:43:33.258755+08	\N	3
114	2014-06-30 17:43:33.303587+08	*moire	supervisor	\N	NOTICE	[MOIRE] Late Job QC Notification	<p>Dear Manager and Supervisor,</p><p>This email is to notify that the "test yys" job is still pending QC since 30-Jun-2014 02:46 AM.</p><div><br></div>	UNREAD	2014-06-30 17:43:33.303587+08	\N	3
115	2014-06-30 17:57:29.763632+08	admin	admin	\N	MESSAGE	test2	\N	UNREAD	2014-06-30 17:57:29.763632+08	\N	3
103	2014-06-30 17:43:27.492331+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "Oder 2 by eng" job is still pending since 22-Jun-2014 10:25 AM.</p><p><br></p>	READ	2014-06-30 17:43:27.492331+08	\N	3
104	2014-06-30 17:43:28.376057+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "123213" job is still pending since 24-Jun-2014 06:38 AM.</p><p><br></p>	READ	2014-06-30 17:43:28.376057+08	\N	3
105	2014-06-30 17:43:29.18841+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "sasda" job is still pending since 24-Jun-2014 05:17 AM.</p><p><br></p>	READ	2014-06-30 17:43:29.18841+08	\N	3
106	2014-06-30 17:43:29.878136+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "12asd" job is still pending since 22-Jun-2014 10:29 AM.</p><p><br></p>	READ	2014-06-30 17:43:29.878136+08	\N	3
107	2014-06-30 17:43:30.657928+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "test yys" job is still pending since 24-Jun-2014 06:41 AM.</p><p><br></p>	READ	2014-06-30 17:43:30.657928+08	\N	3
109	2014-06-30 17:43:31.689868+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "required master card!!" job is still pending since 25-Jun-2014 06:09 AM.</p><p><br></p>	READ	2014-06-30 17:43:31.689868+08	\N	3
111	2014-06-30 17:43:32.511544+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "No barcode, no master card, just drawing and typing-- æ¢äºï¼ï¼" job is still pending since 25-Jun-2014 06:28 AM.</p><p><br></p>	READ	2014-06-30 17:43:32.511544+08	\N	3
100	2014-06-30 17:43:25.269224+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "sad" job is still pending since 22-Jun-2014 10:25 AM.</p><p><br></p>	READ	2014-06-30 17:43:25.269224+08	\N	3
101	2014-06-30 17:43:26.032959+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "asddsa" job is still pending since 22-Jun-2014 10:26 AM.</p><p><br></p>	READ	2014-06-30 17:43:26.032959+08	\N	3
102	2014-06-30 17:43:26.775047+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "1" job is still pending since 22-Jun-2014 10:27 AM.</p><p><br></p>	READ	2014-06-30 17:43:26.775047+08	\N	3
128	2014-07-01 06:04:19.646586+08	*moire	uat_customer4	\N	NOTICE	[MOIRE] Job Acknowledgement	<p>Dear Uat customer 4,</p><p>This email is to inform that your job request "required master card!!" is now confirmed and acknowledged. </p><p><br></p><p>Estimate Time Required : 250 minutes (Working hour)</p><p>Estimate Completion Time : 1-Jul-2014 1:10 PM</p><div><br></div>	UNREAD	2014-07-01 06:04:19.646586+08	\N	3
118	2014-07-01 05:59:05.100017+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "sad" job is still pending since 22-Jun-2014 10:25 AM.</p><p><br></p>	READ	2014-07-01 05:59:05.100017+08	\N	3
119	2014-07-01 05:59:06.13688+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "asddsa" job is still pending since 22-Jun-2014 10:26 AM.</p><p><br></p>	READ	2014-07-01 05:59:06.13688+08	\N	3
120	2014-07-01 05:59:06.847278+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "1" job is still pending since 22-Jun-2014 10:27 AM.</p><p><br></p>	READ	2014-07-01 05:59:06.847278+08	\N	3
121	2014-07-01 05:59:07.571121+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "Oder 2 by eng" job is still pending since 22-Jun-2014 10:25 AM.</p><p><br></p>	READ	2014-07-01 05:59:07.571121+08	\N	3
122	2014-07-01 05:59:08.280895+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "12asd" job is still pending since 22-Jun-2014 10:29 AM.</p><p><br></p>	READ	2014-07-01 05:59:08.280895+08	\N	3
123	2014-07-01 05:59:08.988355+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "Test job" job is still pending since 22-Jun-2014 03:55 AM.</p><p><br></p>	READ	2014-07-01 05:59:08.988355+08	\N	3
124	2014-07-01 05:59:09.742204+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "Esp case" job is still pending since 21-Jun-2014 10:17 AM.</p><p><br></p>	READ	2014-07-01 05:59:09.742204+08	\N	3
125	2014-07-01 05:59:10.490144+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "No barcode, no master card, just drawing and typing-- æ¢äºï¼ï¼" job is still pending since 25-Jun-2014 06:28 AM.</p><p><br></p>	READ	2014-07-01 05:59:10.490144+08	\N	3
126	2014-07-01 05:59:11.18635+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "123213" job is still pending since 24-Jun-2014 06:38 AM.</p><p><br></p>	READ	2014-07-01 05:59:11.18635+08	\N	3
127	2014-07-01 05:59:11.868212+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "sasda" job is still pending since 24-Jun-2014 05:17 AM.</p><p><br></p>	READ	2014-07-01 05:59:11.868212+08	\N	3
112	2014-06-30 17:43:33.211413+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "Test yys" job is still pending since 25-Jun-2014 06:17 AM.</p><p><br></p>	READ	2014-06-30 17:43:33.211413+08	\N	3
116	2014-07-01 05:59:03.223507+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "UAT job by ENG -1 " job is still pending since 22-Jun-2014 07:05 AM.</p><p><br></p>	READ	2014-07-01 05:59:03.223507+08	\N	3
117	2014-07-01 05:59:04.371237+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "Test revert job" job is still pending since 22-Jun-2014 07:08 AM.</p><p><br></p>	READ	2014-07-01 05:59:04.371237+08	\N	3
77	2014-06-23 00:23:14.953+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "Esp case" job is still pending since 21-Jun-2014 10:17 PM.</p><p><br></p>	READ	2014-06-23 00:23:14.953+08	\N	3
78	2014-06-23 00:23:15.418+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "Test job" job is still pending since 22-Jun-2014 03:55 PM.</p><p><br></p>	READ	2014-06-23 00:23:15.418+08	\N	3
79	2014-06-23 00:23:15.884+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "UAT job by ENG -1 " job is still pending since 22-Jun-2014 07:05 PM.</p><p><br></p>	READ	2014-06-23 00:23:15.884+08	\N	3
80	2014-06-23 00:23:16.288+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "Test revert job" job is still pending since 22-Jun-2014 07:08 PM.</p><p><br></p>	READ	2014-06-23 00:23:16.288+08	\N	3
81	2014-06-23 00:23:16.682+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "sad" job is still pending since 22-Jun-2014 10:25 PM.</p><p><br></p>	READ	2014-06-23 00:23:16.682+08	\N	3
82	2014-06-23 00:23:17.087+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "asddsa" job is still pending since 22-Jun-2014 10:26 PM.</p><p><br></p>	READ	2014-06-23 00:23:17.087+08	\N	3
83	2014-06-23 00:23:17.477+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "1" job is still pending since 22-Jun-2014 10:27 PM.</p><p><br></p>	READ	2014-06-23 00:23:17.477+08	\N	3
129	2014-07-03 12:43:11.029+08	*moire	uat_customer1	\N	NOTICE	[MOIRE] Job Acknowledgement	<p>Dear Uat customer 1,</p><p>This email is to inform that your job request "Check fields" is now confirmed and acknowledged. </p><p><br></p><p>Estimate Time Required : 300 minutes (Working hour)</p><p>Estimate Completion Time : 3-Jul-2014 5:43 PM</p><div><br></div>	DELETED	2014-07-03 12:43:11.029+08	\N	3
84	2014-06-23 00:23:17.848+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "12asd" job is still pending since 22-Jun-2014 10:29 PM.</p><p><br></p>	READ	2014-06-23 00:23:17.848+08	\N	3
88	2014-06-23 00:23:18.464+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "Oder 2 by eng" job is still pending since 22-Jun-2014 10:25 PM.</p><p><br></p>	READ	2014-06-23 00:23:18.464+08	\N	3
95	2014-06-30 17:43:22.135222+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "Esp case" job is still pending since 21-Jun-2014 10:17 AM.</p><p><br></p>	READ	2014-06-30 17:43:22.135222+08	\N	3
97	2014-06-30 17:43:23.010533+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "Test job" job is still pending since 22-Jun-2014 03:55 AM.</p><p><br></p>	READ	2014-06-30 17:43:23.010533+08	\N	3
98	2014-06-30 17:43:23.760528+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "UAT job by ENG -1 " job is still pending since 22-Jun-2014 07:05 AM.</p><p><br></p>	READ	2014-06-30 17:43:23.760528+08	\N	3
99	2014-06-30 17:43:24.525236+08	*moire	uat_supervisor1	\N	NOTICE	[MOIRE] Late Requirement Verification Notification	<p>Dear Manager,</p><p>This email is to notify that the requirement verification for the "Test revert job" job is still pending since 22-Jun-2014 07:08 AM.</p><p><br></p>	READ	2014-06-30 17:43:24.525236+08	\N	3
132	2014-07-08 16:54:43.772+08	*moire	uat_customer1	\N	NOTICE	[MOIRE] Job Acknowledgement	<p>Dear Uat customer 1,</p><p>This email is to inform that your job request "test quality control list" is now confirmed and acknowledged. </p><p><br></p><p>Estimate Time Required : 240 minutes (Working hour)</p><p>Estimate Completion Time : 8-Jul-2014 1:00 PM</p><div><br></div>	DELETED	2014-07-08 16:54:43.772+08	\N	3
131	2014-07-08 16:49:51.813+08	*moire	uat_customer1	\N	NOTICE	[MOIRE] Job Acknowledgement	<p>Dear Uat customer 1,</p><p>This email is to inform that your job request "New job test printer" is now confirmed and acknowledged. </p><p><br></p><p>Estimate Time Required : 240 minutes (Working hour)</p><p>Estimate Completion Time : 8-Jul-2014 1:00 PM</p><div><br></div>	DELETED	2014-07-08 16:49:51.813+08	\N	3
130	2014-07-03 14:08:34.973+08	*moire	uat_customer1	\N	NOTICE	[MOIRE] Job Acknowledgement	<p>Dear Uat customer 1,</p><p>This email is to inform that your job request "new job exceed SLA" is now confirmed and acknowledged. </p><p><br></p><p>Estimate Time Required : 240 minutes (Working hour)</p><p>Estimate Completion Time : 4-Jul-2014 9:08 AM</p><div><br></div>	DELETED	2014-07-03 14:08:34.973+08	\N	3
\.


--
-- Name: fcuserdiary_di_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcuserdiary_di_id_seq', 132, true);


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
941	newcust	127.0.0.1	N	2014-07-03 15:39:12.484+08	2014-07-03 15:39:12.484+08	\N	N	\N
942	newcust	127.0.0.1	Y	2014-07-03 15:39:16.862+08	2014-07-03 15:39:16.862+08	\N	N	\N
943	esp	127.0.0.1	Y	2014-07-03 15:45:19.133+08	2014-07-03 15:45:19.133+08	\N	N	\N
944	uat_supervisor	127.0.0.1	N	2014-07-03 16:46:37.404+08	2014-07-03 16:46:37.404+08	\N	N	\N
945	uat_supervisor5	127.0.0.1	Y	2014-07-03 16:46:42.695+08	2014-07-03 16:46:42.695+08	\N	N	\N
946	esp	127.0.0.1	Y	2014-07-03 16:53:02.009+08	2014-07-03 16:53:02.009+08	\N	N	\N
947	uat_supervisor1	127.0.0.1	Y	2014-07-03 16:53:52.924+08	2014-07-03 16:53:52.924+08	\N	N	\N
948	uat_customer1	127.0.0.1	Y	2014-07-03 20:14:24.451+08	2014-07-03 20:14:24.451+08	\N	N	\N
949	esp	127.0.0.1	Y	2014-07-03 20:15:19.134+08	2014-07-03 20:15:19.134+08	\N	N	\N
950	uat_customer1	127.0.0.1	Y	2014-07-03 21:25:25.187+08	2014-07-03 21:25:25.187+08	\N	N	\N
951	esp	127.0.0.1	Y	2014-07-04 11:50:17.261+08	2014-07-04 11:50:17.261+08	\N	N	\N
952	uat_customer5	127.0.0.1	Y	2014-07-04 11:52:54.753+08	2014-07-04 11:52:54.753+08	\N	N	\N
953	esp	127.0.0.1	Y	2014-07-04 14:02:01.05+08	2014-07-04 14:02:01.05+08	\N	N	\N
954	esp	127.0.0.1	Y	2014-07-04 15:30:45.954+08	2014-07-04 15:30:45.954+08	\N	N	\N
955	uat_supervisor5	127.0.0.1	Y	2014-07-04 15:35:54.061+08	2014-07-04 15:35:54.061+08	\N	N	\N
956	esp	127.0.0.1	Y	2014-07-04 15:36:21.392+08	2014-07-04 15:36:21.392+08	\N	N	\N
957	esp	127.0.0.1	Y	2014-07-08 06:27:07.118+08	2014-07-08 06:27:07.118+08	\N	N	\N
958	esp	127.0.0.1	Y	2014-07-08 06:30:32.639+08	2014-07-08 06:30:32.639+08	\N	N	\N
959	uat_customer1	127.0.0.1	Y	2014-07-08 06:45:24.013+08	2014-07-08 06:45:24.013+08	\N	N	\N
960	esp	127.0.0.1	Y	2014-07-08 06:45:32.704+08	2014-07-08 06:45:32.704+08	\N	N	\N
961	uat_customer1	127.0.0.1	Y	2014-07-08 06:47:49.082+08	2014-07-08 06:47:49.082+08	\N	N	\N
962	uat_supervisor1	127.0.0.1	Y	2014-07-08 06:49:54.21+08	2014-07-08 06:49:54.21+08	\N	N	\N
963	esp	127.0.0.1	N	2014-07-08 07:14:56.155+08	2014-07-08 07:14:56.155+08	\N	N	\N
964	esp	127.0.0.1	Y	2014-07-08 07:14:59.17+08	2014-07-08 07:14:59.17+08	\N	N	\N
965	esp	127.0.0.1	Y	2014-07-08 07:50:29.99+08	2014-07-08 07:50:29.99+08	\N	N	\N
966	uat_supervisor1	127.0.0.1	Y	2014-07-08 07:54:47.547+08	2014-07-08 07:54:47.547+08	\N	N	\N
967	uat_supervisor1	127.0.0.1	N	2014-07-08 16:48:55.072+08	2014-07-08 16:48:55.072+08	\N	N	\N
968	uat_supervisor1	127.0.0.1	N	2014-07-08 16:49:00.553+08	2014-07-08 16:49:00.553+08	\N	N	\N
969	uat_supervisor1	127.0.0.1	Y	2014-07-08 16:49:06.639+08	2014-07-08 16:49:06.639+08	\N	N	\N
970	uat_artist1	127.0.0.1	Y	2014-07-08 16:49:42.201+08	2014-07-08 16:49:42.201+08	\N	N	\N
971	esp	127.0.0.1	Y	2014-07-08 16:16:52.587+08	2014-07-08 16:16:52.587+08	\N	N	\N
972	uat_artist1	127.0.0.1	Y	2014-07-08 16:21:26.094+08	2014-07-08 16:21:26.094+08	\N	N	\N
973	uat_qc1	127.0.0.1	Y	2014-07-08 16:21:34.51+08	2014-07-08 16:21:34.51+08	\N	N	\N
974	esp	127.0.0.1	Y	2014-07-08 16:22:56.245+08	2014-07-08 16:22:56.245+08	\N	N	\N
975	uat_customer1	127.0.0.1	Y	2014-07-08 16:24:18.344+08	2014-07-08 16:24:18.344+08	\N	N	\N
976	esp	127.0.0.1	Y	2014-07-08 16:24:44.519+08	2014-07-08 16:24:44.519+08	\N	N	\N
977	uat_customer1	127.0.0.1	Y	2014-07-08 16:37:58.98+08	2014-07-08 16:37:58.98+08	\N	N	\N
978	uat_supervisor1	127.0.0.1	Y	2014-07-08 16:53:56.683+08	2014-07-08 16:53:56.683+08	\N	N	\N
979	uat_artist1	127.0.0.1	Y	2014-07-08 16:54:38.637+08	2014-07-08 16:54:38.637+08	\N	N	\N
980	uat_artist1	127.0.0.1	N	2014-07-08 16:54:51.855+08	2014-07-08 16:54:51.855+08	\N	N	\N
981	uat_artist1	127.0.0.1	Y	2014-07-08 16:55:52.448+08	2014-07-08 16:55:52.448+08	\N	N	\N
982	uat_qc1	127.0.0.1	Y	2014-07-08 16:56:13.153+08	2014-07-08 16:56:13.153+08	\N	N	\N
983	uat_customer1	127.0.0.1	Y	2014-07-08 16:58:14.543+08	2014-07-08 16:58:14.543+08	\N	N	\N
984	uat_customer1	127.0.0.1	Y	2014-07-09 10:25:12.725+08	2014-07-09 10:25:12.725+08	\N	N	\N
985	esp	127.0.0.1	Y	2014-07-11 11:38:53.422+08	2014-07-11 11:38:53.422+08	\N	N	\N
986	admin	::1	Y	2014-07-13 16:13:27.283+08	2014-07-13 16:13:27.283+08	\N	N	\N
987	uat_customer1	::1	Y	2014-07-13 23:14:36.204+08	2014-07-13 23:14:36.204+08	\N	N	\N
988	admin	::1	Y	2014-07-13 23:16:08.118+08	2014-07-13 23:16:08.118+08	\N	N	\N
989	admin	::1	Y	2014-07-14 00:52:19.6+08	2014-07-14 00:52:19.6+08	\N	N	\N
990	uat_customer1	::1	Y	2014-07-14 01:10:33.729+08	2014-07-14 01:10:33.729+08	\N	N	\N
991	uat_customer2	::1	Y	2014-07-14 01:11:35.251+08	2014-07-14 01:11:35.251+08	\N	N	\N
992	uat_customer1	::1	N	2014-07-14 01:14:31.96+08	2014-07-14 01:14:31.96+08	\N	N	\N
993	uat_customer1	::1	Y	2014-07-14 01:14:38.463+08	2014-07-14 01:14:38.463+08	\N	N	\N
994	admin	::1	Y	2014-07-15 16:15:25.713+08	2014-07-15 16:15:25.713+08	\N	N	\N
995	admin	::1	Y	2014-07-15 22:02:36.93+08	2014-07-15 22:02:36.93+08	\N	N	\N
996	admin	::1	Y	2014-07-15 22:03:44.97+08	2014-07-15 22:03:44.97+08	\N	N	\N
997	admin	::1	Y	2014-07-15 22:06:23.228+08	2014-07-15 22:06:23.228+08	\N	N	\N
998	admin	::1	Y	2014-07-19 12:37:18.714+08	2014-07-19 12:37:18.714+08	\N	N	\N
999	admin	::1	Y	2014-07-20 15:03:30.328+08	2014-07-20 15:03:30.328+08	\N	N	\N
1000	admin	::1	Y	2014-07-24 14:17:10.722+08	2014-07-24 14:17:10.722+08	\N	N	\N
1001	uat_customer1	::1	Y	2014-07-24 14:30:17.12+08	2014-07-24 14:30:17.12+08	\N	N	\N
\.


--
-- Name: fcuserlogin_ul_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcuserlogin_ul_id_seq', 1001, true);


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
96	newcust	15	14	1
\.


--
-- Name: fcuserorgrole_uor_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcuserorgrole_uor_id_seq', 96, true);


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
879	hq1fe2cc46153niigrou5j1hi1	esp	127.0.0.1	Y	2014-07-11 11:38:53.569+08	2014-07-11 11:38:53+08	\N
893	8c13m003nm6nnf4vlt18pccgi6	admin	::1	Y	2014-07-24 14:17:11.221+08	2014-07-24 14:17:11+08	\N
894	vrvglgtf9i9dk7sqqngp958io5	uat_customer1	::1	Y	2014-07-24 14:30:17.154+08	2014-07-24 14:30:17+08	\N
\.


--
-- Name: fcusersession_us_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcusersession_us_id_seq', 894, true);


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
-- Data for Name: mcmanilox; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY mcmanilox (ma_id, ma_mcid, ma_num, ma_type, ma_value) FROM stdin;
1	1	1	CEWDB	12
2	1	2	CEWDB	15
3	1	3	CEWDB	14
\.


--
-- Name: mcmanilox_ma_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('mcmanilox_ma_id_seq', 3, true);


--
-- Data for Name: mcmcylplate; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY mcmcylplate (mcp_id, mcp_mcid, mcp_num, mcp_value) FROM stdin;
1	1	1	12
2	1	2	12
3	1	3	1
\.


--
-- Name: mcmcylplate_mcp_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('mcmcylplate_mcp_id_seq', 3, true);


--
-- Data for Name: mcmcylrepeat; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY mcmcylrepeat (mcr_id, mcr_mcid, mcr_num, mcr_value) FROM stdin;
1	1	1	1
2	1	2	2
3	1	3	1
\.


--
-- Name: mcmcylrepeat_mcr_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('mcmcylrepeat_mcr_id_seq', 3, true);


--
-- Data for Name: mcmcylsubstrate; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY mcmcylsubstrate (mcs_id, mcs_mcid, mcs_num, mcs_value) FROM stdin;
1	1	1	1
2	1	2	2
3	1	3	1
\.


--
-- Name: mcmcylsubstrate_mcs_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('mcmcylsubstrate_mcs_id_seq', 3, true);


--
-- Data for Name: mcmline; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY mcmline (ml_id, ml_mcid, ml_num, ml_value) FROM stdin;
1	1	1	1
2	1	2	2
3	1	3	1
\.


--
-- Name: mcmline_ml_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('mcmline_ml_id_seq', 3, true);


--
-- Data for Name: mcustmachine; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY mcustmachine (mc_id, mc_orgid, mc_name, mc_type, mc_colorslot, mc_width, mc_density, mc_visosity) FROM stdin;
1	9	Printer 1	FLEXO	3	12	11	22
\.


--
-- Name: mcustmachine_mc_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('mcustmachine_mc_id_seq', 4, true);


--
-- Name: mcustmachine_mc_id_seq1; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('mcustmachine_mc_id_seq1', 1, true);


--
-- Data for Name: mcustmachine_old; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY mcustmachine_old (mc_id, mc_orgid, mc_pressmanufacturer, mc_pressyearbuilt, mc_pressmodel, mc_presswidth, mc_presstype, mc_pressspeed, mc_presscylinderrepeat, mc_inkmanufacturer, mc_inkcommercialname, mc_inktype, mc_inktypeother, mc_inkviscosity, mc_inkvicosityother, mc_inkprintingunit_1, mc_inkprintingunit_2, mc_inkprintingunit_3, mc_inkprintingunit_4, mc_inkprintingunit_5, mc_inkvisocity_1, mc_inkvisocity_2, mc_inkvisocity_3, mc_inkvisocity_4, mc_inkvisocity_5, mc_inkph_1, mc_inkph_2, mc_inkph_3, mc_inkph_4, mc_inkph_5, mc_inkdensity_1, mc_inkdensity_2, mc_inkdensity_3, mc_inkdensity_4, mc_inkdensity_5, mc_platemanufacturer, mc_platecommercialname, mc_platetype, mc_platedurometer, mc_platethickness, mc_platerelief, mc_mountingtapemanufacturer, mc_mountingtapename, mc_mountingtapedensity, mc_mountingtapthickness, mc_mountingcarrierthickness, mc_mountingcushionmanufacturer, mc_mountingcushonname, mc_mountingdensity, mc_mountingcushionthickness, mc_cimplevel_1, mc_cimplevel_2, mc_cimplevel_3, mc_cimplevel_4, mc_cimplevel_5, mc_cimpsubstrate_1, mc_cimpsubstrate_2, mc_cimpsubstrate_3, mc_cimpsubstrate_4, mc_cimpsubstrate_5, mc_cimpanlox_1, mc_cimpanlox_2, mc_cimpanlox_3, mc_cimpanlox_4, mc_cimpanlox_5, mc_aniloxmanufacturer, mc_aniloxtype, mc_aniloxengravingangle, mc_aniloxinking, mc_aniloxprintingunit_1, mc_aniloxprintingunit_2, mc_aniloxprintingunit_3, mc_aniloxprintingunit_4, mc_aniloxprintingunit_5, mc_aniloxmanufacturer_1, mc_aniloxmanufacturer_2, mc_aniloxmanufacturer_3, mc_aniloxmanufacturer_4, mc_aniloxmanufacturer_5, mc_aniloxtype_1, mc_aniloxtype_2, mc_aniloxtype_3, mc_aniloxtype_4, mc_aniloxtype_5, mc_aniloxengravingangle_1, mc_aniloxengravingangle_2, mc_aniloxengravingangle_3, mc_aniloxengravingangle_4, mc_aniloxengravingangle_5, mc_aniloxinking_1, mc_aniloxinking_2, mc_aniloxinking_3, mc_aniloxinking_4, mc_aniloxinking_5, mc_aniloxcellcount_1, mc_aniloxcellcount_2, mc_aniloxcellcount_3, mc_aniloxcellcount_4, mc_aniloxcellcount_5, mc_aniloxvolumn_1, mc_aniloxvolumn_2, mc_aniloxvolumn_3, mc_aniloxvolumn_4, mc_aniloxvolumn_5, mc_aniloxdoration_1, mc_aniloxdoration_2, mc_aniloxdoration_3, mc_aniloxdoration_4, mc_aniloxdoration_5, mc_aniloxdoctoring_1, mc_aniloxdoctoring_2, mc_aniloxdoctoring_3, mc_aniloxdoctoring_4, mc_aniloxdoctoring_5, mc_aniloxcontainment_1, mc_aniloxcontainment_2, mc_aniloxcontainment_3, mc_aniloxcontainment_4, mc_aniloxcontainment_5, mc_substratemanufacturer, mc_substratename, mc_substratetype, mc_substratedyna, mc_substrateweight, mc_substrateflute, mc_substratethickness, mc_printer_name) FROM stdin;
1	2	Facture1	1958	Model 1	1230	Stack	100	1000	Ink manufacturer	Ink manufacturer commercial name	Water Based	1234	Auto	1233	Ink Printing Unit 1	Ink PU2	Ink PU3	Ink PU4	Ink PU5	Ink Vis1	Ink Vis2	Ink Vis3	Ink Vis4	Ink Vis5	Ink ph1	Ink ph2	Ink ph3	Ink ph4	Ink ph5	Ink des1	Ink des2	Ink des3	Ink des4	Ink des5	Plate manufacturer	plate commercial name	Solid, Liquid	plate durometer	123	123	Mounting manufacturer	Mounting manufacturer comercial name	Mountting Density	11	22	Mounting carrier manufacturer	Mounting carrier manufacturer commercial name	Mounting carrier manufacturer density	123	CI imp lvl 1	CI imp lvl 2	CI imp lvl 3	CI imp lvl 4	CI imp lvl 5	11	22	33	44	55	123	123	123	123	13	Doctor manufacturer	Laser Engraved Ceramic	N	N	1	2	3	4	5	1	2	3	4	5	11	2	3	4	5	1	2	3	4	5	1	2	5	3	4	1	2	3	4	5	1	2	3	4	5	1	2	3	4	5	1	2	3	4	5	1	2	3	4	5	Subrate manufacturer	Subrate manufacturer 11	Film	2	2	11	11	Printer ABC
2	10	pressmanufacturer	yearbuild	model	width	Stack	speed	cylinderrepeat	inkmanufacturer	commercialname	U.V	typeother	Manual	viscosityother	printingunit1	printingunit2	printingunit3	printingunit4	printingunit5	viscosity1	viscosity2	viscosity3	viscosity4	viscosity5	ph1	ph2	ph3	ph4	ph5	density1	density2	density3	density4	density5	platesmanufacturer	platescommercialname	Uncapped	durometer	tickness	relief	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Printer 123
3	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Printer for customer 1
4	13	Printer 1 for customer 4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Printer 1 for customer 4
\.


--
-- Data for Name: mcustprinter; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY mcustprinter (cp_id, cp_orgid, cp_printertype, cp_colorslot) FROM stdin;
\.


--
-- Name: mcustprinter_cp_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('mcustprinter_cp_id_seq', 1, false);


--
-- Data for Name: minvoice; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY minvoice (iv_id, iv_invoicedate, iv_created, iv_orgid, iv_amount, iv_paid, iv_paydate, iv_currency, iv_jsid) FROM stdin;
25	2014-07-15 22:07:06.571+08	2014-07-15 21:49:55.607+08	9	25.0000	N	2014-07-20 18:27:32.175+08	MYR	132
35	2014-07-20 18:27:32.098+08	2014-07-19 23:12:14.766+08	9	43.0000	N	2014-07-20 18:27:32.259+08	MYR	132
22	2014-06-01 00:00:00+08	2014-07-13 22:26:42.876+08	7	11.0000	N	\N	\N	132
17	2014-01-01 00:00:00+08	2014-07-13 22:26:17.627+08	9	72.0000	N	2014-07-19 23:11:42.694+08	\N	132
20	2014-02-01 00:00:00+08	2014-07-13 22:26:32.496+08	9	25.0000	N	2014-07-19 23:11:42.694+08	\N	132
19	2014-03-01 00:00:00+08	2014-07-13 22:26:27.087+08	9	67.0000	N	2014-07-19 23:11:42.694+08	\N	132
18	2014-04-01 00:00:00+08	2014-07-13 22:26:22.516+08	9	99.0000	N	2014-07-19 23:11:42.694+08	\N	132
21	2014-05-01 00:00:00+08	2014-07-13 22:26:37.305+08	9	56.0000	N	2014-07-19 23:11:42.694+08	\N	132
\.


--
-- Name: minvoice_iv_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('minvoice_iv_id_seq', 35, true);


--
-- Data for Name: mjobbarcode; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY mjobbarcode (jbc_id, jbc_jsid, jbc_btcode, jbc_value) FROM stdin;
51	132	CODE39	EN2481101
52	132	CODE128	28811011
\.


--
-- Name: mjobbarcode_jbc_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('mjobbarcode_jbc_id_seq', 52, true);


--
-- Data for Name: mjobcat; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY mjobcat (jc_id, jc_jsid, jc_jclid) FROM stdin;
281	132	6
282	132	2
\.


--
-- Name: mjobcat_jc_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('mjobcat_jc_id_seq', 282, true);


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
108	132	2
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

COPY mjobsheet (js_id, js_orgid, js_ctid, js_request_date, js_request_by, js_title, js_model, js_description, js_material_provided, js_color_1, js_color_2, js_color_3, js_color_4, js_color_5, js_angle_1, js_angle_2, js_angle_3, js_angle_4, js_angle_5, js_bleeding, js_bleeding_remark, js_distortion, js_distortion_value, js_diecut_ind, js_diecut_no, js_trapping_size, js_primcat, js_status, js_completiondate, js_assignto, js_carid, js_decision, js_width, js_height, js_requiretime, js_request_dateinmth, js_jobcolor, js_lpi, js_mcid, js_code, js_month_occur, js_price, js_outputtype, js_outputwidth, js_outputheight, js_qcchecked, js_currency, js_finalprice, js_rate, js_totalinch) FROM stdin;
132	9	\N	2014-07-09 10:27:17.78+08	uat_customer1	\N	\N	Nescafe carton box	\N	#221100	#441122	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Y	\N	\N	2	REQUIREMENT VERIFICATION	2014-01-05 00:00:00+08	\N	\N	\N	\N	\N	300	Jul-2014	2	\N	\N	2014070001	1	25.0000	IMGSETTLE	1700	3000	\N	MYR	25.0000	1.0000	\N
133	9	\N	2014-07-19 21:38:23.902+08	\N	\N	\N	Nescafe carton box	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	REQUIREMENT VERIFICATION	\N	\N	\N	\N	\N	\N	\N	Jul-2014	\N	\N	\N	\N	\N	43.0000	\N	\N	\N	\N	MYR	43.0000	1.0000	\N
134	9	\N	2014-07-19 22:41:56.08+08	\N	\N	\N	Nescafe carton box	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	REQUIREMENT VERIFICATION	\N	\N	\N	\N	\N	\N	\N	Jul-2014	\N	\N	\N	\N	\N	43.0000	\N	\N	\N	\N	MYR	43.0000	1.0000	\N
\.


--
-- Name: mjobsheet_js_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('mjobsheet_js_id_seq', 134, true);


--
-- Data for Name: mjscartonvalue; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY mjscartonvalue (caval_id, caval_value, carval_carcode, carval_carid, carval_jsid) FROM stdin;
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
-- Data for Name: mpayment; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY mpayment (pay_id, pay_created, pay_amount, pay_currency, pay_allocatedamount, pay_orgid, pay_status) FROM stdin;
8	2014-07-19 23:11:42.694+08	343.0000	\N	343.0000	9	A
9	2014-07-19 23:11:56.257+08	100.0000	\N	88.0000	9	D
\.


--
-- Name: mpayment_pay_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('mpayment_pay_id_seq', 9, true);


--
-- Data for Name: mpaymentinvoice; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY mpaymentinvoice (pi_id, pi_created, pi_payid, pi_ivid, pi_amount) FROM stdin;
21	2014-07-19 23:11:42.694+08	8	17	72.0000
22	2014-07-19 23:11:42.694+08	8	20	25.0000
23	2014-07-19 23:11:42.694+08	8	19	67.0000
24	2014-07-19 23:11:42.694+08	8	18	99.0000
25	2014-07-19 23:11:42.694+08	8	21	56.0000
26	2014-07-19 23:11:42.694+08	8	25	24.0000
31	2014-07-20 18:27:32.22+08	9	25	1.0000
32	2014-07-20 18:27:32.298+08	9	35	43.0000
33	2014-07-20 18:27:32.346+08	9	\N	12.0000
\.


--
-- Name: mpaymentinvoice_pi_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('mpaymentinvoice_pi_id_seq', 33, true);


--
-- Data for Name: mregion; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY mregion (rg_code, rg_currency, rg_convert) FROM stdin;
LOCAL	MYR	N
ASIA	USD	Y
EURO	USD	N
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
1	newcust	2014-07-03 15:39:19.276+08	AGREE
1	uat_customer5	2014-07-04 14:01:56.496+08	AGREE
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

SELECT pg_catalog.setval('pndjoboutput_jo_id_seq', 108, true);


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
-- Name: const_fccurrency_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fccurrency
    ADD CONSTRAINT const_fccurrency_prikey PRIMARY KEY (cr_code);


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

ALTER TABLE ONLY mcustmachine_old
    ADD CONSTRAINT const_mcustmachine_prikey PRIMARY KEY (mc_id);


--
-- Name: const_mcustprinter_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY mcustprinter
    ADD CONSTRAINT const_mcustprinter_prikey PRIMARY KEY (cp_id);


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
-- Name: const_mregion_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY mregion
    ADD CONSTRAINT const_mregion_prikey PRIMARY KEY (rg_code);


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
-- Name: idx_carvalue_jsid; Type: INDEX; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE INDEX idx_carvalue_jsid ON mjscartonvalue USING btree (carval_jsid);


--
-- Name: idx_caseflow_duedate; Type: INDEX; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE INDEX idx_caseflow_duedate ON fcpmcaseflow USING btree (pmf_end_date, pmf_timer_due_date);


--
-- Name: idx_caseflow_endby; Type: INDEX; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE INDEX idx_caseflow_endby ON fcpmcaseflow USING btree (pmf_end_by);


--
-- Name: idx_caseflow_objid_objtype; Type: INDEX; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE INDEX idx_caseflow_objid_objtype ON fcpmcaseflow USING btree (pmf_obj_id, pmf_obj_type);


--
-- Name: idx_caseflow_startdate; Type: INDEX; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE INDEX idx_caseflow_startdate ON fcpmcaseflow USING btree (pmf_start_date);


--
-- Name: idx_caseflowassign_userid_orgid_rolid_pmscode; Type: INDEX; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE INDEX idx_caseflowassign_userid_orgid_rolid_pmscode ON fcpmcaseflowassign USING btree (pmfa_userid, pmfa_orgid, pmfa_rolid, pmfa_pmscode);


--
-- Name: idx_cat_userid_status; Type: INDEX; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE INDEX idx_cat_userid_status ON fcuserdiary USING btree (di_cat, di_userid, di_status);


--
-- Name: idx_doc_refid_reftype; Type: INDEX; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE INDEX idx_doc_refid_reftype ON fcdoc USING btree (fd_refid, fd_reftype);


--
-- Name: idx_jobcat_jsid; Type: INDEX; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE INDEX idx_jobcat_jsid ON mjobcat USING btree (jc_jsid);


--
-- Name: idx_joboutput_jsid; Type: INDEX; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE INDEX idx_joboutput_jsid ON mjoboutput USING btree (jo_jsid);


--
-- Name: idx_jobsheet_jobcode; Type: INDEX; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE UNIQUE INDEX idx_jobsheet_jobcode ON mjobsheet USING btree (js_code);


--
-- Name: idx_jobsheet_primcat; Type: INDEX; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE INDEX idx_jobsheet_primcat ON mjobsheet USING btree (js_primcat);


--
-- Name: idx_jobsheet_requestdate; Type: INDEX; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE INDEX idx_jobsheet_requestdate ON mjobsheet USING btree (js_request_date, js_request_dateinmth, js_primcat);


--
-- Name: idx_jobsheet_status; Type: INDEX; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE INDEX idx_jobsheet_status ON mjobsheet USING btree (js_status);


--
-- Name: idx_mtncacceptance_userid; Type: INDEX; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE INDEX idx_mtncacceptance_userid ON mtncacceptance USING btree (tca_userid);


--
-- Name: idx_swimlane_userid_orgid_rolid_pmscode; Type: INDEX; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE INDEX idx_swimlane_userid_orgid_rolid_pmscode ON fcpmswimlanesetup USING btree (pmss_userid, pmss_orgid, pmss_rolid, pmss_pmscode);


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
-- PostgreSQL database dump complete
--

