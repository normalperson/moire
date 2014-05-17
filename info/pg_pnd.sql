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
-- Name: pnd_bk23apr2014; Type: SCHEMA; Schema: -; Owner: pnd
--

CREATE SCHEMA pnd_bk23apr2014;


ALTER SCHEMA pnd_bk23apr2014 OWNER TO pnd;

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
FOR i IN 2..11 LOOP

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

insert into fcpmcaseflow(pmf_pmcid, pmf_obj_id,pmf_obj_type,pmf_start_date,pmf_due_date,pmf_specific_userid)
values(caseid,5,'PM_Activity',now(),currenttime + interval '20 minutes','qc');

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

insert into fcpmcaseflow(pmf_pmcid, pmf_obj_id,pmf_obj_type,pmf_start_date,pmf_due_date,pmf_specific_userid)
values(caseid,5,'PM_Activity',now(),currenttime + interval '30 minutes','qc');

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

insert into fcpmcaseflow(pmf_pmcid, pmf_obj_id,pmf_obj_type,pmf_start_date,pmf_due_date,pmf_specific_userid)
values(caseid,6,'PM_Activity',now(),currenttime + interval '24 hour','customer');

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

insert into fcpmcaseflow(pmf_pmcid, pmf_obj_id,pmf_obj_type,pmf_start_date,pmf_due_date,pmf_specific_userid)
values(caseid,4,'PM_Activity',now(),currenttime + interval '45 minutes','artist1');

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

insert into fcpmcaseflow(pmf_pmcid, pmf_obj_id,pmf_obj_type,pmf_start_date,pmf_due_date,pmf_specific_userid)
values(caseid,4,'PM_Activity',now(),currenttime + interval '2 hour','artist1');

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

insert into fcpmcaseflow(pmf_pmcid, pmf_obj_id,pmf_obj_type,pmf_start_date,pmf_due_date,pmf_specific_userid)
values(caseid,3,'PM_Activity',now(),currenttime + interval '15 minutes','artist1');


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

insert into fcpmcaseflow(pmf_pmcid, pmf_obj_id,pmf_obj_type,pmf_start_date,pmf_due_date,pmf_specific_userid)
values(caseid,3,'PM_Activity',now(),currenttime + interval '1 hour','artist1');



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

insert into fcpmcaseflow(pmf_pmcid, pmf_obj_id,pmf_obj_type,pmf_start_date,pmf_due_date,pmf_specific_userid)
values(caseid,1,'PM_Activity',now(),currenttime + interval '15 minutes','supervisor');
    
end if;

if i = 11 then
insert into mjobsheet (js_cuid,js_ctid,js_request_date,js_status,js_completiondate,js_assignto,
js_title,js_model,js_description,
js_color_1,js_color_2,js_color_3,js_color_4,
js_angle_1,js_angle_2,js_angle_3,js_angle_4,
js_bleeding,js_primcat)
values(i,i-1,  currenttime ,'NEWJOB',null,null,
'New job '||i,'new job model '||i,'Description of new job'||i,
get_random_integer(1,100),get_random_integer(1,100),get_random_integer(1,100),get_random_integer(1,100),
get_random_integer(1,359),get_random_integer(1,359),get_random_integer(1,359),get_random_integer(1,359),
0,get_random_integer(1,8));

SELECT currval('mjobsheet_js_id_seq') into jobid;

INSERT INTO fcpmcase(
            pmc_created_date, pmc_created_by, pmc_casekey, pmc_casetype)
    VALUES (now(), 'Customer', jobid, 'jobsheet');

select currval('fcpmcase_pmc_id_seq') into caseid;

insert into fcpmcaseflow(pmf_pmcid, pmf_obj_id,pmf_obj_type,pmf_start_date,pmf_due_date,pmf_specific_userid)
values(caseid,7,'PM_Activity',now(),currenttime + interval '30 minutes','supervisor');
    
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

insert into fcpmcaseflow(pmf_pmcid, pmf_obj_id,pmf_obj_type,pmf_start_date,pmf_due_date,pmf_specific_userid)
values(caseid,1,'PM_Activity',now(),currenttime + interval '15 minutes','supervisor');

    
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

insert into fcpmcaseflow(pmf_pmcid, pmf_obj_id,pmf_obj_type,pmf_start_date,pmf_due_date,pmf_specific_userid)
values(caseid,2,'PM_Activity',now(),currenttime + interval '30 minutes','customer');

    
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
-- Name: fclang; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE fclang (
    lang_code character varying(5) NOT NULL,
    lang_name character varying(200),
    lang_status character varying(12) DEFAULT 'ACTIVE'::character varying
);


ALTER TABLE pnd.fclang OWNER TO pnd;

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
-- Name: fcmenu_mn_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: shine
--

ALTER SEQUENCE fcmenu_mn_id_seq OWNED BY fcmenu.mn_id;


--
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
-- Name: fcmenu_mn_parentid_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: shine
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
    org_status character varying(12) DEFAULT 'ACTIVE'::character varying
);


ALTER TABLE pnd.fcorg OWNER TO pnd;

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
    pmat_show_caseinfo character varying(1) DEFAULT 'N'::character varying
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
    pmf_end_by character varying(100)
);


ALTER TABLE pnd.fcpmcaseflow OWNER TO pnd;

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
    pmev_type character varying(32),
    pmev_type_cat character varying(32),
    pmev_intermediate_function character varying(100)
);


ALTER TABLE pnd.fcpmevent OWNER TO pnd;

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
    udv_result_lookup character varying(4000)
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
    di_status character varying(50) DEFAULT 'ACTIVE'::character varying
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
-- Name: mcarton; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE mcarton (
    car_id integer NOT NULL,
    car_name character varying(200)
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
    mc_aniloxdoctoring_1 character varying(50),
    mc_aniloxdoctoring_2 character varying(50),
    mc_aniloxdoctoring_3 character varying(50),
    mc_aniloxdoctoring_4 character varying(50),
    mc_aniloxdoctoring_5 character varying(50),
    mc_substratemanufacturer character varying(200),
    mc_substratename character varying(200),
    mc_substratetype character varying(50),
    mc_substratedyna character varying(50),
    mc_substrateweight character varying(50),
    mc_substrateflute character varying(50),
    mc_substratethickness character varying(50)
);


ALTER TABLE pnd.mcustmachine OWNER TO pnd;

--
-- Name: COLUMN mcustmachine.mc_orgid; Type: COMMENT; Schema: pnd; Owner: pnd
--

COMMENT ON COLUMN mcustmachine.mc_orgid IS 'foreign key to org_id';


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
-- Name: mforecast; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE mforecast (
    ft_id integer NOT NULL,
    ft_orgid integer,
    ft_year character varying(12),
    ft_janqty integer,
    ft_jansale numeric(20,4),
    ft_febqty integer,
    ft_febsale numeric(20,4),
    ft_marqty integer,
    ft_marsale numeric(20,4),
    ft_aprqty integer,
    ft_aprsale numeric(20,4),
    ft_mayqty integer,
    ft_maysale numeric(20,4),
    ft_junqty integer,
    ft_junsale numeric(20,4),
    ft_julqty integer,
    ft_julsale numeric(20,4),
    ft_augqty integer,
    ft_augsale numeric(20,4),
    ft_sepqty integer,
    ft_sepsale numeric(20,4),
    ft_octqty integer,
    ft_octsale numeric(20,4),
    ft_novqty integer,
    ft_novsale numeric(20,4),
    ft_decqty integer,
    ft_decsale numeric(20,4)
);


ALTER TABLE pnd.mforecast OWNER TO pnd;

--
-- Name: COLUMN mforecast.ft_orgid; Type: COMMENT; Schema: pnd; Owner: pnd
--

COMMENT ON COLUMN mforecast.ft_orgid IS 'foreign key to org_id';


--
-- Name: mforecast_ft_id_seq; Type: SEQUENCE; Schema: pnd; Owner: pnd
--

CREATE SEQUENCE mforecast_ft_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd.mforecast_ft_id_seq OWNER TO pnd;

--
-- Name: mforecast_ft_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE mforecast_ft_id_seq OWNED BY mforecast.ft_id;


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
    jcl_requiretime integer,
    jcl_sequence integer
);


ALTER TABLE pnd.mjobcatlookup OWNER TO pnd;

--
-- Name: COLUMN mjobcatlookup.jcl_requiretime; Type: COMMENT; Schema: pnd; Owner: pnd
--

COMMENT ON COLUMN mjobcatlookup.jcl_requiretime IS 'Require time store in minutes';


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
-- Name: mjobsheet; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE mjobsheet (
    js_id integer NOT NULL,
    js_cuid integer,
    js_ctid integer,
    js_request_date timestamp with time zone DEFAULT now(),
    js_request_by character varying(100),
    js_title character varying(100),
    js_description character varying(1000),
    js_material_provided character varying(100),
    js_cyan character varying(12),
    js_magenta character varying(12),
    js_yellow character varying(12),
    js_black character varying(12),
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
    js_carcode character varying(12),
    js_distortion character varying(1),
    js_distortion_value numeric(20,4),
    js_diecut_ind character varying(1),
    js_thicknessplate character varying(100),
    js_category character varying(500),
    js_trapping_size numeric(20,4),
    js_barcodetype integer,
    js_barcodenumber character varying(100),
    js_primcat integer,
    js_status character varying(100),
    js_completiondate timestamp with time zone,
    js_assignto character varying(50),
    js_refid integer
);


ALTER TABLE pnd.mjobsheet OWNER TO pnd;

--
-- Name: COLUMN mjobsheet.js_primcat; Type: COMMENT; Schema: pnd; Owner: pnd
--

COMMENT ON COLUMN mjobsheet.js_primcat IS 'primary job category';


--
-- Name: COLUMN mjobsheet.js_refid; Type: COMMENT; Schema: pnd; Owner: pnd
--

COMMENT ON COLUMN mjobsheet.js_refid IS 'reference to other job sheet';


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
    carval_carcode character varying(12)
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
    ct_email character varying(100)
);


ALTER TABLE pnd.pndcontact OWNER TO pnd;

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
-- Name: tmp_customersalesbycategory; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE tmp_customersalesbycategory (
    tmp_customername character varying(100) NOT NULL,
    tmp_mastercard character varying(100),
    tmp_colourseperation character varying(100),
    tmp_barcode character varying(100),
    tmp_trapping character varying(100),
    tmp_monotone character varying(100),
    tmp_total character varying(100),
    tmp_date character varying(100)
);


ALTER TABLE pnd.tmp_customersalesbycategory OWNER TO pnd;

--
-- Name: tmp_dailyactivity; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE tmp_dailyactivity (
    tmp_userid character varying(100) NOT NULL,
    tmp_date character varying(100) NOT NULL,
    tmp_time character varying(100),
    tmp_activity character varying(100),
    tmp_id integer NOT NULL
);


ALTER TABLE pnd.tmp_dailyactivity OWNER TO pnd;

--
-- Name: tmp_dailyactivity_tmp_id_seq; Type: SEQUENCE; Schema: pnd; Owner: pnd
--

CREATE SEQUENCE tmp_dailyactivity_tmp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd.tmp_dailyactivity_tmp_id_seq OWNER TO pnd;

--
-- Name: tmp_dailyactivity_tmp_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd; Owner: pnd
--

ALTER SEQUENCE tmp_dailyactivity_tmp_id_seq OWNED BY tmp_dailyactivity.tmp_id;


--
-- Name: tmp_dailysalereport; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE tmp_dailysalereport (
    tmp_date character varying(100) NOT NULL,
    tmp_typing character varying(100),
    tmp_drawing character varying(100),
    tmp_mastercard character varying(100),
    tmp_colorseperation character varying(100),
    tmp_barcode character varying(100),
    tmp_tapping character varying(100),
    tmp_total character varying(100)
);


ALTER TABLE pnd.tmp_dailysalereport OWNER TO pnd;

--
-- Name: tmp_jobstatusreport; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE tmp_jobstatusreport (
    tmp_jsid character varying(50) NOT NULL,
    tmp_submissiondate character varying(100),
    tmp_customername character varying(100),
    tmp_completiondate character varying(100),
    tmp_status character varying(50),
    tmp_category character varying(100),
    tmp_invoice character varying(100)
);


ALTER TABLE pnd.tmp_jobstatusreport OWNER TO pnd;

--
-- Name: tmp_monthsalesbycategory; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE tmp_monthsalesbycategory (
    tmp_cateogry character varying(100) NOT NULL,
    tmp_salesjan character varying(100),
    tmp_salesfeb character varying(100),
    tmp_salesmarch character varying(100),
    tmp_salesapril character varying(100),
    tmp_salesmay character varying(100),
    tmp_salesjune character varying(100),
    tmp_salesjuly character varying(100),
    tmp_salesaug character varying(100),
    tmp_salessept character varying(100),
    tmp_salesoct character varying(100),
    tmp_salesnov character varying(100),
    tmp_salesdev character varying(100)
);


ALTER TABLE pnd.tmp_monthsalesbycategory OWNER TO pnd;

--
-- Name: tmp_monthsalesbycustomer; Type: TABLE; Schema: pnd; Owner: pnd; Tablespace: 
--

CREATE TABLE tmp_monthsalesbycustomer (
    tmp_customername character varying(100) NOT NULL,
    tmp_salesjan character varying(100),
    tmp_salesfeb character varying(100),
    tmp_salesmarch character varying(100),
    tmp_salesapril character varying(100),
    tmp_salesmay character varying(100),
    tmp_salesjune character varying(100),
    tmp_salesjuly character varying(100),
    tmp_salesaug character varying(100),
    tmp_salessept character varying(100),
    tmp_salesoct character varying(100),
    tmp_salesnov character varying(100),
    tmp_salesdev character varying(100)
);


ALTER TABLE pnd.tmp_monthsalesbycustomer OWNER TO pnd;

SET search_path = pnd_bk23apr2014, pg_catalog;

--
-- Name: fccountry; Type: TABLE; Schema: pnd_bk23apr2014; Owner: shine; Tablespace: 
--

CREATE TABLE fccountry (
    con_code character varying(24) NOT NULL,
    con_name character varying(1000)
);


ALTER TABLE pnd_bk23apr2014.fccountry OWNER TO shine;

--
-- Name: fclang; Type: TABLE; Schema: pnd_bk23apr2014; Owner: shine; Tablespace: 
--

CREATE TABLE fclang (
    lang_id integer NOT NULL,
    lang_code character varying(5),
    lang_name character varying(200),
    lang_status character varying(12) DEFAULT 'ACTIVE'::character varying
);


ALTER TABLE pnd_bk23apr2014.fclang OWNER TO shine;

--
-- Name: fclang_lang_id_seq; Type: SEQUENCE; Schema: pnd_bk23apr2014; Owner: shine
--

CREATE SEQUENCE fclang_lang_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd_bk23apr2014.fclang_lang_id_seq OWNER TO shine;

--
-- Name: fclang_lang_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd_bk23apr2014; Owner: shine
--

ALTER SEQUENCE fclang_lang_id_seq OWNED BY fclang.lang_id;


--
-- Name: fclog; Type: TABLE; Schema: pnd_bk23apr2014; Owner: shine; Tablespace: 
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


ALTER TABLE pnd_bk23apr2014.fclog OWNER TO shine;

--
-- Name: fclog_log_id_seq; Type: SEQUENCE; Schema: pnd_bk23apr2014; Owner: shine
--

CREATE SEQUENCE fclog_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd_bk23apr2014.fclog_log_id_seq OWNER TO shine;

--
-- Name: fclog_log_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd_bk23apr2014; Owner: shine
--

ALTER SEQUENCE fclog_log_id_seq OWNED BY fclog.log_id;


--
-- Name: fclookup; Type: TABLE; Schema: pnd_bk23apr2014; Owner: shine; Tablespace: 
--

CREATE TABLE fclookup (
    lu_cat character varying(12) NOT NULL,
    lu_code character varying(50) NOT NULL,
    lu_parentcode character varying(12) DEFAULT 'ROOT'::character varying NOT NULL,
    lu_title character varying(50),
    lu_status character varying(12) DEFAULT 'ACTIVE'::character varying,
    lu_id integer NOT NULL
);


ALTER TABLE pnd_bk23apr2014.fclookup OWNER TO shine;

--
-- Name: fclookup_lu_id_seq; Type: SEQUENCE; Schema: pnd_bk23apr2014; Owner: shine
--

CREATE SEQUENCE fclookup_lu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd_bk23apr2014.fclookup_lu_id_seq OWNER TO shine;

--
-- Name: fclookup_lu_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd_bk23apr2014; Owner: shine
--

ALTER SEQUENCE fclookup_lu_id_seq OWNED BY fclookup.lu_id;


--
-- Name: fcmenu; Type: TABLE; Schema: pnd_bk23apr2014; Owner: shine; Tablespace: 
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


ALTER TABLE pnd_bk23apr2014.fcmenu OWNER TO shine;

--
-- Name: fcmenu_mn_id_seq; Type: SEQUENCE; Schema: pnd_bk23apr2014; Owner: shine
--

CREATE SEQUENCE fcmenu_mn_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd_bk23apr2014.fcmenu_mn_id_seq OWNER TO shine;

--
-- Name: fcmenu_mn_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd_bk23apr2014; Owner: shine
--

ALTER SEQUENCE fcmenu_mn_id_seq OWNED BY fcmenu.mn_id;


--
-- Name: fcmenu_mn_parentid_seq; Type: SEQUENCE; Schema: pnd_bk23apr2014; Owner: shine
--

CREATE SEQUENCE fcmenu_mn_parentid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd_bk23apr2014.fcmenu_mn_parentid_seq OWNER TO shine;

--
-- Name: fcmenu_mn_parentid_seq; Type: SEQUENCE OWNED BY; Schema: pnd_bk23apr2014; Owner: shine
--

ALTER SEQUENCE fcmenu_mn_parentid_seq OWNED BY fcmenu.mn_parentid;


--
-- Name: fcorg; Type: TABLE; Schema: pnd_bk23apr2014; Owner: pnd; Tablespace: 
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
    org_status character varying(12) DEFAULT 'ACTIVE'::character varying
);


ALTER TABLE pnd_bk23apr2014.fcorg OWNER TO pnd;

--
-- Name: fcorg_org_id_seq; Type: SEQUENCE; Schema: pnd_bk23apr2014; Owner: pnd
--

CREATE SEQUENCE fcorg_org_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd_bk23apr2014.fcorg_org_id_seq OWNER TO pnd;

--
-- Name: fcorg_org_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd_bk23apr2014; Owner: pnd
--

ALTER SEQUENCE fcorg_org_id_seq OWNED BY fcorg.org_id;


--
-- Name: fcpermission; Type: TABLE; Schema: pnd_bk23apr2014; Owner: shine; Tablespace: 
--

CREATE TABLE fcpermission (
    pms_id integer NOT NULL,
    pms_code character varying(50),
    pms_desc character varying(2000),
    last_modified_date timestamp with time zone DEFAULT now(),
    last_synchronized_date timestamp with time zone,
    record_synchronized character varying(1) DEFAULT 'N'::character varying,
    cloud_refid integer
);


ALTER TABLE pnd_bk23apr2014.fcpermission OWNER TO shine;

--
-- Name: fcpermission_pms_id_seq; Type: SEQUENCE; Schema: pnd_bk23apr2014; Owner: shine
--

CREATE SEQUENCE fcpermission_pms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd_bk23apr2014.fcpermission_pms_id_seq OWNER TO shine;

--
-- Name: fcpermission_pms_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd_bk23apr2014; Owner: shine
--

ALTER SEQUENCE fcpermission_pms_id_seq OWNED BY fcpermission.pms_id;


--
-- Name: fcpmcaseflow; Type: TABLE; Schema: pnd_bk23apr2014; Owner: shine; Tablespace: 
--

CREATE TABLE fcpmcaseflow (
    f_id integer NOT NULL,
    f_timestamp timestamp with time zone DEFAULT now(),
    f_opid integer,
    f_caseid character varying(50),
    f_casetype character varying(32),
    f_status character varying(12),
    f_del_timestamp timestamp with time zone,
    f_userid character varying(50),
    f_decision character varying(100)
);


