--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4 (Ubuntu 14.4-1.pgdg20.04+1)
-- Dumped by pg_dump version 14.4 (Ubuntu 14.4-1.pgdg20.04+1)

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
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: disciplines; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.disciplines (
    id integer NOT NULL,
    name text NOT NULL,
    "termId" integer NOT NULL
);


ALTER TABLE public.disciplines OWNER TO postgres;

--
-- Name: disciplines_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.disciplines_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.disciplines_id_seq OWNER TO postgres;

--
-- Name: disciplines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.disciplines_id_seq OWNED BY public.disciplines.id;


--
-- Name: teachers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teachers (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.teachers OWNER TO postgres;

--
-- Name: teachersDisciplines; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."teachersDisciplines" (
    id integer NOT NULL,
    "teacherId" integer NOT NULL,
    "disciplineId" integer NOT NULL
);


ALTER TABLE public."teachersDisciplines" OWNER TO postgres;

--
-- Name: teachersDisciplines_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."teachersDisciplines_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."teachersDisciplines_id_seq" OWNER TO postgres;

--
-- Name: teachersDisciplines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."teachersDisciplines_id_seq" OWNED BY public."teachersDisciplines".id;


--
-- Name: teachers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.teachers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teachers_id_seq OWNER TO postgres;

--
-- Name: teachers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.teachers_id_seq OWNED BY public.teachers.id;


--
-- Name: terms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.terms (
    id integer NOT NULL,
    number text NOT NULL
);


ALTER TABLE public.terms OWNER TO postgres;

--
-- Name: terms_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.terms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.terms_id_seq OWNER TO postgres;

--
-- Name: terms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.terms_id_seq OWNED BY public.terms.id;


--
-- Name: tests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tests (
    id integer NOT NULL,
    name text NOT NULL,
    "pdfUrl" text NOT NULL,
    "categoryId" integer NOT NULL,
    "teacherDisciplineId" integer NOT NULL
);


ALTER TABLE public.tests OWNER TO postgres;

--
-- Name: tests_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tests_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tests_id_seq OWNER TO postgres;

--
-- Name: tests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tests_id_seq OWNED BY public.tests.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email text NOT NULL,
    password text NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: disciplines id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disciplines ALTER COLUMN id SET DEFAULT nextval('public.disciplines_id_seq'::regclass);


--
-- Name: teachers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers ALTER COLUMN id SET DEFAULT nextval('public.teachers_id_seq'::regclass);


--
-- Name: teachersDisciplines id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."teachersDisciplines" ALTER COLUMN id SET DEFAULT nextval('public."teachersDisciplines_id_seq"'::regclass);


--
-- Name: terms id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.terms ALTER COLUMN id SET DEFAULT nextval('public.terms_id_seq'::regclass);


--
-- Name: tests id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tests ALTER COLUMN id SET DEFAULT nextval('public.tests_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
a7b71867-3f98-4997-adba-64dde3fb0eb3	f6683ec8904ac4a52b7bf190ec44030e5d759b5015c8659787ee3388be9fe5b4	2022-09-13 16:10:54.757751-03	20220913184016_created_users_table	\N	\N	2022-09-13 16:10:54.641616-03	1
4b25d2a0-4d59-461b-8b8b-59a84413c612	0c4295639e697844618484e6f801ed3da2353414994c36546fa68555a048f644	2022-09-13 16:10:54.892007-03	20220913184259_created_categories_table	\N	\N	2022-09-13 16:10:54.76621-03	1
5bac86b2-d9b1-491f-9add-6e36ce530a22	71f0c729537ad38c4df85bd80e325138b305c5ea1ae221baeadd3d6704f83917	2022-09-13 16:10:55.083222-03	20220913184418_created_teachers_table	\N	\N	2022-09-13 16:10:54.899704-03	1
dc31e25c-4e48-42b6-bea4-58d8864d5887	639f100175c0a5f14789a708fada0be32a553e48e9deea3626a6b5d4c449695f	2022-09-13 16:10:55.392121-03	20220913184623_created_terms_table	\N	\N	2022-09-13 16:10:55.091673-03	1
fc3d9b35-2e46-4cf9-bd73-9797b234214a	cdf7bdad7ba2e949b2c4dde407d78f4b04cdc646939ac580714550b91ebe5b08	2022-09-13 16:10:55.56744-03	20220913184806_created_disciplines_table	\N	\N	2022-09-13 16:10:55.40056-03	1
10fd0e6b-0222-46c9-b19b-5fbbdafccc47	89bc0932775592b727cc80684d263bc65d4a1211f5020f34f815a90b759053ff	2022-09-13 16:10:55.634447-03	20220913185108_created_teacherdispline_table	\N	\N	2022-09-13 16:10:55.575874-03	1
239959a1-d25e-42b6-a5ad-6df9bc54b255	e1b229ebdfd07342bf7576292ac24db379191a6367440b303320fa26a74320e0	2022-09-13 16:10:55.759676-03	20220913185405_created_tests_table	\N	\N	2022-09-13 16:10:55.642829-03	1
ccc1a59e-caa2-4e4b-961e-a3d7ec0e76bb	ae97c8e659a4f92a864342bdfa1351a6a4840870af009bd7117c25b21bef134a	2022-09-13 16:11:04.097495-03	20220913191104_fixed_tables	\N	\N	2022-09-13 16:11:04.017865-03	1
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, name) FROM stdin;
1	Projeto
2	Prática
3	Recuperação
\.


--
-- Data for Name: disciplines; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.disciplines (id, name, "termId") FROM stdin;
1	HTML e CSS	1
2	JavaScript	2
3	React	3
4	Humildade	1
5	Planejamento	2
6	Autoconfiança	3
\.


--
-- Data for Name: teachers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teachers (id, name) FROM stdin;
1	Diego Pinho
2	Bruna Hamori
\.


--
-- Data for Name: teachersDisciplines; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."teachersDisciplines" (id, "teacherId", "disciplineId") FROM stdin;
1	1	1
2	1	2
3	1	3
4	2	4
5	2	5
6	2	6
\.


--
-- Data for Name: terms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.terms (id, number) FROM stdin;
1	1
2	2
3	3
4	4
5	5
6	6
\.


--
-- Data for Name: tests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tests (id, name, "pdfUrl", "categoryId", "teacherDisciplineId") FROM stdin;
1	prova de geografia	https://bdor.sibi.ufrj.br/bitstream/doc/122/4/83%20PDF%20-%20OCR%20-%20RED.pdf	1	1
2	prova de geografia	https://bdor.sibi.ufrj.br/bitstream/doc/122/4/83%20PDF%20-%20OCR%20-%20RED.pdf	1	1
3	prova de geografia	https://bdor.sibi.ufrj.br/bitstream/doc/122/4/83%20PDF%20-%20OCR%20-%20RED.pdf	1	1
4	prova de geografia	https://bdor.sibi.ufrj.br/bitstream/doc/122/4/83%20PDF%20-%20OCR%20-%20RED.pdf	1	1
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, password) FROM stdin;
20	bia@gmail.com	$2b$10$U9gYHhKOo1MernnS8t0e7O3BHNoF0aAfkXuJ1IDiR.cxPLh1K3tSK
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 3, true);


