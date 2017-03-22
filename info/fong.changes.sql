CREATE TABLE fcpage
(
  pg_id serial NOT NULL,
  pg_class character varying(50),
  pg_func character varying(50),
  CONSTRAINT fcpage_pkey PRIMARY KEY (pg_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE fcpage
  OWNER TO pnd;

-- Index: idx_fcpage_1

-- DROP INDEX idx_fcpage_1;

CREATE INDEX idx_fcpage_1
  ON fcpage
  USING btree
  (pg_class COLLATE pg_catalog."default", pg_func COLLATE pg_catalog."default");
  
update mjoboutputlookup set jol_title = 'Prepare artwork' where jol_id = 2;

insert into mjoboutputlookup (jol_title, jol_status) values ('Amendment', 'ACTIVE');

insert into mjoboutputlookup (jol_title, jol_status) values ('Output', 'ACTIVE');

insert into mjoboutputlookup (jol_title, jol_status) values ('Barcode', 'ACTIVE');

update mjoboutputlookup set jol_requiredtime = 360;

ALTER TABLE mjoboutputlookup ADD COLUMN jol_pricingtype character varying(12);

update mjoboutputlookup set jol_pricingtype = 'FIXED';

update mjoboutputlookup set jol_pricingtype = 'UNIT' where jol_title = 'Barcode';

ALTER TABLE mjoboutputlookup ADD COLUMN jol_price numeric(20,4);

update mjoboutputlookup set jol_price = 20 where jol_title = 'Prepare artwork';
update mjoboutputlookup set jol_price = 5 where jol_title = 'Master Card';
update mjoboutputlookup set jol_price = 10 where jol_title = 'Technical drawing';
update mjoboutputlookup set jol_price = 5 where jol_title = 'Amendment';
update mjoboutputlookup set jol_price = 10 where jol_title = 'Output';
update mjoboutputlookup set jol_price = 5 where jol_title = 'Barcode';

ALTER TABLE mjobsheet ADD COLUMN js_color_6 character varying(12);
ALTER TABLE mjobsheet ADD COLUMN js_color_7 character varying(12);
ALTER TABLE mjobsheet ADD COLUMN js_color_8 character varying(12);

insert into fclookup (lu_cat, lu_code, lu_title, lu_status) values ('JOBCOLOR', 'CYAN', 'Cyan', 'ACTIVE');
insert into fclookup (lu_cat, lu_code, lu_title, lu_status) values ('JOBCOLOR', 'MAGENTA', 'Magenta', 'ACTIVE');
insert into fclookup (lu_cat, lu_code, lu_title, lu_status) values ('JOBCOLOR', 'YELLOW', 'Yellow', 'ACTIVE');
insert into fclookup (lu_cat, lu_code, lu_title, lu_status) values ('JOBCOLOR', 'BLACK', 'Black', 'ACTIVE');

ALTER TABLE mjobsheet ADD COLUMN js_cartonsize_g numeric(20, 4);
ALTER TABLE mjobsheet ADD COLUMN js_cartonsize_l1 numeric(20, 4);
ALTER TABLE mjobsheet ADD COLUMN js_cartonsize_w2 numeric(20, 4);
ALTER TABLE mjobsheet ADD COLUMN js_cartonsize_l3 numeric(20, 4);
ALTER TABLE mjobsheet ADD COLUMN js_cartonsize_w4 numeric(20, 4);
ALTER TABLE mjobsheet ADD COLUMN js_cartonsize_height numeric(20, 4);
ALTER TABLE mjobsheet ADD COLUMN js_cartonsize_top numeric(20, 4);
ALTER TABLE mjobsheet ADD COLUMN js_cartonsize_bottom numeric(20, 4);
ALTER TABLE mjobsheet ADD COLUMN js_expectdelivery timestamp with time zone;

CREATE TABLE minvoicemonth
(
  im_id serial NOT NULL,
  im_invoicedate timestamp with time zone,
  im_created timestamp with time zone default now(),
  im_orgid integer,
  CONSTRAINT minvoicemonth_pkey PRIMARY KEY (im_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE fcpage
  OWNER TO pnd;
  
create table minvoicemonthjobsheet
(
	ij_id serial not null,
	ij_imid integer,
	ij_js_id integer,
	ij_created timestamp with time zone default now(),
	constraint minvoicemonthjobsheet_pkey primary key (ij_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE fcpage
  OWNER TO pnd;
  
CREATE OR REPLACE FUNCTION pnd.generateMonthlyInvoice(p_month timestamp with time zone default now())
RETURNS integer AS
$BODY$
declare
v_ret integer default 1;
rec record;
begin
	for rec in (select distinct js_orgid from mjobsheet where js_completiondate between to_date(to_char(p_month, 'YYYY-MM-01'), 'YYYY-MM-DD') 
	and to_date(to_char(p_month, 'YYYY-MM-01'), 'YYYY-MM-DD') + interval '1 month' - interval '1 second') loop
		delete from minvoicemonth where im_orgid = rec.js_orgid and im_invoicedate = to_date(to_char(p_month, 'YYYY-MM-01'), 'YYYY-MM-DD') + interval '1 month' - interval '1 second';
		insert into minvoicemonth (im_invoicedate, im_orgid) values (to_date(to_char(p_month, 'YYYY-MM-01'), 'YYYY-MM-DD') + interval '1 month' - interval '1 second', rec.js_orgid);
	end loop;
	return v_ret;
end;
$BODY$
LANGUAGE plpgsql VOLATILE;

ALTER FUNCTION pnd.generateMonthlyInvoice(timestamp with time zone)
  OWNER TO pnd;

drop table if exists minvoicemonthjobsheet cascade;
create table minvoicemonthjobsheet
(
	ij_id serial not null,
	ij_imid integer,
	ij_jsid integer,
	ij_created timestamp with time zone default now(),
	constraint minvoicemonthjobsheet_pkey primary key (ij_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE fcpage
  OWNER TO pnd;
  
CREATE OR REPLACE FUNCTION generatemonthlyinvoice(p_month timestamp with time zone DEFAULT now())
  RETURNS integer AS
$BODY$
declare
v_ret integer default 0;
--rec mjobsheet%rowtype;
rec record;
rec2 record;
v_cnt integer default 0;
v_imid integer;
begin
	--raise notice 'from %', to_date(to_char(p_month, 'YYYY-MM-01'), 'YYYY-MM-DD');
	--raise notice 'to %', to_date(to_char(p_month, 'YYYY-MM-01'), 'YYYY-MM-DD') + interval '1 month' - interval '1 second';
	for rec in (select distinct js_orgid from mjobsheet where js_completiondate between to_date(to_char(p_month, 'YYYY-MM-01'), 'YYYY-MM-DD') 
	and to_date(to_char(p_month, 'YYYY-MM-01'), 'YYYY-MM-DD') + interval '1 month' - interval '1 second') loop
		--raise notice 'found org_id %', rec.js_orgid;
		select count(*) into v_cnt from minvoicemonth where im_orgid = rec.js_orgid and im_invoicedate = to_date(to_char(p_month, 'YYYY-MM-01'), 'YYYY-MM-DD') + interval '1 month' - interval '1 second';
		if(v_cnt=0) then
			--delete from minvoicemonth where im_orgid = rec.js_orgid and im_invoicedate = to_date(to_char(p_month, 'YYYY-MM-01'), 'YYYY-MM-DD') + interval '1 month' - interval '1 second';
			insert into minvoicemonth (im_invoicedate, im_orgid) values (to_date(to_char(p_month, 'YYYY-MM-01'), 'YYYY-MM-DD') + interval '1 month' - interval '1 second', rec.js_orgid);
		end if;
		select max(im_id) into v_imid from minvoicemonth where im_orgid = rec.js_orgid and im_invoicedate = to_date(to_char(p_month, 'YYYY-MM-01'), 'YYYY-MM-DD') + interval '1 month' - interval '1 second';
		delete from minvoicemonthjobsheet where ij_imid = v_imid;
		insert into minvoicemonthjobsheet (ij_imid, ij_jsid) select v_imid, js_id from mjobsheet where js_orgid = rec.js_orgid and js_completiondate between to_date(to_char(p_month, 'YYYY-MM-01'), 'YYYY-MM-DD') 
		and to_date(to_char(p_month, 'YYYY-MM-01'), 'YYYY-MM-DD') + interval '1 month' - interval '1 second';
		v_ret := v_ret+1;
	end loop;
	return v_ret;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION generatemonthlyinvoice(timestamp with time zone)
  OWNER TO pnd;


ALTER TABLE mjobsheet
  ADD COLUMN js_cancelremark text;
ALTER TABLE mjobsheet
  ADD COLUMN js_forwardtocusttime timestamp with time zone;
COMMENT ON COLUMN mjobsheet.js_cancelremark IS 'Cancel remark';
COMMENT ON COLUMN mjobsheet.js_forwardtocusttime IS 'Forward to customer time';

ALTER TABLE mjoboutputlookup
   ADD COLUMN jol_seq integer;

ALTER TABLE mjobsheet
   ALTER COLUMN js_diecut_ind TYPE character varying(50);

delete from mcarton;

ALTER TABLE mcarton
   ADD COLUMN car_seq integer;

   
-- 23/3/2017 startdo $$
declare
var_pid integer;
begin
select mn_id into var_pid from fcmenu where mn_code = 'REPORT';
delete from fcmenu where mn_code = 'RPTJOB';
insert into fcmenu (mn_code, mn_parentid, mn_title, mn_status, mn_order, mn_webflag, mn_class, mn_func) values ('RPTJOB', var_pid, 'Job', 'ACTIVE', 6000, 'Y', 'Report', 'job');

end;
$$;
-- 23/3/2017 end