ALTER TABLE pnd_bk23apr2014.fcpmcaseflow OWNER TO shine;

--
-- Name: fcpmcaseflow_f_id_seq; Type: SEQUENCE; Schema: pnd_bk23apr2014; Owner: shine
--

CREATE SEQUENCE fcpmcaseflow_f_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd_bk23apr2014.fcpmcaseflow_f_id_seq OWNER TO shine;

--
-- Name: fcpmcaseflow_f_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd_bk23apr2014; Owner: shine
--

ALTER SEQUENCE fcpmcaseflow_f_id_seq OWNED BY fcpmcaseflow.f_id;


--
-- Name: fcpmcasetype; Type: TABLE; Schema: pnd_bk23apr2014; Owner: shine; Tablespace: 
--

CREATE TABLE fcpmcasetype (
    ct_code character varying(32) NOT NULL,
    ct_desc character varying(100),
    ct_table character varying(100),
    ct_desc_col character varying(100),
    ct_key_col character varying(100)
);


ALTER TABLE pnd_bk23apr2014.fcpmcasetype OWNER TO shine;

--
-- Name: fcpmoperation; Type: TABLE; Schema: pnd_bk23apr2014; Owner: shine; Tablespace: 
--

CREATE TABLE fcpmoperation (
    op_id integer NOT NULL,
    op_parentid integer,
    op_wfid integer,
    op_name character varying(100),
    op_type character varying(16),
    op_x integer,
    op_y integer,
    op_next_opid integer,
    op_escalate_opid integer,
    op_userrole character varying(2000),
    op_task_func character varying(100),
    op_pmscode character varying(50)
);


ALTER TABLE pnd_bk23apr2014.fcpmoperation OWNER TO shine;

--
-- Name: fcpmoperation_op_id_seq; Type: SEQUENCE; Schema: pnd_bk23apr2014; Owner: shine
--

CREATE SEQUENCE fcpmoperation_op_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd_bk23apr2014.fcpmoperation_op_id_seq OWNER TO shine;

--
-- Name: fcpmoperation_op_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd_bk23apr2014; Owner: shine
--

ALTER SEQUENCE fcpmoperation_op_id_seq OWNED BY fcpmoperation.op_id;


--
-- Name: fcpmoperationtype; Type: TABLE; Schema: pnd_bk23apr2014; Owner: shine; Tablespace: 
--

CREATE TABLE fcpmoperationtype (
    opt_code character varying(16) NOT NULL,
    opt_name character varying(50),
    opt_order integer,
    opt_ui character varying(1) DEFAULT 'N'::character varying,
    opt_method character varying(200),
    opt_shape character varying(32),
    opt_bgcolor character varying(32),
    opt_icon character varying(50),
    opt_fontcolor character varying(32)
);


ALTER TABLE pnd_bk23apr2014.fcpmoperationtype OWNER TO shine;

--
-- Name: fcpmworkflow; Type: TABLE; Schema: pnd_bk23apr2014; Owner: shine; Tablespace: 
--

CREATE TABLE fcpmworkflow (
    wf_id integer NOT NULL,
    wf_name character varying(100),
    wf_seq integer,
    wf_userrole character varying(2000),
    wf_status character varying(50) DEFAULT 'ACTIVE'::character varying
);


ALTER TABLE pnd_bk23apr2014.fcpmworkflow OWNER TO shine;

--
-- Name: fcpmworkflow_wf_id_seq; Type: SEQUENCE; Schema: pnd_bk23apr2014; Owner: shine
--

CREATE SEQUENCE fcpmworkflow_wf_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd_bk23apr2014.fcpmworkflow_wf_id_seq OWNER TO shine;

--
-- Name: fcpmworkflow_wf_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd_bk23apr2014; Owner: shine
--

ALTER SEQUENCE fcpmworkflow_wf_id_seq OWNED BY fcpmworkflow.wf_id;


--
-- Name: fcrole; Type: TABLE; Schema: pnd_bk23apr2014; Owner: shine; Tablespace: 
--

CREATE TABLE fcrole (
    rol_id integer NOT NULL,
    rol_code character varying(12),
    rol_desc character varying(2000),
    last_modified_date timestamp with time zone DEFAULT now(),
    last_synchronized_date timestamp with time zone,
    record_synchronized character varying(1) DEFAULT 'N'::character varying,
    cloud_refid integer,
    rol_status character varying(32) DEFAULT 'ACTIVE'::character varying
);


ALTER TABLE pnd_bk23apr2014.fcrole OWNER TO shine;

--
-- Name: fcrole_rol_id_seq; Type: SEQUENCE; Schema: pnd_bk23apr2014; Owner: shine
--

CREATE SEQUENCE fcrole_rol_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd_bk23apr2014.fcrole_rol_id_seq OWNER TO shine;

--
-- Name: fcrole_rol_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd_bk23apr2014; Owner: shine
--

ALTER SEQUENCE fcrole_rol_id_seq OWNED BY fcrole.rol_id;


--
-- Name: fcroleperm; Type: TABLE; Schema: pnd_bk23apr2014; Owner: shine; Tablespace: 
--

CREATE TABLE fcroleperm (
    rp_id integer NOT NULL,
    rp_rolid integer,
    rp_pmsid integer
);


ALTER TABLE pnd_bk23apr2014.fcroleperm OWNER TO shine;

--
-- Name: fcroleperm_rp_id_seq; Type: SEQUENCE; Schema: pnd_bk23apr2014; Owner: shine
--

CREATE SEQUENCE fcroleperm_rp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd_bk23apr2014.fcroleperm_rp_id_seq OWNER TO shine;

--
-- Name: fcroleperm_rp_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd_bk23apr2014; Owner: shine
--

ALTER SEQUENCE fcroleperm_rp_id_seq OWNED BY fcroleperm.rp_id;


--
-- Name: fcrule; Type: TABLE; Schema: pnd_bk23apr2014; Owner: shine; Tablespace: 
--

CREATE TABLE fcrule (
    ru_id integer NOT NULL,
    ru_name character varying(100),
    ru_true_msg character varying(200),
    ru_false_msg character varying(200),
    ru_data character varying(4000)
);


ALTER TABLE pnd_bk23apr2014.fcrule OWNER TO shine;

--
-- Name: fcrule_ru_id_seq; Type: SEQUENCE; Schema: pnd_bk23apr2014; Owner: shine
--

CREATE SEQUENCE fcrule_ru_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd_bk23apr2014.fcrule_ru_id_seq OWNER TO shine;

--
-- Name: fcrule_ru_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd_bk23apr2014; Owner: shine
--

ALTER SEQUENCE fcrule_ru_id_seq OWNED BY fcrule.ru_id;


--
-- Name: fcsetting; Type: TABLE; Schema: pnd_bk23apr2014; Owner: shine; Tablespace: 
--

CREATE TABLE fcsetting (
    set_id integer NOT NULL,
    set_user character varying(100) DEFAULT 'shine'::character varying,
    set_code character varying(32),
    set_description character varying(4000),
    set_val character varying(1000),
    last_modified_date timestamp with time zone DEFAULT now(),
    last_synchronized_date timestamp with time zone,
    record_synchronized character varying(1) DEFAULT 'N'::character varying,
    cloud_refid integer
);


ALTER TABLE pnd_bk23apr2014.fcsetting OWNER TO shine;

--
-- Name: COLUMN fcsetting.set_id; Type: COMMENT; Schema: pnd_bk23apr2014; Owner: shine
--

COMMENT ON COLUMN fcsetting.set_id IS 'setting id';


--
-- Name: COLUMN fcsetting.set_description; Type: COMMENT; Schema: pnd_bk23apr2014; Owner: shine
--

COMMENT ON COLUMN fcsetting.set_description IS 'setting description';


--
-- Name: COLUMN fcsetting.set_val; Type: COMMENT; Schema: pnd_bk23apr2014; Owner: shine
--

COMMENT ON COLUMN fcsetting.set_val IS 'setting value';


--
-- Name: fcsetting_set_id_seq; Type: SEQUENCE; Schema: pnd_bk23apr2014; Owner: shine
--

CREATE SEQUENCE fcsetting_set_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd_bk23apr2014.fcsetting_set_id_seq OWNER TO shine;

--
-- Name: fcsetting_set_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd_bk23apr2014; Owner: shine
--

ALTER SEQUENCE fcsetting_set_id_seq OWNED BY fcsetting.set_id;


--
-- Name: fcudv; Type: TABLE; Schema: pnd_bk23apr2014; Owner: shine; Tablespace: 
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


ALTER TABLE pnd_bk23apr2014.fcudv OWNER TO shine;

--
-- Name: fcuser; Type: TABLE; Schema: pnd_bk23apr2014; Owner: shine; Tablespace: 
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
    usr_langid integer,
    usr_status character varying(32) DEFAULT 'ACTIVE'::character varying
);


ALTER TABLE pnd_bk23apr2014.fcuser OWNER TO shine;

--
-- Name: fcuserdiary; Type: TABLE; Schema: pnd_bk23apr2014; Owner: shine; Tablespace: 
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


ALTER TABLE pnd_bk23apr2014.fcuserdiary OWNER TO shine;

--
-- Name: fcuserdiary_di_id_seq; Type: SEQUENCE; Schema: pnd_bk23apr2014; Owner: shine
--

CREATE SEQUENCE fcuserdiary_di_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd_bk23apr2014.fcuserdiary_di_id_seq OWNER TO shine;

--
-- Name: fcuserdiary_di_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd_bk23apr2014; Owner: shine
--

ALTER SEQUENCE fcuserdiary_di_id_seq OWNED BY fcuserdiary.di_id;


--
-- Name: fcuserlogin; Type: TABLE; Schema: pnd_bk23apr2014; Owner: shine; Tablespace: 
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


ALTER TABLE pnd_bk23apr2014.fcuserlogin OWNER TO shine;

--
-- Name: fcuserlogin_ul_id_seq; Type: SEQUENCE; Schema: pnd_bk23apr2014; Owner: shine
--

CREATE SEQUENCE fcuserlogin_ul_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd_bk23apr2014.fcuserlogin_ul_id_seq OWNER TO shine;

--
-- Name: fcuserlogin_ul_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd_bk23apr2014; Owner: shine
--

ALTER SEQUENCE fcuserlogin_ul_id_seq OWNED BY fcuserlogin.ul_id;


--
-- Name: fcuserorgrole; Type: TABLE; Schema: pnd_bk23apr2014; Owner: shine; Tablespace: 
--

CREATE TABLE fcuserorgrole (
    uor_id integer NOT NULL,
    uor_usrid character varying(50),
    uor_orgid integer,
    uor_rolid integer,
    uor_seq integer
);


ALTER TABLE pnd_bk23apr2014.fcuserorgrole OWNER TO shine;

--
-- Name: fcuserorgrole_uor_id_seq; Type: SEQUENCE; Schema: pnd_bk23apr2014; Owner: shine
--

CREATE SEQUENCE fcuserorgrole_uor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd_bk23apr2014.fcuserorgrole_uor_id_seq OWNER TO shine;

--
-- Name: fcuserorgrole_uor_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd_bk23apr2014; Owner: shine
--

ALTER SEQUENCE fcuserorgrole_uor_id_seq OWNED BY fcuserorgrole.uor_id;


--
-- Name: fcusersession; Type: TABLE; Schema: pnd_bk23apr2014; Owner: shine; Tablespace: 
--

CREATE TABLE fcusersession (
    us_id integer NOT NULL,
    us_sessid character varying(40),
    us_userid character varying(50),
    us_ip character varying(45),
    us_active character varying(4) DEFAULT 'Y'::character varying,
    us_created timestamp with time zone DEFAULT now(),
    us_last_active timestamp with time zone DEFAULT now(),
    us_forcecloseby integer,
    last_modified_date timestamp with time zone DEFAULT now(),
    last_synchronized_date timestamp with time zone,
    record_synchronized character varying(1) DEFAULT 'N'::character varying,
    cloud_refid integer
);


ALTER TABLE pnd_bk23apr2014.fcusersession OWNER TO shine;

--
-- Name: COLUMN fcusersession.us_sessid; Type: COMMENT; Schema: pnd_bk23apr2014; Owner: shine
--

COMMENT ON COLUMN fcusersession.us_sessid IS 'PHP session id';


--
-- Name: fcusersession_us_id_seq; Type: SEQUENCE; Schema: pnd_bk23apr2014; Owner: shine
--

CREATE SEQUENCE fcusersession_us_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd_bk23apr2014.fcusersession_us_id_seq OWNER TO shine;

--
-- Name: fcusersession_us_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd_bk23apr2014; Owner: shine
--

ALTER SEQUENCE fcusersession_us_id_seq OWNED BY fcusersession.us_id;


--
-- Name: mcarton; Type: TABLE; Schema: pnd_bk23apr2014; Owner: pnd; Tablespace: 
--

CREATE TABLE mcarton (
    car_id integer NOT NULL,
    car_name character varying(200),
    car_fileextension character varying(50)
);


ALTER TABLE pnd_bk23apr2014.mcarton OWNER TO pnd;

--
-- Name: mcarton_car_id_seq; Type: SEQUENCE; Schema: pnd_bk23apr2014; Owner: pnd
--

CREATE SEQUENCE mcarton_car_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd_bk23apr2014.mcarton_car_id_seq OWNER TO pnd;

--
-- Name: mcarton_car_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd_bk23apr2014; Owner: pnd
--

ALTER SEQUENCE mcarton_car_id_seq OWNED BY mcarton.car_id;


--
-- Name: mcartonvariable; Type: TABLE; Schema: pnd_bk23apr2014; Owner: pnd; Tablespace: 
--

CREATE TABLE mcartonvariable (
    carv_code character varying(12),
    carv_unit character varying(12),
    carv_carid integer
);


ALTER TABLE pnd_bk23apr2014.mcartonvariable OWNER TO pnd;

--
-- Name: COLUMN mcartonvariable.carv_carid; Type: COMMENT; Schema: pnd_bk23apr2014; Owner: pnd
--

COMMENT ON COLUMN mcartonvariable.carv_carid IS 'foreign key to mcarton car_id';


--
-- Name: mjobcatlookup; Type: TABLE; Schema: pnd_bk23apr2014; Owner: pnd; Tablespace: 
--

CREATE TABLE mjobcatlookup (
    jcl_id integer NOT NULL,
    jcl_title character varying(200),
    jcl_requiretime integer,
    jcl_sequence integer
);


ALTER TABLE pnd_bk23apr2014.mjobcatlookup OWNER TO pnd;

--
-- Name: COLUMN mjobcatlookup.jcl_requiretime; Type: COMMENT; Schema: pnd_bk23apr2014; Owner: pnd
--

COMMENT ON COLUMN mjobcatlookup.jcl_requiretime IS 'Require time store in minutes';


--
-- Name: mjobcatlookup_jcl_id_seq; Type: SEQUENCE; Schema: pnd_bk23apr2014; Owner: pnd
--

CREATE SEQUENCE mjobcatlookup_jcl_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd_bk23apr2014.mjobcatlookup_jcl_id_seq OWNER TO pnd;

--
-- Name: mjobcatlookup_jcl_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd_bk23apr2014; Owner: pnd
--

ALTER SEQUENCE mjobcatlookup_jcl_id_seq OWNED BY mjobcatlookup.jcl_id;


--
-- Name: mjobsheet; Type: TABLE; Schema: pnd_bk23apr2014; Owner: pnd; Tablespace: 
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
    js_barcodenumber character varying(100)
);


ALTER TABLE pnd_bk23apr2014.mjobsheet OWNER TO pnd;

--
-- Name: mjobsheet_js_id_seq; Type: SEQUENCE; Schema: pnd_bk23apr2014; Owner: pnd
--

CREATE SEQUENCE mjobsheet_js_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd_bk23apr2014.mjobsheet_js_id_seq OWNER TO pnd;

--
-- Name: mjobsheet_js_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd_bk23apr2014; Owner: pnd
--

ALTER SEQUENCE mjobsheet_js_id_seq OWNED BY mjobsheet.js_id;


--
-- Name: mjscartonvalue; Type: TABLE; Schema: pnd_bk23apr2014; Owner: pnd; Tablespace: 
--

CREATE TABLE mjscartonvalue (
    caval_id integer NOT NULL,
    caval_value numeric(20,4),
    carval_carcode character varying(12)
);


ALTER TABLE pnd_bk23apr2014.mjscartonvalue OWNER TO pnd;

--
-- Name: mjscartonvalue_caval_id_seq; Type: SEQUENCE; Schema: pnd_bk23apr2014; Owner: pnd
--

CREATE SEQUENCE mjscartonvalue_caval_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd_bk23apr2014.mjscartonvalue_caval_id_seq OWNER TO pnd;

--
-- Name: mjscartonvalue_caval_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd_bk23apr2014; Owner: pnd
--

ALTER SEQUENCE mjscartonvalue_caval_id_seq OWNED BY mjscartonvalue.caval_id;


--
-- Name: pndaddress; Type: TABLE; Schema: pnd_bk23apr2014; Owner: pnd; Tablespace: 
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


ALTER TABLE pnd_bk23apr2014.pndaddress OWNER TO pnd;

--
-- Name: pndaddress_ad_id_seq; Type: SEQUENCE; Schema: pnd_bk23apr2014; Owner: pnd
--

CREATE SEQUENCE pndaddress_ad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd_bk23apr2014.pndaddress_ad_id_seq OWNER TO pnd;

--
-- Name: pndaddress_ad_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd_bk23apr2014; Owner: pnd
--

ALTER SEQUENCE pndaddress_ad_id_seq OWNED BY pndaddress.ad_id;


--
-- Name: pndartistskill; Type: TABLE; Schema: pnd_bk23apr2014; Owner: pnd; Tablespace: 
--

CREATE TABLE pndartistskill (
    as_userid character varying(50),
    as_skill character varying(50)
);


ALTER TABLE pnd_bk23apr2014.pndartistskill OWNER TO pnd;

--
-- Name: pndcontact; Type: TABLE; Schema: pnd_bk23apr2014; Owner: pnd; Tablespace: 
--

CREATE TABLE pndcontact (
    ct_id integer NOT NULL,
    ct_refid integer,
    ct_reftype character varying(50),
    ct_name character varying(100),
    ct_email character varying(100)
);


ALTER TABLE pnd_bk23apr2014.pndcontact OWNER TO pnd;

--
-- Name: pndcontact_ct_id_seq; Type: SEQUENCE; Schema: pnd_bk23apr2014; Owner: pnd
--

CREATE SEQUENCE pndcontact_ct_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd_bk23apr2014.pndcontact_ct_id_seq OWNER TO pnd;

--
-- Name: pndcontact_ct_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd_bk23apr2014; Owner: pnd
--

ALTER SEQUENCE pndcontact_ct_id_seq OWNED BY pndcontact.ct_id;


--
-- Name: pndphone; Type: TABLE; Schema: pnd_bk23apr2014; Owner: pnd; Tablespace: 
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


ALTER TABLE pnd_bk23apr2014.pndphone OWNER TO pnd;

--
-- Name: pndphone_ph_id_seq; Type: SEQUENCE; Schema: pnd_bk23apr2014; Owner: pnd
--

CREATE SEQUENCE pndphone_ph_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pnd_bk23apr2014.pndphone_ph_id_seq OWNER TO pnd;

--
-- Name: pndphone_ph_id_seq; Type: SEQUENCE OWNED BY; Schema: pnd_bk23apr2014; Owner: pnd
--

ALTER SEQUENCE pndphone_ph_id_seq OWNED BY pndphone.ph_id;


SET search_path = public, pg_catalog;

--
-- Name: vw_mcustomer; Type: VIEW; Schema: public; Owner: pnd
--

