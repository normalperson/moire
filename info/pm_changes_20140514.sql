ALTER TABLE fcpmcasetype
  ADD COLUMN pmct_caseinfo_function character varying(100);

 ALTER TABLE fcpmactivity
  ADD COLUMN pmat_show_caseinfo character varying(1) DEFAULT 'N';


------------------
ALTER TABLE fcpmcaseflow
  ADD COLUMN pmf_end_pmfid integer;

ALTER TABLE fcpmevent
  ADD COLUMN pmev_timer_interval character varying(50);
COMMENT ON COLUMN fcpmevent.pmev_timer_interval IS 'format follow PHP DateInterval interval_spec, can accept UDV';

ALTER TABLE fcpmevent
  ADD COLUMN pmev_timer_workinghours_only character varying(1) DEFAULT 'N';
  
ALTER TABLE fcpmactivity
  DROP COLUMN pmat_show_caseinfo;
ALTER TABLE fcpmactivity
  ADD COLUMN pmat_show_caseinfo character varying(1) DEFAULT 'N';
  
ALTER TABLE fcorg
  ADD COLUMN org_lccode character varying(32);
COMMENT ON COLUMN fcorg.org_lccode IS 'Locale';


CREATE TABLE fclocale
(
  lc_code character varying(32) NOT NULL,
  lc_description character varying(100),
  lc_primary_langcode character varying(5),
  lc_tzcode character varying(100),
  CONSTRAINT const_fclocale_prikey PRIMARY KEY (lc_code)
);

  
  
CREATE TABLE fclocaleholiday
(
  lch_id serial NOT NULL,
  lch_lccode character varying(32),
  lch_date date,
  lch_recurring character varying(1) DEFAULT 'Y'::character varying,
  lch_description character varying(100),
  CONSTRAINT const_fclocaleholiday_prikey PRIMARY KEY (lch_id)
);

  
CREATE TABLE fclocaleworkinghour
(
  lcw_id serial NOT NULL,
  lcw_lccode character varying(32),
  lcw_day character varying(3),
  lcw_start_time time without time zone,
  lcw_end_time time without time zone,
  CONSTRAINT const_fclocaleworkinghour_prikey PRIMARY KEY (lcw_id),
  CONSTRAINT const_fclocaleworkinghour_unikey UNIQUE (lcw_lccode, lcw_day)
);


ALTER TABLE fcpmcaseflow
  ADD COLUMN pmf_from_event_gateway character varying(1) DEFAULT 'N';
COMMENT ON COLUMN fcpmcaseflow.pmf_from_event_gateway IS 'Last flow is an event gateway';

ALTER TABLE fcpmevent
  ADD COLUMN pmev_intermediate_show_task character varying(1) DEFAULT 'N';
