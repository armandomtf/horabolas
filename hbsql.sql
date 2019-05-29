--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.7
-- Dumped by pg_dump version 9.5.7

-- Started on 2019-05-29 08:58:08 BRT

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
-- TOC entry 2169 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 41207)
-- Name: agendamento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE agendamento (
    dt_agendamento date NOT NULL,
    tm_inicial time with time zone,
    tm_final time with time zone,
    id_aprovado boolean,
    grupo_cd_grupo integer,
    usuario_cd_usuario integer
);


ALTER TABLE agendamento OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 41210)
-- Name: grupos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE grupos (
    cd_nome_grupo integer NOT NULL,
    dt_data date,
    tm_hora time with time zone,
    usuario_cd_usuario integer
);


ALTER TABLE grupos OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 41213)
-- Name: quadras; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE quadras (
    tm_hrdispinicial time with time zone,
    tm_hrdispfinal time with time zone,
    cd_codquadra integer NOT NULL
);


ALTER TABLE quadras OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 41216)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE usuario (
    cd_usuario integer NOT NULL,
    ds_password character varying,
    ds_email character varying,
    ds_cpf integer
);


ALTER TABLE usuario OWNER TO postgres;

--
-- TOC entry 2158 (class 0 OID 41207)
-- Dependencies: 181
-- Data for Name: agendamento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY agendamento (dt_agendamento, tm_inicial, tm_final, id_aprovado, grupo_cd_grupo, usuario_cd_usuario) FROM stdin;
\.


--
-- TOC entry 2159 (class 0 OID 41210)
-- Dependencies: 182
-- Data for Name: grupos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY grupos (cd_nome_grupo, dt_data, tm_hora, usuario_cd_usuario) FROM stdin;
\.


--
-- TOC entry 2160 (class 0 OID 41213)
-- Dependencies: 183
-- Data for Name: quadras; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY quadras (tm_hrdispinicial, tm_hrdispfinal, cd_codquadra) FROM stdin;
\.


--
-- TOC entry 2161 (class 0 OID 41216)
-- Dependencies: 184
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY usuario (cd_usuario, ds_password, ds_email, ds_cpf) FROM stdin;
\.


--
-- TOC entry 2033 (class 2606 OID 41223)
-- Name: pk_codagendamento; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY agendamento
    ADD CONSTRAINT pk_codagendamento PRIMARY KEY (dt_agendamento);


--
-- TOC entry 2036 (class 2606 OID 41225)
-- Name: pk_codgrupo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY grupos
    ADD CONSTRAINT pk_codgrupo PRIMARY KEY (cd_nome_grupo);


--
-- TOC entry 2038 (class 2606 OID 41227)
-- Name: pk_codquadra; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY quadras
    ADD CONSTRAINT pk_codquadra PRIMARY KEY (cd_codquadra);


--
-- TOC entry 2040 (class 2606 OID 41229)
-- Name: pk_codusuario; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT pk_codusuario PRIMARY KEY (cd_usuario);


--
-- TOC entry 2030 (class 1259 OID 41232)
-- Name: fki_codgrupo2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_codgrupo2 ON agendamento USING btree (grupo_cd_grupo);


--
-- TOC entry 2031 (class 1259 OID 41233)
-- Name: fki_codusario2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_codusario2 ON agendamento USING btree (usuario_cd_usuario);


--
-- TOC entry 2034 (class 1259 OID 41234)
-- Name: fki_codusuario; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_codusuario ON grupos USING btree (usuario_cd_usuario);


--
-- TOC entry 2041 (class 2606 OID 41235)
-- Name: fk_codgrupo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY agendamento
    ADD CONSTRAINT fk_codgrupo FOREIGN KEY (grupo_cd_grupo) REFERENCES grupos(cd_nome_grupo);


--
-- TOC entry 2043 (class 2606 OID 41240)
-- Name: fk_codusuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY grupos
    ADD CONSTRAINT fk_codusuario FOREIGN KEY (usuario_cd_usuario) REFERENCES usuario(cd_usuario);


--
-- TOC entry 2042 (class 2606 OID 41245)
-- Name: fk_codusuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY agendamento
    ADD CONSTRAINT fk_codusuario FOREIGN KEY (usuario_cd_usuario) REFERENCES usuario(cd_usuario);


--
-- TOC entry 2168 (class 0 OID 0)
-- Dependencies: 7
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2019-05-29 08:58:08 BRT

--
-- PostgreSQL database dump complete
--