CREATE VIEW vw_mcustomer AS
 SELECT fcorg.org_id AS cu_id,
    fcorg.org_name AS cu_name,
    fcorg.org_parentid AS cu_parentid,
    fcorg.org_primaryid AS cu_primaryid,
    fcorg.org_status AS cu_status
   FROM pnd_bk23apr2014.fcorg
  WHERE ((fcorg.org_type)::text = 'CUSTOMER'::text);


ALTER TABLE public.vw_mcustomer OWNER TO pnd;

SET search_path = pnd, pg_catalog;

--
-- Name: fd_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcdoc ALTER COLUMN fd_id SET DEFAULT nextval('fcdoc_fd_id_seq'::regclass);


--
-- Name: log_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fclog ALTER COLUMN log_id SET DEFAULT nextval('fclog_log_id_seq'::regclass);


--
-- Name: lu_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fclookup ALTER COLUMN lu_id SET DEFAULT nextval('fclookup_lu_id_seq'::regclass);


--
-- Name: mn_id; Type: DEFAULT; Schema: pnd; Owner: shine
--

ALTER TABLE ONLY fcmenu ALTER COLUMN mn_id SET DEFAULT nextval('fcmenu_mn_id_seq'::regclass);


--
-- Name: mn_parentid; Type: DEFAULT; Schema: pnd; Owner: shine
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
-- Name: pmf_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY fcpmcaseflow ALTER COLUMN pmf_id SET DEFAULT nextval('fcpmcaseflow_pmf_id_seq'::regclass);


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
-- Name: car_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY mcarton ALTER COLUMN car_id SET DEFAULT nextval('mcarton_car_id_seq'::regclass);


--
-- Name: mc_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY mcustmachine ALTER COLUMN mc_id SET DEFAULT nextval('mcustmachine_mc_id_seq'::regclass);


--
-- Name: ft_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY mforecast ALTER COLUMN ft_id SET DEFAULT nextval('mforecast_ft_id_seq'::regclass);


--
-- Name: jc_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY mjobcat ALTER COLUMN jc_id SET DEFAULT nextval('mjobcat_jc_id_seq'::regclass);


--
-- Name: jcl_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY mjobcatlookup ALTER COLUMN jcl_id SET DEFAULT nextval('mjobcatlookup_jcl_id_seq'::regclass);


--
-- Name: js_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY mjobsheet ALTER COLUMN js_id SET DEFAULT nextval('mjobsheet_js_id_seq'::regclass);


--
-- Name: caval_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY mjscartonvalue ALTER COLUMN caval_id SET DEFAULT nextval('mjscartonvalue_caval_id_seq'::regclass);


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
-- Name: tmp_id; Type: DEFAULT; Schema: pnd; Owner: pnd
--

ALTER TABLE ONLY tmp_dailyactivity ALTER COLUMN tmp_id SET DEFAULT nextval('tmp_dailyactivity_tmp_id_seq'::regclass);


SET search_path = pnd_bk23apr2014, pg_catalog;

--
-- Name: lang_id; Type: DEFAULT; Schema: pnd_bk23apr2014; Owner: shine
--

ALTER TABLE ONLY fclang ALTER COLUMN lang_id SET DEFAULT nextval('fclang_lang_id_seq'::regclass);


--
-- Name: log_id; Type: DEFAULT; Schema: pnd_bk23apr2014; Owner: shine
--

ALTER TABLE ONLY fclog ALTER COLUMN log_id SET DEFAULT nextval('fclog_log_id_seq'::regclass);


--
-- Name: lu_id; Type: DEFAULT; Schema: pnd_bk23apr2014; Owner: shine
--

ALTER TABLE ONLY fclookup ALTER COLUMN lu_id SET DEFAULT nextval('fclookup_lu_id_seq'::regclass);


--
-- Name: mn_id; Type: DEFAULT; Schema: pnd_bk23apr2014; Owner: shine
--

ALTER TABLE ONLY fcmenu ALTER COLUMN mn_id SET DEFAULT nextval('fcmenu_mn_id_seq'::regclass);


--
-- Name: mn_parentid; Type: DEFAULT; Schema: pnd_bk23apr2014; Owner: shine
--

ALTER TABLE ONLY fcmenu ALTER COLUMN mn_parentid SET DEFAULT nextval('fcmenu_mn_parentid_seq'::regclass);


--
-- Name: org_id; Type: DEFAULT; Schema: pnd_bk23apr2014; Owner: pnd
--

ALTER TABLE ONLY fcorg ALTER COLUMN org_id SET DEFAULT nextval('fcorg_org_id_seq'::regclass);


--
-- Name: pms_id; Type: DEFAULT; Schema: pnd_bk23apr2014; Owner: shine
--

ALTER TABLE ONLY fcpermission ALTER COLUMN pms_id SET DEFAULT nextval('fcpermission_pms_id_seq'::regclass);


--
-- Name: f_id; Type: DEFAULT; Schema: pnd_bk23apr2014; Owner: shine
--

ALTER TABLE ONLY fcpmcaseflow ALTER COLUMN f_id SET DEFAULT nextval('fcpmcaseflow_f_id_seq'::regclass);


--
-- Name: op_id; Type: DEFAULT; Schema: pnd_bk23apr2014; Owner: shine
--

ALTER TABLE ONLY fcpmoperation ALTER COLUMN op_id SET DEFAULT nextval('fcpmoperation_op_id_seq'::regclass);


--
-- Name: wf_id; Type: DEFAULT; Schema: pnd_bk23apr2014; Owner: shine
--

ALTER TABLE ONLY fcpmworkflow ALTER COLUMN wf_id SET DEFAULT nextval('fcpmworkflow_wf_id_seq'::regclass);


--
-- Name: rol_id; Type: DEFAULT; Schema: pnd_bk23apr2014; Owner: shine
--

ALTER TABLE ONLY fcrole ALTER COLUMN rol_id SET DEFAULT nextval('fcrole_rol_id_seq'::regclass);


--
-- Name: rp_id; Type: DEFAULT; Schema: pnd_bk23apr2014; Owner: shine
--

ALTER TABLE ONLY fcroleperm ALTER COLUMN rp_id SET DEFAULT nextval('fcroleperm_rp_id_seq'::regclass);


--
-- Name: ru_id; Type: DEFAULT; Schema: pnd_bk23apr2014; Owner: shine
--

ALTER TABLE ONLY fcrule ALTER COLUMN ru_id SET DEFAULT nextval('fcrule_ru_id_seq'::regclass);


--
-- Name: set_id; Type: DEFAULT; Schema: pnd_bk23apr2014; Owner: shine
--

ALTER TABLE ONLY fcsetting ALTER COLUMN set_id SET DEFAULT nextval('fcsetting_set_id_seq'::regclass);


--
-- Name: di_id; Type: DEFAULT; Schema: pnd_bk23apr2014; Owner: shine
--

ALTER TABLE ONLY fcuserdiary ALTER COLUMN di_id SET DEFAULT nextval('fcuserdiary_di_id_seq'::regclass);


--
-- Name: ul_id; Type: DEFAULT; Schema: pnd_bk23apr2014; Owner: shine
--

ALTER TABLE ONLY fcuserlogin ALTER COLUMN ul_id SET DEFAULT nextval('fcuserlogin_ul_id_seq'::regclass);


--
-- Name: uor_id; Type: DEFAULT; Schema: pnd_bk23apr2014; Owner: shine
--

ALTER TABLE ONLY fcuserorgrole ALTER COLUMN uor_id SET DEFAULT nextval('fcuserorgrole_uor_id_seq'::regclass);


--
-- Name: us_id; Type: DEFAULT; Schema: pnd_bk23apr2014; Owner: shine
--

ALTER TABLE ONLY fcusersession ALTER COLUMN us_id SET DEFAULT nextval('fcusersession_us_id_seq'::regclass);


--
-- Name: car_id; Type: DEFAULT; Schema: pnd_bk23apr2014; Owner: pnd
--

ALTER TABLE ONLY mcarton ALTER COLUMN car_id SET DEFAULT nextval('mcarton_car_id_seq'::regclass);


--
-- Name: jcl_id; Type: DEFAULT; Schema: pnd_bk23apr2014; Owner: pnd
--

ALTER TABLE ONLY mjobcatlookup ALTER COLUMN jcl_id SET DEFAULT nextval('mjobcatlookup_jcl_id_seq'::regclass);


--
-- Name: js_id; Type: DEFAULT; Schema: pnd_bk23apr2014; Owner: pnd
--

ALTER TABLE ONLY mjobsheet ALTER COLUMN js_id SET DEFAULT nextval('mjobsheet_js_id_seq'::regclass);


--
-- Name: caval_id; Type: DEFAULT; Schema: pnd_bk23apr2014; Owner: pnd
--

ALTER TABLE ONLY mjscartonvalue ALTER COLUMN caval_id SET DEFAULT nextval('mjscartonvalue_caval_id_seq'::regclass);


--
-- Name: ad_id; Type: DEFAULT; Schema: pnd_bk23apr2014; Owner: pnd
--

ALTER TABLE ONLY pndaddress ALTER COLUMN ad_id SET DEFAULT nextval('pndaddress_ad_id_seq'::regclass);


--
-- Name: ct_id; Type: DEFAULT; Schema: pnd_bk23apr2014; Owner: pnd
--

ALTER TABLE ONLY pndcontact ALTER COLUMN ct_id SET DEFAULT nextval('pndcontact_ct_id_seq'::regclass);


--
-- Name: ph_id; Type: DEFAULT; Schema: pnd_bk23apr2014; Owner: pnd
--

ALTER TABLE ONLY pndphone ALTER COLUMN ph_id SET DEFAULT nextval('pndphone_ph_id_seq'::regclass);


SET search_path = pnd, pg_catalog;

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
16	2014-05-14 13:31:11.349+08	\N	34	car_id	\N	34.png	png		9354.0000
\.


--
-- Name: fcdoc_fd_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcdoc_fd_id_seq', 16, true);


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
THEME	blacktie	ROOT	Black Tie	ACTIVE	1
THEME	blitzer	ROOT	Blitzer	ACTIVE	2
THEME	darkness	ROOT	Darkness	ACTIVE	3
THEME	dotluv	ROOT	Dot Luv	ACTIVE	4
THEME	eggplant	ROOT	Eggplant	ACTIVE	5
THEME	overcast	ROOT	Overcast	ACTIVE	6
THEME	skyblue	ROOT	Skyblue	ACTIVE	7
THEME	smoothness	ROOT	Smoothness	ACTIVE	8
LANGUAGE	zh_TW	ROOT	Chinese	ACTIVE	9
LANGUAGE	en_US	ROOT	English	ACTIVE	10
COURSE	BUSINESS	ROOT	Business	ACTIVE	11
COURSE	BIOSCIENCES	ROOT	Biosciences	ACTIVE	14
COURSE	COMMUNICATION	ROOT	Communication	ACTIVE	15
COURSE	IT	ROOT	Computing & IT	ACTIVE	16
COURSE	DESIGN	ROOT	Design	ACTIVE	17
COURSE	EDUCATION	ROOT	Education	ACTIVE	18
COURSE	ENGINEERING	ROOT	Engineering	ACTIVE	19
COURSE	H&T	ROOT	Hospitality, Tourism & Culinary Arts	ACTIVE	20
COURSE	LAW	ROOT	Law	ACTIVE	21
COURSE	MEDICINE	ROOT	Medicine	ACTIVE	22
COURSE	PHARMACY	ROOT	Pharmacy	ACTIVE	23
EXP	FIRSTJOB	ROOT	I am a fresh graduate seeking my first job	ACTIVE	27
EXP	INTERN	ROOT	I am a student seeking internship 	ACTIVE	24
EXP	WORKSINCE	ROOT	I have been working since	ACTIVE	28
YEAR	1970	ROOT	1970	ACTIVE	29
YEAR	1971	ROOT	1971	ACTIVE	30
YEAR	1972	ROOT	1972	ACTIVE	31
YEAR	1973	ROOT	1973	ACTIVE	32
YEAR	1974	ROOT	1974	ACTIVE	33
YEAR	1975	ROOT	1975	ACTIVE	34
YEAR	1976	ROOT	1976	ACTIVE	35
YEAR	1977	ROOT	1977	ACTIVE	36
YEAR	1978	ROOT	1978	ACTIVE	37
YEAR	1979	ROOT	1979	ACTIVE	38
YEAR	1980	ROOT	1980	ACTIVE	39
YEAR	1981	ROOT	1981	ACTIVE	40
YEAR	1982	ROOT	1982	ACTIVE	41
YEAR	1983	ROOT	1983	ACTIVE	42
YEAR	1984	ROOT	1984	ACTIVE	43
YEAR	1985	ROOT	1985	ACTIVE	44
YEAR	1986	ROOT	1986	ACTIVE	45
YEAR	1987	ROOT	1987	ACTIVE	46
YEAR	1988	ROOT	1988	ACTIVE	47
YEAR	1989	ROOT	1989	ACTIVE	48
YEAR	1990	ROOT	1990	ACTIVE	49
YEAR	1991	ROOT	1991	ACTIVE	50
YEAR	1992	ROOT	1992	ACTIVE	51
YEAR	1993	ROOT	1993	ACTIVE	52
YEAR	1994	ROOT	1994	ACTIVE	53
YEAR	1995	ROOT	1995	ACTIVE	54
YEAR	1996	ROOT	1996	ACTIVE	55
YEAR	1997	ROOT	1997	ACTIVE	56
YEAR	1998	ROOT	1998	ACTIVE	57
YEAR	1999	ROOT	1999	ACTIVE	58
YEAR	2000	ROOT	2000	ACTIVE	59
YEAR	2001	ROOT	2001	ACTIVE	60
YEAR	2002	ROOT	2002	ACTIVE	61
YEAR	2003	ROOT	2003	ACTIVE	62
YEAR	2004	ROOT	2004	ACTIVE	63
YEAR	2005	ROOT	2005	ACTIVE	64
YEAR	2006	ROOT	2006	ACTIVE	65
YEAR	2007	ROOT	2007	ACTIVE	66
YEAR	2008	ROOT	2008	ACTIVE	67
YEAR	2009	ROOT	2009	ACTIVE	68
YEAR	2010	ROOT	2010	ACTIVE	69
YEAR	2011	ROOT	2011	ACTIVE	70
YEAR	2012	ROOT	2012	ACTIVE	71
YEAR	2013	ROOT	2013	ACTIVE	72
SUBJECT	SCSC121	ROOT	Introduction to Computer Programming	ACTIVE	73
SUBJECT	COSC261	ROOT	Formal Languages and Compilers	ACTIVE	74
SUBJECT	COSC262	ROOT	Algorithms	ACTIVE	76
SUBJECT	COSC265	ROOT	Relational Database Systems	ACTIVE	77
SUBJECT	COSC467	ROOT	Computational Intelligence	ACTIVE	79
SUBJECT	COSC364	ROOT	Internet Technology and Engineering	ACTIVE	80
SUBJECT	COSC411	ROOT	Information and Software Visualisation	ACTIVE	81
SEMESTER	SMS12012	ROOT	Semester 1 2012	ACTIVE	82
SEMESTER	SMS22012	ROOT	Semester 2 2012	ACTIVE	83
SEMESTER	SMS32012	ROOT	Semester 3 2012	ACTIVE	84
SEMESTER	SMS12013	ROOT	Semester 1 2013	ACTIVE	85
SEMESTER	SMS22013	ROOT	Semester 2 2013	ACTIVE	86
SEMESTER	SMS32013	ROOT	Semester 3 2013	ACTIVE	87
SUBJECT	COSC110	ROOT	Working in a Digital World	ACTIVE	89
SUBJECT	COSC122	ROOT	Introduction to Computer Science	ACTIVE	90
SUBJECT	COSC264	ROOT	Data Communications and Networking	ACTIVE	91
SUBJECT	COSC362	ROOT	Data and Network Security	ACTIVE	92
SUBJECT	COSC363	ROOT	Computer Graphics	ACTIVE	93
SUBJECT	COSC366	ROOT	Research Project	ACTIVE	94
SUBJECT	COSC401	ROOT	Machine Learning	ACTIVE	95
SUBJECT	COSC410	ROOT	Simulation: Modelling and Analysis	ACTIVE	96
SUBJECT	COSC413	ROOT	Advanced Topics in Algorithms	ACTIVE	98
SUBJECT	COSC418	ROOT	Wireless Ad-hoc and Sensor Networks	ACTIVE	99
SUBJECT	COSC421	ROOT	Advanced Topics in Security	ACTIVE	100
SUBJECT	COSC422	ROOT	Advanced Computer Graphics	ACTIVE	101
SUBJECT	COSC424	ROOT	Augmented Reality	ACTIVE	102
SUBJECT	COSC428	ROOT	Computer Vision	ACTIVE	103
SUBJECT	COSC460	ROOT	Special Topic	ACTIVE	104
EVENT	DINNER	ROOT	Dinner	ACTIVE	105
EVENT	BOWLING	ROOT	Bowling	ACTIVE	106
EVENT	GOLF	ROOT	Golf	ACTIVE	107
MEMBER	MEMBERSHIP	ROOT	Membership	ACTIVE	108
EVENT	SEMINAR	ROOT	Seminar	ACTIVE	110
EXAM	EXAM	ROOT	Exam	ACTIVE	109
\.


--
-- Name: fclookup_lu_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fclookup_lu_id_seq', 110, true);


--
-- Data for Name: fcmenu; Type: TABLE DATA; Schema: pnd; Owner: shine
--

COPY fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode) FROM stdin;
1	HEADERMENU	0	Top Menu	ACTIVE	0		Y	\N	\N	\N	\N	\N	\N
69	MENU	6	Menu Setup	ACTIVE	4400	\N	Y	Setting	\N	menusetup	\N	\N	\N
82	USERSETTING	6	User Setting	ACTIVE	2000	\N	Y	\N	\N	\N	\N	\N	\N
49	USERSETUP	82	User Setup	ACTIVE	4210	\N	Y	Setting		usersetting			\N
50	PERMSETUP	82	Permission Setup	ACTIVE	4230	\N	Y	Setting		permsetting			\N
51	ROLESETUP	82	Role Setup	ACTIVE	4220	\N	Y	Setting		rolesetting			\N
83	LOOKUPSETUP	6	Lookup Setup	ACTIVE	2000	\N	Y	Setting	\N	lookupSetup	\N	\N	\N
84	JOBCATSETUP	6	Job category setup	ACTIVE	3000	\N	Y	Setting	\N	jobcatsetup	\N	\N	\N
85	CARTONSETUP	6	Carton setup	ACTIVE	3000	\N	Y	Setting	\N	cartonSetup	\N	\N	\N
86	QCHOME	1	Home (QC)	ACTIVE	1000	\N	Y	Home	\N	qchome	\N	\N	QCHOME
6	SETTING	1	Setting	ACTIVE	9000	\N	N	\N	\N	\N	\N	\N	MENU_SETTING
87	ARTHOME	1	Home (Artist)	ACTIVE	1000	\N	Y	Home	\N	artisthome	\N	\N	ARTHOME
88	SVHOME	1	Home (Supervisor)	ACTIVE	1000	\N	Y	Home	\N	supervisorhome	\N	\N	SUPHOME
89	TASK	1	Task	ACTIVE	1500	\N	Y	PMTask	\N	home	\N	\N	\N
90	CUSTHOME	1	Home(Customer)	ACTIVE	1000	\N	Y	Home	\N	customerhome	\N	\N	CUSTHOME
92	JOBSTATUS	91	Job status report	ACTIVE	1000	\N	Y	Report	\N	jobstatusreport	\N	\N	MENU_REPORT
93	CUSTSALESBYCAT	91	Customer sales report	ACTIVE	2000	\N	Y	Report	\N	custsalereport	\N	\N	MENU_REPORT
91	REPORT	1	Report	ACTIVE	5000	\N	N	Report	\N	jobstatusreport	\N	\N	MENU_REPORT
96	DAILYSALE	91	Daily sale report	ACTIVE	3000	\N	Y	Report	\N	dailysale	\N	\N	MENU_REPORT
94	SALEBYCAT	91	Monthly sale by category report	ACTIVE	1500	\N	Y	Report	\N	salebycategory	\N	\N	MENU_REPORT
97	DAILYACTIVITY	91	Daily user activity report	ACTIVE	5000	\N	Y	Report	\N	dailyuseractivity	\N	\N	MENU_REPORT
95	salebycust	91	Monthly sale by customer report	ACTIVE	2000	\N	Y	Report	\N	salebycustomer	\N	\N	MENU_REPORT
\.


