--
-- PostgreSQL database dump
--

-- Dumped from database version 12.4
-- Dumped by pg_dump version 12.4

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: rup; Type: TABLE; Schema: public; Owner: anac
--

CREATE TABLE public.rup (
    nome character varying(20) NOT NULL,
    cognome character varying(20) NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.rup OWNER TO "anac";

--
-- Name: rup_id_seq; Type: SEQUENCE; Schema: public; Owner: anac
--

ALTER TABLE public.rup ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.rup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: rup rup_pkey; Type: CONSTRAINT; Schema: public; Owner: anac
--

ALTER TABLE ONLY public.rup
    ADD CONSTRAINT rup_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

