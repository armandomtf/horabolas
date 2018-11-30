--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.20
-- Dumped by pg_dump version 9.5.5

-- Started on 2018-11-29 23:36:40

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
-- TOC entry 2046 (class 0 OID 0)
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
-- TOC entry 174 (class 1259 OID 16484)
-- Name: comentar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE comentar (
    nm_texto character varying,
    dt_data date,
    tm_hora time with time zone,
    usuario_cd_usuario integer
);


ALTER TABLE comentar OWNER TO postgres;

--
-- TOC entry 175 (class 1259 OID 16490)
-- Name: curtir; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE curtir (
    tm_hora time with time zone,
    dt_data date,
    usuario_cd_usuario integer
);


ALTER TABLE curtir OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 16493)
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
-- TOC entry 177 (class 1259 OID 16496)
-- Name: post; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE post (
    nm_texto character varying,
    tm_hora time with time zone,
    dt_data date,
    usuario_cd_usuario integer
);


ALTER TABLE post OWNER TO postgres;

--
-- TOC entry 178 (class 1259 OID 16502)
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
-- TOC entry 179 (class 1259 OID 16508)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE usuario (
    cd_usuario integer NOT NULL,
    nm_name character varying,
    cd_email integer,
    cd_telefone integer,
    cd_cpf integer,
    ds_senha character varying
);


ALTER TABLE usuario OWNER TO postgres;

--
-- TOC entry 2032 (class 0 OID 16481)
-- Dependencies: 173
-- Data for Name: agendamento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY agendamento (dt_agendamento, tm_inicial, tm_final, id_aprovado, grupo_cd_grupo) FROM stdin;
\.


--
-- TOC entry 2033 (class 0 OID 16484)
-- Dependencies: 174
-- Data for Name: comentar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY comentar (nm_texto, dt_data, tm_hora, usuario_cd_usuario) FROM stdin;
\.


--
-- TOC entry 2034 (class 0 OID 16490)
-- Dependencies: 175
-- Data for Name: curtir; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY curtir (tm_hora, dt_data, usuario_cd_usuario) FROM stdin;
\.


--
-- TOC entry 2035 (class 0 OID 16493)
-- Dependencies: 176
-- Data for Name: grupos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY grupos (cd_nome_grupo, dt_data, tm_hora, usuario_cd_usuario) FROM stdin;
\.


--
-- TOC entry 2036 (class 0 OID 16496)
-- Dependencies: 177
-- Data for Name: post; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY post (nm_texto, tm_hora, dt_data, usuario_cd_usuario) FROM stdin;
\.


--
-- TOC entry 2037 (class 0 OID 16502)
-- Dependencies: 178
-- Data for Name: quadras; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY quadras (tm_hrdispinicial, tm_hrdispfinal, grupo_cd_grupo, nm_quadra) FROM stdin;
\.


--
-- TOC entry 2038 (class 0 OID 16508)
-- Dependencies: 179
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY usuario (cd_usuario, nm_name, cd_email, cd_telefone, cd_cpf, ds_senha) FROM stdin;
\.


--
-- TOC entry 1909 (class 2606 OID 16584)
-- Name: pk_codagendamento; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY agendamento
    ADD CONSTRAINT pk_codagendamento PRIMARY KEY (dt_agendamento);


--
-- TOC entry 1912 (class 2606 OID 16515)
-- Name: pk_codgrupo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY grupos
    ADD CONSTRAINT pk_codgrupo PRIMARY KEY (cd_nome_grupo);


--
-- TOC entry 1916 (class 2606 OID 16517)
-- Name: pk_codusuario; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT pk_codusuario PRIMARY KEY (cd_usuario);


--
-- TOC entry 1913 (class 1259 OID 16518)
-- Name: fki_cod_usuario; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_cod_usuario ON public.post USING btree (usuario_cd_usuario);


--
-- TOC entry 1914 (class 1259 OID 16519)
-- Name: fki_codgrupo; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_codgrupo ON public.quadras USING btree (grupo_cd_grupo);


--
-- TOC entry 1907 (class 1259 OID 16561)
-- Name: fki_codgrupo2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_codgrupo2 ON public.agendamento USING btree (grupo_cd_grupo);


--
-- TOC entry 1910 (class 1259 OID 16520)
-- Name: fki_codusuario; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_codusuario ON public.grupos USING btree (usuario_cd_usuario);


--
-- TOC entry 1922 (class 2606 OID 16521)
-- Name: fk_codgrupo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY quadras
    ADD CONSTRAINT fk_codgrupo FOREIGN KEY (grupo_cd_grupo) REFERENCES grupos(cd_nome_grupo);


--
-- TOC entry 1917 (class 2606 OID 16556)
-- Name: fk_codgrupo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY agendamento
    ADD CONSTRAINT fk_codgrupo FOREIGN KEY (grupo_cd_grupo) REFERENCES grupos(cd_nome_grupo);


--
-- TOC entry 1921 (class 2606 OID 16526)
-- Name: fk_codusuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY post
    ADD CONSTRAINT fk_codusuario FOREIGN KEY (usuario_cd_usuario) REFERENCES usuario(cd_usuario);


--
-- TOC entry 1920 (class 2606 OID 16531)
-- Name: fk_codusuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY grupos
    ADD CONSTRAINT fk_codusuario FOREIGN KEY (usuario_cd_usuario) REFERENCES usuario(cd_usuario);


--
-- TOC entry 1919 (class 2606 OID 16536)
-- Name: fk_codusuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY curtir
    ADD CONSTRAINT fk_codusuario FOREIGN KEY (usuario_cd_usuario) REFERENCES usuario(cd_usuario);


--
-- TOC entry 1918 (class 2606 OID 16541)
-- Name: fk_codusuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comentar
    ADD CONSTRAINT fk_codusuario FOREIGN KEY (usuario_cd_usuario) REFERENCES usuario(cd_usuario);


--
-- TOC entry 2045 (class 0 OID 0)
-- Dependencies: 7
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2018-11-29 23:36:40

--
-- PostgreSQL database dump complete
--