--
-- Name: fcmenu_mn_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: shine
--

SELECT pg_catalog.setval('fcmenu_mn_id_seq', 97, true);


--
-- Name: fcmenu_mn_parentid_seq; Type: SEQUENCE SET; Schema: pnd; Owner: shine
--

SELECT pg_catalog.setval('fcmenu_mn_parentid_seq', 6, true);


--
-- Data for Name: fcorg; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY fcorg (org_id, org_type, org_external, org_name, org_parentid, org_primaryid, org_address, org_contactno, org_status) FROM stdin;
1	\N	Y	PND	0	\N	\N	\N	ACTIVE
2	\N	Y	Carton box	0	\N	\N	\N	ACTIVE
3	\N	Y	Grand fortune	0	\N	\N	\N	ACTIVE
4	\N	Y	New box	0	\N	\N	\N	ACTIVE
5	\N	Y	Deswell	0	\N	\N	\N	ACTIVE
6	\N	Y	Darun	0	\N	\N	\N	ACTIVE
7	\N	Y	Harta	0	\N	\N	\N	ACTIVE
8	\N	Y	Genting 	0	\N	\N	\N	ACTIVE
\.


--
-- Name: fcorg_org_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcorg_org_id_seq', 8, true);


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
\.


--
-- Data for Name: fcpmactivity; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY fcpmactivity (pmat_id, pmat_pmwfid, pmat_pmslid, pmat_name, pmat_type, pmat_function, pmat_sla_interval, pmat_show_caseinfo) FROM stdin;
1	1	\N	Requirement verification	USER	reqVerification	\N	N
2	1	\N	Pending customer resolution 	USER	pendingRevert	\N	N
3	1	\N	Pending acknowledgement 	USER	pendingAcknowledge	\N	N
4	1	\N	Work in progress 	USER	wip	\N	N
5	1	\N	Pending QC check	USER	pendingQC	\N	N
6	1	\N	Pending customer acceptance	USER	pendingCust	\N	N
7	1	\N	Reassign	USER	reqVerification	\N	N
\.


--
-- Name: fcpmactivity_pmat_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcpmactivity_pmat_id_seq', 7, true);


--
-- Data for Name: fcpmcase; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY fcpmcase (pmc_id, pmc_created_date, pmc_created_by, pmc_casekey, pmc_casetype, pmc_parentid, pmc_pmwfid, pmc_start_pmevid, pmc_start_date, pmc_end_pmevid, pmc_end_date, pmc_closed) FROM stdin;
87	2014-05-13 19:22:31.666+08	Customer	194	jobsheet	\N	\N	\N	\N	\N	\N	N
88	2014-05-13 19:22:31.666+08	Customer	195	jobsheet	\N	\N	\N	\N	\N	\N	N
89	2014-05-13 19:22:31.666+08	Customer	196	jobsheet	\N	\N	\N	\N	\N	\N	N
90	2014-05-13 19:22:31.666+08	Customer	197	jobsheet	\N	\N	\N	\N	\N	\N	N
91	2014-05-13 19:22:31.666+08	Customer	198	jobsheet	\N	\N	\N	\N	\N	\N	N
92	2014-05-13 19:22:31.666+08	Customer	199	jobsheet	\N	\N	\N	\N	\N	\N	N
93	2014-05-13 19:22:31.666+08	Customer	200	jobsheet	\N	\N	\N	\N	\N	\N	N
94	2014-05-13 19:22:31.666+08	Customer	201	jobsheet	\N	\N	\N	\N	\N	\N	N
95	2014-05-13 19:22:31.666+08	Customer 9	202	jobsheet	\N	\N	\N	\N	\N	\N	N
96	2014-05-13 19:22:31.666+08	Customer 10	203	jobsheet	\N	\N	\N	\N	\N	\N	N
97	2014-05-13 19:22:31.666+08	Customer	204	jobsheet	\N	\N	\N	\N	\N	\N	N
\.


--
-- Name: fcpmcase_pmc_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcpmcase_pmc_id_seq', 97, true);


--
-- Data for Name: fcpmcaseflow; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY fcpmcaseflow (pmf_id, pmf_pmcid, pmf_obj_id, pmf_obj_type, pmf_previd, pmf_prev_pmcnid, pmf_start_date, pmf_end_date, pmf_end_status, pmf_due_date, pmf_last_perform_date, pmf_specific_userid, pmf_end_by) FROM stdin;
137	88	5	PM_Activity	\N	\N	2014-05-13 19:22:31.666+08	\N	\N	2014-05-13 19:52:31.666+08	\N	qc	\N
140	91	4	PM_Activity	\N	\N	2014-05-13 19:22:31.666+08	\N	\N	2014-05-13 21:22:31.666+08	\N	artist1	\N
142	93	3	PM_Activity	\N	\N	2014-05-13 19:22:31.666+08	\N	\N	2014-05-13 20:22:31.666+08	\N	artist1	\N
144	95	1	PM_Activity	\N	\N	2014-05-13 19:22:31.666+08	\N	\N	2014-05-13 19:37:31.666+08	\N	supervisor	\N
145	96	2	PM_Activity	\N	\N	2014-05-13 19:22:31.666+08	\N	\N	2014-05-13 19:52:31.666+08	2014-05-14 11:44:21+08	customer	\N
141	92	3	PM_Activity	\N	\N	2014-05-13 19:22:31.666+08	\N	\N	2014-05-13 19:37:31.666+08	2014-05-14 11:51:06+08	artist1	\N
143	94	1	PM_Activity	\N	\N	2014-05-13 19:22:31.666+08	\N	\N	2014-05-13 19:37:31.666+08	2014-05-14 11:51:39+08	supervisor	\N
139	90	4	PM_Activity	\N	\N	2014-05-13 19:22:31.666+08	\N	\N	2014-05-13 20:07:31.666+08	2014-05-14 12:09:11+08	artist1	\N
136	87	5	PM_Activity	\N	\N	2014-05-13 19:22:31.666+08	\N	\N	2014-05-13 19:42:31.666+08	2014-05-14 12:13:43+08	qc	\N
138	89	6	PM_Activity	\N	\N	2014-05-13 19:22:31.666+08	\N	\N	2014-05-14 19:22:31.666+08	2014-05-14 12:14:57+08	customer	\N
146	97	7	PM_Activity	\N	\N	2014-05-13 19:22:31.666+08	\N	\N	2014-05-13 19:52:31.666+08	2014-05-16 11:17:59+08	supervisor	\N
\.


--
-- Name: fcpmcaseflow_pmf_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcpmcaseflow_pmf_id_seq', 146, true);


--
-- Data for Name: fcpmcasetype; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY fcpmcasetype (pmct_code, pmct_desc, pmct_table, pmct_key_col, pmct_desc_col, pmct_caseinfo_function) FROM stdin;
jobsheet	jobsheet	mjobsheet	js_id	js_title	\N
\.


--
-- Data for Name: fcpmconnector; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY fcpmconnector (pmcn_id, pmcn_from_type, pmcn_from_id, pmcn_to_type, pmcn_to_id, pmcn_order, pmcn_type, pmcn_ruid) FROM stdin;
\.


--
-- Name: fcpmconnector_pmcn_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcpmconnector_pmcn_id_seq', 1, false);


--
-- Data for Name: fcpmevent; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY fcpmevent (pmev_id, pmev_pmwfid, pmev_pmslid, pmev_type, pmev_type_cat, pmev_intermediate_function) FROM stdin;
\.


--
-- Name: fcpmevent_pmev_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcpmevent_pmev_id_seq', 1, false);


--
-- Data for Name: fcpmgateway; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY fcpmgateway (pmgw_id, pmgw_pmwfid, pmgw_pmslid, pmgw_type, pmgw_type_cat) FROM stdin;
\.


--
-- Name: fcpmgateway_pmgw_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcpmgateway_pmgw_id_seq', 1, false);


--
-- Data for Name: fcpmswimlane; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY fcpmswimlane (pmsl_id, pmsl_pmwfid, pmsl_name, pmsl_order) FROM stdin;
\.


--
-- Name: fcpmswimlane_pmsl_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcpmswimlane_pmsl_id_seq', 1, false);


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
20	artist
14	Customer
10	admin
19	Supervisor
\.


--
-- Name: fcrole_rol_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcrole_rol_id_seq', 20, true);


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
149	20	ARTHOME
150	14	REQUEST_NEWJOB
151	14	CUSTHOME
152	10	MENU_REPORT
153	10	MENU_SETTING
154	10	REQUEST_NEWJOB
155	10	QCHOME
156	10	ARTHOME
157	10	SUPHOME
158	10	CUSTHOME
159	19	MENU_REPORT
160	19	SUPHOME
\.


--
-- Name: fcroleperm_rp_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcroleperm_rp_id_seq', 160, true);


--
-- Data for Name: fcrule; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY fcrule (ru_id, ru_name, ru_true_msg, ru_false_msg, ru_data) FROM stdin;
\.


--
-- Name: fcrule_ru_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcrule_ru_id_seq', 1, false);


--
-- Data for Name: fcsetting; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY fcsetting (set_id, set_user, set_code, set_description, set_val) FROM stdin;
3	shine	DEFCHECKIN	Default Check In Time	\N
4	shine	DEFCHECKOUT	Default Check Out Time	\N
6	shine	EICHARGE	Early Check In Charges	\N
7	shine	LOCHARGE	Late Check Out Charges	\N
2	*	MAXLIFETIME	Maximum Idle Time (in second)	15
1	shine	LANG	English - United States	EN-US
5	shine	THEME	Bootstrap Metro	bootstrap_metro
8	shine	LIFETIME_MEMBER_FEE	Lifetime Member Fee	15000
9	shine	MONTHLY_MEMBER_FEE	Monthly Member Fee	1000
\.


--
-- Name: fcsetting_set_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcsetting_set_id_seq', 7, true);


--
-- Data for Name: fcudv; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY fcudv (udv_code, udv_name, udv_query_type, udv_query, udv_return_type, udv_result_type, udv_result_lookup_type, udv_result_lookup) FROM stdin;
application_no	Application Number	php	'{$APPNO}'	CELL	\N	\N	\N
applicant_name	Applicant Name	sql	select sc_applicantname from spcase where sc_applicationno='[[application_no]]'	CELL	\N	\N	\N
lo_print_date	Print Sysdate	sql	select to_char(now(),'DD-MON-YYYY')	CELL	\N	\N	\N
STAFF_DEPARTMENT	User Org Name	sql	select org_name from fcorg where org_id='{$USER->orgid}'	CELL	\N	\N	\N
AMT_APPROVED	Amount Approved	sql	select trim(to_char(sc_amtapproved,'999,999,999,999,999,990.00')) from spcase where sc_applicationno='[[application_no]]'	CELL	\N	\N	\N
INTEREST_RATE	Interest Rate	sql	select trim(to_char(sc_rate,'999,999,999,999,999,990.00')) from spcase where sc_applicationno='[[application_no]]'	CELL	\N	\N	\N
LOAN_TENURE_MTH	Loan Tenure Month	sql	select sc_tenure from spcase where sc_applicationno='[[application_no]]'	CELL	\N	\N	\N
INSTALMENT_AMT	Instalment Amount	sql	select  trim(to_char(sc_regularinst,'999,999,999,999,999,990.00')) from spcase where sc_applicationno='[[application_no]]'	CELL	\N	\N	\N
TOTAL_PAYABLE	Total Payable	sql	select  trim(to_char(sc_totalpayable,'999,999,999,999,999,990.00')) from spcase where sc_applicationno='[[application_no]]'	CELL	\N	\N	\N
APPROVED_BY	Approved By	sql	select usr_name from fcuser join spcase on usr_userid = sc_approvedby where sc_applicationno='[[application_no]]'	CELL	\N	\N	\N
\.


--
-- Data for Name: fcuser; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_status, usr_langcode) FROM stdin;
admin2	d033e22ae348aeb5660fc2140aec35850c4da997	2014-01-26 15:39:57.04+08	Administrator 2	\N	2014-05-01 18:22:23+08	2014-05-01 17:54:44+08	2014-02-05 15:30:53+08	ADMIN	a:2:{s:7:"dbosess";a:4:{s:6:"ackjob";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"list";}s:7:"jobinfo";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:3:"new";}s:4:"user";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"list";}s:0:"";a:3:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}}}s:9:"dboconfig";a:1:{s:6:"ackjob";i:1;}}	ACTIVE	\N
supervisor	0f4d09e43d208d5e9222322fbc7091ceea1a78c3	2014-04-30 19:09:48.659+08	supervisor	supervisor@gmail.com	2014-05-16 11:18:02+08	2014-05-16 11:17:44+08	2014-05-14 14:38:13+08	\N	a:4:{s:7:"dbosess";a:3:{s:20:"pmtask_caseflow_list";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"list";}s:15:"reqverification";a:4:{s:6:"lastid";a:1:{s:5:"js_id";s:3:"146";}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"edit";}s:7:"jobinfo";a:4:{s:6:"lastid";a:1:{s:5:"js_id";s:3:"204";}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:6:"detail";}}s:11:"PMTask_atid";s:1:"7";s:9:"dboconfig";a:0:{}s:13:"PMTask_flowid";s:3:"146";}	ACTIVE	\N
artist1	2cabffd3c7cb40ae6541b7f10a640b41190ccb27	2014-04-30 13:05:53.973+08	Artist 1	artist1@gmail.com	2014-05-14 14:43:06+08	2014-05-14 14:41:41+08	2014-05-14 12:08:00+08	\N	a:0:{}	ACTIVE	\N
artist2	09c04a14fff8cbd7d0235da2c01bfd31d7826824	2014-04-30 13:06:14.614+08	Artist 2	artist2@gmail.com	\N	\N	\N	\N	\N	ACTIVE	\N
customer	b39f008e318efd2bb988d724a161b61c6909677f	2014-04-24 15:46:41.898+08	Customer	customer@gmail.com	2014-05-15 13:49:42+08	2014-05-14 14:43:28+08	\N	\N	a:2:{s:7:"dbosess";a:1:{s:7:"jobinfo";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:3:"new";}}s:9:"dboconfig";a:0:{}}	ACTIVE	\N
admin	d033e22ae348aeb5660fc2140aec35850c4da997	2013-08-15 09:55:18.85+08	Administrator	\N	2014-05-14 13:47:31+08	2014-05-14 13:22:46+08	2014-05-13 19:00:10+08	ADMIN	a:0:{}	ACTIVE	\N
qc	d6426af04235d59336c5b6b08f61240cbb6b0f66	2014-04-30 19:10:06.929+08	qc	qc@gmail.com	2014-05-14 14:43:24+08	2014-05-14 14:43:09+08	\N	\N	a:0:{}	ACTIVE	\N
\.


--
-- Data for Name: fcuserdiary; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status) FROM stdin;
4	2014-02-11 12:35:04.406+08	*shine	esp@phiorion.com	2014-06-27 00:00:00+08	Notice	Your registration on Planters dinner has been approved. Please make payment before event date.	\N	ACTIVE
5	2014-02-11 12:35:08.767+08	*shine	esp@phiorion.com	2014-03-31 00:00:00+08	Notice	Your registration on March Examination! has been approved. Please make payment before event date.	\N	ACTIVE
3	2014-02-11 12:34:23.307+08	*shine	esp@phiorion.com	\N	Notice	Your registration on March Examination! is now pending for approval.	\N	DELETE
2	2014-02-11 12:34:10.986+08	*shine	esp@phiorion.com	\N	Notice	Your registration on Planters dinner is now pending for approval.	\N	INACTIVE
1	2014-02-11 12:19:59.605+08	*shine	esp@phiorion.com	\N	Notice	Your membership registration is now pending for approval.	\N	ACTIVE
6	2014-02-12 13:55:54.825+08	*shine	esp@phiorion.com	\N	Notice	Thanks for your payment of 1,000.00 for the invoice INV0000000002	\N	ACTIVE
7	2014-02-12 13:55:54.828+08	*shine	esp@phiorion.com	2014-03-31 00:00:00+08	Notice	You can now attend March Examination!.	\N	ACTIVE
8	2014-02-12 13:55:59.076+08	*shine	esp@phiorion.com	\N	Notice	Thanks for your payment of 500.00 for the invoice INV0000000001	\N	ACTIVE
9	2014-02-12 13:55:59.12+08	*shine	esp@phiorion.com	2014-06-27 00:00:00+08	Notice	You can now attend Planters dinner.	\N	ACTIVE
10	2014-02-12 13:56:20.641+08	*shine	esp@phiorion.com	\N	Notice	Your membership application is now approved. Please make payment.	\N	ACTIVE
11	2014-02-12 14:35:17.033+08	*shine	danny@phiorion.com	\N	Notice	Your membership registration is now pending for approval.	\N	ACTIVE
12	2014-02-12 14:36:19.974+08	*shine	hongyee@phiorion.com	\N	Notice	Your membership registration is now pending for approval.	\N	ACTIVE
13	2014-02-12 14:37:38.239+08	*shine	fong@phiorion.com	\N	Notice	Your membership registration is now pending for approval.	\N	ACTIVE
14	2014-02-12 14:38:47.589+08	*shine	yow@phiorion.com	\N	Notice	Your membership registration is now pending for approval.	\N	ACTIVE
15	2014-02-12 14:40:20.074+08	*shine	ironman@gmail.com	\N	Notice	Your membership registration is now pending for approval.	\N	ACTIVE
16	2014-02-12 14:41:05.04+08	*shine	captainamerica@gmail.com	\N	Notice	Your membership registration is now pending for approval.	\N	ACTIVE
17	2014-02-12 14:42:15.179+08	*shine	thor@gmail.com	\N	Notice	Your membership registration is now pending for approval.	\N	ACTIVE
18	2014-02-12 14:43:06.208+08	*shine	superman@gmail.com	\N	Notice	Your membership registration is now pending for approval.	\N	ACTIVE
19	2014-02-13 15:42:46.15+08	ispadmin	ispadmin	2014-02-28 00:00:00+08	Reminder	Meeting on 28-Feb-2014	<p>Meeting on 28-Feb-2014</p>	ACTIVE
20	2014-02-13 15:43:04.156+08	ispadmin	ispadmin	2014-02-20 00:00:00+08	Appointment	Meeting with Azlin for Lunch	<p>Meeting with Azlin for Lunch</p>	ACTIVE
21	2014-02-16 14:54:09.35+08	*shine	esp@phiorion.com	\N	Notice	Your registration on Dinner is now pending for approval.	\N	ACTIVE
22	2014-02-17 14:56:01.085+08	*shine	ironman@gmail.com	\N	Notice	Your membership application is now approved. Please make payment.	\N	ACTIVE
23	2014-02-17 14:56:04.732+08	*shine	ironman@gmail.com	\N	Notice	Your membership application is now approved. Please make payment.	\N	ACTIVE
24	2014-02-17 14:57:50.654+08	*shine	ironman@gmail.com	\N	Notice	Thanks for your payment of 1,000.00 for the invoice INV0000000004	\N	ACTIVE
25	2014-02-17 14:57:50.669+08	*shine	ironman@gmail.com	\N	Notice	Your membership application is now approved and active.	\N	ACTIVE
\.


