ALTER TABLE fcdoc
  DROP COLUMN fd_file_size;
ALTER TABLE fcdoc
  ADD COLUMN fd_file_size numeric(20,4);

ALTER TABLE mcarton
  DROP COLUMN car_fileextension;
