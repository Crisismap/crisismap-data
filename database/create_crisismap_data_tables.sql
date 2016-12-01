

CREATE SCHEMA crisismap_data;

ALTER SCHEMA crisismap_data OWNER TO crisismap;

set search_path=crisismap_data;



DROP TABLE IF EXISTS raw_news;
CREATE TABLE raw_news(
    rn_id integer NOT NULL,
    rn_created timestamp without time zone default current_timestamp,
    rn_last_modified timestamp without time zone,
    rn_guid character varying(1024) NOT NULL,
    rn_link character varying(1024) NOT NULL,
    rn_title character varying(1024) NOT NULL,
    rn_description text NOT NULL
);
ALTER TABLE raw_news OWNER TO crisismap;


DROP TABLE IF EXISTS news;
CREATE TABLE news(
    n_id integer NOT NULL,
    n_created timestamp without time zone default current_timestamp,
    n_last_modified timestamp without time zone,
    n_raw_news_id integer,
    n_publication_date timestamp without time zone,
    n_type_id integer NOT NULL,
    n_is_licalized boolean NOT NULL,
    n_toponyms character varying(1024)
);
ALTER TABLE news OWNER TO crisismap;


DROP TABLE IF EXISTS news_image;
CREATE TABLE news_image(
    ni_id serial,
    ni_created timestamp without time zone default current_timestamp,
    ni_last_modified timestamp without time zone,    
    ni_news_id integer,
    ni_url varchar(1024),
    ni_image bytea
);
ALTER TABLE news_image OWNER TO crisismap;


DROP TABLE IF EXISTS toponym;
CREATE TABLE toponym(
    t_id serial,
    t_created timestamp without time zone default current_timestamp,
    t_last_modified timestamp without time zone,    
    t_id varchar(256)
);
ALTER TABLE news_image OWNER TO toponym;


DROP TABLE IF EXISTS news_toponym;
CREATE TABLE news_toponym(
    nt_id serial,
    nt_created timestamp without time zone default current_timestamp,
    nt_last_modified timestamp without time zone,    
    nt_news_id integer,
    nt_toponym_id integer
);
ALTER TABLE news_toponym OWNER TO crisismap;
