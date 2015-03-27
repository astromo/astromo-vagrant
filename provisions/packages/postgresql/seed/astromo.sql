--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: users; Type: TABLE; Schema: public; Owner: astromo; Tablespace:
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE users OWNER TO astromo;

--
-- Name: TABLE users; Type: COMMENT; Schema: public; Owner: astromo
--

COMMENT ON TABLE users IS 'This is the table containing all Astromo users';


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: astromo
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO astromo;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: astromo
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: astromo
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: astromo
--

COPY users (id, email, password, first_name, last_name, created_at, updated_at) FROM STDIN DELIMITER AS ',';
1, gilles@astromo.io, $2a$13$Log65GBcbaP9TwfOFq0.5OPWBmMcBYAHGKSeiKNZGdZZ.N4G93qP2, Gilles, De Mey, 2015-03-26 00:00:00+01, 2015-03-26 00:00:00+01
2, michiel@astromo.io, $2a$13$j4g3Oh4SLgB9Rhz9mKVXROD3cJYka6B1.msYtJfPkMYsVn/SD9PXW, Michiel, De Mey, 2015-03-26 00:00:00+01, 2015-03-26 00:00:00+01
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: astromo
--

SELECT pg_catalog.setval('users_id_seq', 4, true);


--
-- Name: users_email_key; Type: CONSTRAINT; Schema: public; Owner: astromo; Tablespace:
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: astromo; Tablespace:
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: public; Type: ACL; Schema: -; Owner: astromo
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM astromo;
GRANT ALL ON SCHEMA public TO astromo;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--
