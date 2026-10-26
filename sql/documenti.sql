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
-- Name: documenti; Type: TABLE; Schema: public; Owner: fabrizio-candon
--

CREATE TABLE public.documenti (
    cig character varying(18) NOT NULL,
    link character varying(500) NOT NULL
);


ALTER TABLE public.documenti OWNER TO "fabrizio-candon";

--
-- Name: documenti documenti_pkey; Type: CONSTRAINT; Schema: public; Owner: fabrizio-candon
--

ALTER TABLE ONLY public.documenti
    ADD CONSTRAINT documenti_pkey PRIMARY KEY (cig);


--
-- PostgreSQL database dump complete
--