--
-- Name: fcuserdiary_di_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcuserdiary_di_id_seq', 25, true);


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
488	admin	127.0.0.1	Y	2014-05-10 20:31:36.362+08	2014-05-10 20:31:36.362+08	\N	N	\N
489	customer	127.0.0.1	Y	2014-05-11 14:18:16.376+08	2014-05-11 14:18:16.376+08	\N	N	\N
490	artist1	127.0.0.1	Y	2014-05-11 14:26:20.934+08	2014-05-11 14:26:20.934+08	\N	N	\N
491	customer	127.0.0.1	Y	2014-05-11 14:41:49.751+08	2014-05-11 14:41:49.751+08	\N	N	\N
492	artist1	127.0.0.1	N	2014-05-11 14:43:05.342+08	2014-05-11 14:43:05.342+08	\N	N	\N
493	artist1	127.0.0.1	Y	2014-05-11 14:43:12.605+08	2014-05-11 14:43:12.605+08	\N	N	\N
494	supervisor	127.0.0.1	Y	2014-05-11 14:47:41.357+08	2014-05-11 14:47:41.357+08	\N	N	\N
495	admin	127.0.0.1	Y	2014-05-11 15:01:54.676+08	2014-05-11 15:01:54.676+08	\N	N	\N
496	qc	127.0.0.1	Y	2014-05-11 15:04:27.311+08	2014-05-11 15:04:27.311+08	\N	N	\N
497	admin	127.0.0.1	Y	2014-05-11 15:09:05.838+08	2014-05-11 15:09:05.838+08	\N	N	\N
498	supervisor	127.0.0.1	Y	2014-05-11 15:28:32.242+08	2014-05-11 15:28:32.242+08	\N	N	\N
499	customer	127.0.0.1	Y	2014-05-11 15:33:02.036+08	2014-05-11 15:33:02.036+08	\N	N	\N
500	artist1	127.0.0.1	Y	2014-05-11 15:33:11.102+08	2014-05-11 15:33:11.102+08	\N	N	\N
501	qc	127.0.0.1	Y	2014-05-11 15:33:20.21+08	2014-05-11 15:33:20.21+08	\N	N	\N
502	supervisor	127.0.0.1	Y	2014-05-13 16:05:10.277+08	2014-05-13 16:05:10.277+08	\N	N	\N
503	customer	127.0.0.1	Y	2014-05-13 16:29:48.892+08	2014-05-13 16:29:48.892+08	\N	N	\N
504	supervisor	127.0.0.1	Y	2014-05-13 16:30:38.835+08	2014-05-13 16:30:38.835+08	\N	N	\N
505	artist1	127.0.0.1	Y	2014-05-13 16:32:14.839+08	2014-05-13 16:32:14.839+08	\N	N	\N
506	supervisor	127.0.0.1	Y	2014-05-13 16:39:57.922+08	2014-05-13 16:39:57.922+08	\N	N	\N
507	admin	127.0.0.1	Y	2014-05-13 17:08:30.538+08	2014-05-13 17:08:30.538+08	\N	N	\N
508	qc	127.0.0.1	Y	2014-05-13 18:58:28.303+08	2014-05-13 18:58:28.303+08	\N	N	\N
509	admin	127.0.0.1	N	2014-05-13 19:00:10.452+08	2014-05-13 19:00:10.452+08	\N	N	\N
510	admin	127.0.0.1	Y	2014-05-13 19:00:14.906+08	2014-05-13 19:00:14.906+08	\N	N	\N
511	artist1	127.0.0.1	N	2014-05-13 19:03:49.901+08	2014-05-13 19:03:49.901+08	\N	N	\N
512	artist1	127.0.0.1	Y	2014-05-13 19:03:58.513+08	2014-05-13 19:03:58.513+08	\N	N	\N
513	supervisor	127.0.0.1	Y	2014-05-13 19:05:24.897+08	2014-05-13 19:05:24.897+08	\N	N	\N
514	customer	127.0.0.1	Y	2014-05-14 10:32:58.166+08	2014-05-14 10:32:58.166+08	\N	N	\N
515	customer	127.0.0.1	Y	2014-05-14 11:02:08.428+08	2014-05-14 11:02:08.428+08	\N	N	\N
516	admin	127.0.0.1	Y	2014-05-14 11:27:16.722+08	2014-05-14 11:27:16.722+08	\N	N	\N
517	artist1	127.0.0.1	Y	2014-05-14 11:29:56.791+08	2014-05-14 11:29:56.791+08	\N	N	\N
518	supervisor	127.0.0.1	Y	2014-05-14 11:34:40.156+08	2014-05-14 11:34:40.156+08	\N	N	\N
519	customer	127.0.0.1	Y	2014-05-14 11:44:08.84+08	2014-05-14 11:44:08.84+08	\N	N	\N
520	supervisor	127.0.0.1	Y	2014-05-14 11:47:27.652+08	2014-05-14 11:47:27.652+08	\N	N	\N
521	artist1	127.0.0.1	Y	2014-05-14 11:50:01.133+08	2014-05-14 11:50:01.133+08	\N	N	\N
522	supervisor	127.0.0.1	Y	2014-05-14 11:51:32.318+08	2014-05-14 11:51:32.318+08	\N	N	\N
523	customer	127.0.0.1	Y	2014-05-14 11:52:26.387+08	2014-05-14 11:52:26.387+08	\N	N	\N
524	supervisor	127.0.0.1	Y	2014-05-14 11:58:53.053+08	2014-05-14 11:58:53.053+08	\N	N	\N
525	artist1	127.0.0.1	Y	2014-05-14 12:00:30.078+08	2014-05-14 12:00:30.078+08	\N	N	\N
526	customer	127.0.0.1	Y	2014-05-14 12:06:42.527+08	2014-05-14 12:06:42.527+08	\N	N	\N
527	artist1	127.0.0.1	N	2014-05-14 12:08:00.107+08	2014-05-14 12:08:00.107+08	\N	N	\N
528	artist1	127.0.0.1	Y	2014-05-14 12:08:05.053+08	2014-05-14 12:08:05.053+08	\N	N	\N
529	qc	127.0.0.1	Y	2014-05-14 12:09:55.216+08	2014-05-14 12:09:55.216+08	\N	N	\N
530	admin	127.0.0.1	Y	2014-05-14 12:12:45.966+08	2014-05-14 12:12:45.966+08	\N	N	\N
531	qc	127.0.0.1	Y	2014-05-14 12:13:37.381+08	2014-05-14 12:13:37.381+08	\N	N	\N
532	customer	127.0.0.1	Y	2014-05-14 12:14:50.744+08	2014-05-14 12:14:50.744+08	\N	N	\N
533	admin	127.0.0.1	Y	2014-05-14 13:22:46.426+08	2014-05-14 13:22:46.426+08	\N	N	\N
534	supervisor	127.0.0.1	Y	2014-05-14 13:24:56.497+08	2014-05-14 13:24:56.497+08	\N	N	\N
535	supervisor	127.0.0.1	Y	2014-05-14 13:47:36.734+08	2014-05-14 13:47:36.734+08	\N	N	\N
536	customer	127.0.0.1	Y	2014-05-14 13:57:56.041+08	2014-05-14 13:57:56.041+08	\N	N	\N
537	supervisor	127.0.0.1	N	2014-05-14 14:38:13.317+08	2014-05-14 14:38:13.317+08	\N	N	\N
538	supervisor	127.0.0.1	Y	2014-05-14 14:38:22.45+08	2014-05-14 14:38:22.45+08	\N	N	\N
539	artist1	127.0.0.1	Y	2014-05-14 14:39:42.949+08	2014-05-14 14:39:42.949+08	\N	N	\N
540	supervisor	127.0.0.1	Y	2014-05-14 14:41:14.519+08	2014-05-14 14:41:14.519+08	\N	N	\N
541	artist1	127.0.0.1	Y	2014-05-14 14:41:41.136+08	2014-05-14 14:41:41.136+08	\N	N	\N
542	qc	127.0.0.1	Y	2014-05-14 14:43:09.298+08	2014-05-14 14:43:09.298+08	\N	N	\N
543	customer	127.0.0.1	Y	2014-05-14 14:43:28.163+08	2014-05-14 14:43:28.163+08	\N	N	\N
544	supervisor	127.0.0.1	Y	2014-05-16 11:17:43.871+08	2014-05-16 11:17:43.871+08	\N	N	\N
\.


--
-- Name: fcuserlogin_ul_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcuserlogin_ul_id_seq', 544, true);


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
38	artist1	1	20	1
39	artist2	1	20	1
\.


--
-- Name: fcuserorgrole_uor_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcuserorgrole_uor_id_seq', 39, true);


--
-- Data for Name: fcusersession; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY fcusersession (us_id, us_sessid, us_userid, us_ip, us_active, us_created, us_last_active, us_forcecloseby) FROM stdin;
408	1kkbhl72fl7lktmld4p5d10os0	ironman@gmail.com	127.0.0.1	Y	2014-02-17 15:31:34.882+08	2014-02-17 15:31:34+08	\N
457	72dfg6tbh1jd98eifhla9r25i6	admin2	127.0.0.1	Y	2014-05-01 17:54:44.645+08	2014-05-01 17:54:44+08	\N
512	h68n7hesc822jhi1caneg5ghl0	customer	127.0.0.1	Y	2014-05-14 14:43:28.229+08	2014-05-14 14:43:28+08	\N
513	u5ad0a4n6sj3geo5hnqmbmhf55	supervisor	127.0.0.1	Y	2014-05-16 11:17:45.05+08	2014-05-16 11:17:45+08	\N
\.


--
-- Name: fcusersession_us_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('fcusersession_us_id_seq', 513, true);


--
-- Data for Name: mcarton; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY mcarton (car_id, car_name) FROM stdin;
5	Five panel
6	HSC
33	Top 3
34	OCS1
\.


--
-- Name: mcarton_car_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('mcarton_car_id_seq', 34, true);


--
-- Data for Name: mcartonvariable; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY mcartonvariable (carv_code, carv_unit, carv_carid) FROM stdin;
x.1	mm	5
x.2	mm	5
x.3	mm	5
x.4	mm	5
x.5	mm	5
y.1	mm	5
y.2	mm	5
y.3	mm	5
x.E	mm	6
x.L1	mm	6
x.W1	mm	6
x.L2	mm	6
x.W2	mm	6
y.T	mm	6
y.H	mm	6
y.B	mm	6
x.1	mm	33
x.2	mm	33
x.3	mm	33
y.1	mm	33
y.2	mm	33
y.3	mm	33
x.1	mm	34
x.2	mm	34
x.3	mm	34
x.4	mm	34
x.5	mm	34
y.1	mm	34
y.2	mm	34
y.3	mm	34
\.


--
-- Data for Name: mcustmachine; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY mcustmachine (mc_id, mc_orgid, mc_pressmanufacturer, mc_pressyearbuilt, mc_pressmodel, mc_presswidth, mc_presstype, mc_pressspeed, mc_presscylinderrepeat, mc_inkmanufacturer, mc_inkcommercialname, mc_inktype, mc_inktypeother, mc_inkviscosity, mc_inkvicosityother, mc_inkprintingunit_1, mc_inkprintingunit_2, mc_inkprintingunit_3, mc_inkprintingunit_4, mc_inkprintingunit_5, mc_inkvisocity_1, mc_inkvisocity_2, mc_inkvisocity_3, mc_inkvisocity_4, mc_inkvisocity_5, mc_inkph_1, mc_inkph_2, mc_inkph_3, mc_inkph_4, mc_inkph_5, mc_inkdensity_1, mc_inkdensity_2, mc_inkdensity_3, mc_inkdensity_4, mc_inkdensity_5, mc_platemanufacturer, mc_platecommercialname, mc_platetype, mc_platedurometer, mc_platethickness, mc_platerelief, mc_mountingtapemanufacturer, mc_mountingtapename, mc_mountingtapedensity, mc_mountingtapthickness, mc_mountingcarrierthickness, mc_mountingcushionmanufacturer, mc_mountingcushonname, mc_mountingdensity, mc_mountingcushionthickness, mc_cimplevel_1, mc_cimplevel_2, mc_cimplevel_3, mc_cimplevel_4, mc_cimplevel_5, mc_cimpsubstrate_1, mc_cimpsubstrate_2, mc_cimpsubstrate_3, mc_cimpsubstrate_4, mc_cimpsubstrate_5, mc_cimpanlox_1, mc_cimpanlox_2, mc_cimpanlox_3, mc_cimpanlox_4, mc_cimpanlox_5, mc_aniloxmanufacturer, mc_aniloxtype, mc_aniloxengravingangle, mc_aniloxinking, mc_aniloxprintingunit_1, mc_aniloxprintingunit_2, mc_aniloxprintingunit_3, mc_aniloxprintingunit_4, mc_aniloxprintingunit_5, mc_aniloxmanufacturer_1, mc_aniloxmanufacturer_2, mc_aniloxmanufacturer_3, mc_aniloxmanufacturer_4, mc_aniloxmanufacturer_5, mc_aniloxtype_1, mc_aniloxtype_2, mc_aniloxtype_3, mc_aniloxtype_4, mc_aniloxtype_5, mc_aniloxengravingangle_1, mc_aniloxengravingangle_2, mc_aniloxengravingangle_3, mc_aniloxengravingangle_4, mc_aniloxengravingangle_5, mc_aniloxinking_1, mc_aniloxinking_2, mc_aniloxinking_3, mc_aniloxinking_4, mc_aniloxinking_5, mc_aniloxcellcount_1, mc_aniloxcellcount_2, mc_aniloxcellcount_3, mc_aniloxcellcount_4, mc_aniloxcellcount_5, mc_aniloxvolumn_1, mc_aniloxvolumn_2, mc_aniloxvolumn_3, mc_aniloxvolumn_4, mc_aniloxvolumn_5, mc_aniloxdoctoring_1, mc_aniloxdoctoring_2, mc_aniloxdoctoring_3, mc_aniloxdoctoring_4, mc_aniloxdoctoring_5, mc_substratemanufacturer, mc_substratename, mc_substratetype, mc_substratedyna, mc_substrateweight, mc_substrateflute, mc_substratethickness) FROM stdin;
\.


--
-- Name: mcustmachine_mc_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('mcustmachine_mc_id_seq', 1, false);


--
-- Data for Name: mforecast; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY mforecast (ft_id, ft_orgid, ft_year, ft_janqty, ft_jansale, ft_febqty, ft_febsale, ft_marqty, ft_marsale, ft_aprqty, ft_aprsale, ft_mayqty, ft_maysale, ft_junqty, ft_junsale, ft_julqty, ft_julsale, ft_augqty, ft_augsale, ft_sepqty, ft_sepsale, ft_octqty, ft_octsale, ft_novqty, ft_novsale, ft_decqty, ft_decsale) FROM stdin;
\.


--
-- Name: mforecast_ft_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('mforecast_ft_id_seq', 1, false);


--
-- Data for Name: mjobcat; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY mjobcat (jc_id, jc_jsid, jc_jclid) FROM stdin;
\.


--
-- Name: mjobcat_jc_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('mjobcat_jc_id_seq', 1, false);


--
-- Data for Name: mjobcatlookup; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY mjobcatlookup (jcl_id, jcl_title, jcl_requiretime, jcl_sequence) FROM stdin;
1	Typing	20	100
3	Monotone editing	50	300
2	Drawing	30	200
4	Trapping	100	400
5	Artwork Seperation	100	500
6	Barcode scan	60	600
7	Drawing varnish part	60	700
8	Master card	30	800
\.


--
-- Name: mjobcatlookup_jcl_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('mjobcatlookup_jcl_id_seq', 9, true);


--
-- Data for Name: mjobsheet; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY mjobsheet (js_id, js_cuid, js_ctid, js_request_date, js_request_by, js_title, js_description, js_material_provided, js_cyan, js_magenta, js_yellow, js_black, js_color_1, js_color_2, js_color_3, js_color_4, js_color_5, js_angle_1, js_angle_2, js_angle_3, js_angle_4, js_angle_5, js_bleeding, js_bleeding_remark, js_carcode, js_distortion, js_distortion_value, js_diecut_ind, js_thicknessplate, js_category, js_trapping_size, js_barcodetype, js_barcodenumber, js_primcat, js_status, js_completiondate, js_assignto, js_refid) FROM stdin;
\.


--
-- Name: mjobsheet_js_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('mjobsheet_js_id_seq', 1, false);


--
-- Data for Name: mjscartonvalue; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY mjscartonvalue (caval_id, caval_value, carval_carcode) FROM stdin;
\.


--
-- Name: mjscartonvalue_caval_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('mjscartonvalue_caval_id_seq', 1, false);


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

COPY pndcontact (ct_id, ct_refid, ct_reftype, ct_name, ct_email) FROM stdin;
1	2	ORG_ID	Danny	danny@gmail.com
2	3	ORG_ID	Jeremy	jeremy@gmail.com
3	4	ORG_ID	Mohamad	mohamad@gmail.com
4	5	ORG_ID	Justin	justin@gmail.com
5	6	ORG_ID	Alvin	alvin@gmail.com
6	7	ORG_ID	Tracy	tracy@gmail.com
\.


--
-- Name: pndcontact_ct_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('pndcontact_ct_id_seq', 6, true);


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
-- Data for Name: tmp_customersalesbycategory; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY tmp_customersalesbycategory (tmp_customername, tmp_mastercard, tmp_colourseperation, tmp_barcode, tmp_trapping, tmp_monotone, tmp_total, tmp_date) FROM stdin;
Darun	1	4	2	1	4	12	2014-03-15
Darun1	7	1	2	3	4	17	2014-03-16
Darun2	1	2	4	6	1	14	2014-03-18
\.


--
-- Data for Name: tmp_dailyactivity; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY tmp_dailyactivity (tmp_userid, tmp_date, tmp_time, tmp_activity, tmp_id) FROM stdin;
artist1	25-MAR-2014 	10:14:12	DONE  Pending acknowledgement JOB 1 (21)	1
artist1	25-MAR-2014 	11:14:12	DONE Work in progress check JOB1 (21)	2
\.


--
-- Name: tmp_dailyactivity_tmp_id_seq; Type: SEQUENCE SET; Schema: pnd; Owner: pnd
--

SELECT pg_catalog.setval('tmp_dailyactivity_tmp_id_seq', 2, true);


--
-- Data for Name: tmp_dailysalereport; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY tmp_dailysalereport (tmp_date, tmp_typing, tmp_drawing, tmp_mastercard, tmp_colorseperation, tmp_barcode, tmp_tapping, tmp_total) FROM stdin;
26-MAR-2014	310	215	120	510	210	610	1785
25-MAR-214	150	214	310	810	201	150	1835
\.


--
-- Data for Name: tmp_jobstatusreport; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY tmp_jobstatusreport (tmp_jsid, tmp_submissiondate, tmp_customername, tmp_completiondate, tmp_status, tmp_category, tmp_invoice) FROM stdin;
1	15-MAR-2014	Darun	16-MAR-2014	COMPLETED	TRAPPING	50
2	18-MAR-2014	Carton box	\N	REVERT	MATER CARD	30
3	24-APR-2014	Grand fortune	\N	ACKNOWLEDGED	COLOUR SEPERATION	20
4	25-APR-2014	Newbox	25-APR-2014	COMPLETED	TRAPPING	50
\.


--
-- Data for Name: tmp_monthsalesbycategory; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY tmp_monthsalesbycategory (tmp_cateogry, tmp_salesjan, tmp_salesfeb, tmp_salesmarch, tmp_salesapril, tmp_salesmay, tmp_salesjune, tmp_salesjuly, tmp_salesaug, tmp_salessept, tmp_salesoct, tmp_salesnov, tmp_salesdev) FROM stdin;
TYPING	2200	2200	4300	2400	2100	2700	2500	2700	2100	1600	1700	2100
DRAWING	1400	1100	1800	1600	500	100	700	300	1200	800	1400	1200
Barcode	900	600	1800	3100	2500	500	1200	1600	1200	100	800	160
\.


--
-- Data for Name: tmp_monthsalesbycustomer; Type: TABLE DATA; Schema: pnd; Owner: pnd
--

