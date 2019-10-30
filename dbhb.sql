--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.7
-- Dumped by pg_dump version 9.5.7

-- Started on 2019-10-30 11:20:58 BRST

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
-- TOC entry 2183 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 18016)
-- Name: agendamento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE agendamento (
    ida integer NOT NULL,
    id_quadra_ida integer NOT NULL,
    data_uso timestamp with time zone,
    id_usuario_ida integer NOT NULL,
    aprovacao character varying,
    data_quadra character varying
);


ALTER TABLE agendamento OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 18022)
-- Name: quadras; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE quadras (
    nome character varying(40),
    id integer NOT NULL,
    descricao character varying,
    foto bytea,
    extensao text
);


ALTER TABLE quadras OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 18065)
-- Name: sq_agendamento; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_agendamento
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sq_agendamento OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 18028)
-- Name: sq_quadra; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_quadra
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sq_quadra OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 18030)
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
-- TOC entry 185 (class 1259 OID 18032)
-- Name: sq_usuarioadm; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_usuarioadm
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sq_usuarioadm OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 18034)
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
-- TOC entry 187 (class 1259 OID 18040)
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
-- TOC entry 2168 (class 0 OID 18016)
-- Dependencies: 181
-- Data for Name: agendamento; Type: TABLE DATA; Schema: public; Owner: postgres
--




--
-- TOC entry 2169 (class 0 OID 18022)
-- Dependencies: 182
-- Data for Name: quadras; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2184 (class 0 OID 0)
-- Dependencies: 188
-- Name: sq_agendamento; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_agendamento', 1, false);


--
-- TOC entry 2185 (class 0 OID 0)
-- Dependencies: 183
-- Name: sq_quadra; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_quadra', 15, true);


--
-- TOC entry 2186 (class 0 OID 0)
-- Dependencies: 184
-- Name: sq_usuario; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_usuario', 14, true);


--
-- TOC entry 2187 (class 0 OID 0)
-- Dependencies: 185
-- Name: sq_usuarioadm; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_usuarioadm', 1, true);


--
-- TOC entry 2173 (class 0 OID 18034)
-- Dependencies: 186
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--




--
-- TOC entry 2174 (class 0 OID 18040)
-- Dependencies: 187
-- Data for Name: usuarioadm; Type: TABLE DATA; Schema: public; Owner: postgres
--




--
-- TOC entry 2047 (class 2606 OID 18044)
-- Name: pk_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT pk_id PRIMARY KEY (id);


--
-- TOC entry 2043 (class 2606 OID 18046)
-- Name: pk_ida; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY agendamento
    ADD CONSTRAINT pk_ida PRIMARY KEY (ida);


--
-- TOC entry 2051 (class 2606 OID 18048)
-- Name: pk_idadm; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuarioadm
    ADD CONSTRAINT pk_idadm PRIMARY KEY (id);


--
-- TOC entry 2045 (class 2606 OID 18050)
-- Name: pk_idquadra; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY quadras
    ADD CONSTRAINT pk_idquadra PRIMARY KEY (id);


--
-- TOC entry 2049 (class 2606 OID 18052)
-- Name: unique_email; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT unique_email UNIQUE (email);


--
-- TOC entry 2040 (class 1259 OID 18053)
-- Name: fki_quadra_ida; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_quadra_ida ON agendamento USING btree (id_quadra_ida);


--
-- TOC entry 2041 (class 1259 OID 18054)
-- Name: fki_usuario_ida; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_usuario_ida ON agendamento USING btree (id_usuario_ida);


--
-- TOC entry 2052 (class 2606 OID 18055)
-- Name: fk_quadra_ida; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY agendamento
    ADD CONSTRAINT fk_quadra_ida FOREIGN KEY (id_quadra_ida) REFERENCES quadras(id);


--
-- TOC entry 2053 (class 2606 OID 18060)
-- Name: fk_usuario_ida; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY agendamento
    ADD CONSTRAINT fk_usuario_ida FOREIGN KEY (id_usuario_ida) REFERENCES usuario(id);


--
-- TOC entry 2182 (class 0 OID 0)
-- Dependencies: 7
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2019-10-30 11:20:58 BRST

--
-- PostgreSQL database dump complete
--

