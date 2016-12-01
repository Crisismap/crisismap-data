-- Database: crisismap_db

-- DROP DATABASE crisismap_db;

CREATE USER crisismap WITH PASSWORD 'CRISISMAP';

CREATE DATABASE crisismap_db
  WITH OWNER = crisismap
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'en_US.UTF-8'
       LC_CTYPE = 'en_US.UTF-8'
       CONNECTION LIMIT = -1;
GRANT CONNECT, TEMPORARY ON DATABASE crisismap_db TO public;
GRANT ALL ON DATABASE crisismap_db TO postgres;

