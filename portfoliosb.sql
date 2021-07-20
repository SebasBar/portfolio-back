--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2 (Ubuntu 13.2-1.pgdg20.04+1)
-- Dumped by pg_dump version 13.2 (Ubuntu 13.2-1.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Clients" (
    id integer NOT NULL,
    name text NOT NULL,
    industry text NOT NULL,
    description text NOT NULL
);


ALTER TABLE public."Clients" OWNER TO postgres;

--
-- Name: Clients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Clients_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Clients_id_seq" OWNER TO postgres;

--
-- Name: Clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Clients_id_seq" OWNED BY public."Clients".id;


--
-- Name: Credentials; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Credentials" (
    id integer NOT NULL,
    "user" text NOT NULL,
    password text NOT NULL
);


ALTER TABLE public."Credentials" OWNER TO postgres;

--
-- Name: Credentials_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Credentials_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Credentials_id_seq" OWNER TO postgres;

--
-- Name: Credentials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Credentials_id_seq" OWNED BY public."Credentials".id;


--
-- Name: Documents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Documents" (
    id integer NOT NULL,
    name text NOT NULL,
    document text NOT NULL,
    "sebasBarId" integer
);


ALTER TABLE public."Documents" OWNER TO postgres;

--
-- Name: Documents_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Documents_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Documents_id_seq" OWNER TO postgres;

--
-- Name: Documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Documents_id_seq" OWNED BY public."Documents".id;


--
-- Name: Education; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Education" (
    id integer NOT NULL,
    degree text NOT NULL,
    description text NOT NULL,
    "time" text,
    "sebasBarId" integer
);


ALTER TABLE public."Education" OWNER TO postgres;

--
-- Name: Education_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Education_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Education_id_seq" OWNER TO postgres;

--
-- Name: Education_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Education_id_seq" OWNED BY public."Education".id;


--
-- Name: Emails; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Emails" (
    id integer NOT NULL,
    address text NOT NULL,
    "sebasBarId" integer
);


ALTER TABLE public."Emails" OWNER TO postgres;

--
-- Name: Emails_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Emails_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Emails_id_seq" OWNER TO postgres;

--
-- Name: Emails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Emails_id_seq" OWNED BY public."Emails".id;


--
-- Name: Phones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Phones" (
    id integer NOT NULL,
    number text NOT NULL,
    "sebasBarId" integer
);


ALTER TABLE public."Phones" OWNER TO postgres;

--
-- Name: Phones_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Phones_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Phones_id_seq" OWNER TO postgres;

--
-- Name: Phones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Phones_id_seq" OWNED BY public."Phones".id;


--
-- Name: Pictures; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Pictures" (
    id integer NOT NULL,
    picture text NOT NULL,
    "projectsId" integer
);


ALTER TABLE public."Pictures" OWNER TO postgres;

--
-- Name: Pictures_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Pictures_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Pictures_id_seq" OWNER TO postgres;

--
-- Name: Pictures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Pictures_id_seq" OWNED BY public."Pictures".id;


--
-- Name: Projects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Projects" (
    id integer NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    github_link text NOT NULL,
    deployed_link text,
    "sebasBarId" integer,
    description2 text,
    description3 text
);


ALTER TABLE public."Projects" OWNER TO postgres;

--
-- Name: Projects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Projects_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Projects_id_seq" OWNER TO postgres;

--
-- Name: Projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Projects_id_seq" OWNED BY public."Projects".id;


--
-- Name: SebasBar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SebasBar" (
    id integer NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL,
    picture text NOT NULL,
    github_page text NOT NULL,
    profile text
);


ALTER TABLE public."SebasBar" OWNER TO postgres;

--
-- Name: SebasBar_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."SebasBar_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SebasBar_id_seq" OWNER TO postgres;

--
-- Name: SebasBar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."SebasBar_id_seq" OWNED BY public."SebasBar".id;


--
-- Name: Social_Networks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Social_Networks" (
    id integer NOT NULL,
    name text NOT NULL,
    address text NOT NULL,
    "sebasBarId" integer
);


ALTER TABLE public."Social_Networks" OWNER TO postgres;

--
-- Name: Social_Networks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Social_Networks_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Social_Networks_id_seq" OWNER TO postgres;

--
-- Name: Social_Networks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Social_Networks_id_seq" OWNED BY public."Social_Networks".id;


--
-- Name: Special_Knowledge; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Special_Knowledge" (
    id integer NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    "sebasBarId" integer
);


ALTER TABLE public."Special_Knowledge" OWNER TO postgres;

