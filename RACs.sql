--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

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

--
-- Name: jk; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.jk AS ENUM (
    'P',
    'L'
);


ALTER TYPE public.jk OWNER TO postgres;

--
-- Name: jns_p; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.jns_p AS ENUM (
    'Debit',
    'Cash'
);


ALTER TYPE public.jns_p OWNER TO postgres;

--
-- Name: status_u; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.status_u AS ENUM (
    'Admin',
    'Karyawan'
);


ALTER TYPE public.status_u OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: bayar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bayar (
    id_b integer NOT NULL,
    jum character varying(50) NOT NULL,
    tgl_b date NOT NULL,
    jns_b public.jns_p NOT NULL,
    foto_b character varying(100),
    id_s integer NOT NULL
);


ALTER TABLE public.bayar OWNER TO postgres;

--
-- Name: bayar_id_b_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bayar_id_b_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bayar_id_b_seq OWNER TO postgres;

--
-- Name: bayar_id_b_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bayar_id_b_seq OWNED BY public.bayar.id_b;


--
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    id_c integer NOT NULL,
    nm_c character varying(50) NOT NULL,
    almt_c character varying(100) NOT NULL,
    telp_c character varying(25) NOT NULL,
    jk_c public.jk NOT NULL,
    ktp_c character varying(50) NOT NULL,
    foto_c character varying(100),
    user_c character varying(25) NOT NULL,
    pass_c text NOT NULL
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- Name: customer_id_c_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_id_c_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_id_c_seq OWNER TO postgres;

--
-- Name: customer_id_c_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_id_c_seq OWNED BY public.customer.id_c;


--
-- Name: mobil; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mobil (
    id_m integer NOT NULL,
    nm_m character varying(50) NOT NULL,
    tarif integer NOT NULL,
    plat character varying(25) NOT NULL,
    merk character varying(25) NOT NULL,
    kapasitas integer NOT NULL,
    foto_m character varying(100),
    stok integer NOT NULL,
    tambahan text
);


ALTER TABLE public.mobil OWNER TO postgres;

--
-- Name: mobil_id_m_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mobil_id_m_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mobil_id_m_seq OWNER TO postgres;

--
-- Name: mobil_id_m_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mobil_id_m_seq OWNED BY public.mobil.id_m;


--
-- Name: sewa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sewa (
    id_s integer NOT NULL,
    tgl_s date NOT NULL,
    awal date NOT NULL,
    akhir date NOT NULL,
    total integer NOT NULL,
    status_s character varying(50) NOT NULL,
    id_c integer NOT NULL,
    id_m integer NOT NULL
);


ALTER TABLE public.sewa OWNER TO postgres;

--
-- Name: sewa_id_s_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sewa_id_s_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sewa_id_s_seq OWNER TO postgres;

--
-- Name: sewa_id_s_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sewa_id_s_seq OWNED BY public.sewa.id_s;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id_u integer NOT NULL,
    nm_u character varying(50) NOT NULL,
    almt_u character varying(100) NOT NULL,
    telp_u character varying(25) NOT NULL,
    jk_u public.jk NOT NULL,
    ktp_u character varying(50) NOT NULL,
    foto_u character varying(100),
    user_u character varying(25) NOT NULL,
    pass_u text NOT NULL,
    status_u public.status_u NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_u_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_u_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_u_seq OWNER TO postgres;

--
-- Name: users_id_u_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_u_seq OWNED BY public.users.id_u;


--
-- Name: bayar id_b; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bayar ALTER COLUMN id_b SET DEFAULT nextval('public.bayar_id_b_seq'::regclass);


--
-- Name: customer id_c; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer ALTER COLUMN id_c SET DEFAULT nextval('public.customer_id_c_seq'::regclass);


--
-- Name: mobil id_m; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mobil ALTER COLUMN id_m SET DEFAULT nextval('public.mobil_id_m_seq'::regclass);


--
-- Name: sewa id_s; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sewa ALTER COLUMN id_s SET DEFAULT nextval('public.sewa_id_s_seq'::regclass);


--
-- Name: users id_u; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id_u SET DEFAULT nextval('public.users_id_u_seq'::regclass);


--
-- Data for Name: bayar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bayar (id_b, jum, tgl_b, jns_b, foto_b, id_s) FROM stdin;
1	6000	2021-06-11	Cash	reg1623486415.jpeg	1
2	60000	2021-06-16	Debit	reg1623555362.png	2
3	60000	2021-06-14	Debit	reg1623558045.jpeg	3
4	60000	2021-06-15	Debit	reg1623559605.jpg	4
5	60000	2021-06-14	Debit	reg1623559772.jpg	5
6	60000	2021-06-15	Debit	reg1623559996.jpg	6
\.