COPY tmp_monthsalesbycustomer (tmp_customername, tmp_salesjan, tmp_salesfeb, tmp_salesmarch, tmp_salesapril, tmp_salesmay, tmp_salesjune, tmp_salesjuly, tmp_salesaug, tmp_salessept, tmp_salesoct, tmp_salesnov, tmp_salesdev) FROM stdin;
Darun	2500	3100	4500	4800	4300	490	6100	4200	7500	4200	3200	5400
Grand fortune	2100	3500	4300	3700	3100	4100	4700	4200	4100	4500	4100	5100
Cartonbox	8100	8700	12100	7200	8100	8510	920	820	8200	4600	7600	7400
\.


SET search_path = pnd_bk23apr2014, pg_catalog;

--
-- Data for Name: fccountry; Type: TABLE DATA; Schema: pnd_bk23apr2014; Owner: shine
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
-- Data for Name: fclang; Type: TABLE DATA; Schema: pnd_bk23apr2014; Owner: shine
--

COPY fclang (lang_id, lang_code, lang_name, lang_status) FROM stdin;
1	AF	Afrikaans	ACTIVE
2	SQ	Albanian	ACTIVE
3	AM	Amharic	ACTIVE
4	AR-DZ	Arabic - Algeria	ACTIVE
5	AR-BH	Arabic - Bahrain	ACTIVE
6	AR-EG	Arabic - Egypt	ACTIVE
7	AR-IQ	Arabic - Iraq	ACTIVE
8	AR-JO	Arabic - Jordan	ACTIVE
9	AR-KW	Arabic - Kuwait	ACTIVE
10	AR-LB	Arabic - Lebanon	ACTIVE
11	AR-LY	Arabic - Libya	ACTIVE
12	AR-MA	Arabic - Morocco	ACTIVE
13	AR-OM	Arabic - Oman	ACTIVE
14	AR-QA	Arabic - Qatar	ACTIVE
15	AR-SA	Arabic - Saudi Arabia	ACTIVE
16	AR-SY	Arabic - Syria	ACTIVE
17	AR-TN	Arabic - Tunisia	ACTIVE
18	AR-AE	Arabic - United Arab Emirates	ACTIVE
19	AR-YE	Arabic - Yemen	ACTIVE
20	HY	Armenian	ACTIVE
21	AS	Assamese	ACTIVE
22	AZ-AZ	Azeri - Latin	ACTIVE
23	EU	Basque	ACTIVE
24	BE	Belarusian	ACTIVE
25	BN	Bengali - Bangladesh	ACTIVE
26	BS	Bosnian	ACTIVE
27	BG	Bulgarian	ACTIVE
28	MY	Burmese	ACTIVE
29	CA	Catalan	ACTIVE
30	ZH-CN	Chinese - China	ACTIVE
31	ZH-HK	Chinese - Hong Kong SAR	ACTIVE
32	ZH-MO	Chinese - Macau SAR	ACTIVE
33	ZH-SG	Chinese - Singapore	ACTIVE
34	ZH-TW	Chinese - Taiwan	ACTIVE
35	HR	Croatian	ACTIVE
36	CS	Czech	ACTIVE
37	DA	Danish	ACTIVE
38	DV	Divehi; Dhivehi; Maldivian	ACTIVE
39	NL-BE	Dutch - Belgium	ACTIVE
40	NL-NL	Dutch - Netherlands	ACTIVE
41	EN-AU	English - Australia	ACTIVE
42	EN-BZ	English - Belize	ACTIVE
43	EN-CA	English - Canada	ACTIVE
44	EN-CB	English - Caribbean	ACTIVE
45	EN-GB	English - Great Britain	ACTIVE
46	EN-IN	English - India	ACTIVE
47	EN-IE	English - Ireland	ACTIVE
48	EN-JM	English - Jamaica	ACTIVE
49	EN-NZ	English - New Zealand	ACTIVE
50	EN-PH	English - Phillippines	ACTIVE
51	EN-ZA	English - Southern Africa	ACTIVE
52	EN-TT	English - Trinidad	ACTIVE
53	EN-US	English - United States	ACTIVE
54	ET	Estonian	ACTIVE
55	FO	Faroese	ACTIVE
56	FA	Farsi - Persian	ACTIVE
57	FI	Finnish	ACTIVE
58	FR-BE	French - Belgium	ACTIVE
59	FR-CA	French - Canada	ACTIVE
60	FR-FR	French - France	ACTIVE
61	FR-LU	French - Luxembourg	ACTIVE
62	FR-CH	French - Switzerland	ACTIVE
63	MK	FYRO Macedonia	ACTIVE
64	GD-IE	Gaelic - Ireland	ACTIVE
65	GD	Gaelic - Scotland	ACTIVE
66	DE-AT	German - Austria	ACTIVE
67	DE-DE	German - Germany	ACTIVE
68	DE-LI	German - Liechtenstein	ACTIVE
69	DE-LU	German - Luxembourg	ACTIVE
70	DE-CH	German - Switzerland	ACTIVE
71	EL	Greek	ACTIVE
72	GN	Guarani - Paraguay	ACTIVE
73	GU	Gujarati	ACTIVE
74	HE	Hebrew	ACTIVE
75	HI	Hindi	ACTIVE
76	HU	Hungarian	ACTIVE
77	IS	Icelandic	ACTIVE
78	ID	Indonesian	ACTIVE
79	IT-IT	Italian - Italy	ACTIVE
80	IT-CH	Italian - Switzerland	ACTIVE
81	JA	Japanese	ACTIVE
82	KN	Kannada	ACTIVE
83	KS	Kashmiri	ACTIVE
84	KK	Kazakh	ACTIVE
85	KM	Khmer	ACTIVE
86	KO	Korean	ACTIVE
87	LO	Lao	ACTIVE
88	LA	Latin	ACTIVE
89	LV	Latvian	ACTIVE
90	LT	Lithuanian	ACTIVE
91	MS-BN	Malay - Brunei	ACTIVE
92	MS-MY	Malay - Malaysia	ACTIVE
93	ML	Malayalam	ACTIVE
94	MT	Maltese	ACTIVE
95	MI	Maori	ACTIVE
96	MR	Marathi	ACTIVE
97	MN	Mongolian	ACTIVE
98	NE	Nepali	ACTIVE
99	NO-NO	Norwegian - Bokml	ACTIVE
100	OR	Oriya	ACTIVE
101	PL	Polish	ACTIVE
102	PT-BR	Portuguese - Brazil	ACTIVE
103	PT-PT	Portuguese - Portugal	ACTIVE
104	PA	Punjabi	ACTIVE
105	RM	Raeto-Romance	ACTIVE
106	RO-MO	Romanian - Moldova	ACTIVE
107	RO	Romanian - Romania	ACTIVE
108	RU	Russian	ACTIVE
109	RU-MO	Russian - Moldova	ACTIVE
110	SA	Sanskrit	ACTIVE
111	SR-SP	Serbian - Cyrillic	ACTIVE
112	TN	Setsuana	ACTIVE
113	SD	Sindhi	ACTIVE
114	SI	Sinhala; Sinhalese	ACTIVE
115	SK	Slovak	ACTIVE
116	SL	Slovenian	ACTIVE
117	SO	Somali	ACTIVE
118	SB	Sorbian	ACTIVE
119	ES-AR	Spanish - Argentina	ACTIVE
120	ES-BO	Spanish - Bolivia	ACTIVE
121	ES-CL	Spanish - Chile	ACTIVE
122	ES-CO	Spanish - Colombia	ACTIVE
123	ES-CR	Spanish - Costa Rica	ACTIVE
124	ES-DO	Spanish - Dominican Republic	ACTIVE
125	ES-EC	Spanish - Ecuador	ACTIVE
126	ES-SV	Spanish - El Salvador	ACTIVE
127	ES-GT	Spanish - Guatemala	ACTIVE
128	ES-HN	Spanish - Honduras	ACTIVE
129	ES-MX	Spanish - Mexico	ACTIVE
130	ES-NI	Spanish - Nicaragua	ACTIVE
131	ES-PA	Spanish - Panama	ACTIVE
132	ES-PY	Spanish - Paraguay	ACTIVE
133	ES-PE	Spanish - Peru	ACTIVE
134	ES-PR	Spanish - Puerto Rico	ACTIVE
135	ES-ES	Spanish - Spain (Traditional)	ACTIVE
136	ES-UY	Spanish - Uruguay	ACTIVE
137	ES-VE	Spanish - Venezuela	ACTIVE
138	SW	Swahili	ACTIVE
139	SV-FI	Swedish - Finland	ACTIVE
140	SV-SE	Swedish - Sweden	ACTIVE
141	TG	Tajik	ACTIVE
142	TA	Tamil	ACTIVE
143	TT	Tatar	ACTIVE
144	TE	Telugu	ACTIVE
145	TH	Thai	ACTIVE
146	BO	Tibetan	ACTIVE
147	TS	Tsonga	ACTIVE
148	TR	Turkish	ACTIVE
149	TK	Turkmen	ACTIVE
150	UK	Ukrainian	ACTIVE
151	UTF-8	Unicode	ACTIVE
152	UR	Urdu	ACTIVE
153	UZ-UZ	Uzbek - Cyrillic	ACTIVE
154	VI	Vietnamese	ACTIVE
155	CY	Welsh	ACTIVE
156	XH	Xhosa	ACTIVE
157	YI	Yiddish	ACTIVE
158	ZU	Zulu	ACTIVE
\.


--
-- Name: fclang_lang_id_seq; Type: SEQUENCE SET; Schema: pnd_bk23apr2014; Owner: shine
--

SELECT pg_catalog.setval('fclang_lang_id_seq', 158, true);


--
-- Data for Name: fclog; Type: TABLE DATA; Schema: pnd_bk23apr2014; Owner: shine
--

COPY fclog (log_id, log_created, log_cat, log_cat2, log_ref, log_ref2, log_ref3, log_desc, log_desc2) FROM stdin;
\.


--
-- Name: fclog_log_id_seq; Type: SEQUENCE SET; Schema: pnd_bk23apr2014; Owner: shine
--

SELECT pg_catalog.setval('fclog_log_id_seq', 1, false);


--
-- Data for Name: fclookup; Type: TABLE DATA; Schema: pnd_bk23apr2014; Owner: shine
--

COPY fclookup (lu_cat, lu_code, lu_parentcode, lu_title, lu_status, lu_id) FROM stdin;
THEME	blacktie	ROOT	Black Tie	ACTIVE	1
THEME	blitzer	ROOT	Blitzer	ACTIVE	2
THEME	darkness	ROOT	Darkness	ACTIVE	3
THEME	dotluv	ROOT	Dot Luv	ACTIVE	4
THEME	eggplant	ROOT	Eggplant	ACTIVE	5
THEME	overcast	ROOT	Overcast	ACTIVE	6
THEME	skyblue	ROOT	Skyblue	ACTIVE	7
THEME	smoothness	ROOT	Smoothness	ACTIVE	8
LANGUAGE	zh_TW	ROOT	Chinese	ACTIVE	9
LANGUAGE	en_US	ROOT	English	ACTIVE	10
COURSE	BUSINESS	ROOT	Business	ACTIVE	11
COURSE	BIOSCIENCES	ROOT	Biosciences	ACTIVE	14
COURSE	COMMUNICATION	ROOT	Communication	ACTIVE	15
COURSE	IT	ROOT	Computing & IT	ACTIVE	16
COURSE	DESIGN	ROOT	Design	ACTIVE	17
COURSE	EDUCATION	ROOT	Education	ACTIVE	18
COURSE	ENGINEERING	ROOT	Engineering	ACTIVE	19
COURSE	H&T	ROOT	Hospitality, Tourism & Culinary Arts	ACTIVE	20
COURSE	LAW	ROOT	Law	ACTIVE	21
COURSE	MEDICINE	ROOT	Medicine	ACTIVE	22
COURSE	PHARMACY	ROOT	Pharmacy	ACTIVE	23
EXP	FIRSTJOB	ROOT	I am a fresh graduate seeking my first job	ACTIVE	27
EXP	INTERN	ROOT	I am a student seeking internship 	ACTIVE	24
EXP	WORKSINCE	ROOT	I have been working since	ACTIVE	28
YEAR	1970	ROOT	1970	ACTIVE	29
YEAR	1971	ROOT	1971	ACTIVE	30
YEAR	1972	ROOT	1972	ACTIVE	31
YEAR	1973	ROOT	1973	ACTIVE	32
YEAR	1974	ROOT	1974	ACTIVE	33
YEAR	1975	ROOT	1975	ACTIVE	34
YEAR	1976	ROOT	1976	ACTIVE	35
YEAR	1977	ROOT	1977	ACTIVE	36
YEAR	1978	ROOT	1978	ACTIVE	37
YEAR	1979	ROOT	1979	ACTIVE	38
YEAR	1980	ROOT	1980	ACTIVE	39
YEAR	1981	ROOT	1981	ACTIVE	40
YEAR	1982	ROOT	1982	ACTIVE	41
YEAR	1983	ROOT	1983	ACTIVE	42
YEAR	1984	ROOT	1984	ACTIVE	43
YEAR	1985	ROOT	1985	ACTIVE	44
YEAR	1986	ROOT	1986	ACTIVE	45
YEAR	1987	ROOT	1987	ACTIVE	46
YEAR	1988	ROOT	1988	ACTIVE	47
YEAR	1989	ROOT	1989	ACTIVE	48
YEAR	1990	ROOT	1990	ACTIVE	49
YEAR	1991	ROOT	1991	ACTIVE	50
YEAR	1992	ROOT	1992	ACTIVE	51
YEAR	1993	ROOT	1993	ACTIVE	52
YEAR	1994	ROOT	1994	ACTIVE	53
YEAR	1995	ROOT	1995	ACTIVE	54
YEAR	1996	ROOT	1996	ACTIVE	55
YEAR	1997	ROOT	1997	ACTIVE	56
YEAR	1998	ROOT	1998	ACTIVE	57
YEAR	1999	ROOT	1999	ACTIVE	58
YEAR	2000	ROOT	2000	ACTIVE	59
YEAR	2001	ROOT	2001	ACTIVE	60
YEAR	2002	ROOT	2002	ACTIVE	61
YEAR	2003	ROOT	2003	ACTIVE	62
YEAR	2004	ROOT	2004	ACTIVE	63
YEAR	2005	ROOT	2005	ACTIVE	64
YEAR	2006	ROOT	2006	ACTIVE	65
YEAR	2007	ROOT	2007	ACTIVE	66
YEAR	2008	ROOT	2008	ACTIVE	67
YEAR	2009	ROOT	2009	ACTIVE	68
YEAR	2010	ROOT	2010	ACTIVE	69
YEAR	2011	ROOT	2011	ACTIVE	70
YEAR	2012	ROOT	2012	ACTIVE	71
YEAR	2013	ROOT	2013	ACTIVE	72
SUBJECT	SCSC121	ROOT	Introduction to Computer Programming	ACTIVE	73
SUBJECT	COSC261	ROOT	Formal Languages and Compilers	ACTIVE	74
SUBJECT	COSC262	ROOT	Algorithms	ACTIVE	76
SUBJECT	COSC265	ROOT	Relational Database Systems	ACTIVE	77
SUBJECT	COSC467	ROOT	Computational Intelligence	ACTIVE	79
SUBJECT	COSC364	ROOT	Internet Technology and Engineering	ACTIVE	80
SUBJECT	COSC411	ROOT	Information and Software Visualisation	ACTIVE	81
SEMESTER	SMS12012	ROOT	Semester 1 2012	ACTIVE	82
SEMESTER	SMS22012	ROOT	Semester 2 2012	ACTIVE	83
SEMESTER	SMS32012	ROOT	Semester 3 2012	ACTIVE	84
SEMESTER	SMS12013	ROOT	Semester 1 2013	ACTIVE	85
SEMESTER	SMS22013	ROOT	Semester 2 2013	ACTIVE	86
SEMESTER	SMS32013	ROOT	Semester 3 2013	ACTIVE	87
SUBJECT	COSC110	ROOT	Working in a Digital World	ACTIVE	89
SUBJECT	COSC122	ROOT	Introduction to Computer Science	ACTIVE	90
SUBJECT	COSC264	ROOT	Data Communications and Networking	ACTIVE	91
SUBJECT	COSC362	ROOT	Data and Network Security	ACTIVE	92
SUBJECT	COSC363	ROOT	Computer Graphics	ACTIVE	93
SUBJECT	COSC366	ROOT	Research Project	ACTIVE	94
SUBJECT	COSC401	ROOT	Machine Learning	ACTIVE	95
SUBJECT	COSC410	ROOT	Simulation: Modelling and Analysis	ACTIVE	96
SUBJECT	COSC413	ROOT	Advanced Topics in Algorithms	ACTIVE	98
SUBJECT	COSC418	ROOT	Wireless Ad-hoc and Sensor Networks	ACTIVE	99
SUBJECT	COSC421	ROOT	Advanced Topics in Security	ACTIVE	100
SUBJECT	COSC422	ROOT	Advanced Computer Graphics	ACTIVE	101
SUBJECT	COSC424	ROOT	Augmented Reality	ACTIVE	102
SUBJECT	COSC428	ROOT	Computer Vision	ACTIVE	103
SUBJECT	COSC460	ROOT	Special Topic	ACTIVE	104
EVENT	DINNER	ROOT	Dinner	ACTIVE	105
EVENT	BOWLING	ROOT	Bowling	ACTIVE	106
EVENT	GOLF	ROOT	Golf	ACTIVE	107
MEMBER	MEMBERSHIP	ROOT	Membership	ACTIVE	108
EVENT	SEMINAR	ROOT	Seminar	ACTIVE	110
EXAM	EXAM	ROOT	Exam	ACTIVE	109
\.


--
-- Name: fclookup_lu_id_seq; Type: SEQUENCE SET; Schema: pnd_bk23apr2014; Owner: shine
--

SELECT pg_catalog.setval('fclookup_lu_id_seq', 116, true);


--
-- Data for Name: fcmenu; Type: TABLE DATA; Schema: pnd_bk23apr2014; Owner: shine
--

COPY fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode) FROM stdin;
1	HEADERMENU	0	Top Menu	ACTIVE	0		Y	\N	\N	\N	\N	\N	\N
69	MENU	6	Menu Setup	ACTIVE	4400	\N	Y	Setting	\N	menusetup	\N	\N	\N
82	USERSETTING	6	User Setting	ACTIVE	2000	\N	Y	\N	\N	\N	\N	\N	\N
49	USERSETUP	82	User Setup	ACTIVE	4210	\N	Y	Setting		usersetting			\N
50	PERMSETUP	82	Permission Setup	ACTIVE	4230	\N	Y	Setting		permsetting			\N
51	ROLESETUP	82	Role Setup	ACTIVE	4220	\N	Y	Setting		rolesetting			\N
6	SETTING	1	Setting	ACTIVE	9000	\N	N	\N	\N	\N	\N	\N	\N
83	LOOKUPSETUP	6	Lookup Setup	ACTIVE	2000	\N	Y	Setting	\N	lookupSetup	\N	\N	\N
84	JOBCATSETUP	6	Job category setup	ACTIVE	3000	\N	Y	Setting	\N	jobcatsetup	\N	\N	\N
85	CARTONSETUP	6	Carton setup	ACTIVE	3000	\N	Y	Setting	\N	cartonSetup	\N	\N	\N
86	QCHOME	1	Home (QC)	ACTIVE	1000	\N	Y	Home	\N	qchome	\N	\N	\N
87	ARTHOME	1	Home (Artist)	ACTIVE	1100	\N	Y	Home	\N	artisthome	\N	\N	\N
88	SVHOME	1	Home (Supervisor)	ACTIVE	1200	\N	Y	Home	\N	supervisorhome	\N	\N	\N
\.


--
-- Name: fcmenu_mn_id_seq; Type: SEQUENCE SET; Schema: pnd_bk23apr2014; Owner: shine
--

SELECT pg_catalog.setval('fcmenu_mn_id_seq', 88, true);


--
-- Name: fcmenu_mn_parentid_seq; Type: SEQUENCE SET; Schema: pnd_bk23apr2014; Owner: shine
--