--
-- Name: Special_Knowledge_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Special_Knowledge_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Special_Knowledge_id_seq" OWNER TO postgres;

--
-- Name: Special_Knowledge_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Special_Knowledge_id_seq" OWNED BY public."Special_Knowledge".id;


--
-- Name: Teamates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Teamates" (
    id integer NOT NULL,
    name text NOT NULL,
    github_link text
);


ALTER TABLE public."Teamates" OWNER TO postgres;

--
-- Name: Teamates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Teamates_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Teamates_id_seq" OWNER TO postgres;

--
-- Name: Teamates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Teamates_id_seq" OWNED BY public."Teamates".id;


--
-- Name: Tech_Lang; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Tech_Lang" (
    id integer NOT NULL,
    name text NOT NULL,
    description text NOT NULL
);


ALTER TABLE public."Tech_Lang" OWNER TO postgres;

--
-- Name: Tech_Lang_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Tech_Lang_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Tech_Lang_id_seq" OWNER TO postgres;

--
-- Name: Tech_Lang_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Tech_Lang_id_seq" OWNED BY public."Tech_Lang".id;


--
-- Name: Work_Experience; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Work_Experience" (
    id integer NOT NULL,
    company_name text NOT NULL,
    "position" text NOT NULL,
    description text NOT NULL,
    "time" text NOT NULL,
    "sebasBarId" integer
);


ALTER TABLE public."Work_Experience" OWNER TO postgres;

--
-- Name: Work_Experience_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Work_Experience_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Work_Experience_id_seq" OWNER TO postgres;

--
-- Name: Work_Experience_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Work_Experience_id_seq" OWNED BY public."Work_Experience".id;


--
-- Name: _ClientsToProjects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."_ClientsToProjects" (
    "A" integer NOT NULL,
    "B" integer NOT NULL
);


ALTER TABLE public."_ClientsToProjects" OWNER TO postgres;

--
-- Name: _ProjectsToTeamates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."_ProjectsToTeamates" (
    "A" integer NOT NULL,
    "B" integer NOT NULL
);


ALTER TABLE public."_ProjectsToTeamates" OWNER TO postgres;

--
-- Name: _ProjectsToTech_Lang; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."_ProjectsToTech_Lang" (
    "A" integer NOT NULL,
    "B" integer NOT NULL
);


ALTER TABLE public."_ProjectsToTech_Lang" OWNER TO postgres;

--
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO postgres;

--
-- Name: Clients id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Clients" ALTER COLUMN id SET DEFAULT nextval('public."Clients_id_seq"'::regclass);


--
-- Name: Credentials id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Credentials" ALTER COLUMN id SET DEFAULT nextval('public."Credentials_id_seq"'::regclass);


--
-- Name: Documents id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Documents" ALTER COLUMN id SET DEFAULT nextval('public."Documents_id_seq"'::regclass);


--
-- Name: Education id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Education" ALTER COLUMN id SET DEFAULT nextval('public."Education_id_seq"'::regclass);


--
-- Name: Emails id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Emails" ALTER COLUMN id SET DEFAULT nextval('public."Emails_id_seq"'::regclass);


--
-- Name: Phones id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Phones" ALTER COLUMN id SET DEFAULT nextval('public."Phones_id_seq"'::regclass);


--
-- Name: Pictures id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pictures" ALTER COLUMN id SET DEFAULT nextval('public."Pictures_id_seq"'::regclass);


--
-- Name: Projects id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Projects" ALTER COLUMN id SET DEFAULT nextval('public."Projects_id_seq"'::regclass);


--
-- Name: SebasBar id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SebasBar" ALTER COLUMN id SET DEFAULT nextval('public."SebasBar_id_seq"'::regclass);


--
-- Name: Social_Networks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Social_Networks" ALTER COLUMN id SET DEFAULT nextval('public."Social_Networks_id_seq"'::regclass);


--
-- Name: Special_Knowledge id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Special_Knowledge" ALTER COLUMN id SET DEFAULT nextval('public."Special_Knowledge_id_seq"'::regclass);


--
-- Name: Teamates id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Teamates" ALTER COLUMN id SET DEFAULT nextval('public."Teamates_id_seq"'::regclass);


--
-- Name: Tech_Lang id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tech_Lang" ALTER COLUMN id SET DEFAULT nextval('public."Tech_Lang_id_seq"'::regclass);


--
-- Name: Work_Experience id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Work_Experience" ALTER COLUMN id SET DEFAULT nextval('public."Work_Experience_id_seq"'::regclass);


