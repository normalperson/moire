PGDMP                           r            pnd    9.3.4    9.3.4 2   �	           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �	           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false                        2615    24580    pnd    SCHEMA        CREATE SCHEMA pnd;
    DROP SCHEMA pnd;
             pnd    false            
           1255    24581    generatedata()    FUNCTION     �'  CREATE FUNCTION generatedata() RETURNS void
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
 "   DROP FUNCTION pnd.generatedata();
       pnd       pnd    false    7                       1255    24582 $   get_random_integer(integer, integer)    FUNCTION     �   CREATE FUNCTION get_random_integer(integer, integer) RETURNS integer
    LANGUAGE plpgsql STRICT
    AS $_$
DECLARE
    start_int ALIAS FOR $1;
    end_int ALIAS FOR $2;
BEGIN
    RETURN trunc(random() * (end_int-start_int) + start_int);
END;
$_$;
 8   DROP FUNCTION pnd.get_random_integer(integer, integer);
       pnd       pnd    false    7            �            1259    24583 	   fccountry    TABLE     n   CREATE TABLE fccountry (
    con_code character varying(24) NOT NULL,
    con_name character varying(1000)
);
    DROP TABLE pnd.fccountry;
       pnd         pnd    false    7            �            1259    24589    fcdoc    TABLE     �  CREATE TABLE fcdoc (
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
    DROP TABLE pnd.fcdoc;
       pnd         pnd    false    7            �            1259    24596    fcdoc_fd_id_seq    SEQUENCE     q   CREATE SEQUENCE fcdoc_fd_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE pnd.fcdoc_fd_id_seq;
       pnd       pnd    false    7    172            �	           0    0    fcdoc_fd_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE fcdoc_fd_id_seq OWNED BY fcdoc.fd_id;
            pnd       pnd    false    173            �            1259    24598    fclang    TABLE     �   CREATE TABLE fclang (
    lang_code character varying(5) NOT NULL,
    lang_name character varying(200),
    lang_status character varying(12) DEFAULT 'ACTIVE'::character varying
);
    DROP TABLE pnd.fclang;
       pnd         pnd    false    7            �	           0    0    TABLE fclang    COMMENT     (   COMMENT ON TABLE fclang IS 'ISO 639-1';
            pnd       pnd    false    174            �            1259    25527    fclocale    TABLE     �   CREATE TABLE fclocale (
    lc_code character varying(32) NOT NULL,
    lc_description character varying(100),
    lc_primary_langcode character varying(5),
    lc_tzcode character varying(100)
);
    DROP TABLE pnd.fclocale;
       pnd         pnd    false    7            �            1259    25534    fclocaleholiday    TABLE     �   CREATE TABLE fclocaleholiday (
    lch_id integer NOT NULL,
    lch_lccode character varying(32),
    lch_date date,
    lch_recurring character varying(1) DEFAULT 'Y'::character varying,
    lch_description character varying(100)
);
     DROP TABLE pnd.fclocaleholiday;
       pnd         pnd    false    7            �            1259    25532    fclocaleholiday_lch_id_seq    SEQUENCE     |   CREATE SEQUENCE fclocaleholiday_lch_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE pnd.fclocaleholiday_lch_id_seq;
       pnd       pnd    false    240    7            �	           0    0    fclocaleholiday_lch_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE fclocaleholiday_lch_id_seq OWNED BY fclocaleholiday.lch_id;
            pnd       pnd    false    239            �            1259    25549    fclocaleworkinghour    TABLE     �   CREATE TABLE fclocaleworkinghour (
    lcw_id integer NOT NULL,
    lcw_lccode character varying(32),
    lcw_day character varying(3),
    lcw_start_time time without time zone,
    lcw_end_time time without time zone
);
 $   DROP TABLE pnd.fclocaleworkinghour;
       pnd         pnd    false    7            �            1259    25547    fclocaleworkinghour_lcw_id_seq    SEQUENCE     �   CREATE SEQUENCE fclocaleworkinghour_lcw_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE pnd.fclocaleworkinghour_lcw_id_seq;
       pnd       pnd    false    7    242            �	           0    0    fclocaleworkinghour_lcw_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE fclocaleworkinghour_lcw_id_seq OWNED BY fclocaleworkinghour.lcw_id;
            pnd       pnd    false    241            �            1259    24602    fclog    TABLE     J  CREATE TABLE fclog (
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
    DROP TABLE pnd.fclog;
       pnd         pnd    false    7            �            1259    24609    fclog_log_id_seq    SEQUENCE     r   CREATE SEQUENCE fclog_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE pnd.fclog_log_id_seq;
       pnd       pnd    false    175    7            �	           0    0    fclog_log_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE fclog_log_id_seq OWNED BY fclog.log_id;
            pnd       pnd    false    176            �            1259    24611    fclookup    TABLE     N  CREATE TABLE fclookup (
    lu_cat character varying(12) NOT NULL,
    lu_code character varying(50) NOT NULL,
    lu_parentcode character varying(12) DEFAULT 'ROOT'::character varying NOT NULL,
    lu_title character varying(50),
    lu_status character varying(12) DEFAULT 'ACTIVE'::character varying,
    lu_id integer NOT NULL
);
    DROP TABLE pnd.fclookup;
       pnd         pnd    false    7            �            1259    24616    fclookup_lu_id_seq    SEQUENCE     t   CREATE SEQUENCE fclookup_lu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE pnd.fclookup_lu_id_seq;
       pnd       pnd    false    7    177            �	           0    0    fclookup_lu_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE fclookup_lu_id_seq OWNED BY fclookup.lu_id;
            pnd       pnd    false    178            �            1259    24618    fcmenu    TABLE     T  CREATE TABLE fcmenu (
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
    DROP TABLE pnd.fcmenu;
       pnd         shine    false    7            �            1259    24625    fcmenu_mn_id_seq    SEQUENCE     r   CREATE SEQUENCE fcmenu_mn_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE pnd.fcmenu_mn_id_seq;
       pnd       shine    false    179    7            �	           0    0    fcmenu_mn_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE fcmenu_mn_id_seq OWNED BY fcmenu.mn_id;
            pnd       shine    false    180            �            1259    24627    fcmenu_mn_parentid_seq    SEQUENCE     x   CREATE SEQUENCE fcmenu_mn_parentid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE pnd.fcmenu_mn_parentid_seq;
       pnd       shine    false    179    7            �	           0    0    fcmenu_mn_parentid_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE fcmenu_mn_parentid_seq OWNED BY fcmenu.mn_parentid;
            pnd       shine    false    181            �            1259    24629    fcorg    TABLE     �  CREATE TABLE fcorg (
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
    DROP TABLE pnd.fcorg;
       pnd         pnd    false    7            �	           0    0    COLUMN fcorg.org_lccode    COMMENT     0   COMMENT ON COLUMN fcorg.org_lccode IS 'Locale';
            pnd       pnd    false    182            �            1259    24638    fcorg_org_id_seq    SEQUENCE     r   CREATE SEQUENCE fcorg_org_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE pnd.fcorg_org_id_seq;
       pnd       pnd    false    182    7            �	           0    0    fcorg_org_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE fcorg_org_id_seq OWNED BY fcorg.org_id;
            pnd       pnd    false    183            �            1259    24640    fcpermission    TABLE     q   CREATE TABLE fcpermission (
    pms_code character varying(50) NOT NULL,
    pms_desc character varying(2000)
);
    DROP TABLE pnd.fcpermission;
       pnd         pnd    false    7            �            1259    24646    fcpmactivity_pmat_id_seq    SEQUENCE     z   CREATE SEQUENCE fcpmactivity_pmat_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE pnd.fcpmactivity_pmat_id_seq;
       pnd       pnd    false    7            �            1259    24648    fcpmactivity    TABLE     �  CREATE TABLE fcpmactivity (
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
    DROP TABLE pnd.fcpmactivity;
       pnd         pnd    false    185    7            �	           0    0 %   COLUMN fcpmactivity.pmat_sla_interval    COMMENT     d   COMMENT ON COLUMN fcpmactivity.pmat_sla_interval IS 'format follow PHP DateInterval interval_spec';
            pnd       pnd    false    186            �            1259    24652    fcpmcase    TABLE     �  CREATE TABLE fcpmcase (
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
    DROP TABLE pnd.fcpmcase;
       pnd         pnd    false    7            �            1259    24656    fcpmcase_pmc_id_seq    SEQUENCE     u   CREATE SEQUENCE fcpmcase_pmc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE pnd.fcpmcase_pmc_id_seq;
       pnd       pnd    false    187    7            �	           0    0    fcpmcase_pmc_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE fcpmcase_pmc_id_seq OWNED BY fcpmcase.pmc_id;
            pnd       pnd    false    188            �            1259    24658    fcpmcasecomment    TABLE     �  CREATE TABLE fcpmcasecomment (
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
     DROP TABLE pnd.fcpmcasecomment;
       pnd         pnd    false    7            �            1259    24666    fcpmcasecomment_pmcc_id_seq    SEQUENCE     }   CREATE SEQUENCE fcpmcasecomment_pmcc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE pnd.fcpmcasecomment_pmcc_id_seq;
       pnd       pnd    false    7    189            �	           0    0    fcpmcasecomment_pmcc_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE fcpmcasecomment_pmcc_id_seq OWNED BY fcpmcasecomment.pmcc_id;
            pnd       pnd    false    190            �            1259    24668    fcpmcasecommentread    TABLE     �   CREATE TABLE fcpmcasecommentread (
    pmcr_id integer NOT NULL,
    pmcr_pmccid integer,
    pmcr_read_by character varying(100),
    pmcr_read_date timestamp with time zone DEFAULT now()
);
 $   DROP TABLE pnd.fcpmcasecommentread;
       pnd         pnd    false    7            �            1259    24672    fcpmcasecommentread_pmcr_id_seq    SEQUENCE     �   CREATE SEQUENCE fcpmcasecommentread_pmcr_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE pnd.fcpmcasecommentread_pmcr_id_seq;
       pnd       pnd    false    7    191            �	           0    0    fcpmcasecommentread_pmcr_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE fcpmcasecommentread_pmcr_id_seq OWNED BY fcpmcasecommentread.pmcr_id;
            pnd       pnd    false    192            �            1259    25490    fcpmcaseflag    TABLE     �   CREATE TABLE fcpmcaseflag (
    pmcf_id integer NOT NULL,
    pmcf_pmcid integer,
    pmcf_flag_by character varying(100),
    pmcf_flag_date timestamp with time zone DEFAULT now(),
    pmcf_flag_type character varying(12)
);
    DROP TABLE pnd.fcpmcaseflag;
       pnd         pnd    false    7            �            1259    25488    fcpmcaseflag_pmcf_id_seq    SEQUENCE     z   CREATE SEQUENCE fcpmcaseflag_pmcf_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE pnd.fcpmcaseflag_pmcf_id_seq;
       pnd       pnd    false    7    237            �	           0    0    fcpmcaseflag_pmcf_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE fcpmcaseflag_pmcf_id_seq OWNED BY fcpmcaseflag.pmcf_id;
            pnd       pnd    false    236            �            1259    24674    fcpmcaseflow    TABLE     �  CREATE TABLE fcpmcaseflow (
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
    DROP TABLE pnd.fcpmcaseflow;
       pnd         pnd    false    7            �	           0    0 *   COLUMN fcpmcaseflow.pmf_from_event_gateway    COMMENT     Z   COMMENT ON COLUMN fcpmcaseflow.pmf_from_event_gateway IS 'Last flow is an event gateway';
            pnd       pnd    false    193            �            1259    24677    fcpmcaseflow_pmf_id_seq    SEQUENCE     y   CREATE SEQUENCE fcpmcaseflow_pmf_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE pnd.fcpmcaseflow_pmf_id_seq;
       pnd       pnd    false    7    193            �	           0    0    fcpmcaseflow_pmf_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE fcpmcaseflow_pmf_id_seq OWNED BY fcpmcaseflow.pmf_id;
            pnd       pnd    false    194            �            1259    25605    fcpmcaseflowassign    TABLE     �   CREATE TABLE fcpmcaseflowassign (
    pmfa_id integer NOT NULL,
    pmfa_pmfid integer,
    pmfa_userid character varying(100),
    pmfa_orgid integer,
    pmfa_rolid integer
);
 #   DROP TABLE pnd.fcpmcaseflowassign;
       pnd         pnd    false    7            �            1259    25603    fcpmcaseflowassign_pmfa_id_seq    SEQUENCE     �   CREATE SEQUENCE fcpmcaseflowassign_pmfa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE pnd.fcpmcaseflowassign_pmfa_id_seq;
       pnd       pnd    false    7    250            �	           0    0    fcpmcaseflowassign_pmfa_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE fcpmcaseflowassign_pmfa_id_seq OWNED BY fcpmcaseflowassign.pmfa_id;
            pnd       pnd    false    249            �            1259    24679    fcpmcasetype    TABLE       CREATE TABLE fcpmcasetype (
    pmct_code character varying(32) NOT NULL,
    pmct_desc character varying(100),
    pmct_table character varying(100),
    pmct_key_col character varying(100),
    pmct_desc_col character varying(100),
    pmct_caseinfo_function character varying(100)
);
    DROP TABLE pnd.fcpmcasetype;
       pnd         pnd    false    7            �            1259    24682    fcpmconnector    TABLE       CREATE TABLE fcpmconnector (
    pmcn_id integer NOT NULL,
    pmcn_from_type character varying(100),
    pmcn_from_id integer,
    pmcn_to_type character varying(100),
    pmcn_to_id integer,
    pmcn_order integer,
    pmcn_type character varying(32),
    pmcn_ruid integer
);
    DROP TABLE pnd.fcpmconnector;
       pnd         pnd    false    7            �            1259    24685    fcpmconnector_pmcn_id_seq    SEQUENCE     {   CREATE SEQUENCE fcpmconnector_pmcn_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE pnd.fcpmconnector_pmcn_id_seq;
       pnd       pnd    false    196    7            �	           0    0    fcpmconnector_pmcn_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE fcpmconnector_pmcn_id_seq OWNED BY fcpmconnector.pmcn_id;
            pnd       pnd    false    197            �            1259    25564 	   fcpmevent    TABLE     H  CREATE TABLE fcpmevent (
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
    pmev_timer_non_interrupt_once character varying(1)
);
    DROP TABLE pnd.fcpmevent;
       pnd         pnd    false    7            �	           0    0 #   COLUMN fcpmevent.pmev_attach_pmatid    COMMENT     X   COMMENT ON COLUMN fcpmevent.pmev_attach_pmatid IS 'if event is attached to a activity';
            pnd       pnd    false    244            �            1259    25562    fcpmevent_pmev_id_seq    SEQUENCE     w   CREATE SEQUENCE fcpmevent_pmev_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE pnd.fcpmevent_pmev_id_seq;
       pnd       pnd    false    244    7            �	           0    0    fcpmevent_pmev_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE fcpmevent_pmev_id_seq OWNED BY fcpmevent.pmev_id;
            pnd       pnd    false    243            �            1259    25573    fcpmgateway    TABLE     �   CREATE TABLE fcpmgateway (
    pmgw_id integer NOT NULL,
    pmgw_pmwfid integer,
    pmgw_pmslid integer,
    pmgw_name character varying(100),
    pmgw_type character varying(32),
    pmgw_type_cat character varying(32)
);
    DROP TABLE pnd.fcpmgateway;
       pnd         pnd    false    7            �            1259    25571    fcpmgateway_pmgw_id_seq    SEQUENCE     y   CREATE SEQUENCE fcpmgateway_pmgw_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE pnd.fcpmgateway_pmgw_id_seq;
       pnd       pnd    false    246    7            �	           0    0    fcpmgateway_pmgw_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE fcpmgateway_pmgw_id_seq OWNED BY fcpmgateway.pmgw_id;
            pnd       pnd    false    245            �            1259    24697    fcpmswimlane    TABLE     �   CREATE TABLE fcpmswimlane (
    pmsl_id integer NOT NULL,
    pmsl_pmwfid integer,
    pmsl_name character varying(100),
    pmsl_order integer
);
    DROP TABLE pnd.fcpmswimlane;
       pnd         pnd    false    7            �            1259    24700    fcpmswimlane_pmsl_id_seq    SEQUENCE     z   CREATE SEQUENCE fcpmswimlane_pmsl_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE pnd.fcpmswimlane_pmsl_id_seq;
       pnd       pnd    false    7    198            �	           0    0    fcpmswimlane_pmsl_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE fcpmswimlane_pmsl_id_seq OWNED BY fcpmswimlane.pmsl_id;
            pnd       pnd    false    199            �            1259    25597    fcpmswimlanesetup    TABLE     �   CREATE TABLE fcpmswimlanesetup (
    pmss_id integer NOT NULL,
    pmss_pmslid integer,
    pmss_userid character varying(100),
    pmss_orgid character varying(100),
    pmss_rolid character varying(100)
);
 "   DROP TABLE pnd.fcpmswimlanesetup;
       pnd         pnd    false    7            �            1259    25595    fcpmswimlanesetup_pmss_id_seq    SEQUENCE        CREATE SEQUENCE fcpmswimlanesetup_pmss_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE pnd.fcpmswimlanesetup_pmss_id_seq;
       pnd       pnd    false    7    248            �	           0    0    fcpmswimlanesetup_pmss_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE fcpmswimlanesetup_pmss_id_seq OWNED BY fcpmswimlanesetup.pmss_id;
            pnd       pnd    false    247            �            1259    24702    fcpmworkflow    TABLE     b   CREATE TABLE fcpmworkflow (
    pmwf_id integer NOT NULL,
    pmwf_name character varying(100)
);
    DROP TABLE pnd.fcpmworkflow;
       pnd         pnd    false    7            �            1259    24705    fcpmworkflow_pmwf_id_seq    SEQUENCE     z   CREATE SEQUENCE fcpmworkflow_pmwf_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE pnd.fcpmworkflow_pmwf_id_seq;
       pnd       pnd    false    200    7            �	           0    0    fcpmworkflow_pmwf_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE fcpmworkflow_pmwf_id_seq OWNED BY fcpmworkflow.pmwf_id;
            pnd       pnd    false    201            �            1259    24707    fcrole    TABLE     [   CREATE TABLE fcrole (
    rol_id integer NOT NULL,
    rol_name character varying(2000)
);
    DROP TABLE pnd.fcrole;
       pnd         pnd    false    7            �            1259    24713    fcrole_rol_id_seq    SEQUENCE     s   CREATE SEQUENCE fcrole_rol_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE pnd.fcrole_rol_id_seq;
       pnd       pnd    false    7    202            �	           0    0    fcrole_rol_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE fcrole_rol_id_seq OWNED BY fcrole.rol_id;
            pnd       pnd    false    203            �            1259    24715 
   fcroleperm    TABLE     t   CREATE TABLE fcroleperm (
    rp_id integer NOT NULL,
    rp_rolid integer,
    rp_pmscode character varying(50)
);
    DROP TABLE pnd.fcroleperm;
       pnd         pnd    false    7            �            1259    24718    fcroleperm_rp_id_seq    SEQUENCE     v   CREATE SEQUENCE fcroleperm_rp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE pnd.fcroleperm_rp_id_seq;
       pnd       pnd    false    204    7            �	           0    0    fcroleperm_rp_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE fcroleperm_rp_id_seq OWNED BY fcroleperm.rp_id;
            pnd       pnd    false    205            �            1259    24720    fcrule    TABLE     �   CREATE TABLE fcrule (
    ru_id integer NOT NULL,
    ru_name character varying(100),
    ru_true_msg character varying(200),
    ru_false_msg character varying(200),
    ru_data character varying(4000)
);
    DROP TABLE pnd.fcrule;
       pnd         pnd    false    7            �            1259    24726    fcrule_ru_id_seq    SEQUENCE     r   CREATE SEQUENCE fcrule_ru_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE pnd.fcrule_ru_id_seq;
       pnd       pnd    false    206    7            �	           0    0    fcrule_ru_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE fcrule_ru_id_seq OWNED BY fcrule.ru_id;
            pnd       pnd    false    207            �            1259    24728 	   fcsetting    TABLE     �   CREATE TABLE fcsetting (
    set_id integer NOT NULL,
    set_user character varying(100) DEFAULT 'shine'::character varying,
    set_code character varying(32),
    set_description character varying(4000),
    set_val character varying(1000)
);
    DROP TABLE pnd.fcsetting;
       pnd         pnd    false    7            �	           0    0    COLUMN fcsetting.set_id    COMMENT     4   COMMENT ON COLUMN fcsetting.set_id IS 'setting id';
            pnd       pnd    false    208            �	           0    0     COLUMN fcsetting.set_description    COMMENT     F   COMMENT ON COLUMN fcsetting.set_description IS 'setting description';
            pnd       pnd    false    208            �	           0    0    COLUMN fcsetting.set_val    COMMENT     8   COMMENT ON COLUMN fcsetting.set_val IS 'setting value';
            pnd       pnd    false    208            �            1259    24735    fcsetting_set_id_seq    SEQUENCE     v   CREATE SEQUENCE fcsetting_set_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE pnd.fcsetting_set_id_seq;
       pnd       pnd    false    208    7            �	           0    0    fcsetting_set_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE fcsetting_set_id_seq OWNED BY fcsetting.set_id;
            pnd       pnd    false    209            �            1259    24737    fcudv    TABLE     �  CREATE TABLE fcudv (
    udv_code character varying(32) NOT NULL,
    udv_name character varying(100),
    udv_query_type character varying(12),
    udv_query character varying(4000),
    udv_return_type character varying(12) DEFAULT 'CELL'::character varying,
    udv_result_type character varying(12),
    udv_result_lookup_type character varying(12),
    udv_result_lookup character varying(4000)
);
    DROP TABLE pnd.fcudv;
       pnd         pnd    false    7            �            1259    24744    fcuser    TABLE     8  CREATE TABLE fcuser (
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
    DROP TABLE pnd.fcuser;
       pnd         pnd    false    7            �            1259    26867    fcuserdiary    TABLE       CREATE TABLE fcuserdiary (
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
    DROP TABLE pnd.fcuserdiary;
       pnd         pnd    false    7            �            1259    26865    fcuserdiary_di_id_seq    SEQUENCE     w   CREATE SEQUENCE fcuserdiary_di_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE pnd.fcuserdiary_di_id_seq;
       pnd       pnd    false    252    7            �	           0    0    fcuserdiary_di_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE fcuserdiary_di_id_seq OWNED BY fcuserdiary.di_id;
            pnd       pnd    false    251            �            1259    24762    fcuserlogin    TABLE     �  CREATE TABLE fcuserlogin (
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
    DROP TABLE pnd.fcuserlogin;
       pnd         pnd    false    7            �            1259    24768    fcuserlogin_ul_id_seq    SEQUENCE     w   CREATE SEQUENCE fcuserlogin_ul_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE pnd.fcuserlogin_ul_id_seq;
       pnd       pnd    false    212    7            �	           0    0    fcuserlogin_ul_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE fcuserlogin_ul_id_seq OWNED BY fcuserlogin.ul_id;
            pnd       pnd    false    213            �            1259    24770    fcuserorgrole    TABLE     �   CREATE TABLE fcuserorgrole (
    uor_id integer NOT NULL,
    uor_usrid character varying(50),
    uor_orgid integer,
    uor_rolid integer,
    uor_seq integer
);
    DROP TABLE pnd.fcuserorgrole;
       pnd         pnd    false    7            �            1259    24773    fcuserorgrole_uor_id_seq    SEQUENCE     z   CREATE SEQUENCE fcuserorgrole_uor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE pnd.fcuserorgrole_uor_id_seq;
       pnd       pnd    false    7    214            �	           0    0    fcuserorgrole_uor_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE fcuserorgrole_uor_id_seq OWNED BY fcuserorgrole.uor_id;
            pnd       pnd    false    215            �            1259    24775    fcusersession    TABLE     x  CREATE TABLE fcusersession (
    us_id integer NOT NULL,
    us_sessid character varying(40),
    us_userid character varying(50),
    us_ip character varying(45),
    us_active character varying(4) DEFAULT 'Y'::character varying,
    us_created timestamp with time zone DEFAULT now(),
    us_last_active timestamp with time zone DEFAULT now(),
    us_forcecloseby integer
);
    DROP TABLE pnd.fcusersession;
       pnd         pnd    false    7            �	           0    0    COLUMN fcusersession.us_sessid    COMMENT     ?   COMMENT ON COLUMN fcusersession.us_sessid IS 'PHP session id';
            pnd       pnd    false    216            �            1259    24781    fcusersession_us_id_seq    SEQUENCE     y   CREATE SEQUENCE fcusersession_us_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE pnd.fcusersession_us_id_seq;
       pnd       pnd    false    216    7            �	           0    0    fcusersession_us_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE fcusersession_us_id_seq OWNED BY fcusersession.us_id;
            pnd       pnd    false    217            �            1259    24783    mcarton    TABLE     [   CREATE TABLE mcarton (
    car_id integer NOT NULL,
    car_name character varying(200)
);
    DROP TABLE pnd.mcarton;
       pnd         pnd    false    7            �            1259    24786    mcarton_car_id_seq    SEQUENCE     t   CREATE SEQUENCE mcarton_car_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE pnd.mcarton_car_id_seq;
       pnd       pnd    false    218    7            �	           0    0    mcarton_car_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE mcarton_car_id_seq OWNED BY mcarton.car_id;
            pnd       pnd    false    219            �            1259    24788    mcartonvariable    TABLE     �   CREATE TABLE mcartonvariable (
    carv_code character varying(12),
    carv_unit character varying(12),
    carv_carid integer
);
     DROP TABLE pnd.mcartonvariable;
       pnd         pnd    false    7            �	           0    0 !   COLUMN mcartonvariable.carv_carid    COMMENT     Q   COMMENT ON COLUMN mcartonvariable.carv_carid IS 'foreign key to mcarton car_id';
            pnd       pnd    false    220            �            1259    24791    mjobcat    TABLE     `   CREATE TABLE mjobcat (
    jc_id integer NOT NULL,
    jc_jsid integer,
    jc_jclid integer
);
    DROP TABLE pnd.mjobcat;
       pnd         pnd    false    7            �            1259    24794    mjobcat_jc_id_seq    SEQUENCE     s   CREATE SEQUENCE mjobcat_jc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE pnd.mjobcat_jc_id_seq;
       pnd       pnd    false    7    221            �	           0    0    mjobcat_jc_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE mjobcat_jc_id_seq OWNED BY mjobcat.jc_id;
            pnd       pnd    false    222            �            1259    24796    mjobcatlookup    TABLE     �   CREATE TABLE mjobcatlookup (
    jcl_id integer NOT NULL,
    jcl_title character varying(200),
    jcl_requiretime integer,
    jcl_sequence integer
);
    DROP TABLE pnd.mjobcatlookup;
       pnd         pnd    false    7            �	           0    0 $   COLUMN mjobcatlookup.jcl_requiretime    COMMENT     T   COMMENT ON COLUMN mjobcatlookup.jcl_requiretime IS 'Require time store in minutes';
            pnd       pnd    false    223            �            1259    24799    mjobcatlookup_jcl_id_seq    SEQUENCE     z   CREATE SEQUENCE mjobcatlookup_jcl_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE pnd.mjobcatlookup_jcl_id_seq;
       pnd       pnd    false    223    7            �	           0    0    mjobcatlookup_jcl_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE mjobcatlookup_jcl_id_seq OWNED BY mjobcatlookup.jcl_id;
            pnd       pnd    false    224            �            1259    24801 	   mjobsheet    TABLE     �  CREATE TABLE mjobsheet (
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
    DROP TABLE pnd.mjobsheet;
       pnd         pnd    false    7            �	           0    0    COLUMN mjobsheet.js_primcat    COMMENT     B   COMMENT ON COLUMN mjobsheet.js_primcat IS 'primary job category';
            pnd       pnd    false    225            �            1259    24808    mjobsheet_js_id_seq    SEQUENCE     u   CREATE SEQUENCE mjobsheet_js_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE pnd.mjobsheet_js_id_seq;
       pnd       pnd    false    7    225            �	           0    0    mjobsheet_js_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE mjobsheet_js_id_seq OWNED BY mjobsheet.js_id;
            pnd       pnd    false    226            �            1259    24810    mjscartonvalue    TABLE     �   CREATE TABLE mjscartonvalue (
    caval_id integer NOT NULL,
    caval_value numeric(20,4),
    carval_carcode character varying(12)
);
    DROP TABLE pnd.mjscartonvalue;
       pnd         pnd    false    7            �            1259    24813    mjscartonvalue_caval_id_seq    SEQUENCE     }   CREATE SEQUENCE mjscartonvalue_caval_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE pnd.mjscartonvalue_caval_id_seq;
       pnd       pnd    false    7    227            �	           0    0    mjscartonvalue_caval_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE mjscartonvalue_caval_id_seq OWNED BY mjscartonvalue.caval_id;
            pnd       pnd    false    228            �            1259    24815 
   pndaddress    TABLE     �  CREATE TABLE pndaddress (
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
    DROP TABLE pnd.pndaddress;
       pnd         pnd    false    7            �            1259    24823    pndaddress_ad_id_seq    SEQUENCE     v   CREATE SEQUENCE pndaddress_ad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE pnd.pndaddress_ad_id_seq;
       pnd       pnd    false    229    7            �	           0    0    pndaddress_ad_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE pndaddress_ad_id_seq OWNED BY pndaddress.ad_id;
            pnd       pnd    false    230            �            1259    24825    pndartistskill    TABLE     i   CREATE TABLE pndartistskill (
    as_userid character varying(50),
    as_skill character varying(50)
);
    DROP TABLE pnd.pndartistskill;
       pnd         pnd    false    7            �            1259    24828 
   pndcontact    TABLE     �   CREATE TABLE pndcontact (
    ct_id integer NOT NULL,
    ct_refid integer,
    ct_reftype character varying(50),
    ct_name character varying(100),
    ct_email character varying(100)
);
    DROP TABLE pnd.pndcontact;
       pnd         pnd    false    7            �            1259    24831    pndcontact_ct_id_seq    SEQUENCE     v   CREATE SEQUENCE pndcontact_ct_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE pnd.pndcontact_ct_id_seq;
       pnd       pnd    false    232    7            �	           0    0    pndcontact_ct_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE pndcontact_ct_id_seq OWNED BY pndcontact.ct_id;
            pnd       pnd    false    233            �            1259    24833    pndphone    TABLE     t  CREATE TABLE pndphone (
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
    DROP TABLE pnd.pndphone;
       pnd         pnd    false    7            �            1259    24841    pndphone_ph_id_seq    SEQUENCE     t   CREATE SEQUENCE pndphone_ph_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE pnd.pndphone_ph_id_seq;
       pnd       pnd    false    234    7            �	           0    0    pndphone_ph_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE pndphone_ph_id_seq OWNED BY pndphone.ph_id;
            pnd       pnd    false    235            ,           2604    24843    fd_id    DEFAULT     \   ALTER TABLE ONLY fcdoc ALTER COLUMN fd_id SET DEFAULT nextval('fcdoc_fd_id_seq'::regclass);
 7   ALTER TABLE pnd.fcdoc ALTER COLUMN fd_id DROP DEFAULT;
       pnd       pnd    false    173    172            i           2604    25537    lch_id    DEFAULT     r   ALTER TABLE ONLY fclocaleholiday ALTER COLUMN lch_id SET DEFAULT nextval('fclocaleholiday_lch_id_seq'::regclass);
 B   ALTER TABLE pnd.fclocaleholiday ALTER COLUMN lch_id DROP DEFAULT;
       pnd       pnd    false    240    239    240            k           2604    25552    lcw_id    DEFAULT     z   ALTER TABLE ONLY fclocaleworkinghour ALTER COLUMN lcw_id SET DEFAULT nextval('fclocaleworkinghour_lcw_id_seq'::regclass);
 F   ALTER TABLE pnd.fclocaleworkinghour ALTER COLUMN lcw_id DROP DEFAULT;
       pnd       pnd    false    242    241    242            /           2604    24844    log_id    DEFAULT     ^   ALTER TABLE ONLY fclog ALTER COLUMN log_id SET DEFAULT nextval('fclog_log_id_seq'::regclass);
 8   ALTER TABLE pnd.fclog ALTER COLUMN log_id DROP DEFAULT;
       pnd       pnd    false    176    175            2           2604    24845    lu_id    DEFAULT     b   ALTER TABLE ONLY fclookup ALTER COLUMN lu_id SET DEFAULT nextval('fclookup_lu_id_seq'::regclass);
 :   ALTER TABLE pnd.fclookup ALTER COLUMN lu_id DROP DEFAULT;
       pnd       pnd    false    178    177            4           2604    24846    mn_id    DEFAULT     ^   ALTER TABLE ONLY fcmenu ALTER COLUMN mn_id SET DEFAULT nextval('fcmenu_mn_id_seq'::regclass);
 8   ALTER TABLE pnd.fcmenu ALTER COLUMN mn_id DROP DEFAULT;
       pnd       shine    false    180    179            5           2604    24847    mn_parentid    DEFAULT     j   ALTER TABLE ONLY fcmenu ALTER COLUMN mn_parentid SET DEFAULT nextval('fcmenu_mn_parentid_seq'::regclass);
 >   ALTER TABLE pnd.fcmenu ALTER COLUMN mn_parentid DROP DEFAULT;
       pnd       shine    false    181    179            9           2604    24848    org_id    DEFAULT     ^   ALTER TABLE ONLY fcorg ALTER COLUMN org_id SET DEFAULT nextval('fcorg_org_id_seq'::regclass);
 8   ALTER TABLE pnd.fcorg ALTER COLUMN org_id DROP DEFAULT;
       pnd       pnd    false    183    182            >           2604    24849    pmc_id    DEFAULT     d   ALTER TABLE ONLY fcpmcase ALTER COLUMN pmc_id SET DEFAULT nextval('fcpmcase_pmc_id_seq'::regclass);
 ;   ALTER TABLE pnd.fcpmcase ALTER COLUMN pmc_id DROP DEFAULT;
       pnd       pnd    false    188    187            A           2604    24850    pmcc_id    DEFAULT     t   ALTER TABLE ONLY fcpmcasecomment ALTER COLUMN pmcc_id SET DEFAULT nextval('fcpmcasecomment_pmcc_id_seq'::regclass);
 C   ALTER TABLE pnd.fcpmcasecomment ALTER COLUMN pmcc_id DROP DEFAULT;
       pnd       pnd    false    190    189            C           2604    24851    pmcr_id    DEFAULT     |   ALTER TABLE ONLY fcpmcasecommentread ALTER COLUMN pmcr_id SET DEFAULT nextval('fcpmcasecommentread_pmcr_id_seq'::regclass);
 G   ALTER TABLE pnd.fcpmcasecommentread ALTER COLUMN pmcr_id DROP DEFAULT;
       pnd       pnd    false    192    191            g           2604    25493    pmcf_id    DEFAULT     n   ALTER TABLE ONLY fcpmcaseflag ALTER COLUMN pmcf_id SET DEFAULT nextval('fcpmcaseflag_pmcf_id_seq'::regclass);
 @   ALTER TABLE pnd.fcpmcaseflag ALTER COLUMN pmcf_id DROP DEFAULT;
       pnd       pnd    false    237    236    237            D           2604    24852    pmf_id    DEFAULT     l   ALTER TABLE ONLY fcpmcaseflow ALTER COLUMN pmf_id SET DEFAULT nextval('fcpmcaseflow_pmf_id_seq'::regclass);
 ?   ALTER TABLE pnd.fcpmcaseflow ALTER COLUMN pmf_id DROP DEFAULT;
       pnd       pnd    false    194    193            q           2604    25608    pmfa_id    DEFAULT     z   ALTER TABLE ONLY fcpmcaseflowassign ALTER COLUMN pmfa_id SET DEFAULT nextval('fcpmcaseflowassign_pmfa_id_seq'::regclass);
 F   ALTER TABLE pnd.fcpmcaseflowassign ALTER COLUMN pmfa_id DROP DEFAULT;
       pnd       pnd    false    250    249    250            F           2604    24853    pmcn_id    DEFAULT     p   ALTER TABLE ONLY fcpmconnector ALTER COLUMN pmcn_id SET DEFAULT nextval('fcpmconnector_pmcn_id_seq'::regclass);
 A   ALTER TABLE pnd.fcpmconnector ALTER COLUMN pmcn_id DROP DEFAULT;
       pnd       pnd    false    197    196            l           2604    25567    pmev_id    DEFAULT     h   ALTER TABLE ONLY fcpmevent ALTER COLUMN pmev_id SET DEFAULT nextval('fcpmevent_pmev_id_seq'::regclass);
 =   ALTER TABLE pnd.fcpmevent ALTER COLUMN pmev_id DROP DEFAULT;
       pnd       pnd    false    244    243    244            o           2604    25576    pmgw_id    DEFAULT     l   ALTER TABLE ONLY fcpmgateway ALTER COLUMN pmgw_id SET DEFAULT nextval('fcpmgateway_pmgw_id_seq'::regclass);
 ?   ALTER TABLE pnd.fcpmgateway ALTER COLUMN pmgw_id DROP DEFAULT;
       pnd       pnd    false    245    246    246            G           2604    24856    pmsl_id    DEFAULT     n   ALTER TABLE ONLY fcpmswimlane ALTER COLUMN pmsl_id SET DEFAULT nextval('fcpmswimlane_pmsl_id_seq'::regclass);
 @   ALTER TABLE pnd.fcpmswimlane ALTER COLUMN pmsl_id DROP DEFAULT;
       pnd       pnd    false    199    198            p           2604    25600    pmss_id    DEFAULT     x   ALTER TABLE ONLY fcpmswimlanesetup ALTER COLUMN pmss_id SET DEFAULT nextval('fcpmswimlanesetup_pmss_id_seq'::regclass);
 E   ALTER TABLE pnd.fcpmswimlanesetup ALTER COLUMN pmss_id DROP DEFAULT;
       pnd       pnd    false    248    247    248            H           2604    24857    pmwf_id    DEFAULT     n   ALTER TABLE ONLY fcpmworkflow ALTER COLUMN pmwf_id SET DEFAULT nextval('fcpmworkflow_pmwf_id_seq'::regclass);
 @   ALTER TABLE pnd.fcpmworkflow ALTER COLUMN pmwf_id DROP DEFAULT;
       pnd       pnd    false    201    200            I           2604    24858    rol_id    DEFAULT     `   ALTER TABLE ONLY fcrole ALTER COLUMN rol_id SET DEFAULT nextval('fcrole_rol_id_seq'::regclass);
 9   ALTER TABLE pnd.fcrole ALTER COLUMN rol_id DROP DEFAULT;
       pnd       pnd    false    203    202            J           2604    24859    rp_id    DEFAULT     f   ALTER TABLE ONLY fcroleperm ALTER COLUMN rp_id SET DEFAULT nextval('fcroleperm_rp_id_seq'::regclass);
 <   ALTER TABLE pnd.fcroleperm ALTER COLUMN rp_id DROP DEFAULT;
       pnd       pnd    false    205    204            K           2604    24860    ru_id    DEFAULT     ^   ALTER TABLE ONLY fcrule ALTER COLUMN ru_id SET DEFAULT nextval('fcrule_ru_id_seq'::regclass);
 8   ALTER TABLE pnd.fcrule ALTER COLUMN ru_id DROP DEFAULT;
       pnd       pnd    false    207    206            M           2604    24861    set_id    DEFAULT     f   ALTER TABLE ONLY fcsetting ALTER COLUMN set_id SET DEFAULT nextval('fcsetting_set_id_seq'::regclass);
 <   ALTER TABLE pnd.fcsetting ALTER COLUMN set_id DROP DEFAULT;
       pnd       pnd    false    209    208            r           2604    26870    di_id    DEFAULT     h   ALTER TABLE ONLY fcuserdiary ALTER COLUMN di_id SET DEFAULT nextval('fcuserdiary_di_id_seq'::regclass);
 =   ALTER TABLE pnd.fcuserdiary ALTER COLUMN di_id DROP DEFAULT;
       pnd       pnd    false    251    252    252            T           2604    24863    ul_id    DEFAULT     h   ALTER TABLE ONLY fcuserlogin ALTER COLUMN ul_id SET DEFAULT nextval('fcuserlogin_ul_id_seq'::regclass);
 =   ALTER TABLE pnd.fcuserlogin ALTER COLUMN ul_id DROP DEFAULT;
       pnd       pnd    false    213    212            U           2604    24864    uor_id    DEFAULT     n   ALTER TABLE ONLY fcuserorgrole ALTER COLUMN uor_id SET DEFAULT nextval('fcuserorgrole_uor_id_seq'::regclass);
 @   ALTER TABLE pnd.fcuserorgrole ALTER COLUMN uor_id DROP DEFAULT;
       pnd       pnd    false    215    214            Y           2604    24865    us_id    DEFAULT     l   ALTER TABLE ONLY fcusersession ALTER COLUMN us_id SET DEFAULT nextval('fcusersession_us_id_seq'::regclass);
 ?   ALTER TABLE pnd.fcusersession ALTER COLUMN us_id DROP DEFAULT;
       pnd       pnd    false    217    216            Z           2604    24866    car_id    DEFAULT     b   ALTER TABLE ONLY mcarton ALTER COLUMN car_id SET DEFAULT nextval('mcarton_car_id_seq'::regclass);
 :   ALTER TABLE pnd.mcarton ALTER COLUMN car_id DROP DEFAULT;
       pnd       pnd    false    219    218            [           2604    24867    jc_id    DEFAULT     `   ALTER TABLE ONLY mjobcat ALTER COLUMN jc_id SET DEFAULT nextval('mjobcat_jc_id_seq'::regclass);
 9   ALTER TABLE pnd.mjobcat ALTER COLUMN jc_id DROP DEFAULT;
       pnd       pnd    false    222    221            \           2604    24868    jcl_id    DEFAULT     n   ALTER TABLE ONLY mjobcatlookup ALTER COLUMN jcl_id SET DEFAULT nextval('mjobcatlookup_jcl_id_seq'::regclass);
 @   ALTER TABLE pnd.mjobcatlookup ALTER COLUMN jcl_id DROP DEFAULT;
       pnd       pnd    false    224    223            ^           2604    24869    js_id    DEFAULT     d   ALTER TABLE ONLY mjobsheet ALTER COLUMN js_id SET DEFAULT nextval('mjobsheet_js_id_seq'::regclass);
 ;   ALTER TABLE pnd.mjobsheet ALTER COLUMN js_id DROP DEFAULT;
       pnd       pnd    false    226    225            _           2604    24870    caval_id    DEFAULT     t   ALTER TABLE ONLY mjscartonvalue ALTER COLUMN caval_id SET DEFAULT nextval('mjscartonvalue_caval_id_seq'::regclass);
 C   ALTER TABLE pnd.mjscartonvalue ALTER COLUMN caval_id DROP DEFAULT;
       pnd       pnd    false    228    227            b           2604    24871    ad_id    DEFAULT     f   ALTER TABLE ONLY pndaddress ALTER COLUMN ad_id SET DEFAULT nextval('pndaddress_ad_id_seq'::regclass);
 <   ALTER TABLE pnd.pndaddress ALTER COLUMN ad_id DROP DEFAULT;
       pnd       pnd    false    230    229            c           2604    24872    ct_id    DEFAULT     f   ALTER TABLE ONLY pndcontact ALTER COLUMN ct_id SET DEFAULT nextval('pndcontact_ct_id_seq'::regclass);
 <   ALTER TABLE pnd.pndcontact ALTER COLUMN ct_id DROP DEFAULT;
       pnd       pnd    false    233    232            f           2604    24873    ph_id    DEFAULT     b   ALTER TABLE ONLY pndphone ALTER COLUMN ph_id SET DEFAULT nextval('pndphone_ph_id_seq'::regclass);
 :   ALTER TABLE pnd.pndphone ALTER COLUMN ph_id DROP DEFAULT;
       pnd       pnd    false    235    234            I	          0    24583 	   fccountry 
   TABLE DATA                     pnd       pnd    false    171   as      J	          0    24589    fcdoc 
   TABLE DATA                     pnd       pnd    false    172   �|      �	           0    0    fcdoc_fd_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('fcdoc_fd_id_seq', 15, true);
            pnd       pnd    false    173            L	          0    24598    fclang 
   TABLE DATA                     pnd       pnd    false    174   �~      �	          0    25527    fclocale 
   TABLE DATA                     pnd       pnd    false    238   ��      �	          0    25534    fclocaleholiday 
   TABLE DATA                     pnd       pnd    false    240   =�      �	           0    0    fclocaleholiday_lch_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('fclocaleholiday_lch_id_seq', 4, true);
            pnd       pnd    false    239            �	          0    25549    fclocaleworkinghour 
   TABLE DATA                     pnd       pnd    false    242   �      �	           0    0    fclocaleworkinghour_lcw_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('fclocaleworkinghour_lcw_id_seq', 7, true);
            pnd       pnd    false    241            M	          0    24602    fclog 
   TABLE DATA                     pnd       pnd    false    175   Ǉ      �	           0    0    fclog_log_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('fclog_log_id_seq', 1, false);
            pnd       pnd    false    176            O	          0    24611    fclookup 
   TABLE DATA                     pnd       pnd    false    177   �      �	           0    0    fclookup_lu_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('fclookup_lu_id_seq', 110, true);
            pnd       pnd    false    178            Q	          0    24618    fcmenu 
   TABLE DATA                     pnd       shine    false    179   ��      �	           0    0    fcmenu_mn_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('fcmenu_mn_id_seq', 90, true);
            pnd       shine    false    180            �	           0    0    fcmenu_mn_parentid_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('fcmenu_mn_parentid_seq', 6, true);
            pnd       shine    false    181            T	          0    24629    fcorg 
   TABLE DATA                     pnd       pnd    false    182   �      �	           0    0    fcorg_org_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('fcorg_org_id_seq', 8, true);
            pnd       pnd    false    183            V	          0    24640    fcpermission 
   TABLE DATA                     pnd       pnd    false    184   �      X	          0    24648    fcpmactivity 
   TABLE DATA                     pnd       pnd    false    186   ܒ      �	           0    0    fcpmactivity_pmat_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('fcpmactivity_pmat_id_seq', 13, true);
            pnd       pnd    false    185            Y	          0    24652    fcpmcase 
   TABLE DATA                     pnd       pnd    false    187   ��      �	           0    0    fcpmcase_pmc_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('fcpmcase_pmc_id_seq', 65, true);
            pnd       pnd    false    188            [	          0    24658    fcpmcasecomment 
   TABLE DATA                     pnd       pnd    false    189   O�      �	           0    0    fcpmcasecomment_pmcc_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('fcpmcasecomment_pmcc_id_seq', 96, true);
            pnd       pnd    false    190            ]	          0    24668    fcpmcasecommentread 
   TABLE DATA                     pnd       pnd    false    191   ��      �	           0    0    fcpmcasecommentread_pmcr_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('fcpmcasecommentread_pmcr_id_seq', 97, true);
            pnd       pnd    false    192            �	          0    25490    fcpmcaseflag 
   TABLE DATA                     pnd       pnd    false    237   ��      �	           0    0    fcpmcaseflag_pmcf_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('fcpmcaseflag_pmcf_id_seq', 20, true);
            pnd       pnd    false    236            _	          0    24674    fcpmcaseflow 
   TABLE DATA                     pnd       pnd    false    193   ��      �	           0    0    fcpmcaseflow_pmf_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('fcpmcaseflow_pmf_id_seq', 310, true);
            pnd       pnd    false    194            �	          0    25605    fcpmcaseflowassign 
   TABLE DATA                     pnd       pnd    false    250   �      �	           0    0    fcpmcaseflowassign_pmfa_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('fcpmcaseflowassign_pmfa_id_seq', 1, false);
            pnd       pnd    false    249            a	          0    24679    fcpmcasetype 
   TABLE DATA                     pnd       pnd    false    195   5�      b	          0    24682    fcpmconnector 
   TABLE DATA                     pnd       pnd    false    196   Ν      �	           0    0    fcpmconnector_pmcn_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('fcpmconnector_pmcn_id_seq', 33, true);
            pnd       pnd    false    197            �	          0    25564 	   fcpmevent 
   TABLE DATA                     pnd       pnd    false    244   ��      �	           0    0    fcpmevent_pmev_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('fcpmevent_pmev_id_seq', 11, true);
            pnd       pnd    false    243            �	          0    25573    fcpmgateway 
   TABLE DATA                     pnd       pnd    false    246   6�      �	           0    0    fcpmgateway_pmgw_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('fcpmgateway_pmgw_id_seq', 6, true);
            pnd       pnd    false    245            d	          0    24697    fcpmswimlane 
   TABLE DATA                     pnd       pnd    false    198   .�      �	           0    0    fcpmswimlane_pmsl_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('fcpmswimlane_pmsl_id_seq', 1, false);
            pnd       pnd    false    199            �	          0    25597    fcpmswimlanesetup 
   TABLE DATA                     pnd       pnd    false    248   H�      �	           0    0    fcpmswimlanesetup_pmss_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('fcpmswimlanesetup_pmss_id_seq', 1, false);
            pnd       pnd    false    247            f	          0    24702    fcpmworkflow 
   TABLE DATA                     pnd       pnd    false    200   b�      �	           0    0    fcpmworkflow_pmwf_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('fcpmworkflow_pmwf_id_seq', 1, true);
            pnd       pnd    false    201            h	          0    24707    fcrole 
   TABLE DATA                     pnd       pnd    false    202   ��      �	           0    0    fcrole_rol_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('fcrole_rol_id_seq', 20, true);
            pnd       pnd    false    203            j	          0    24715 
   fcroleperm 
   TABLE DATA                     pnd       pnd    false    204   B�      �	           0    0    fcroleperm_rp_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('fcroleperm_rp_id_seq', 158, true);
            pnd       pnd    false    205            l	          0    24720    fcrule 
   TABLE DATA                     pnd       pnd    false    206   ��      �	           0    0    fcrule_ru_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('fcrule_ru_id_seq', 1, false);
            pnd       pnd    false    207            n	          0    24728 	   fcsetting 
   TABLE DATA                     pnd       pnd    false    208   ��      �	           0    0    fcsetting_set_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('fcsetting_set_id_seq', 7, true);
            pnd       pnd    false    209            p	          0    24737    fcudv 
   TABLE DATA                     pnd       pnd    false    210   ��      q	          0    24744    fcuser 
   TABLE DATA                     pnd       pnd    false    211   ȧ      �	          0    26867    fcuserdiary 
   TABLE DATA                     pnd       pnd    false    252   �      �	           0    0    fcuserdiary_di_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('fcuserdiary_di_id_seq', 3, true);
            pnd       pnd    false    251            r	          0    24762    fcuserlogin 
   TABLE DATA                     pnd       pnd    false    212   �      �	           0    0    fcuserlogin_ul_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('fcuserlogin_ul_id_seq', 508, true);
            pnd       pnd    false    213            t	          0    24770    fcuserorgrole 
   TABLE DATA                     pnd       pnd    false    214   ��      �	           0    0    fcuserorgrole_uor_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('fcuserorgrole_uor_id_seq', 39, true);
            pnd       pnd    false    215            v	          0    24775    fcusersession 
   TABLE DATA                     pnd       pnd    false    216   ��      �	           0    0    fcusersession_us_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('fcusersession_us_id_seq', 481, true);
            pnd       pnd    false    217            x	          0    24783    mcarton 
   TABLE DATA                     pnd       pnd    false    218   h�      �	           0    0    mcarton_car_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('mcarton_car_id_seq', 33, true);
            pnd       pnd    false    219            z	          0    24788    mcartonvariable 
   TABLE DATA                     pnd       pnd    false    220   ��      {	          0    24791    mjobcat 
   TABLE DATA                     pnd       pnd    false    221   ��      �	           0    0    mjobcat_jc_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('mjobcat_jc_id_seq', 1, false);
            pnd       pnd    false    222            }	          0    24796    mjobcatlookup 
   TABLE DATA                     pnd       pnd    false    223   ��      �	           0    0    mjobcatlookup_jcl_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('mjobcatlookup_jcl_id_seq', 8, true);
            pnd       pnd    false    224            	          0    24801 	   mjobsheet 
   TABLE DATA                     pnd       pnd    false    225   ��      �	           0    0    mjobsheet_js_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('mjobsheet_js_id_seq', 153, true);
            pnd       pnd    false    226            �	          0    24810    mjscartonvalue 
   TABLE DATA                     pnd       pnd    false    227    �      �	           0    0    mjscartonvalue_caval_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('mjscartonvalue_caval_id_seq', 1, false);
            pnd       pnd    false    228            �	          0    24815 
   pndaddress 
   TABLE DATA                     pnd       pnd    false    229   �      �	           0    0    pndaddress_ad_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('pndaddress_ad_id_seq', 1, false);
            pnd       pnd    false    230            �	          0    24825    pndartistskill 
   TABLE DATA                     pnd       pnd    false    231   4�      �	          0    24828 
   pndcontact 
   TABLE DATA                     pnd       pnd    false    232   N�      �	           0    0    pndcontact_ct_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('pndcontact_ct_id_seq', 6, true);
            pnd       pnd    false    233            �	          0    24833    pndphone 
   TABLE DATA                     pnd       pnd    false    234   �      �	           0    0    pndphone_ph_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('pndphone_ph_id_seq', 1, false);
            pnd       pnd    false    235            z           2606    24875    const_fcdoc_prikey 
   CONSTRAINT     R   ALTER TABLE ONLY fcdoc
    ADD CONSTRAINT const_fcdoc_prikey PRIMARY KEY (fd_id);
 ?   ALTER TABLE ONLY pnd.fcdoc DROP CONSTRAINT const_fcdoc_prikey;
       pnd         pnd    false    172    172            |           2606    24877    const_fclang_prikey 
   CONSTRAINT     X   ALTER TABLE ONLY fclang
    ADD CONSTRAINT const_fclang_prikey PRIMARY KEY (lang_code);
 A   ALTER TABLE ONLY pnd.fclang DROP CONSTRAINT const_fclang_prikey;
       pnd         pnd    false    174    174            �           2606    25531    const_fclocale_prikey 
   CONSTRAINT     Z   ALTER TABLE ONLY fclocale
    ADD CONSTRAINT const_fclocale_prikey PRIMARY KEY (lc_code);
 E   ALTER TABLE ONLY pnd.fclocale DROP CONSTRAINT const_fclocale_prikey;
       pnd         pnd    false    238    238            �           2606    25540    const_fclocaleholiday_prikey 
   CONSTRAINT     g   ALTER TABLE ONLY fclocaleholiday
    ADD CONSTRAINT const_fclocaleholiday_prikey PRIMARY KEY (lch_id);
 S   ALTER TABLE ONLY pnd.fclocaleholiday DROP CONSTRAINT const_fclocaleholiday_prikey;
       pnd         pnd    false    240    240            �           2606    25554     const_fclocaleworkinghour_prikey 
   CONSTRAINT     o   ALTER TABLE ONLY fclocaleworkinghour
    ADD CONSTRAINT const_fclocaleworkinghour_prikey PRIMARY KEY (lcw_id);
 [   ALTER TABLE ONLY pnd.fclocaleworkinghour DROP CONSTRAINT const_fclocaleworkinghour_prikey;
       pnd         pnd    false    242    242            �           2606    25556     const_fclocaleworkinghour_unikey 
   CONSTRAINT     w   ALTER TABLE ONLY fclocaleworkinghour
    ADD CONSTRAINT const_fclocaleworkinghour_unikey UNIQUE (lcw_lccode, lcw_day);
 [   ALTER TABLE ONLY pnd.fclocaleworkinghour DROP CONSTRAINT const_fclocaleworkinghour_unikey;
       pnd         pnd    false    242    242    242            ~           2606    24879    const_fclog_prikey 
   CONSTRAINT     S   ALTER TABLE ONLY fclog
    ADD CONSTRAINT const_fclog_prikey PRIMARY KEY (log_id);
 ?   ALTER TABLE ONLY pnd.fclog DROP CONSTRAINT const_fclog_prikey;
       pnd         pnd    false    175    175            �           2606    24881    const_fcpermission_prikey 
   CONSTRAINT     c   ALTER TABLE ONLY fcpermission
    ADD CONSTRAINT const_fcpermission_prikey PRIMARY KEY (pms_code);
 M   ALTER TABLE ONLY pnd.fcpermission DROP CONSTRAINT const_fcpermission_prikey;
       pnd         pnd    false    184    184            �           2606    24883    const_fcpmactivity_prikey 
   CONSTRAINT     b   ALTER TABLE ONLY fcpmactivity
    ADD CONSTRAINT const_fcpmactivity_prikey PRIMARY KEY (pmat_id);
 M   ALTER TABLE ONLY pnd.fcpmactivity DROP CONSTRAINT const_fcpmactivity_prikey;
       pnd         pnd    false    186    186            �           2606    24885    const_fcpmcase_prikey 
   CONSTRAINT     Y   ALTER TABLE ONLY fcpmcase
    ADD CONSTRAINT const_fcpmcase_prikey PRIMARY KEY (pmc_id);
 E   ALTER TABLE ONLY pnd.fcpmcase DROP CONSTRAINT const_fcpmcase_prikey;
       pnd         pnd    false    187    187            �           2606    24887    const_fcpmcasecomment_prikey 
   CONSTRAINT     h   ALTER TABLE ONLY fcpmcasecomment
    ADD CONSTRAINT const_fcpmcasecomment_prikey PRIMARY KEY (pmcc_id);
 S   ALTER TABLE ONLY pnd.fcpmcasecomment DROP CONSTRAINT const_fcpmcasecomment_prikey;
       pnd         pnd    false    189    189            �           2606    24889     const_fcpmcasecommentread_prikey 
   CONSTRAINT     p   ALTER TABLE ONLY fcpmcasecommentread
    ADD CONSTRAINT const_fcpmcasecommentread_prikey PRIMARY KEY (pmcr_id);
 [   ALTER TABLE ONLY pnd.fcpmcasecommentread DROP CONSTRAINT const_fcpmcasecommentread_prikey;
       pnd         pnd    false    191    191            �           2606    24891     const_fcpmcasecommentread_unikey 
   CONSTRAINT     }   ALTER TABLE ONLY fcpmcasecommentread
    ADD CONSTRAINT const_fcpmcasecommentread_unikey UNIQUE (pmcr_pmccid, pmcr_read_by);
 [   ALTER TABLE ONLY pnd.fcpmcasecommentread DROP CONSTRAINT const_fcpmcasecommentread_unikey;
       pnd         pnd    false    191    191    191            �           2606    25496    const_fcpmcaseflag_prikey 
   CONSTRAINT     b   ALTER TABLE ONLY fcpmcaseflag
    ADD CONSTRAINT const_fcpmcaseflag_prikey PRIMARY KEY (pmcf_id);
 M   ALTER TABLE ONLY pnd.fcpmcaseflag DROP CONSTRAINT const_fcpmcaseflag_prikey;
       pnd         pnd    false    237    237            �           2606    25498    const_fcpmcaseflag_unikey 
   CONSTRAINT     n   ALTER TABLE ONLY fcpmcaseflag
    ADD CONSTRAINT const_fcpmcaseflag_unikey UNIQUE (pmcf_pmcid, pmcf_flag_by);
 M   ALTER TABLE ONLY pnd.fcpmcaseflag DROP CONSTRAINT const_fcpmcaseflag_unikey;
       pnd         pnd    false    237    237    237            �           2606    24893    const_fcpmcaseflow_prikey 
   CONSTRAINT     a   ALTER TABLE ONLY fcpmcaseflow
    ADD CONSTRAINT const_fcpmcaseflow_prikey PRIMARY KEY (pmf_id);
 M   ALTER TABLE ONLY pnd.fcpmcaseflow DROP CONSTRAINT const_fcpmcaseflow_prikey;
       pnd         pnd    false    193    193            �           2606    25610    const_fcpmcaseflowassign_prikey 
   CONSTRAINT     n   ALTER TABLE ONLY fcpmcaseflowassign
    ADD CONSTRAINT const_fcpmcaseflowassign_prikey PRIMARY KEY (pmfa_id);
 Y   ALTER TABLE ONLY pnd.fcpmcaseflowassign DROP CONSTRAINT const_fcpmcaseflowassign_prikey;
       pnd         pnd    false    250    250            �           2606    24895    const_fcpmcasetype_prikey 
   CONSTRAINT     d   ALTER TABLE ONLY fcpmcasetype
    ADD CONSTRAINT const_fcpmcasetype_prikey PRIMARY KEY (pmct_code);
 M   ALTER TABLE ONLY pnd.fcpmcasetype DROP CONSTRAINT const_fcpmcasetype_prikey;
       pnd         pnd    false    195    195            �           2606    24897    const_fcpmconnector_prikey 
   CONSTRAINT     d   ALTER TABLE ONLY fcpmconnector
    ADD CONSTRAINT const_fcpmconnector_prikey PRIMARY KEY (pmcn_id);
 O   ALTER TABLE ONLY pnd.fcpmconnector DROP CONSTRAINT const_fcpmconnector_prikey;
       pnd         pnd    false    196    196            �           2606    24899    const_fcpmconnector_unikey 
   CONSTRAINT     �   ALTER TABLE ONLY fcpmconnector
    ADD CONSTRAINT const_fcpmconnector_unikey UNIQUE (pmcn_from_type, pmcn_from_id, pmcn_to_type, pmcn_to_id);
 O   ALTER TABLE ONLY pnd.fcpmconnector DROP CONSTRAINT const_fcpmconnector_unikey;
       pnd         pnd    false    196    196    196    196    196            �           2606    25570    const_fcpmevent_prikey 
   CONSTRAINT     \   ALTER TABLE ONLY fcpmevent
    ADD CONSTRAINT const_fcpmevent_prikey PRIMARY KEY (pmev_id);
 G   ALTER TABLE ONLY pnd.fcpmevent DROP CONSTRAINT const_fcpmevent_prikey;
       pnd         pnd    false    244    244            �           2606    25578    const_fcpmgateway_prikey 
   CONSTRAINT     `   ALTER TABLE ONLY fcpmgateway
    ADD CONSTRAINT const_fcpmgateway_prikey PRIMARY KEY (pmgw_id);
 K   ALTER TABLE ONLY pnd.fcpmgateway DROP CONSTRAINT const_fcpmgateway_prikey;
       pnd         pnd    false    246    246            �           2606    24905    const_fcpmswimlane_prikey 
   CONSTRAINT     b   ALTER TABLE ONLY fcpmswimlane
    ADD CONSTRAINT const_fcpmswimlane_prikey PRIMARY KEY (pmsl_id);
 M   ALTER TABLE ONLY pnd.fcpmswimlane DROP CONSTRAINT const_fcpmswimlane_prikey;
       pnd         pnd    false    198    198            �           2606    25602    const_fcpmswimlanesetup_prikey 
   CONSTRAINT     l   ALTER TABLE ONLY fcpmswimlanesetup
    ADD CONSTRAINT const_fcpmswimlanesetup_prikey PRIMARY KEY (pmss_id);
 W   ALTER TABLE ONLY pnd.fcpmswimlanesetup DROP CONSTRAINT const_fcpmswimlanesetup_prikey;
       pnd         pnd    false    248    248            �           2606    24907    const_fcpmworkflow_prikey 
   CONSTRAINT     b   ALTER TABLE ONLY fcpmworkflow
    ADD CONSTRAINT const_fcpmworkflow_prikey PRIMARY KEY (pmwf_id);
 M   ALTER TABLE ONLY pnd.fcpmworkflow DROP CONSTRAINT const_fcpmworkflow_prikey;
       pnd         pnd    false    200    200            �           2606    24909    const_fcrule_prikey 
   CONSTRAINT     T   ALTER TABLE ONLY fcrule
    ADD CONSTRAINT const_fcrule_prikey PRIMARY KEY (ru_id);
 A   ALTER TABLE ONLY pnd.fcrule DROP CONSTRAINT const_fcrule_prikey;
       pnd         pnd    false    206    206            �           2606    24911    const_fcudv_prikey 
   CONSTRAINT     U   ALTER TABLE ONLY fcudv
    ADD CONSTRAINT const_fcudv_prikey PRIMARY KEY (udv_code);
 ?   ALTER TABLE ONLY pnd.fcudv DROP CONSTRAINT const_fcudv_prikey;
       pnd         pnd    false    210    210            �           2606    26879    const_fcuserdiary_prikey 
   CONSTRAINT     ^   ALTER TABLE ONLY fcuserdiary
    ADD CONSTRAINT const_fcuserdiary_prikey PRIMARY KEY (di_id);
 K   ALTER TABLE ONLY pnd.fcuserdiary DROP CONSTRAINT const_fcuserdiary_prikey;
       pnd         pnd    false    252    252            �           2606    24915    const_hlookup_prikey 
   CONSTRAINT     W   ALTER TABLE ONLY fclookup
    ADD CONSTRAINT const_hlookup_prikey PRIMARY KEY (lu_id);
 D   ALTER TABLE ONLY pnd.fclookup DROP CONSTRAINT const_hlookup_prikey;
       pnd         pnd    false    177    177            �           2606    24917    const_hlookup_unikey 
   CONSTRAINT     \   ALTER TABLE ONLY fclookup
    ADD CONSTRAINT const_hlookup_unikey UNIQUE (lu_cat, lu_code);
 D   ALTER TABLE ONLY pnd.fclookup DROP CONSTRAINT const_hlookup_unikey;
       pnd         pnd    false    177    177    177            �           2606    24919    const_mcarton_prikey 
   CONSTRAINT     W   ALTER TABLE ONLY mcarton
    ADD CONSTRAINT const_mcarton_prikey PRIMARY KEY (car_id);
 C   ALTER TABLE ONLY pnd.mcarton DROP CONSTRAINT const_mcarton_prikey;
       pnd         pnd    false    218    218            �           2606    24921    const_mjobcat_prikey 
   CONSTRAINT     V   ALTER TABLE ONLY mjobcat
    ADD CONSTRAINT const_mjobcat_prikey PRIMARY KEY (jc_id);
 C   ALTER TABLE ONLY pnd.mjobcat DROP CONSTRAINT const_mjobcat_prikey;
       pnd         pnd    false    221    221            �           2606    24923    const_mjobsheet_prikey 
   CONSTRAINT     Z   ALTER TABLE ONLY mjobsheet
    ADD CONSTRAINT const_mjobsheet_prikey PRIMARY KEY (js_id);
 G   ALTER TABLE ONLY pnd.mjobsheet DROP CONSTRAINT const_mjobsheet_prikey;
       pnd         pnd    false    225    225            �           2606    24925    const_mjscartonvalue_prikey 
   CONSTRAINT     g   ALTER TABLE ONLY mjscartonvalue
    ADD CONSTRAINT const_mjscartonvalue_prikey PRIMARY KEY (caval_id);
 Q   ALTER TABLE ONLY pnd.mjscartonvalue DROP CONSTRAINT const_mjscartonvalue_prikey;
       pnd         pnd    false    227    227            �           2606    24927    const_pndcontact_prikey 
   CONSTRAINT     \   ALTER TABLE ONLY pndcontact
    ADD CONSTRAINT const_pndcontact_prikey PRIMARY KEY (ct_id);
 I   ALTER TABLE ONLY pnd.pndcontact DROP CONSTRAINT const_pndcontact_prikey;
       pnd         pnd    false    232    232            �           2606    24929    const_vmenu_prikey 
   CONSTRAINT     S   ALTER TABLE ONLY fcmenu
    ADD CONSTRAINT const_vmenu_prikey PRIMARY KEY (mn_id);
 @   ALTER TABLE ONLY pnd.fcmenu DROP CONSTRAINT const_vmenu_prikey;
       pnd         shine    false    179    179            �           2606    24931    const_vmenu_unikey 
   CONSTRAINT     P   ALTER TABLE ONLY fcmenu
    ADD CONSTRAINT const_vmenu_unikey UNIQUE (mn_code);
 @   ALTER TABLE ONLY pnd.fcmenu DROP CONSTRAINT const_vmenu_unikey;
       pnd         shine    false    179    179            �           2606    24933    const_vorg_prikey 
   CONSTRAINT     R   ALTER TABLE ONLY fcorg
    ADD CONSTRAINT const_vorg_prikey PRIMARY KEY (org_id);
 >   ALTER TABLE ONLY pnd.fcorg DROP CONSTRAINT const_vorg_prikey;
       pnd         pnd    false    182    182            �           2606    24935    const_vrole_prikey 
   CONSTRAINT     T   ALTER TABLE ONLY fcrole
    ADD CONSTRAINT const_vrole_prikey PRIMARY KEY (rol_id);
 @   ALTER TABLE ONLY pnd.fcrole DROP CONSTRAINT const_vrole_prikey;
       pnd         pnd    false    202    202            �           2606    24937    const_vroleperm_prikey 
   CONSTRAINT     [   ALTER TABLE ONLY fcroleperm
    ADD CONSTRAINT const_vroleperm_prikey PRIMARY KEY (rp_id);
 H   ALTER TABLE ONLY pnd.fcroleperm DROP CONSTRAINT const_vroleperm_prikey;
       pnd         pnd    false    204    204            �           2606    24939    const_vroleperm_unikey 
   CONSTRAINT     e   ALTER TABLE ONLY fcroleperm
    ADD CONSTRAINT const_vroleperm_unikey UNIQUE (rp_rolid, rp_pmscode);
 H   ALTER TABLE ONLY pnd.fcroleperm DROP CONSTRAINT const_vroleperm_unikey;
       pnd         pnd    false    204    204    204            �           2606    24941    const_vsetting_prikey 
   CONSTRAINT     Z   ALTER TABLE ONLY fcsetting
    ADD CONSTRAINT const_vsetting_prikey PRIMARY KEY (set_id);
 F   ALTER TABLE ONLY pnd.fcsetting DROP CONSTRAINT const_vsetting_prikey;
       pnd         pnd    false    208    208            �           2606    24943    const_vsetting_unikey 
   CONSTRAINT     a   ALTER TABLE ONLY fcsetting
    ADD CONSTRAINT const_vsetting_unikey UNIQUE (set_user, set_code);
 F   ALTER TABLE ONLY pnd.fcsetting DROP CONSTRAINT const_vsetting_unikey;
       pnd         pnd    false    208    208    208            �           2606    24945    const_vuser_prikey 
   CONSTRAINT     X   ALTER TABLE ONLY fcuser
    ADD CONSTRAINT const_vuser_prikey PRIMARY KEY (usr_userid);
 @   ALTER TABLE ONLY pnd.fcuser DROP CONSTRAINT const_vuser_prikey;
       pnd         pnd    false    211    211            �           2606    24947    const_vuserlogin_prikey 
   CONSTRAINT     ]   ALTER TABLE ONLY fcuserlogin
    ADD CONSTRAINT const_vuserlogin_prikey PRIMARY KEY (ul_id);
 J   ALTER TABLE ONLY pnd.fcuserlogin DROP CONSTRAINT const_vuserlogin_prikey;
       pnd         pnd    false    212    212            �           2606    24949    const_vuserorgrole_prikey 
   CONSTRAINT     b   ALTER TABLE ONLY fcuserorgrole
    ADD CONSTRAINT const_vuserorgrole_prikey PRIMARY KEY (uor_id);
 N   ALTER TABLE ONLY pnd.fcuserorgrole DROP CONSTRAINT const_vuserorgrole_prikey;
       pnd         pnd    false    214    214            �           2606    24951    const_vuserorgrole_unikey 
   CONSTRAINT     v   ALTER TABLE ONLY fcuserorgrole
    ADD CONSTRAINT const_vuserorgrole_unikey UNIQUE (uor_usrid, uor_orgid, uor_rolid);
 N   ALTER TABLE ONLY pnd.fcuserorgrole DROP CONSTRAINT const_vuserorgrole_unikey;
       pnd         pnd    false    214    214    214    214            �           2606    24953    const_vusersession_prikey 
   CONSTRAINT     a   ALTER TABLE ONLY fcusersession
    ADD CONSTRAINT const_vusersession_prikey PRIMARY KEY (us_id);
 N   ALTER TABLE ONLY pnd.fcusersession DROP CONSTRAINT const_vusersession_prikey;
       pnd         pnd    false    216    216            �           2606    24955    cont_mjobcatlookup_prikey 
   CONSTRAINT     b   ALTER TABLE ONLY mjobcatlookup
    ADD CONSTRAINT cont_mjobcatlookup_prikey PRIMARY KEY (jcl_id);
 N   ALTER TABLE ONLY pnd.mjobcatlookup DROP CONSTRAINT cont_mjobcatlookup_prikey;
       pnd         pnd    false    223    223            x           2606    24957    country_prikey 
   CONSTRAINT     U   ALTER TABLE ONLY fccountry
    ADD CONSTRAINT country_prikey PRIMARY KEY (con_code);
 ?   ALTER TABLE ONLY pnd.fccountry DROP CONSTRAINT country_prikey;
       pnd         pnd    false    171    171            �           1259    24958    idx_vsetting_code_user    INDEX     Z   CREATE UNIQUE INDEX idx_vsetting_code_user ON fcsetting USING btree (set_user, set_code);
 '   DROP INDEX pnd.idx_vsetting_code_user;
       pnd         pnd    false    208    208            �           1259    24959    usersession_idx1    INDEX     H   CREATE INDEX usersession_idx1 ON fcusersession USING btree (us_sessid);
 !   DROP INDEX pnd.usersession_idx1;
       pnd         pnd    false    216            �           1259    24960    usersession_idx2    INDEX     H   CREATE INDEX usersession_idx2 ON fcusersession USING btree (us_userid);
 !   DROP INDEX pnd.usersession_idx2;
       pnd         pnd    false    216            I	   t	  x����r�8�����*��/0'�����X"%�u��H�B�T a���f�K��)s��+�+,���H�6�|W�M����8=�[�2�ߕ��}0�M�N�a��������}p��~������VHЭ�5����T��RW�`�Ђ�ʿ�r�޴��V~��giuPJk�`��=y��^���dD���D��bilC��&�턾�W�șq�0�:Y�1`�+%à�w˷�	�EM?� NԲ5�J��~�tdB9ى���b�+��np�(-�+y�d�qR}/�����p�K�rJXBPYJa�`Տ�����6Z��?#��%����YA�$�	��t��lF�b��*����J�� ��M�Kx�[�i���!g޿o�ud��R�z��҉B����}+KD��,ږ�A�ω6(�~;r4�v�q^�͸��'G9򶞦s��a���/�ȿUE6����,:�}� ki}ʪ�b��y&/�43mm^<y'��Ԫ�C���}��fb4�e�|�R���WS�sz/��@�ȱ�b�!o���xZ�O�]�n`G�)�����,Y�l@Pn�U�dD����b��p�P�A�-=glb$��h�O���>���Rp��*�������g��F�mp�`��!t�@]�1�ٴ�)��}3�XX���:��yz������-�5���&wC@)����AyDJK/o�bB�~.ⳉr��U�J�o0�L�-�qu"=�W�OHw%���Kz��A{�gժ��o�l�9��\�P�nH�s�q׼D�\CO@9���I;�`�Ћ?��~
F�i׼�N+z7p�fg:���A`޹�=t��EA�ؽ��&�� .��C�����G��')Q��Ckc#_�-�����~�y�	ʕ��.��l�p����ҕ����,l+r��c����ow�7�]MvâD�	J����W)z���j�V04w��7�E��Ö��4y�Β�����h�"H���ɤ�t#���1�s�֗����)�D�(�5��\Yl�	Fi~DK������2�ܥ.>Iӫ�G<��zW�_Uu�n|���Շ.rpF��*H�����6�����!�G$�d
<�/�=������8o��2(Q�W�8���#�+�RbL��jx�Z����m�� r4��]q�1�P^����b^�\�� >+� )׈��x�YyD�~��}��jlW�ڋ%�Iy,�(!]��3��� ${@����E2J�r��r�P�wgU��Ҝ�Ѥ�P�
��v�C���_E�����2����:;���i�< �A��As�NU�����X����BԜ�ռS�S}�$�BL�����~_|a����ʗ6��`����ɵ�=���u�~�����$y�� e�Ah'���8�hx�% �P`��ڇ���?������Y�I.%���(�Va�xp��g�9��1�X�5�YX2�	.�Ivtis�?�F���A��;��+=��i�L�SD�8��!���"U�ɱ���ѐA퇺6�n2�!��;n��N��O��V��G� 	{r��X	m#=���a���S���q':B~���r*����0 �S��:	����"p��ώ>�-'�eT��!�iE-�y+����6�-�ֈ|R��h>A��-:N�F���q="l��~tv�A܍L�^�������ZJ�&���3�9�������"�w�7�c߇�X�i��`zQ�J~}�%�o�l��
f�����OG��"�6�X��؋7��A��z?ZM$�O����5���0G�l�Hk�Mq�Πz|@�UikrDK��s���Õ�^���>5�5���,>���)TK>�x3!�)�֗�^#0cR�،m���YM7?��Ehk8�W�Nb:c�!^ D���q�sa��I� ���	��3�`vw�^����-qMֈ��@��-c��]�.e���̎3���gG/dȼ�/u2��y��`f:�63�~����Ǽr^Փ�p�����v%����mP�����T���N�_��ÛF��_ͽ"�,�~�L��A�χ�2W:��A���}��{��g���E�5�_Wp�++~�	s$�,��{��ʌ^Z�RY!���j-�.X�~֢����r��.g--��5X��X�dAy&o�r�<Y$��D�]#�H�U'A�0	Tʉ{�����6�7Ρ�PԤ��4W����`&;S�S�;m���fE
�T���oi���g�4M!ɤ����O��>�1�����.�2���ɘ(*5���#�����/ݝ%��A �D%�8-Q�F�}�9{DN+^ɮB�>7g�=8l�yR��2:���;�D��@�Dx7Izt���/߂�0gG�8��
>z!��d2�ϯ��}�ýh4      J	   �  x����n�0 �=_��
�}�=�.�@B���1I�"u(�,�~�����d"%���ȑ_7����㳘-��uUT�f]/�z"bQ�U���:>����cu׬O=�[����T7�j�n��cs����f�Y�mε�;V����ݷ�ͭx���<<���1�)�))���$�;p�X��籋���j���|���ۡ�T�	����_�Yo՜�x�d�)�M��p������tP$��	ۖ�6e�D�Y���u7�����+�]a�Y��?ۤl�@��Q�4GUr���ڂ���m�温Yiu:ɱ��/��S��Z�ku '��T[ZӃ����@j}�--��ir�	�W�R��/��q�!�U�%,mW���}h9�&�Cا�r�
 �)�ʩ(���9���YZ���5�)�2�V�A^�3g8c���L�s���c�EAkI��g0�Ó�s4�AO�      L	   �  x���Ms�:���޵���w�+lC-C6wV�[Je;i��|D�+��^$3�}�����D���(�$/���s��%�0����+�)����۰�y?t��,��,��~�|�)x?�n�窣�29��?~~��Oq����W�+��,#���F���E�8���'y�`�\�����&��m�"�W&��<�pH�Ń$���3��N�
�WE���Q6�3�x{��GI�]%�0齏���g3�i��g�l3�m'��/��|�=7p�!���%~n�� �e�@V����&��b�W�.�[ix/��2�}�h�������4�H���{:�>�3�'_mv����+ޏz�~�OѼF��f��v�r��.����ե��j0��7��u"�����-��;q�w�9׹��S��&v^Ke?���qt�������"���pZ��i?�a[�$&�y���T~�I%��hwX���F۸�֞���38b,hy,lK��E�)�'Q�����2�T�	n�<]_��C�h.rh�<�7%}-�}s.5�<�Q��m��s3��C��?��Œ��O�����Eh1.��̹��i��-���I�=ΒV7���"#{x�niI��UM�I|C1bto8�.�9w�����Ʒs���vk���e����1��aǛ���0�"��w�,}^i���[q�|е�c=����3u���K*���hxM��]�����	��X�	!���⚪�F��r�Ÿ��3E���e�Q���3z0�{�t�%ړ�o��Gbϲu5�飮fy_l�CT��V�k:[q[ќ��f���`g��!�8�Q�Z	�r�V�Mf1��ø��&&�����z���F�އM�z,ɭ�ߤ�VOL}��8�؛��\��1J/vp8�VnB�V���F�x-NF<���g��V�`a2�zPS�%TP%g
}��ф���E�-r���zI?v��G`g��l�P&[�wT���G��uᆖ�+|��aN��[i�ο�8�W� .57�dn�V�O�6T�o��o+���r�yi:s��#��p��饴�S���WF2�c��7�e�B̠ص-ĝm�A�/�04K3����ʫxXY�5:�d���E��vN��E7�ml*]r�h�Xy�Zrm���e�H?���%�o�D_,ّ��tߐؕaT8q���E��J�q,iW���^p4�"�nP?�	�K�Ղ�^��n����z
I��W3�T�	�T�-�:S��/�_ �7K9����(1�����Ɗ��H^��{�����������D�قm ꃘm�	�%W����ρ�S1�"�5�s�
,}S��F#�gvբ&��2�$x�6{���q3�\���G,)����f�'��!�ϙײA�![����u�[�E�T܂컂�����3-t+�����	-2����<�J��d�a�N0�<M�Z�>k5�^ظ���u��ZU����I�;~�A��%�7�-&O|Ln��6}�$W��!�ln'���b���A�H��	E�A�^���
1�Yv$U�4���Ԋ7����l��0�dn&� �x:@0�kȞ�M�����y�,*�K��&����#�U����������	���]�)�_)�ܥh�냕�d��9�]]Yʓ���qIA�촺��fI���|�ܼIÿ�'����u@x3�/��_�okN�/`u2��T`���=��ۿ���d;��)��]��&P��*�/~�5���x�ܓ=�eU��ϑ6ɎCs�)���s^��      �	   �   x���v
Q���WHK��ON�IU��I�O�OI�Q 2RR���2J2��������Ģ���ļt���*SS!��'�5XAC�72<@]GA=<3'�21C���s��1�3��Ks�}JsJ��5���� Z-�      �	   �   x���O�@��~������	�NAB�Y��bZ�\X�ؔ�ۧ�PtN�{�\~�	�4H2�l*$E�J)x�-��'^Xл�T����m���u8�;U�VsY�pXF� ñ@��ǝ޹K�&N7������n.���4�7�g��'M�g�(Xa;�����dn;�UL/kTlq"�g|րS�X��=V��      �	   �   x���v
Q���WHK��ON�I-�/���K��/-R��I.��L�Q �9���)�vJb%�Q\�XT_���H�K�4�}B]�4�t�}#��At~�2��20 "���ִ��s���R�:��1ArNxj�@;�9t2J�9fH�q+�h�#9'8��9��pq �T      M	   
   x���          O	   �  x���Ks�8���+tڙ�����k�d��xL
C2s�R���A��,��WƉq7do�	���WR��6n�0�Wk��%y��<��SR��Y��4����.��Yս�D��WeŪ�<]��gr��7~D>}\������!a�S%xs�Z.���#�v����]���?Z�D����pLM8[V<e�,�<��X4��WI�p��ۡ���D�w�C²�����:��&���1+в7�ٚ�ʧ�CR���:��.�4ϫ=���vP�Z���6����{�s}�G��B��E��xx�s���v�(�Љ�@�r��N8�M�~�&u).��P��R����=R����b��+��-�Mx�:X� ��4�3!�y����ѡ�D�#��/g$ł:#M�(�����R��
)�ǟn.����׶M��zP�L�?�3$yy!w�)6���P7yy���Y�u!�TƖW'"cő�E���Mas�}�^ �6q-�i�����,�V�r+!��"�t{�����t�gE��#DR\f��o����h�m9������ǂ�{�+ضf'%�O���#yEY�_�$V,�Wb���*��[V�V~b*��Y�9�W������=���3'�g�%/N�2��(��ﮚ	:���ޟAۭb �s)�W�D &Q,���!�be�@,bAŢꁌ��(>�=��Dq��#�1Q\Y�@�@ũ�B� ��� �:ЬCmfu�YhVK�YdV���fV�Ձf����Afu�Y-mfu�YhVK�YdV���fV�Ձf����Afu�Y-mfu�YhVK�Y)2+�f����"�Rh֑6�RdV
�:�fV��J�YG��J�Y)4�H�Y)2+�fi3+Ef�Ь#mf�Ȭ�u�ͬ��B�����"�Rh֑&���0���3�&�ʉ�jk2���D Ь�&�ʉ����dV9��@�YmMf��4��ɬrb�@�ښ�*'#hV[�Y���f�5�UNL4��ͬ2��jk3���j@�����@f5�Y���j �Ьc�f�6�o���fx�g�`���*�m7DI���12/�m��
���y�X�{��2�L�~͋�%dβ]�v�$,۞�E��8r���� ��d��ڧJ�"/�@[����[���U쁕�Dǲ�R�?�e��҆��P�$b��3��b�!ȡm�sË�Wd��}�'��x����;�����@���98�C�PF�c�"� w��Y"�ˆG�#�Gk���hX�Oyو� �vT+��ﲙW�T���e^aS���=���0:���+{z�ͼ¦�ڗ{z�mx�M��Xh޿��2��a���d!���0��x�Ɖ��B�J��ڄi�I�4�%Nȫ�n�Z�8��=:�E�3���ۖ�n�g;�E�����N~�KΊx��ڿx�ʩ��Ղ߈-X�4M���.�N��q-���n�ؿ�B~�,���0te�x,�b����n��4̖���Ɠ��P�_\p��P�E�^�������H�Y�o����oZ���U��U7�;��K�赸e���ֻT~��\�S�/�ӫo�q٭��Q�h�起eCx,d�s�A������a[6v9Yd�}�1P��g������I��\��;��-�_�4�<yD(��煿��;�^E7�-H�<}�E�C����n��G� ���F���T�@���.��^��E��R�4M����?�j��      Q	   A  x����o�0 �{�
�H�L�W�D;1��tR>"�T�l�3۬��gǅX��6���켟�^���h��%9.J�ˋ�t;@pJ���!��ગ�<;v3��&�[Le���<?��.��ǁ�������˫]Y$U�������Y�҄��>Z�Nd�7 ��6?���v#c����ZB&pi�V�X����
7r�?9�?\-�m��9��hnDS$`^8��p���2���
��3���l�F�B`������"�)�Aj������YX�yM� ����:_^��o��|)aeQ��2���ge���4OKIѩ6y]� њ����{��P�I�;�Ư{Q���k6�����^�Ds�^:�Z�]�3�^������2�S�;�AI���g�Z|��������5�j�~蹧|VL9����Kd���n&r_�zK�"�fI�Q/(���L��ܨ'���X�xگ��J�d�b���ɇ4P���j)�[���H�Ԫ�5C{/h���fR�]&˘.�z����Ί�s��U2�_�DEu�̢��xm�֨��V��O��7wYr��P�Ȟ� yhWW� �zh�      T	   �   x���Mk1�����Ea�n�'ѥ]ئRW��2MF�d�͢��F�B�W��I�L <&��죄\��R��0��k�S8��PS����B2�=���d\w�����EԚ�iBP�8T����=�*���!,F�<���&9/��R�2Fv�����t��~W1��"!���"]����hXYv�����b���?���5�fGU�s��
�5='=ƤW?/�礧�Qq|�����X5���A�m�9��$?h�)I      V	   �   x��α�0����70�����i�-:-5������h������%*\T���8glIߺZ�F/����BI�#�j��2^B| x�o]�"�
����O�v�r,}�5�㎭�2��I�:���=�e�e9~���\m���˙xF���*f����a�B���jr�'�p� ��v      X	   �  x�ݕ�n�0E�|�� �EC��*�X����*r�$X;�_�54��e"E�LF�unf��`�O���h�!T��{h�X�lفC�n��JTrN8��1���F7;	~LUBB�5�I�O��k��Ȥ
O���J�!%
�D�n֛@��y�Y�߁����A�a��E���Ħ��T񖸝_�������l�4�*	pg�0k�qH��%*6y����vm�!�Y�T$Yq�o�U�i}ET���&�f��'1Jp��`��U�7'��N�2T[��1&YjveJ|��*>��k.���A��I�|i�D)sp�fJ[�PT��5�r���ޗy]!]Ck�K�n�U�����&|�����vc�t�����h�ډ�P6	�RL5�K&�����_�Y����Ls������'"��      Y	   �   x�u�M�@��������na�1H�*�;���R��3I�03�3�~y��a|"E�V9�h�Rd�y\�H�5Ɇ�ƙ;,��ok�;�弪�^Ŝ��w	<��wj���z�ģ�A��r/"��6�ʨe��1ٖP�2˥lC�*V����a�nM�_$�0	��??uM^U��(���aH      [	   �  x���[o�0�w>�y�ը�K;��������{�\F$B��V��wLBY��c,P���ڟ���6�����G�/��z�ڬ̾Z�MS�p���纜���s��;�/W]eU�\������|����Ի�ٿ����)�muy�Y��-���x���\� c3��L��w�#Z0��/DM�S6�Ξl̶��z�����i��x�.�vAo�N��EQ�tQ���9�Iҧ)���i�#�E��G�#���^��A�P%�Ǒ��P�I�X��8]�m7m�.�A�`�搚S���$]�,���%��+���"B.K��%6�����u���Bcv��`��őA��/��`x��C���?(] �xȓyj���t-��+��Lo�;HVBB.B5>�z_���>]�!�J��Ȕ�ߌ}���=�L��7�&�֡x�n�x��r�(�CX���6j�<��N;oܻ�nq?�k�4q��)����*]��DlqE�3\�.���Q��g)|*����$�CfR^L�>��N���ϰ�R�6)��$b75�L�B&��W1fw�\	��Ң�4�X7Qr�6�K�C�u�0�����H׃�<��w�ϲ��AxDz���H� Y�]��g��k��xw�4����z3v�<&B5uf�^��E�)�L&S&��      ]	   �  x��ֽj�0��=Wq�$���:R�%�&�\ۅNK��w��	.D�*g1���r��Zo��[Z��O��|�M��5}�NǮni�O�ݾ-����}~ؽ}�}k�S7�ׇǗ�f�/�]AӺ���)Fi�P�BR&*��S<��OV��U��[e		�B�BK�	BLA�Tnb�%���S�}H�+!���e
�!�TnC�Y=�de�%��0�K��aK��aK�u��Y��Y�p4K�����,!Ý5���,!0�Ӡ!$�":�%�p�sH�˲G�4h)T�hm�Ҡy�;5�!K	iИ���E�g"0$�A���Q�	��!�%�gr$ ���*�!.�D�YH�z1*�<f!-�%DG=����p�      �	   �   x��ҽ��@�>O1]#��l�u�na�Z�f#B�׋��H��c3�a���d��d��l��C������+�� =���XD�2^��ow��V�7�������g��,�G&�F���x%($=�xH[Jl�h�ˮ�wad]�
�xa#@�*��|F*ya1������W����X*S^Y�s+�]U�޻�i)��f)Y���vuEw_&���� ��l?YA� ��      _	   �  x��[o�0���~K�Qɗ�Ȟ*5��XZQ���(ack Cŷ�s#6qhў��8>������{u�30�f�`n�0�E������K���������ϗ�qNIt85`�պ��� ��"��s�^�}1���ߋ}�Y߃��Q��$�Y��cUfﲷe���������G�OtG���¿���Z��.�����x���Wp������!�^��nڕ6�|2)��H��& B#�/��.Z��=Wk�`�֬��yg]������b{[�����}�갢G6��ȭb9P��eDZ���J�Y �΢ŨQ�I���oy'%dw`�Z��%`������5%���0�H��b;�,,��;��_f��9�
�Ր�sc4H��Z X,�D"Ƅ�.H8���) �D�x���Q��V�-��ƒ�p���,�r~����Rl�fk+s��ΆK��V`]�W[q�+NT|Φg��@EL�6)��UhaÂ�9�E���_�_<QW;�|�n��V��<�����l\'�[�Od�0�~��,��x7����%��N?;�ڕE��& !�W����>������+ɹ��+06�H:o�$7�%j���.��>�h#i�6���?�ބu�z���B��X6[�      �	   
   x���          a	   �   x���v
Q���WHK.�MN,N-�,HU� �K��SRu�̔��d(�$1)&��Z	T����2-3/-?>�4/�$3?OS!��'�5XAC=+?�8#5�D]G���"Q��e�d�䤂�e���^�I�@��5���� �hC`      b	   �  x��XMo�@��+��&�]HOHC����+1�	������XS��������03�1;�4�$�-K���ӱ�ڶ.U׳���M����;�r��離{<��']_��O��/�GSM�{�����c�۲xݫ�sq=6��R5�F]+|�11T��zgC!�e���I!���b K���&�U���?4z_�/�n���Ml?��s��#���s��C: �,`�2Gf@�ǐ_"�U�jH����6-�:�%�i1���#\]}������h�S̬W՘ܓ��c4�G�O.XC�Y|a���2�=<�-�6��[n[1�:�$A������.?6z��4���'�rBI ����?�	�a��@ �f�`L��`)�zə���z����Ӓ��`Dn�s�ۗ����ݿ���"P      �	   �  x���Oo�0 𻟢�j�A��-;1%�t떝HE	�2���@��LخM������J�D���D��n�-e���	�.�I��R#�NFbZ�b�ȡ�Q5&hS/ �:���"��84�iz�%Q�f��0`�5ߤ��Y���.[��$�N"q��Cqz�C:��aj�ID�ϥ�ϖ���.(��ͺ "��g�	�p�u�c�|�V�������8΁�9�+`�ݐ�<�ފ�tش����gA�{UwT+V.�b��jm�9�=��&Ϩ��#g_���Z��eLMWt?��%ݡ�;�Dx n�\��z+���s��)�F����96�#�v-���i��ʶ���m_'�h�g#e[�r�ɸv��=�-�)_�W�og.M��_x�iw�leۛZ�үf�{�����n����$�      �	   �   x��ӽj�0��Oq�:/M�.�QD��݂*_�v,��o_%��%t+!��]���90��A-{}'1���i�T\B���+F]K+4�F;�~�Ka�P�IA3X�G�/�$�0��������:���M�'I����\v�M_)'4\?쿨��c�M
����6�|����K�>�־�J}	y\�w�{���q�X����8��]���ב��N� ��������J0E�      d	   
   x���          �	   
   x���          f	   L   x���v
Q���WHK.�-�/�N��/W� ���3St�����TM�0G�P�`CuǢ�b���$uMk... �d�      h	   t   x���v
Q���WHK.��IU� ��):
 :/17US!��'�5XA��BGA=�Y]Ӛ˓4��@����Ee���E�`d 4 ��$����M���K�K�sSɰ�lwJnfH/ ��\�      j	   O  x���=o�0��_�Db���)�����L;2$T��(���>խ��vyxt�\��v��η����>�yZ�l����%c����|�:�.Ӗ����l#x�d���4ۇ�^E8J�(	�dhP�(��$�R8J�(��JU�(��("�A��QG)�q��Q%��`��q�Q��\�9�`(� 1
h�p^�"Gb1��,
$&��Db��Xz�n�ۃM׫�O��)���ٷ��q=-h0�\� ����΃D�a���R�a��~8�DZ
�t��'���H���=�VZ�o0;{l;PŽ�[�k�`ed�VE|�#���"l�T��4%�7Ԁ�      l	   
   x���          n	   �   x����
