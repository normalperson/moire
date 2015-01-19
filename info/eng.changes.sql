ALTER TABLE fclookup
   ALTER COLUMN lu_title TYPE character varying(200);

CREATE TABLE mcustomertype
(
   tp_id serial, 
   tp_orgid integer, 
   tp_customertype character varying, 
   CONSTRAINT const_mcustomertype_prikey PRIMARY KEY (tp_id)
) 
WITH (
  OIDS = FALSE
)
;
ALTER TABLE mcustomertype
  OWNER TO pnd;


insert into mcustomertype(tp_orgid)
select org_id from fcorg;