--
-- Data for Name: Clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Clients" (id, name, industry, description) FROM stdin;
2	Wild Code School	Education	First Project
1	SebasBar (internal)	Web Development	Web Developer
\.


--
-- Data for Name: Credentials; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Credentials" (id, "user", password) FROM stdin;
1	SebasBar	$2b$10$ygGqlcGes.d1Y3/lA5Mnke5jy8ROdHsda7KahUPxyfUUvqrt4J3A2
\.


--
-- Data for Name: Documents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Documents" (id, name, document, "sebasBarId") FROM stdin;
\.


--
-- Data for Name: Education; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Education" (id, degree, description, "time", "sebasBarId") FROM stdin;
\.


--
-- Data for Name: Emails; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Emails" (id, address, "sebasBarId") FROM stdin;
\.


--
-- Data for Name: Phones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Phones" (id, number, "sebasBarId") FROM stdin;
\.


--
-- Data for Name: Pictures; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Pictures" (id, picture, "projectsId") FROM stdin;
1	http://localhost:8000/pics/Projects/LittleCrushingCars/LittleCrushingCars.png	1
2	http://localhost:8000/pics/Projects/TechLodge/TechLodge.png	2
3	http://localhost:8000/pics/Projects/BestShop/BestShop.png	3
4	http://localhost:8000/pics/Projects/CellularAutomata/CellularAutomata.png	4
\.


--
-- Data for Name: Projects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Projects" (id, name, description, github_link, deployed_link, "sebasBarId", description2, description3) FROM stdin;
1	Little Crushing Cars	This is a game where you have to avoid to crush with the rest of the cars. You move the car with the mouse pointer and every 10 seconds 5 random cars will appear. 		https://drive.google.com/file/d/1PZtImxxW_DivhES0RQMcCff58uvNslQi/view?usp=sharing	\N	I created this game in 2011 using Processing when I was working with Arduino. 	The game works only in windows. To play the game, you have to have Java JDK installed, then extract the files (it is 2 times compressed to avoid the antivirus warnings from windows). Then you just execute the sketch_aug11a.exe.
2	Tech Lodge	This is my first website created for a fictitious company called Tech Lodge that focus on providing to startups and technology companies with the ideal space to boost their creativity in a natural and beautiful environment, with access to high-end communications and the best technological resources. 	https://github.com/SebasBar/techLodge	https://sebasbar.github.io/techLodge/index.html	\N	The site uses HTML, CSS and JavaScript. JS is used in the packages page to check for the options the user selects, to delete the selection, in the contact page to validate the email the user enters and to save the information in a local file.	This site is deployed on Github.
4	Cellular Automata			\N	\N	\N	\N
3	Best Shop	This website uses Ebay API to show products, have favorite products and ....		\N	\N	\N	\N
\.


--
-- Data for Name: SebasBar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SebasBar" (id, first_name, last_name, picture, github_page, profile) FROM stdin;
\.


--
-- Data for Name: Social_Networks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Social_Networks" (id, name, address, "sebasBarId") FROM stdin;
\.


--
-- Data for Name: Special_Knowledge; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Special_Knowledge" (id, name, description, "sebasBarId") FROM stdin;
\.


--
-- Data for Name: Teamates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Teamates" (id, name, github_link) FROM stdin;
1	Guillherme Caeiro	https://github.com/GuilhermeC18
2	Sofia Duran	https://github.com/duranSofia
\.


--
-- Data for Name: Tech_Lang; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Tech_Lang" (id, name, description) FROM stdin;
1	Java	Java is a class-based, object-oriented programming language that is designed to have as few implementation dependencies as possible.
2	Processing	Processing is a flexible software sketchbook and a language for learning how to code within the context of the visual arts.
4	CSS	Cascading Style Sheets (CSS) is a style sheet language used for describing the presentation of a document written in a markup language such as HTML.
3	HTML	The HyperText Markup Language, or HTML(HyperText Markup Language) is the standard markup language for documents designed to be displayed in a web browser.
5	JavaScript	JavaScript is a programming language that conforms to the ECMAScript specification.[9] JavaScript is high-level, often just-in-time compiled, and multi-paradigm.
\.


--
-- Data for Name: Work_Experience; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Work_Experience" (id, company_name, "position", description, "time", "sebasBarId") FROM stdin;
\.


--
-- Data for Name: _ClientsToProjects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."_ClientsToProjects" ("A", "B") FROM stdin;
1	1
2	2
\.


--
-- Data for Name: _ProjectsToTeamates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."_ProjectsToTeamates" ("A", "B") FROM stdin;
2	1
2	2
\.


