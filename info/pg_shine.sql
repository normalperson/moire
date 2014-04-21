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
-- Name: shine; Type: SCHEMA; Schema: -; Owner: shine
--

CREATE SCHEMA shine;


ALTER SCHEMA shine OWNER TO shine;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = shine, pg_catalog;

--
-- Name: cleanup(); Type: FUNCTION; Schema: shine; Owner: shine
--

CREATE FUNCTION cleanup() RETURNS void
    LANGUAGE plpgsql
    AS $$

BEGIN

  delete from fcpmcaseflow;  


END;



$$;


ALTER FUNCTION shine.cleanup() OWNER TO shine;

--
-- Name: generateanswer(); Type: FUNCTION; Schema: shine; Owner: shine
--

CREATE FUNCTION generateanswer() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE RQUESTION RECORD;
DECLARE RANSWER RECORD;
BEGIN
    FOR RQUESTION IN SELECT * FROM shtsatquestion where tsq_id != 1 LOOP
	FOR RANSWER IN SELECT * FROM shtsatanswer WHERE TSA_TSQID = 1 LOOP
		INSERT INTO shtsatanswer(
			    tsa_tsqid, tsa_order, tsa_answer, tsa_point)
		SELECT RQUESTION.TSQ_ID,TSA_ORDER,TSA_ANSWER,TSA_POINT
		FROM shtsatanswer   WHERE TSA_ID = RANSWER.TSA_ID;    
	END LOOP;
    END LOOP;	
 
END;

$$;


ALTER FUNCTION shine.generateanswer() OWNER TO shine;

--
-- Name: generatedata(); Type: FUNCTION; Schema: shine; Owner: shine
--

CREATE FUNCTION generatedata() RETURNS void
    LANGUAGE plpgsql
    AS $$

BEGIN

delete from fcuserlogin where ul_userid = 'harry';

-- delete first attempt tsat answer by harry
delete from shtsatresult where tsr_usrid = 'harry';

delete from fcuserdiary
where di_userid = 'hermione';

delete from shreflection
where rfl_usrid = 'harry';

delete from shactivitypart
where atpt_usrid = 'harry';

-- remove TSAT 2nd attempt by hermonie
delete from shtsatresult
where tsr_usrid = 'hermione'
and tsr_attempt = 2;


-- delete package and activity and event
delete from shpackage
where pk_name = 'Impactful interview';

end;

$$;


ALTER FUNCTION shine.generatedata() OWNER TO shine;

--
-- Name: resetfcsetting(); Type: FUNCTION; Schema: shine; Owner: shine
--

CREATE FUNCTION resetfcsetting() RETURNS void
    LANGUAGE plpgsql
    AS $$



  DECLARE  



BEGIN



    update fcsetting set set_val = 15 where set_code = 'MAXLIFETIME';



    update fcsetting set set_val = 'skyblue', set_description = 'Skyblue' where set_code = 'THEME';



    update fcsetting set set_val = 'EN-US', set_description = 'English - United States' where set_code = 'LANG';



END;







$$;


ALTER FUNCTION shine.resetfcsetting() OWNER TO shine;

--
-- Name: update_journalno(); Type: FUNCTION; Schema: shine; Owner: shine
--

CREATE FUNCTION update_journalno() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  BEGIN

  if (new.aj_journalno is null ) then
	new.aj_journalno = ( select currval('acjournal_aj_id_seq') );
  end if;
	return NEW;
  END;
 
$$;


ALTER FUNCTION shine.update_journalno() OWNER TO shine;

--
-- Name: caseapplicationid; Type: SEQUENCE; Schema: shine; Owner: shine
--

CREATE SEQUENCE caseapplicationid
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999
    CACHE 1;


ALTER TABLE shine.caseapplicationid OWNER TO shine;

--
-- Name: emp_application_id; Type: SEQUENCE; Schema: shine; Owner: shine
--

CREATE SEQUENCE emp_application_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999999
    CACHE 1;


ALTER TABLE shine.emp_application_id OWNER TO shine;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: fccountry; Type: TABLE; Schema: shine; Owner: shine; Tablespace: 
--

CREATE TABLE fccountry (
    con_code character varying(24) NOT NULL,
    con_name character varying(1000),
    last_modified_date timestamp with time zone DEFAULT now(),
    last_synchronized_date timestamp with time zone,
    record_synchronized character varying(1) DEFAULT 'N'::character varying,
    cloud_refid integer
);


ALTER TABLE shine.fccountry OWNER TO shine;

--
-- Name: fclang; Type: TABLE; Schema: shine; Owner: shine; Tablespace: 
--

CREATE TABLE fclang (
    lang_id integer NOT NULL,
    lang_code character varying(5),
    lang_name character varying(200),
    lang_status character varying(12) DEFAULT 'ACTIVE'::character varying
);


ALTER TABLE shine.fclang OWNER TO shine;

--
-- Name: fclang_lang_id_seq; Type: SEQUENCE; Schema: shine; Owner: shine
--

CREATE SEQUENCE fclang_lang_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shine.fclang_lang_id_seq OWNER TO shine;

--
-- Name: fclang_lang_id_seq; Type: SEQUENCE OWNED BY; Schema: shine; Owner: shine
--

ALTER SEQUENCE fclang_lang_id_seq OWNED BY fclang.lang_id;


--
-- Name: fclog; Type: TABLE; Schema: shine; Owner: shine; Tablespace: 
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


ALTER TABLE shine.fclog OWNER TO shine;

--
-- Name: fclog_log_id_seq; Type: SEQUENCE; Schema: shine; Owner: shine
--

CREATE SEQUENCE fclog_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shine.fclog_log_id_seq OWNER TO shine;

--
-- Name: fclog_log_id_seq; Type: SEQUENCE OWNED BY; Schema: shine; Owner: shine
--

ALTER SEQUENCE fclog_log_id_seq OWNED BY fclog.log_id;


--
-- Name: fclookup; Type: TABLE; Schema: shine; Owner: shine; Tablespace: 
--

CREATE TABLE fclookup (
    lu_cat character varying(12) NOT NULL,
    lu_code character varying(50) NOT NULL,
    lu_parentcode character varying(12) DEFAULT 'ROOT'::character varying NOT NULL,
    lu_title character varying(50),
    lu_status character varying(12) DEFAULT 'ACTIVE'::character varying,
    lu_id integer NOT NULL
);


ALTER TABLE shine.fclookup OWNER TO shine;

--
-- Name: fclookup_lu_id_seq; Type: SEQUENCE; Schema: shine; Owner: shine
--

CREATE SEQUENCE fclookup_lu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shine.fclookup_lu_id_seq OWNER TO shine;

--
-- Name: fclookup_lu_id_seq; Type: SEQUENCE OWNED BY; Schema: shine; Owner: shine
--

ALTER SEQUENCE fclookup_lu_id_seq OWNED BY fclookup.lu_id;


--
-- Name: fcmenu; Type: TABLE; Schema: shine; Owner: shine; Tablespace: 
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


ALTER TABLE shine.fcmenu OWNER TO shine;

--
-- Name: fcmenu_mn_id_seq; Type: SEQUENCE; Schema: shine; Owner: shine
--

CREATE SEQUENCE fcmenu_mn_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shine.fcmenu_mn_id_seq OWNER TO shine;

--
-- Name: fcmenu_mn_id_seq; Type: SEQUENCE OWNED BY; Schema: shine; Owner: shine
--

ALTER SEQUENCE fcmenu_mn_id_seq OWNED BY fcmenu.mn_id;


--
-- Name: fcmenu_mn_parentid_seq; Type: SEQUENCE; Schema: shine; Owner: shine
--

CREATE SEQUENCE fcmenu_mn_parentid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shine.fcmenu_mn_parentid_seq OWNER TO shine;

--
-- Name: fcmenu_mn_parentid_seq; Type: SEQUENCE OWNED BY; Schema: shine; Owner: shine
--

ALTER SEQUENCE fcmenu_mn_parentid_seq OWNED BY fcmenu.mn_parentid;


--
-- Name: fcorg; Type: TABLE; Schema: shine; Owner: shine; Tablespace: 
--

CREATE TABLE fcorg (
    org_id integer NOT NULL,
    org_code character varying(50),
    org_name character varying(2000),
    org_parentid integer DEFAULT 0,
    org_primaryid character varying(200),
    org_address character varying(4000),
    org_contactno character varying(100),
    org_status character varying(12) DEFAULT 'ACTIVE'::character varying
);


ALTER TABLE shine.fcorg OWNER TO shine;

--
-- Name: fcorg_org_id_seq; Type: SEQUENCE; Schema: shine; Owner: shine
--

CREATE SEQUENCE fcorg_org_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shine.fcorg_org_id_seq OWNER TO shine;

--
-- Name: fcorg_org_id_seq; Type: SEQUENCE OWNED BY; Schema: shine; Owner: shine
--

ALTER SEQUENCE fcorg_org_id_seq OWNED BY fcorg.org_id;


--
-- Name: fcpermission; Type: TABLE; Schema: shine; Owner: shine; Tablespace: 
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


ALTER TABLE shine.fcpermission OWNER TO shine;

--
-- Name: fcpermission_pms_id_seq; Type: SEQUENCE; Schema: shine; Owner: shine
--

CREATE SEQUENCE fcpermission_pms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shine.fcpermission_pms_id_seq OWNER TO shine;

--
-- Name: fcpermission_pms_id_seq; Type: SEQUENCE OWNED BY; Schema: shine; Owner: shine
--

ALTER SEQUENCE fcpermission_pms_id_seq OWNED BY fcpermission.pms_id;


--
-- Name: fcpmcaseflow; Type: TABLE; Schema: shine; Owner: shine; Tablespace: 
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


ALTER TABLE shine.fcpmcaseflow OWNER TO shine;

--
-- Name: fcpmcaseflow_f_id_seq; Type: SEQUENCE; Schema: shine; Owner: shine
--

CREATE SEQUENCE fcpmcaseflow_f_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shine.fcpmcaseflow_f_id_seq OWNER TO shine;

--
-- Name: fcpmcaseflow_f_id_seq; Type: SEQUENCE OWNED BY; Schema: shine; Owner: shine
--

ALTER SEQUENCE fcpmcaseflow_f_id_seq OWNED BY fcpmcaseflow.f_id;


--
-- Name: fcpmcasetype; Type: TABLE; Schema: shine; Owner: shine; Tablespace: 
--

CREATE TABLE fcpmcasetype (
    ct_code character varying(32) NOT NULL,
    ct_desc character varying(100),
    ct_table character varying(100),
    ct_desc_col character varying(100),
    ct_key_col character varying(100)
);


ALTER TABLE shine.fcpmcasetype OWNER TO shine;

--
-- Name: fcpmoperation; Type: TABLE; Schema: shine; Owner: shine; Tablespace: 
--

CREATE TABLE fcpmoperation (
    op_id integer NOT NULL,
    op_parentid integer,
    op_wfid integer,
    op_name character varying(100),
    op_type character varying(16),
    op_x integer,
    op_y integer,
    op_next_opid1 integer,
    op_escalate_opid integer,
    op_userrole character varying(2000),
    op_task_func character varying(100),
    op_pmscode character varying(50),
    op_next_opid2 integer,
    op_next_opid3 integer
);


ALTER TABLE shine.fcpmoperation OWNER TO shine;

--
-- Name: fcpmoperation_op_id_seq; Type: SEQUENCE; Schema: shine; Owner: shine
--

CREATE SEQUENCE fcpmoperation_op_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shine.fcpmoperation_op_id_seq OWNER TO shine;

--
-- Name: fcpmoperation_op_id_seq; Type: SEQUENCE OWNED BY; Schema: shine; Owner: shine
--

ALTER SEQUENCE fcpmoperation_op_id_seq OWNED BY fcpmoperation.op_id;


--
-- Name: fcpmoperationtype; Type: TABLE; Schema: shine; Owner: shine; Tablespace: 
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


ALTER TABLE shine.fcpmoperationtype OWNER TO shine;

--
-- Name: fcpmworkflow; Type: TABLE; Schema: shine; Owner: shine; Tablespace: 
--

CREATE TABLE fcpmworkflow (
    wf_id integer NOT NULL,
    wf_name character varying(100),
    wf_seq integer,
    wf_userrole character varying(2000),
    wf_status character varying(50) DEFAULT 'ACTIVE'::character varying
);


ALTER TABLE shine.fcpmworkflow OWNER TO shine;

--
-- Name: fcpmworkflow_wf_id_seq; Type: SEQUENCE; Schema: shine; Owner: shine
--

CREATE SEQUENCE fcpmworkflow_wf_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shine.fcpmworkflow_wf_id_seq OWNER TO shine;

--
-- Name: fcpmworkflow_wf_id_seq; Type: SEQUENCE OWNED BY; Schema: shine; Owner: shine
--

ALTER SEQUENCE fcpmworkflow_wf_id_seq OWNED BY fcpmworkflow.wf_id;


--
-- Name: fcrole; Type: TABLE; Schema: shine; Owner: shine; Tablespace: 
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


ALTER TABLE shine.fcrole OWNER TO shine;

--
-- Name: fcrole_rol_id_seq; Type: SEQUENCE; Schema: shine; Owner: shine
--

CREATE SEQUENCE fcrole_rol_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shine.fcrole_rol_id_seq OWNER TO shine;

--
-- Name: fcrole_rol_id_seq; Type: SEQUENCE OWNED BY; Schema: shine; Owner: shine
--

ALTER SEQUENCE fcrole_rol_id_seq OWNED BY fcrole.rol_id;


--
-- Name: fcroleperm; Type: TABLE; Schema: shine; Owner: shine; Tablespace: 
--

CREATE TABLE fcroleperm (
    rp_id integer NOT NULL,
    rp_rolid integer,
    rp_pmsid integer
);


ALTER TABLE shine.fcroleperm OWNER TO shine;

--
-- Name: fcroleperm_rp_id_seq; Type: SEQUENCE; Schema: shine; Owner: shine
--

CREATE SEQUENCE fcroleperm_rp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shine.fcroleperm_rp_id_seq OWNER TO shine;

--
-- Name: fcroleperm_rp_id_seq; Type: SEQUENCE OWNED BY; Schema: shine; Owner: shine
--

ALTER SEQUENCE fcroleperm_rp_id_seq OWNED BY fcroleperm.rp_id;


--
-- Name: fcrule; Type: TABLE; Schema: shine; Owner: shine; Tablespace: 
--

CREATE TABLE fcrule (
    ru_id integer NOT NULL,
    ru_name character varying(100),
    ru_true_msg character varying(200),
    ru_false_msg character varying(200),
    ru_data character varying(4000)
);


ALTER TABLE shine.fcrule OWNER TO shine;

--
-- Name: fcrule_ru_id_seq; Type: SEQUENCE; Schema: shine; Owner: shine
--

CREATE SEQUENCE fcrule_ru_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shine.fcrule_ru_id_seq OWNER TO shine;

--
-- Name: fcrule_ru_id_seq; Type: SEQUENCE OWNED BY; Schema: shine; Owner: shine
--

ALTER SEQUENCE fcrule_ru_id_seq OWNED BY fcrule.ru_id;


--
-- Name: fcsetting; Type: TABLE; Schema: shine; Owner: shine; Tablespace: 
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


ALTER TABLE shine.fcsetting OWNER TO shine;

--
-- Name: COLUMN fcsetting.set_id; Type: COMMENT; Schema: shine; Owner: shine
--

COMMENT ON COLUMN fcsetting.set_id IS 'setting id';


--
-- Name: COLUMN fcsetting.set_description; Type: COMMENT; Schema: shine; Owner: shine
--

COMMENT ON COLUMN fcsetting.set_description IS 'setting description';


--
-- Name: COLUMN fcsetting.set_val; Type: COMMENT; Schema: shine; Owner: shine
--

COMMENT ON COLUMN fcsetting.set_val IS 'setting value';


--
-- Name: fcsetting_set_id_seq; Type: SEQUENCE; Schema: shine; Owner: shine
--

CREATE SEQUENCE fcsetting_set_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shine.fcsetting_set_id_seq OWNER TO shine;

--
-- Name: fcsetting_set_id_seq; Type: SEQUENCE OWNED BY; Schema: shine; Owner: shine
--

ALTER SEQUENCE fcsetting_set_id_seq OWNED BY fcsetting.set_id;


--
-- Name: fcudv; Type: TABLE; Schema: shine; Owner: shine; Tablespace: 
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


ALTER TABLE shine.fcudv OWNER TO shine;

--
-- Name: fcuser; Type: TABLE; Schema: shine; Owner: shine; Tablespace: 
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


ALTER TABLE shine.fcuser OWNER TO shine;

--
-- Name: fcuserdiary; Type: TABLE; Schema: shine; Owner: shine; Tablespace: 
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
    di_status character varying(50) DEFAULT 'ACTIVE'::character varying,
    di_display_date timestamp with time zone DEFAULT now()
);


ALTER TABLE shine.fcuserdiary OWNER TO shine;

--
-- Name: fcuserdiary_di_id_seq; Type: SEQUENCE; Schema: shine; Owner: shine
--

CREATE SEQUENCE fcuserdiary_di_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shine.fcuserdiary_di_id_seq OWNER TO shine;

--
-- Name: fcuserdiary_di_id_seq; Type: SEQUENCE OWNED BY; Schema: shine; Owner: shine
--

ALTER SEQUENCE fcuserdiary_di_id_seq OWNED BY fcuserdiary.di_id;


--
-- Name: fcuserlogin; Type: TABLE; Schema: shine; Owner: shine; Tablespace: 
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


ALTER TABLE shine.fcuserlogin OWNER TO shine;

--
-- Name: fcuserlogin_ul_id_seq; Type: SEQUENCE; Schema: shine; Owner: shine
--

CREATE SEQUENCE fcuserlogin_ul_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shine.fcuserlogin_ul_id_seq OWNER TO shine;

--
-- Name: fcuserlogin_ul_id_seq; Type: SEQUENCE OWNED BY; Schema: shine; Owner: shine
--

ALTER SEQUENCE fcuserlogin_ul_id_seq OWNED BY fcuserlogin.ul_id;


--
-- Name: fcuserorgrole; Type: TABLE; Schema: shine; Owner: shine; Tablespace: 
--

CREATE TABLE fcuserorgrole (
    uor_id integer NOT NULL,
    uor_usrid character varying(50),
    uor_orgid integer,
    uor_rolid integer,
    uor_seq integer
);


ALTER TABLE shine.fcuserorgrole OWNER TO shine;

--
-- Name: fcuserorgrole_uor_id_seq; Type: SEQUENCE; Schema: shine; Owner: shine
--

CREATE SEQUENCE fcuserorgrole_uor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shine.fcuserorgrole_uor_id_seq OWNER TO shine;

--
-- Name: fcuserorgrole_uor_id_seq; Type: SEQUENCE OWNED BY; Schema: shine; Owner: shine
--

ALTER SEQUENCE fcuserorgrole_uor_id_seq OWNED BY fcuserorgrole.uor_id;


--
-- Name: fcusersession; Type: TABLE; Schema: shine; Owner: shine; Tablespace: 
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


ALTER TABLE shine.fcusersession OWNER TO shine;

--
-- Name: COLUMN fcusersession.us_sessid; Type: COMMENT; Schema: shine; Owner: shine
--

COMMENT ON COLUMN fcusersession.us_sessid IS 'PHP session id';


--
-- Name: fcusersession_us_id_seq; Type: SEQUENCE; Schema: shine; Owner: shine
--

CREATE SEQUENCE fcusersession_us_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shine.fcusersession_us_id_seq OWNER TO shine;

--
-- Name: fcusersession_us_id_seq; Type: SEQUENCE OWNED BY; Schema: shine; Owner: shine
--

ALTER SEQUENCE fcusersession_us_id_seq OWNED BY fcusersession.us_id;


--
-- Name: shpackage; Type: TABLE; Schema: shine; Owner: shine; Tablespace: 
--

CREATE TABLE shpackage (
    pk_id integer NOT NULL,
    pk_type character varying(32),
    pk_parentid integer,
    pk_name character varying(100),
    pk_description text,
    pk_max_point numeric(20,0),
    pk_max_hour numeric(20,0),
    pk_min_point numeric(20,0),
    pk_status character varying(32) DEFAULT 'ACTIVE'::character varying
);


ALTER TABLE shine.shpackage OWNER TO shine;

--
-- Name: shpackage_pk_id_seq; Type: SEQUENCE; Schema: shine; Owner: shine
--

CREATE SEQUENCE shpackage_pk_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shine.shpackage_pk_id_seq OWNER TO shine;

--
-- Name: shpackage_pk_id_seq; Type: SEQUENCE OWNED BY; Schema: shine; Owner: shine
--

ALTER SEQUENCE shpackage_pk_id_seq OWNED BY shpackage.pk_id;


--
-- Name: shactivity; Type: TABLE; Schema: shine; Owner: shine; Tablespace: 
--

CREATE TABLE shactivity (
    atv_id integer DEFAULT nextval('shpackage_pk_id_seq'::regclass) NOT NULL,
    atv_pkid integer,
    atv_name character varying(100),
    atv_description text,
    atv_max_enrolment integer,
    atv_status character varying(32),
    atv_prerequisite_atvid integer
);


ALTER TABLE shine.shactivity OWNER TO shine;

--
-- Name: shactivity_atv_id_seq; Type: SEQUENCE; Schema: shine; Owner: shine
--

CREATE SEQUENCE shactivity_atv_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shine.shactivity_atv_id_seq OWNER TO shine;

--
-- Name: shactivity_atv_id_seq; Type: SEQUENCE OWNED BY; Schema: shine; Owner: shine
--

ALTER SEQUENCE shactivity_atv_id_seq OWNED BY shactivity.atv_id;


--
-- Name: shactivityattend; Type: TABLE; Schema: shine; Owner: shine; Tablespace: 
--

CREATE TABLE shactivityattend (
    atat_id integer NOT NULL,
    atat_atptid integer,
    atat_atsid integer
);


ALTER TABLE shine.shactivityattend OWNER TO shine;

--
-- Name: shactivityattend_atat_id_seq; Type: SEQUENCE; Schema: shine; Owner: shine
--

CREATE SEQUENCE shactivityattend_atat_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shine.shactivityattend_atat_id_seq OWNER TO shine;

--
-- Name: shactivityattend_atat_id_seq; Type: SEQUENCE OWNED BY; Schema: shine; Owner: shine
--

ALTER SEQUENCE shactivityattend_atat_id_seq OWNED BY shactivityattend.atat_id;


--
-- Name: shactivityevent; Type: TABLE; Schema: shine; Owner: shine; Tablespace: 
--

CREATE TABLE shactivityevent (
    atve_id integer NOT NULL,
    atve_atvid integer,
    atve_created_date timestamp with time zone DEFAULT now(),
    atve_register_start timestamp with time zone,
    atve_register_end timestamp with time zone,
    atve_max_participant integer,
    atve_withdraw_before_day integer,
    atve_fee numeric(20,4),
    atve_facilitator_id character varying(200),
    atve_provider character varying(200),
    atve_publish_date timestamp with time zone,
    atve_class character varying(50)
);


ALTER TABLE shine.shactivityevent OWNER TO shine;

--
-- Name: shactivityevent_atve_id_seq; Type: SEQUENCE; Schema: shine; Owner: shine
--

CREATE SEQUENCE shactivityevent_atve_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shine.shactivityevent_atve_id_seq OWNER TO shine;

--
-- Name: shactivityevent_atve_id_seq; Type: SEQUENCE OWNED BY; Schema: shine; Owner: shine
--

ALTER SEQUENCE shactivityevent_atve_id_seq OWNED BY shactivityevent.atve_id;


--
-- Name: shactivitypart; Type: TABLE; Schema: shine; Owner: shine; Tablespace: 
--

CREATE TABLE shactivitypart (
    atpt_id integer NOT NULL,
    atpt_atveid integer,
    atpt_usrid character varying(100),
    atpt_created_date timestamp with time zone DEFAULT now(),
    atpt_status character varying(32),
    atpt_status_date timestamp with time zone DEFAULT now(),
    atpt_status_by character varying(100),
    atpt_role_atpid integer
);


ALTER TABLE shine.shactivitypart OWNER TO shine;

--
-- Name: shactivitypart_atpt_id_seq; Type: SEQUENCE; Schema: shine; Owner: shine
--

CREATE SEQUENCE shactivitypart_atpt_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shine.shactivitypart_atpt_id_seq OWNER TO shine;

--
-- Name: shactivitypart_atpt_id_seq; Type: SEQUENCE OWNED BY; Schema: shine; Owner: shine
--

ALTER SEQUENCE shactivitypart_atpt_id_seq OWNED BY shactivitypart.atpt_id;


--
-- Name: shactivitypoint; Type: TABLE; Schema: shine; Owner: shine; Tablespace: 
--

CREATE TABLE shactivitypoint (
    atp_id integer NOT NULL,
    atp_atvid integer,
    atp_type character varying(32),
    atp_item character varying(100),
    atp_point numeric(20,0)
);


ALTER TABLE shine.shactivitypoint OWNER TO shine;

--
-- Name: shactivitypoint_atp_id_seq; Type: SEQUENCE; Schema: shine; Owner: shine
--

CREATE SEQUENCE shactivitypoint_atp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shine.shactivitypoint_atp_id_seq OWNER TO shine;

--
-- Name: shactivitypoint_atp_id_seq; Type: SEQUENCE OWNED BY; Schema: shine; Owner: shine
--

ALTER SEQUENCE shactivitypoint_atp_id_seq OWNED BY shactivitypoint.atp_id;


--
-- Name: shactivityschedule; Type: TABLE; Schema: shine; Owner: shine; Tablespace: 
--

CREATE TABLE shactivityschedule (
    ats_id integer NOT NULL,
    ats_atveid_ahaid integer,
    ats_vnid integer,
    ats_start timestamp with time zone,
    ats_end timestamp with time zone
);


ALTER TABLE shine.shactivityschedule OWNER TO shine;

--
-- Name: shactivityschedule_ats_id_seq; Type: SEQUENCE; Schema: shine; Owner: shine
--

CREATE SEQUENCE shactivityschedule_ats_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shine.shactivityschedule_ats_id_seq OWNER TO shine;

--
-- Name: shactivityschedule_ats_id_seq; Type: SEQUENCE OWNED BY; Schema: shine; Owner: shine
--

ALTER SEQUENCE shactivityschedule_ats_id_seq OWNED BY shactivityschedule.ats_id;


--
-- Name: shadhocactivity; Type: TABLE; Schema: shine; Owner: shine; Tablespace: 
--

CREATE TABLE shadhocactivity (
    aha_id integer DEFAULT nextval('shactivityevent_atve_id_seq'::regclass) NOT NULL,
    aha_usrid character varying(100),
    aha_created_date timestamp with time zone DEFAULT now(),
    aha_name character varying(100),
    aha_description text,
    aha_status character varying(100),
    aha_status_date timestamp with time zone DEFAULT now(),
    aha_status_by character varying(100),
    aha_point numeric(20,0),
    aha_remark character varying(500)
);