--
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer (id_c, nm_c, almt_c, telp_c, jk_c, ktp_c, foto_c, user_c, pass_c) FROM stdin;
1	Fulkyhariz	bogor	17045	P	085722837555	reg1623485511.jpeg	fulkyhz	d41d8cd98f00b204e9800998ecf8427e
3	Hariz	Kutek	14022	L	085722837555	reg1623555276.jpg	fulkyhariz	25d55ad283aa400af464c76d713c07ad
2	Fulky Hariz Zulkarnaen	Sukabumi	500505	L	085722837555	reg1623557381.png	fulkyhzas	21232f297a57a5a743894a0e4a801fc3
\.


--
-- Data for Name: mobil; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mobil (id_m, nm_m, tarif, plat, merk, kapasitas, foto_m, stok, tambahan) FROM stdin;
2	mclaren	100000	B 1020 UAT	Mclaren	4	reg1623578342.jpg	10	Mobil keren
1	avanza	6000	G 3412 AB	toyota	6	reg1623558203.jpg	11	mobil keluarga
3	Apv	200000	B 1890 GET	Suzuki	7	reg1623578445.jpg	5	Mobil Keluarga
4	Mobil RuSack	3000	B 8023 STF	WrongSocks	4	reg1623578513.jpg	1	Seriusan jangan dipake
\.


--
-- Data for Name: sewa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sewa (id_s, tgl_s, awal, akhir, total, status_s, id_c, id_m) FROM stdin;
1	2021-06-12	2021-06-13	2021-06-14	6000	Selesai	2	1
2	2021-06-13	2021-06-23	2021-07-03	60000	Selesai	3	1
3	2021-06-13	2021-06-07	2021-06-09	12000	Selesai	2	1
4	2021-06-13	2021-06-17	2021-06-19	12000	Selesai	2	1
5	2021-06-13	2021-06-16	2021-06-17	6000	Selesai	2	1
6	2021-06-13	2021-06-19	2021-06-20	6000	Selesai	2	1
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id_u, nm_u, almt_u, telp_u, jk_u, ktp_u, foto_u, user_u, pass_u, status_u) FROM stdin;
1	hariz	cibadak	0987	L	64578	\N	hariz	21232f297a57a5a743894a0e4a801fc3	Karyawan
2	admin	Depok	500505	L	1906355762	\N	admin	21232f297a57a5a743894a0e4a801fc3	Admin
3	Fathur	Depok	081623233445	L	234567890098	reg1623578095.jpg	fathur	c2b1a7a28ace620c96223bf66bd037cf	Karyawan
4	Putri	Tulungagung	081623232452	P	23456789065	reg1623578197.jpg	putri	4093fed663717c843bea100d17fb67c8	Karyawan
5	Nabila	Dumai	087699092345	P	234567834098	reg1623578246.jpg	nabila	652d3266220e0aacb047d3aa6f51f1b0	Karyawan
\.


--
-- Name: bayar_id_b_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bayar_id_b_seq', 6, true);


--
-- Name: customer_id_c_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_id_c_seq', 3, true);


--
-- Name: mobil_id_m_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mobil_id_m_seq', 4, true);


--
-- Name: sewa_id_s_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sewa_id_s_seq', 6, true);


--
-- Name: users_id_u_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_u_seq', 5, true);


--
-- Name: bayar bayar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bayar
    ADD CONSTRAINT bayar_pkey PRIMARY KEY (id_b);


--
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (id_c);


--
-- Name: mobil mobil_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mobil
    ADD CONSTRAINT mobil_pkey PRIMARY KEY (id_m);


--
-- Name: sewa sewa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sewa
    ADD CONSTRAINT sewa_pkey PRIMARY KEY (id_s);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id_u);


--
-- Name: bayar bayar_id_s_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bayar
    ADD CONSTRAINT bayar_id_s_fkey FOREIGN KEY (id_s) REFERENCES public.sewa(id_s);


--
-- Name: sewa sewa_id_c_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sewa
    ADD CONSTRAINT sewa_id_c_fkey FOREIGN KEY (id_c) REFERENCES public.customer(id_c);


--
-- Name: sewa sewa_id_m_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sewa
    ADD CONSTRAINT sewa_id_m_fkey FOREIGN KEY (id_m) REFERENCES public.mobil(id_m);


--
-- PostgreSQL database dump complete
--