--
-- Data for Name: _ProjectsToTech_Lang; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."_ProjectsToTech_Lang" ("A", "B") FROM stdin;
1	1
1	2
2	3
2	4
2	5
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
471f232a-f89c-4d47-be5f-d6d624355fe0	d9f2ba8a11441a1d7249b219d49bfe27010ac62345ddf165eafe6fd127bd2da	2021-03-29 17:05:39.580131+02	20210208174959_1st	\N	\N	2021-03-29 17:05:39.254428+02	1
1dc717a7-ff62-472d-9bdb-62129a7d90e2	ac96ae7855afab018422fec5580d0fb456ebdd4caedb510926f94bbcd159f	2021-03-29 17:05:39.589824+02	20210210153934_2nd	\N	\N	2021-03-29 17:05:39.582527+02	1
6086ccf6-8bca-4f7e-a5bb-51fdaab9e6df	dbd18990aef979d8c79fd87723d3306f7239cf91626fa6cd8dfab6fe186c15	2021-03-29 17:05:39.600448+02	20210219150533_3rd	\N	\N	2021-03-29 17:05:39.592801+02	1
3233c6f6-a1c3-45c8-9f0d-544eae93c7a6	a61f279482fa2a6d050ccf64a7eb4eabe03cf297303e3f8ec4ef4c82534	2021-03-29 17:05:39.624595+02	20210219165148_4th	\N	\N	2021-03-29 17:05:39.603064+02	1
\.


--
-- Name: Clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Clients_id_seq"', 2, true);


--
-- Name: Credentials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Credentials_id_seq"', 1, true);


--
-- Name: Documents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Documents_id_seq"', 1, false);


--
-- Name: Education_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Education_id_seq"', 1, false);


--
-- Name: Emails_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Emails_id_seq"', 1, false);


--
-- Name: Phones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Phones_id_seq"', 1, false);


--
-- Name: Pictures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Pictures_id_seq"', 4, true);


--
-- Name: Projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Projects_id_seq"', 4, true);


--
-- Name: SebasBar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SebasBar_id_seq"', 1, false);


--
-- Name: Social_Networks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Social_Networks_id_seq"', 1, false);


--
-- Name: Special_Knowledge_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Special_Knowledge_id_seq"', 1, false);


--
-- Name: Teamates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Teamates_id_seq"', 2, true);


--
-- Name: Tech_Lang_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Tech_Lang_id_seq"', 5, true);


--
-- Name: Work_Experience_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Work_Experience_id_seq"', 1, false);


--
-- Name: Clients Clients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Clients"
    ADD CONSTRAINT "Clients_pkey" PRIMARY KEY (id);


--
-- Name: Credentials Credentials_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Credentials"
    ADD CONSTRAINT "Credentials_pkey" PRIMARY KEY (id);


--
-- Name: Documents Documents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Documents"
    ADD CONSTRAINT "Documents_pkey" PRIMARY KEY (id);


--
-- Name: Education Education_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Education"
    ADD CONSTRAINT "Education_pkey" PRIMARY KEY (id);


--
-- Name: Emails Emails_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Emails"
    ADD CONSTRAINT "Emails_pkey" PRIMARY KEY (id);


--
-- Name: Phones Phones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Phones"
    ADD CONSTRAINT "Phones_pkey" PRIMARY KEY (id);


--
-- Name: Pictures Pictures_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pictures"
    ADD CONSTRAINT "Pictures_pkey" PRIMARY KEY (id);


--
-- Name: Projects Projects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Projects"
    ADD CONSTRAINT "Projects_pkey" PRIMARY KEY (id);


--
-- Name: SebasBar SebasBar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SebasBar"
    ADD CONSTRAINT "SebasBar_pkey" PRIMARY KEY (id);


--
-- Name: Social_Networks Social_Networks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Social_Networks"
    ADD CONSTRAINT "Social_Networks_pkey" PRIMARY KEY (id);


--
-- Name: Special_Knowledge Special_Knowledge_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Special_Knowledge"
    ADD CONSTRAINT "Special_Knowledge_pkey" PRIMARY KEY (id);


--
-- Name: Teamates Teamates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Teamates"
    ADD CONSTRAINT "Teamates_pkey" PRIMARY KEY (id);


--
-- Name: Tech_Lang Tech_Lang_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tech_Lang"
    ADD CONSTRAINT "Tech_Lang_pkey" PRIMARY KEY (id);