ALTER TABLE shine.shadhocactivity OWNER TO shine;

--
-- Name: shadhocactivity_aha_id_seq; Type: SEQUENCE; Schema: shine; Owner: shine
--

CREATE SEQUENCE shadhocactivity_aha_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shine.shadhocactivity_aha_id_seq OWNER TO shine;

--
-- Name: shadhocactivity_aha_id_seq; Type: SEQUENCE OWNED BY; Schema: shine; Owner: shine
--

ALTER SEQUENCE shadhocactivity_aha_id_seq OWNED BY shadhocactivity.aha_id;


--
-- Name: shatutorialsetup; Type: TABLE; Schema: shine; Owner: shine; Tablespace: 
--

CREATE TABLE shatutorialsetup (
    tut_id integer NOT NULL,
    tut_title character varying(100),
    tut_imagepath character varying(100),
    tut_label character varying(4000),
    tut_seq integer
);


ALTER TABLE shine.shatutorialsetup OWNER TO shine;

--
-- Name: shatutorialsetup_tut_id_seq; Type: SEQUENCE; Schema: shine; Owner: shine
--

CREATE SEQUENCE shatutorialsetup_tut_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shine.shatutorialsetup_tut_id_seq OWNER TO shine;

--
-- Name: shatutorialsetup_tut_id_seq; Type: SEQUENCE OWNED BY; Schema: shine; Owner: shine
--

ALTER SEQUENCE shatutorialsetup_tut_id_seq OWNED BY shatutorialsetup.tut_id;


--
-- Name: shaward; Type: TABLE; Schema: shine; Owner: shine; Tablespace: 
--

CREATE TABLE shaward (
    aw_id integer NOT NULL,
    aw_cat character varying(100),
    aw_rank integer,
    aw_name character varying(100),
    aw_min_total_point numeric(20,0)
);


ALTER TABLE shine.shaward OWNER TO shine;

--
-- Name: shaward_aw_id_seq; Type: SEQUENCE; Schema: shine; Owner: shine
--

CREATE SEQUENCE shaward_aw_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shine.shaward_aw_id_seq OWNER TO shine;

--
-- Name: shaward_aw_id_seq; Type: SEQUENCE OWNED BY; Schema: shine; Owner: shine
--

ALTER SEQUENCE shaward_aw_id_seq OWNED BY shaward.aw_id;


--
-- Name: shawardpoint; Type: TABLE; Schema: shine; Owner: shine; Tablespace: 
--

CREATE TABLE shawardpoint (
    awp_id integer NOT NULL,
    awp_awid integer,
    awp_type character varying(32),
    awp_pkid_atvid integer,
    awp_min_point numeric(20,0)
);


ALTER TABLE shine.shawardpoint OWNER TO shine;

--
-- Name: shawardpoint_awp_id_seq; Type: SEQUENCE; Schema: shine; Owner: shine
--

CREATE SEQUENCE shawardpoint_awp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shine.shawardpoint_awp_id_seq OWNER TO shine;

--
-- Name: shawardpoint_awp_id_seq; Type: SEQUENCE OWNED BY; Schema: shine; Owner: shine
--

ALTER SEQUENCE shawardpoint_awp_id_seq OWNED BY shawardpoint.awp_id;


--
-- Name: shawardwinner; Type: TABLE; Schema: shine; Owner: shine; Tablespace: 
--

CREATE TABLE shawardwinner (
    aww_id integer NOT NULL,
    aww_usrid character varying(100),
    aww_awid integer,
    aww_created_date timestamp with time zone DEFAULT now()
);


ALTER TABLE shine.shawardwinner OWNER TO shine;

--
-- Name: shawardwinner_aww_id_seq; Type: SEQUENCE; Schema: shine; Owner: shine
--

CREATE SEQUENCE shawardwinner_aww_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shine.shawardwinner_aww_id_seq OWNER TO shine;

--
-- Name: shawardwinner_aww_id_seq; Type: SEQUENCE OWNED BY; Schema: shine; Owner: shine
--

ALTER SEQUENCE shawardwinner_aww_id_seq OWNED BY shawardwinner.aww_id;


--
-- Name: shfacilitator; Type: TABLE; Schema: shine; Owner: shine; Tablespace: 
--

CREATE TABLE shfacilitator (
    fac_id integer NOT NULL,
    fac_name character varying(100)
);


ALTER TABLE shine.shfacilitator OWNER TO shine;

--
-- Name: shfacilitator_fac_id_seq; Type: SEQUENCE; Schema: shine; Owner: shine
--

CREATE SEQUENCE shfacilitator_fac_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shine.shfacilitator_fac_id_seq OWNER TO shine;

--
-- Name: shfacilitator_fac_id_seq; Type: SEQUENCE OWNED BY; Schema: shine; Owner: shine
--

ALTER SEQUENCE shfacilitator_fac_id_seq OWNED BY shfacilitator.fac_id;


--
-- Name: shpoint; Type: TABLE; Schema: shine; Owner: shine; Tablespace: 
--

CREATE TABLE shpoint (
    pts_id integer NOT NULL,
    pts_usrid character varying(100),
    pts_created_date timestamp with time zone DEFAULT now(),
    pts_parentid integer,
    pts_reftype character varying(100),
    pts_refid integer,
    pts_desc character varying(500),
    pts_point numeric(20,0)
);


ALTER TABLE shine.shpoint OWNER TO shine;

--
-- Name: shpoint_pts_id_seq; Type: SEQUENCE; Schema: shine; Owner: shine
--

CREATE SEQUENCE shpoint_pts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shine.shpoint_pts_id_seq OWNER TO shine;

--
-- Name: shpoint_pts_id_seq; Type: SEQUENCE OWNED BY; Schema: shine; Owner: shine
--

ALTER SEQUENCE shpoint_pts_id_seq OWNED BY shpoint.pts_id;


--
-- Name: shreflection; Type: TABLE; Schema: shine; Owner: shine; Tablespace: 
--

CREATE TABLE shreflection (
    rfl_id integer NOT NULL,
    rfl_usrid character varying(100),
    rfl_reftype character varying(32),
    rfl_refid integer,
    rfl_subject character varying(2000),
    rfl_content text,
    rfl_status character varying(32),
    rfl_status_date timestamp with time zone DEFAULT now(),
    rfl_status_by character varying(100),
    rfl_remark character varying(500),
    rfl_achievement_atpid integer
);


ALTER TABLE shine.shreflection OWNER TO shine;

--
-- Name: shreflection_rfl_id_seq; Type: SEQUENCE; Schema: shine; Owner: shine
--

CREATE SEQUENCE shreflection_rfl_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shine.shreflection_rfl_id_seq OWNER TO shine;

--
-- Name: shreflection_rfl_id_seq; Type: SEQUENCE OWNED BY; Schema: shine; Owner: shine
--

ALTER SEQUENCE shreflection_rfl_id_seq OWNED BY shreflection.rfl_id;


--
-- Name: shtsat; Type: TABLE; Schema: shine; Owner: shine; Tablespace: 
--

CREATE TABLE shtsat (
    tst_id integer NOT NULL,
    tst_trigger_ruid integer,
    tst_max_attempt integer,
    tst_status character varying(32)
);


ALTER TABLE shine.shtsat OWNER TO shine;

--
-- Name: shtsat_tst_id_seq; Type: SEQUENCE; Schema: shine; Owner: shine
--

CREATE SEQUENCE shtsat_tst_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shine.shtsat_tst_id_seq OWNER TO shine;

--
-- Name: shtsat_tst_id_seq; Type: SEQUENCE OWNED BY; Schema: shine; Owner: shine
--

ALTER SEQUENCE shtsat_tst_id_seq OWNED BY shtsat.tst_id;


--
-- Name: shtsatanswer; Type: TABLE; Schema: shine; Owner: shine; Tablespace: 
--

CREATE TABLE shtsatanswer (
    tsa_id integer NOT NULL,
    tsa_tsqid integer,
    tsa_order integer,
    tsa_answer character varying(100),
    tsa_point numeric(20,0)
);


ALTER TABLE shine.shtsatanswer OWNER TO shine;

--
-- Name: shtsatanswer_tsa_id_seq; Type: SEQUENCE; Schema: shine; Owner: shine
--

CREATE SEQUENCE shtsatanswer_tsa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shine.shtsatanswer_tsa_id_seq OWNER TO shine;

--
-- Name: shtsatanswer_tsa_id_seq; Type: SEQUENCE OWNED BY; Schema: shine; Owner: shine
--

ALTER SEQUENCE shtsatanswer_tsa_id_seq OWNED BY shtsatanswer.tsa_id;


--
-- Name: shtsatquestion; Type: TABLE; Schema: shine; Owner: shine; Tablespace: 
--

CREATE TABLE shtsatquestion (
    tsq_id integer NOT NULL,
    tsq_tstid integer,
    tsq_order integer,
    tsq_question character varying(4000),
    tsq_type character varying(12),
    tsq_max_char integer,
    tsq_qstid integer
);


ALTER TABLE shine.shtsatquestion OWNER TO shine;

--
-- Name: shtsatquestion_tsq_id_seq; Type: SEQUENCE; Schema: shine; Owner: shine
--

CREATE SEQUENCE shtsatquestion_tsq_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shine.shtsatquestion_tsq_id_seq OWNER TO shine;

--
-- Name: shtsatquestion_tsq_id_seq; Type: SEQUENCE OWNED BY; Schema: shine; Owner: shine
--

ALTER SEQUENCE shtsatquestion_tsq_id_seq OWNED BY shtsatquestion.tsq_id;


--
-- Name: shtsatquestioncat; Type: TABLE; Schema: shine; Owner: shine; Tablespace: 
--

CREATE TABLE shtsatquestioncat (
    qst_id integer NOT NULL,
    qst_catname character varying(100),
    qst_catimagepath character varying(100)
);


ALTER TABLE shine.shtsatquestioncat OWNER TO shine;

--
-- Name: shtsatquestioncat_qst_id_seq; Type: SEQUENCE; Schema: shine; Owner: shine
--

CREATE SEQUENCE shtsatquestioncat_qst_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shine.shtsatquestioncat_qst_id_seq OWNER TO shine;

--
-- Name: shtsatquestioncat_qst_id_seq; Type: SEQUENCE OWNED BY; Schema: shine; Owner: shine
--

ALTER SEQUENCE shtsatquestioncat_qst_id_seq OWNED BY shtsatquestioncat.qst_id;


--
-- Name: shtsatresult; Type: TABLE; Schema: shine; Owner: shine; Tablespace: 
--

CREATE TABLE shtsatresult (
    tsr_id integer NOT NULL,
    tsr_usrid character varying(100),
    tsr_created_date timestamp with time zone DEFAULT now(),
    tsr_tstid integer,
    tsr_attempt integer
);


ALTER TABLE shine.shtsatresult OWNER TO shine;

--
-- Name: shtsatresult_tsr_id_seq; Type: SEQUENCE; Schema: shine; Owner: shine
--

CREATE SEQUENCE shtsatresult_tsr_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shine.shtsatresult_tsr_id_seq OWNER TO shine;

--
-- Name: shtsatresult_tsr_id_seq; Type: SEQUENCE OWNED BY; Schema: shine; Owner: shine
--

ALTER SEQUENCE shtsatresult_tsr_id_seq OWNED BY shtsatresult.tsr_id;


--
-- Name: shtsatresultanswer; Type: TABLE; Schema: shine; Owner: shine; Tablespace: 
--

CREATE TABLE shtsatresultanswer (
    tsra_id integer NOT NULL,
    tsra_tsrid integer,
    tsra_tsqid integer,
    tsra_tsaid integer,
    tsra_answer_text text
);


ALTER TABLE shine.shtsatresultanswer OWNER TO shine;

--
-- Name: shtsatresultanswer_tsra_id_seq; Type: SEQUENCE; Schema: shine; Owner: shine
--

CREATE SEQUENCE shtsatresultanswer_tsra_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shine.shtsatresultanswer_tsra_id_seq OWNER TO shine;

--
-- Name: shtsatresultanswer_tsra_id_seq; Type: SEQUENCE OWNED BY; Schema: shine; Owner: shine
--

ALTER SEQUENCE shtsatresultanswer_tsra_id_seq OWNED BY shtsatresultanswer.tsra_id;


--
-- Name: shuserextrainfo; Type: TABLE; Schema: shine; Owner: shine; Tablespace: 
--

CREATE TABLE shuserextrainfo (
    eif_id integer NOT NULL,
    eif_usruserid character varying(50),
    eif_enrolldate timestamp with time zone,
    eif_course character varying(100),
    eif_gender character varying(50),
    eif_nationality character varying(100),
    eif_contactno character varying(50),
    eif_maritalstatus character varying(50),
    eif_studentid character varying(50)
);


ALTER TABLE shine.shuserextrainfo OWNER TO shine;

--
-- Name: shuserextrainfo_eif_id_seq; Type: SEQUENCE; Schema: shine; Owner: shine
--

CREATE SEQUENCE shuserextrainfo_eif_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shine.shuserextrainfo_eif_id_seq OWNER TO shine;

--
-- Name: shuserextrainfo_eif_id_seq; Type: SEQUENCE OWNED BY; Schema: shine; Owner: shine
--

ALTER SEQUENCE shuserextrainfo_eif_id_seq OWNED BY shuserextrainfo.eif_id;


--
-- Name: shvenue; Type: TABLE; Schema: shine; Owner: shine; Tablespace: 
--

CREATE TABLE shvenue (
    vn_id integer NOT NULL,
    vn_name character varying(100),
    vn_addr_line1 character varying(200),
    vn_addr_line2 character varying(200),
    vn_addr_line3 character varying(200),
    vn_addr_line4 character varying(200),
    vn_postcode character varying(12),
    vn_state character varying(100),
    vn_country character varying(100)
);


ALTER TABLE shine.shvenue OWNER TO shine;

--
-- Name: shvenue_vn_id_seq; Type: SEQUENCE; Schema: shine; Owner: shine
--

CREATE SEQUENCE shvenue_vn_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shine.shvenue_vn_id_seq OWNER TO shine;

--
-- Name: shvenue_vn_id_seq; Type: SEQUENCE OWNED BY; Schema: shine; Owner: shine
--

ALTER SEQUENCE shvenue_vn_id_seq OWNED BY shvenue.vn_id;


--
-- Name: tmprpt_activitybystudent; Type: TABLE; Schema: shine; Owner: shine; Tablespace: 
--

CREATE TABLE tmprpt_activitybystudent (
    ras_id integer NOT NULL,
    ras_studentid character varying(50),
    ras_activityjoined integer,
    ras_activityattend integer,
    ras_activitywithdrawn integer,
    ras_activitymissed integer,
    ras_noreflection integer,
    ras_totaccpoint integer,
    ras_globalrank integer,
    ras_tsatscore integer
);


ALTER TABLE shine.tmprpt_activitybystudent OWNER TO shine;

--
-- Name: tmprpt_activitybystudent_ras_id_seq; Type: SEQUENCE; Schema: shine; Owner: shine
--

CREATE SEQUENCE tmprpt_activitybystudent_ras_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shine.tmprpt_activitybystudent_ras_id_seq OWNER TO shine;

--
-- Name: tmprpt_activitybystudent_ras_id_seq; Type: SEQUENCE OWNED BY; Schema: shine; Owner: shine
--

ALTER SEQUENCE tmprpt_activitybystudent_ras_id_seq OWNED BY tmprpt_activitybystudent.ras_id;


--
-- Name: tmprpt_award; Type: TABLE; Schema: shine; Owner: shine; Tablespace: 
--

CREATE TABLE tmprpt_award (
    raw_id integer NOT NULL,
    raw_awardname character varying(100),
    raw_minpoint integer,
    raw_noreceipient integer,
    raw_status character varying(50)
);


ALTER TABLE shine.tmprpt_award OWNER TO shine;

--
-- Name: tmprpt_award_raw_id_seq; Type: SEQUENCE; Schema: shine; Owner: shine
--

CREATE SEQUENCE tmprpt_award_raw_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shine.tmprpt_award_raw_id_seq OWNER TO shine;

--
-- Name: tmprpt_award_raw_id_seq; Type: SEQUENCE OWNED BY; Schema: shine; Owner: shine
--

ALTER SEQUENCE tmprpt_award_raw_id_seq OWNED BY tmprpt_award.raw_id;


--
-- Name: tmprpt_partipantbyact; Type: TABLE; Schema: shine; Owner: shine; Tablespace: 
--

CREATE TABLE tmprpt_partipantbyact (
    rpa_id integer NOT NULL,
    rpa_package character varying(100),
    rpa_activity character varying(100),
    rpa_startdate character varying(100),
    rpa_enddate character varying(100),
    rpa_status character varying(100),
    rpa_provider character varying(100),
    rpa_totalseat character varying(50),
    rpa_totalregistered character varying(50),
    rpa_totalwithdrawn character varying(50),
    rpa_remainingseat character varying(50)
);


ALTER TABLE shine.tmprpt_partipantbyact OWNER TO shine;

--
-- Name: tmprpt_partipantbyact_rpa_id_seq; Type: SEQUENCE; Schema: shine; Owner: shine
--

CREATE SEQUENCE tmprpt_partipantbyact_rpa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shine.tmprpt_partipantbyact_rpa_id_seq OWNER TO shine;

--
-- Name: tmprpt_partipantbyact_rpa_id_seq; Type: SEQUENCE OWNED BY; Schema: shine; Owner: shine
--

ALTER SEQUENCE tmprpt_partipantbyact_rpa_id_seq OWNED BY tmprpt_partipantbyact.rpa_id;


--
-- Name: vw_account_cat; Type: VIEW; Schema: shine; Owner: shine
--

CREATE VIEW vw_account_cat AS
        (         SELECT fclookup.lu_code,
                    fclookup.lu_title
                   FROM fclookup
                  WHERE (((fclookup.lu_cat)::text = 'EVENT'::text) AND ((fclookup.lu_status)::text = 'ACTIVE'::text))
        UNION
                 SELECT fclookup.lu_code,
                    fclookup.lu_title
                   FROM fclookup
                  WHERE (((fclookup.lu_cat)::text = 'MEMBER'::text) AND ((fclookup.lu_status)::text = 'ACTIVE'::text)))
UNION
         SELECT fclookup.lu_code,
            fclookup.lu_title
           FROM fclookup
          WHERE (((fclookup.lu_cat)::text = 'EXAM'::text) AND ((fclookup.lu_status)::text = 'ACTIVE'::text));


ALTER TABLE shine.vw_account_cat OWNER TO shine;

--
-- Name: lang_id; Type: DEFAULT; Schema: shine; Owner: shine
--

ALTER TABLE ONLY fclang ALTER COLUMN lang_id SET DEFAULT nextval('fclang_lang_id_seq'::regclass);


--
-- Name: log_id; Type: DEFAULT; Schema: shine; Owner: shine
--

ALTER TABLE ONLY fclog ALTER COLUMN log_id SET DEFAULT nextval('fclog_log_id_seq'::regclass);


--
-- Name: lu_id; Type: DEFAULT; Schema: shine; Owner: shine
--

ALTER TABLE ONLY fclookup ALTER COLUMN lu_id SET DEFAULT nextval('fclookup_lu_id_seq'::regclass);


--
-- Name: mn_id; Type: DEFAULT; Schema: shine; Owner: shine
--

ALTER TABLE ONLY fcmenu ALTER COLUMN mn_id SET DEFAULT nextval('fcmenu_mn_id_seq'::regclass);


--
-- Name: mn_parentid; Type: DEFAULT; Schema: shine; Owner: shine
--

ALTER TABLE ONLY fcmenu ALTER COLUMN mn_parentid SET DEFAULT nextval('fcmenu_mn_parentid_seq'::regclass);


--
-- Name: org_id; Type: DEFAULT; Schema: shine; Owner: shine
--

ALTER TABLE ONLY fcorg ALTER COLUMN org_id SET DEFAULT nextval('fcorg_org_id_seq'::regclass);


--
-- Name: pms_id; Type: DEFAULT; Schema: shine; Owner: shine
--

ALTER TABLE ONLY fcpermission ALTER COLUMN pms_id SET DEFAULT nextval('fcpermission_pms_id_seq'::regclass);


--
-- Name: f_id; Type: DEFAULT; Schema: shine; Owner: shine
--

ALTER TABLE ONLY fcpmcaseflow ALTER COLUMN f_id SET DEFAULT nextval('fcpmcaseflow_f_id_seq'::regclass);


--
-- Name: op_id; Type: DEFAULT; Schema: shine; Owner: shine
--

ALTER TABLE ONLY fcpmoperation ALTER COLUMN op_id SET DEFAULT nextval('fcpmoperation_op_id_seq'::regclass);


--
-- Name: wf_id; Type: DEFAULT; Schema: shine; Owner: shine
--

ALTER TABLE ONLY fcpmworkflow ALTER COLUMN wf_id SET DEFAULT nextval('fcpmworkflow_wf_id_seq'::regclass);


--
-- Name: rol_id; Type: DEFAULT; Schema: shine; Owner: shine
--

ALTER TABLE ONLY fcrole ALTER COLUMN rol_id SET DEFAULT nextval('fcrole_rol_id_seq'::regclass);


--
-- Name: rp_id; Type: DEFAULT; Schema: shine; Owner: shine
--

ALTER TABLE ONLY fcroleperm ALTER COLUMN rp_id SET DEFAULT nextval('fcroleperm_rp_id_seq'::regclass);


--
-- Name: ru_id; Type: DEFAULT; Schema: shine; Owner: shine
--

ALTER TABLE ONLY fcrule ALTER COLUMN ru_id SET DEFAULT nextval('fcrule_ru_id_seq'::regclass);


--
-- Name: set_id; Type: DEFAULT; Schema: shine; Owner: shine
--

ALTER TABLE ONLY fcsetting ALTER COLUMN set_id SET DEFAULT nextval('fcsetting_set_id_seq'::regclass);


--
-- Name: di_id; Type: DEFAULT; Schema: shine; Owner: shine
--

ALTER TABLE ONLY fcuserdiary ALTER COLUMN di_id SET DEFAULT nextval('fcuserdiary_di_id_seq'::regclass);


--
-- Name: ul_id; Type: DEFAULT; Schema: shine; Owner: shine
--

ALTER TABLE ONLY fcuserlogin ALTER COLUMN ul_id SET DEFAULT nextval('fcuserlogin_ul_id_seq'::regclass);


--
-- Name: uor_id; Type: DEFAULT; Schema: shine; Owner: shine
--

ALTER TABLE ONLY fcuserorgrole ALTER COLUMN uor_id SET DEFAULT nextval('fcuserorgrole_uor_id_seq'::regclass);


--
-- Name: us_id; Type: DEFAULT; Schema: shine; Owner: shine
--

ALTER TABLE ONLY fcusersession ALTER COLUMN us_id SET DEFAULT nextval('fcusersession_us_id_seq'::regclass);


--
-- Name: atat_id; Type: DEFAULT; Schema: shine; Owner: shine
--

ALTER TABLE ONLY shactivityattend ALTER COLUMN atat_id SET DEFAULT nextval('shactivityattend_atat_id_seq'::regclass);


--
-- Name: atve_id; Type: DEFAULT; Schema: shine; Owner: shine
--

ALTER TABLE ONLY shactivityevent ALTER COLUMN atve_id SET DEFAULT nextval('shactivityevent_atve_id_seq'::regclass);


--
-- Name: atpt_id; Type: DEFAULT; Schema: shine; Owner: shine
--

ALTER TABLE ONLY shactivitypart ALTER COLUMN atpt_id SET DEFAULT nextval('shactivitypart_atpt_id_seq'::regclass);


--
-- Name: atp_id; Type: DEFAULT; Schema: shine; Owner: shine
--

ALTER TABLE ONLY shactivitypoint ALTER COLUMN atp_id SET DEFAULT nextval('shactivitypoint_atp_id_seq'::regclass);


--
-- Name: ats_id; Type: DEFAULT; Schema: shine; Owner: shine
--

ALTER TABLE ONLY shactivityschedule ALTER COLUMN ats_id SET DEFAULT nextval('shactivityschedule_ats_id_seq'::regclass);


--
-- Name: tut_id; Type: DEFAULT; Schema: shine; Owner: shine
--

ALTER TABLE ONLY shatutorialsetup ALTER COLUMN tut_id SET DEFAULT nextval('shatutorialsetup_tut_id_seq'::regclass);


--
-- Name: aw_id; Type: DEFAULT; Schema: shine; Owner: shine
--

ALTER TABLE ONLY shaward ALTER COLUMN aw_id SET DEFAULT nextval('shaward_aw_id_seq'::regclass);


--
-- Name: awp_id; Type: DEFAULT; Schema: shine; Owner: shine
--

ALTER TABLE ONLY shawardpoint ALTER COLUMN awp_id SET DEFAULT nextval('shawardpoint_awp_id_seq'::regclass);


--
-- Name: aww_id; Type: DEFAULT; Schema: shine; Owner: shine
--

ALTER TABLE ONLY shawardwinner ALTER COLUMN aww_id SET DEFAULT nextval('shawardwinner_aww_id_seq'::regclass);


--
-- Name: fac_id; Type: DEFAULT; Schema: shine; Owner: shine
--

ALTER TABLE ONLY shfacilitator ALTER COLUMN fac_id SET DEFAULT nextval('shfacilitator_fac_id_seq'::regclass);


--
-- Name: pk_id; Type: DEFAULT; Schema: shine; Owner: shine
--

ALTER TABLE ONLY shpackage ALTER COLUMN pk_id SET DEFAULT nextval('shpackage_pk_id_seq'::regclass);


--
-- Name: pts_id; Type: DEFAULT; Schema: shine; Owner: shine
--

ALTER TABLE ONLY shpoint ALTER COLUMN pts_id SET DEFAULT nextval('shpoint_pts_id_seq'::regclass);


--
-- Name: rfl_id; Type: DEFAULT; Schema: shine; Owner: shine
--

ALTER TABLE ONLY shreflection ALTER COLUMN rfl_id SET DEFAULT nextval('shreflection_rfl_id_seq'::regclass);


--
-- Name: tst_id; Type: DEFAULT; Schema: shine; Owner: shine
--

ALTER TABLE ONLY shtsat ALTER COLUMN tst_id SET DEFAULT nextval('shtsat_tst_id_seq'::regclass);


--
-- Name: tsa_id; Type: DEFAULT; Schema: shine; Owner: shine
--

ALTER TABLE ONLY shtsatanswer ALTER COLUMN tsa_id SET DEFAULT nextval('shtsatanswer_tsa_id_seq'::regclass);


--
-- Name: tsq_id; Type: DEFAULT; Schema: shine; Owner: shine
--

ALTER TABLE ONLY shtsatquestion ALTER COLUMN tsq_id SET DEFAULT nextval('shtsatquestion_tsq_id_seq'::regclass);