--
-- Name: disciplines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.disciplines_id_seq', 6, true);


--
-- Name: teachersDisciplines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."teachersDisciplines_id_seq"', 6, true);


--
-- Name: teachers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teachers_id_seq', 2, true);


--
-- Name: terms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.terms_id_seq', 6, true);


--
-- Name: tests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tests_id_seq', 4, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 20, true);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: disciplines disciplines_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disciplines
    ADD CONSTRAINT disciplines_pkey PRIMARY KEY (id);


--
-- Name: teachersDisciplines teachersDiscipline_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."teachersDisciplines"
    ADD CONSTRAINT "teachersDiscipline_pkey" PRIMARY KEY (id);


--
-- Name: teachers teachers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teachers_pkey PRIMARY KEY (id);


--
-- Name: terms terms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.terms
    ADD CONSTRAINT terms_pkey PRIMARY KEY (id);


--
-- Name: tests tests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tests
    ADD CONSTRAINT tests_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: categories_name_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX categories_name_key ON public.categories USING btree (name);


--
-- Name: disciplines_name_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX disciplines_name_key ON public.disciplines USING btree (name);


--
-- Name: teachers_name_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX teachers_name_key ON public.teachers USING btree (name);


--
-- Name: terms_number_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX terms_number_key ON public.terms USING btree (number);


--
-- Name: users_email_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX users_email_key ON public.users USING btree (email);


--
-- Name: disciplines disciplines_termId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disciplines
    ADD CONSTRAINT "disciplines_termId_fkey" FOREIGN KEY ("termId") REFERENCES public.terms(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: teachersDisciplines teachersDiscipline_disciplineId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."teachersDisciplines"
    ADD CONSTRAINT "teachersDiscipline_disciplineId_fkey" FOREIGN KEY ("disciplineId") REFERENCES public.disciplines(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: teachersDisciplines teachersDiscipline_teacherId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."teachersDisciplines"
    ADD CONSTRAINT "teachersDiscipline_teacherId_fkey" FOREIGN KEY ("teacherId") REFERENCES public.teachers(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: tests tests_categoryId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tests
    ADD CONSTRAINT "tests_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES public.categories(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: tests tests_teacherDisciplineId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tests
    ADD CONSTRAINT "tests_teacherDisciplineId_fkey" FOREIGN KEY ("teacherDisciplineId") REFERENCES public."teachersDisciplines"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

