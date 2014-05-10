ALTER TABLE fcdoc
  DROP COLUMN fd_file_size;
ALTER TABLE fcdoc
  ADD COLUMN fd_file_size numeric(20,4);

ALTER TABLE mcarton
  DROP COLUMN car_fileextension;

CREATE TABLE pnd.mjobcat
(
   jc_id serial, 
   jc_jsid integer, 
   jc_jclid integer, 
   CONSTRAINT const_mjobcat_prikey PRIMARY KEY (jc_id)
) 
WITH (
  OIDS = FALSE
)
;
ALTER TABLE pnd.mjobcat
  OWNER TO pnd;

ALTER TABLE mjobsheet
   ADD COLUMN js_primcat integer;
COMMENT ON COLUMN mjobsheet.js_primcat
  IS 'primary job category';

ALTER TABLE mjobsheet
   ADD COLUMN js_status character varying(100);

ALTER TABLE mjobsheet
   ADD COLUMN js_completiondate timestamp with time zone;

ALTER TABLE mjobsheet
   ADD COLUMN js_assignto character varying(50);