--
-- Name: Work_Experience Work_Experience_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Work_Experience"
    ADD CONSTRAINT "Work_Experience_pkey" PRIMARY KEY (id);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: _ClientsToProjects_AB_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "_ClientsToProjects_AB_unique" ON public."_ClientsToProjects" USING btree ("A", "B");


--
-- Name: _ClientsToProjects_B_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "_ClientsToProjects_B_index" ON public."_ClientsToProjects" USING btree ("B");


--
-- Name: _ProjectsToTeamates_AB_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "_ProjectsToTeamates_AB_unique" ON public."_ProjectsToTeamates" USING btree ("A", "B");


--
-- Name: _ProjectsToTeamates_B_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "_ProjectsToTeamates_B_index" ON public."_ProjectsToTeamates" USING btree ("B");


--
-- Name: _ProjectsToTech_Lang_AB_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "_ProjectsToTech_Lang_AB_unique" ON public."_ProjectsToTech_Lang" USING btree ("A", "B");


--
-- Name: _ProjectsToTech_Lang_B_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "_ProjectsToTech_Lang_B_index" ON public."_ProjectsToTech_Lang" USING btree ("B");


--
-- Name: Documents Documents_sebasBarId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Documents"
    ADD CONSTRAINT "Documents_sebasBarId_fkey" FOREIGN KEY ("sebasBarId") REFERENCES public."SebasBar"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Education Education_sebasBarId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Education"
    ADD CONSTRAINT "Education_sebasBarId_fkey" FOREIGN KEY ("sebasBarId") REFERENCES public."SebasBar"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Emails Emails_sebasBarId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Emails"
    ADD CONSTRAINT "Emails_sebasBarId_fkey" FOREIGN KEY ("sebasBarId") REFERENCES public."SebasBar"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Phones Phones_sebasBarId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Phones"
    ADD CONSTRAINT "Phones_sebasBarId_fkey" FOREIGN KEY ("sebasBarId") REFERENCES public."SebasBar"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Pictures Pictures_projectsId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pictures"
    ADD CONSTRAINT "Pictures_projectsId_fkey" FOREIGN KEY ("projectsId") REFERENCES public."Projects"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Projects Projects_sebasBarId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Projects"
    ADD CONSTRAINT "Projects_sebasBarId_fkey" FOREIGN KEY ("sebasBarId") REFERENCES public."SebasBar"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Social_Networks Social_Networks_sebasBarId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Social_Networks"
    ADD CONSTRAINT "Social_Networks_sebasBarId_fkey" FOREIGN KEY ("sebasBarId") REFERENCES public."SebasBar"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Special_Knowledge Special_Knowledge_sebasBarId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Special_Knowledge"
    ADD CONSTRAINT "Special_Knowledge_sebasBarId_fkey" FOREIGN KEY ("sebasBarId") REFERENCES public."SebasBar"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Work_Experience Work_Experience_sebasBarId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Work_Experience"
    ADD CONSTRAINT "Work_Experience_sebasBarId_fkey" FOREIGN KEY ("sebasBarId") REFERENCES public."SebasBar"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: _ClientsToProjects _ClientsToProjects_A_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."_ClientsToProjects"
    ADD CONSTRAINT "_ClientsToProjects_A_fkey" FOREIGN KEY ("A") REFERENCES public."Clients"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: _ClientsToProjects _ClientsToProjects_B_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."_ClientsToProjects"
    ADD CONSTRAINT "_ClientsToProjects_B_fkey" FOREIGN KEY ("B") REFERENCES public."Projects"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: _ProjectsToTeamates _ProjectsToTeamates_A_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."_ProjectsToTeamates"
    ADD CONSTRAINT "_ProjectsToTeamates_A_fkey" FOREIGN KEY ("A") REFERENCES public."Projects"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: _ProjectsToTeamates _ProjectsToTeamates_B_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."_ProjectsToTeamates"
    ADD CONSTRAINT "_ProjectsToTeamates_B_fkey" FOREIGN KEY ("B") REFERENCES public."Teamates"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: _ProjectsToTech_Lang _ProjectsToTech_Lang_A_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."_ProjectsToTech_Lang"
    ADD CONSTRAINT "_ProjectsToTech_Lang_A_fkey" FOREIGN KEY ("A") REFERENCES public."Projects"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: _ProjectsToTech_Lang _ProjectsToTech_Lang_B_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."_ProjectsToTech_Lang"
    ADD CONSTRAINT "_ProjectsToTech_Lang_B_fkey" FOREIGN KEY ("B") REFERENCES public."Tech_Lang"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

