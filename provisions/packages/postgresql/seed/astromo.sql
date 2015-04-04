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
-- Name: blueprints; Type: TABLE; Schema: public; Owner: astromo; Tablespace: 
--

CREATE TABLE blueprints (
    id integer NOT NULL,
    name character varying(255),
    description text,
    markdown text,
    ast json,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    organisation_id integer,
    slug character varying(255)
);


ALTER TABLE blueprints OWNER TO astromo;

--
-- Name: TABLE blueprints; Type: COMMENT; Schema: public; Owner: astromo
--

COMMENT ON TABLE blueprints IS 'This is the table containing all Astromo blueprints';


--
-- Name: blueprints_id_seq; Type: SEQUENCE; Schema: public; Owner: astromo
--

CREATE SEQUENCE blueprints_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE blueprints_id_seq OWNER TO astromo;

--
-- Name: blueprints_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: astromo
--

ALTER SEQUENCE blueprints_id_seq OWNED BY blueprints.id;


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

ALTER TABLE ONLY blueprints ALTER COLUMN id SET DEFAULT nextval('blueprints_id_seq'::regclass);


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
-- Data for Name: blueprints; Type: TABLE DATA; Schema: public; Owner: astromo
--

COPY blueprints (id, name, description, markdown, ast, created_at, updated_at, organisation_id, slug) FROM stdin;
2	De Lijn	De Lijn API blueprint	FORMAT: 1A\nHOST: https://www.delijn.be/rise-api-web/\n\n# 🚍 De Lijn — Rise API\nDe Lijn API\n\nDocumentation spreadsheet:\nhttps://docs.google.com/spreadsheets/d/1r5J9nk4S9IbHX718qbJ13sYHB_6kUDTU7IwsM-0Fmgs/edit#gid=0\n\n# Group Zoeken\nDe Lijn zoek opties\n\n## Quick Search [/search/quicksearch/{query}]\n\n### GET\n+ Parameters\n    + query (required, string, `brussel`) ... Zoek query\n    \n+ Response 200 (application/json)\n\n## Gemeenten [/search/quicksearch/gemeenten/{query}]\n\n### GET\n+ Parameters\n    + query (required, string, `brussel`) ... Zoek query\n    \n+ Response 200 (application/json)\n\n## Haltes [/locations/locatiezoeker/{num_results}/{query}]\n\n### GET\n+ Parameters\n    + num_results (optional, number, `5`) ... Maximum aantal resultaten\n    + query (required, string, `gent-sint-pieters`) ... Zoek query\n    \n+ Response 200 (application/json)\n\n## Nieuws [/search/nieuwsoverzicht/{category_id}/{language_id}/{page}]\n\n### GET\n+ Parameters\n    + category_id (required, string, `tcm:3-428-1024`)\n    + language_id (required, number, `3`) ... Taal ID\n    + page (required, number, `1`) ... Paginatie nummer\n\n+ Response 200 (application/json)\n\n## Gemeente Nieuws [/search/gemeenteNieuws/{gemeente_id}/{page}/{num_results}]\n\n### GET\n+ Parameters\n    + gemeente_id (required, string, `tcm:3-478-1024`)\n    + page (required, string, `1`) ... Paginatie nummer\n    + num_results (optional, number, `3`) ... Maximum aantal resultaten\n\n+ Response 200 (application/json)\n\n# Group Lijnen\nOphalen van lijnen\n\n## Per gemeente [/lijnen/gemeente/{gemeente_id}]\n\n### GET\n+ Parameters\n    + gemeente_id (required, number, `1990`)\n    \n+ Response 200 (application/json)\n\n# Group Haltes\nOphalen van haltes data\n\n## Informatie [/haltes/titel/{halte_id}]\n\n### GET\n+ Parameters\n    + halte_id (required, number, `200144`) ... Halte ID\n    \n+ Response 200 (application/json)\n\n## Vertrekken [/haltes/vertrekken/{halte_id}/{num_results}]\n\n### GET\n+ Parameters\n    + num_results (optional, number, `5`) ... Maximum aantal resultaten\n    + halte_id (required, number, `200144`) ... Halte ID\n    \n+ Response 200 (application/json)\n\n## In de buurt [/haltes/indebuurt/{x_coordinaat}/{y_coordinaat}/{radius}]\n\n### GET\n+ Parameters\n    + x_coordinaat (required, number, `103787`) ... X coordinaat\n    + y_coordinaat (required, number, `194286`) ... Y coordinaat\n    + radius (optional, number, `300`) ... Zoek radius, eenheid onbekend\n    \n+ Response 200 (application/json)\n\n# Group Locaties\n\n## Verkooppunten [/locations/verkooppunten/{gemeente}]\n\n### GET\n+ Parameters\n    + gemeente (required, string, `Temse`) ... Gemeente naam\n\n+ Response 200 (application/json)\n	{"_version":"3.0","metadata":[{"name":"FORMAT","value":"1A"},{"name":"HOST","value":"https://www.delijn.be/rise-api-web/"}],"name":"De Lijn — Rise API","description":"De Lijn API\\n\\nDocumentation spreadsheet:\\nhttps://docs.google.com/spreadsheets/d/1r5J9nk4S9IbHX718qbJ13sYHB_6kUDTU7IwsM-0Fmgs/edit#gid=0\\n\\n","element":"category","resourceGroups":[{"name":"Zoeken","description":"De Lijn zoek opties\\n\\n","resources":[{"element":"resource","name":"Quick Search","description":"","uriTemplate":"/search/quicksearch/{query}","model":{},"parameters":[],"actions":[{"name":"","description":"","method":"GET","parameters":[{"name":"query","description":"Zoek query","type":"string","required":true,"default":"","example":"brussel","values":[]}],"attributes":{"relation":"","uriTemplate":""},"content":[],"examples":[{"name":"","description":"","requests":[],"responses":[{"name":"200","description":"","headers":[{"name":"Content-Type","value":"application/json"}],"body":"","schema":"","content":[]}]}]}],"content":[]},{"element":"resource","name":"Gemeenten","description":"","uriTemplate":"/search/quicksearch/gemeenten/{query}","model":{},"parameters":[],"actions":[{"name":"","description":"","method":"GET","parameters":[{"name":"query","description":"Zoek query","type":"string","required":true,"default":"","example":"brussel","values":[]}],"attributes":{"relation":"","uriTemplate":""},"content":[],"examples":[{"name":"","description":"","requests":[],"responses":[{"name":"200","description":"","headers":[{"name":"Content-Type","value":"application/json"}],"body":"","schema":"","content":[]}]}]}],"content":[]},{"element":"resource","name":"Haltes","description":"","uriTemplate":"/locations/locatiezoeker/{num_results}/{query}","model":{},"parameters":[],"actions":[{"name":"","description":"","method":"GET","parameters":[{"name":"num_results","description":"Maximum aantal resultaten","type":"number","required":false,"default":"","example":"5","values":[]},{"name":"query","description":"Zoek query","type":"string","required":true,"default":"","example":"gent-sint-pieters","values":[]}],"attributes":{"relation":"","uriTemplate":""},"content":[],"examples":[{"name":"","description":"","requests":[],"responses":[{"name":"200","description":"","headers":[{"name":"Content-Type","value":"application/json"}],"body":"","schema":"","content":[]}]}]}],"content":[]},{"element":"resource","name":"Nieuws","description":"","uriTemplate":"/search/nieuwsoverzicht/{category_id}/{language_id}/{page}","model":{},"parameters":[],"actions":[{"name":"","description":"","method":"GET","parameters":[{"name":"category_id","description":"","type":"string","required":true,"default":"","example":"tcm:3-428-1024","values":[]},{"name":"language_id","description":"Taal ID","type":"number","required":true,"default":"","example":"3","values":[]},{"name":"page","description":"Paginatie nummer","type":"number","required":true,"default":"","example":"1","values":[]}],"attributes":{"relation":"","uriTemplate":""},"content":[],"examples":[{"name":"","description":"","requests":[],"responses":[{"name":"200","description":"","headers":[{"name":"Content-Type","value":"application/json"}],"body":"","schema":"","content":[]}]}]}],"content":[]},{"element":"resource","name":"Gemeente Nieuws","description":"","uriTemplate":"/search/gemeenteNieuws/{gemeente_id}/{page}/{num_results}","model":{},"parameters":[],"actions":[{"name":"","description":"","method":"GET","parameters":[{"name":"gemeente_id","description":"","type":"string","required":true,"default":"","example":"tcm:3-478-1024","values":[]},{"name":"page","description":"Paginatie nummer","type":"string","required":true,"default":"","example":"1","values":[]},{"name":"num_results","description":"Maximum aantal resultaten","type":"number","required":false,"default":"","example":"3","values":[]}],"attributes":{"relation":"","uriTemplate":""},"content":[],"examples":[{"name":"","description":"","requests":[],"responses":[{"name":"200","description":"","headers":[{"name":"Content-Type","value":"application/json"}],"body":"","schema":"","content":[]}]}]}],"content":[]}]},{"name":"Lijnen","description":"Ophalen van lijnen\\n\\n","resources":[{"element":"resource","name":"Per gemeente","description":"","uriTemplate":"/lijnen/gemeente/{gemeente_id}","model":{},"parameters":[],"actions":[{"name":"","description":"","method":"GET","parameters":[{"name":"gemeente_id","description":"","type":"number","required":true,"default":"","example":"1990","values":[]}],"attributes":{"relation":"","uriTemplate":""},"content":[],"examples":[{"name":"","description":"","requests":[],"responses":[{"name":"200","description":"","headers":[{"name":"Content-Type","value":"application/json"}],"body":"","schema":"","content":[]}]}]}],"content":[]}]},{"name":"Haltes","description":"Ophalen van haltes data\\n\\n","resources":[{"element":"resource","name":"Informatie","description":"","uriTemplate":"/haltes/titel/{halte_id}","model":{},"parameters":[],"actions":[{"name":"","description":"","method":"GET","parameters":[{"name":"halte_id","description":"Halte ID","type":"number","required":true,"default":"","example":"200144","values":[]}],"attributes":{"relation":"","uriTemplate":""},"content":[],"examples":[{"name":"","description":"","requests":[],"responses":[{"name":"200","description":"","headers":[{"name":"Content-Type","value":"application/json"}],"body":"","schema":"","content":[]}]}]}],"content":[]},{"element":"resource","name":"Vertrekken","description":"","uriTemplate":"/haltes/vertrekken/{halte_id}/{num_results}","model":{},"parameters":[],"actions":[{"name":"","description":"","method":"GET","parameters":[{"name":"num_results","description":"Maximum aantal resultaten","type":"number","required":false,"default":"","example":"5","values":[]},{"name":"halte_id","description":"Halte ID","type":"number","required":true,"default":"","example":"200144","values":[]}],"attributes":{"relation":"","uriTemplate":""},"content":[],"examples":[{"name":"","description":"","requests":[],"responses":[{"name":"200","description":"","headers":[{"name":"Content-Type","value":"application/json"}],"body":"","schema":"","content":[]}]}]}],"content":[]},{"element":"resource","name":"In de buurt","description":"","uriTemplate":"/haltes/indebuurt/{x_coordinaat}/{y_coordinaat}/{radius}","model":{},"parameters":[],"actions":[{"name":"","description":"","method":"GET","parameters":[{"name":"x_coordinaat","description":"X coordinaat","type":"number","required":true,"default":"","example":"103787","values":[]},{"name":"y_coordinaat","description":"Y coordinaat","type":"number","required":true,"default":"","example":"194286","values":[]},{"name":"radius","description":"Zoek radius, eenheid onbekend","type":"number","required":false,"default":"","example":"300","values":[]}],"attributes":{"relation":"","uriTemplate":""},"content":[],"examples":[{"name":"","description":"","requests":[],"responses":[{"name":"200","description":"","headers":[{"name":"Content-Type","value":"application/json"}],"body":"","schema":"","content":[]}]}]}],"content":[]}]},{"name":"Locaties","description":"","resources":[{"element":"resource","name":"Verkooppunten","description":"","uriTemplate":"/locations/verkooppunten/{gemeente}","model":{},"parameters":[],"actions":[{"name":"","description":"","method":"GET","parameters":[{"name":"gemeente","description":"Gemeente naam","type":"string","required":true,"default":"","example":"Temse","values":[]}],"attributes":{"relation":"","uriTemplate":""},"content":[],"examples":[{"name":"","description":"","requests":[],"responses":[{"name":"200","description":"","headers":[{"name":"Content-Type","value":"application/json"}],"body":"","schema":"","content":[]}]}]}],"content":[]}]}],"content":[{"element":"category","attributes":{"name":"Zoeken"},"content":[{"element":"copy","content":"De Lijn zoek opties\\n\\n"},{"element":"resource","name":"Quick Search","description":"","uriTemplate":"/search/quicksearch/{query}","model":{},"parameters":[],"actions":[{"name":"","description":"","method":"GET","parameters":[{"name":"query","description":"Zoek query","type":"string","required":true,"default":"","example":"brussel","values":[]}],"attributes":{"relation":"","uriTemplate":""},"content":[],"examples":[{"name":"","description":"","requests":[],"responses":[{"name":"200","description":"","headers":[{"name":"Content-Type","value":"application/json"}],"body":"","schema":"","content":[]}]}]}],"content":[]},{"element":"resource","name":"Gemeenten","description":"","uriTemplate":"/search/quicksearch/gemeenten/{query}","model":{},"parameters":[],"actions":[{"name":"","description":"","method":"GET","parameters":[{"name":"query","description":"Zoek query","type":"string","required":true,"default":"","example":"brussel","values":[]}],"attributes":{"relation":"","uriTemplate":""},"content":[],"examples":[{"name":"","description":"","requests":[],"responses":[{"name":"200","description":"","headers":[{"name":"Content-Type","value":"application/json"}],"body":"","schema":"","content":[]}]}]}],"content":[]},{"element":"resource","name":"Haltes","description":"","uriTemplate":"/locations/locatiezoeker/{num_results}/{query}","model":{},"parameters":[],"actions":[{"name":"","description":"","method":"GET","parameters":[{"name":"num_results","description":"Maximum aantal resultaten","type":"number","required":false,"default":"","example":"5","values":[]},{"name":"query","description":"Zoek query","type":"string","required":true,"default":"","example":"gent-sint-pieters","values":[]}],"attributes":{"relation":"","uriTemplate":""},"content":[],"examples":[{"name":"","description":"","requests":[],"responses":[{"name":"200","description":"","headers":[{"name":"Content-Type","value":"application/json"}],"body":"","schema":"","content":[]}]}]}],"content":[]},{"element":"resource","name":"Nieuws","description":"","uriTemplate":"/search/nieuwsoverzicht/{category_id}/{language_id}/{page}","model":{},"parameters":[],"actions":[{"name":"","description":"","method":"GET","parameters":[{"name":"category_id","description":"","type":"string","required":true,"default":"","example":"tcm:3-428-1024","values":[]},{"name":"language_id","description":"Taal ID","type":"number","required":true,"default":"","example":"3","values":[]},{"name":"page","description":"Paginatie nummer","type":"number","required":true,"default":"","example":"1","values":[]}],"attributes":{"relation":"","uriTemplate":""},"content":[],"examples":[{"name":"","description":"","requests":[],"responses":[{"name":"200","description":"","headers":[{"name":"Content-Type","value":"application/json"}],"body":"","schema":"","content":[]}]}]}],"content":[]},{"element":"resource","name":"Gemeente Nieuws","description":"","uriTemplate":"/search/gemeenteNieuws/{gemeente_id}/{page}/{num_results}","model":{},"parameters":[],"actions":[{"name":"","description":"","method":"GET","parameters":[{"name":"gemeente_id","description":"","type":"string","required":true,"default":"","example":"tcm:3-478-1024","values":[]},{"name":"page","description":"Paginatie nummer","type":"string","required":true,"default":"","example":"1","values":[]},{"name":"num_results","description":"Maximum aantal resultaten","type":"number","required":false,"default":"","example":"3","values":[]}],"attributes":{"relation":"","uriTemplate":""},"content":[],"examples":[{"name":"","description":"","requests":[],"responses":[{"name":"200","description":"","headers":[{"name":"Content-Type","value":"application/json"}],"body":"","schema":"","content":[]}]}]}],"content":[]}]},{"element":"category","attributes":{"name":"Lijnen"},"content":[{"element":"copy","content":"Ophalen van lijnen\\n\\n"},{"element":"resource","name":"Per gemeente","description":"","uriTemplate":"/lijnen/gemeente/{gemeente_id}","model":{},"parameters":[],"actions":[{"name":"","description":"","method":"GET","parameters":[{"name":"gemeente_id","description":"","type":"number","required":true,"default":"","example":"1990","values":[]}],"attributes":{"relation":"","uriTemplate":""},"content":[],"examples":[{"name":"","description":"","requests":[],"responses":[{"name":"200","description":"","headers":[{"name":"Content-Type","value":"application/json"}],"body":"","schema":"","content":[]}]}]}],"content":[]}]},{"element":"category","attributes":{"name":"Haltes"},"content":[{"element":"copy","content":"Ophalen van haltes data\\n\\n"},{"element":"resource","name":"Informatie","description":"","uriTemplate":"/haltes/titel/{halte_id}","model":{},"parameters":[],"actions":[{"name":"","description":"","method":"GET","parameters":[{"name":"halte_id","description":"Halte ID","type":"number","required":true,"default":"","example":"200144","values":[]}],"attributes":{"relation":"","uriTemplate":""},"content":[],"examples":[{"name":"","description":"","requests":[],"responses":[{"name":"200","description":"","headers":[{"name":"Content-Type","value":"application/json"}],"body":"","schema":"","content":[]}]}]}],"content":[]},{"element":"resource","name":"Vertrekken","description":"","uriTemplate":"/haltes/vertrekken/{halte_id}/{num_results}","model":{},"parameters":[],"actions":[{"name":"","description":"","method":"GET","parameters":[{"name":"num_results","description":"Maximum aantal resultaten","type":"number","required":false,"default":"","example":"5","values":[]},{"name":"halte_id","description":"Halte ID","type":"number","required":true,"default":"","example":"200144","values":[]}],"attributes":{"relation":"","uriTemplate":""},"content":[],"examples":[{"name":"","description":"","requests":[],"responses":[{"name":"200","description":"","headers":[{"name":"Content-Type","value":"application/json"}],"body":"","schema":"","content":[]}]}]}],"content":[]},{"element":"resource","name":"In de buurt","description":"","uriTemplate":"/haltes/indebuurt/{x_coordinaat}/{y_coordinaat}/{radius}","model":{},"parameters":[],"actions":[{"name":"","description":"","method":"GET","parameters":[{"name":"x_coordinaat","description":"X coordinaat","type":"number","required":true,"default":"","example":"103787","values":[]},{"name":"y_coordinaat","description":"Y coordinaat","type":"number","required":true,"default":"","example":"194286","values":[]},{"name":"radius","description":"Zoek radius, eenheid onbekend","type":"number","required":false,"default":"","example":"300","values":[]}],"attributes":{"relation":"","uriTemplate":""},"content":[],"examples":[{"name":"","description":"","requests":[],"responses":[{"name":"200","description":"","headers":[{"name":"Content-Type","value":"application/json"}],"body":"","schema":"","content":[]}]}]}],"content":[]}]},{"element":"category","attributes":{"name":"Locaties"},"content":[{"element":"resource","name":"Verkooppunten","description":"","uriTemplate":"/locations/verkooppunten/{gemeente}","model":{},"parameters":[],"actions":[{"name":"","description":"","method":"GET","parameters":[{"name":"gemeente","description":"Gemeente naam","type":"string","required":true,"default":"","example":"Temse","values":[]}],"attributes":{"relation":"","uriTemplate":""},"content":[],"examples":[{"name":"","description":"","requests":[],"responses":[{"name":"200","description":"","headers":[{"name":"Content-Type","value":"application/json"}],"body":"","schema":"","content":[]}]}]}],"content":[]}]}]}	2015-04-04 00:00:00+00	2015-04-04 00:00:00+00	1	de-lijn-rise-api
4	My Notes	\N	FORMAT: 1A\nHOST: https://api.mywebsite.com\n\n# API Title\n[Markdown](http://daringfireball.net/projects/markdown/syntax) **formatted** description.\n\n## Subtitle\nAlso Markdown *formatted*. This also includes automatic "smartypants" formatting -- hooray!\n\n> "A quote from another time and place"\n\nAnother paragraph. Code sample:\n\n```http\nAuthorization: bearer 5262d64b892e8d4341000001\n```\n\nAnd some code with no highlighting:\n\n```no-highlight\nFoo bar baz\n```\n\n<!-- include(example-include.md) -->\n\n# Group Notes\nGroup description (also with *Markdown*)\n\n## Note List [/notes]\nNote list description\n\n+ Even\n+ More\n+ Markdown\n\n+ Model\n\n    + Headers\n\n            Content-Type: application/json\n            X-Request-ID: f72fc914\n            X-Response-Time: 4ms\n\n    + Body\n\n            [\n                {\n                    "id": 1,\n                    "title": "Grocery list",\n                    "body": "Buy milk"\n                },\n                {\n                    "id": 2,\n                    "title": "TODO",\n                    "body": "Fix garage door"\n                }\n            ]\n\n### Get Notes [GET]\nGet a list of notes.\n\n+ Response 200\n\n    [Note List][]\n\n### Create New Note [POST]\nCreate a new note\n\n+ Request\n\n    + Headers\n\n            Content-Type: application/json\n\n    + Body\n\n            {\n                "title": "My new note",\n                "body": "..."\n            }\n\n+ Response 201\n\n+ Response 400\n\n    + Headers\n\n            Content-Type: application/json\n\n    + Body\n\n            {\n                "error": "Invalid title"\n            }\n\n## Note [/notes/{id}]\nNote description\n\n+ Parameters\n\n    + id (required, string, `68a5sdf67`) ... The note ID\n\n+ Model\n\n    + Headers\n\n            Content-Type: application/json\n            X-Request-ID: f72fc914\n            X-Response-Time: 4ms\n\n    + Body\n\n            {\n                "id": 1,\n                "title": "Grocery list",\n                "body": "Buy milk"\n            }\n\n### Get Note [GET]\nGet a single note.\n\n+ Response 200\n\n    [Note][]\n\n+ Response 404\n\n    + Headers\n\n            Content-Type: application/json\n            X-Request-ID: f72fc914\n            X-Response-Time: 4ms\n\n    + Body\n\n            {\n                "error": "Note not found"\n            }\n\n### Update a Note [PUT]\nUpdate a single note\n\n+ Request\n\n    + Headers\n\n            Content-Type: application/json\n\n    + Body\n\n            {\n                "title": "Grocery List (Safeway)"\n            }\n\n+ Response 200\n\n    [Note][]\n\n+ Response 404\n\n    + Headers\n\n            Content-Type: application/json\n            X-Request-ID: f72fc914\n            X-Response-Time: 4ms\n\n    + Body\n\n            {\n                "error": "Note not found"\n            }\n\n### Delete a Note [DELETE]\nDelete a single note\n\n+ Response 204\n\n+ Response 404\n\n    + Headers\n\n            Content-Type: application/json\n            X-Request-ID: f72fc914\n            X-Response-Time: 4ms\n\n    + Body\n\n            {\n                "error": "Note not found"\n            }\n\n# Group Users\nGroup description\n\n## User List [/users{?name,joinedBefore,joinedAfter,sort,limit}]\nA list of users\n\n+ Parameters\n\n    + name (optional, string, `alice`) ... Search for a user by name\n    + joinedBefore (optional, string, `2011-01-01`) ... Search by join date\n    + joinedAfter (optional, string, `2011-01-01`) ... Search by join date\n    + sort = `name` (optional, string, `joined`) ... Which field to sort by\n\n        + Values\n            + `name`\n            + `joined`\n            + `-joined`\n            + `age`\n            + `-age`\n            + `location`\n            + `-location`\n            + `plan`\n            + `-plan`\n\n    + limit = `10` (optional, integer, `25`) ... The maximum number of users to return, up to `50`\n\n+ Model\n\n    + Headers\n\n            Content-Type: application/json\n\n    + Body\n\n            [\n                {\n                    "name": "alice",\n                    "image": "http://foo.com/alice.jpg",\n                    "joined": "2013-11-01"\n                },\n                {\n                    "name": "bob",\n                    "image": "http://foo.com/bob.jpg",\n                    "joined": "2013-11-02"\n                }\n            ]\n\n    + Schema\n\n            <!-- include(example-schema.json) -->\n\n### Get users [GET]\nGet a list of users. Example:\n\n```no-highlight\nhttps://api.mywebsite.com/users?sort=joined&limit=5\n```\n\n+ Response 200\n\n    [User List][]\n\n# Group Tags and Tagging Long Title\nGet or set tags on notes\n\n## GET /tags\nGet a list of bars\n\n+ Response 200\n\n## Get one tag [/tags/{id}]\nGet a single tag\n\n### GET\n\n+ Response 200	{"_version":"3.0","metadata":[{"name":"FORMAT","value":"1A"},{"name":"HOST","value":"https://api.mywebsite.com"}],"name":"API Title","description":"[Markdown](http://daringfireball.net/projects/markdown/syntax) **formatted** description.\\n\\n## Subtitle\\n\\nAlso Markdown *formatted*. This also includes automatic \\"smartypants\\" formatting -- hooray!\\n\\n> \\"A quote from another time and place\\"\\n\\nAnother paragraph. Code sample:\\n\\n```http\\nAuthorization: bearer 5262d64b892e8d4341000001\\n```\\n\\nAnd some code with no highlighting:\\n\\n```no-highlight\\nFoo bar baz\\n```\\n\\n<!-- include(example-include.md) -->\\n\\n","element":"category","resourceGroups":[{"name":"Notes","description":"Group description (also with *Markdown*)\\n\\n","resources":[{"element":"resource","name":"Note List","description":"Note list description\\n\\n+ Even\\n\\n+ More\\n\\n+ Markdown\\n\\n","uriTemplate":"/notes","model":{"name":"Note List","description":"","headers":[{"name":"Content-Type","value":"application/json"},{"name":"X-Request-ID","value":"f72fc914"},{"name":"X-Response-Time","value":"4ms"}],"body":"[\\n    {\\n        \\"id\\": 1,\\n        \\"title\\": \\"Grocery list\\",\\n        \\"body\\": \\"Buy milk\\"\\n    },\\n    {\\n        \\"id\\": 2,\\n        \\"title\\": \\"TODO\\",\\n        \\"body\\": \\"Fix garage door\\"\\n    }\\n]\\n","schema":"","content":[{"element":"asset","attributes":{"role":"bodyExample"},"content":"[\\n    {\\n        \\"id\\": 1,\\n        \\"title\\": \\"Grocery list\\",\\n        \\"body\\": \\"Buy milk\\"\\n    },\\n    {\\n        \\"id\\": 2,\\n        \\"title\\": \\"TODO\\",\\n        \\"body\\": \\"Fix garage door\\"\\n    }\\n]\\n"}]},"parameters":[],"actions":[{"name":"Get Notes","description":"Get a list of notes.\\n\\n","method":"GET","parameters":[],"attributes":{"relation":"","uriTemplate":""},"content":[],"examples":[{"name":"","description":"","requests":[],"responses":[{"reference":{"id":"Note List"},"name":"200","description":"","headers":[{"name":"Content-Type","value":"application/json"},{"name":"X-Request-ID","value":"f72fc914"},{"name":"X-Response-Time","value":"4ms"}],"body":"[\\n    {\\n        \\"id\\": 1,\\n        \\"title\\": \\"Grocery list\\",\\n        \\"body\\": \\"Buy milk\\"\\n    },\\n    {\\n        \\"id\\": 2,\\n        \\"title\\": \\"TODO\\",\\n        \\"body\\": \\"Fix garage door\\"\\n    }\\n]\\n","schema":"","content":[{"element":"asset","attributes":{"role":"bodyExample"},"content":"[\\n    {\\n        \\"id\\": 1,\\n        \\"title\\": \\"Grocery list\\",\\n        \\"body\\": \\"Buy milk\\"\\n    },\\n    {\\n        \\"id\\": 2,\\n        \\"title\\": \\"TODO\\",\\n        \\"body\\": \\"Fix garage door\\"\\n    }\\n]\\n"}]}]}]},{"name":"Create New Note","description":"Create a new note\\n\\n","method":"POST","parameters":[],"attributes":{"relation":"","uriTemplate":""},"content":[],"examples":[{"name":"","description":"","requests":[{"name":"","description":"","headers":[{"name":"Content-Type","value":"application/json"}],"body":"{\\n    \\"title\\": \\"My new note\\",\\n    \\"body\\": \\"...\\"\\n}\\n","schema":"","content":[{"element":"asset","attributes":{"role":"bodyExample"},"content":"{\\n    \\"title\\": \\"My new note\\",\\n    \\"body\\": \\"...\\"\\n}\\n"}]}],"responses":[{"name":"201","description":"","headers":[],"body":"","schema":"","content":[]},{"name":"400","description":"","headers":[{"name":"Content-Type","value":"application/json"}],"body":"{\\n    \\"error\\": \\"Invalid title\\"\\n}\\n","schema":"","content":[{"element":"asset","attributes":{"role":"bodyExample"},"content":"{\\n    \\"error\\": \\"Invalid title\\"\\n}\\n"}]}]}]}],"content":[]},{"element":"resource","name":"Note","description":"Note description\\n\\n","uriTemplate":"/notes/{id}","model":{"name":"Note","description":"","headers":[{"name":"Content-Type","value":"application/json"},{"name":"X-Request-ID","value":"f72fc914"},{"name":"X-Response-Time","value":"4ms"}],"body":"{\\n    \\"id\\": 1,\\n    \\"title\\": \\"Grocery list\\",\\n    \\"body\\": \\"Buy milk\\"\\n}\\n","schema":"","content":[{"element":"asset","attributes":{"role":"bodyExample"},"content":"{\\n    \\"id\\": 1,\\n    \\"title\\": \\"Grocery list\\",\\n    \\"body\\": \\"Buy milk\\"\\n}\\n"}]},"parameters":[{"name":"id","description":"The note ID","type":"string","required":true,"default":"","example":"68a5sdf67","values":[]}],"actions":[{"name":"Get Note","description":"Get a single note.\\n\\n","method":"GET","parameters":[],"attributes":{"relation":"","uriTemplate":""},"content":[],"examples":[{"name":"","description":"","requests":[],"responses":[{"reference":{"id":"Note"},"name":"200","description":"","headers":[{"name":"Content-Type","value":"application/json"},{"name":"X-Request-ID","value":"f72fc914"},{"name":"X-Response-Time","value":"4ms"}],"body":"{\\n    \\"id\\": 1,\\n    \\"title\\": \\"Grocery list\\",\\n    \\"body\\": \\"Buy milk\\"\\n}\\n","schema":"","content":[{"element":"asset","attributes":{"role":"bodyExample"},"content":"{\\n    \\"id\\": 1,\\n    \\"title\\": \\"Grocery list\\",\\n    \\"body\\": \\"Buy milk\\"\\n}\\n"}]},{"name":"404","description":"","headers":[{"name":"Content-Type","value":"application/json"},{"name":"X-Request-ID","value":"f72fc914"},{"name":"X-Response-Time","value":"4ms"}],"body":"{\\n    \\"error\\": \\"Note not found\\"\\n}\\n","schema":"","content":[{"element":"asset","attributes":{"role":"bodyExample"},"content":"{\\n    \\"error\\": \\"Note not found\\"\\n}\\n"}]}]}]},{"name":"Update a Note","description":"Update a single note\\n\\n","method":"PUT","parameters":[],"attributes":{"relation":"","uriTemplate":""},"content":[],"examples":[{"name":"","description":"","requests":[{"name":"","description":"","headers":[{"name":"Content-Type","value":"application/json"}],"body":"{\\n    \\"title\\": \\"Grocery List (Safeway)\\"\\n}\\n","schema":"","content":[{"element":"asset","attributes":{"role":"bodyExample"},"content":"{\\n    \\"title\\": \\"Grocery List (Safeway)\\"\\n}\\n"}]}],"responses":[{"reference":{"id":"Note"},"name":"200","description":"","headers":[{"name":"Content-Type","value":"application/json"},{"name":"X-Request-ID","value":"f72fc914"},{"name":"X-Response-Time","value":"4ms"}],"body":"{\\n    \\"id\\": 1,\\n    \\"title\\": \\"Grocery list\\",\\n    \\"body\\": \\"Buy milk\\"\\n}\\n","schema":"","content":[{"element":"asset","attributes":{"role":"bodyExample"},"content":"{\\n    \\"id\\": 1,\\n    \\"title\\": \\"Grocery list\\",\\n    \\"body\\": \\"Buy milk\\"\\n}\\n"}]},{"name":"404","description":"","headers":[{"name":"Content-Type","value":"application/json"},{"name":"X-Request-ID","value":"f72fc914"},{"name":"X-Response-Time","value":"4ms"}],"body":"{\\n    \\"error\\": \\"Note not found\\"\\n}\\n","schema":"","content":[{"element":"asset","attributes":{"role":"bodyExample"},"content":"{\\n    \\"error\\": \\"Note not found\\"\\n}\\n"}]}]}]},{"name":"Delete a Note","description":"Delete a single note\\n\\n","method":"DELETE","parameters":[],"attributes":{"relation":"","uriTemplate":""},"content":[],"examples":[{"name":"","description":"","requests":[],"responses":[{"name":"204","description":"","headers":[],"body":"","schema":"","content":[]},{"name":"404","description":"","headers":[{"name":"Content-Type","value":"application/json"},{"name":"X-Request-ID","value":"f72fc914"},{"name":"X-Response-Time","value":"4ms"}],"body":"{\\n    \\"error\\": \\"Note not found\\"\\n}\\n","schema":"","content":[{"element":"asset","attributes":{"role":"bodyExample"},"content":"{\\n    \\"error\\": \\"Note not found\\"\\n}\\n"}]}]}]}],"content":[]}]},{"name":"Users","description":"Group description\\n\\n","resources":[{"element":"resource","name":"User List","description":"A list of users\\n\\n","uriTemplate":"/users{?name,joinedBefore,joinedAfter,sort,limit}","model":{"name":"User List","description":"","headers":[{"name":"Content-Type","value":"application/json"}],"body":"[\\n    {\\n        \\"name\\": \\"alice\\",\\n        \\"image\\": \\"http://foo.com/alice.jpg\\",\\n        \\"joined\\": \\"2013-11-01\\"\\n    },\\n    {\\n        \\"name\\": \\"bob\\",\\n        \\"image\\": \\"http://foo.com/bob.jpg\\",\\n        \\"joined\\": \\"2013-11-02\\"\\n    }\\n]\\n","schema":"<!-- include(example-schema.json) -->\\n","content":[{"element":"asset","attributes":{"role":"bodyExample"},"content":"[\\n    {\\n        \\"name\\": \\"alice\\",\\n        \\"image\\": \\"http://foo.com/alice.jpg\\",\\n        \\"joined\\": \\"2013-11-01\\"\\n    },\\n    {\\n        \\"name\\": \\"bob\\",\\n        \\"image\\": \\"http://foo.com/bob.jpg\\",\\n        \\"joined\\": \\"2013-11-02\\"\\n    }\\n]\\n"},{"element":"asset","attributes":{"role":"bodySchema"},"content":"<!-- include(example-schema.json) -->\\n"}]},"parameters":[{"name":"name","description":"Search for a user by name","type":"string","required":false,"default":"","example":"alice","values":[]},{"name":"joinedBefore","description":"Search by join date","type":"string","required":false,"default":"","example":"2011-01-01","values":[]},{"name":"joinedAfter","description":"Search by join date","type":"string","required":false,"default":"","example":"2011-01-01","values":[]},{"name":"sort","description":"Which field to sort by","type":"string","required":false,"default":"name","example":"joined","values":[{"value":"name"},{"value":"joined"},{"value":"-joined"},{"value":"age"},{"value":"-age"},{"value":"location"},{"value":"-location"},{"value":"plan"},{"value":"-plan"}]},{"name":"limit","description":"The maximum number of users to return, up to `50`","type":"integer","required":false,"default":"10","example":"25","values":[]}],"actions":[{"name":"Get users","description":"Get a list of users. Example:\\n\\n```no-highlight\\nhttps://api.mywebsite.com/users?sort=joined&limit=5\\n```\\n\\n","method":"GET","parameters":[],"attributes":{"relation":"","uriTemplate":""},"content":[],"examples":[{"name":"","description":"","requests":[],"responses":[{"reference":{"id":"User List"},"name":"200","description":"","headers":[{"name":"Content-Type","value":"application/json"}],"body":"[\\n    {\\n        \\"name\\": \\"alice\\",\\n        \\"image\\": \\"http://foo.com/alice.jpg\\",\\n        \\"joined\\": \\"2013-11-01\\"\\n    },\\n    {\\n        \\"name\\": \\"bob\\",\\n        \\"image\\": \\"http://foo.com/bob.jpg\\",\\n        \\"joined\\": \\"2013-11-02\\"\\n    }\\n]\\n","schema":"<!-- include(example-schema.json) -->\\n","content":[{"element":"asset","attributes":{"role":"bodyExample"},"content":"[\\n    {\\n        \\"name\\": \\"alice\\",\\n        \\"image\\": \\"http://foo.com/alice.jpg\\",\\n        \\"joined\\": \\"2013-11-01\\"\\n    },\\n    {\\n        \\"name\\": \\"bob\\",\\n        \\"image\\": \\"http://foo.com/bob.jpg\\",\\n        \\"joined\\": \\"2013-11-02\\"\\n    }\\n]\\n"},{"element":"asset","attributes":{"role":"bodySchema"},"content":"<!-- include(example-schema.json) -->\\n"}]}]}]}],"content":[]}]},{"name":"Tags and Tagging Long Title","description":"Get or set tags on notes\\n\\n","resources":[{"element":"resource","name":"","description":"","uriTemplate":"/tags","model":{},"parameters":[],"actions":[{"name":"","description":"Get a list of bars\\n\\n","method":"GET","parameters":[],"attributes":{"relation":"","uriTemplate":""},"content":[],"examples":[{"name":"","description":"","requests":[],"responses":[{"name":"200","description":"","headers":[],"body":"","schema":"","content":[]}]}]}],"content":[]},{"element":"resource","name":"Get one tag","description":"Get a single tag\\n\\n","uriTemplate":"/tags/{id}","model":{},"parameters":[],"actions":[{"name":"","description":"","method":"GET","parameters":[],"attributes":{"relation":"","uriTemplate":""},"content":[],"examples":[{"name":"","description":"","requests":[],"responses":[{"name":"200","description":"","headers":[],"body":"","schema":"","content":[]}]}]}],"content":[]}]}],"content":[{"element":"category","attributes":{"name":"Notes"},"content":[{"element":"copy","content":"Group description (also with *Markdown*)\\n\\n"},{"element":"resource","name":"Note List","description":"Note list description\\n\\n+ Even\\n\\n+ More\\n\\n+ Markdown\\n\\n","uriTemplate":"/notes","model":{"name":"Note List","description":"","headers":[{"name":"Content-Type","value":"application/json"},{"name":"X-Request-ID","value":"f72fc914"},{"name":"X-Response-Time","value":"4ms"}],"body":"[\\n    {\\n        \\"id\\": 1,\\n        \\"title\\": \\"Grocery list\\",\\n        \\"body\\": \\"Buy milk\\"\\n    },\\n    {\\n        \\"id\\": 2,\\n        \\"title\\": \\"TODO\\",\\n        \\"body\\": \\"Fix garage door\\"\\n    }\\n]\\n","schema":"","content":[{"element":"asset","attributes":{"role":"bodyExample"},"content":"[\\n    {\\n        \\"id\\": 1,\\n        \\"title\\": \\"Grocery list\\",\\n        \\"body\\": \\"Buy milk\\"\\n    },\\n    {\\n        \\"id\\": 2,\\n        \\"title\\": \\"TODO\\",\\n        \\"body\\": \\"Fix garage door\\"\\n    }\\n]\\n"}]},"parameters":[],"actions":[{"name":"Get Notes","description":"Get a list of notes.\\n\\n","method":"GET","parameters":[],"attributes":{"relation":"","uriTemplate":""},"content":[],"examples":[{"name":"","description":"","requests":[],"responses":[{"reference":{"id":"Note List"},"name":"200","description":"","headers":[{"name":"Content-Type","value":"application/json"},{"name":"X-Request-ID","value":"f72fc914"},{"name":"X-Response-Time","value":"4ms"}],"body":"[\\n    {\\n        \\"id\\": 1,\\n        \\"title\\": \\"Grocery list\\",\\n        \\"body\\": \\"Buy milk\\"\\n    },\\n    {\\n        \\"id\\": 2,\\n        \\"title\\": \\"TODO\\",\\n        \\"body\\": \\"Fix garage door\\"\\n    }\\n]\\n","schema":"","content":[{"element":"asset","attributes":{"role":"bodyExample"},"content":"[\\n    {\\n        \\"id\\": 1,\\n        \\"title\\": \\"Grocery list\\",\\n        \\"body\\": \\"Buy milk\\"\\n    },\\n    {\\n        \\"id\\": 2,\\n        \\"title\\": \\"TODO\\",\\n        \\"body\\": \\"Fix garage door\\"\\n    }\\n]\\n"}]}]}]},{"name":"Create New Note","description":"Create a new note\\n\\n","method":"POST","parameters":[],"attributes":{"relation":"","uriTemplate":""},"content":[],"examples":[{"name":"","description":"","requests":[{"name":"","description":"","headers":[{"name":"Content-Type","value":"application/json"}],"body":"{\\n    \\"title\\": \\"My new note\\",\\n    \\"body\\": \\"...\\"\\n}\\n","schema":"","content":[{"element":"asset","attributes":{"role":"bodyExample"},"content":"{\\n    \\"title\\": \\"My new note\\",\\n    \\"body\\": \\"...\\"\\n}\\n"}]}],"responses":[{"name":"201","description":"","headers":[],"body":"","schema":"","content":[]},{"name":"400","description":"","headers":[{"name":"Content-Type","value":"application/json"}],"body":"{\\n    \\"error\\": \\"Invalid title\\"\\n}\\n","schema":"","content":[{"element":"asset","attributes":{"role":"bodyExample"},"content":"{\\n    \\"error\\": \\"Invalid title\\"\\n}\\n"}]}]}]}],"content":[]},{"element":"resource","name":"Note","description":"Note description\\n\\n","uriTemplate":"/notes/{id}","model":{"name":"Note","description":"","headers":[{"name":"Content-Type","value":"application/json"},{"name":"X-Request-ID","value":"f72fc914"},{"name":"X-Response-Time","value":"4ms"}],"body":"{\\n    \\"id\\": 1,\\n    \\"title\\": \\"Grocery list\\",\\n    \\"body\\": \\"Buy milk\\"\\n}\\n","schema":"","content":[{"element":"asset","attributes":{"role":"bodyExample"},"content":"{\\n    \\"id\\": 1,\\n    \\"title\\": \\"Grocery list\\",\\n    \\"body\\": \\"Buy milk\\"\\n}\\n"}]},"parameters":[{"name":"id","description":"The note ID","type":"string","required":true,"default":"","example":"68a5sdf67","values":[]}],"actions":[{"name":"Get Note","description":"Get a single note.\\n\\n","method":"GET","parameters":[],"attributes":{"relation":"","uriTemplate":""},"content":[],"examples":[{"name":"","description":"","requests":[],"responses":[{"reference":{"id":"Note"},"name":"200","description":"","headers":[{"name":"Content-Type","value":"application/json"},{"name":"X-Request-ID","value":"f72fc914"},{"name":"X-Response-Time","value":"4ms"}],"body":"{\\n    \\"id\\": 1,\\n    \\"title\\": \\"Grocery list\\",\\n    \\"body\\": \\"Buy milk\\"\\n}\\n","schema":"","content":[{"element":"asset","attributes":{"role":"bodyExample"},"content":"{\\n    \\"id\\": 1,\\n    \\"title\\": \\"Grocery list\\",\\n    \\"body\\": \\"Buy milk\\"\\n}\\n"}]},{"name":"404","description":"","headers":[{"name":"Content-Type","value":"application/json"},{"name":"X-Request-ID","value":"f72fc914"},{"name":"X-Response-Time","value":"4ms"}],"body":"{\\n    \\"error\\": \\"Note not found\\"\\n}\\n","schema":"","content":[{"element":"asset","attributes":{"role":"bodyExample"},"content":"{\\n    \\"error\\": \\"Note not found\\"\\n}\\n"}]}]}]},{"name":"Update a Note","description":"Update a single note\\n\\n","method":"PUT","parameters":[],"attributes":{"relation":"","uriTemplate":""},"content":[],"examples":[{"name":"","description":"","requests":[{"name":"","description":"","headers":[{"name":"Content-Type","value":"application/json"}],"body":"{\\n    \\"title\\": \\"Grocery List (Safeway)\\"\\n}\\n","schema":"","content":[{"element":"asset","attributes":{"role":"bodyExample"},"content":"{\\n    \\"title\\": \\"Grocery List (Safeway)\\"\\n}\\n"}]}],"responses":[{"reference":{"id":"Note"},"name":"200","description":"","headers":[{"name":"Content-Type","value":"application/json"},{"name":"X-Request-ID","value":"f72fc914"},{"name":"X-Response-Time","value":"4ms"}],"body":"{\\n    \\"id\\": 1,\\n    \\"title\\": \\"Grocery list\\",\\n    \\"body\\": \\"Buy milk\\"\\n}\\n","schema":"","content":[{"element":"asset","attributes":{"role":"bodyExample"},"content":"{\\n    \\"id\\": 1,\\n    \\"title\\": \\"Grocery list\\",\\n    \\"body\\": \\"Buy milk\\"\\n}\\n"}]},{"name":"404","description":"","headers":[{"name":"Content-Type","value":"application/json"},{"name":"X-Request-ID","value":"f72fc914"},{"name":"X-Response-Time","value":"4ms"}],"body":"{\\n    \\"error\\": \\"Note not found\\"\\n}\\n","schema":"","content":[{"element":"asset","attributes":{"role":"bodyExample"},"content":"{\\n    \\"error\\": \\"Note not found\\"\\n}\\n"}]}]}]},{"name":"Delete a Note","description":"Delete a single note\\n\\n","method":"DELETE","parameters":[],"attributes":{"relation":"","uriTemplate":""},"content":[],"examples":[{"name":"","description":"","requests":[],"responses":[{"name":"204","description":"","headers":[],"body":"","schema":"","content":[]},{"name":"404","description":"","headers":[{"name":"Content-Type","value":"application/json"},{"name":"X-Request-ID","value":"f72fc914"},{"name":"X-Response-Time","value":"4ms"}],"body":"{\\n    \\"error\\": \\"Note not found\\"\\n}\\n","schema":"","content":[{"element":"asset","attributes":{"role":"bodyExample"},"content":"{\\n    \\"error\\": \\"Note not found\\"\\n}\\n"}]}]}]}],"content":[]}]},{"element":"category","attributes":{"name":"Users"},"content":[{"element":"copy","content":"Group description\\n\\n"},{"element":"resource","name":"User List","description":"A list of users\\n\\n","uriTemplate":"/users{?name,joinedBefore,joinedAfter,sort,limit}","model":{"name":"User List","description":"","headers":[{"name":"Content-Type","value":"application/json"}],"body":"[\\n    {\\n        \\"name\\": \\"alice\\",\\n        \\"image\\": \\"http://foo.com/alice.jpg\\",\\n        \\"joined\\": \\"2013-11-01\\"\\n    },\\n    {\\n        \\"name\\": \\"bob\\",\\n        \\"image\\": \\"http://foo.com/bob.jpg\\",\\n        \\"joined\\": \\"2013-11-02\\"\\n    }\\n]\\n","schema":"<!-- include(example-schema.json) -->\\n","content":[{"element":"asset","attributes":{"role":"bodyExample"},"content":"[\\n    {\\n        \\"name\\": \\"alice\\",\\n        \\"image\\": \\"http://foo.com/alice.jpg\\",\\n        \\"joined\\": \\"2013-11-01\\"\\n    },\\n    {\\n        \\"name\\": \\"bob\\",\\n        \\"image\\": \\"http://foo.com/bob.jpg\\",\\n        \\"joined\\": \\"2013-11-02\\"\\n    }\\n]\\n"},{"element":"asset","attributes":{"role":"bodySchema"},"content":"<!-- include(example-schema.json) -->\\n"}]},"parameters":[{"name":"name","description":"Search for a user by name","type":"string","required":false,"default":"","example":"alice","values":[]},{"name":"joinedBefore","description":"Search by join date","type":"string","required":false,"default":"","example":"2011-01-01","values":[]},{"name":"joinedAfter","description":"Search by join date","type":"string","required":false,"default":"","example":"2011-01-01","values":[]},{"name":"sort","description":"Which field to sort by","type":"string","required":false,"default":"name","example":"joined","values":[{"value":"name"},{"value":"joined"},{"value":"-joined"},{"value":"age"},{"value":"-age"},{"value":"location"},{"value":"-location"},{"value":"plan"},{"value":"-plan"}]},{"name":"limit","description":"The maximum number of users to return, up to `50`","type":"integer","required":false,"default":"10","example":"25","values":[]}],"actions":[{"name":"Get users","description":"Get a list of users. Example:\\n\\n```no-highlight\\nhttps://api.mywebsite.com/users?sort=joined&limit=5\\n```\\n\\n","method":"GET","parameters":[],"attributes":{"relation":"","uriTemplate":""},"content":[],"examples":[{"name":"","description":"","requests":[],"responses":[{"reference":{"id":"User List"},"name":"200","description":"","headers":[{"name":"Content-Type","value":"application/json"}],"body":"[\\n    {\\n        \\"name\\": \\"alice\\",\\n        \\"image\\": \\"http://foo.com/alice.jpg\\",\\n        \\"joined\\": \\"2013-11-01\\"\\n    },\\n    {\\n        \\"name\\": \\"bob\\",\\n        \\"image\\": \\"http://foo.com/bob.jpg\\",\\n        \\"joined\\": \\"2013-11-02\\"\\n    }\\n]\\n","schema":"<!-- include(example-schema.json) -->\\n","content":[{"element":"asset","attributes":{"role":"bodyExample"},"content":"[\\n    {\\n        \\"name\\": \\"alice\\",\\n        \\"image\\": \\"http://foo.com/alice.jpg\\",\\n        \\"joined\\": \\"2013-11-01\\"\\n    },\\n    {\\n        \\"name\\": \\"bob\\",\\n        \\"image\\": \\"http://foo.com/bob.jpg\\",\\n        \\"joined\\": \\"2013-11-02\\"\\n    }\\n]\\n"},{"element":"asset","attributes":{"role":"bodySchema"},"content":"<!-- include(example-schema.json) -->\\n"}]}]}]}],"content":[]}]},{"element":"category","attributes":{"name":"Tags and Tagging Long Title"},"content":[{"element":"copy","content":"Get or set tags on notes\\n\\n"},{"element":"resource","name":"","description":"","uriTemplate":"/tags","model":{},"parameters":[],"actions":[{"name":"","description":"Get a list of bars\\n\\n","method":"GET","parameters":[],"attributes":{"relation":"","uriTemplate":""},"content":[],"examples":[{"name":"","description":"","requests":[],"responses":[{"name":"200","description":"","headers":[],"body":"","schema":"","content":[]}]}]}],"content":[]},{"element":"resource","name":"Get one tag","description":"Get a single tag\\n\\n","uriTemplate":"/tags/{id}","model":{},"parameters":[],"actions":[{"name":"","description":"","method":"GET","parameters":[],"attributes":{"relation":"","uriTemplate":""},"content":[],"examples":[{"name":"","description":"","requests":[],"responses":[{"name":"200","description":"","headers":[],"body":"","schema":"","content":[]}]}]}],"content":[]}]}]}	2015-04-04 00:00:00+00	2015-04-04 00:00:00+00	1	my-notes
3	Eandis	\N	FORMAT: 1A\n\n# Eandis\nEandis service that collects and queries meter readings for Eandis energy and gas meters all over Belgium.\n\n\n# Group Meters\nMeters related resources of the **SmartMeter API**\n\n## Meters Collection [/meters]\n### List all Meters [GET]\n+ Response 200 (application/json)\n\n        [{\n          "serial"       : "2978",\n          "ean"          : "541448820051167910",\n          "sector"       : 3,\n          "register"     : "E",\n          "product"      : "electricity",\n          "last_reading" : "002579.0"\n        }, {\n          "serial"       : "6534",\n          "ean"          : "541448820051167927",\n          "sector"       : 3\n          "register"     : "G",\n          "product"      : "gas",\n          "last_reading" : "01444.0"\n        }]\n\n## Meter [/meters/{id}]\nA single Meter object with all its details\n\n+ Parameters\n    + id (required, string, `541448820051167910`) ... Unique `EAN` id of the meter.\n\n\n### Retrieve a Meter [GET]\n+ Response 200 (application/json)\n\n        {\n          "serial"       : "2978",\n          "ean"          : "541448820051167910",\n          "sector"       : 3,\n          "register"     : "E",\n          "product"      : "electricity",\n          "last_reading" : "002579.0",\n          "readings"     : [{\n            "timestamp": "2015-03-18T20:30:16.588Z",\n            "value"    : "002579.0"\n          }, {\n            "timestamp": "2014-09-18T20:30:16.588Z",\n            "value"    : "002281.0"\n          }]\n        }\n\n## Readings [/meters/{id}/readings]\nMultiple readings from a meter\n\n+ Parameters\n    + id (required, string, `541448820051167910`) ... Unique `EAN` id of the meter.\n\n### Retrieve readings [GET]\n+ Response 200 (application/json)\n\n        [{\n            "timestamp": "2015-03-18T20:30:16.588Z",\n            "value"    : "002579.0"\n        }, {\n            "timestamp": "2014-09-18T20:30:16.588Z",\n            "value"    : "002281.0"\n        },\n        {\n            "timestamp": "2014-03-18T20:30:16.588Z",\n            "value"    : "002170.8"\n        }]\n\n### Add readings [POST]\n+ Response 201 (application/json)\n\n    + Body\n    \n            {\n                "timestamp": "2015-03-18T20:30:16.588Z",\n                "value"    : "002580.0"\n            }\n	{"_version":"3.0","metadata":[{"name":"FORMAT","value":"1A"}],"name":"Eandis","description":"Eandis service that collects and queries meter readings for Eandis energy and gas meters all over Belgium.\\n\\n\\n","element":"category","resourceGroups":[{"name":"Meters","description":"Meters related resources of the **SmartMeter API**\\n\\n","resources":[{"element":"resource","name":"Meters Collection","description":"","uriTemplate":"/meters","model":{},"parameters":[],"actions":[{"name":"List all Meters","description":"","method":"GET","parameters":[],"attributes":{"relation":"","uriTemplate":""},"content":[],"examples":[{"name":"","description":"","requests":[],"responses":[{"name":"200","description":"","headers":[{"name":"Content-Type","value":"application/json"}],"body":"[{\\n  \\"serial\\"       : \\"2978\\",\\n  \\"ean\\"          : \\"541448820051167910\\",\\n  \\"sector\\"       : 3,\\n  \\"register\\"     : \\"E\\",\\n  \\"product\\"      : \\"electricity\\",\\n  \\"last_reading\\" : \\"002579.0\\"\\n}, {\\n  \\"serial\\"       : \\"6534\\",\\n  \\"ean\\"          : \\"541448820051167927\\",\\n  \\"sector\\"       : 3\\n  \\"register\\"     : \\"G\\",\\n  \\"product\\"      : \\"gas\\",\\n  \\"last_reading\\" : \\"01444.0\\"\\n}]\\n","schema":"","content":[{"element":"asset","attributes":{"role":"bodyExample"},"content":"[{\\n  \\"serial\\"       : \\"2978\\",\\n  \\"ean\\"          : \\"541448820051167910\\",\\n  \\"sector\\"       : 3,\\n  \\"register\\"     : \\"E\\",\\n  \\"product\\"      : \\"electricity\\",\\n  \\"last_reading\\" : \\"002579.0\\"\\n}, {\\n  \\"serial\\"       : \\"6534\\",\\n  \\"ean\\"          : \\"541448820051167927\\",\\n  \\"sector\\"       : 3\\n  \\"register\\"     : \\"G\\",\\n  \\"product\\"      : \\"gas\\",\\n  \\"last_reading\\" : \\"01444.0\\"\\n}]\\n"}]}]}]}],"content":[]},{"element":"resource","name":"Meter","description":"A single Meter object with all its details\\n\\n","uriTemplate":"/meters/{id}","model":{},"parameters":[{"name":"id","description":"Unique `EAN` id of the meter.","type":"string","required":true,"default":"","example":"541448820051167910","values":[]}],"actions":[{"name":"Retrieve a Meter","description":"","method":"GET","parameters":[],"attributes":{"relation":"","uriTemplate":""},"content":[],"examples":[{"name":"","description":"","requests":[],"responses":[{"name":"200","description":"","headers":[{"name":"Content-Type","value":"application/json"}],"body":"{\\n  \\"serial\\"       : \\"2978\\",\\n  \\"ean\\"          : \\"541448820051167910\\",\\n  \\"sector\\"       : 3,\\n  \\"register\\"     : \\"E\\",\\n  \\"product\\"      : \\"electricity\\",\\n  \\"last_reading\\" : \\"002579.0\\",\\n  \\"readings\\"     : [{\\n    \\"timestamp\\": \\"2015-03-18T20:30:16.588Z\\",\\n    \\"value\\"    : \\"002579.0\\"\\n  }, {\\n    \\"timestamp\\": \\"2014-09-18T20:30:16.588Z\\",\\n    \\"value\\"    : \\"002281.0\\"\\n  }]\\n}\\n","schema":"","content":[{"element":"asset","attributes":{"role":"bodyExample"},"content":"{\\n  \\"serial\\"       : \\"2978\\",\\n  \\"ean\\"          : \\"541448820051167910\\",\\n  \\"sector\\"       : 3,\\n  \\"register\\"     : \\"E\\",\\n  \\"product\\"      : \\"electricity\\",\\n  \\"last_reading\\" : \\"002579.0\\",\\n  \\"readings\\"     : [{\\n    \\"timestamp\\": \\"2015-03-18T20:30:16.588Z\\",\\n    \\"value\\"    : \\"002579.0\\"\\n  }, {\\n    \\"timestamp\\": \\"2014-09-18T20:30:16.588Z\\",\\n    \\"value\\"    : \\"002281.0\\"\\n  }]\\n}\\n"}]}]}]}],"content":[]},{"element":"resource","name":"Readings","description":"Multiple readings from a meter\\n\\n","uriTemplate":"/meters/{id}/readings","model":{},"parameters":[{"name":"id","description":"Unique `EAN` id of the meter.","type":"string","required":true,"default":"","example":"541448820051167910","values":[]}],"actions":[{"name":"Retrieve readings","description":"","method":"GET","parameters":[],"attributes":{"relation":"","uriTemplate":""},"content":[],"examples":[{"name":"","description":"","requests":[],"responses":[{"name":"200","description":"","headers":[{"name":"Content-Type","value":"application/json"}],"body":"[{\\n    \\"timestamp\\": \\"2015-03-18T20:30:16.588Z\\",\\n    \\"value\\"    : \\"002579.0\\"\\n}, {\\n    \\"timestamp\\": \\"2014-09-18T20:30:16.588Z\\",\\n    \\"value\\"    : \\"002281.0\\"\\n},\\n{\\n    \\"timestamp\\": \\"2014-03-18T20:30:16.588Z\\",\\n    \\"value\\"    : \\"002170.8\\"\\n}]\\n","schema":"","content":[{"element":"asset","attributes":{"role":"bodyExample"},"content":"[{\\n    \\"timestamp\\": \\"2015-03-18T20:30:16.588Z\\",\\n    \\"value\\"    : \\"002579.0\\"\\n}, {\\n    \\"timestamp\\": \\"2014-09-18T20:30:16.588Z\\",\\n    \\"value\\"    : \\"002281.0\\"\\n},\\n{\\n    \\"timestamp\\": \\"2014-03-18T20:30:16.588Z\\",\\n    \\"value\\"    : \\"002170.8\\"\\n}]\\n"}]}]}]},{"name":"Add readings","description":"","method":"POST","parameters":[],"attributes":{"relation":"","uriTemplate":""},"content":[],"examples":[{"name":"","description":"","requests":[],"responses":[{"name":"201","description":"","headers":[{"name":"Content-Type","value":"application/json"}],"body":"{\\n    \\"timestamp\\": \\"2015-03-18T20:30:16.588Z\\",\\n    \\"value\\"    : \\"002580.0\\"\\n}\\n","schema":"","content":[{"element":"asset","attributes":{"role":"bodyExample"},"content":"{\\n    \\"timestamp\\": \\"2015-03-18T20:30:16.588Z\\",\\n    \\"value\\"    : \\"002580.0\\"\\n}\\n"}]}]}]}],"content":[]}]}],"content":[{"element":"category","attributes":{"name":"Meters"},"content":[{"element":"copy","content":"Meters related resources of the **SmartMeter API**\\n\\n"},{"element":"resource","name":"Meters Collection","description":"","uriTemplate":"/meters","model":{},"parameters":[],"actions":[{"name":"List all Meters","description":"","method":"GET","parameters":[],"attributes":{"relation":"","uriTemplate":""},"content":[],"examples":[{"name":"","description":"","requests":[],"responses":[{"name":"200","description":"","headers":[{"name":"Content-Type","value":"application/json"}],"body":"[{\\n  \\"serial\\"       : \\"2978\\",\\n  \\"ean\\"          : \\"541448820051167910\\",\\n  \\"sector\\"       : 3,\\n  \\"register\\"     : \\"E\\",\\n  \\"product\\"      : \\"electricity\\",\\n  \\"last_reading\\" : \\"002579.0\\"\\n}, {\\n  \\"serial\\"       : \\"6534\\",\\n  \\"ean\\"          : \\"541448820051167927\\",\\n  \\"sector\\"       : 3\\n  \\"register\\"     : \\"G\\",\\n  \\"product\\"      : \\"gas\\",\\n  \\"last_reading\\" : \\"01444.0\\"\\n}]\\n","schema":"","content":[{"element":"asset","attributes":{"role":"bodyExample"},"content":"[{\\n  \\"serial\\"       : \\"2978\\",\\n  \\"ean\\"          : \\"541448820051167910\\",\\n  \\"sector\\"       : 3,\\n  \\"register\\"     : \\"E\\",\\n  \\"product\\"      : \\"electricity\\",\\n  \\"last_reading\\" : \\"002579.0\\"\\n}, {\\n  \\"serial\\"       : \\"6534\\",\\n  \\"ean\\"          : \\"541448820051167927\\",\\n  \\"sector\\"       : 3\\n  \\"register\\"     : \\"G\\",\\n  \\"product\\"      : \\"gas\\",\\n  \\"last_reading\\" : \\"01444.0\\"\\n}]\\n"}]}]}]}],"content":[]},{"element":"resource","name":"Meter","description":"A single Meter object with all its details\\n\\n","uriTemplate":"/meters/{id}","model":{},"parameters":[{"name":"id","description":"Unique `EAN` id of the meter.","type":"string","required":true,"default":"","example":"541448820051167910","values":[]}],"actions":[{"name":"Retrieve a Meter","description":"","method":"GET","parameters":[],"attributes":{"relation":"","uriTemplate":""},"content":[],"examples":[{"name":"","description":"","requests":[],"responses":[{"name":"200","description":"","headers":[{"name":"Content-Type","value":"application/json"}],"body":"{\\n  \\"serial\\"       : \\"2978\\",\\n  \\"ean\\"          : \\"541448820051167910\\",\\n  \\"sector\\"       : 3,\\n  \\"register\\"     : \\"E\\",\\n  \\"product\\"      : \\"electricity\\",\\n  \\"last_reading\\" : \\"002579.0\\",\\n  \\"readings\\"     : [{\\n    \\"timestamp\\": \\"2015-03-18T20:30:16.588Z\\",\\n    \\"value\\"    : \\"002579.0\\"\\n  }, {\\n    \\"timestamp\\": \\"2014-09-18T20:30:16.588Z\\",\\n    \\"value\\"    : \\"002281.0\\"\\n  }]\\n}\\n","schema":"","content":[{"element":"asset","attributes":{"role":"bodyExample"},"content":"{\\n  \\"serial\\"       : \\"2978\\",\\n  \\"ean\\"          : \\"541448820051167910\\",\\n  \\"sector\\"       : 3,\\n  \\"register\\"     : \\"E\\",\\n  \\"product\\"      : \\"electricity\\",\\n  \\"last_reading\\" : \\"002579.0\\",\\n  \\"readings\\"     : [{\\n    \\"timestamp\\": \\"2015-03-18T20:30:16.588Z\\",\\n    \\"value\\"    : \\"002579.0\\"\\n  }, {\\n    \\"timestamp\\": \\"2014-09-18T20:30:16.588Z\\",\\n    \\"value\\"    : \\"002281.0\\"\\n  }]\\n}\\n"}]}]}]}],"content":[]},{"element":"resource","name":"Readings","description":"Multiple readings from a meter\\n\\n","uriTemplate":"/meters/{id}/readings","model":{},"parameters":[{"name":"id","description":"Unique `EAN` id of the meter.","type":"string","required":true,"default":"","example":"541448820051167910","values":[]}],"actions":[{"name":"Retrieve readings","description":"","method":"GET","parameters":[],"attributes":{"relation":"","uriTemplate":""},"content":[],"examples":[{"name":"","description":"","requests":[],"responses":[{"name":"200","description":"","headers":[{"name":"Content-Type","value":"application/json"}],"body":"[{\\n    \\"timestamp\\": \\"2015-03-18T20:30:16.588Z\\",\\n    \\"value\\"    : \\"002579.0\\"\\n}, {\\n    \\"timestamp\\": \\"2014-09-18T20:30:16.588Z\\",\\n    \\"value\\"    : \\"002281.0\\"\\n},\\n{\\n    \\"timestamp\\": \\"2014-03-18T20:30:16.588Z\\",\\n    \\"value\\"    : \\"002170.8\\"\\n}]\\n","schema":"","content":[{"element":"asset","attributes":{"role":"bodyExample"},"content":"[{\\n    \\"timestamp\\": \\"2015-03-18T20:30:16.588Z\\",\\n    \\"value\\"    : \\"002579.0\\"\\n}, {\\n    \\"timestamp\\": \\"2014-09-18T20:30:16.588Z\\",\\n    \\"value\\"    : \\"002281.0\\"\\n},\\n{\\n    \\"timestamp\\": \\"2014-03-18T20:30:16.588Z\\",\\n    \\"value\\"    : \\"002170.8\\"\\n}]\\n"}]}]}]},{"name":"Add readings","description":"","method":"POST","parameters":[],"attributes":{"relation":"","uriTemplate":""},"content":[],"examples":[{"name":"","description":"","requests":[],"responses":[{"name":"201","description":"","headers":[{"name":"Content-Type","value":"application/json"}],"body":"{\\n    \\"timestamp\\": \\"2015-03-18T20:30:16.588Z\\",\\n    \\"value\\"    : \\"002580.0\\"\\n}\\n","schema":"","content":[{"element":"asset","attributes":{"role":"bodyExample"},"content":"{\\n    \\"timestamp\\": \\"2015-03-18T20:30:16.588Z\\",\\n    \\"value\\"    : \\"002580.0\\"\\n}\\n"}]}]}]}],"content":[]}]}]}	2015-04-04 00:00:00+00	2015-04-04 00:00:00+00	1	eandis
\.