--
-- Name: qst_id; Type: DEFAULT; Schema: shine; Owner: shine
--

ALTER TABLE ONLY shtsatquestioncat ALTER COLUMN qst_id SET DEFAULT nextval('shtsatquestioncat_qst_id_seq'::regclass);


--
-- Name: tsr_id; Type: DEFAULT; Schema: shine; Owner: shine
--

ALTER TABLE ONLY shtsatresult ALTER COLUMN tsr_id SET DEFAULT nextval('shtsatresult_tsr_id_seq'::regclass);


--
-- Name: tsra_id; Type: DEFAULT; Schema: shine; Owner: shine
--

ALTER TABLE ONLY shtsatresultanswer ALTER COLUMN tsra_id SET DEFAULT nextval('shtsatresultanswer_tsra_id_seq'::regclass);


--
-- Name: eif_id; Type: DEFAULT; Schema: shine; Owner: shine
--

ALTER TABLE ONLY shuserextrainfo ALTER COLUMN eif_id SET DEFAULT nextval('shuserextrainfo_eif_id_seq'::regclass);


--
-- Name: vn_id; Type: DEFAULT; Schema: shine; Owner: shine
--

ALTER TABLE ONLY shvenue ALTER COLUMN vn_id SET DEFAULT nextval('shvenue_vn_id_seq'::regclass);


--
-- Name: ras_id; Type: DEFAULT; Schema: shine; Owner: shine
--

ALTER TABLE ONLY tmprpt_activitybystudent ALTER COLUMN ras_id SET DEFAULT nextval('tmprpt_activitybystudent_ras_id_seq'::regclass);


--
-- Name: raw_id; Type: DEFAULT; Schema: shine; Owner: shine
--

ALTER TABLE ONLY tmprpt_award ALTER COLUMN raw_id SET DEFAULT nextval('tmprpt_award_raw_id_seq'::regclass);


--
-- Name: rpa_id; Type: DEFAULT; Schema: shine; Owner: shine
--

ALTER TABLE ONLY tmprpt_partipantbyact ALTER COLUMN rpa_id SET DEFAULT nextval('tmprpt_partipantbyact_rpa_id_seq'::regclass);


--
-- Name: caseapplicationid; Type: SEQUENCE SET; Schema: shine; Owner: shine
--

SELECT pg_catalog.setval('caseapplicationid', 20, true);


--
-- Name: emp_application_id; Type: SEQUENCE SET; Schema: shine; Owner: shine
--

SELECT pg_catalog.setval('emp_application_id', 23, true);


--
-- Data for Name: fccountry; Type: TABLE DATA; Schema: shine; Owner: shine
--

COPY fccountry (con_code, con_name, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) FROM stdin;
FJ	Fiji	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	1
FI	Finland	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	2
FR	France	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	3
GF	French Guiana	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	4
PF	French Polynesia	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	5
TF	French Southern Territories	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	6
GA	Gabon	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	7
GM	Gambia	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	8
GE	Georgia	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	9
DE	Germany	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	10
GH	Ghana	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	11
GI	Gibraltar	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	12
GR	Greece	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	13
GL	Greenland	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	14
GD	Grenada	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	15
GP	Guadeloupe	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	16
GU	Guam	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	17
GT	Guatemala	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	18
GG	Guernsey	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	19
GN	Guinea	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	20
GW	Guinea-bissau	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	21
GY	Guyana	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	22
HT	Haiti	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	23
HM	Heard Island and Mcdonald Islands	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	24
HN	Honduras	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	25
HK	Hong Kong	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	26
HU	Hungary	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	27
IS	Iceland	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	28
IN	India	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	29
ID	Indonesia	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	30
TG	Togo	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	31
MY	Malaysia	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	32
MV	Maldives	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	33
ML	Mali	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	34
MT	Malta	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	35
MH	Marshall Islands	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	36
MQ	Martinique	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	37
MR	Mauritania	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	38
MU	Mauritius	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	39
YT	Mayotte	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	40
MX	Mexico	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	41
FM	Micronesia, Federated States of	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	42
MD	Moldova, Republic of	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	43
MC	Monaco	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	44
MN	Mongolia	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	45
ME	Montenegro	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	46
MS	Montserrat	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	47
MA	Morocco	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	48
MZ	Mozambique	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	49
MM	Myanmar	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	50
NA	Namibia	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	51
NR	Nauru	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	52
NP	Nepal	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	53
NL	Netherlands	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	54
AN	Netherlands Antilles	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	55
NC	New Caledonia	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	56
NZ	New Zealand	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	57
NI	Nicaragua	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	58
NE	Niger	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	59
NG	Nigeria	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	60
NU	Niue	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	61
NF	Norfolk Island	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	62
MP	Northern Mariana Islands	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	63
NO	Norway	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	64
OM	Oman	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	65
PK	Pakistan	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	66
PW	Palau	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	67
PS	Palestinian Territory, Occupied	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	68
PA	Panama	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	69
PG	Papua New Guinea	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	70
PY	Paraguay	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	71
PE	Peru	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	72
PH	Philippines	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	73
PN	Pitcairn	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	74
PL	Poland	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	75
PT	Portugal	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	76
PR	Puerto Rico	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	77
QA	Qatar	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	78
RE	Reunion	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	79
RO	Romania	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	80
RU	Russian Federation	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	81
RW	Rwanda	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	82
SH	Saint Helena	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	83
KN	Saint Kitts and Nevis	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	84
LC	Saint Lucia	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	85
PM	Saint Pierre and Miquelon	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	86
VC	Saint Vincent and The Grenadines	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	87
WS	Samoa	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	88
SM	San Marino	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	89
ST	Sao Tome and Principe	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	90
SA	Saudi Arabia	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	91
SN	Senegal	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	92
RS	Serbia	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	93
SC	Seychelles	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	94
SL	Sierra Leone	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	95
SG	Singapore	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	96
SK	Slovakia	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	97
SI	Slovenia	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	98
SB	Solomon Islands	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	99
SO	Somalia	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	100
ZA	South Africa	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	101
GS	South Georgia and The South Sandwich Islands	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	102
ES	Spain	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	103
LK	Sri Lanka	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	104
SD	Sudan	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	105
SR	Suriname	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	106
SJ	Svalbard and Jan Mayen	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	107
SZ	Swaziland	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	108
SE	Sweden	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	109
CH	Switzerland	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	110
SY	Syrian Arab Republic	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	111
TW	Taiwan, Province of China	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	112
TJ	Tajikistan	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	113
TZ	Tanzania, United Republic of	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	114
TH	Thailand	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	115
TL	Timor-leste	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	116
TK	Tokelau	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	117
TO	Tonga	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	118
TT	Trinidad and Tobago	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	119
TN	Tunisia	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	120
TR	Turkey	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	121
TM	Turkmenistan	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	122
TC	Turks and Caicos Islands	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	123
TV	Tuvalu	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	124
UG	Uganda	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	125
UA	Ukraine	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	126
AE	United Arab Emirates	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	127
GB	United Kingdom	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	128
US	United States	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	129
UM	United States Minor Outlying Islands	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	130
UY	Uruguay	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	131
UZ	Uzbekistan	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	132
VU	Vanuatu	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	133
VE	Venezuela	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	134
VG	Virgin Islands, British	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	135
VI	Virgin Islands, U.S.	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	136
WF	Wallis and Futuna	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	137
EH	Western Sahara	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	138
YE	Yemen	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	139
ZM	Zambia	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	140
ZW	Zimbabwe	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	141
AX	Aland Islands	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	142
AL	Albania	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	143
DZ	Algeria	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	144
AS	American Samoa	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	145
AD	Andorra	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	146
AO	Angola	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	147
AI	Anguilla	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	148
AQ	Antarctica	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	149
AG	Antigua and Barbuda	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	150
AR	Argentina	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	151
AM	Armenia	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	152
AW	Aruba	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	153
AU	Australia	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	154
AT	Austria	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	155
AZ	Azerbaijan	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	156
BS	Bahamas	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	157
BH	Bahrain	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	158
BD	Bangladesh	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	159
BB	Barbados	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	160
BY	Belarus	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	161
BE	Belgium	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	162
BZ	Belize	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	163
BJ	Benin	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	164
BM	Bermuda	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	165
BT	Bhutan	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	166
BO	Bolivia	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	167
BA	Bosnia and Herzegovina	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	168
BW	Botswana	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	169
BV	Bouvet Island	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	170
BR	Brazil	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	171
IO	British Indian Ocean Territory	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	172
BN	Brunei Darussalam	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	173
BG	Bulgaria	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	174
BF	Burkina Faso	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	175
BI	Burundi	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	176
KH	Cambodia	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	177
CM	Cameroon	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	178
CA	Canada	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	179
CV	Cape Verde	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	180
KY	Cayman Islands	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	181
CF	Central African Republic	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	182
TD	Chad	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	183
CL	Chile	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	184
CN	China	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	185
CX	Christmas Island	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	186
CC	Cocos (Keeling) Islands	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	187
CO	Colombia	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	188
KM	Comoros	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	189
CG	Congo	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	190
CK	Cook Islands	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	191
CR	Costa Rica	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	192
CI	Cote D'ivoire	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	193
HR	Croatia	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	194
CU	Cuba	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	195
CY	Cyprus	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	196
CZ	Czech Republic	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	197
DK	Denmark	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	198
DJ	Djibouti	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	199
DM	Dominica	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	200
DO	Dominican Republic	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	201
EC	Ecuador	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	202
EG	Egypt	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	203
SV	El Salvador	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	204
GQ	Equatorial Guinea	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	205
ER	Eritrea	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	206
EE	Estonia	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	207
ET	Ethiopia	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	208
FK	Falkland Islands (Malvinas)	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	209
FO	Faroe Islands	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	210
IQ	Iraq	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	211
IE	Ireland	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	212
IM	Isle of Man	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	213
IL	Israel	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	214
IT	Italy	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	215
JM	Jamaica	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	216
JP	Japan	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	217
JE	Jersey	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	218
JO	Jordan	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	219
KZ	Kazakhstan	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	220
KE	Kenya	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	221
KI	Kiribati	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	222
KW	Kuwait	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	223
KG	Kyrgyzstan	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	224
LA	Lao People's Democratic Republic	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	225
LV	Latvia	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	226
LB	Lebanon	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	227
LS	Lesotho	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	228
LR	Liberia	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	229
LY	Libyan Arab Jamahiriya	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	230
LI	Liechtenstein	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	231
LT	Lithuania	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	232
LU	Luxembourg	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	233
MO	Macao	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	234
MG	Madagascar	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	235
MW	Malawi	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	236
AF	Afghanistan	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	237
VN	Vietnam	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	238
VA	Vatican City	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	239
IR	Iran	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	240
KP	Korea (South)	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	241
KR	Korea (North)	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	242
MK	Macedonia	2013-07-22 22:09:49.95+08	2013-07-22 23:21:24.568+08	Y	243
\.


--
-- Data for Name: fclang; Type: TABLE DATA; Schema: shine; Owner: shine
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
-- Name: fclang_lang_id_seq; Type: SEQUENCE SET; Schema: shine; Owner: shine
--

SELECT pg_catalog.setval('fclang_lang_id_seq', 158, true);


--
-- Data for Name: fclog; Type: TABLE DATA; Schema: shine; Owner: shine
--

COPY fclog (log_id, log_created, log_cat, log_cat2, log_ref, log_ref2, log_ref3, log_desc, log_desc2) FROM stdin;
\.


--
-- Name: fclog_log_id_seq; Type: SEQUENCE SET; Schema: shine; Owner: shine
--

SELECT pg_catalog.setval('fclog_log_id_seq', 1, false);


--
-- Data for Name: fclookup; Type: TABLE DATA; Schema: shine; Owner: shine
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
-- Name: fclookup_lu_id_seq; Type: SEQUENCE SET; Schema: shine; Owner: shine
--

SELECT pg_catalog.setval('fclookup_lu_id_seq', 110, true);


--
-- Data for Name: fcmenu; Type: TABLE DATA; Schema: shine; Owner: shine
--

COPY fcmenu (mn_id, mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_url, mn_webflag, mn_class, mn_classlist, mn_func, mn_funclist, mn_param, mn_pmscode) FROM stdin;
1	HEADERMENU	0	Top Menu	ACTIVE	0		Y	\N	\N	\N	\N	\N	\N
69	MENU	6	Menu Setup	ACTIVE	4400	\N	Y	Setting	\N	menusetup	\N	\N	\N
3	DASHBOARD	1	Dashboard	INACTIVE	1000		Y	Dashboard	\N	newsevent	\N	\N	\N
49	USERSETUP	48	User Setup	ACTIVE	4210		Y	Setting		usersetting			\N
50	PERMSETUP	48	Permission Setup	ACTIVE	4230		Y	Setting		permsetting			\N
51	ROLESETUP	48	Role Setup	ACTIVE	4220		Y	Setting		rolesetting			\N
21	GENSETTING	6	General Setting	INACTIVE	4100	\N	Y	Setting	\N	gensetting	\N	\N	\N
62	journalentry	55	Journal Entry	ACTIVE	6150	\N	Y	Account		journalentry			\N
4	HOME	1	Home	ACTIVE	500	\N	Y	Home	\N	home	\N	\N	\N
48	USERSETTING	6	User Setting	ACTIVE	4200	\N	Y	Setting		usersetting			\N
6	SETTING	1	Setting	ACTIVE	9000	\N	N	Setting	\N	gensetting	\N	\N	MENU_SETTING
74	tutorialsetup	73	Tutorial Setup	ACTIVE	1000	\N	Y	Setting	\N	tutsetup	\N	\N	\N
75	DBOSETUP	73	Form Setup	ACTIVE	2000	\N	Y	Setting	\N	DBOList	\N	\N	\N
76	RPTACTSTUDENT	5	Activity by student	ACTIVE	1000	\N	Y	Report	\N	activitybystudent	\N	\N	\N
78	RPTPARACT	5	Participation by activity	ACTIVE	2000	\N	Y	Report	\N	participationbyactivity	\N	\N	\N
79	RPTAWARD	5	Award history	ACTIVE	3000	\N	Y	Report	\N	awardhistory	\N	\N	\N
80	ACTIVITYSETUP	73	Activity Setup	ACTIVE	500	\N	Y	Activity	\N	setup	\N	\N	\N
81	EVENTSETUP	73	Event Setup	ACTIVE	800	\N	Y	Activity	\N	event	\N	\N	\N
73	ITADMINSETT	6	Admin Setting	ACTIVE	1000	\N	Y	Activity	\N	setup	\N	\N	\N
5	REPORT	1	Report	ACTIVE	3000	\N	N	Report	\N	rptrevdaily	\N	\N	MENU_REPORT
82	FORMSETUP	6	Form Setup	ACTIVE	9000	\N	Y	Setting	\N	DBOList	\N	\N	MENU_SETTING
83	ATTENDANCE	1	Attendance	ACTIVE	1000	\N	Y	Activity	\N	Attendance	\N	\N	MENU_REPORT
\.


--
-- Name: fcmenu_mn_id_seq; Type: SEQUENCE SET; Schema: shine; Owner: shine
--

SELECT pg_catalog.setval('fcmenu_mn_id_seq', 83, true);


--
-- Name: fcmenu_mn_parentid_seq; Type: SEQUENCE SET; Schema: shine; Owner: shine
--

SELECT pg_catalog.setval('fcmenu_mn_parentid_seq', 6, true);


--
-- Data for Name: fcorg; Type: TABLE DATA; Schema: shine; Owner: shine
--

COPY fcorg (org_id, org_code, org_name, org_parentid, org_primaryid, org_address, org_contactno, org_status) FROM stdin;
1	TAYLOR	Taylor University	0	ISP	\N	\N	ACTIVE
\.


--
-- Name: fcorg_org_id_seq; Type: SEQUENCE SET; Schema: shine; Owner: shine
--

SELECT pg_catalog.setval('fcorg_org_id_seq', 2, true);


--
-- Data for Name: fcpermission; Type: TABLE DATA; Schema: shine; Owner: shine
--

COPY fcpermission (pms_id, pms_code, pms_desc, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) FROM stdin;
1	MENU_DASHBOARD	VIEW DASHBOARD	2013-11-24 17:33:07.775+08	\N	N	\N
3	MENU_HOME	VIEW HOME	2013-11-24 17:33:38.778+08	\N	N	\N
4	MENU_REPORT	VIEW REPORT	2013-11-24 17:33:53.525+08	\N	N	\N
5	MENU_SETTING	VIEW SETTINGS	2013-11-24 17:34:02.799+08	\N	N	\N
21	REQUEST_ADHOC_ACTIVITY	Request adhoc activity	2014-04-12 11:04:39.285+08	\N	N	\N
23	ADHOC_APPROVAL	Adhoc Activity Approval	2014-04-12 11:50:48.178+08	\N	N	\N
24	CREATE_REFLECTION	Create Reflection	2014-04-12 14:21:18.817+08	\N	N	\N
25	APPROVE_REFLECTION	Reflection Approval	2014-04-12 16:51:31.063+08	\N	N	\N
22	PERFORM_TSAT	Perform TSAT	2014-04-12 11:04:50.532+08	\N	N	\N
26	ADHOC_NOTIFICATION	Adhoc Notification	2014-04-13 18:39:59.887+08	\N	N	\N
\.


--
-- Name: fcpermission_pms_id_seq; Type: SEQUENCE SET; Schema: shine; Owner: shine
--

SELECT pg_catalog.setval('fcpermission_pms_id_seq', 26, true);


--
-- Data for Name: fcpmcaseflow; Type: TABLE DATA; Schema: shine; Owner: shine
--

COPY fcpmcaseflow (f_id, f_timestamp, f_opid, f_caseid, f_casetype, f_status, f_del_timestamp, f_userid, f_decision) FROM stdin;
355	2014-04-12 22:57:39.971+08	49	19	reflection	DEL	2014-04-12 23:02:54.999+08	severus	Approve
356	2014-04-12 23:06:50.309+08	48	20	reflection	DEL	2014-04-12 23:07:26.055+08	fred	\N
357	2014-04-12 23:07:26.057+08	49	20	reflection	DEL	2014-04-12 23:07:34.439+08	severus	Approve
344	2014-04-12 22:09:28.646+08	49	14	reflection	DEL	2014-04-13 13:32:47.997+08	severus	Approve
362	2014-04-13 14:28:29.79+08	42	41	adhoc	DEL	2014-04-13 14:28:29.793+08	hermione	\N
341	2014-04-12 22:00:33.147+08	42	38	adhoc	DEL	2014-04-12 22:00:33.16+08	fred	\N
364	2014-04-13 14:29:17.888+08	42	42	adhoc	DEL	2014-04-13 14:29:17.89+08	hermione	\N
342	2014-04-12 22:00:33.169+08	43	38	adhoc	DEL	2014-04-12 22:01:47.786+08	severus	Approve
343	2014-04-12 22:01:47.744+08	48	14	reflection	DEL	2014-04-12 22:09:28.521+08	fred	\N
345	2014-04-12 22:12:52.02+08	42	39	adhoc	DEL	2014-04-12 22:12:52.023+08	harry	\N
346	2014-04-12 22:12:52.024+08	43	39	adhoc	DEL	2014-04-12 22:13:19.948+08	severus	Approve
347	2014-04-12 22:13:19.942+08	48	15	reflection	DEL	2014-04-12 22:13:54.138+08	harry	\N
366	2014-04-13 14:33:03.34+08	48	25	reflection	ACTV	\N	hermione	\N
349	2014-04-12 22:20:23.698+08	42	40	adhoc	DEL	2014-04-12 22:20:23.7+08	fred	\N
363	2014-04-13 14:28:29.794+08	43	41	adhoc	DEL	2014-04-13 14:33:03.515+08	snape	Approve
351	2014-04-12 22:21:34.236+08	48	16	reflection	ACTV	\N	fred	\N
350	2014-04-12 22:20:23.701+08	43	40	adhoc	DEL	2014-04-12 22:21:34.34+08	severus	Approve
367	2014-04-13 14:39:35.623+08	48	26	reflection	ACTV	\N	hermione	\N
365	2014-04-13 14:29:17.891+08	43	42	adhoc	DEL	2014-04-13 14:39:35.651+08	snape	Approve
358	2014-04-13 12:12:19.178+08	48	21	reflection	DEL	2014-04-13 14:42:58.604+08	hermione	\N
368	2014-04-13 14:42:58.605+08	49	21	reflection	DEL	2014-04-13 14:43:52.078+08	snape	Approve
359	2014-04-13 12:12:36.521+08	48	22	reflection	DEL	2014-04-13 15:10:30.826+08	hermione	\N
348	2014-04-12 22:13:54.179+08	49	15	reflection	DEL	2014-04-12 22:28:22.163+08	severus	Approve
369	2014-04-13 15:10:30.827+08	49	22	reflection	DEL	2014-04-13 15:11:54.171+08	snape	Approve
354	2014-04-12 22:52:10.346+08	48	19	reflection	DEL	2014-04-12 22:57:39.97+08	fred	\N
360	2014-04-13 12:12:48.425+08	48	23	reflection	DEL	2014-04-13 17:21:01.303+08	hermione	\N
372	2014-04-13 17:21:01.304+08	49	23	reflection	DEL	2014-04-13 17:22:10.018+08	snape	Approve
373	2014-04-13 17:29:57.203+08	42	43	adhoc	DEL	2014-04-13 17:29:57.274+08	fred	\N
374	2014-04-13 17:29:57.354+08	43	43	adhoc	ACTV	\N	\N	\N
375	2014-04-13 17:40:51.766+08	48	28	reflection	DEL	2014-04-13 17:42:39.226+08	fred	\N
376	2014-04-13 17:42:39.276+08	49	28	reflection	DEL	2014-04-13 17:43:00.501+08	snape	Reject
377	2014-04-13 17:43:00.502+08	50	28	reflection	DEL	2014-04-13 17:46:16.266+08	fred	\N
378	2014-04-13 17:46:16.268+08	49	28	reflection	DEL	2014-04-13 17:46:26.35+08	snape	Approve
361	2014-04-13 13:05:43.022+08	48	24	reflection	DEL	2014-04-13 18:05:54.681+08	hermione	\N
379	2014-04-13 18:05:54.731+08	49	24	reflection	DEL	2014-04-13 18:07:10.598+08	snape	Approve
381	2014-04-13 18:43:48.088+08	49	29	reflection	DEL	2014-04-13 18:44:51.477+08	snape	Approve
\.


--
-- Name: fcpmcaseflow_f_id_seq; Type: SEQUENCE SET; Schema: shine; Owner: shine
--

SELECT pg_catalog.setval('fcpmcaseflow_f_id_seq', 381, true);


--
-- Data for Name: fcpmcasetype; Type: TABLE DATA; Schema: shine; Owner: shine
--

COPY fcpmcasetype (ct_code, ct_desc, ct_table, ct_desc_col, ct_key_col) FROM stdin;
adhoc	Adhoc Activity	shadhocactivity	aha_name	aha_id
reflection	Reflection	shreflection	rfl_subject	rfl_id
\.


--
-- Data for Name: fcpmoperation; Type: TABLE DATA; Schema: shine; Owner: shine
--

COPY fcpmoperation (op_id, op_parentid, op_wfid, op_name, op_type, op_x, op_y, op_next_opid1, op_escalate_opid, op_userrole, op_task_func, op_pmscode, op_next_opid2, op_next_opid3) FROM stdin;
48	0	19	Pending Reflection	DATAENTRY	0	100	49	\N	\N	createReflection	CREATE_REFLECTION	\N	\N
49	0	19	Approval	DATAENTRY	0	100	\N	\N	\N	reflectionApproval	APPROVE_REFLECTION	50	\N
50	0	19	Rejected Reflection	DATAENTRY	0	199	49	\N	\N	alterReflection	CREATE_REFLECTION	\N	\N
42	0	17	New Request	DATAENTRY	0	100	43	\N	\N	requestAdhocActivity	REQUEST_ADHOC_ACTIVITY	\N	\N
43	0	17	Approval	DATAENTRY	0	100	\N	\N	\N	adhocActivityApproval	ADHOC_APPROVAL	46	\N
46	0	17	Rejected Adhoc Activity Request	DATAENTRY	0	100	43	\N	\N	alterAdhocActivity	REQUEST_ADHOC_ACTIVITY	\N	\N
\.


--
-- Name: fcpmoperation_op_id_seq; Type: SEQUENCE SET; Schema: shine; Owner: shine
--

SELECT pg_catalog.setval('fcpmoperation_op_id_seq', 50, true);


--
-- Data for Name: fcpmoperationtype; Type: TABLE DATA; Schema: shine; Owner: shine
--

COPY fcpmoperationtype (opt_code, opt_name, opt_order, opt_ui, opt_method, opt_shape, opt_bgcolor, opt_icon, opt_fontcolor) FROM stdin;
DATAENTRY	Data Entry	1	Y	\N	\N	\N	\N	\N
ROUTE	Auto Route	2	N	route	\N	\N	\N	\N
\.


--
-- Data for Name: fcpmworkflow; Type: TABLE DATA; Schema: shine; Owner: shine
--

COPY fcpmworkflow (wf_id, wf_name, wf_seq, wf_userrole, wf_status) FROM stdin;
18	TSAT	200	\N	ACTIVE
19	Reflection	300	\N	ACTIVE
17	Adhoc Activity	100	\N	ACTIVE
\.


--
-- Name: fcpmworkflow_wf_id_seq; Type: SEQUENCE SET; Schema: shine; Owner: shine
--

SELECT pg_catalog.setval('fcpmworkflow_wf_id_seq', 19, true);


--
-- Data for Name: fcrole; Type: TABLE DATA; Schema: shine; Owner: shine
--

COPY fcrole (rol_id, rol_code, rol_desc, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid, rol_status) FROM stdin;
12	student	student	2014-04-11 13:51:55.782+08	\N	N	\N	ACTIVE
11	shineadmin	Shine admin	2014-04-11 13:51:40.912+08	\N	N	\N	ACTIVE
10	admin	admin	2014-02-11 11:20:15.419+08	\N	N	\N	ACTIVE
13	supervisor	Shine supervisor	2014-04-11 13:53:30.706+08	\N	N	\N	ACTIVE
\.


--
-- Name: fcrole_rol_id_seq; Type: SEQUENCE SET; Schema: shine; Owner: shine
--

SELECT pg_catalog.setval('fcrole_rol_id_seq', 13, true);


--
-- Data for Name: fcroleperm; Type: TABLE DATA; Schema: shine; Owner: shine
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
164	11	3
165	11	4
166	11	5
167	11	26
175	10	1
176	10	3
177	10	4
178	10	5
179	10	21
180	10	22
181	10	26
182	13	3
183	13	4
184	13	23
185	13	25
186	13	26
145	12	3
146	12	21
147	12	24
148	12	22
\.


