--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.7
-- Dumped by pg_dump version 9.5.7

-- Started on 2019-10-23 13:13:55 BRST

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
-- TOC entry 2180 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 17874)
-- Name: agendamento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE agendamento (
    ida integer NOT NULL,
    id_quadra_ida integer NOT NULL,
    data_uso timestamp with time zone,
    id_usuario_ida integer NOT NULL,
    aprovacao character varying
);


ALTER TABLE agendamento OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 17883)
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
-- TOC entry 183 (class 1259 OID 17889)
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
-- TOC entry 184 (class 1259 OID 17891)
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
-- TOC entry 185 (class 1259 OID 17893)
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
-- TOC entry 186 (class 1259 OID 17895)
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
-- TOC entry 187 (class 1259 OID 17901)
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
-- TOC entry 2166 (class 0 OID 17874)
-- Dependencies: 181
-- Data for Name: agendamento; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2167 (class 0 OID 17883)
-- Dependencies: 182
-- Data for Name: quadras; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2181 (class 0 OID 0)
-- Dependencies: 183
-- Name: sq_quadra; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_quadra', 11, true);


--
-- TOC entry 2182 (class 0 OID 0)
-- Dependencies: 184
-- Name: sq_usuario; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_usuario', 13, true);


--
-- TOC entry 2183 (class 0 OID 0)
-- Dependencies: 185
-- Name: sq_usuarioadm; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_usuarioadm', 1, true);


--
-- TOC entry 2171 (class 0 OID 17895)
-- Dependencies: 186
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--




--
-- TOC entry 2172 (class 0 OID 17901)
-- Dependencies: 187
-- Data for Name: usuarioadm; Type: TABLE DATA; Schema: public; Owner: postgres
--




--
-- TOC entry 2045 (class 2606 OID 17908)
-- Name: pk_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT pk_id PRIMARY KEY (id);


--
-- TOC entry 2041 (class 2606 OID 17910)
-- Name: pk_ida; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY agendamento
    ADD CONSTRAINT pk_ida PRIMARY KEY (ida);


--
-- TOC entry 2049 (class 2606 OID 17912)
-- Name: pk_idadm; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuarioadm
    ADD CONSTRAINT pk_idadm PRIMARY KEY (id);


--
-- TOC entry 2043 (class 2606 OID 17914)
-- Name: pk_idquadra; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY quadras
    ADD CONSTRAINT pk_idquadra PRIMARY KEY (id);


--
-- TOC entry 2047 (class 2606 OID 17916)
-- Name: unique_email; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT unique_email UNIQUE (email);


--
-- TOC entry 2038 (class 1259 OID 17935)
-- Name: fki_quadra_ida; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_quadra_ida ON agendamento USING btree (id_quadra_ida);


--
-- TOC entry 2039 (class 1259 OID 17941)
-- Name: fki_usuario_ida; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_usuario_ida ON agendamento USING btree (id_usuario_ida);


--
-- TOC entry 2050 (class 2606 OID 17930)
-- Name: fk_quadra_ida; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY agendamento
    ADD CONSTRAINT fk_quadra_ida FOREIGN KEY (id_quadra_ida) REFERENCES quadras(id);


--
-- TOC entry 2051 (class 2606 OID 17936)
-- Name: fk_usuario_ida; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY agendamento
    ADD CONSTRAINT fk_usuario_ida FOREIGN KEY (id_usuario_ida) REFERENCES usuario(id);


--
-- TOC entry 2179 (class 0 OID 0)
-- Dependencies: 7
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2019-10-23 13:13:56 BRST

--
-- PostgreSQL database dump complete
--

