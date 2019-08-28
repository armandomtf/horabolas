--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.17
-- Dumped by pg_dump version 9.5.17

-- Started on 2019-07-01 20:34:00 BRT

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
-- TOC entry 1 (class 3079 OID 12397)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2144 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 24640)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    nome character varying(50) UNIQUE,
    nick character varying(20) NOT NULL UNIQUE,
    email character varying(40) UNIQUE,
    senha character varying(20)
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- TOC entry 2135 (class 0 OID 24640)
-- Dependencies: 181
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario (nome, nick, email, senha) FROM stdin;
asdasdaasd	asdasasdas	armandomoraistavares@gmail.com	123123
Armando Tavares	armandomtf	armandomoraistavares@gmail.com	jmze53nj
asdasdasasdas	asdasdasda	aasdasd@asdja.com	\N
armandin	armandin	armandin@armandin.com	\N
Brian Leite	brianoficial	brian2001@gmail.com	12345667
a	a	aasdasd@asdja.com	213
asdas	asdasd	asdasd@gmail.co	jasdasd
\.


--
-- TOC entry 2020 (class 2606 OID 24646)
-- Name: codusuario; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT codusuario PRIMARY KEY (nick);


--
-- TOC entry 2143 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2019-07-01 20:34:00 BRT

--
-- PostgreSQL database dump complete
--

