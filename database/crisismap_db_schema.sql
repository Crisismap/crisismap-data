
--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.1
-- Dumped by pg_dump version 9.6.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: crisismap_data; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA crisismap_data;


ALTER SCHEMA crisismap_data OWNER TO postgres;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = crisismap_data, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: news_rss; Type: TABLE; Schema: crisismap_data; Owner: postgres
--
CREATE TABLE raw_news(
    rn_id integer NOT NULL,
    rn_guid character varying(1024) NOT NULL,
    rn_created timestamp without time zone,
    rn_link character varying(1024) NOT NULL,
    rn_title character varying(1024) NOT NULL,
    rn_body text NOT NULL,
);

CREATE TABLE news(
    n_id integer NOT NULL,
    n_raw_news_id integer,
    n_publication_date timestamp without time zone,
    n_type_id integer NOT NULL,
    n_is_licalized boolean NOT NULL,
    n_toponyms character varying(1024)
);

CREATE TABLE news_image(
    ni_id serial,
    ni_news_id integer,
    ni_url varchar(1024),
    ni_image bytea
);
    

--
-- Name: news_rss_nr_id_seq; Type: SEQUENCE; Schema: crisismap_data; Owner: postgres
--

CREATE SEQUENCE news_rss_nr_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE news_rss_nr_id_seq OWNER TO postgres;

--
-- Name: news_rss_nr_id_seq; Type: SEQUENCE OWNED BY; Schema: crisismap_data; Owner: postgres
--

ALTER SEQUENCE news_rss_nr_id_seq OWNED BY news_rss.nr_id;


--
-- Name: news_type; Type: TABLE; Schema: crisismap_data; Owner: postgres
--

CREATE TABLE news_type (
    nt_id integer NOT NULL,
    nt_type character varying(256)
);


ALTER TABLE news_type OWNER TO postgres;

--
-- Name: news_type_nt_id_seq; Type: SEQUENCE; Schema: crisismap_data; Owner: postgres
--

CREATE SEQUENCE news_type_nt_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE news_type_nt_id_seq OWNER TO postgres;

--
-- Name: news_type_nt_id_seq; Type: SEQUENCE OWNED BY; Schema: crisismap_data; Owner: postgres
--

ALTER SEQUENCE news_type_nt_id_seq OWNED BY news_type.nt_id;


--
-- Name: news_rss nr_id; Type: DEFAULT; Schema: crisismap_data; Owner: postgres
--

ALTER TABLE ONLY news_rss ALTER COLUMN nr_id SET DEFAULT nextval('news_rss_nr_id_seq'::regclass);


--
-- Name: news_type nt_id; Type: DEFAULT; Schema: crisismap_data; Owner: postgres
--

ALTER TABLE ONLY news_type ALTER COLUMN nt_id SET DEFAULT nextval('news_type_nt_id_seq'::regclass);


--
-- PostgreSQL database dump complete
--