--
-- Name: fcroleperm_rp_id_seq; Type: SEQUENCE SET; Schema: shine; Owner: shine
--

SELECT pg_catalog.setval('fcroleperm_rp_id_seq', 186, true);


--
-- Data for Name: fcrule; Type: TABLE DATA; Schema: shine; Owner: shine
--

COPY fcrule (ru_id, ru_name, ru_true_msg, ru_false_msg, ru_data) FROM stdin;
\.


--
-- Name: fcrule_ru_id_seq; Type: SEQUENCE SET; Schema: shine; Owner: shine
--

SELECT pg_catalog.setval('fcrule_ru_id_seq', 1, false);


--
-- Data for Name: fcsetting; Type: TABLE DATA; Schema: shine; Owner: shine
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
-- Name: fcsetting_set_id_seq; Type: SEQUENCE SET; Schema: shine; Owner: shine
--

SELECT pg_catalog.setval('fcsetting_set_id_seq', 7, true);


--
-- Data for Name: fcudv; Type: TABLE DATA; Schema: shine; Owner: shine
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
-- Data for Name: fcuser; Type: TABLE DATA; Schema: shine; Owner: shine
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
hermione	a7257ef242a856304478236fe46fee00f23f8a25	2014-04-13 11:14:37.564+08	Granger T. Hermione 	hermione@gmail.com	2014-04-13 19:29:11+08	2014-04-13 19:20:34+08	\N	\N	a:0:{}	\N	ACTIVE
admin5	47c1dc4559eae95cdde6246bf4aa3fb058dd8373	2014-04-13 13:34:53.258+08	admin5	admin5@posb.com	2014-04-13 16:57:23+08	2014-04-13 16:32:51+08	2014-04-13 18:56:15+08	\N	a:5:{s:14:"urlbeforelogin";s:35:"/shine/web/Report/activitybystudent";s:7:"dbosess";a:8:{s:21:"tmprpt_partipantbyact";a:5:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"list";s:5:"dbost";b:0;}s:12:"tmprpt_award";a:4:{s:6:"lastid";a:1:{s:6:"raw_id";s:1:"3";}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"list";}s:24:"tmprpt_activitybystudent";a:5:{s:6:"lastid";a:1:{s:6:"ras_id";s:2:"10";}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"list";s:4:"page";i:1;}s:23:"register_adhoc_activity";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:3:"new";}s:25:"activity_event_attendance";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"list";}s:12:"series_setup";a:4:{s:6:"lastid";a:1:{s:5:"pk_id";s:2:"24";}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:4:"edit";}s:14:"activity_setup";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:3:"new";}s:13:"package_setup";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:3:"new";}}s:9:"dboconfig";a:0:{}s:12:"current_opid";s:2:"42";s:14:"activity_setup";a:3:{s:4:"type";s:7:"PACKAGE";s:2:"id";s:2:"22";s:4:"mode";s:3:"new";}}	\N	ACTIVE
snape	e3a2581a77ef453f5d3a9937cf138faccbee32cf	2014-04-11 15:47:11.276+08	Severus R. Snape	severus@gmail.com	2014-04-13 18:44:55+08	2014-04-13 18:44:04+08	2014-04-13 15:54:35+08	\N	a:0:{}	\N	ACTIVE
harry	23a0b5e4fb6c6e8280940920212ecd563859cb3c	2014-04-11 15:44:42.34+08	Potter J. Harry	harry@gmail.com	2014-04-13 18:51:58+08	2014-04-13 18:51:12+08	\N	\N	a:0:{}	\N	ACTIVE
admin2	d033e22ae348aeb5660fc2140aec35850c4da997	2014-01-26 15:39:57.04+08	Administrator 2	\N	2014-04-13 19:19:59+08	2014-04-13 18:56:20+08	2014-04-13 12:02:05+08	ADMIN	a:3:{s:7:"dbosess";a:1:{s:18:"adhoc_notification";a:4:{s:6:"lastid";a:0:{}s:4:"sort";a:0:{}s:6:"search";a:0:{}s:5:"state";s:3:"new";}}s:9:"dboconfig";a:0:{}s:7:"dboload";s:18:"adhoc_notification";}	\N	ACTIVE
dumbledore	f3b486df131e1cd4eec4cef969e4afbcc81f046f	2014-04-11 15:47:30.12+08	Dumbledore K. Albus	albus@gmail.com	2014-04-13 19:20:28+08	2014-04-13 19:20:07+08	2014-04-13 11:54:18+08	\N	a:0:{}	\N	ACTIVE
admin	d033e22ae348aeb5660fc2140aec35850c4da997	2013-08-15 09:55:18.85+08	Administrator	\N	2014-04-13 18:42:20+08	2014-04-13 18:41:45+08	2014-03-26 18:54:54+08	ADMIN	a:0:{}	\N	ACTIVE
fred	31017a722665e4afce586950f42944a6d331dabf	2014-04-11 15:46:27.77+08	Fred	fred@gmail.com	2014-04-13 18:06:11+08	2014-04-13 17:38:57+08	\N	\N	a:0:{}	\N	ACTIVE
\.


--
-- Data for Name: fcuserdiary; Type: TABLE DATA; Schema: shine; Owner: shine
--

COPY fcuserdiary (di_id, di_created, di_created_by, di_userid, di_duedate, di_cat, di_subject, di_text, di_status, di_display_date) FROM stdin;
26	2014-04-12 16:45:29.986+08	\N	admin	\N	notification	Test test test test test test test test long word	\N	ACTIVE	2014-04-12 21:25:15.881+08
28	2014-04-13 17:29:57.176+08	*shine	dumbledore	\N	Notice	There's a new adhoc activity request by  pending for your approval	\N	ACTIVE	2014-04-13 17:29:57.176+08
29	2014-04-13 17:43:00.468+08	*shine	fred	\N	Notice	Your reflection is rejected	\N	ACTIVE	2014-04-13 17:43:00.468+08
30	2014-04-13 17:46:26.339+08	*shine	fred	\N	Notice	Your reflection on "IMPACT & INFLUENCE" is approved	\N	ACTIVE	2014-04-13 17:46:26.339+08
33	2014-04-13 18:54:26.597+08	admin2	admin5	\N	Notice	This is a sample notification	\N	ACTIVE	2014-04-13 18:54:26.597+08
34	2014-04-13 18:54:26.597+08	admin2	admin2	\N	Notice	This is a sample notification	\N	ACTIVE	2014-04-13 18:54:26.597+08
35	2014-04-13 18:55:59.481+08	admin2	admin2	\N	Notice	sample notification 2	\N	ACTIVE	2014-04-13 18:55:59.481+08
\.


--
-- Name: fcuserdiary_di_id_seq; Type: SEQUENCE SET; Schema: shine; Owner: shine
--

SELECT pg_catalog.setval('fcuserdiary_di_id_seq', 38, true);


--
-- Data for Name: fcuserlogin; Type: TABLE DATA; Schema: shine; Owner: shine
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
458	admin	192.168.0.162	Y	2014-04-12 11:17:01.493+08	2014-04-12 11:17:01.493+08	\N	N	\N
459	admin	127.0.0.1	Y	2014-04-12 11:27:58.188+08	2014-04-12 11:27:58.188+08	\N	N	\N
460	admin2	127.0.0.1	Y	2014-04-12 11:28:12.369+08	2014-04-12 11:28:12.369+08	\N	N	\N
461	admin	192.168.0.162	Y	2014-04-12 11:28:27.341+08	2014-04-12 11:28:27.341+08	\N	N	\N
462	fred	192.168.0.162	Y	2014-04-12 11:49:09.572+08	2014-04-12 11:49:09.572+08	\N	N	\N
463	albus	192.168.0.162	Y	2014-04-12 11:49:24.272+08	2014-04-12 11:49:24.272+08	\N	N	\N
464	admin	192.168.0.162	Y	2014-04-12 12:16:58.255+08	2014-04-12 12:16:58.255+08	\N	N	\N
467	albus	192.168.0.153	Y	2014-04-12 14:00:25.566+08	2014-04-12 14:00:25.566+08	\N	N	\N
468	severus	192.168.0.162	Y	2014-04-12 14:03:22.585+08	2014-04-12 14:03:22.585+08	\N	N	\N
469	fred	192.168.0.162	Y	2014-04-12 14:03:44.961+08	2014-04-12 14:03:44.961+08	\N	N	\N
470	severus	192.168.0.162	Y	2014-04-12 14:03:59.411+08	2014-04-12 14:03:59.411+08	\N	N	\N
471	fred	127.0.0.1	Y	2014-04-12 14:38:08.257+08	2014-04-12 14:38:08.257+08	\N	N	\N
472	admin	127.0.0.1	Y	2014-04-12 14:38:51.253+08	2014-04-12 14:38:51.253+08	\N	N	\N
473	admin	127.0.0.1	Y	2014-04-12 14:46:06.253+08	2014-04-12 14:46:06.253+08	\N	N	\N
474	albus	127.0.0.1	Y	2014-04-12 19:18:54.356+08	2014-04-12 19:18:54.356+08	\N	N	\N
475	albus	192.168.0.153	Y	2014-04-12 19:19:18.169+08	2014-04-12 19:19:18.169+08	\N	N	\N
476	admin	127.0.0.1	Y	2014-04-12 19:26:28.932+08	2014-04-12 19:26:28.932+08	\N	N	\N
477	admin	127.0.0.1	Y	2014-04-12 19:47:23.943+08	2014-04-12 19:47:23.943+08	\N	N	\N
478	fred	192.168.0.153	Y	2014-04-12 20:07:15.827+08	2014-04-12 20:07:15.827+08	\N	N	\N
479	fred	127.0.0.1	Y	2014-04-12 21:09:40.508+08	2014-04-12 21:09:40.508+08	\N	N	\N
480	severus	127.0.0.1	Y	2014-04-12 21:12:43.785+08	2014-04-12 21:12:43.785+08	\N	N	\N
481	severus	127.0.0.1	Y	2014-04-12 21:13:18.229+08	2014-04-12 21:13:18.229+08	\N	N	\N
482	fred	127.0.0.1	Y	2014-04-12 21:13:28.002+08	2014-04-12 21:13:28.002+08	\N	N	\N
484	fred	127.0.0.1	Y	2014-04-12 21:13:58.593+08	2014-04-12 21:13:58.593+08	\N	N	\N
485	severus	127.0.0.1	Y	2014-04-12 21:15:13.975+08	2014-04-12 21:15:13.975+08	\N	N	\N
486	fred	127.0.0.1	Y	2014-04-12 21:17:07.065+08	2014-04-12 21:17:07.065+08	\N	N	\N
487	severus	127.0.0.1	Y	2014-04-12 21:17:30.705+08	2014-04-12 21:17:30.705+08	\N	N	\N
488	fred	127.0.0.1	Y	2014-04-12 21:19:17.864+08	2014-04-12 21:19:17.864+08	\N	N	\N
489	severus	127.0.0.1	Y	2014-04-12 21:19:36.178+08	2014-04-12 21:19:36.178+08	\N	N	\N
490	fred	127.0.0.1	Y	2014-04-12 21:20:04.216+08	2014-04-12 21:20:04.216+08	\N	N	\N
491	severus	127.0.0.1	Y	2014-04-12 21:23:02.118+08	2014-04-12 21:23:02.118+08	\N	N	\N
492	fred	127.0.0.1	Y	2014-04-12 21:23:28.782+08	2014-04-12 21:23:28.782+08	\N	N	\N
493	fred	127.0.0.1	Y	2014-04-12 21:25:13.118+08	2014-04-12 21:25:13.118+08	\N	N	\N
494	fred	192.168.0.153	Y	2014-04-12 21:25:29.465+08	2014-04-12 21:25:29.465+08	\N	N	\N
495	admin	127.0.0.1	Y	2014-04-12 21:25:56.022+08	2014-04-12 21:25:56.022+08	\N	N	\N
496	fred	127.0.0.1	Y	2014-04-12 21:31:51.145+08	2014-04-12 21:31:51.145+08	\N	N	\N
497	admin	127.0.0.1	Y	2014-04-12 21:32:24.201+08	2014-04-12 21:32:24.201+08	\N	N	\N
498	fred	192.168.0.153	Y	2014-04-12 21:33:34.6+08	2014-04-12 21:33:34.6+08	\N	N	\N
499	albus	192.168.0.153	Y	2014-04-12 21:38:12+08	2014-04-12 21:38:12+08	\N	N	\N
500	fred	192.168.0.153	Y	2014-04-12 21:38:57.223+08	2014-04-12 21:38:57.223+08	\N	N	\N
501	admin	192.168.0.154	Y	2014-04-12 21:39:47.603+08	2014-04-12 21:39:47.603+08	\N	N	\N
502	admin	127.0.0.1	Y	2014-04-12 21:55:31.086+08	2014-04-12 21:55:31.086+08	\N	N	\N
503	severus	192.168.0.153	Y	2014-04-12 22:01:14.589+08	2014-04-12 22:01:14.589+08	\N	N	\N
504	fred	192.168.0.153	Y	2014-04-12 22:02:28.374+08	2014-04-12 22:02:28.374+08	\N	N	\N
505	admin	192.168.0.162	Y	2014-04-12 22:10:45.509+08	2014-04-12 22:10:45.509+08	\N	N	\N
506	esp	127.0.0.1	N	2014-04-12 22:11:29.242+08	2014-04-12 22:11:29.242+08	\N	N	\N
507	admin2	127.0.0.1	Y	2014-04-12 22:11:34.039+08	2014-04-12 22:11:34.039+08	\N	N	\N
509	severus	192.168.0.162	Y	2014-04-12 22:13:08.781+08	2014-04-12 22:13:08.781+08	\N	N	\N
510	admin	127.0.0.1	Y	2014-04-12 22:13:44.308+08	2014-04-12 22:13:44.308+08	\N	N	\N
511	severus	192.168.0.153	Y	2014-04-12 22:20:34.615+08	2014-04-12 22:20:34.615+08	\N	N	\N
512	fred	192.168.0.153	Y	2014-04-12 22:21:49.816+08	2014-04-12 22:21:49.816+08	\N	N	\N
513	albus	192.168.0.162	Y	2014-04-12 22:22:46.948+08	2014-04-12 22:22:46.948+08	\N	N	\N
514	severus	192.168.0.153	Y	2014-04-12 22:22:57.565+08	2014-04-12 22:22:57.565+08	\N	N	\N
515	fred	192.168.0.153	Y	2014-04-12 22:23:26.738+08	2014-04-12 22:23:26.738+08	\N	N	\N
516	severus	192.168.0.162	Y	2014-04-12 22:25:02.444+08	2014-04-12 22:25:02.444+08	\N	N	\N
517	severus	192.168.0.162	Y	2014-04-12 22:47:33.43+08	2014-04-12 22:47:33.43+08	\N	N	\N
518	albus	192.168.0.153	Y	2014-04-12 22:51:34.109+08	2014-04-12 22:51:34.109+08	\N	N	\N
519	fred	192.168.0.162	Y	2014-04-12 22:53:41.292+08	2014-04-12 22:53:41.292+08	\N	N	\N
520	admin	192.168.0.162	Y	2014-04-12 23:23:10.364+08	2014-04-12 23:23:10.364+08	\N	N	\N
522	admin	127.0.0.1	Y	2014-04-12 23:27:13.113+08	2014-04-12 23:27:13.113+08	\N	N	\N
523	granger	127.0.0.1	Y	2014-04-13 11:14:56.236+08	2014-04-13 11:14:56.236+08	\N	N	\N
524	granger	127.0.0.1	Y	2014-04-13 11:15:22.817+08	2014-04-13 11:15:22.817+08	\N	N	\N
525	admin	127.0.0.1	Y	2014-04-13 11:19:09.26+08	2014-04-13 11:19:09.26+08	\N	N	\N
526	granger	127.0.0.1	Y	2014-04-13 11:28:34.253+08	2014-04-13 11:28:34.253+08	\N	N	\N
527	severus	127.0.0.1	Y	2014-04-13 11:29:08.803+08	2014-04-13 11:29:08.803+08	\N	N	\N
528	admin	127.0.0.1	Y	2014-04-13 11:29:58.334+08	2014-04-13 11:29:58.334+08	\N	N	\N
529	granger	127.0.0.1	Y	2014-04-13 11:30:25.549+08	2014-04-13 11:30:25.549+08	\N	N	\N
530	severus	127.0.0.1	Y	2014-04-13 11:37:23.62+08	2014-04-13 11:37:23.62+08	\N	N	\N
531	admin	192.168.0.162	Y	2014-04-13 11:39:12.354+08	2014-04-13 11:39:12.354+08	\N	N	\N
532	granger	127.0.0.1	Y	2014-04-13 11:40:30.375+08	2014-04-13 11:40:30.375+08	\N	N	\N
533	dumbledore	127.0.0.1	N	2014-04-13 11:54:18.751+08	2014-04-13 11:54:18.751+08	\N	N	\N
534	dumbledore	127.0.0.1	Y	2014-04-13 11:54:31.542+08	2014-04-13 11:54:31.542+08	\N	N	\N
535	granger	127.0.0.1	Y	2014-04-13 12:01:38.192+08	2014-04-13 12:01:38.192+08	\N	N	\N
536	admin	127.0.0.1	Y	2014-04-13 12:01:51.77+08	2014-04-13 12:01:51.77+08	\N	N	\N
537	admin2	192.168.0.162	N	2014-04-13 12:02:05.439+08	2014-04-13 12:02:05.439+08	\N	N	\N
538	admin2	192.168.0.162	Y	2014-04-13 12:02:09.514+08	2014-04-13 12:02:09.514+08	\N	N	\N
539	granger	127.0.0.1	Y	2014-04-13 12:08:11.943+08	2014-04-13 12:08:11.943+08	\N	N	\N
540	severus	127.0.0.1	Y	2014-04-13 12:09:47.694+08	2014-04-13 12:09:47.694+08	\N	N	\N
541	dumbledore	127.0.0.1	Y	2014-04-13 12:10:06.82+08	2014-04-13 12:10:06.82+08	\N	N	\N
542	granger	127.0.0.1	Y	2014-04-13 12:13:01.933+08	2014-04-13 12:13:01.933+08	\N	N	\N
547	severus	127.0.0.1	Y	2014-04-13 12:58:01.575+08	2014-04-13 12:58:01.575+08	\N	N	\N
548	dumbledore	127.0.0.1	Y	2014-04-13 12:58:12.345+08	2014-04-13 12:58:12.345+08	\N	N	\N
549	fred	192.168.0.162	Y	2014-04-13 13:00:29.937+08	2014-04-13 13:00:29.937+08	\N	N	\N
550	granger	127.0.0.1	Y	2014-04-13 13:02:35.921+08	2014-04-13 13:02:35.921+08	\N	N	\N
551	admin	192.168.0.154	Y	2014-04-13 13:10:34.467+08	2014-04-13 13:10:34.467+08	\N	N	\N
552	admin	127.0.0.1	Y	2014-04-13 13:16:25.518+08	2014-04-13 13:16:25.518+08	\N	N	\N
553	admin	127.0.0.1	Y	2014-04-13 13:17:17.618+08	2014-04-13 13:17:17.618+08	\N	N	\N
554	admin	192.168.0.154	Y	2014-04-13 13:18:32.181+08	2014-04-13 13:18:32.181+08	\N	N	\N
555	admin	127.0.0.1	Y	2014-04-13 13:18:44.156+08	2014-04-13 13:18:44.156+08	\N	N	\N
556	granger	127.0.0.1	Y	2014-04-13 13:19:01.68+08	2014-04-13 13:19:01.68+08	\N	N	\N
557	granger	127.0.0.1	Y	2014-04-13 13:21:34.54+08	2014-04-13 13:21:34.54+08	\N	N	\N
558	granger	192.168.0.153	Y	2014-04-13 13:24:50.738+08	2014-04-13 13:24:50.738+08	\N	N	\N
559	severus	192.168.0.153	Y	2014-04-13 13:26:48.47+08	2014-04-13 13:26:48.47+08	\N	N	\N
560	albus	192.168.0.153	N	2014-04-13 13:27:04.388+08	2014-04-13 13:27:04.388+08	\N	N	\N
561	albus	192.168.0.153	N	2014-04-13 13:27:16.305+08	2014-04-13 13:27:16.305+08	\N	N	\N
562	granger	192.168.0.153	Y	2014-04-13 13:27:29.26+08	2014-04-13 13:27:29.26+08	\N	N	\N
563	admin	192.168.0.154	Y	2014-04-13 13:29:15.437+08	2014-04-13 13:29:15.437+08	\N	N	\N
564	severus	192.168.0.162	Y	2014-04-13 13:32:31.54+08	2014-04-13 13:32:31.54+08	\N	N	\N
565	admin	127.0.0.1	Y	2014-04-13 13:32:58.209+08	2014-04-13 13:32:58.209+08	\N	N	\N
566	fred	192.168.0.162	Y	2014-04-13 13:32:58.408+08	2014-04-13 13:32:58.408+08	\N	N	\N
567	admin	192.168.0.154	Y	2014-04-13 13:33:33.252+08	2014-04-13 13:33:33.252+08	\N	N	\N
568	admin2	127.0.0.1	Y	2014-04-13 13:33:47.694+08	2014-04-13 13:33:47.694+08	\N	N	\N
569	admin5	192.168.0.154	Y	2014-04-13 13:35:23.067+08	2014-04-13 13:35:23.067+08	\N	N	\N
570	hermoine	127.0.0.1	N	2014-04-13 14:15:44.514+08	2014-04-13 14:15:44.514+08	\N	N	\N
571	admin	127.0.0.1	Y	2014-04-13 14:15:48.019+08	2014-04-13 14:15:48.019+08	\N	N	\N
572	hermione	192.168.0.153	N	2014-04-13 14:15:48.233+08	2014-04-13 14:15:48.233+08	\N	N	\N
573	hermione	127.0.0.1	N	2014-04-13 14:16:06.484+08	2014-04-13 14:16:06.484+08	\N	N	\N
574	hermione	127.0.0.1	N	2014-04-13 14:16:11.821+08	2014-04-13 14:16:11.821+08	\N	N	\N
575	hermione	127.0.0.1	N	2014-04-13 14:16:16.527+08	2014-04-13 14:16:16.527+08	\N	N	\N
576	admin	127.0.0.1	Y	2014-04-13 14:16:19.342+08	2014-04-13 14:16:19.342+08	\N	N	\N
577	hermione	127.0.0.1	N	2014-04-13 14:16:37.641+08	2014-04-13 14:16:37.641+08	\N	N	\N
578	hermione	127.0.0.1	N	2014-04-13 14:16:43.88+08	2014-04-13 14:16:43.88+08	\N	N	\N
579	admin	127.0.0.1	Y	2014-04-13 14:16:46.677+08	2014-04-13 14:16:46.677+08	\N	N	\N
580	fred	192.168.0.153	Y	2014-04-13 14:16:57.328+08	2014-04-13 14:16:57.328+08	\N	N	\N
581	hermione	127.0.0.1	N	2014-04-13 14:17:20.265+08	2014-04-13 14:17:20.265+08	\N	N	\N
582	hermione	127.0.0.1	N	2014-04-13 14:18:46.857+08	2014-04-13 14:18:46.857+08	\N	N	\N
583	admin	127.0.0.1	Y	2014-04-13 14:18:50.537+08	2014-04-13 14:18:50.537+08	\N	N	\N
584	hermione	127.0.0.1	Y	2014-04-13 14:19:32.389+08	2014-04-13 14:19:32.389+08	\N	N	\N
585	hermione	192.168.0.153	Y	2014-04-13 14:27:27.445+08	2014-04-13 14:27:27.445+08	\N	N	\N
586	snape	192.168.0.153	Y	2014-04-13 14:29:28.724+08	2014-04-13 14:29:28.724+08	\N	N	\N
587	admin5	192.168.0.154	Y	2014-04-13 14:32:59.923+08	2014-04-13 14:32:59.923+08	\N	N	\N
588	hermione	192.168.0.153	Y	2014-04-13 14:33:21.485+08	2014-04-13 14:33:21.485+08	\N	N	\N
589	admin2	192.168.0.162	Y	2014-04-13 14:36:59.001+08	2014-04-13 14:36:59.001+08	\N	N	\N
590	snape	192.168.0.153	Y	2014-04-13 14:38:01.407+08	2014-04-13 14:38:01.407+08	\N	N	\N
591	hermione	192.168.0.153	Y	2014-04-13 14:39:50.211+08	2014-04-13 14:39:50.211+08	\N	N	\N
592	admin	127.0.0.1	Y	2014-04-13 14:43:05.777+08	2014-04-13 14:43:05.777+08	\N	N	\N
593	snape	192.168.0.153	Y	2014-04-13 14:43:29.187+08	2014-04-13 14:43:29.187+08	\N	N	\N
594	hermione	192.168.0.153	Y	2014-04-13 14:44:06.411+08	2014-04-13 14:44:06.411+08	\N	N	\N
595	hermione	127.0.0.1	Y	2014-04-13 14:50:58.963+08	2014-04-13 14:50:58.963+08	\N	N	\N
596	admin	127.0.0.1	Y	2014-04-13 14:51:26.63+08	2014-04-13 14:51:26.63+08	\N	N	\N
597	hermione	192.168.0.153	Y	2014-04-13 14:51:37.646+08	2014-04-13 14:51:37.646+08	\N	N	\N
598	hermione	127.0.0.1	Y	2014-04-13 14:52:13.605+08	2014-04-13 14:52:13.605+08	\N	N	\N
599	admin	127.0.0.1	Y	2014-04-13 14:52:31.082+08	2014-04-13 14:52:31.082+08	\N	N	\N
600	fred	192.168.0.162	Y	2014-04-13 14:58:42.826+08	2014-04-13 14:58:42.826+08	\N	N	\N
601	hermione	192.168.0.153	Y	2014-04-13 15:01:47.909+08	2014-04-13 15:01:47.909+08	\N	N	\N
602	admin5	192.168.0.154	Y	2014-04-13 15:04:35.152+08	2014-04-13 15:04:35.152+08	\N	N	\N
603	admin	192.168.0.162	Y	2014-04-13 15:07:30.025+08	2014-04-13 15:07:30.025+08	\N	N	\N
604	snape	192.168.0.153	Y	2014-04-13 15:11:03.218+08	2014-04-13 15:11:03.218+08	\N	N	\N
605	hermione	192.168.0.153	Y	2014-04-13 15:12:09.572+08	2014-04-13 15:12:09.572+08	\N	N	\N
606	admin2	192.168.0.153	Y	2014-04-13 15:17:14.523+08	2014-04-13 15:17:14.523+08	\N	N	\N
607	hermione hermione	192.168.0.153	N	2014-04-13 15:25:28.478+08	2014-04-13 15:25:28.478+08	\N	N	\N
608	hermione	192.168.0.153	Y	2014-04-13 15:25:34.984+08	2014-04-13 15:25:34.984+08	\N	N	\N
609	admin2	192.168.0.153	Y	2014-04-13 15:26:14.965+08	2014-04-13 15:26:14.965+08	\N	N	\N
613	hermoine	192.168.0.162	N	2014-04-13 15:40:20.416+08	2014-04-13 15:40:20.416+08	\N	N	\N
614	hermione	192.168.0.162	Y	2014-04-13 15:40:34.824+08	2014-04-13 15:40:34.824+08	\N	N	\N
616	admin	127.0.0.1	Y	2014-04-13 15:48:36.114+08	2014-04-13 15:48:36.114+08	\N	N	\N
617	hermonie	127.0.0.1	N	2014-04-13 15:49:42.967+08	2014-04-13 15:49:42.967+08	\N	N	\N
618	hermoine	127.0.0.1	N	2014-04-13 15:49:50.919+08	2014-04-13 15:49:50.919+08	\N	N	\N
619	hermione	127.0.0.1	Y	2014-04-13 15:49:59.727+08	2014-04-13 15:49:59.727+08	\N	N	\N
620	fred	192.168.0.162	Y	2014-04-13 15:51:40.475+08	2014-04-13 15:51:40.475+08	\N	N	\N
621	snape	127.0.0.1	N	2014-04-13 15:54:35.139+08	2014-04-13 15:54:35.139+08	\N	N	\N
622	snape	127.0.0.1	Y	2014-04-13 15:54:39.328+08	2014-04-13 15:54:39.328+08	\N	N	\N
623	admin	127.0.0.1	Y	2014-04-13 15:54:55.181+08	2014-04-13 15:54:55.181+08	\N	N	\N
624	snape	127.0.0.1	Y	2014-04-13 15:55:15.882+08	2014-04-13 15:55:15.882+08	\N	N	\N
625	hermonie	127.0.0.1	N	2014-04-13 15:56:23.668+08	2014-04-13 15:56:23.668+08	\N	N	\N
626	hermione	127.0.0.1	Y	2014-04-13 15:56:32.961+08	2014-04-13 15:56:32.961+08	\N	N	\N
627	snape	127.0.0.1	Y	2014-04-13 15:57:49.204+08	2014-04-13 15:57:49.204+08	\N	N	\N
628	hermione	127.0.0.1	Y	2014-04-13 15:58:23.965+08	2014-04-13 15:58:23.965+08	\N	N	\N
629	admin2	127.0.0.1	Y	2014-04-13 16:04:13.04+08	2014-04-13 16:04:13.04+08	\N	N	\N
631	admin2	127.0.0.1	Y	2014-04-13 16:06:10.577+08	2014-04-13 16:06:10.577+08	\N	N	\N
632	fred	192.168.0.100	Y	2014-04-13 16:11:02.81+08	2014-04-13 16:11:02.81+08	\N	N	\N
633	fred	192.168.0.162	Y	2014-04-13 16:12:53.723+08	2014-04-13 16:12:53.723+08	\N	N	\N
634	admin	192.168.0.162	Y	2014-04-13 16:27:08.305+08	2014-04-13 16:27:08.305+08	\N	N	\N
635	admin5	192.168.0.154	Y	2014-04-13 16:32:51.991+08	2014-04-13 16:32:51.991+08	\N	N	\N
636	snape	192.168.0.100	Y	2014-04-13 16:46:46.704+08	2014-04-13 16:46:46.704+08	\N	N	\N
637	hermione	192.168.0.100	Y	2014-04-13 17:05:18.14+08	2014-04-13 17:05:18.14+08	\N	N	\N
638	admin2	192.168.0.100	Y	2014-04-13 17:10:41.536+08	2014-04-13 17:10:41.536+08	\N	N	\N
639	hermione	192.168.0.100	Y	2014-04-13 17:17:24.125+08	2014-04-13 17:17:24.125+08	\N	N	\N
640	snape	192.168.0.100	Y	2014-04-13 17:21:17.892+08	2014-04-13 17:21:17.892+08	\N	N	\N
641	hermione	192.168.0.100	Y	2014-04-13 17:22:23.773+08	2014-04-13 17:22:23.773+08	\N	N	\N
642	fred	192.168.0.162	Y	2014-04-13 17:28:35.173+08	2014-04-13 17:28:35.173+08	\N	N	\N
643	severus	192.168.0.162	N	2014-04-13 17:30:52.748+08	2014-04-13 17:30:52.748+08	\N	N	\N
644	severus	192.168.0.162	N	2014-04-13 17:31:00.213+08	2014-04-13 17:31:00.213+08	\N	N	\N
645	snape	192.168.0.162	Y	2014-04-13 17:31:06.738+08	2014-04-13 17:31:06.738+08	\N	N	\N
646	dumbledore	192.168.0.162	Y	2014-04-13 17:31:56.019+08	2014-04-13 17:31:56.019+08	\N	N	\N
647	snape	192.168.0.162	Y	2014-04-13 17:32:59.352+08	2014-04-13 17:32:59.352+08	\N	N	\N
648	dumbledore	192.168.0.162	Y	2014-04-13 17:33:33.126+08	2014-04-13 17:33:33.126+08	\N	N	\N
649	fred	192.168.0.162	Y	2014-04-13 17:38:57.876+08	2014-04-13 17:38:57.876+08	\N	N	\N
650	dumbledore	192.168.0.162	Y	2014-04-13 17:40:30.22+08	2014-04-13 17:40:30.22+08	\N	N	\N
651	snape	192.168.0.162	Y	2014-04-13 17:42:52.93+08	2014-04-13 17:42:52.93+08	\N	N	\N
653	snape	192.168.0.108	Y	2014-04-13 18:06:16.424+08	2014-04-13 18:06:16.424+08	\N	N	\N
654	snape	192.168.0.100	Y	2014-04-13 18:06:19.297+08	2014-04-13 18:06:19.297+08	\N	N	\N
655	snape	192.168.0.100	Y	2014-04-13 18:06:55.695+08	2014-04-13 18:06:55.695+08	\N	N	\N
656	admin2	192.168.0.108	Y	2014-04-13 18:07:30.374+08	2014-04-13 18:07:30.374+08	\N	N	\N
657	hermione	192.168.0.100	Y	2014-04-13 18:07:37.572+08	2014-04-13 18:07:37.572+08	\N	N	\N
658	hermione	127.0.0.1	Y	2014-04-13 18:10:22.419+08	2014-04-13 18:10:22.419+08	\N	N	\N
665	hermione	127.0.0.1	Y	2014-04-13 18:34:52.988+08	2014-04-13 18:34:52.988+08	\N	N	\N
666	snape	192.168.0.108	Y	2014-04-13 18:36:55.29+08	2014-04-13 18:36:55.29+08	\N	N	\N
667	snape	127.0.0.1	Y	2014-04-13 18:41:33.737+08	2014-04-13 18:41:33.737+08	\N	N	\N
668	admin	127.0.0.1	Y	2014-04-13 18:41:45.884+08	2014-04-13 18:41:45.884+08	\N	N	\N
669	admin2	192.168.0.108	Y	2014-04-13 18:41:56.703+08	2014-04-13 18:41:56.703+08	\N	N	\N
670	snape	127.0.0.1	Y	2014-04-13 18:42:25.943+08	2014-04-13 18:42:25.943+08	\N	N	\N
671	hermione	127.0.0.1	Y	2014-04-13 18:43:01.697+08	2014-04-13 18:43:01.697+08	\N	N	\N
672	snape	127.0.0.1	Y	2014-04-13 18:44:03.958+08	2014-04-13 18:44:03.958+08	\N	N	\N
673	hermione	127.0.0.1	Y	2014-04-13 18:45:03.087+08	2014-04-13 18:45:03.087+08	\N	N	\N
675	dumbledore	127.0.0.1	Y	2014-04-13 18:52:36.742+08	2014-04-13 18:52:36.742+08	\N	N	\N
676	admin5	192.168.0.108	N	2014-04-13 18:56:12.027+08	2014-04-13 18:56:12.027+08	\N	N	\N
677	admin5	192.168.0.108	N	2014-04-13 18:56:15.181+08	2014-04-13 18:56:15.181+08	\N	N	\N
678	admin2	192.168.0.108	Y	2014-04-13 18:56:20.99+08	2014-04-13 18:56:20.99+08	\N	N	\N
679	hermonie	127.0.0.1	N	2014-04-13 19:02:47.772+08	2014-04-13 19:02:47.772+08	\N	N	\N
680	hermione	127.0.0.1	Y	2014-04-13 19:02:54.141+08	2014-04-13 19:02:54.141+08	\N	N	\N
681	dumbledore	127.0.0.1	Y	2014-04-13 19:20:07.634+08	2014-04-13 19:20:07.634+08	\N	N	\N
682	hermione	127.0.0.1	Y	2014-04-13 19:20:34.295+08	2014-04-13 19:20:34.295+08	\N	N	\N
\.