--
-- Name: blueprints_id_seq; Type: SEQUENCE SET; Schema: public; Owner: astromo
--

SELECT pg_catalog.setval('blueprints_id_seq', 4, true);


--
-- Data for Name: invoices; Type: TABLE DATA; Schema: public; Owner: astromo
--

COPY invoices (id, date, description, amount, attachment, created_at, updated_at, user_id) FROM stdin;
1	2015-03-01 00:00:00+00	Invoice for March 2015	40	\N	2015-03-29 00:00:00+00	2015-03-29 00:00:00+00	1
2	2015-02-01 00:00:00+00	Invoice for February 2015	40.5	http://slimvoice.co/api/invoices/551efcd2ff8db38e490c6ffc/pdf	2015-03-29 00:00:00+00	2015-03-29 00:00:00+00	1
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
2	michiel@astromo.io	$2a$13$j4g3Oh4SLgB9Rhz9mKVXROD3cJYka6B1.msYtJfPkMYsVn/SD9PXW	Michiel	De Mey	Co-Founder	https://pbs.twimg.com/profile_images/507569511151583232/a9RgzoKQ_400x400.jpeg	2015-03-25 23:00:00+00	2015-03-25 23:00:00+00	\N
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: astromo
--

SELECT pg_catalog.setval('users_id_seq', 4, true);


--
-- Name: blueprints_pkey; Type: CONSTRAINT; Schema: public; Owner: astromo; Tablespace: 
--

ALTER TABLE ONLY blueprints
    ADD CONSTRAINT blueprints_pkey PRIMARY KEY (id);


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
-- Name: blueprints_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: astromo
--

ALTER TABLE ONLY blueprints
    ADD CONSTRAINT blueprints_user_id_fkey FOREIGN KEY (organisation_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE SET NULL;


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

