--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.7
-- Dumped by pg_dump version 9.5.7

-- Started on 2019-06-25 11:24:45 BRT

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
-- TOC entry 2182 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 24969)
-- Name: agendamento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE agendamento (
    cd_agendamento integer NOT NULL,
    usuario_cd_usuario integer NOT NULL,
    quadra_cd_quadra integer NOT NULL,
    dt_criacao date
);


ALTER TABLE agendamento OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 25037)
-- Name: disponibilidade; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE disponibilidade (
    cd_disponibilidade integer NOT NULL,
    cod_quadra integer,
    dt_dia date,
    "tm_hora-inicio" time with time zone,
    "tm_hora-fim" time with time zone
);


ALTER TABLE disponibilidade OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 24972)
-- Name: grupos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE grupos (
    cd_grupo integer NOT NULL,
    ds_name character varying,
    cod_usuario integer NOT NULL
);


ALTER TABLE grupos OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 25012)
-- Name: moderador; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE moderador (
    cd_moderador integer NOT NULL,
    nm_name character varying
);


ALTER TABLE moderador OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 24975)
-- Name: quadras; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE quadras (
    cd_quadra integer NOT NULL,
    nm_name character varying,
    ds_endereco character varying
);


ALTER TABLE quadras OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 24978)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE usuario (
    ds_password character varying,
    ds_email character varying,
    ds_cpf integer,
    nm_name character varying,
    nm_nick character varying,
    cd_usuario integer NOT NULL
);


ALTER TABLE usuario OWNER TO postgres;

--
-- TOC entry 2169 (class 0 OID 24969)
-- Dependencies: 181
-- Data for Name: agendamento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY agendamento (cd_agendamento, usuario_cd_usuario, quadra_cd_quadra, dt_criacao) FROM stdin;
\.


--
-- TOC entry 2174 (class 0 OID 25037)
-- Dependencies: 186
-- Data for Name: disponibilidade; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY disponibilidade (cd_disponibilidade, cod_quadra, dt_dia, "tm_hora-inicio", "tm_hora-fim") FROM stdin;
\.


--
-- TOC entry 2170 (class 0 OID 24972)
-- Dependencies: 182
-- Data for Name: grupos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY grupos (cd_grupo, ds_name, cod_usuario) FROM stdin;
\.


--
-- TOC entry 2173 (class 0 OID 25012)
-- Dependencies: 185
-- Data for Name: moderador; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY moderador (cd_moderador, nm_name) FROM stdin;
\.


--
-- TOC entry 2171 (class 0 OID 24975)
-- Dependencies: 183
-- Data for Name: quadras; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY quadras (cd_quadra, nm_name, ds_endereco) FROM stdin;
\.


--
-- TOC entry 2172 (class 0 OID 24978)
-- Dependencies: 184
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY usuario (ds_password, ds_email, ds_cpf, nm_name, nm_nick, cd_usuario) FROM stdin;
\.


--
-- TOC entry 2042 (class 2606 OID 25031)
-- Name: pk_agendamento; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY agendamento
    ADD CONSTRAINT pk_agendamento PRIMARY KEY (cd_agendamento, usuario_cd_usuario, quadra_cd_quadra);


--
-- TOC entry 2044 (class 2606 OID 25041)
-- Name: pk_codgrupo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY grupos
    ADD CONSTRAINT pk_codgrupo PRIMARY KEY (cd_grupo, cod_usuario);


--
-- TOC entry 2046 (class 2606 OID 25043)
-- Name: pk_codquadra; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY quadras
    ADD CONSTRAINT pk_codquadra PRIMARY KEY (cd_quadra);


--
-- TOC entry 2048 (class 2606 OID 25011)
-- Name: pk_codusuario; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT pk_codusuario PRIMARY KEY (cd_usuario);


--
-- TOC entry 2053 (class 2606 OID 25045)
-- Name: pk_disponibilidade; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY disponibilidade
    ADD CONSTRAINT pk_disponibilidade PRIMARY KEY (cd_disponibilidade);


--
-- TOC entry 2050 (class 2606 OID 25019)
-- Name: pk_moderador; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY moderador
    ADD CONSTRAINT pk_moderador PRIMARY KEY (cd_moderador);


--
-- TOC entry 2051 (class 1259 OID 25051)
-- Name: fki_codquadra; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_codquadra ON disponibilidade USING btree (cod_quadra);


--
-- TOC entry 2054 (class 2606 OID 25046)
-- Name: fk_codquadra; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY disponibilidade
    ADD CONSTRAINT fk_codquadra FOREIGN KEY (cod_quadra) REFERENCES quadras(cd_quadra);


--
-- TOC entry 2181 (class 0 OID 0)
-- Dependencies: 7
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2019-06-25 11:24:46 BRT

--
-- PostgreSQL database dump complete
--