--
-- Name: fcuserlogin_ul_id_seq; Type: SEQUENCE SET; Schema: shine; Owner: shine
--

SELECT pg_catalog.setval('fcuserlogin_ul_id_seq', 682, true);


--
-- Data for Name: fcuserorgrole; Type: TABLE DATA; Schema: shine; Owner: shine
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
30	fred	1	12	1
32	albus	1	11	1
35	granger	1	12	1
36	harry	1	12	1
37	severus	1	13	1
38	dumbledore	1	11	1
40	admin5	1	10	1
41	snape	1	13	1
44	hermione 	1	12	1
45	hermione	1	12	1
\.


--
-- Name: fcuserorgrole_uor_id_seq; Type: SEQUENCE SET; Schema: shine; Owner: shine
--

SELECT pg_catalog.setval('fcuserorgrole_uor_id_seq', 45, true);


--
-- Data for Name: fcusersession; Type: TABLE DATA; Schema: shine; Owner: shine
--

COPY fcusersession (us_id, us_sessid, us_userid, us_ip, us_active, us_created, us_last_active, us_forcecloseby, last_modified_date, last_synchronized_date, record_synchronized, cloud_refid) FROM stdin;
408	1kkbhl72fl7lktmld4p5d10os0	ironman@gmail.com	127.0.0.1	Y	2014-02-17 15:31:34.882+08	2014-02-17 15:31:34+08	\N	2014-02-17 15:31:34.882+08	\N	N	\N
628	sv480ek75lbs718iblj86bo3d2	admin2	192.168.0.108	Y	2014-04-13 18:56:20.999+08	2014-04-13 18:56:20+08	\N	2014-04-13 18:56:20.999+08	\N	N	\N
589	tker7gfbse0fu38g8ifiu5vr32	admin5	192.168.0.154	Y	2014-04-13 16:32:52.009+08	2014-04-13 16:32:52+08	\N	2014-04-13 16:32:52.009+08	\N	N	\N
\.


--
-- Name: fcusersession_us_id_seq; Type: SEQUENCE SET; Schema: shine; Owner: shine
--

SELECT pg_catalog.setval('fcusersession_us_id_seq', 631, true);


--
-- Data for Name: shactivity; Type: TABLE DATA; Schema: shine; Owner: shine
--

