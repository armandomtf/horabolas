--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.7
-- Dumped by pg_dump version 9.5.7

-- Started on 2019-09-18 12:05:13 BRT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12395)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2155 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- TOC entry 181 (class 1259 OID 41635)
-- Name: sq_usuario; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_usuario
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sq_usuario OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 41650)
-- Name: sq_usuarioadm; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_usuarioadm
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sq_usuarioadm OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 182 (class 1259 OID 41637)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE usuario (
    id integer NOT NULL,
    nome character varying,
    email character varying,
    senha character varying
);


ALTER TABLE usuario OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 41645)
-- Name: usuarioadm; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE usuarioadm (
    senha character varying(20) NOT NULL,
    id integer NOT NULL,
    nome character varying(50) NOT NULL,
    email character varying(100) NOT NULL
);


ALTER TABLE usuarioadm OWNER TO postgres;

--
-- TOC entry 2156 (class 0 OID 0)
-- Dependencies: 181
-- Name: sq_usuario; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_usuario', 8, true);


--
-- TOC entry 2157 (class 0 OID 0)
-- Dependencies: 184
-- Name: sq_usuarioadm; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_usuarioadm', 1, false);


--
-- TOC entry 2145 (class 0 OID 41637)
-- Dependencies: 182
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY usuario (id, nome, email, senha) FROM stdin;
301	BRIAN MATADOR	brian@gmail.com	123
302	toni mica	antoni@gmail.com	1234
303	miguelzin fred	miguel@gmail.com	123
350	TATA ZUANDO	talis@gmail.com	123
351	PC	pc@gmail.com	123
400	higuita	higuita@gmail.com	1234567
\.


--
-- TOC entry 2146 (class 0 OID 41645)
-- Dependencies: 183
-- Data for Name: usuarioadm; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY usuarioadm (senha, id, nome, email) FROM stdin;
\.


--
-- TOC entry 2027 (class 2606 OID 41644)
-- Name: pk_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT pk_id PRIMARY KEY (id);


--
-- TOC entry 2029 (class 2606 OID 41649)
-- Name: pk_idadm; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuarioadm
    ADD CONSTRAINT pk_idadm PRIMARY KEY (id);


--
-- TOC entry 2154 (class 0 OID 0)
-- Dependencies: 7
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2019-09-18 12:05:13 BRT

--
-- PostgreSQL database dump complete
--