SELECT pg_catalog.setval('fcmenu_mn_parentid_seq', 6, true);


--
-- Data for Name: fcorg; Type: TABLE DATA; Schema: pnd_bk23apr2014; Owner: pnd
--

COPY fcorg (org_id, org_type, org_external, org_name, org_parentid, org_primaryid, org_address, org_contactno, org_status) FROM stdin;
\.


--
-- Name: fcorg_org_id_seq; Type: SEQUENCE SET; Schema: pnd_bk23apr2014; Owner: pnd
--

SELECT pg_catalog.setval('fcorg_org_id_seq', 1, false);


--
-- Data for Name: fcpermission; Type: TABLE DATA; Schema: pnd_bk23apr2014; Owner: shine
--

COPY fcpermission (pms_id, pms_code, pms_desc, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) FROM stdin;
1	MENU_DASHBOARD	VIEW DASHBOARD	2013-11-24 17:33:07.775+08	\N	N	\N
3	MENU_HOME	VIEW HOME	2013-11-24 17:33:38.778+08	\N	N	\N
4	MENU_REPORT	VIEW REPORT	2013-11-24 17:33:53.525+08	\N	N	\N
5	MENU_SETTING	VIEW SETTINGS	2013-11-24 17:34:02.799+08	\N	N	\N
21	REQUEST_ADHOC_ACTIVITY	Request adhoc activity	2014-04-12 11:04:39.285+08	\N	N	\N
22	REQUEST_TSAT	Request TSAT	2014-04-12 11:04:50.532+08	\N	N	\N
\.


--
-- Name: fcpermission_pms_id_seq; Type: SEQUENCE SET; Schema: pnd_bk23apr2014; Owner: shine
--

SELECT pg_catalog.setval('fcpermission_pms_id_seq', 22, true);


--
-- Data for Name: fcpmcaseflow; Type: TABLE DATA; Schema: pnd_bk23apr2014; Owner: shine
--

COPY fcpmcaseflow (f_id, f_timestamp, f_opid, f_caseid, f_casetype, f_status, f_del_timestamp, f_userid, f_decision) FROM stdin;
241	2014-03-01 13:08:44.104+08	35	1	newapp	ACTV	\N	tony	\N
246	2014-03-01 15:02:04.807+08	36	2	newapp	ACTV	\N	tony	\N
242	2014-03-01 14:32:37.246+08	35	2	newapp	DEL	2014-03-01 15:24:14.291+08	tony	\N
247	2014-03-01 15:24:14.291+08	37	2	newapp	ACTV	\N	tony	\N
248	2014-03-01 15:41:24.996+08	35	3	newapp	ACTV	\N	tony	\N
249	2014-03-01 15:43:59.518+08	35	4	newapp	DEL	2014-03-01 15:52:17.797+08	tony	\N
250	2014-03-01 15:52:17.797+08	36	4	newapp	ACTV	\N	tony	\N
251	2014-04-12 11:06:31.6+08	42	1	adhoc	ACTV	\N	\N	\N
252	2014-04-12 11:06:31.662+08	43	1	adhoc	ACTV	\N	\N	\N
253	2014-04-12 11:06:31.666+08	43	1	adhoc	ACTV	\N	\N	\N
\.


--
-- Name: fcpmcaseflow_f_id_seq; Type: SEQUENCE SET; Schema: pnd_bk23apr2014; Owner: shine
--

SELECT pg_catalog.setval('fcpmcaseflow_f_id_seq', 253, true);


--
-- Data for Name: fcpmcasetype; Type: TABLE DATA; Schema: pnd_bk23apr2014; Owner: shine
--

COPY fcpmcasetype (ct_code, ct_desc, ct_table, ct_desc_col, ct_key_col) FROM stdin;
adhoc	Adhoc Activity	shadhocactivity	aha_name	aha_id
\.


--
-- Data for Name: fcpmoperation; Type: TABLE DATA; Schema: pnd_bk23apr2014; Owner: shine
--

COPY fcpmoperation (op_id, op_parentid, op_wfid, op_name, op_type, op_x, op_y, op_next_opid, op_escalate_opid, op_userrole, op_task_func, op_pmscode) FROM stdin;
42	0	17	New Request	DATAENTRY	0	100	43	\N	\N	requestAdhocActivity	REQUEST_ADHOC_ACTIVITY
43	0	17	Approval	DATAENTRY	0	100	\N	\N	\N	adhocActivityApproval	ADHOC_APPROVAL
\.


--
-- Name: fcpmoperation_op_id_seq; Type: SEQUENCE SET; Schema: pnd_bk23apr2014; Owner: shine
--

SELECT pg_catalog.setval('fcpmoperation_op_id_seq', 42, true);


--
-- Data for Name: fcpmoperationtype; Type: TABLE DATA; Schema: pnd_bk23apr2014; Owner: shine
--

COPY fcpmoperationtype (opt_code, opt_name, opt_order, opt_ui, opt_method, opt_shape, opt_bgcolor, opt_icon, opt_fontcolor) FROM stdin;
DATAENTRY	Data Entry	1	Y	\N	\N	\N	\N	\N
\.


--
-- Data for Name: fcpmworkflow; Type: TABLE DATA; Schema: pnd_bk23apr2014; Owner: shine
--

COPY fcpmworkflow (wf_id, wf_name, wf_seq, wf_userrole, wf_status) FROM stdin;
18	TSAT	200	\N	ACTIVE
19	Reflection	300	\N	ACTIVE
17	Adhoc Activity	100	\N	ACTIVE
\.


--
-- Name: fcpmworkflow_wf_id_seq; Type: SEQUENCE SET; Schema: pnd_bk23apr2014; Owner: shine
--

SELECT pg_catalog.setval('fcpmworkflow_wf_id_seq', 19, true);


--
-- Data for Name: fcrole; Type: TABLE DATA; Schema: pnd_bk23apr2014; Owner: shine
--

COPY fcrole (rol_id, rol_code, rol_desc, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid, rol_status) FROM stdin;
10	admin	admin	2014-02-11 11:20:15.419+08	\N	N	\N	ACTIVE
12	student	student	2014-04-11 13:51:55.782+08	\N	N	\N	ACTIVE
13	supervisor	Shine supervisor	2014-04-11 13:53:30.706+08	\N	N	\N	ACTIVE
11	shineadmin	Shine admin	2014-04-11 13:51:40.912+08	\N	N	\N	ACTIVE
\.


--
-- Name: fcrole_rol_id_seq; Type: SEQUENCE SET; Schema: pnd_bk23apr2014; Owner: shine
--

SELECT pg_catalog.setval('fcrole_rol_id_seq', 13, true);


--
-- Data for Name: fcroleperm; Type: TABLE DATA; Schema: pnd_bk23apr2014; Owner: shine
--

COPY fcroleperm (rp_id, rp_rolid, rp_pmsid) FROM stdin;
31	4	1
32	4	3
33	4	17
34	4	16
42	3	1
43	3	3
44	3	4
45	3	5
46	3	6
47	3	12
48	3	2
49	3	18
50	3	19
62	1	1
63	1	3
64	1	4
65	1	5
66	1	6
67	1	12
68	1	2
69	1	17
70	1	16
71	1	18
72	1	19
73	1	20
110	10	1
111	10	3
112	10	4
113	10	5
114	10	21
115	10	22
116	12	3
117	12	21
118	13	3
119	13	4
120	13	22
121	11	3
122	11	4
123	11	5
124	11	22
\.


--
-- Name: fcroleperm_rp_id_seq; Type: SEQUENCE SET; Schema: pnd_bk23apr2014; Owner: shine
--

SELECT pg_catalog.setval('fcroleperm_rp_id_seq', 124, true);


--
-- Data for Name: fcrule; Type: TABLE DATA; Schema: pnd_bk23apr2014; Owner: shine
--

COPY fcrule (ru_id, ru_name, ru_true_msg, ru_false_msg, ru_data) FROM stdin;
\.


--
-- Name: fcrule_ru_id_seq; Type: SEQUENCE SET; Schema: pnd_bk23apr2014; Owner: shine
--

SELECT pg_catalog.setval('fcrule_ru_id_seq', 1, false);


--
-- Data for Name: fcsetting; Type: TABLE DATA; Schema: pnd_bk23apr2014; Owner: shine
--

COPY fcsetting (set_id, set_user, set_code, set_description, set_val, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) FROM stdin;
3	shine	DEFCHECKIN	Default Check In Time	\N	2013-08-17 12:48:12.522+08	\N	N	\N
4	shine	DEFCHECKOUT	Default Check Out Time	\N	2013-08-17 12:48:12.522+08	\N	N	\N
6	shine	EICHARGE	Early Check In Charges	\N	2013-08-30 12:22:42.163+08	\N	N	\N
7	shine	LOCHARGE	Late Check Out Charges	\N	2013-08-30 12:22:42.163+08	\N	N	\N
2	*	MAXLIFETIME	Maximum Idle Time (in second)	15	2013-08-15 09:55:18.85+08	\N	N	\N
1	shine	LANG	English - United States	EN-US	2013-08-15 09:55:18.85+08	\N	N	\N
5	shine	THEME	Bootstrap Metro	bootstrap_metro	2013-08-28 11:42:31.422+08	\N	N	\N
8	shine	LIFETIME_MEMBER_FEE	Lifetime Member Fee	15000	2014-02-09 14:32:02.393+08	\N	N	\N
9	shine	MONTHLY_MEMBER_FEE	Monthly Member Fee	1000	2014-02-09 14:33:05.846+08	\N	N	\N
\.


--
-- Name: fcsetting_set_id_seq; Type: SEQUENCE SET; Schema: pnd_bk23apr2014; Owner: shine
--

SELECT pg_catalog.setval('fcsetting_set_id_seq', 7, true);


--
-- Data for Name: fcudv; Type: TABLE DATA; Schema: pnd_bk23apr2014; Owner: shine
--

COPY fcudv (udv_code, udv_name, udv_query_type, udv_query, udv_return_type, udv_result_type, udv_result_lookup_type, udv_result_lookup) FROM stdin;
application_no	Application Number	php	'{$APPNO}'	CELL	\N	\N	\N
applicant_name	Applicant Name	sql	select sc_applicantname from spcase where sc_applicationno='[[application_no]]'	CELL	\N	\N	\N
lo_print_date	Print Sysdate	sql	select to_char(now(),'DD-MON-YYYY')	CELL	\N	\N	\N
STAFF_DEPARTMENT	User Org Name	sql	select org_name from fcorg where org_id='{$USER->orgid}'	CELL	\N	\N	\N
AMT_APPROVED	Amount Approved	sql	select trim(to_char(sc_amtapproved,'999,999,999,999,999,990.00')) from spcase where sc_applicationno='[[application_no]]'	CELL	\N	\N	\N
INTEREST_RATE	Interest Rate	sql	select trim(to_char(sc_rate,'999,999,999,999,999,990.00')) from spcase where sc_applicationno='[[application_no]]'	CELL	\N	\N	\N
LOAN_TENURE_MTH	Loan Tenure Month	sql	select sc_tenure from spcase where sc_applicationno='[[application_no]]'	CELL	\N	\N	\N
INSTALMENT_AMT	Instalment Amount	sql	select  trim(to_char(sc_regularinst,'999,999,999,999,999,990.00')) from spcase where sc_applicationno='[[application_no]]'	CELL	\N	\N	\N
TOTAL_PAYABLE	Total Payable	sql	select  trim(to_char(sc_totalpayable,'999,999,999,999,999,990.00')) from spcase where sc_applicationno='[[application_no]]'	CELL	\N	\N	\N
APPROVED_BY	Approved By	sql	select usr_name from fcuser join spcase on usr_userid = sc_approvedby where sc_applicationno='[[application_no]]'	CELL	\N	\N	\N
\.


--
-- Data for Name: fcuser; Type: TABLE DATA; Schema: pnd_bk23apr2014; Owner: shine
--

COPY fcuser (usr_userid, usr_password, usr_created, usr_name, usr_email, usr_last_active, usr_last_success_login, usr_last_fail_login, usr_group, usr_sessiondata, usr_langid, usr_status) FROM stdin;
yys1988@gmail.com	5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8	2014-02-06 18:07:29.158+08	Yow YS	yys1988@gmail.com	\N	\N	\N	\N	\N	\N	ACTIVE
lampard7824@gmail.com	5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8	2014-02-06 17:25:06.905+08	Lampard	lampard7824@gmail.com	2014-02-11 12:07:13+08	2014-02-11 12:06:12+08	2014-02-11 12:05:48+08	\N	a:0:{}	\N	ACTIVE
danny@phiorion.com	5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8	2014-02-12 14:35:17.033+08	Danny Foo	danny@phiorion.com	\N	\N	\N	\N	\N	\N	ACTIVE
hongyee@phiorion.com	5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8	2014-02-12 14:36:19.974+08	Hong Yee	hongyee@phiorion.com	\N	\N	\N	\N	\N	\N	ACTIVE
fong@phiorion.com	5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8	2014-02-12 14:37:38.239+08	Fong Hing Yeh	fong@phiorion.com	\N	\N	\N	\N	\N	\N	ACTIVE
esp@phiorion.com	5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8	2014-02-11 12:19:59.605+08	esp	esp@phiorion.com	2014-02-16 14:54:32+08	2014-02-16 14:53:52+08	2014-02-11 12:32:28+08	\N	a:0:{}	\N	ACTIVE
yow@phiorion.com	5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8	2014-02-12 14:38:47.589+08	Yow 	yow@phiorion.com	\N	\N	\N	\N	\N	\N	ACTIVE
thor@gmail.com	5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8	2014-02-12 14:42:15.179+08	Thor	thor@gmail.com	\N	\N	\N	\N	\N	\N	ACTIVE
superman@gmail.com	5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8	2014-02-12 14:43:06.208+08	Superman	superman@gmail.com	\N	\N	\N	\N	\N	\N	ACTIVE
admin2	d033e22ae348aeb5660fc2140aec35850c4da997	2014-01-26 15:39:57.04+08	Administrator 2	\N	2014-03-01 15:38:19+08	2014-03-01 15:38:05+08	2014-02-05 15:30:53+08	ADMIN	a:1:{s:7:"dbosess";a:0:{}}	\N	ACTIVE
harry	23a0b5e4fb6c6e8280940920212ecd563859cb3c	2014-04-11 15:44:42.34+08	Harry	harry@gmail.com	\N	\N	\N	\N	\N	\N	ACTIVE
fred	31017a722665e4afce586950f42944a6d331dabf	2014-04-11 15:46:27.77+08	Fred	fred@gmail.com	\N	\N	\N	\N	\N	\N	ACTIVE
severus	4f459f91101e7bf14b9b264595768defeef7c7f1	2014-04-11 15:47:11.276+08	Severus	severus@gmail.com	2014-04-12 11:11:18+08	2014-04-12 11:11:10+08	\N	\N	a:0:{}	\N	ACTIVE
albus	9ef7255743acc528a4b2d83eeb398f5982fe4b2d	2014-04-11 15:47:30.12+08	Albus	albus@gmail.com	\N	\N	\N	\N	\N	\N	ACTIVE
admin	d033e22ae348aeb5660fc2140aec35850c4da997	2013-08-15 09:55:18.85+08	Administrator	\N	2014-04-23 09:30:12+08	2014-04-23 09:16:15+08	2014-03-26 18:54:54+08	ADMIN	a:3:{s:7:"dbosess";a:8:{s:4:"menu";a:4:{s:6:"lastid";a:1:{s:5:"mn_id";s:2:"86";}s:4:"sort";a:0:{}s:6:"search";a:9:{s:7:"mn_code";s:0:"";s:8:"mn_title";s:0:"";s:9:"mn_status";s:0:"";s:10:"mn_webflag";s:0:"";s:8:"mn_order";s:0:"";s:10:"mn_pmscode";s:0:"";s:7:"mn_func";s:0:"";s:8:"mn_class";s:0:"";s:11:"mn_parentid";s:0:"";}s:5:"state";s:4:"list";}s:0:"";a:3:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}}s:7:"jobinfo";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:3:"new";}s:6:"lookup";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:5:{s:6:"lu_cat";s:6:"JOBCAT";s:7:"lu_code";s:0:"";s:13:"lu_parentcode";s:0:"";s:8:"lu_title";s:0:"";s:9:"lu_status";s:0:"";}s:5:"state";s:4:"list";}s:11:"jobcatsetup";a:4:{s:6:"lastid";a:1:{s:6:"jcl_id";s:1:"7";}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"list";}s:8:"jobcolor";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:3:"new";}s:8:"jobother";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:3:"new";}s:11:"cartonsetup";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:3:"new";}}s:9:"dboconfig";a:0:{}s:7:"dboload";s:11:"cartonsetup";}	\N	ACTIVE
\.


--
-- Data for Name: fcuserdiary; Type: TABLE DATA; Schema: pnd_bk23apr2014; Owner: shine
--

COPY fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status) FROM stdin;
4	2014-02-11 12:35:04.406+08	*shine	esp@phiorion.com	2014-06-27 00:00:00+08	Notice	Your registration on Planters dinner has been approved. Please make payment before event date.	\N	ACTIVE
5	2014-02-11 12:35:08.767+08	*shine	esp@phiorion.com	2014-03-31 00:00:00+08	Notice	Your registration on March Examination! has been approved. Please make payment before event date.	\N	ACTIVE
3	2014-02-11 12:34:23.307+08	*shine	esp@phiorion.com	\N	Notice	Your registration on March Examination! is now pending for approval.	\N	DELETE
2	2014-02-11 12:34:10.986+08	*shine	esp@phiorion.com	\N	Notice	Your registration on Planters dinner is now pending for approval.	\N	INACTIVE
1	2014-02-11 12:19:59.605+08	*shine	esp@phiorion.com	\N	Notice	Your membership registration is now pending for approval.	\N	ACTIVE
6	2014-02-12 13:55:54.825+08	*shine	esp@phiorion.com	\N	Notice	Thanks for your payment of 1,000.00 for the invoice INV0000000002	\N	ACTIVE
7	2014-02-12 13:55:54.828+08	*shine	esp@phiorion.com	2014-03-31 00:00:00+08	Notice	You can now attend March Examination!.	\N	ACTIVE
8	2014-02-12 13:55:59.076+08	*shine	esp@phiorion.com	\N	Notice	Thanks for your payment of 500.00 for the invoice INV0000000001	\N	ACTIVE
9	2014-02-12 13:55:59.12+08	*shine	esp@phiorion.com	2014-06-27 00:00:00+08	Notice	You can now attend Planters dinner.	\N	ACTIVE
10	2014-02-12 13:56:20.641+08	*shine	esp@phiorion.com	\N	Notice	Your membership application is now approved. Please make payment.	\N	ACTIVE
11	2014-02-12 14:35:17.033+08	*shine	danny@phiorion.com	\N	Notice	Your membership registration is now pending for approval.	\N	ACTIVE
12	2014-02-12 14:36:19.974+08	*shine	hongyee@phiorion.com	\N	Notice	Your membership registration is now pending for approval.	\N	ACTIVE
13	2014-02-12 14:37:38.239+08	*shine	fong@phiorion.com	\N	Notice	Your membership registration is now pending for approval.	\N	ACTIVE
14	2014-02-12 14:38:47.589+08	*shine	yow@phiorion.com	\N	Notice	Your membership registration is now pending for approval.	\N	ACTIVE
15	2014-02-12 14:40:20.074+08	*shine	ironman@gmail.com	\N	Notice	Your membership registration is now pending for approval.	\N	ACTIVE
16	2014-02-12 14:41:05.04+08	*shine	captainamerica@gmail.com	\N	Notice	Your membership registration is now pending for approval.	\N	ACTIVE
17	2014-02-12 14:42:15.179+08	*shine	thor@gmail.com	\N	Notice	Your membership registration is now pending for approval.	\N	ACTIVE
18	2014-02-12 14:43:06.208+08	*shine	superman@gmail.com	\N	Notice	Your membership registration is now pending for approval.	\N	ACTIVE
19	2014-02-13 15:42:46.15+08	ispadmin	ispadmin	2014-02-28 00:00:00+08	Reminder	Meeting on 28-Feb-2014	<p>Meeting on 28-Feb-2014</p>	ACTIVE
20	2014-02-13 15:43:04.156+08	ispadmin	ispadmin	2014-02-20 00:00:00+08	Appointment	Meeting with Azlin for Lunch	<p>Meeting with Azlin for Lunch</p>	ACTIVE
21	2014-02-16 14:54:09.35+08	*shine	esp@phiorion.com	\N	Notice	Your registration on Dinner is now pending for approval.	\N	ACTIVE
22	2014-02-17 14:56:01.085+08	*shine	ironman@gmail.com	\N	Notice	Your membership application is now approved. Please make payment.	\N	ACTIVE
23	2014-02-17 14:56:04.732+08	*shine	ironman@gmail.com	\N	Notice	Your membership application is now approved. Please make payment.	\N	ACTIVE
24	2014-02-17 14:57:50.654+08	*shine	ironman@gmail.com	\N	Notice	Thanks for your payment of 1,000.00 for the invoice INV0000000004	\N	ACTIVE
25	2014-02-17 14:57:50.669+08	*shine	ironman@gmail.com	\N	Notice	Your membership application is now approved and active.	\N	ACTIVE
\.


