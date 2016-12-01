

CREATE SCHEMA crisismap_data;

ALTER SCHEMA crisismap_data OWNER TO crisismap;

set search_path=crisismap_data;



DROP TABLE IF EXISTS raw_news;
CREATE TABLE raw_news(
    rn_id integer NOT NULL,
    rn_guid character varying(1024) NOT NULL,
    rn_created timestamp without time zone,
    rn_link character varying(1024) NOT NULL,
    rn_title character varying(1024) NOT NULL,
    rn_body text NOT NULL,
);
ALTER TABLE ommodity_group OWNER TO crisismap;


DROP TABLE IF EXISTS news;
CREATE TABLE news(
    n_id integer NOT NULL,
    n_raw_news_id integer,
    n_publication_date timestamp without time zone,
    n_type_id integer NOT NULL,
    n_is_licalized boolean NOT NULL,
    n_toponyms character varying(1024)
);
ALTER TABLE commodity_group OWNER TO crisismap;


DROP TABLE IF EXISTS news_image;
CREATE TABLE news_image(
    ni_id serial,
    ni_news_id integer,
    ni_url varchar(1024),
    ni_image bytea
);
ALTER TABLE commodity_group OWNER TO crisismap;
