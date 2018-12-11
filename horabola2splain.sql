--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.20
-- Dumped by pg_dump version 9.5.5

-- Started on 2018-12-11 15:17:28

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 11855)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2025 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 173 (class 1259 OID 16481)
-- Name: agendamento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE agendamento (
    dt_agendamento date NOT NULL,
    tm_inicial time with time zone,
    tm_final time with time zone,
    id_aprovado boolean,
    grupo_cd_grupo integer
);


ALTER TABLE agendamento OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 16493)
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
-- TOC entry 175 (class 1259 OID 16502)
-- Name: quadras; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE quadras (
    tm_hrdispinicial time with time zone,
    tm_hrdispfinal time with time zone,
    grupo_cd_grupo integer,
    nm_quadra character varying
);


ALTER TABLE quadras OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 16508)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE usuario (
    cd_usuario integer NOT NULL,
    nm_name character varying,
    ds_password character varying,
    nm_lastname character varying,
    ds_email character varying,
    dt_birth date
);


ALTER TABLE usuario OWNER TO postgres;

--
-- TOC entry 2014 (class 0 OID 16481)
-- Dependencies: 173
-- Data for Name: agendamento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY agendamento (dt_agendamento, tm_inicial, tm_final, id_aprovado, grupo_cd_grupo) FROM stdin;
\.


--
-- TOC entry 2015 (class 0 OID 16493)
-- Dependencies: 174
-- Data for Name: grupos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY grupos (cd_nome_grupo, dt_data, tm_hora, usuario_cd_usuario) FROM stdin;
\.


--
-- TOC entry 2016 (class 0 OID 16502)
-- Dependencies: 175
-- Data for Name: quadras; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY quadras (tm_hrdispinicial, tm_hrdispfinal, grupo_cd_grupo, nm_quadra) FROM stdin;
\.


--
-- TOC entry 2017 (class 0 OID 16508)
-- Dependencies: 176
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY usuario (cd_usuario, nm_name, ds_password, nm_lastname, ds_email, dt_birth) FROM stdin;
\.


--
-- TOC entry 1895 (class 2606 OID 16584)
-- Name: pk_codagendamento; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY agendamento
    ADD CONSTRAINT pk_codagendamento PRIMARY KEY (dt_agendamento);


--
-- TOC entry 1898 (class 2606 OID 16515)
-- Name: pk_codgrupo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY grupos
    ADD CONSTRAINT pk_codgrupo PRIMARY KEY (cd_nome_grupo);


--
-- TOC entry 1901 (class 2606 OID 16517)
-- Name: pk_codusuario; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT pk_codusuario PRIMARY KEY (cd_usuario);


--
-- TOC entry 1899 (class 1259 OID 16519)
-- Name: fki_codgrupo; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_codgrupo ON public.quadras USING btree (grupo_cd_grupo);


--
-- TOC entry 1893 (class 1259 OID 16561)
-- Name: fki_codgrupo2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_codgrupo2 ON public.agendamento USING btree (grupo_cd_grupo);


--
-- TOC entry 1896 (class 1259 OID 16520)
-- Name: fki_codusuario; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_codusuario ON public.grupos USING btree (usuario_cd_usuario);


--
-- TOC entry 1904 (class 2606 OID 16521)
-- Name: fk_codgrupo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY quadras
    ADD CONSTRAINT fk_codgrupo FOREIGN KEY (grupo_cd_grupo) REFERENCES grupos(cd_nome_grupo);


--
-- TOC entry 1902 (class 2606 OID 16556)
-- Name: fk_codgrupo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY agendamento
    ADD CONSTRAINT fk_codgrupo FOREIGN KEY (grupo_cd_grupo) REFERENCES grupos(cd_nome_grupo);


--
-- TOC entry 1903 (class 2606 OID 16531)
-- Name: fk_codusuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY grupos
    ADD CONSTRAINT fk_codusuario FOREIGN KEY (usuario_cd_usuario) REFERENCES usuario(cd_usuario);


--
-- TOC entry 2024 (class 0 OID 0)
-- Dependencies: 7
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2018-12-11 15:17:29

--
-- PostgreSQL database dump complete
--