--
-- Name: fcuserdiary_di_id_seq; Type: SEQUENCE SET; Schema: pnd_bk23apr2014; Owner: shine
--

SELECT pg_catalog.setval('fcuserdiary_di_id_seq', 25, true);


--
-- Data for Name: fcuserlogin; Type: TABLE DATA; Schema: pnd_bk23apr2014; Owner: shine
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
458	admin	127.0.0.1	Y	2014-04-22 10:09:22.651+08	2014-04-22 10:09:22.651+08	\N	N	\N
459	admin	127.0.0.1	Y	2014-04-22 10:13:36.918+08	2014-04-22 10:13:36.918+08	\N	N	\N
460	admin	127.0.0.1	Y	2014-04-22 10:15:12.54+08	2014-04-22 10:15:12.54+08	\N	N	\N
461	admin	127.0.0.1	Y	2014-04-23 09:16:15.007+08	2014-04-23 09:16:15.007+08	\N	N	\N
\.


--
-- Name: fcuserlogin_ul_id_seq; Type: SEQUENCE SET; Schema: pnd_bk23apr2014; Owner: shine
--

SELECT pg_catalog.setval('fcuserlogin_ul_id_seq', 461, true);


--
-- Data for Name: fcuserorgrole; Type: TABLE DATA; Schema: pnd_bk23apr2014; Owner: shine
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
\.


--
-- Name: fcuserorgrole_uor_id_seq; Type: SEQUENCE SET; Schema: pnd_bk23apr2014; Owner: shine
--

SELECT pg_catalog.setval('fcuserorgrole_uor_id_seq', 32, true);


--
-- Data for Name: fcusersession; Type: TABLE DATA; Schema: pnd_bk23apr2014; Owner: shine
--

COPY fcusersession (us_id, us_sessid, us_userid, us_ip, us_active, us_created, us_last_active, us_forcecloseby, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) FROM stdin;
408	1kkbhl72fl7lktmld4p5d10os0	ironman@gmail.com	127.0.0.1	Y	2014-02-17 15:31:34.882+08	2014-02-17 15:31:34+08	\N	2014-02-17 15:31:34.882+08	\N	N	\N
413	gcugqnip34q3s9t0svs3ugdhv5	admin2	192.168.0.117	Y	2014-03-01 15:38:05.877+08	2014-03-01 15:38:05+08	\N	2014-03-01 15:38:05.877+08	\N	N	\N
435	t3hh958g930f4c2kbtgbcspk90	admin	127.0.0.1	Y	2014-04-23 09:16:15.952+08	2014-04-23 09:16:15+08	\N	2014-04-23 09:16:15.952+08	\N	N	\N
\.


--
-- Name: fcusersession_us_id_seq; Type: SEQUENCE SET; Schema: pnd_bk23apr2014; Owner: shine
--

SELECT pg_catalog.setval('fcusersession_us_id_seq', 435, true);


--
-- Data for Name: mcarton; Type: TABLE DATA; Schema: pnd_bk23apr2014; Owner: pnd
--

COPY mcarton (car_id, car_name, car_fileextension) FROM stdin;
2	Test 1	png
3	Test 2	png
7	TEst 7	png
8	test 8	png
9	ttt	png
10	gggg	png
\.


--
-- Name: mcarton_car_id_seq; Type: SEQUENCE SET; Schema: pnd_bk23apr2014; Owner: pnd
--

SELECT pg_catalog.setval('mcarton_car_id_seq', 10, true);


--
-- Data for Name: mcartonvariable; Type: TABLE DATA; Schema: pnd_bk23apr2014; Owner: pnd
--

COPY mcartonvariable (carv_code, carv_unit, carv_carid) FROM stdin;
V1	mm	2
2	2	3
1	cc	7
1	gg	8
gg	cc	9
gg	gg	10
\.


--
-- Data for Name: mjobcatlookup; Type: TABLE DATA; Schema: pnd_bk23apr2014; Owner: pnd
--

COPY mjobcatlookup (jcl_id, jcl_title, jcl_requiretime, jcl_sequence) FROM stdin;
1	Typing	20	100
3	Monotone editing	50	300
2	Drawing	30	200
4	Trapping	100	400
5	Artwork Seperation	100	500
6	Barcode scan	60	600
7	Drawing varnish part	60	700
8	Master card	30	800
\.


--
-- Name: mjobcatlookup_jcl_id_seq; Type: SEQUENCE SET; Schema: pnd_bk23apr2014; Owner: pnd
--

SELECT pg_catalog.setval('mjobcatlookup_jcl_id_seq', 8, true);


--
-- Data for Name: mjobsheet; Type: TABLE DATA; Schema: pnd_bk23apr2014; Owner: pnd
--

COPY mjobsheet (js_id, js_cuid, js_ctid, js_request_date, js_request_by, js_title, js_model, js_description, js_material_provided, js_color_1, js_color_2, js_color_3, js_color_4, js_angle_1, js_angle_2, js_angle_3, js_angle_4, js_bleeding, js_bleeding_remark, js_carcode, js_distortion, js_distortion_value, js_diecut_ind, js_diecut_no, js_category, js_trapping_size, js_barcodetype, js_barcodenumber) FROM stdin;
\.


--
-- Name: mjobsheet_js_id_seq; Type: SEQUENCE SET; Schema: pnd_bk23apr2014; Owner: pnd
--

SELECT pg_catalog.setval('mjobsheet_js_id_seq', 1, false);


--
-- Data for Name: mjscartonvalue; Type: TABLE DATA; Schema: pnd_bk23apr2014; Owner: pnd
--

COPY mjscartonvalue (caval_id, caval_value, carval_carcode) FROM stdin;
\.


--
-- Name: mjscartonvalue_caval_id_seq; Type: SEQUENCE SET; Schema: pnd_bk23apr2014; Owner: pnd
--

SELECT pg_catalog.setval('mjscartonvalue_caval_id_seq', 1, false);


--
-- Data for Name: pndaddress; Type: TABLE DATA; Schema: pnd_bk23apr2014; Owner: pnd
--

COPY pndaddress (ad_id, ad_refid, ad_reftype, ad_order, ad_type, ad_addr_line1, ad_addr_line2, ad_addr_line3, ad_addr_line4, ad_addr_line5, ad_postcode, ad_city, ad_state, ad_concode, ad_remark, ad_status) FROM stdin;
\.


--
-- Name: pndaddress_ad_id_seq; Type: SEQUENCE SET; Schema: pnd_bk23apr2014; Owner: pnd
--

SELECT pg_catalog.setval('pndaddress_ad_id_seq', 1, false);


--
-- Data for Name: pndartistskill; Type: TABLE DATA; Schema: pnd_bk23apr2014; Owner: pnd
--

COPY pndartistskill (as_userid, as_skill) FROM stdin;
\.


--
-- Data for Name: pndcontact; Type: TABLE DATA; Schema: pnd_bk23apr2014; Owner: pnd
--

COPY pndcontact (ct_id, ct_refid, ct_reftype, ct_name, ct_email) FROM stdin;
\.


--
-- Name: pndcontact_ct_id_seq; Type: SEQUENCE SET; Schema: pnd_bk23apr2014; Owner: pnd
--

SELECT pg_catalog.setval('pndcontact_ct_id_seq', 1, false);


--
-- Data for Name: pndphone; Type: TABLE DATA; Schema: pnd_bk23apr2014; Owner: pnd
--

COPY pndphone (ph_id, ph_refid, ph_reftype, ph_order, ph_type, ph_number, ph_extension, ph_remark, ph_status) FROM stdin;
\.


--
-- Name: pndphone_ph_id_seq; Type: SEQUENCE SET; Schema: pnd_bk23apr2014; Owner: pnd
--

SELECT pg_catalog.setval('pndphone_ph_id_seq', 1, false);


SET search_path = pnd, pg_catalog;

--
-- Name: const_fcdoc_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcdoc
    ADD CONSTRAINT const_fcdoc_prikey PRIMARY KEY (fd_id);


--
-- Name: const_fclang_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fclang
    ADD CONSTRAINT const_fclang_prikey PRIMARY KEY (lang_code);


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
-- Name: const_fcpmcaseflow_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcpmcaseflow
    ADD CONSTRAINT const_fcpmcaseflow_prikey PRIMARY KEY (pmf_id);


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
-- Name: const_mforecast_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY mforecast
    ADD CONSTRAINT const_mforecast_prikey PRIMARY KEY (ft_id);


--
-- Name: const_mjobcat_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY mjobcat
    ADD CONSTRAINT const_mjobcat_prikey PRIMARY KEY (jc_id);


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
-- Name: const_pndcontact_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY pndcontact
    ADD CONSTRAINT const_pndcontact_prikey PRIMARY KEY (ct_id);


--
-- Name: const_tmp_customersalesreport_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY tmp_customersalesbycategory
    ADD CONSTRAINT const_tmp_customersalesreport_prikey PRIMARY KEY (tmp_customername);


--
-- Name: const_tmp_dailysalereport_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY tmp_dailysalereport
    ADD CONSTRAINT const_tmp_dailysalereport_prikey PRIMARY KEY (tmp_date);


--
-- Name: const_tmp_jobstatusreport_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY tmp_jobstatusreport
    ADD CONSTRAINT const_tmp_jobstatusreport_prikey PRIMARY KEY (tmp_jsid);


--
-- Name: const_tmp_monthsalesbycategory_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY tmp_monthsalesbycategory
    ADD CONSTRAINT const_tmp_monthsalesbycategory_prikey PRIMARY KEY (tmp_cateogry);


--
-- Name: const_tmp_monthsalesbycustomer_prikey; Type: CONSTRAINT; Schema: pnd; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY tmp_monthsalesbycustomer
    ADD CONSTRAINT const_tmp_monthsalesbycustomer_prikey PRIMARY KEY (tmp_customername);


--
-- Name: const_vmenu_prikey; Type: CONSTRAINT; Schema: pnd; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY fcmenu
    ADD CONSTRAINT const_vmenu_prikey PRIMARY KEY (mn_id);


--
-- Name: const_vmenu_unikey; Type: CONSTRAINT; Schema: pnd; Owner: shine; Tablespace: 
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


SET search_path = pnd_bk23apr2014, pg_catalog;

--
-- Name: const_fclog_prikey; Type: CONSTRAINT; Schema: pnd_bk23apr2014; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY fclog
    ADD CONSTRAINT const_fclog_prikey PRIMARY KEY (log_id);


--
-- Name: const_fcpmcaseflow_prikey; Type: CONSTRAINT; Schema: pnd_bk23apr2014; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY fcpmcaseflow
    ADD CONSTRAINT const_fcpmcaseflow_prikey PRIMARY KEY (f_id);


--
-- Name: const_fcpmcasetype_prikey; Type: CONSTRAINT; Schema: pnd_bk23apr2014; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY fcpmcasetype
    ADD CONSTRAINT const_fcpmcasetype_prikey PRIMARY KEY (ct_code);


--
-- Name: const_fcpmoperation_prikey; Type: CONSTRAINT; Schema: pnd_bk23apr2014; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY fcpmoperation
    ADD CONSTRAINT const_fcpmoperation_prikey PRIMARY KEY (op_id);


--
-- Name: const_fcpmoperationtype_prikey; Type: CONSTRAINT; Schema: pnd_bk23apr2014; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY fcpmoperationtype
    ADD CONSTRAINT const_fcpmoperationtype_prikey PRIMARY KEY (opt_code);


--
-- Name: const_fcpmworkflow_prikey; Type: CONSTRAINT; Schema: pnd_bk23apr2014; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY fcpmworkflow
    ADD CONSTRAINT const_fcpmworkflow_prikey PRIMARY KEY (wf_id);


--
-- Name: const_fcrule_prikey; Type: CONSTRAINT; Schema: pnd_bk23apr2014; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY fcrule
    ADD CONSTRAINT const_fcrule_prikey PRIMARY KEY (ru_id);


--
-- Name: const_fcudv_prikey; Type: CONSTRAINT; Schema: pnd_bk23apr2014; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY fcudv
    ADD CONSTRAINT const_fcudv_prikey PRIMARY KEY (udv_code);


--
-- Name: const_fcuserdiary_prikey; Type: CONSTRAINT; Schema: pnd_bk23apr2014; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY fcuserdiary
    ADD CONSTRAINT const_fcuserdiary_prikey PRIMARY KEY (di_id);


--
-- Name: const_hlookup_prikey; Type: CONSTRAINT; Schema: pnd_bk23apr2014; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY fclookup
    ADD CONSTRAINT const_hlookup_prikey PRIMARY KEY (lu_id);


--
-- Name: const_hlookup_unikey; Type: CONSTRAINT; Schema: pnd_bk23apr2014; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY fclookup
    ADD CONSTRAINT const_hlookup_unikey UNIQUE (lu_cat, lu_code);


--
-- Name: const_mcarton_prikey; Type: CONSTRAINT; Schema: pnd_bk23apr2014; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY mcarton
    ADD CONSTRAINT const_mcarton_prikey PRIMARY KEY (car_id);


--
-- Name: const_mjscartonvalue_prikey; Type: CONSTRAINT; Schema: pnd_bk23apr2014; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY mjscartonvalue
    ADD CONSTRAINT const_mjscartonvalue_prikey PRIMARY KEY (caval_id);


--
-- Name: const_vlang_prikey; Type: CONSTRAINT; Schema: pnd_bk23apr2014; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY fclang
    ADD CONSTRAINT const_vlang_prikey PRIMARY KEY (lang_id);


--
-- Name: const_vlang_unikey; Type: CONSTRAINT; Schema: pnd_bk23apr2014; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY fclang
    ADD CONSTRAINT const_vlang_unikey UNIQUE (lang_code);


--
-- Name: const_vmenu_prikey; Type: CONSTRAINT; Schema: pnd_bk23apr2014; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY fcmenu
    ADD CONSTRAINT const_vmenu_prikey PRIMARY KEY (mn_id);


--
-- Name: const_vmenu_unikey; Type: CONSTRAINT; Schema: pnd_bk23apr2014; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY fcmenu
    ADD CONSTRAINT const_vmenu_unikey UNIQUE (mn_code);


--
-- Name: const_vorg_prikey; Type: CONSTRAINT; Schema: pnd_bk23apr2014; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY fcorg
    ADD CONSTRAINT const_vorg_prikey PRIMARY KEY (org_id);


--
-- Name: const_vpermission_prikey; Type: CONSTRAINT; Schema: pnd_bk23apr2014; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY fcpermission
    ADD CONSTRAINT const_vpermission_prikey PRIMARY KEY (pms_id);


--
-- Name: const_vpermission_unikey; Type: CONSTRAINT; Schema: pnd_bk23apr2014; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY fcpermission
    ADD CONSTRAINT const_vpermission_unikey UNIQUE (pms_code);


--
-- Name: const_vrole_prikey; Type: CONSTRAINT; Schema: pnd_bk23apr2014; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY fcrole
    ADD CONSTRAINT const_vrole_prikey PRIMARY KEY (rol_id);


--
-- Name: const_vrole_unikey; Type: CONSTRAINT; Schema: pnd_bk23apr2014; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY fcrole
    ADD CONSTRAINT const_vrole_unikey UNIQUE (rol_code);


--
-- Name: const_vroleperm_prikey; Type: CONSTRAINT; Schema: pnd_bk23apr2014; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY fcroleperm
    ADD CONSTRAINT const_vroleperm_prikey PRIMARY KEY (rp_id);


--
-- Name: const_vroleperm_unikey; Type: CONSTRAINT; Schema: pnd_bk23apr2014; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY fcroleperm
    ADD CONSTRAINT const_vroleperm_unikey UNIQUE (rp_rolid, rp_pmsid);


--
-- Name: const_vsetting_prikey; Type: CONSTRAINT; Schema: pnd_bk23apr2014; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY fcsetting
    ADD CONSTRAINT const_vsetting_prikey PRIMARY KEY (set_id);


--
-- Name: const_vsetting_unikey; Type: CONSTRAINT; Schema: pnd_bk23apr2014; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY fcsetting
    ADD CONSTRAINT const_vsetting_unikey UNIQUE (set_user, set_code);


--
-- Name: const_vuser_prikey; Type: CONSTRAINT; Schema: pnd_bk23apr2014; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY fcuser
    ADD CONSTRAINT const_vuser_prikey PRIMARY KEY (usr_userid);


--
-- Name: const_vuserlogin_prikey; Type: CONSTRAINT; Schema: pnd_bk23apr2014; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY fcuserlogin
    ADD CONSTRAINT const_vuserlogin_prikey PRIMARY KEY (ul_id);


--
-- Name: const_vuserorgrole_prikey; Type: CONSTRAINT; Schema: pnd_bk23apr2014; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY fcuserorgrole
    ADD CONSTRAINT const_vuserorgrole_prikey PRIMARY KEY (uor_id);


--
-- Name: const_vuserorgrole_unikey; Type: CONSTRAINT; Schema: pnd_bk23apr2014; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY fcuserorgrole
    ADD CONSTRAINT const_vuserorgrole_unikey UNIQUE (uor_usrid, uor_orgid, uor_rolid);


--
-- Name: const_vusersession_prikey; Type: CONSTRAINT; Schema: pnd_bk23apr2014; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY fcusersession
    ADD CONSTRAINT const_vusersession_prikey PRIMARY KEY (us_id);


--
-- Name: cont_mjobcatlookup_prikey; Type: CONSTRAINT; Schema: pnd_bk23apr2014; Owner: pnd; Tablespace: 
--

ALTER TABLE ONLY mjobcatlookup
    ADD CONSTRAINT cont_mjobcatlookup_prikey PRIMARY KEY (jcl_id);


--
-- Name: country_prikey; Type: CONSTRAINT; Schema: pnd_bk23apr2014; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY fccountry
    ADD CONSTRAINT country_prikey PRIMARY KEY (con_code);


SET search_path = pnd, pg_catalog;

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


SET search_path = pnd_bk23apr2014, pg_catalog;

--
-- Name: idx_vsetting_code_user; Type: INDEX; Schema: pnd_bk23apr2014; Owner: shine; Tablespace: 
--

CREATE UNIQUE INDEX idx_vsetting_code_user ON fcsetting USING btree (set_user, set_code);


--
-- Name: usersession_idx1; Type: INDEX; Schema: pnd_bk23apr2014; Owner: shine; Tablespace: 
--

CREATE INDEX usersession_idx1 ON fcusersession USING btree (us_sessid);


--
-- Name: usersession_idx2; Type: INDEX; Schema: pnd_bk23apr2014; Owner: shine; Tablespace: 
--

CREATE INDEX usersession_idx2 ON fcusersession USING btree (us_userid);


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