COPY shactivity (atv_id, atv_pkid, atv_name, atv_description, atv_max_enrolment, atv_status, atv_prerequisite_atvid) FROM stdin;
26	25	Conflict Resolution Training Course	<blockquote>\r\n<p>Don&#39;t let conflict stand between you and your professional or personal growth. Gain the expertise to manage and resolve conflict in productive ways.</p>\r\n</blockquote>\r\n\r\n<h2 style="margin: 12px 0px 0px; font-family: 'Open Sans', Arial, Helvetica, sans-serif; line-height: 20px; text-rendering: optimizelegibility; font-size: 20px; padding: 0px; clear: left;">Course overview</h2>\r\n\r\n<p style="margin: 12px 0px 0px; padding: 0px; line-height: 1.5em; font-family: 'Open Sans', Arial, Helvetica, sans-serif; font-size: 12px;">Conflict is inevitable, in the workplace and in life, but it doesn&rsquo;t have to stand between you and your professional or personal growth. Anyone can gain the expertise to manage and resolve conflict in productive ways. This course will provide you with an understanding of the causes, stages and behaviours surrounding conflict in the workplace, as well as steps and strategies for resolving positive outcomes.</p>\r\n\r\n<h2 style="margin: 12px 0px 0px; font-family: 'Open Sans', Arial, Helvetica, sans-serif; line-height: 20px; text-rendering: optimizelegibility; font-size: 20px; padding: 0px; clear: left;">This course is ideal for</h2>\r\n\r\n<p style="margin: 12px 0px 0px; padding: 0px; line-height: 1.5em; font-family: 'Open Sans', Arial, Helvetica, sans-serif; font-size: 12px;">Anyone who is confronted by difficult situations in the workplace and is required to effectively manage conflict.</p>\r\n\r\n<h2 style="margin: 12px 0px 0px; font-family: 'Open Sans', Arial, Helvetica, sans-serif; line-height: 20px; text-rendering: optimizelegibility; font-size: 20px; padding: 0px; clear: left;">Learning outcomes</h2>\r\n\r\n<div style="margin: 0px; padding: 0px; font-family: 'Open Sans', Arial, Helvetica, sans-serif; font-size: 12px; line-height: 14.77199935913086px;">\r\n<ul style="padding-right: 0px; padding-left: 0px; margin: 0px 0px 12px; list-style: none; line-height: normal;">\r\n\t<li class="jsmod" style="line-height: 1.5; margin: 8px 0px 0px; padding: 0px 0px 0px 21px; list-style: none; background-color: transparent; background-position: initial initial; background-repeat: initial initial;"><span style="line-height: 1.3em;">Identify major factors that contribute to conflict.</span></li>\r\n\t<li class="jsmod" style="line-height: 1.5; margin: 8px 0px 0px; padding: 0px 0px 0px 21px; list-style: none; background-color: transparent; background-position: initial initial; background-repeat: initial initial;"><span style="line-height: 1.3em;">Recognise early warning signs of deteriorating workplace relationships.</span></li>\r\n\t<li class="jsmod" style="line-height: 1.5; margin: 8px 0px 0px; padding: 0px 0px 0px 21px; list-style: none; background-color: transparent; background-position: initial initial; background-repeat: initial initial;"><span style="line-height: 1.3em;">Implement appropriate initial responses to workplace conflict and disputes.</span></li>\r\n\t<li class="jsmod" style="line-height: 1.5; margin: 8px 0px 0px; padding: 0px 0px 0px 21px; list-style: none; background-color: transparent; background-position: initial initial; background-repeat: initial initial;"><span style="line-height: 1.3em;">Identify factors that can impact on your ability to deal with conflict.</span></li>\r\n\t<li class="jsmod" style="line-height: 1.5; margin: 8px 0px 0px; padding: 0px 0px 0px 21px; list-style: none; background-color: transparent; background-position: initial initial; background-repeat: initial initial;"><span style="line-height: 1.3em;">Resolve conflict with the six-step method.</span></li>\r\n</ul>\r\n</div>\r\n\r\n<div style="margin: 0px; padding: 0px; font-family: 'Open Sans', Arial, Helvetica, sans-serif; font-size: 12px; line-height: 14.77199935913086px;">&nbsp;</div>\r\n	2	ACTIVE	\N
15	8	Discovering the secrets of self confidence	<p>Discovering the secrets of self confidence</p>\r\n	3	ACTIVE	\N
28	25	Creative Thinking and Problem Solving Training Course	<blockquote>\r\n<p>Creativity does not just happen on its own. Extend your toolkit of skills and techniques to encourage creativity, drive innovation and fuel growth.</p>\r\n</blockquote>\r\n\r\n<h2 style="margin: 12px 0px 0px; font-family: 'Open Sans', Arial, Helvetica, sans-serif; line-height: 20px; text-rendering: optimizelegibility; font-size: 20px; padding: 0px; clear: left;">Course overview</h2>\r\n\r\n<p style="margin: 12px 0px 0px; padding: 0px; line-height: 1.5em; font-family: 'Open Sans', Arial, Helvetica, sans-serif; font-size: 12px;">Creativity is an organisation&rsquo;s lifeblood, driving the innovations that fuel growth and revitalise processes. But, creativity does not just happen on its own.</p>\r\n\r\n<p style="margin: 12px 0px 0px; padding: 0px; line-height: 1.5em; font-family: 'Open Sans', Arial, Helvetica, sans-serif; font-size: 12px;">Whether you are part of a team or leading an entire workforce, you have the power to greatly enhance or completely drain the ability to &lsquo;think creativity&rsquo; from your team. This course will introduce you to the &lsquo;art and science&rsquo; of creative thinking by developing rational and logical thinking tools and techniques for decision making, problem solving, risk management and harnessing opportunities.</p>\r\n\r\n<h2 style="margin: 12px 0px 0px; font-family: 'Open Sans', Arial, Helvetica, sans-serif; line-height: 20px; text-rendering: optimizelegibility; font-size: 20px; padding: 0px; clear: left;">This course is ideal for</h2>\r\n\r\n<p style="margin: 12px 0px 0px; padding: 0px; line-height: 1.5em; font-family: 'Open Sans', Arial, Helvetica, sans-serif; font-size: 12px;">Suitable for managers, supervisors, team leaders or anyone who needs to develop their creative thinking skills to develop new ideas and resolve problems.</p>\r\n\r\n<h2 style="margin: 12px 0px 0px; font-family: 'Open Sans', Arial, Helvetica, sans-serif; line-height: 20px; text-rendering: optimizelegibility; font-size: 20px; padding: 0px; clear: left;">Learning outcomes</h2>\r\n\r\n<div style="margin: 0px; padding: 0px; font-family: 'Open Sans', Arial, Helvetica, sans-serif; font-size: 12px; line-height: 14.77199935913086px;">\r\n<ul style="padding-right: 0px; padding-left: 0px; margin: 0px 0px 12px; list-style: none; line-height: normal;">\r\n\t<li class="jsmod" style="line-height: 1.5; margin: 8px 0px 0px; padding: 0px 0px 0px 21px; list-style: none; background-color: transparent; background-position: initial initial; background-repeat: initial initial;"><span style="line-height: 1.3em;">Know and understand the principles of creative thinking using the creative process.</span></li>\r\n\t<li class="jsmod" style="line-height: 1.5; margin: 8px 0px 0px; padding: 0px 0px 0px 21px; list-style: none; background-color: transparent; background-position: initial initial; background-repeat: initial initial;"><span style="line-height: 1.3em;">Understand right brain vs left brain and how we use them differently.</span></li>\r\n\t<li class="jsmod" style="line-height: 1.5; margin: 8px 0px 0px; padding: 0px 0px 0px 21px; list-style: none; background-color: transparent; background-position: initial initial; background-repeat: initial initial;"><span style="line-height: 1.3em;">Follow the steps and use a structured, sequential approach to creative problem solving.</span></li>\r\n\t<li class="jsmod" style="line-height: 1.5; margin: 8px 0px 0px; padding: 0px 0px 0px 21px; list-style: none; background-color: transparent; background-position: initial initial; background-repeat: initial initial;"><span style="line-height: 1.3em;">Use practical tools to break monotony and enjoy finding solutions.</span></li>\r\n</ul>\r\n</div>\r\n\r\n<h2 id="topics-header" style="margin: 12px 0px 0px; font-family: 'Open Sans', Arial, Helvetica, sans-serif; line-height: 20px; text-rendering: optimizelegibility; font-size: 20px; padding: 0px; clear: left;">&nbsp;</h2>\r\n	2	ACTIVE	\N
29	12	Emotional Intelligence – the Leading Priority Training Course	<blockquote>\r\n<p>Being aware of other&#39; emotions is critical to build a sucessful workplace enviroment. Build quality interpersonal relationships by recogising your own feelings and those of others.</p>\r\n</blockquote>\r\n\r\n<h2 style="margin: 12px 0px 0px; font-family: 'Open Sans', Arial, Helvetica, sans-serif; line-height: 20px; text-rendering: optimizelegibility; font-size: 20px; padding: 0px; clear: left;">Course overview</h2>\r\n\r\n<p style="margin: 12px 0px 0px; padding: 0px; line-height: 1.5em; font-family: 'Open Sans', Arial, Helvetica, sans-serif; font-size: 12px;">Emotionally intelligent leaders inspire passion and enthusiasm, take action to solve problems, and have the ability to cope with change. This comprehensive course will enhance your interpersonal relationships through increased self-awareness and the ability to recognise your own emotional state and that of others.</p>\r\n\r\n<h2 style="margin: 12px 0px 0px; font-family: 'Open Sans', Arial, Helvetica, sans-serif; line-height: 20px; text-rendering: optimizelegibility; font-size: 20px; padding: 0px; clear: left;">This course is ideal for</h2>\r\n\r\n<p style="margin: 12px 0px 0px; padding: 0px; line-height: 1.5em; font-family: 'Open Sans', Arial, Helvetica, sans-serif; font-size: 12px;">Senior team members, supervisors and managers who want to improve their personal and professional lives.</p>\r\n\r\n<h2 style="margin: 12px 0px 0px; font-family: 'Open Sans', Arial, Helvetica, sans-serif; line-height: 20px; text-rendering: optimizelegibility; font-size: 20px; padding: 0px; clear: left;">Learning outcomes</h2>\r\n\r\n<div style="margin: 0px; padding: 0px; font-family: 'Open Sans', Arial, Helvetica, sans-serif; font-size: 12px; line-height: 14.77199935913086px;">\r\n<ul style="padding-right: 0px; padding-left: 0px; margin: 0px 0px 12px; list-style: none; line-height: normal;">\r\n\t<li class="jsmod" style="line-height: 1.5; margin: 8px 0px 0px; padding: 0px 0px 0px 21px; list-style: none; background-color: transparent; background-position: initial initial; background-repeat: initial initial;"><span style="line-height: 1.3em;">Recognise the difference between interpersonal skills, which are observable, and intrapersonal skills, which are invisible to everyone except you.</span></li>\r\n\t<li class="jsmod" style="line-height: 1.5; margin: 8px 0px 0px; padding: 0px 0px 0px 21px; list-style: none; background-color: transparent; background-position: initial initial; background-repeat: initial initial;"><span style="line-height: 1.3em;">Understanding the relationship between EI and leadership.</span></li>\r\n\t<li class="jsmod" style="line-height: 1.5; margin: 8px 0px 0px; padding: 0px 0px 0px 21px; list-style: none; background-color: transparent; background-position: initial initial; background-repeat: initial initial;"><span style="line-height: 1.3em;">Identify the positive and negative emotions associated with leadership.</span></li>\r\n\t<li class="jsmod" style="line-height: 1.5; margin: 8px 0px 0px; padding: 0px 0px 0px 21px; list-style: none; background-color: transparent; background-position: initial initial; background-repeat: initial initial;"><span style="line-height: 1.3em;">Understand how tuning into your senses will increase your self-awareness so you can see yourself as others see you.</span></li>\r\n\t<li class="jsmod" style="line-height: 1.5; margin: 8px 0px 0px; padding: 0px 0px 0px 21px; list-style: none; background-color: transparent; background-position: initial initial; background-repeat: initial initial;"><span style="line-height: 1.3em;">Transition through change by understanding your responses and implementing tools to help you cope.</span></li>\r\n</ul>\r\n\r\n<h2 style="margin: 12px 0px 0px; font-family: inherit; line-height: 20px; text-rendering: optimizelegibility; font-size: 20px; padding: 0px; clear: left;">Emotional Intelligence Questionnaire</h2>\r\n\r\n<p style="margin: 12px 0px 0px; padding: 0px; line-height: 1.5em;"><span style="line-height: 1.3em;">Prior to attending training participants are asked to complete an EIQ16 online&nbsp;</span><span style="line-height: 1.3em;">questionnaire. It measures your ability to accurately perceive emotions in yourself and&nbsp;</span><span style="line-height: 1.3em;">others, use emotions to facilitate thinking, and understand and manage emotions.</span></p>\r\n</div>\r\n\r\n<h2 id="topics-header" style="margin: 12px 0px 0px; font-family: 'Open Sans', Arial, Helvetica, sans-serif; line-height: 20px; text-rendering: optimizelegibility; font-size: 20px; padding: 0px; clear: left;">&nbsp;</h2>\r\n	2	ACTIVE	\N
14	8	Effective Time Management 	<h2 style="margin: 10px 0px 0px; padding: 0px; border: 0px; font-family: MyriadPro-Regular, Candara, Verdana, sans-serif; font-size: 18px; line-height: 25px; vertical-align: baseline; color: rgb(10, 135, 186); letter-spacing: -0.03em; text-rendering: optimizelegibility;">Overview</h2>\r\n\r\n<p style="margin: 0px 0px 10px; padding: 0px 0px 10px; border: 0px; font-family: MyriadPro-Regular, Candara, Verdana, sans-serif; font-size: 14px; line-height: 20px; vertical-align: baseline;">In this course, you will practice techniques that will help you achieve more effective use of your time so that your energy can be directed towards the activities that will further your professional and personal goals.</p>\r\n\r\n<h2 style="margin: 10px 0px 0px; padding: 0px; border: 0px; font-family: MyriadPro-Regular, Candara, Verdana, sans-serif; font-size: 18px; line-height: 25px; vertical-align: baseline; color: rgb(10, 135, 186); letter-spacing: -0.03em; text-rendering: optimizelegibility;">Who Should Attend</h2>\r\n\r\n<p style="margin: 0px 0px 10px; padding: 0px 0px 10px; border: 0px; font-family: MyriadPro-Regular, Candara, Verdana, sans-serif; font-size: 14px; line-height: 20px; vertical-align: baseline;">Anyone who are seeking improved time-management skills so that they can perform more effectively.</p>\r\n\r\n<h2 style="margin: 10px 0px 0px; padding: 0px; border: 0px; font-family: MyriadPro-Regular, Candara, Verdana, sans-serif; font-size: 18px; line-height: 25px; vertical-align: baseline; color: rgb(10, 135, 186); letter-spacing: -0.03em; text-rendering: optimizelegibility;">Course Objectives</h2>\r\n\r\n<p style="margin: 0px 0px 10px; padding: 0px 0px 10px; border: 0px; font-family: MyriadPro-Regular, Candara, Verdana, sans-serif; font-size: 14px; line-height: 20px; vertical-align: baseline;">Upon successful completion of this course, you will be able to:</p>\r\n\r\n<ul>\r\n\t<li style="margin: 0px; padding: 0px; border: 0px; font-family: MyriadPro-Regular, Candara, Verdana, sans-serif; font-size: 14px; line-height: 20px; vertical-align: baseline;">articulate your goals.</li>\r\n\t<li style="margin: 0px; padding: 0px; border: 0px; font-family: MyriadPro-Regular, Candara, Verdana, sans-serif; font-size: 14px; line-height: 20px; vertical-align: baseline;">analyze how you are currently allocating your most precious resources: energy and time.</li>\r\n\t<li style="margin: 0px; padding: 0px; border: 0px; font-family: MyriadPro-Regular, Candara, Verdana, sans-serif; font-size: 14px; line-height: 20px; vertical-align: baseline;">identify elements of your personal work style that contribute to your effective use of time.</li>\r\n\t<li style="margin: 0px; padding: 0px; border: 0px; font-family: MyriadPro-Regular, Candara, Verdana, sans-serif; font-size: 14px; line-height: 20px; vertical-align: baseline;">assemble a collection of time-management tools and strategies that you can use to take control of your time.</li>\r\n\t<li style="margin: 0px; padding: 0px; border: 0px; font-family: MyriadPro-Regular, Candara, Verdana, sans-serif; font-size: 14px; line-height: 20px; vertical-align: baseline;">create an action plan for your time-management process and identify ways to evaluate and improve your efforts.</li>\r\n</ul>\r\n	3	ACTIVE	\N
18	9	Cross cultural communication	<p>Advanced communication skills</p>\r\n	3	ACTIVE	\N
13	5	Effective communication	<p>Effective communication</p>\r\n	3	ACTIVE	\N
17	8	Unleash your potential	<p>Unleash your potential</p>\r\n	3	ACTIVE	\N
16	8	Making an impact at meetings	<p>Making an impact at meetings</p>\r\n	3	ACTIVE	\N
1	5	Present like Steve Jobs	<p>Present like Steve Jobs</p>\r\n	3	ACTIVE	\N
2	5	Micrsoft power point 2013 training	<p>Personal skill development</p>\r\n	3	ACTIVE	\N
20	12	IMPACT & INFLUENCE	<p>Give your presentations extra impact &amp; influence within half day.</p>\r\n\r\n<p>We have trained over 20,000 people accross 45 countries, so you can be assured that this training is proven to give you results. Clients include IBM, Virgin, KPMG, Molton Brown, Cambridge University, Orange and Barclaycard.</p>\r\n\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-family: 'Lucida Grande', 'Lucida Sans Unicode', sans-serif; font-size: 12px; line-height: 18px; vertical-align: baseline;">Do you want to have more presence, authority and influence to persuade people with your ideas? If you want to speak with impact and confidence this session is for you. Gain professional presentation skills in this highly interactive training workshop.</p>\r\n\r\n<h3 style="margin: 0px; padding: 10px 0px 5px; border: 0px; font-family: hypatia-sans-pro, sans-serif; font-size: 19px; font-weight: inherit; vertical-align: baseline; text-transform: uppercase; color: rgb(102, 51, 153);">WHAT WILL YOU GAIN?</h3>\r\n\r\n<ul class="tick-list" style="margin: 0px; padding: 5px 0px 10px 30px; border: 0px; font-family: 'Lucida Grande', 'Lucida Sans Unicode', sans-serif; font-size: 12px; line-height: 18px; vertical-align: baseline; list-style: outside;">\r\n\t<li style="margin: 0px; padding: 0px 0px 10px 30px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; background-image: url(http://www.ukbodytalk.com/assets/images/tick-2.gif); list-style: none; color: rgb(102, 51, 153); background-position: initial initial; background-repeat: no-repeat no-repeat;">Create a more compelling communication style, with techniques used by professional speakers, to gain buy-in for your ideas</li>\r\n\t<li style="margin: 0px; padding: 0px 0px 10px 30px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; background-image: url(http://www.ukbodytalk.com/assets/images/tick-2.gif); list-style: none; color: rgb(102, 51, 153); background-position: initial initial; background-repeat: no-repeat no-repeat;">Scripting and story-telling methods that make everything you say more persuasive and memorable</li>\r\n\t<li style="margin: 0px; padding: 0px 0px 10px 30px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; background-image: url(http://www.ukbodytalk.com/assets/images/tick-2.gif); list-style: none; color: rgb(102, 51, 153); background-position: initial initial; background-repeat: no-repeat no-repeat;">Practical exercises that show you exactly how to apply all of these techniques to your everyday work, so that you can put these skills into action right away</li>\r\n\t<li style="margin: 0px; padding: 0px 0px 10px 30px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; background-image: url(http://www.ukbodytalk.com/assets/images/tick-2.gif); list-style: none; color: rgb(102, 51, 153); background-position: initial initial; background-repeat: no-repeat no-repeat;">Simple strategies for you to look and feel more confident, with examples taken from actors, news readers and Presidents</li>\r\n\t<li style="margin: 0px; padding: 0px 0px 10px 30px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; background-image: url(http://www.ukbodytalk.com/assets/images/tick-2.gif); list-style: none; color: rgb(102, 51, 153); background-position: initial initial; background-repeat: no-repeat no-repeat;">Free online videos to continue learning the skills after the training session</li>\r\n</ul>\r\n\r\n<h3 style="margin: 0px; padding: 10px 0px 5px; border: 0px; font-family: hypatia-sans-pro, sans-serif; font-size: 19px; font-weight: inherit; vertical-align: baseline; text-transform: uppercase; color: rgb(102, 51, 153);">WHAT TO EXPECT ON THE DAY</h3>\r\n\r\n<ul style="margin: 0px; padding: 5px 0px 10px 30px; border: 0px; font-family: 'Lucida Grande', 'Lucida Sans Unicode', sans-serif; font-size: 12px; line-height: 18px; vertical-align: baseline; list-style: outside;">\r\n\t<li style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline;">You can arrive from 8.45am to enjoy tea and coffee and take your seat.</li>\r\n\t<li style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline;">The training is highly interactive, so that you learn as much as possible and start trying out new techniques straight away.</li>\r\n\t<li style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline;">Don&rsquo;t worry - you won&rsquo;t be put on the spot or asked to do a presentation, instead the whole group will try out activities together, so that you enjoy the whole experience.</li>\r\n\t<li style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline;">You will develop your personal business presentation style during the session, with practical activities, giving you techniques that you can use immediately back at work.</li>\r\n\t<li style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline;">You will also write a presentation, using the scripting techniques you&rsquo;ll learn on the course, giving you everything you need to give presentations with greater confidence, impact and influence.</li>\r\n\t<li style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline;">You will be sat at round tables, so that you can make notes on everything you are learning</li>\r\n\t<li style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline;">A few people will even gain the chance for personal coaching at the end of the session, to put everything into practise. You can volunteer for this on the day, if you wish</li>\r\n\t<li style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline;">Plus you can gain access to online training videos after the course to keep learning and reminding yourself of the key principles</li>\r\n</ul>\r\n\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-family: 'Lucida Grande', 'Lucida Sans Unicode', sans-serif; font-size: 12px; line-height: 18px; vertical-align: baseline;">We genuinely feel we have packed a huge amount of value into this short session to give you immediate results. We even offer a full money-back guarantee if you don&rsquo;t feel the session was valuable. Nobody has ever asked for this! In fact most people tell us they gained much more value than they expected.<br />\r\n<br />\r\nWe look forward to meeting you and working with you on the day. Just book your place today and we will send through a confirmation and final details before the event.</p>\r\n	3	ACTIVE	2
30	12	Resilience & Stress Management Training	<blockquote>\r\n<p>Resilience isn&#39;t about toughing it and ignoring feelings. Learn how to build resilience by adapting to stressful situations - It&#39;s about knowing yourself, your stressors, and when to reach out to others.</p>\r\n</blockquote>\r\n\r\n<h2 style="margin: 12px 0px 0px; font-family: 'Open Sans', Arial, Helvetica, sans-serif; line-height: 20px; text-rendering: optimizelegibility; font-size: 20px; padding: 0px; clear: left;">Course overview</h2>\r\n\r\n<p style="margin: 12px 0px 0px; padding: 0px; line-height: 1.5em; font-family: 'Open Sans', Arial, Helvetica, sans-serif; font-size: 12px;">Resilience is the positive adaptation by individuals, despite their experiences of significant stress, change or adversity. Emotional resilience isn&rsquo;t about toughing it and ignoring feelings. It&rsquo;s about knowing yourself, your stressors, and when to reach out to others.</p>\r\n\r\n<p style="margin: 12px 0px 0px; padding: 0px; line-height: 1.5em; font-family: 'Open Sans', Arial, Helvetica, sans-serif; font-size: 12px;">This course will provide you with the ability to identify characteristics of resilient people, as well as practical tools and techniques you can implement to help you take control, increase your resilience and minimise stress.</p>\r\n\r\n<h2 style="margin: 12px 0px 0px; font-family: 'Open Sans', Arial, Helvetica, sans-serif; line-height: 20px; text-rendering: optimizelegibility; font-size: 20px; padding: 0px; clear: left;">This course is ideal for</h2>\r\n\r\n<p style="margin: 12px 0px 0px; padding: 0px; line-height: 1.5em; font-family: 'Open Sans', Arial, Helvetica, sans-serif; font-size: 12px;">Anyone who wants to learn techniques to build their resilience to adapt to stressful situations or events in the workplace.</p>\r\n\r\n<h2 style="margin: 12px 0px 0px; font-family: 'Open Sans', Arial, Helvetica, sans-serif; line-height: 20px; text-rendering: optimizelegibility; font-size: 20px; padding: 0px; clear: left;">Learning outcomes</h2>\r\n\r\n<div style="margin: 0px; padding: 0px; font-family: 'Open Sans', Arial, Helvetica, sans-serif; font-size: 12px; line-height: 14.77199935913086px;">\r\n<ul style="padding-right: 0px; padding-left: 0px; margin: 0px 0px 12px; list-style: none; line-height: normal;">\r\n\t<li class="jsmod" style="line-height: 1.5; margin: 8px 0px 0px; padding: 0px 0px 0px 21px; list-style: none; background-color: transparent; background-position: initial initial; background-repeat: initial initial;"><span style="line-height: 1.3em;">Identify what decreases your resilience and the coping resources you can implement.</span></li>\r\n\t<li class="jsmod" style="line-height: 1.5; margin: 8px 0px 0px; padding: 0px 0px 0px 21px; list-style: none; background-color: transparent; background-position: initial initial; background-repeat: initial initial;"><span style="line-height: 1.3em;">Understand how focus and goal setting can help improve your effectiveness.</span></li>\r\n\t<li class="jsmod" style="line-height: 1.5; margin: 8px 0px 0px; padding: 0px 0px 0px 21px; list-style: none; background-color: transparent; background-position: initial initial; background-repeat: initial initial;"><span style="line-height: 1.3em;">Maximise your ability to mentally prepare and plan for positive action.</span></li>\r\n\t<li class="jsmod" style="line-height: 1.5; margin: 8px 0px 0px; padding: 0px 0px 0px 21px; list-style: none; background-color: transparent; background-position: initial initial; background-repeat: initial initial;"><span style="line-height: 1.3em;">Safeguard against stress by identifying your stressors and learn techniques to deal with stressful situations and events.</span></li>\r\n</ul>\r\n</div>\r\n\r\n<h2 id="topics-header" style="margin: 12px 0px 0px; font-family: 'Open Sans', Arial, Helvetica, sans-serif; line-height: 20px; text-rendering: optimizelegibility; font-size: 20px; padding: 0px; clear: left;"><br />\r\n&nbsp;</h2>\r\n	2	ACTIVE	\N
19	9	Body language tips	<h3 style="font-style: italic;">Body language is a form of communication, and it&nbsp;needs to be practiced like any other form of communication. It is essential to understand the&nbsp;body language of others and exactly what your own body is communicating.</h3>\r\n\r\n<p>In this course participants will:</p>\r\n\r\n<ul>\r\n\t<li><span style="line-height: 1.6;">Learn how to translate genstures into words</span></li>\r\n\t<li><span style="line-height: 1.6;">Understand the difference between open &amp; closed body language</span></li>\r\n\t<li><span style="line-height: 1.6;">Learn how to avoid common body language mistakes</span></li>\r\n\t<li><span style="line-height: 1.6;">Gain insight into the differences in body language between genders</span></li>\r\n\t<li><span style="line-height: 1.6;">Understand the signals you&#39;re sending to others</span></li>\r\n\t<li><span style="line-height: 1.6;">Learn the role facial expressions play in body language</span></li>\r\n\t<li><span style="line-height: 1.6;">Learn how to use body language to strengthen your negotiations</span></li>\r\n\t<li><span style="line-height: 1.6;">Understand how body language can expose deception</span></li>\r\n\t<li><span style="line-height: 1.6;">Learn how to match words with movement to instill trust</span></li>\r\n</ul>\r\n	3	ACTIVE	\N
27	25	Coping with Change – Making the Transition Training Course	<blockquote>\r\n<p>Change usually means moving away from the familiar and towards the unknown. Learn to adapt and deal with the stress caused by change for the best possible outcome.</p>\r\n</blockquote>\r\n\r\n<h2 style="margin: 12px 0px 0px; font-family: 'Open Sans', Arial, Helvetica, sans-serif; line-height: 20px; text-rendering: optimizelegibility; font-size: 20px; padding: 0px; clear: left;">Course overview</h2>\r\n\r\n<p style="margin: 12px 0px 0px; padding: 0px; line-height: 1.5em; font-family: 'Open Sans', Arial, Helvetica, sans-serif; font-size: 12px;">Change occurs when something ends and something new or different begins. It usually means moving away from the familiar and towards the unknown, which can be very stressful for some people. The time between these two points is called the transition, where people have to learn to let go of the old and take on the new &ndash; therefore, change always involves some type of loss.</p>\r\n\r\n<h2 style="margin: 12px 0px 0px; font-family: 'Open Sans', Arial, Helvetica, sans-serif; line-height: 20px; text-rendering: optimizelegibility; font-size: 20px; padding: 0px; clear: left;">This course is ideal for</h2>\r\n\r\n<p style="margin: 12px 0px 0px; padding: 0px; line-height: 1.5em; font-family: 'Open Sans', Arial, Helvetica, sans-serif; font-size: 12px;">Team Members going through change at work.</p>\r\n\r\n<h2 style="margin: 12px 0px 0px; font-family: 'Open Sans', Arial, Helvetica, sans-serif; line-height: 20px; text-rendering: optimizelegibility; font-size: 20px; padding: 0px; clear: left;">Learning outcomes</h2>\r\n\r\n<div style="margin: 0px; padding: 0px; font-family: 'Open Sans', Arial, Helvetica, sans-serif; font-size: 12px; line-height: 14.77199935913086px;">\r\n<ul style="padding-right: 0px; padding-left: 0px; margin: 0px 0px 12px; list-style: none; line-height: normal;">\r\n\t<li class="jsmod" style="line-height: 1.5; margin: 8px 0px 0px; padding: 0px 0px 0px 21px; list-style: none; background-color: transparent; background-position: initial initial; background-repeat: initial initial;"><span style="line-height: 1.3em;">Understand how change can impact you.</span></li>\r\n\t<li class="jsmod" style="line-height: 1.5; margin: 8px 0px 0px; padding: 0px 0px 0px 21px; list-style: none; background-color: transparent; background-position: initial initial; background-repeat: initial initial;"><span style="line-height: 1.3em;">Be able to define what you have control over in the change event.</span></li>\r\n\t<li class="jsmod" style="line-height: 1.5; margin: 8px 0px 0px; padding: 0px 0px 0px 21px; list-style: none; background-color: transparent; background-position: initial initial; background-repeat: initial initial;"><span style="line-height: 1.3em;">Develop healthy coping strategies.</span></li>\r\n\t<li class="jsmod" style="line-height: 1.5; margin: 8px 0px 0px; padding: 0px 0px 0px 21px; list-style: none; background-color: transparent; background-position: initial initial; background-repeat: initial initial;"><span style="line-height: 1.3em;">Use the four A&rsquo;s technique to deal with stressful situations.</span></li>\r\n</ul>\r\n</div>\r\n\r\n<h2 id="topics-header" style="margin: 12px 0px 0px; font-family: 'Open Sans', Arial, Helvetica, sans-serif; line-height: 20px; text-rendering: optimizelegibility; font-size: 20px; padding: 0px; clear: left;"><br />\r\n&nbsp;</h2>\r\n	2	ACTIVE	\N
35	34	Dressing for success	<p>&nbsp;Does it really make a difference how you dress for an interview? In many cases, it does. I&#39;ll never forget the gentleman I interviewed for an a<br />\r\n&nbsp; &nbsp;ccounting position. He had been out of work for a few months and wanted to show me why. He took off his jacket, unbuttoned his shirt and&nbsp;<br />\r\n&nbsp; &nbsp;started to <u>pull down his pants (this is a true story) to show me the scar from a boat propeller that had injured him. He didn&#39;t get the job.</u><br />\r\n&nbsp; &nbsp;Neither did the young lady in a bright red skirt so short and tight that she could hardly sit down!</p>\r\n	2	ACTIVE	18
\.


--
-- Name: shactivity_atv_id_seq; Type: SEQUENCE SET; Schema: shine; Owner: shine
--

SELECT pg_catalog.setval('shactivity_atv_id_seq', 1, false);


--
-- Data for Name: shactivityattend; Type: TABLE DATA; Schema: shine; Owner: shine
--

COPY shactivityattend (atat_id, atat_atptid, atat_atsid) FROM stdin;
77	26	19
78	26	20
79	33	20
80	36	9
81	37	19
82	37	20
83	27	21
84	34	21
85	39	25
86	40	19
87	40	20
88	43	32
89	43	33
90	42	30
91	44	28
92	44	29
93	45	12
94	47	10
95	47	11
96	38	37
97	50	10
98	50	11
\.


--
-- Name: shactivityattend_atat_id_seq; Type: SEQUENCE SET; Schema: shine; Owner: shine
--

SELECT pg_catalog.setval('shactivityattend_atat_id_seq', 98, true);


--
-- Data for Name: shactivityevent; Type: TABLE DATA; Schema: shine; Owner: shine
--

COPY shactivityevent (atve_id, atve_atvid, atve_created_date, atve_register_start, atve_register_end, atve_max_participant, atve_withdraw_before_day, atve_fee, atve_facilitator_id, atve_provider, atve_publish_date, atve_class) FROM stdin;
9	29	2014-04-10 23:20:10.74+08	2014-04-01 23:20:10+08	2014-04-18 23:20:10+08	50	3	300.0000	5	Taylor’s Orientation Leaders	2014-04-01 23:20:10+08	event-pink
16	1	2014-04-10 23:43:00.193+08	2014-04-01 23:43:00+08	2014-04-11 23:43:00+08	20	3	500.0000	5	Business and Entrepreneurship Club	2014-04-01 23:43:00+08	event-red
12	28	2014-04-10 23:31:29.866+08	2014-04-21 23:31:29+08	2014-04-25 23:31:29+08	15	3	100.0000	3	Taylor’s University Cultural Arts Performers (TRADISI)	2014-04-01 23:31:29+08	event-orange
10	26	2014-04-10 23:21:51.54+08	2014-03-01 23:21:51+08	2014-03-31 23:21:51+08	20	3	100.0000	1	CSI Volunteers	2014-03-01 23:21:51+08	\N
13	27	2014-04-10 23:36:38.229+08	2014-04-01 23:36:38+08	2014-04-11 23:36:38+08	20	2	200.0000	4	Young Entrepreneurs Network Circle	2014-04-01 23:36:38+08	event-yellow
14	2	2014-04-10 23:38:28.001+08	2014-04-01 23:38:28+08	2014-04-18 23:38:28+08	25	2	200.0000	2	Public Speaking Clubs	2014-04-01 23:38:28+08	event-green
15	18	2014-04-10 23:39:41.468+08	2014-04-01 23:39:41+08	2014-04-30 23:39:41+08	20	3	200.0000	5	Cultural Clubs	2014-04-01 23:39:41+08	event-black
17	16	2014-04-10 23:44:31.829+08	2014-04-01 23:44:31+08	2014-04-18 23:44:31+08	10	3	50.0000	6	Business and Entrepreneurship Club	2014-04-01 23:44:31+08	event-purple
18	15	2014-04-10 23:46:58.41+08	2014-04-01 23:47:23+08	2014-04-25 23:47:23+08	15	\N	100.0000	1	Spiritual Connectivity Clubs	2014-04-01 23:47:23+08	event-light-blue
19	30	2014-04-12 15:12:35.59+08	2014-02-24 15:13:18+08	2014-03-10 15:13:18+08	50	6	0.0000	5	Original Bootcamp	2014-02-21 15:13:18+08	\N
20	19	2014-04-12 15:52:19.149+08	2014-02-10 15:52:19+08	2014-02-21 15:52:19+08	30	10	0.0000	1	NLP Pro Centre	2014-02-10 15:52:19+08	\N
21	19	2014-04-12 15:53:55.29+08	2014-02-10 15:53:55+08	2014-02-21 15:53:55+08	30	10	0.0000	1	NLP  Pro Centre	2014-02-10 15:53:55+08	\N
22	14	2014-04-12 16:03:22.762+08	2014-02-03 16:03:22+08	2014-02-07 16:03:22+08	50	10	0.0000	3	PD training centre	2014-01-27 16:03:22+08	\N
11	28	2014-04-10 23:30:20.096+08	2014-04-11 12:58:58+08	2014-04-18 12:58:58+08	15	3	100.0000	3	Taylor’s University Cultural Arts Performers (TRADISI)	2014-04-14 12:58:58+08	event-orange
8	20	2014-04-10 23:18:00.51+08	2014-04-01 13:02:02+08	2014-04-15 13:02:02+08	100	3	200.0000	6	Taylor’s University Student Council	2014-04-01 13:02:02+08	event-blue
44	35	2014-04-13 19:01:24.114+08	2014-04-21 19:01:24+08	2014-04-25 19:01:24+08	100	3	100.0000	5	Public Speaking Clubs	2014-04-21 19:01:24+08	event-pink 
\.


--
-- Name: shactivityevent_atve_id_seq; Type: SEQUENCE SET; Schema: shine; Owner: shine
--

SELECT pg_catalog.setval('shactivityevent_atve_id_seq', 44, true);


--
-- Data for Name: shactivitypart; Type: TABLE DATA; Schema: shine; Owner: shine
--

COPY shactivitypart (atpt_id, atpt_atveid, atpt_usrid, atpt_created_date, atpt_status, atpt_status_date, atpt_status_by, atpt_role_atpid) FROM stdin;
41	14	admin2	2014-04-13 12:06:20.029+08	ACTIVE	2014-04-13 12:06:20.029+08	\N	\N
43	22	hermione	2014-04-13 12:09:16.23+08	COMPLETED	2014-04-13 14:43:51.955+08	snape	56
42	20	hermione	2014-04-13 12:09:09.388+08	COMPLETED	2014-04-13 15:11:54.161+08	snape	53
39	18	fred	2014-04-12 22:22:44.726+08	COMPLETED	2014-04-12 22:52:10.322+08	harry	43
40	13	fred	2014-04-12 23:06:25.707+08	COMPLETED	2014-04-12 23:06:50.304+08	severus	57
44	19	hermione	2014-04-13 12:09:30.073+08	COMPLETED	2014-04-13 17:22:09.991+08	snape	49
30	8	admin	2014-04-11 13:35:43.92+08	WITHDRAW	2014-04-11 13:35:43.92+08	\N	\N
31	8	admin	2014-04-11 13:37:37.366+08	WITHDRAW	2014-04-11 13:37:37.366+08	\N	\N
48	11	fred	2014-04-13 17:40:10.884+08	ACTIVE	2014-04-13 17:40:10.884+08	\N	\N
38	8	fred	2014-04-12 22:22:14.67+08	COMPLETED	2014-04-13 17:46:26.339+08	snape	4
45	10	hermione	2014-04-13 13:05:28.411+08	COMPLETED	2014-04-13 18:07:10.548+08	snape	16
46	9	hermione	2014-04-13 15:53:43.216+08	WITHDRAW	2014-04-13 15:53:43.216+08	\N	\N
26	13	admin	2014-04-11 13:21:13.301+08	PENDING REFLECTION	2014-04-12 19:51:03.968+08	admin	\N
47	9	hermione	2014-04-13 15:54:05.581+08	WITHDRAW	2014-04-13 15:58:12.59+08	snape	22
33	13	fred	2014-04-12 14:38:14.221+08	ABSENT	2014-04-12 19:51:03.989+08	admin	\N
49	9	hermione	2014-04-13 18:40:25.449+08	WITHDRAW	2014-04-13 18:40:25.449+08	\N	\N
32	8	admin2	2014-04-12 13:41:14.2+08	ABSENT	2014-04-12 21:17:52.209+08	severus	\N
35	13	albus	2014-04-12 20:05:45.461+08	ABSENT	2014-04-12 21:24:05.753+08	fred	\N
50	9	hermione	2014-04-13 18:40:52.295+08	COMPLETED	2014-04-13 18:44:51.391+08	snape	22
27	14	admin	2014-04-11 13:21:23.924+08	PENDING REFLECTION	2014-04-12 22:48:03.913+08	severus	46
34	14	albus	2014-04-12 15:43:22.842+08	PENDING REFLECTION	2014-04-12 22:48:03.943+08	severus	47
\.


--
-- Name: shactivitypart_atpt_id_seq; Type: SEQUENCE SET; Schema: shine; Owner: shine
--

SELECT pg_catalog.setval('shactivitypart_atpt_id_seq', 50, true);


--
-- Data for Name: shactivitypoint; Type: TABLE DATA; Schema: shine; Owner: shine
--

COPY shactivitypoint (atp_id, atp_atvid, atp_type, atp_item, atp_point) FROM stdin;
3	20	ROLE	Organiser	50
4	20	ROLE	Attentee	20
15	26	ROLE	Organiser	100
16	26	ROLE	Attendee	20
19	28	ROLE	Organiser	100
20	28	ROLE	Attendee	30
21	29	ROLE	Organiser	100
22	29	ROLE	Attendee	20
29	13	ROLE	Organiser	100
30	13	ROLE	Attendee	20
31	18	ROLE	Organiser	100
32	18	ROLE	Attendee	20
35	17	ROLE	Organiser	100
36	17	ROLE	Attendee	20
40	16	ROLE	Organiser	100
41	16	ROLE	Attendee	20
44	1	ROLE	Organiser	80
45	1	ROLE	Attendee	20
46	2	ROLE	Organiser	50
47	2	ROLE	Attendee	10
48	30	ROLE	Organiser	80
49	30	ROLE	Attendee	25
52	19	ROLE	Organiser	100
53	19	ROLE	Attendee	20
57	27	ROLE	Organiser	50
58	27	ROLE	Attendee	20
59	27	ACHIEVEMENT	Champion	100
60	27	ACHIEVEMENT	Runner Up	50
61	15	ROLE	Organiser	100
62	15	ROLE	Attendee	20
63	15	ACHIEVEMENT	Top Performer	100
64	14	ROLE	Organiser	100
65	14	ROLE	Comittee	50
66	14	ROLE	Attendee	20
67	32	ROLE	Organiser	100
68	32	ROLE	Attendee	20
69	32	ACHIEVEMENT	Best dresser	100
70	35	ROLE	Organiser	100
71	35	ROLE	Attendee	20
72	35	ACHIEVEMENT	Best dresser	100
\.


--
-- Name: shactivitypoint_atp_id_seq; Type: SEQUENCE SET; Schema: shine; Owner: shine
--

SELECT pg_catalog.setval('shactivitypoint_atp_id_seq', 72, true);


--
-- Data for Name: shactivityschedule; Type: TABLE DATA; Schema: shine; Owner: shine
--

COPY shactivityschedule (ats_id, ats_atveid_ahaid, ats_vnid, ats_start, ats_end) FROM stdin;
8	7	1	2014-04-18 09:00:00+08	2014-04-18 13:00:00+08
10	9	1	2014-04-21 09:00:00+08	2014-04-21 17:00:00+08
11	9	1	2014-04-22 09:00:00+08	2014-04-22 17:00:00+08
12	10	1	2014-04-07 08:00:00+08	2014-04-07 13:00:00+08
16	12	2	2014-04-29 09:00:00+08	2014-04-29 17:00:00+08
17	12	2	2014-04-30 09:00:00+08	2014-04-30 17:00:00+08
18	12	2	2014-05-01 09:00:00+08	2014-05-01 17:00:00+08
19	13	3	2014-04-18 09:00:00+08	2014-04-18 13:00:00+08
20	13	3	2014-04-19 09:00:00+08	2014-04-19 13:00:00+08
21	14	1	2014-04-19 09:00:00+08	2014-04-19 13:00:00+08
22	15	1	2014-04-19 10:00:00+08	2014-04-19 18:00:00+08
23	16	2	2014-04-19 09:00:00+08	2014-04-19 13:00:00+08
24	17	2	2014-04-22 09:00:00+08	2014-04-22 14:00:00+08
25	18	2	2014-04-30 09:00:00+08	2014-04-30 18:00:00+08
28	19	2	2014-03-19 09:30:00+08	2014-03-19 12:30:00+08
29	19	2	2014-03-20 09:30:00+08	2014-03-20 12:30:00+08
30	20	1	2014-03-10 09:00:00+08	2014-03-10 16:30:00+08
31	21	1	2014-03-11 09:00:00+08	2014-03-11 16:30:00+08
32	22	3	2014-03-11 13:30:00+08	2014-03-11 17:30:00+08
33	22	2	2014-03-12 13:30:00+08	2014-03-12 17:30:00+08
34	11	2	2014-04-22 09:00:00+08	2014-04-22 17:00:00+08
35	11	2	2014-04-23 09:00:00+08	2014-04-23 17:00:00+08
36	11	2	2014-04-24 09:00:00+08	2014-04-24 17:00:00+08
37	8	1	2014-04-16 09:00:00+08	2014-04-16 13:00:00+08
38	44	1	2014-04-30 09:00:00+08	2014-04-30 13:00:00+08
39	44	1	2014-05-01 09:00:00+08	2014-05-01 13:00:00+08
40	44	1	2014-05-02 09:00:00+08	2014-05-02 13:00:00+08
\.


--
-- Name: shactivityschedule_ats_id_seq; Type: SEQUENCE SET; Schema: shine; Owner: shine
--

SELECT pg_catalog.setval('shactivityschedule_ats_id_seq', 40, true);


--
-- Data for Name: shadhocactivity; Type: TABLE DATA; Schema: shine; Owner: shine
--

COPY shadhocactivity (aha_id, aha_usrid, aha_created_date, aha_name, aha_description, aha_status, aha_status_date, aha_status_by, aha_point, aha_remark) FROM stdin;
38	fred	2014-04-12 22:00:33+08	Volunteer with MERCY Malaysia	<div id="articleTitle"><strong>Good Personal and Oral Hygiene Practices at Kampung Sungai Kinabatangan</strong></div>\r\n\r\n<div id="articleContent">\r\n<p>MERCY Malaysia has endeavored in different projects to provide the Orang Asli with better health care services.&nbsp;MERCY Malaysia will be conducting its first mission to Kampung Sungai Kinabatangan from the 29th - 31th&nbsp;of July 2014 with a team consisting of 2 MERCY Malaysia staff, 2 dentist and 10 volunteers. In this mission, the team will be giving education sessions and demonstration to the villagers.&nbsp;</p>\r\n\r\n<p>Apart from the above, the team will also provide free dental check up for the villagers. We will also be distributing toothpaste and soap as part of our efforts to encourage the community to maintain good personal and oral hygiene practices.</p>\r\n</div>\r\n	Approve	2014-04-12 22:01:47.744+08	severus	60	This 
39	harry	2014-04-12 22:12:52+08	World Spelling Competition	<p>World Spelling Competition 2014</p>\r\n	Approve	2014-04-12 22:13:19.942+08	severus	100	\N
40	fred	2014-04-12 22:20:23+08	Inter-college Basketball Competition	<p>The inter-college Basketball Competition will be held from 20th June 2014 to 15th July 2014. This competition involves 20 games on round-robin basis between 5 college teams, i.e from Taylor&#39;s University, Monash, TARC, INTI and KDU.</p>\r\n\r\n<p>The objective of this competition is to promote the sport among teenagers in the country as well as to create closer bonds between students from the participating colleges. Using this tournament as a start, the organizing committee is aiming to further expand the tournament to more sporting event and ultimately make it a small &quot;Olympic&quot; beween the 5 colleges.</p>\r\n\r\n<p>Taylor&#39;s team will be captained by me who also acts as the team manager.</p>\r\n	Approve	2014-04-12 22:21:34.236+08	severus	35	By captaining the Taylor's team, Fred will be able to hone better interpersonal as well as management skills.
41	hermione	2014-04-13 14:28:29+08	Volunteer with MERCY Malaysia	<p><strong>Good Personal and Oral Hygiene Practices at Kampung Sungai Kinabatangan</strong></p>\r\n\r\n<p>MERCY Malaysia has endeavored in different projects to provide the Orang Asli with better health care services.&nbsp;MERCY Malaysia will be conducting its first mission to Kampung Sungai Kinabatangan from the 29th - 31th&nbsp;of July 2014 with a team consisting of 2 MERCY Malaysia staff, 2 dentist and 10 volunteers. In this mission, the team will be giving education sessions and demonstration to the villagers.&nbsp;</p>\r\n\r\n<p>Apart from the above, the team will also provide free dental check up for the villagers. We will also be distributing toothpaste and soap as part of our efforts to encourage the community to maintain good personal and oral hygiene practices.</p>\r\n	Approve	2014-04-13 14:33:03.34+08	snape	60	Taking part in this volunteering activity will expose Hermione to the needy and build personality on her.
42	hermione	2014-04-13 14:29:17+08	Inter-college Basketball Competition	<p>The inter-college Basketball Competition will be held from 20th June 2014 to 15th July 2014. This competition involves 20 games on round-robin basis between 5 college teams, i.e from Taylor&#39;s University, Monash, TARC, INTI and KDU.</p>\r\n\r\n<p>The objective of this competition is to promote the sport among teenagers in the country as well as to create closer bonds between students from the participating colleges. Using this tournament as a start, the organizing committee is aiming to further expand the tournament to more sporting event and ultimately make it a small &quot;Olympic&quot; beween the 5 colleges.</p>\r\n\r\n<p>Taylor&#39;s team will be captained by me who also acts as the team manager.</p>\r\n	Approve	2014-04-13 14:39:35.623+08	snape	50	Being the captain and team manager for the team, Hermione will be able to improve her interpersonal skills and management skills.
43	fred	2014-04-13 17:29:57.176+08	Sports Carnival 2014	<p><span style="font-family:arial,helvetica,sans-serif;"><span style="color:#000000;"><span style="font-size: 15px; line-height: 22.5px;">Educational&nbsp;Sports Carnivals are a sports and education company who specialise in organising and running positive sport, teamwork and development programs for schools. Our school incursions engage children in physical and cognitive challenges that are safe, fun and inclusive. Our professional reputation has been underpinned by our great team of consultants, all of whom bring their unique talents and experiences to our tabloid events.</span></span></span></p>\r\n	Pending Approval	2014-04-13 17:29:57.176+08	fred	\N	\N
\.


--
-- Name: shadhocactivity_aha_id_seq; Type: SEQUENCE SET; Schema: shine; Owner: shine
--

SELECT pg_catalog.setval('shadhocactivity_aha_id_seq', 13, true);


--
-- Data for Name: shatutorialsetup; Type: TABLE DATA; Schema: shine; Owner: shine
--

COPY shatutorialsetup (tut_id, tut_title, tut_imagepath, tut_label, tut_seq) FROM stdin;
23	\N	Page 1 Intro.png	<p>Page 1: Intro</p>\r\n	1000
25	\N	Page 2 my activity.png	<p>Page 2: My activity</p>\r\n	1100
\.


--
-- Name: shatutorialsetup_tut_id_seq; Type: SEQUENCE SET; Schema: shine; Owner: shine
--

SELECT pg_catalog.setval('shatutorialsetup_tut_id_seq', 25, true);


--
-- Data for Name: shaward; Type: TABLE DATA; Schema: shine; Owner: shine
--

COPY shaward (aw_id, aw_cat, aw_rank, aw_name, aw_min_total_point) FROM stdin;
\.


--
-- Name: shaward_aw_id_seq; Type: SEQUENCE SET; Schema: shine; Owner: shine
--

SELECT pg_catalog.setval('shaward_aw_id_seq', 1, false);


--
-- Data for Name: shawardpoint; Type: TABLE DATA; Schema: shine; Owner: shine
--

COPY shawardpoint (awp_id, awp_awid, awp_type, awp_pkid_atvid, awp_min_point) FROM stdin;
\.


--
-- Name: shawardpoint_awp_id_seq; Type: SEQUENCE SET; Schema: shine; Owner: shine
--

SELECT pg_catalog.setval('shawardpoint_awp_id_seq', 1, false);


--
-- Data for Name: shawardwinner; Type: TABLE DATA; Schema: shine; Owner: shine
--

COPY shawardwinner (aww_id, aww_usrid, aww_awid, aww_created_date) FROM stdin;
\.


--
-- Name: shawardwinner_aww_id_seq; Type: SEQUENCE SET; Schema: shine; Owner: shine
--

SELECT pg_catalog.setval('shawardwinner_aww_id_seq', 1, false);


--
-- Data for Name: shfacilitator; Type: TABLE DATA; Schema: shine; Owner: shine
--

COPY shfacilitator (fac_id, fac_name) FROM stdin;
1	Iverson
2	James
3	MacGrady
4	Sheila
5	David
6	AJIT
\.


--
-- Name: shfacilitator_fac_id_seq; Type: SEQUENCE SET; Schema: shine; Owner: shine
--

SELECT pg_catalog.setval('shfacilitator_fac_id_seq', 6, true);


--
-- Data for Name: shpackage; Type: TABLE DATA; Schema: shine; Owner: shine
--

COPY shpackage (pk_id, pk_type, pk_parentid, pk_name, pk_description, pk_max_point, pk_max_hour, pk_min_point, pk_status) FROM stdin;
5	PACKAGE	4	Powerful presentations	Powerful Presentations	500	1000	200	ACTIVE
8	PACKAGE	4	Assertiveness at work	Assertiveness at work	500	1000	200	ACTIVE
9	PACKAGE	4	Persuading and influencing people	Persuading and influencing people	500	1000	200	ACTIVE
12	PACKAGE	10	Delivering beyond yourself	Delivering beyond yourself	500	1000	200	ACTIVE
4	SERIES	\N	Personal development	Personal development	2000	5000	500	ACTIVE
10	SERIES	\N	People and leadership	People and leadership	1500	3000	300	ACTIVE
21	SERIES	\N	Professional Development	<p>Professional Development</p>\r\n	1000	2000	300	ACTIVE
22	SERIES	\N	Global Engagement	<p>Global Engagement</p>\r\n	800	600	200	ACTIVE
23	SERIES	\N	Vision	<p>Vision</p>\r\n	500	500	100	ACTIVE
24	SERIES	\N	Planning	<p>Planning</p>\r\n	1000	1500	300	ACTIVE
25	PACKAGE	22	Get ready for future	<p>Tons of activities that assits you .....</p>\r\n	2500	3000	300	ACTIVE
34	PACKAGE	33	Dress to kill	<p>Does it really make a difference how you dress for an interview? In many cases, it does. I&#39;ll never forget the gentleman I interviewed for an&nbsp;<br />\r\n&nbsp; accounting position. He had been out of work for a few months and wanted to show me why. He took off his jacket, unbuttoned his shirt and&nbsp;<br />\r\n&nbsp; &nbsp; &nbsp;started to pull down his pants (this is a true story) to show me the scar from a boat propeller that had injured him. He didn&#39;t get the job.<br />\r\n&nbsp; &nbsp; &nbsp; Neither did the young lady in a bright red skirt so short and tight that she could hardly sit down!<br />\r\n&nbsp; These activities are designed to show you have to deliver yourself appropriately during an interview.</p>\r\n	500	200	100	ACTIVE
\.


--
-- Name: shpackage_pk_id_seq; Type: SEQUENCE SET; Schema: shine; Owner: shine
--

SELECT pg_catalog.setval('shpackage_pk_id_seq', 35, true);


--
-- Data for Name: shpoint; Type: TABLE DATA; Schema: shine; Owner: shine
--

COPY shpoint (pts_id, pts_usrid, pts_created_date, pts_parentid, pts_reftype, pts_refid, pts_desc, pts_point) FROM stdin;
3	harry	2014-04-12 22:28:22.157+08	\N	adhoc	39	Attended adhoc activity - World Spelling Competition	100
4	fred	2014-04-12 23:02:54.988+08	\N	event	39	Attended event - Discovering the secrets of self confidence	100
5	fred	2014-04-12 23:02:54.988+08	4	achievement	63	Achievement - Top Performer	100
6	fred	2014-04-12 23:07:34.359+08	\N	event	40	Attended event - Coping with Change – Making the Transition Training Course	150
7	fred	2014-04-12 23:07:34.359+08	6	role	57	Role - Organiser	50
8	fred	2014-04-12 23:07:34.359+08	6	achievement	59	Achievement - Champion	100
9	fred	2014-04-13 13:32:47.95+08	\N	adhoc	38	Attended adhoc activity - Volunteer with MERCY Malaysia	60
10	hermione	2014-04-13 14:43:51.955+08	\N	event	43	Attended event - Effective Time management 	20
11	hermione	2014-04-13 14:43:51.955+08	10	role	56	Role - Attendee	20
12	hermione	2014-04-13 15:11:54.161+08	\N	event	42	Attended event - Body language tips	20
13	hermione	2014-04-13 15:11:54.161+08	12	role	53	Role - Attendee	20
15	hermione	2014-04-13 15:58:12.59+08	14	role	22	Role - Attendee	20
16	hermione	2014-04-13 17:22:09.991+08	\N	event	44	Attended event - Resilience & Stress Management Training	25
17	hermione	2014-04-13 17:22:09.991+08	16	role	49	Role - Attendee	25
18	fred	2014-04-13 17:46:26.339+08	\N	event	38	Attended event - IMPACT & INFLUENCE	20
19	fred	2014-04-13 17:46:26.339+08	18	role	4	Role - Attentee	20
20	hermione	2014-04-13 18:07:10.548+08	\N	event	45	Attended event - Conflict Resolution Training Course	20
21	hermione	2014-04-13 18:07:10.548+08	20	role	16	Role - Attendee	20
\.


--
-- Name: shpoint_pts_id_seq; Type: SEQUENCE SET; Schema: shine; Owner: shine
--

SELECT pg_catalog.setval('shpoint_pts_id_seq', 23, true);


--
-- Data for Name: shreflection; Type: TABLE DATA; Schema: shine; Owner: shine
--

COPY shreflection (rfl_id, rfl_usrid, rfl_reftype, rfl_refid, rfl_subject, rfl_content, rfl_status, rfl_status_date, rfl_status_by, rfl_remark, rfl_achievement_atpid) FROM stdin;
19	fred	event	39	Discovering the secrets of self confidence	<p>bhahhaa</p>\r\n	Approve	2014-04-12 23:02:54.988+08	severus	\N	63
20	fred	event	40	Coping with Change – Making the Transition Training Course	<p>asdsda</p>\r\n	Approve	2014-04-12 23:07:34.359+08	severus	\N	59
14	fred	adhoc	38	Volunteer with MERCY Malaysia	<p>In this mission, we have given free body and oral check up to over 100 villagers. This is the first medical and dental check up for most of the villagers. They were at first hesitant to have their teeth checked but in the end were happy once the treatment was completed.&nbsp;</p>\r\n\r\n<p>The mission was made successful with the assistance and full corporation of the teachers of SK. Kampung Sungai Kinabatangan, the team from Kementerian Kesihatan Malaysia (KKM) as well as the community of Kampung Sungai Kinabatangan who have been very supportive of our mission and have helped us in our mission.</p>\r\n\r\n<p>This is an eye opening experience to me on the living condition from rural part of the country. I will be joining more of these voluntary jobs to help improve living standards of other Malaysians who is in need.</p>\r\n	Approve	2014-04-13 13:32:47.95+08	severus	\N	\N
23	hermione	event	44	Resilience & Stress Management Training	<p>This course is mainly a training on our mental toughness and ability to handle stressful situation.</p>\r\n\r\n<p>There will always be stressful stretches in our lives. Hence, being able to handle stressful situation is essential in keeping us going on.</p>\r\n\r\n<p>I have learnt to remove stress from myself, or when the stress is to tremendous, learnt how to reduce it.</p>\r\n	Approve	2014-04-13 17:22:09.991+08	snape	Ability to handle stress or reduce stress on oneself is essential in the student's future working life.	\N
25	hermione	adhoc	41	Volunteer with MERCY Malaysia	\N	Pending	2014-04-13 14:33:03.34+08	snape	\N	\N
26	hermione	adhoc	42	Inter-college Basketball Competition	\N	Pending	2014-04-13 14:39:35.623+08	snape	\N	\N
21	hermione	event	43	Effective Time management 	<p>The speaker Mr Harjit has been given us good tips on time management.</p>\r\n\r\n<p>After the course, I have learnt to create time out of tight schedules. This will not only help in my college life but also help me tremendously in the working life after this.</p>\r\n	Approve	2014-04-13 14:43:51.955+08	snape	Concur with Hermione's remarks.	\N
22	hermione	event	42	Body language tips	<p>Up to 93% of our communication is non-verbal However, we often only think about the words we say, not how we say them. Or how our body supports or sends out conflicting gestures to our audience.</p>\r\n\r\n<p>We have learnt how our face and body express emotions and even learnt a bit about lie detection.&nbsp;<span style="line-height: 1.6;">Needless to say, having good body language that supports the words coming out from our mouth will immediately boost our credibility as a speaker.</span></p>\r\n\r\n<p><span style="line-height: 1.6;">Besides, the speaker, i.e Ms Vanessa is a very good presenter with engaging and entertaining presentation style which gets all participants involved in the event.</span></p>\r\n	Approve	2014-04-13 15:11:54.161+08	snape	Body language course is typically useful for students.	\N
16	fred	adhoc	40	Inter-college Basketball Competition	\N	Pending	2014-04-12 22:21:34.236+08	severus	\N	\N
28	fred	event	38	IMPACT & INFLUENCE	<p>Hallo, please</p>\r\n	Approve	2014-04-13 17:46:26.339+08	snape	\N	\N
24	hermione	event	45	Conflict Resolution Training Course	<p>This training course has given us insight to the key of resolving conflicts, be it in school, at work and even amongst friends &amp; family.&nbsp;Alway stay calm and not let anger, fear, or any emotions get the better of us in any discussions.&nbsp;Keeping a cool mind enable us to seek for the best way out to resolve any conflicts that arises.<br />\r\nWe were also taught on how to identify the key factor that creates conflict and effectively extinguish them.<br />\r\nThis course has greatly benefited me, especially in future working environment where most conflicts will appear.</p>\r\n	Approve	2014-04-13 18:07:10.548+08	snape	\N	\N
\.


--
-- Name: shreflection_rfl_id_seq; Type: SEQUENCE SET; Schema: shine; Owner: shine
--

SELECT pg_catalog.setval('shreflection_rfl_id_seq', 29, true);


--
-- Data for Name: shtsat; Type: TABLE DATA; Schema: shine; Owner: shine
--

COPY shtsat (tst_id, tst_trigger_ruid, tst_max_attempt, tst_status) FROM stdin;
1	\N	3	ACTIVE
\.


--
-- Name: shtsat_tst_id_seq; Type: SEQUENCE SET; Schema: shine; Owner: shine
--

SELECT pg_catalog.setval('shtsat_tst_id_seq', 1, true);


--
-- Data for Name: shtsatanswer; Type: TABLE DATA; Schema: shine; Owner: shine
--

COPY shtsatanswer (tsa_id, tsa_tsqid, tsa_order, tsa_answer, tsa_point) FROM stdin;
209	2	100	I am new to this	2
213	3	100	I am new to this	2
217	4	100	I am new to this	2
5	1	100	I am new to this	2
6	1	200	I could improve	4
7	1	300	I have some mastery	8
210	2	200	I could improve	4
221	5	100	I am new to this	2
225	6	100	I am new to this	2
229	7	100	I am new to this	2
233	8	100	I am new to this	2
237	9	100	I am new to this	2
241	10	100	I am new to this	2
245	11	100	I am new to this	2
249	12	100	I am new to this	2
253	13	100	I am new to this	2
257	14	100	I am new to this	2
261	15	100	I am new to this	2
265	16	100	I am new to this	2
269	17	100	I am new to this	2
273	18	100	I am new to this	2
277	19	100	I am new to this	2
8	1	400	I am competent	2
214	3	200	I could improve	4
218	4	200	I could improve	4
222	5	200	I could improve	4
226	6	200	I could improve	4
230	7	200	I could improve	4
234	8	200	I could improve	4
238	9	200	I could improve	4
242	10	200	I could improve	4
246	11	200	I could improve	4
250	12	200	I could improve	4
254	13	200	I could improve	4
258	14	200	I could improve	4
262	15	200	I could improve	4
266	16	200	I could improve	4
270	17	200	I could improve	4
274	18	200	I could improve	4
278	19	200	I could improve	4
282	20	200	I could improve	4
286	21	200	I could improve	4
290	22	200	I could improve	4
294	23	200	I could improve	4
298	24	200	I could improve	4
302	25	200	I could improve	4
211	2	300	I have some mastery	8
215	3	300	I have some mastery	8
219	4	300	I have some mastery	8
223	5	300	I have some mastery	8
227	6	300	I have some mastery	8
231	7	300	I have some mastery	8
235	8	300	I have some mastery	8
239	9	300	I have some mastery	8
243	10	300	I have some mastery	8
247	11	300	I have some mastery	8
251	12	300	I have some mastery	8
255	13	300	I have some mastery	8
259	14	300	I have some mastery	8
263	15	300	I have some mastery	8
267	16	300	I have some mastery	8
271	17	300	I have some mastery	8
275	18	300	I have some mastery	8
279	19	300	I have some mastery	8
283	20	300	I have some mastery	8
287	21	300	I have some mastery	8
291	22	300	I have some mastery	8
295	23	300	I have some mastery	8
299	24	300	I have some mastery	8
303	25	300	I have some mastery	8
212	2	400	I am competent	10
216	3	400	I am competent	10
220	4	400	I am competent	10
224	5	400	I am competent	10
228	6	400	I am competent	10
232	7	400	I am competent	10
236	8	400	I am competent	10
240	9	400	I am competent	10
244	10	400	I am competent	10
248	11	400	I am competent	10
252	12	400	I am competent	10
256	13	400	I am competent	10
260	14	400	I am competent	10
264	15	400	I am competent	10
268	16	400	I am competent	10
272	17	400	I am competent	10
276	18	400	I am competent	10
280	19	400	I am competent	10
284	20	400	I am competent	10
288	21	400	I am competent	10
292	22	400	I am competent	10
296	23	400	I am competent	10
300	24	400	I am competent	10
304	25	400	I am competent	10
308	26	400	I am competent	10
281	20	100	I am new to this	2
285	21	100	I am new to this	2
289	22	100	I am new to this	2
293	23	100	I am new to this	2
297	24	100	I am new to this	2
301	25	100	I am new to this	2
305	26	100	I am new to this	2
306	26	200	I could improve	4
307	26	300	I have some mastery	8
\.


--
-- Name: shtsatanswer_tsa_id_seq; Type: SEQUENCE SET; Schema: shine; Owner: shine
--

SELECT pg_catalog.setval('shtsatanswer_tsa_id_seq', 308, true);


--
-- Data for Name: shtsatquestion; Type: TABLE DATA; Schema: shine; Owner: shine
--

COPY shtsatquestion (tsq_id, tsq_tstid, tsq_order, tsq_question, tsq_type, tsq_max_char, tsq_qstid) FROM stdin;
1	1	100	I am able to set realistc goals for myself	\N	\N	1
2	1	200	I know my strengths & weaknesses	\N	\N	1
3	1	300	I organize my time effectively	\N	\N	1
4	1	400	I am able to deal with stress	\N	\N	1
5	1	500	I am able to work effectively unsupervised	\N	\N	1
6	1	600	I can evaluate my own performance	\N	\N	1
7	1	700	I am able to see thing from others' point of view	\N	\N	2
8	1	800	I am able to adapt my bahavior to suit the goals of the group	\N	\N	2
9	1	900	I am able to persuade others of my ideas/ suggestions	\N	\N	2
10	1	1000	I am able to lead and motivate a team	\N	\N	2
11	1	1100	I am able to speak in a varierty of situations formally and informally	\N	\N	3
12	1	1200	I am able to effectively convey my ideas and thoughts	\N	\N	3
13	1	1300	I am able to express my ideas clearly in writting	\N	\N	3
14	1	1400	I am able to reflect on and evaluate my communication skill	\N	\N	3
15	1	1500	I am able to understand different viewpoints and then form my own views	\N	\N	4
16	1	1600	I understand my responsibilities as an ethical citizen	\N	\N	4
17	1	1700	I think it is important to participate in communit-based projects	\N	\N	4
18	1	1800	I am aware of the social, political and environmental issue throughout the world	\N	\N	4
19	1	1900	I know how to find specific information from reliable sources on the Internet	\N	\N	5
20	1	2000	I am able to use Information Communication Technology (ICT) for presentations	\N	\N	5
21	1	2100	I know how to use digital devices and the Internet in a safe and responsible way	\N	\N	5
22	1	2200	I am able to produce new ideas	\N	\N	6
23	1	2300	I am able to analyse prolems so that I can solve them	\N	\N	6
24	1	2400	I am able to compile information from multiple sources	\N	\N	7
25	1	2500	I enjoy seeking new information	\N	\N	7
26	1	2600	I am able to reflect on what I have learnt in the past to improve myself	\N	\N	7
\.


--
-- Name: shtsatquestion_tsq_id_seq; Type: SEQUENCE SET; Schema: shine; Owner: shine
--

SELECT pg_catalog.setval('shtsatquestion_tsq_id_seq', 26, true);


--
-- Data for Name: shtsatquestioncat; Type: TABLE DATA; Schema: shine; Owner: shine
--

COPY shtsatquestioncat (qst_id, qst_catname, qst_catimagepath) FROM stdin;
1	Personal (Intrapersonal)	\N
2	Interpersonal	\N
3	Communication	\N
4	Citizenship and global perspectives	\N
7	Lifelong learning	\N
5	Digital literacy	\N
6	Thinking & problem solving	\N
\.


--
-- Name: shtsatquestioncat_qst_id_seq; Type: SEQUENCE SET; Schema: shine; Owner: shine
--

SELECT pg_catalog.setval('shtsatquestioncat_qst_id_seq', 7, true);


--
-- Data for Name: shtsatresult; Type: TABLE DATA; Schema: shine; Owner: shine
--

COPY shtsatresult (tsr_id, tsr_usrid, tsr_created_date, tsr_tstid, tsr_attempt) FROM stdin;
2	admin	2014-04-12 19:00:42.568+08	1	1
3	albus	2014-04-12 19:19:02.585+08	1	1
4	admin	2014-04-12 21:55:46.623+08	1	2
8	granger	2014-04-13 11:30:55.555+08	1	1
9	granger	2014-04-13 11:31:39.125+08	1	2
10	fred	2014-04-13 13:00:48.691+08	1	1
11	hermione	2014-04-13 14:20:03.661+08	1	1
12	admin5	2014-04-13 15:07:31.586+08	1	1
\.


--
-- Name: shtsatresult_tsr_id_seq; Type: SEQUENCE SET; Schema: shine; Owner: shine
--

SELECT pg_catalog.setval('shtsatresult_tsr_id_seq', 18, true);


--
-- Data for Name: shtsatresultanswer; Type: TABLE DATA; Schema: shine; Owner: shine
--

COPY shtsatresultanswer (tsra_id, tsra_tsrid, tsra_tsqid, tsra_tsaid, tsra_answer_text) FROM stdin;
100	8	1	5	\N
101	8	2	210	\N
102	8	3	213	\N
103	8	4	217	\N
5	2	1	5	\N
6	2	2	210	\N
7	2	3	213	\N
8	2	4	218	\N
9	3	1	5	\N
10	3	2	210	\N
11	3	3	213	\N
12	3	4	219	\N
13	4	1	6	\N
14	4	2	211	\N
15	4	3	216	\N
16	4	4	219	\N
17	4	5	224	\N
18	4	6	227	\N
19	4	8	234	\N
20	4	9	238	\N
21	4	10	243	\N
104	8	5	222	\N
105	8	6	225	\N
106	8	7	230	\N
107	8	8	233	\N
108	8	9	237	\N
109	8	10	242	\N
110	8	11	245	\N
111	8	12	249	\N
112	8	13	254	\N
113	8	14	257	\N
114	8	15	261	\N
115	8	16	266	\N
116	8	17	269	\N
117	8	18	273	\N
118	8	19	278	\N
119	8	20	282	\N
120	8	21	286	\N
121	8	22	291	\N
122	8	23	294	\N
123	8	24	298	\N
124	8	25	302	\N
125	8	26	305	\N
126	9	1	6	\N
127	9	2	211	\N
128	9	3	214	\N
129	9	4	219	\N
130	9	5	222	\N
131	9	6	226	\N
132	9	7	231	\N
133	9	8	235	\N
134	9	9	238	\N
135	9	10	243	\N
136	9	11	246	\N
137	9	12	250	\N
138	9	13	255	\N
139	9	14	258	\N
140	9	15	263	\N
141	9	16	267	\N
142	9	17	270	\N
143	9	18	275	\N
144	9	19	278	\N
145	9	20	284	\N
146	9	21	288	\N
147	9	22	291	\N
148	9	23	296	\N
149	9	24	300	\N
150	9	25	304	\N
151	9	26	305	\N
152	10	1	5	\N
153	10	2	209	\N
154	10	3	213	\N
155	10	4	217	\N
74	7	1	5	\N
75	7	2	209	\N
76	7	3	213	\N
77	7	4	217	\N
78	7	5	221	\N
79	7	6	225	\N
80	7	7	230	\N
81	7	8	234	\N
82	7	9	238	\N
83	7	10	242	\N
84	7	11	246	\N
85	7	12	251	\N
86	7	13	255	\N
87	7	14	258	\N
88	7	15	262	\N
89	7	16	266	\N
90	7	17	270	\N
91	7	18	274	\N
92	7	19	278	\N
93	7	20	282	\N
94	7	21	288	\N
95	7	22	292	\N
96	7	23	295	\N
97	7	24	300	\N
98	7	25	303	\N
99	7	26	306	\N
156	10	5	221	\N
157	10	6	225	\N
158	10	7	229	\N
159	10	8	233	\N
160	10	9	237	\N
161	10	10	241	\N
162	10	11	245	\N
163	10	12	249	\N
164	10	13	253	\N
165	10	14	257	\N
166	10	15	261	\N
167	10	16	265	\N
168	10	17	269	\N
169	10	18	273	\N
170	10	19	278	\N
171	10	20	283	\N
172	10	21	288	\N
173	10	22	292	\N
174	10	23	296	\N
175	10	24	300	\N
176	10	25	304	\N
177	10	26	306	\N
178	11	1	5	\N
179	11	2	210	\N
180	11	3	213	\N
181	11	4	218	\N
182	11	5	221	\N
183	11	6	225	\N
184	11	7	229	\N
185	11	8	233	\N
186	11	9	238	\N
187	11	10	241	\N
188	11	11	245	\N
189	11	12	249	\N
190	11	13	254	\N
191	11	14	257	\N
192	11	15	261	\N
193	11	16	265	\N
194	11	17	270	\N
195	11	18	273	\N
196	11	19	277	\N
197	11	20	282	\N
198	11	21	287	\N
199	11	22	290	\N
200	11	23	294	\N
201	11	24	299	\N
202	11	25	302	\N
203	11	26	308	\N
204	12	1	8	\N
205	12	2	212	\N
206	12	3	215	\N
207	12	4	219	\N
208	12	5	224	\N
209	12	7	230	\N
210	12	8	235	\N
211	12	9	240	\N
212	12	10	244	\N
213	12	11	248	\N
214	12	12	251	\N
215	12	13	256	\N
216	12	14	259	\N
217	12	15	262	\N
218	12	16	267	\N
219	12	17	272	\N
220	12	18	276	\N
221	12	19	280	\N
222	12	20	284	\N
223	12	21	285	\N
224	12	22	289	\N
225	12	23	293	\N
226	12	24	300	\N
227	12	25	303	\N
228	12	26	306	\N
229	13	1	5	\N
230	13	2	210	\N
231	13	3	213	\N
232	13	4	218	\N
233	13	5	221	\N
234	13	6	225	\N
235	13	7	230	\N
236	13	8	233	\N
237	13	9	238	\N
238	13	10	241	\N
239	13	11	245	\N
240	13	12	249	\N
241	13	13	254	\N
242	13	14	257	\N
243	13	19	277	\N
244	13	20	283	\N
245	13	22	290	\N
246	13	23	294	\N
247	13	24	299	\N
248	14	1	6	\N
249	14	2	211	\N
250	14	3	214	\N
251	14	4	219	\N
252	14	7	231	\N
253	14	8	234	\N
254	14	9	239	\N
255	14	10	242	\N
256	14	12	250	\N
257	14	13	255	\N
258	14	14	260	\N
259	14	15	263	\N
260	14	19	277	\N
261	14	20	282	\N
262	14	21	285	\N
263	14	22	292	\N
264	14	24	299	\N
265	14	25	304	\N
266	15	1	5	\N
267	15	2	209	\N
268	15	3	214	\N
269	15	4	217	\N
270	15	6	226	\N
271	15	11	245	\N
272	15	12	250	\N
273	15	13	254	\N
274	15	16	265	\N
275	15	20	283	\N
276	15	22	290	\N
277	15	25	302	\N
278	16	1	5	\N
279	16	2	210	\N
280	16	3	213	\N
281	16	4	218	\N
282	16	5	221	\N
283	16	6	225	\N
284	16	7	229	\N
285	16	8	234	\N
286	16	9	237	\N
287	17	1	5	\N
288	17	2	210	\N
289	17	3	213	\N
290	17	4	217	\N
291	17	11	245	\N
292	17	12	250	\N
293	17	14	257	\N
294	17	16	266	\N
295	17	17	270	\N
296	17	18	273	\N
297	17	19	277	\N
298	17	20	283	\N
299	17	21	286	\N
300	17	22	290	\N
301	17	23	294	\N
302	17	24	298	\N
303	17	25	303	\N
304	17	26	305	\N
305	18	1	5	\N
306	18	2	210	\N
307	18	4	217	\N
308	18	8	233	\N
309	18	9	238	\N
310	18	12	249	\N
311	18	16	265	\N
312	18	20	283	\N
313	18	21	286	\N
314	18	22	290	\N
315	18	23	295	\N
316	18	25	302	\N
\.


--
-- Name: shtsatresultanswer_tsra_id_seq; Type: SEQUENCE SET; Schema: shine; Owner: shine
--

SELECT pg_catalog.setval('shtsatresultanswer_tsra_id_seq', 316, true);


--
-- Data for Name: shuserextrainfo; Type: TABLE DATA; Schema: shine; Owner: shine
--

COPY shuserextrainfo (eif_id, eif_usruserid, eif_enrolldate, eif_course, eif_gender, eif_nationality, eif_contactno, eif_maritalstatus, eif_studentid) FROM stdin;
1	harry	2014-03-03 00:00:00+08	Bachelor of Computer Science (Hons) (Computer Security and Forensics)	MALE	Malaysia	016-2385024	Single	1000
\.


--
-- Name: shuserextrainfo_eif_id_seq; Type: SEQUENCE SET; Schema: shine; Owner: shine
--

SELECT pg_catalog.setval('shuserextrainfo_eif_id_seq', 1, true);


--
-- Data for Name: shvenue; Type: TABLE DATA; Schema: shine; Owner: shine
--

COPY shvenue (vn_id, vn_name, vn_addr_line1, vn_addr_line2, vn_addr_line3, vn_addr_line4, vn_postcode, vn_state, vn_country) FROM stdin;
1	Hall 1	\N	\N	\N	\N	\N	\N	\N
2	Hall 2	\N	\N	\N	\N	\N	\N	\N
3	Hall 3	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Name: shvenue_vn_id_seq; Type: SEQUENCE SET; Schema: shine; Owner: shine
--

SELECT pg_catalog.setval('shvenue_vn_id_seq', 3, true);


--
-- Data for Name: tmprpt_activitybystudent; Type: TABLE DATA; Schema: shine; Owner: shine
--

COPY tmprpt_activitybystudent (ras_id, ras_studentid, ras_activityjoined, ras_activityattend, ras_activitywithdrawn, ras_activitymissed, ras_noreflection, ras_totaccpoint, ras_globalrank, ras_tsatscore) FROM stdin;
1	danny@phiorion.com	17	15	1	1	13	370	7	30
5	fong@phiorion.com	13	11	2	0	13	210	11	30
9	yow@phiorion.com	1	1	0	0	0	0	30	5
11	superman@gmail.com	20	20	0	0	20	690	2	30
2	yys1988@gmail.com	2	7	0	0	5	120	17	15
3	lampard7824@gmail.com	26	7	3	2	12	210	10	25
4	hongyee@phiorion.com	28	1	2	0	1	30	30	20
6	esp@phiorion.com	13	11	0	0	11	210	9	35
7	hermione	18	23	0	0	23	710	1	40
8	harry	29	9	2	0	8	310	10	25
10	thor@gmail.com	32	3	0	0	3	100	24	30
\.


--
-- Name: tmprpt_activitybystudent_ras_id_seq; Type: SEQUENCE SET; Schema: shine; Owner: shine
--

SELECT pg_catalog.setval('tmprpt_activitybystudent_ras_id_seq', 11, true);


--
-- Data for Name: tmprpt_award; Type: TABLE DATA; Schema: shine; Owner: shine
--

COPY tmprpt_award (raw_id, raw_awardname, raw_minpoint, raw_noreceipient, raw_status) FROM stdin;
1	Platinum	500	13	Active
2	Gold	400	11	Active
3	Silver	300	27	Active
\.


--
-- Name: tmprpt_award_raw_id_seq; Type: SEQUENCE SET; Schema: shine; Owner: shine
--

SELECT pg_catalog.setval('tmprpt_award_raw_id_seq', 3, true);


--
-- Data for Name: tmprpt_partipantbyact; Type: TABLE DATA; Schema: shine; Owner: shine
--

COPY tmprpt_partipantbyact (rpa_id, rpa_package, rpa_activity, rpa_startdate, rpa_enddate, rpa_status, rpa_provider, rpa_totalseat, rpa_totalregistered, rpa_totalwithdrawn, rpa_remainingseat) FROM stdin;
1	5	2	12 May 2013	15 May 2013	Expired	PWC Consultancy	50	53	4	1
2	5	2	14 June 2013	15 June 2013	Expired	PWC Consultancy	50	51	3	2
3	5	1	3 July 2013	5 July 2013	Expired	PWC Consultancy	50	51	2	1
4	5	1	5 May 2014	7 May 2014	Current	PWC Consultancy	50	13	0	37
5	8	27	3 March 2013	4 March 2013	Expired	KPMG	30	37	7	0
6	8	27	7 July 2014	8 July 2014	Current	KPMG Consulantcy	30	23	1	8
7	8	14	17 Sept 2013	19 Sept 2013	Expired	KPMG	30	31	2	1
8	8	14	3 May 2014	5 May 2014	Current	KPMG	30	27	1	4
9	8	16	14 Aug 2014	16 Aug 2014	Current	KPMG	50	37	2	15
10	9	18	17 Sept 2014	19 Sept 2014	Current	Arthur Anderson Consultancy	30	27	1	4
11	9	15	5 Oct 2014	6 Oct 2014	Current	Arthur Anderson Consultancy	30	21	1	19
\.


--
-- Name: tmprpt_partipantbyact_rpa_id_seq; Type: SEQUENCE SET; Schema: shine; Owner: shine
--

SELECT pg_catalog.setval('tmprpt_partipantbyact_rpa_id_seq', 11, true);


--
-- Name: const_fclog_prikey; Type: CONSTRAINT; Schema: shine; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY fclog
    ADD CONSTRAINT const_fclog_prikey PRIMARY KEY (log_id);


--
-- Name: const_fcpmcaseflow_prikey; Type: CONSTRAINT; Schema: shine; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY fcpmcaseflow
    ADD CONSTRAINT const_fcpmcaseflow_prikey PRIMARY KEY (f_id);


--
-- Name: const_fcpmcasetype_prikey; Type: CONSTRAINT; Schema: shine; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY fcpmcasetype
    ADD CONSTRAINT const_fcpmcasetype_prikey PRIMARY KEY (ct_code);


--
-- Name: const_fcpmoperation_prikey; Type: CONSTRAINT; Schema: shine; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY fcpmoperation
    ADD CONSTRAINT const_fcpmoperation_prikey PRIMARY KEY (op_id);


--
-- Name: const_fcpmoperationtype_prikey; Type: CONSTRAINT; Schema: shine; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY fcpmoperationtype
    ADD CONSTRAINT const_fcpmoperationtype_prikey PRIMARY KEY (opt_code);


--
-- Name: const_fcpmworkflow_prikey; Type: CONSTRAINT; Schema: shine; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY fcpmworkflow
    ADD CONSTRAINT const_fcpmworkflow_prikey PRIMARY KEY (wf_id);


--
-- Name: const_fcrule_prikey; Type: CONSTRAINT; Schema: shine; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY fcrule
    ADD CONSTRAINT const_fcrule_prikey PRIMARY KEY (ru_id);


--
-- Name: const_fcudv_prikey; Type: CONSTRAINT; Schema: shine; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY fcudv
    ADD CONSTRAINT const_fcudv_prikey PRIMARY KEY (udv_code);


--
-- Name: const_fcuserdiary_prikey; Type: CONSTRAINT; Schema: shine; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY fcuserdiary
    ADD CONSTRAINT const_fcuserdiary_prikey PRIMARY KEY (di_id);


--
-- Name: const_hlookup_prikey; Type: CONSTRAINT; Schema: shine; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY fclookup
    ADD CONSTRAINT const_hlookup_prikey PRIMARY KEY (lu_id);


--
-- Name: const_hlookup_unikey; Type: CONSTRAINT; Schema: shine; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY fclookup
    ADD CONSTRAINT const_hlookup_unikey UNIQUE (lu_cat, lu_code);


--
-- Name: const_shactivity_prikey; Type: CONSTRAINT; Schema: shine; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY shactivity
    ADD CONSTRAINT const_shactivity_prikey PRIMARY KEY (atv_id);


--
-- Name: const_shactivityattend_prikey; Type: CONSTRAINT; Schema: shine; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY shactivityattend
    ADD CONSTRAINT const_shactivityattend_prikey PRIMARY KEY (atat_id);


--
-- Name: const_shactivityevent_prikey; Type: CONSTRAINT; Schema: shine; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY shactivityevent
    ADD CONSTRAINT const_shactivityevent_prikey PRIMARY KEY (atve_id);


--
-- Name: const_shactivitypart_prikey; Type: CONSTRAINT; Schema: shine; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY shactivitypart
    ADD CONSTRAINT const_shactivitypart_prikey PRIMARY KEY (atpt_id);


--
-- Name: const_shactivitypoint_prikey; Type: CONSTRAINT; Schema: shine; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY shactivitypoint
    ADD CONSTRAINT const_shactivitypoint_prikey PRIMARY KEY (atp_id);


--
-- Name: const_shactivityschedule_prikey; Type: CONSTRAINT; Schema: shine; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY shactivityschedule
    ADD CONSTRAINT const_shactivityschedule_prikey PRIMARY KEY (ats_id);


--
-- Name: const_shadhocactivity_prikey; Type: CONSTRAINT; Schema: shine; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY shadhocactivity
    ADD CONSTRAINT const_shadhocactivity_prikey PRIMARY KEY (aha_id);


--
-- Name: const_shatutorialsetup_prikey; Type: CONSTRAINT; Schema: shine; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY shatutorialsetup
    ADD CONSTRAINT const_shatutorialsetup_prikey PRIMARY KEY (tut_id);


--
-- Name: const_shaward_prikey; Type: CONSTRAINT; Schema: shine; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY shaward
    ADD CONSTRAINT const_shaward_prikey PRIMARY KEY (aw_id);


--
-- Name: const_shawardpoint_prikey; Type: CONSTRAINT; Schema: shine; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY shawardpoint
    ADD CONSTRAINT const_shawardpoint_prikey PRIMARY KEY (awp_id);


--
-- Name: const_shawardwinner_prikey; Type: CONSTRAINT; Schema: shine; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY shawardwinner
    ADD CONSTRAINT const_shawardwinner_prikey PRIMARY KEY (aww_id);


--
-- Name: const_shfacilitator_prikey; Type: CONSTRAINT; Schema: shine; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY shfacilitator
    ADD CONSTRAINT const_shfacilitator_prikey PRIMARY KEY (fac_id);


--
-- Name: const_shpackage_prikey; Type: CONSTRAINT; Schema: shine; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY shpackage
    ADD CONSTRAINT const_shpackage_prikey PRIMARY KEY (pk_id);


--
-- Name: const_shpoint_prikey; Type: CONSTRAINT; Schema: shine; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY shpoint
    ADD CONSTRAINT const_shpoint_prikey PRIMARY KEY (pts_id);


--
-- Name: const_shreflection_prikey; Type: CONSTRAINT; Schema: shine; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY shreflection
    ADD CONSTRAINT const_shreflection_prikey PRIMARY KEY (rfl_id);


--
-- Name: const_shtsat_prikey; Type: CONSTRAINT; Schema: shine; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY shtsat
    ADD CONSTRAINT const_shtsat_prikey PRIMARY KEY (tst_id);


--
-- Name: const_shtsatanswer_prikey; Type: CONSTRAINT; Schema: shine; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY shtsatanswer
    ADD CONSTRAINT const_shtsatanswer_prikey PRIMARY KEY (tsa_id);


--
-- Name: const_shtsatquestion_prikey; Type: CONSTRAINT; Schema: shine; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY shtsatquestion
    ADD CONSTRAINT const_shtsatquestion_prikey PRIMARY KEY (tsq_id);


--
-- Name: const_shtsatquestioncat_prikey; Type: CONSTRAINT; Schema: shine; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY shtsatquestioncat
    ADD CONSTRAINT const_shtsatquestioncat_prikey PRIMARY KEY (qst_id);


--
-- Name: const_shtsatresult_prikey; Type: CONSTRAINT; Schema: shine; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY shtsatresult
    ADD CONSTRAINT const_shtsatresult_prikey PRIMARY KEY (tsr_id);


--
-- Name: const_shtsatresultanswer_prikey; Type: CONSTRAINT; Schema: shine; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY shtsatresultanswer
    ADD CONSTRAINT const_shtsatresultanswer_prikey PRIMARY KEY (tsra_id);


--
-- Name: const_shuserextrainfo_prikey; Type: CONSTRAINT; Schema: shine; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY shuserextrainfo
    ADD CONSTRAINT const_shuserextrainfo_prikey PRIMARY KEY (eif_id);


--
-- Name: const_shvenue_prikey; Type: CONSTRAINT; Schema: shine; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY shvenue
    ADD CONSTRAINT const_shvenue_prikey PRIMARY KEY (vn_id);


--
-- Name: const_tmprpt_activitybystudent_prikey; Type: CONSTRAINT; Schema: shine; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY tmprpt_activitybystudent
    ADD CONSTRAINT const_tmprpt_activitybystudent_prikey PRIMARY KEY (ras_id);


--
-- Name: const_tmprpt_award_prikey; Type: CONSTRAINT; Schema: shine; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY tmprpt_award
    ADD CONSTRAINT const_tmprpt_award_prikey PRIMARY KEY (raw_id);


--
-- Name: const_tmprpt_partipantbyact_prikey; Type: CONSTRAINT; Schema: shine; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY tmprpt_partipantbyact
    ADD CONSTRAINT const_tmprpt_partipantbyact_prikey PRIMARY KEY (rpa_id);


--
-- Name: const_vlang_prikey; Type: CONSTRAINT; Schema: shine; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY fclang
    ADD CONSTRAINT const_vlang_prikey PRIMARY KEY (lang_id);


--
-- Name: const_vlang_unikey; Type: CONSTRAINT; Schema: shine; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY fclang
    ADD CONSTRAINT const_vlang_unikey UNIQUE (lang_code);


--
-- Name: const_vmenu_prikey; Type: CONSTRAINT; Schema: shine; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY fcmenu
    ADD CONSTRAINT const_vmenu_prikey PRIMARY KEY (mn_id);


--
-- Name: const_vmenu_unikey; Type: CONSTRAINT; Schema: shine; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY fcmenu
    ADD CONSTRAINT const_vmenu_unikey UNIQUE (mn_code);


--
-- Name: const_vorg_prikey; Type: CONSTRAINT; Schema: shine; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY fcorg
    ADD CONSTRAINT const_vorg_prikey PRIMARY KEY (org_id);


--
-- Name: const_vorg_unikey; Type: CONSTRAINT; Schema: shine; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY fcorg
    ADD CONSTRAINT const_vorg_unikey UNIQUE (org_code);


--
-- Name: const_vpermission_prikey; Type: CONSTRAINT; Schema: shine; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY fcpermission
    ADD CONSTRAINT const_vpermission_prikey PRIMARY KEY (pms_id);


--
-- Name: const_vpermission_unikey; Type: CONSTRAINT; Schema: shine; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY fcpermission
    ADD CONSTRAINT const_vpermission_unikey UNIQUE (pms_code);


--
-- Name: const_vrole_prikey; Type: CONSTRAINT; Schema: shine; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY fcrole
    ADD CONSTRAINT const_vrole_prikey PRIMARY KEY (rol_id);


--
-- Name: const_vrole_unikey; Type: CONSTRAINT; Schema: shine; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY fcrole
    ADD CONSTRAINT const_vrole_unikey UNIQUE (rol_code);


--
-- Name: const_vroleperm_prikey; Type: CONSTRAINT; Schema: shine; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY fcroleperm
    ADD CONSTRAINT const_vroleperm_prikey PRIMARY KEY (rp_id);


--
-- Name: const_vroleperm_unikey; Type: CONSTRAINT; Schema: shine; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY fcroleperm
    ADD CONSTRAINT const_vroleperm_unikey UNIQUE (rp_rolid, rp_pmsid);


--
-- Name: const_vsetting_prikey; Type: CONSTRAINT; Schema: shine; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY fcsetting
    ADD CONSTRAINT const_vsetting_prikey PRIMARY KEY (set_id);


--
-- Name: const_vsetting_unikey; Type: CONSTRAINT; Schema: shine; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY fcsetting
    ADD CONSTRAINT const_vsetting_unikey UNIQUE (set_user, set_code);


--
-- Name: const_vuser_prikey; Type: CONSTRAINT; Schema: shine; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY fcuser
    ADD CONSTRAINT const_vuser_prikey PRIMARY KEY (usr_userid);


--
-- Name: const_vuserlogin_prikey; Type: CONSTRAINT; Schema: shine; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY fcuserlogin
    ADD CONSTRAINT const_vuserlogin_prikey PRIMARY KEY (ul_id);


--
-- Name: const_vuserorgrole_prikey; Type: CONSTRAINT; Schema: shine; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY fcuserorgrole
    ADD CONSTRAINT const_vuserorgrole_prikey PRIMARY KEY (uor_id);


--
-- Name: const_vuserorgrole_unikey; Type: CONSTRAINT; Schema: shine; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY fcuserorgrole
    ADD CONSTRAINT const_vuserorgrole_unikey UNIQUE (uor_usrid, uor_orgid, uor_rolid);


--
-- Name: const_vusersession_prikey; Type: CONSTRAINT; Schema: shine; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY fcusersession
    ADD CONSTRAINT const_vusersession_prikey PRIMARY KEY (us_id);


--
-- Name: country_prikey; Type: CONSTRAINT; Schema: shine; Owner: shine; Tablespace: 
--

ALTER TABLE ONLY fccountry
    ADD CONSTRAINT country_prikey PRIMARY KEY (con_code);


--
-- Name: idx_vsetting_code_user; Type: INDEX; Schema: shine; Owner: shine; Tablespace: 
--

CREATE UNIQUE INDEX idx_vsetting_code_user ON fcsetting USING btree (set_user, set_code);


--
-- Name: usersession_idx1; Type: INDEX; Schema: shine; Owner: shine; Tablespace: 
--

CREATE INDEX usersession_idx1 ON fcusersession USING btree (us_sessid);


--
-- Name: usersession_idx2; Type: INDEX; Schema: shine; Owner: shine; Tablespace: 
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