�@��>��԰���N�ZP�\�[�;Հ�����*>����o����Y��x&��4C��d^$�:h�W�'QW=u�Z�4~e��#N
��w�ݹSI�g�OL�ͱ��F� x���Uҷa��G�o��LI���2��Ia�"�rS��(��f$�J".l�ˍF�!�);�9M��&σ�      p	   +  x��ъ�0��}�\,DAoeq��F�m�q@�!�6jwۤ�&3�e�}Oj�Q�����Xh����������_�A3�h��u�Bc��>�3��f�b�������~��6J�S�4�n2)��x=:��]�.fE��1өTH�G�y� ��k�l��v���'��7La���<���_{_;���`��,4�H����x�Qӿ�g�F��E�J��v\��M�1�OO�h����X&i�R �0]�	�
-��8�%�wLu�|���O��y�Vp`ܻN���ө:��>�U,K�P���F�-}��&�u�{'M��KK(w�ir��r��7!
�i��\��J�W�\�J��A%�:�fM2�e4����n8��>��`Cn�.���fBCѥF�e�U�u�z���_F.��[�'�@��ϥл�}@�>.�q<�٣���KͲ�[��no�j+�oMƠu��&�3�$ �4tV�ī]N$�E!��:���\m�}���y�j�������נI�&kJuҵ�m�?d*�����x��qC�~���4;�?�(>      q	   7  x��WKS�8��+\�0S;���,.K��b��0sMɲ����V�0�ߖ�$N�\�k��ꗿ>=�v��Etz~�wT�Ek��Ӣm�~U�_"��붽����4V;�?Tzf����r�-��ucm\ym@�0ƶ�xZO�j�pnN�z1�-�/�*�N���n�.WS��s�����ɷ�Ӿ�geE��D�9���-eRی�
C0C��%G��:M�� �> "�\�T�d��Hz�WY��Ѯn"�����������Ehd(Ig��	a��_�9����_hE��V%*γ��?>ԊyH�X��_u6D���#H��m�ۺqk ��V7��� �m|�O�v��m�	�˪�_�Uqeo�8������o��V}`o�('�[�/>��!;�8�q�'��ý��TI������_4�i���K[�$�R)�0��6"E�H�b���0��L(�G2�}��.-�9���z6��"��
YUU!(Q��$]=�U�g�f��z0�C�!�~�c��Ō-�IY	��:�V8-�eSO�{R�iN�e�ۼtõ�y_ͽݝ	�|�t{96��Ŵ�w��6�-8^f���;]��[K�boC��*/�ɿ�O0,^l
-n��5���4�A�?�~��4���)�O�r�B�;�t�c����g�v�=@x��+�O�M���v���C5:+����d�	�p�i�P�0N�1I�ݜB7�
q�ƣ4Yq��4
Z{���'BЯ���������}X?HpmE�A�]eEQH��I��&�b��D!	��0	�6�C��!�:����vx���溄�|^���ќ �s�B(!Ef�bc��:��n�<U�C�	��>�Ի~�UK4�V ?��Vŕ	s�`D�1_<�T���B`��C!�]��8J�28��+�`0������>p0�`���� y�y`�H�H�]s�ݩ���"\!��� iD���9ޒ`A�c\<i��������fʗ��u��a�<���� :׍�ܖL�+�t���"���¸8�k��.�_�r��\Ol?wV|i�je�-�>�g�Z�����>j������j:�      �	   �   x�Ւ_k�0���)�[���ϊ5{*F����^KL2��d4��o���8&>��ܛs��#yY���r�
ﲵ�QF4�������d���gu�����t�V+/�p�m�퇖�v�p|tµ6���)�z8H�I�}����^�O &?NQ2% �ф%dF��Jc�
�evâ��o_xUeϼW�RV��ϖ����(�Xd�E�C�a<K���B���;�E/WJ��?�o&��
�<�D+�~ �'m      r	      x�՝K��q������~�7�B��6`= ���4<$�l� ��;#���u3"�ƥ7>��x���uU������������������������ϟ�����w��������?�O�}�e����w�><?�߿�����]�����>~~���Ӈ�?��x���~z�ӗϟ�����_>��������û�?����/~|z�����۟���??��}��۷�?>}�m������_G��?��u፭o\z�mKi�ޔ���֛��_����wO���������,����[j[Ɩ�Yp�E��E21�YT<Q��o�m��T����x,ҝ,�5U|.���"+Yd�'�wmf!�x,ʽ,�q��#��Ǣ�Y���n6�Zg�U<�^��Z�,*g�0
�6l)��K"��0���b��oE\�8��0�ѳ>�������>%�
C�=/v�)��I$�6|6�t�>J��={K�6{��Fkra/���І����f��c�ZT���0���b�W�0* �u�|<����VZ����9~�* e�|��L`�QŃ���b��<yU@����z�%;��IxM�
C�?/v�ǳ-YD@����ȗi�D7'.Q��L��ћ�I��̟d�m�n�'L��`* e�|��?Q��̟�n��_Z���k�U@��ϓݼYo����D�6��T6�L�)CR�`m��ح}��������n�B�ۄ���0��ӏ�E��{�=��I* mvC��M�ɐT@��\�_N*��Nx2�
C�@/v�	q^U@�z����m�dU@��"��-F�"��
C�@w�c��E�@%�6��v+�^��d�*��M��>���9M䯉���&��n�l���
C�@/v��>�[H�
C�@�X�M[p&W��%��0�	�b7���k"��0�	4Ѽ4T����B����&г�hM�q\Rah���o�g�VI��M�g�}T��%�6�f"C�R܉}Z%F�&��n��|�DRah��n6����6v�����5��i�����ϋ�`bZ�8��0����]��yg2$�6^�F�#��H* m�vi��Ƿ�$�6��&k��5�T@��YƲ^�vy��* m���M�e6M�T<Y�?�r~s�v KTah���n�xz�3$�6��q�lx^�!��0�	�Ҩ`�)��_I��M�u��-9�x����&Ћ�d]�
C�@�83`ǂ�e����&г]:�����6^�S��������Fg�c�R衊�OIŃQ���b��mv�STa(�g���/m)���!��0���d7S�|��DTa(�gp4D�Bk���)CTa(����sĜ?E�2�q�&xz�c����P�ϓ�@EJ�M���P��n׹q�*����Q��L�/v�p$KTa�h{c������!��5Y�x0�*����}�K�*�v���H;��Bk3I��J�G��$W�0* U�v���u��8ÐT@�z�Ly�A��J�����FU��nc����P%У�b�t
i��P%У�fJe����P%Ћ]��
,tI* m�v��梉�F�BŃѴ	�b7���1���0�	�<�I)�X�T@�:J��B2Q���" 
m���-� v������n�|3m��^��0�ȟ�np&�œq�����6�i\�XʐT@��y�ۿ��&�
C�?����!�YU@���b����E?QŃ�2��p:��?lTY(���n�^�7�,TD� J~=m��ا��*��4���o6��.QE���t[G�b�.2��7ERi(S��j|�筢�HCC�8EAk{�X?/i�*"e}�Yg���HCD�����\3IE��M���$��qPi�Dj��%��sy|�GTi(��_oj���D��2�R�}V�/�7ETi(���l���"�Pf���Xx�"�PfQ����e���7D��2�����6�J*"e�~��P݂7!̋=��HC�E_�F�hz�"�PfQ�
uC5�eQQ������S�#{6$��6�^�z+���HC�E�������?�DD�$z����P�{"��4�I4�Q��ܛ�V7D��6��~=uF�Qx6��HC�D3&���ʲ��"��&ѳ�HǱ� *��4�I4����V�����HC�D/~�iҳ�U@�����V���?���=��HC�D/~����ETih�h;6!���)��HC�E�~�3�Uo�*"Muv^�mE:aa����HC�E_�&J������HC�E�o�GyT�_aW*"M��ی�>�Rih�(�ݯ7)tL�66nH*"M}�[�m�t&z��P]�����FG���e�"��d�+�m>��Rih�(�M���������+��&�^��s�啊HC�E��Q9y�TD�,z�L�,�J*"mձ�[{S$��6�^�VS*ˢ��HC�E�)��a� g�"�Pf�����qCTi�.O�~����uH&�	�$"�P&��̈́<'QQE��L���-R�vޤ2����H�D�����i�N�Σ��"rPfЋ��7Bc��"�Pf��o*�篱CY(��n���s��*�7v�I���^oD/DD��y���e	�"�P����9��$y�@���4TW']��&Ok��*^��QG}��JE��ʟ��S�[�8��4T+���D׏�N��Y���HC�B�~�|��JE��J���2�Y��3�+��*����"~E�"��&�4�7��7��5D�zq�Lq�-�TD��Otw@����+�Ŕ̞IE��M��4#����OIE��M�g�=YEϞIE��M���Ұ���aCRihS��o4������HC�B�C�U1o6�腊HC�B�����K�%/IE��L��r\D}V����*"euq��_��6SD��2��q��W��!��4^�J��ʯ�]氟�����"�Pf����:SD��2���|�{%uEE��2��_�@-r�wRD��2��=x�Z��)��HC�E���n�3�g"5�qCRi(����M@5��3zQE��̢~䫱ljb���"Ҡ,���ކQ�����fe���" (���׷�?�U�ȣ�[$U@�V�OO��K	�'����D�6���W�y�4n0��6����������"��e?��`Mrs��"��F���{��̮TDI��M����Z�����0��;��1�ATih������i�2RTi(WEɯ�{	-�Ų�/IE��]~C���e��GÏە�A�q�ۓU���毂��©�'��`����"��w��낺.~M��#��q�#�'�s���#��p�l��V>��TD�:�h��29Sa�C�ˤ�ɬ�^Ty�����7[L����ZE�qG��9"�>L��IE����F�^�M(VzO�
Cu���׏����	y���4�n��cFV���Y6{�TD����z�g�����"�P���A�&6�J*"e�v���d_אTDI�d$�^ɤ��q�"��w<���ٺ��"�P��a�ʗ��|./��0�!4S���i��rIE���î�6�=K�0&�Wn��vG��eRD�S����?}d�2�IE�qG�[
�޼����H#h�o��s֔&�P��#j��K�����J��#�1n�Gcaa��*"m���.ɦ�]B�*"����o(&��[��H��ߕq�5��i����C�5��q���I* �q����+aڸt���%���Lt���Ӿ�e�IE��Σ��o����'��4�G��~C��󹛤"��։�S]��~�¨�"�Pn��Ye헔&�(LE��us��nO�$�!-��0�i���\��*"健Jv}����\Q(�Ew��J��$�* ݥJg�1Q������HC�7?��!����"�PV�V�;�f
���TDʭ���1,�XDD� ���Ԫ�P�"�P�a7ZJU��[%�2��v-��(��"�(�%�ݱ{%Y6&��vs���"����/�J*"}
-�Ú�i�m�I* ��ܜ��f�Y������C�9�;.Խ��2{IE�̡��ݶGIs�^j�"�P��_�FÛ7	""
��    ��m���-TD�::G*��b(Sa�ch���I��\Ra�C����~�ORy�{Og}m���LE��ݔ�T�C����{��"/O�(��U�\E��</?�a�Da��*"myh}��?�I�Si�#(�q�-��Fa �*"�b�^Ֆ�.-yq��2�6�ӿ�t��c�KRah�Cw��z%4>A�TD�:'?6pH*"�jh���v�Sa�""}�a�6��4/��T@ڛ�v�����y�&IE��-~{�vU*ؐTD��w�;��^*��<�š�ort�Z�{��H#��tt�=r��9��HC�ϾQ��(G0�IY�"�зo�=��n<UDE=Y�&w}zf"�$ERa�G#]
�gK�G���4���V�ݸ%ۉ����0�rs~إ�j�c{���C�9�;N�|��9DD��G#������"�P���v+uh�]��rk~w۶XL��%���Bd~�ZI���a��DD��M�-]=�s�6��Cٺi�K����^��p�����8S}p�V���ȣ��p:���ESn��n�^)��0����ol�9o�$��4tg��gZ��
��!��0tg�Nv������"�е=��-��DTa�C��q&[�?(���CW z��G�X��%��0t�'�e���,��CW�ۥ���yΠ��CU�߸����F�:x�"�`U{�g����Y2�IE��J��o�7!�q��3��HCU���q���-ky�/X��4T;�~�!_F�x6�EY��Cχ�����0����x\
]��4���2�D�f�4�*"����ï��#��Y8F�H�v��ݯg
�봉Ƕfk���vM�]Ow��m�Ѵ��Va�܍��jJ}#lO�q�!��0�)�~Ǖ!Q��1�.ED�S�n��j��P��aH*"��)��w��3o�{"��4�)�*k�d�Ч�����*��4nS:�uݲ��}]%���۔v��㋮�aCRa�ܒ?ڍc��%�VahS��Ki�n�a\��,�t�M�;mfTRa��B��	Mǂ)^@'��׆Ћ����q�TD7��_��T��|4�*"m
}��ސ�J�Siܬ	��-�I4a^�DD7kB�n35�Y2����ɤ��F���`|J�"�Ю��~"t�5]u�Y��,n���R���җ���0n�����Er&��QE��\�����/��?I��	t�����dRi�(E��Y��U�ZE�q�&�h�P��`�'���0nք��1FJc�,"�Я�R3&76G�cRi�l�4�z;��2��~�,UD7�A�vu�n�ZE��K���d�B窦~�"¸}.��o쳏y�&��,t����l
���* ����˕x�$Z����=����"Q��w�� �+��?IDd�\�+�#�V���IE��wř*I�@0.͋䢊�E�D�{�F]��l�TD"�[�DcӼ�*��D�i�3��J*"��*a�n����82��D��D�Ʃ<�K*"��Dh�5�%-�
H$)WJw�i܄R��J*"w��<��"g&����H=��IzF��HD�iOWC�����}a�n�~wK{�t7��H*"��n�NC��ٜNRa(��O~#���� ADd�\1�����ň1��0te�'�y�A�X�TD�%�JG����?�
#�l$z��3���*"ݖ���(�<qI*"ݖ����u�qGQE�q����_�LJKG���>NG�y4i�l�&��0�e����֑_��9D��*���0��������X��4TG���H�at�ӳ�Pi���_�h�NgP��4��H�v#��_7V-�t4x��P\���M����>�1����"Ҡ ����������o���f�-'����'"�e�TD ��׈D��`*��D�7It!ʒ�QE$r]K:a��n�gϐ�@*"�i���A���P1q[�!�*"m4ͧs��IE����cկ��{�*��4$��j�^<��4o��M]$��2��Q;���I~d�
H�*�i���NR��b*��UD��RO��(���9��<uUD��ҋ�J3J��+��HC�R��u��>��ظ!��4T��~idp&D6nH*"
�OϿ���r�GmZ �V��׀HOH�Y��sUD �Tz��/���*"���o�b��D*��4(�����/o��/��?���ۧ�ͻ�o%TCK� ԩ��B�3.d��aώ�{��Nh��H��?����S螙l���TD0w�W���,Ey�"�w}���EU���1��@(�~x����������O��6x2j���IE�����h�BE��`�X*��"�)0�C��ބŠ;��`�]��a9%S�ҫ�"iw~��r3��;{��$�{����IԔ0��e�"��c!6�
"�XMa*"m�����O���QE�qG��� �7�ADġ]�����q�W�+���HC_%0��"B]��V���"�(X�T۞�ȵ���5��.�bV@�*"������5���jIE��8�M���X4�T@�2��6�/}��¼�"��f֋�f�L�k�$��>"c�5G��&��`�N���l+R�g*"�2� ��x����*"�����z��4��&��4�
��}���aLBV�*"�����r6�	_�"�Vt�cC��s-�ܓTD�.�^�/�܋����ȸCJ���-SSP��'��@�a5��PS5��UD��t^���lH*"m������y!��"����:������IE�jѫ$V���J*"U��&�ޠ�X\R�h�_G�C;VR��*��4�Qu\��ߞ�{i$�ƈ��/}|�I]�8�'�T���2���	wdֳ�M����}󣒩3Q,�I*"m~-c�t�3��UY�o{J�c��H��"�QV
�<��t�5���#��4�+��2��EG�t��UD���u�I_��+QE��
��=���ߏ0���HC�!0n������.V�	H���DU��@���&Y?�U@��T�Ҡ��9���*"������8
^��0��HCMø���ƭ��qCTi��V����R�)[��*"U =��&%�lH*"U #d�qWL3-�gCRi�ix��J9��mQE������h{2���"��4T+�g���J�m�1��4TY��g49s��T�nZ��4t7P�щٞ�)Ӹ�Pi������(���Ù��*"U=��e�d�T$�Pi�����]����7س!��4TY4ҙ½�m&�y�UD�,G���A9��iH*"ʢ����˯�n$���CTy��������hUD�i�eu�&F�;*0��$ob��QE$�L�>����}������D��x
շ��`�BE�A����}���×�@�G�;���CT�(C�io�n�_�O��"�P�R�V(nq��|�TD�P��M�mhc]Ti(C�otu�X����IE�1H�|}z��^��p�Ϝ��!��<����7�>a�GQE�Q�~:R6%.�����CIO~Ӹ���Ƶ
Hc��ꎧ#�{��QE�\&=��4�Oy�袊H���t�R;���q�"�Pfҋ_G9k1�^��4��OGp��?�RQE�A����_>|�����Sړ�:.ʕ�5Dw��@����yB+��<(���;�L�Ϋ�G�IEDQ�~S��Ms�eR��KC�j@�ȵ
H�*ciu�4c�^�e�ٷPy�b��o��H7-.TD����oW���[�YDd1]��*�Bk1��@���8(�j6��6��3`�=���R�˭��O��,{[�F��F�b����*���ȣ�Ƀ��7u��-TD�z�D�N�ǃ6R��h�*"U&M�K?i�����ȅ
H��v�/~����k���F�uɜ�ȝ��i����TD"W�tۄ'#<�Q�d�)e���*"�pǓq�������"��y�<��R0�N���D�T�|Fȳ�E����"Ɋ�å��7��	��"r��Ɉ#uf:�g��!��<���"�	�@�U�-{?$�C�ɡ�S��_n��*�x��w���ú@�����*"�{���Lm�z�l�,VT�������Cˠ�"��D��ѣQUuL��6EDD
��� b   +�>�;&:�0UD"��sA��f���^�_WQE�p3}�Ӱ�сԆy�KT9��F8j�lM���LT9,O2	#�X��t��)l�\T9�����v��      t	   U  x��ձn�0�=O�DBU4uI���Tj���&X��!o__���<q�O�w��a�vd���yo%8��%��>T2����=�J��TZyY����is`�(dAg�������O���y���b�i�ݰ�K����y	��t^-�V@�J�d}n��r��?-���[?˳4��>Q�+犢Q�f�GJ,��ȇ�9M�v�Vʀ2�ϟ�ܞ�Bh=���UF�)}�؃JG�v���7������&����Fh�0� ��X��)A>,��W	����Ð���qJ���L#a�Jo9�Ϋ�f3J�p�G)��~�t�v|��܊�;��f���O8      v	   a  x�͒AO� ���������=xX���m&�+�e�VK5���vF�F=jH��>���j}y�A���
e�c0M0!غB'����)�!u��������a�՚u*�YV7�I]��y�n.���5:�XLј��p2�]�z��=���;j���:Ͻ�.Jk�'	�w����~L�ÌpDX2'ɜFB�)��Ym����h����xW$��q�+�^KalV8%`6��������Dx�hBiSv$D��|?E,*^��
�}aI�*���p�tU��7�/�a��8Ŝ~���J_����맰{(2�E�x2oK����]BDb�����?H� a$�T~��@��G��j/E      x	   ^   x���v
Q���W�MN,*��S� ��):
 :/17US!��'�5XA�TGA�-�,U� 1/5G]Ӛ˓4̀x;�����5$�@���� �6�      z	   �   x���v
Q���W�MN,*��+K,�LL�IU� ����SRu��Ҽ�(Hd�h*�9���+h�W���(���ISMk.O��kD#s�id�	��5����4��J�[%���n�U��1����2�ǈV.����z!42׃F�:�(�)�ؘF�0�6�����
�JZE%zPpq �g      {	   
   x���          }	   �   x����n�0�{��7@ʡP
H;1���Ƥ��u�RkJ��fho�d��'�!r��'�vu���T��	.'��Q:��Wӓ��L� V1���e��&1��чYM3x�>��k��L�oo��D�"W0���]V���`=:��Yj�j�"����6`E�L�-c��~4��`��+�e�9>CM��8����U�k	z��\��%��k�/dk�#xd�u:y�{!�܎G�����*�      	   E  x��Ks�0����H�I	�Gzr&�6���$G�U��r:駯�%��ĝ�0=�\�JZ=���Ϣ��7�h2�V��,�.��N�i�8��c�y1da���Fdr���5̞�*Ca�*Y�����i��ac���A4]��S��I��SR�i�6+6;���(�Ѧ۬��?��X��VQ�_��<H�jϸ�0�I��qY�>���G�7rƋj5N�ɤX&iq(i�^�e�o;õ��V�7��H�e��+5	ؙ�&+N`��D��m�,��Lδ��͝7�N	S��NC�N�.~a8a��\�=�����ws�|&y�4���<jh^�a����2�N7/(M,���rf� Jc;��JK��7^�7_FT�2I��'���%��k&�]���K�Y�m6�6Kg���.PN,@�ƦI�nm�b�G��
:���YaV"̚�&��������(�f �?���x2��FZ����Lz~�kM;��h�U��6��	f � ��Ma��8��dC�}�{���������@>.� ������K�yd^����L�U䕚�i��͘L3�X�Ҍ�fم������l�,[M�����o=�)�w�Z�7"�)kE����xp�{W�(�܀�[; {@�K��&�v��T]?��pvA���P��I��r���A!�r켑%�◦3��A��&��7-���9-�`	twt�ro�wgmȳ�=|~�M��|�<�W��𬹻D�o#}�@-&����Wq�1��f+j�:��k��ˌ���'�J@U߭6�Nk��d�8(�@7���,�.n�1��\��\��{Ep�듓?�� '      �	   
   x���          �	   
   x���          �	   
   x���          �	   �   x�����0���n*H��C�%���U�*�M��߷�C��N�{|�x8+ӢB8�r�J:!�HY74Bj��+9�̴ >�д!�ƧKZ�`�E���8�8�U% Ĩ��������<�g\�K?��q�?M�啽��s� T'��������d#�������X|�~&t�ŕ���j bN/uظ�}��7      �	   
   x���         