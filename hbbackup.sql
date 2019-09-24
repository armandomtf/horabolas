--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.19
-- Dumped by pg_dump version 9.5.19

-- Started on 2019-09-20 23:38:12 BRT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12395)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2169 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 185 (class 1259 OID 16404)
-- Name: quadras; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.quadras (
    nome character varying(40),
    id integer NOT NULL,
    imagem bytea,
    descricao character varying
);


ALTER TABLE public.quadras OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 16412)
-- Name: sq_quadra; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sq_quadra
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sq_quadra OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 16385)
-- Name: sq_usuario; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sq_usuario
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sq_usuario OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 16387)
-- Name: sq_usuarioadm; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sq_usuarioadm
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sq_usuarioadm OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 16389)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    id integer NOT NULL,
    nome character varying,
    email character varying,
    senha character varying
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 16395)
-- Name: usuarioadm; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarioadm (
    senha character varying(20) NOT NULL,
    id integer NOT NULL,
    nome character varying(50) NOT NULL,
    email character varying(100) NOT NULL
);


ALTER TABLE public.usuarioadm OWNER TO postgres;

--
-- TOC entry 2159 (class 0 OID 16404)
-- Dependencies: 185
-- Data for Name: quadras; Type: TABLE DATA; Schema: public; Owner: postgres
--


--
-- TOC entry 2170 (class 0 OID 0)
-- Dependencies: 186
-- Name: sq_quadra; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sq_quadra', 1, false);


--
-- TOC entry 2171 (class 0 OID 0)
-- Dependencies: 181
-- Name: sq_usuario; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sq_usuario', 9, true);


--
-- TOC entry 2172 (class 0 OID 0)
-- Dependencies: 182
-- Name: sq_usuarioadm; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sq_usuarioadm', 1, true);


--
-- TOC entry 2157 (class 0 OID 16389)
-- Dependencies: 183
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--


--
-- TOC entry 2158 (class 0 OID 16395)
-- Dependencies: 184
-- Data for Name: usuarioadm; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2034 (class 2606 OID 16399)
-- Name: pk_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT pk_id PRIMARY KEY (id);


--
-- TOC entry 2038 (class 2606 OID 16401)
-- Name: pk_idadm; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarioadm
    ADD CONSTRAINT pk_idadm PRIMARY KEY (id);


--
-- TOC entry 2040 (class 2606 OID 16408)
-- Name: pk_idquadra; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quadras
    ADD CONSTRAINT pk_idquadra PRIMARY KEY (id);


--
-- TOC entry 2036 (class 2606 OID 16403)
-- Name: unique_email; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT unique_email UNIQUE (email);


--
-- TOC entry 2168 (class 0 OID 0)
-- Dependencies: 7
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2019-09-20 23:38:13 BRT

--
-- PostgreSQL database dump complete
--

