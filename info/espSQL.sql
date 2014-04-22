
ALTER TABLE pnd.mjobsheet ADD COLUMN js_barcodetype integer;
ALTER TABLE pnd.mjobsheet ADD COLUMN js_barcodenumber character varying(100);

CREATE TABLE pnd.mjobcatlookup
(
   jcl_id serial, 
   jcl_title character varying(200), 
   jcl_requiretime integer, 
   jcl_sequence integer, 
   CONSTRAINT cont_mjobcatlookup_prikey PRIMARY KEY (jcl_id)
) 
WITH (
  OIDS = FALSE
)
;
ALTER TABLE pnd.mjobcatlookup
  OWNER TO pnd;
COMMENT ON COLUMN pnd.mjobcatlookup.jcl_requiretime IS 'Require time store in minutes';

ALTER TABLE pnd.mcarton
  DROP COLUMN car_code;
ALTER TABLE pnd.mcarton
  DROP COLUMN car_name;
ALTER TABLE pnd.mcarton
  ADD COLUMN car_id serial;
ALTER TABLE pnd.mcarton
  ADD COLUMN car_name character varying(200);
ALTER TABLE pnd.mcarton
  ADD CONSTRAINT const_mcarton_prikey PRIMARY KEY (car_id);


ALTER TABLE pnd.mcartonvariable
  DROP COLUMN carv_carcode;
ALTER TABLE pnd.mcartonvariable
  ADD COLUMN carv_carid integer;
ALTER TABLE pnd.mcartonvariable
  ADD CONSTRAINT const_mcartonvariable_prikey PRIMARY KEY (carv_id);
COMMENT ON COLUMN pnd.mcartonvariable.carv_carid IS 'foreign key to mcarton car_id';

ALTER TABLE pnd.mcartonvariable
  DROP COLUMN carv_id;
ALTER TABLE pnd.mcartonvariable RENAME carv_varcode  TO carv_code;

ALTER TABLE pnd.mjscartonvalue
  DROP COLUMN caval_carvid;
ALTER TABLE pnd.mjscartonvalue
  ADD COLUMN carval_carcode character varying(12);
ALTER TABLE pnd.mjscartonvalue
  ADD CONSTRAINT const_mjscartonvalue_prikey PRIMARY KEY (caval_id);


ALTER TABLE pnd.mcarton ADD COLUMN car_fileextension character varying(50);

