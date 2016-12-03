DROP SCHEMA IF EXISTS input_data;
CREATE SCHEMA input_data;
ALTER SCHEMA input_data OWNER TO crisismap;
SET search_path=input_data;


DROP TABLE IF EXISTS raw_news;
CREATE TABLE raw_news(
    rn_id serial,
    rn_created timestamp without time zone default current_timestamp,
    rn_last_modified timestamp without time zone,
    rn_guid character varying(1024) NOT NULL,
    rn_link character varying(1024) NOT NULL,
    rn_title character varying(1024) NOT NULL,
    rn_description text NOT NULL,
    CONSTRAINT pk_raw_news PRIMARY KEY (rn_id)
);
ALTER TABLE raw_news OWNER TO crisismap;

DROP TABLE IF EXISTS raw_news_media;
CREATE TABLE raw_news_media(
    rm_id serial,
    rm_created timestamp without time zone default current_timestamp,
    rm_last_modified timestamp without time zone,    
    rm_raw_news_id integer,
    rm_url varchar(1024),
    CONSTRAINT pk_raw_news_media PRIMARY KEY (rm_id),
    FOREIGN KEY (so_id) REFERENCES so_headers (ID)
);
ALTER TABLE raw_news_media OWNER TO crisismap;




DROP SCHEMA IF EXISTS crisismap_data;
CREATE SCHEMA crisismap_data;
ALTER SCHEMA crisismap_data OWNER TO crisismap;
SET search_path=crisismap_data;


DROP TABLE IF EXISTS news_type;
CREATE TABLE news_type(
    nt_id serial,
    nt_created timestamp without time zone default current_timestamp,
    nt_last_modified timestamp without time zone,
    nt_type character varying(256),
    CONSTRAINT pk_news_type PRIMARY KEY (nt_id)
);
ALTER TABLE news_type OWNER TO crisismap;

DROP TABLE IF EXISTS news;
CREATE TABLE news(
    n_id integer NOT NULL,
    n_created timestamp without time zone default current_timestamp,
    n_last_modified timestamp without time zone,
    n_raw_news_id integer,
    n_publication_date timestamp without time zone,
    n_type_id integer NOT NULL,
    n_is_licalized boolean NOT NULL,
    CONSTRAINT pk_news PRIMARY KEY (n_id)
);
ALTER TABLE news OWNER TO crisismap;

DROP TABLE IF EXISTS toponym;
CREATE TABLE toponym(
    t_id serial,
    t_created timestamp without time zone default current_timestamp,
    t_last_modified timestamp without time zone,    
    t_name varchar(1024),
    t_location_id integer,
    CONSTRAINT pk_toponym PRIMARY KEY (t_id)
);
ALTER TABLE news_image OWNER TO toponym;

DROP TABLE IF EXISTS toponym_news;
CREATE TABLE toponym_news(
    tn_id serial,
    tn_created timestamp without time zone default current_timestamp,
    tn_last_modified timestamp without time zone,    
    tn_news_id integer,
    tn_toponym_id integer,
    CONSTRAINT pk_toponym_news PRIMARY KEY (tn_id)
);
ALTER TABLE toponym_news OWNER TO crisismap;

DROP TABLE IF EXISTS incident_type;
CREATE TABLE incident_type(
    it_id serial,
    it_created timestamp without time zone default current_timestamp,
    it_last_modified timestamp without time zone,
    it_type character varying(256)
);
ALTER TABLE incident_type OWNER TO crisismap;

DROP TABLE IF EXISTS incident;
CREATE TABLE incident(
    i_id serial,
    i_created timestamp without time zone default current_timestamp,
    i_last_modified timestamp without time zone,
    i_type_id integer,
    i_name character varying(1024),
    i_location_id integer,

)