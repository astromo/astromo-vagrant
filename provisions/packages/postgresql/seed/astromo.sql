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
-- Name: invoices; Type: TABLE; Schema: public; Owner: astromo; Tablespace: 
--

CREATE TABLE invoices (
    id integer NOT NULL,
    date timestamp with time zone,
    description character varying(255),
    amount double precision,
    attachment character varying(255),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    user_id integer
);


ALTER TABLE invoices OWNER TO astromo;

--
-- Name: TABLE invoices; Type: COMMENT; Schema: public; Owner: astromo
--

COMMENT ON TABLE invoices IS 'This is the table containing all Astromo invoices';


--
-- Name: invoices_id_seq; Type: SEQUENCE; Schema: public; Owner: astromo
--

CREATE SEQUENCE invoices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE invoices_id_seq OWNER TO astromo;

--
-- Name: invoices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: astromo
--

ALTER SEQUENCE invoices_id_seq OWNED BY invoices.id;


--
-- Name: organisations; Type: TABLE; Schema: public; Owner: astromo; Tablespace: 
--

CREATE TABLE organisations (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE organisations OWNER TO astromo;

--
-- Name: TABLE organisations; Type: COMMENT; Schema: public; Owner: astromo
--

COMMENT ON TABLE organisations IS 'This is the table containing all Astromo organisations';


--
-- Name: organisations_id_seq; Type: SEQUENCE; Schema: public; Owner: astromo
--

CREATE SEQUENCE organisations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE organisations_id_seq OWNER TO astromo;

--
-- Name: organisations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: astromo
--

ALTER SEQUENCE organisations_id_seq OWNED BY organisations.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: astromo; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    title character varying(255),
    avatar character varying(255),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    organisation_id integer
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

ALTER TABLE ONLY invoices ALTER COLUMN id SET DEFAULT nextval('invoices_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: astromo
--

ALTER TABLE ONLY organisations ALTER COLUMN id SET DEFAULT nextval('organisations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: astromo
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: invoices; Type: TABLE DATA; Schema: public; Owner: astromo
--

COPY invoices (id, date, description, amount, attachment, created_at, updated_at, user_id) FROM stdin;
1	2015-03-01 00:00:00+00	Invoice for March 2015	40	\N	2015-03-29 00:00:00+00	2015-03-29 00:00:00+00	1
2	2015-02-01 00:00:00+00	Invoice for February 2015	40.5	#	2015-03-29 00:00:00+00	2015-03-29 00:00:00+00	1
\.


--
-- Name: invoices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: astromo
--

SELECT pg_catalog.setval('invoices_id_seq', 2, true);


--
-- Data for Name: organisations; Type: TABLE DATA; Schema: public; Owner: astromo
--

COPY organisations (id, name, created_at, updated_at) FROM stdin;
1	Astromo	2015-03-28 00:00:00+00	2015-03-28 00:00:00+00
\.


--
-- Name: organisations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: astromo
--

SELECT pg_catalog.setval('organisations_id_seq', 1, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: astromo
--

COPY users (id, email, password, first_name, last_name, title, avatar, created_at, updated_at, organisation_id) FROM stdin;
1	gilles@astromo.io	$2a$13$Log65GBcbaP9TwfOFq0.5OPWBmMcBYAHGKSeiKNZGdZZ.N4G93qP2	Gilles	De Mey	Co-Founder	https://pbs.twimg.com/profile_images/443599039746301953/FistuyUK_400x400.jpeg	2015-03-25 23:00:00+00	2015-03-25 23:00:00+00	1
2	michiel@astromo.io	$2a$13$j4g3Oh4SLgB9Rhz9mKVXROD3cJYka6B1.msYtJfPkMYsVn/SD9PXW	Michiel	De Mey	Co-Founder	https://pbs.twimg.com/profile_images/507569511151583232/a9RgzoKQ_400x400.jpeg	2015-03-25 23:00:00+00	2015-03-25 23:00:00+00	1
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: astromo
--

SELECT pg_catalog.setval('users_id_seq', 4, true);


--
-- Name: invoices_pkey; Type: CONSTRAINT; Schema: public; Owner: astromo; Tablespace: 
--

ALTER TABLE ONLY invoices
    ADD CONSTRAINT invoices_pkey PRIMARY KEY (id);


--
-- Name: organisations_pkey; Type: CONSTRAINT; Schema: public; Owner: astromo; Tablespace: 
--

ALTER TABLE ONLY organisations
    ADD CONSTRAINT organisations_pkey PRIMARY KEY (id);


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
-- Name: invoices_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: astromo
--

ALTER TABLE ONLY invoices
    ADD CONSTRAINT invoices_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO astromo;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

