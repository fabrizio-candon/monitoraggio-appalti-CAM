/*===================================================================================
-- Copyright (C) 2024-2026 Fabrizio Candon
--
--    This file is part of MONITORAGGIO APPALTI.
--
--    MONITORAGGIO APPALTI is free software: you can redistribute it and/or modify
--    it under the terms of the GNU General Public License as published by
--    the Free Software Foundation, either version 3 of the License, or
--    (at your option) any later version.
--
--    MONITORAGGIO APPALTI is distributed in the hope that it will be useful,
--    but WITHOUT ANY WARRANTY; without even the implied warranty of
--    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--    GNU General Public License for more details.
--
--    You should have received a copy of the GNU General Public License
--    along with Nome-Programma.  If not, see <http://www.gnu.org/licenses/>
--
===================================================================================*/

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
-- Name: cpv_dmcam; Type: TABLE; Schema: public; Owner: anac
--

CREATE TABLE public.cpv_dmcam (
    id integer not null,
    dm character varying(8) NOT NULL,
    desc_dm character varying(50),
    cod_cpv character varying(16) NOT NULL,
    desc_cpv character varying(100)
);

--
-- Name: cpv_dmcam_id_seq; Type: SEQUENCE; Schema: public; Owner: anac
--

ALTER TABLE public.cpv_dmcam ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.cpv_dmcam_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

--
-- Name: cpv_dmcam_pkey; Type: CONSTRAINT; Schema: public; Owner: anac
--

ALTER TABLE ONLY public.cpv_dmcam
    ADD CONSTRAINT cpv_dmcam_pkey PRIMARY KEY (id);



ALTER TABLE public.cpv_dmcam OWNER TO "anac";

--
-- Data for Name: cpv_dmcam; Type: TABLE DATA; Schema: public; Owner: anac
--

COPY public.cpv_dmcam (dm, desc_dm, desc_cpv, cod_cpv) FROM stdin;
254-2022	Arredi per interni	Appendiabiti	39136000-4
254-2022	Arredi per interni	Archivi verticali	39132300-9
254-2022	Arredi per interni	Armadi	39122100-4
254-2022	Arredi per interni	Armadi e scaffali	39141100-3
254-2022	Arredi per interni	Armadi e scaffali biblioteca	39122000-3
254-2022	Arredi per interni	Armadi per atti	39132100-7
254-2022	Arredi per interni	Armadietti	39141300-5
254-2022	Arredi per interni	Arredamento	39200000-4
254-2022	Arredi per interni	Arredi per biblioteca	39155000-3
254-2022	Arredi per interni	Arredi per sala conferenza	39153000-9
254-2022	Arredi per interni	Arredo informatico	39134000-0
254-2022	Arredi per interni	Arredo per sale d''attesa e di ricevimento	39156000-0
254-2022	Arredi per interni	Arredo per scuole d''infanzia	39161000-8
254-2022	Arredi per interni	Arredo scolastico	39160000-1
254-2022	Arredi per interni	Articoli di arredamento	39516000-2
254-2022	Arredi per interni	Attrezzature per catering	39310000-8
254-2022	Arredi per interni	Attrezzature per servizio di refezione	39311000-5
254-2022	Arredi per interni	Banchi	39113600-3
254-2022	Arredi per interni	Banchi da lavoro	39151200-7
254-2022	Arredi per interni	banchi da lavoro per laboratorio	3918000-4
254-2022	Arredi per interni	Banconi	39172000-8
254-2022	Arredi per interni	Cabine	44211110-6
254-2022	Arredi per interni	Carrelli per uffici	39132500-1
254-2022	Arredi per interni	Cassettiere	39143122-7
254-2022	Arredi per interni	Comodini	39143123-4
254-2022	Arredi per interni	Cucine componibili	39141400-6
254-2022	Arredi per interni	Cuscini	39516110-6
254-2022	Arredi per interni	Divani	39113200-9
254-2022	Arredi per interni	Espositori	39171000-1
254-2022	Arredi per interni	Guanciali	39516120-9
254-2022	Arredi per interni	Guardaroba	39143121-0
254-2022	Arredi per interni	Lavagne	39292100-6
254-2022	Arredi per interni	Lavagne di ardesia per scrivere	39292200-7
254-2022	Arredi per interni	Leggii	39153100-0
254-2022	Arredi per interni	Letti, effetti letterecci e tessuti speciali per arredamento	39143110-0
254-2022	Arredi per interni	Lettini	39143116-2
254-2022	Arredi per interni	Materassi	39143112-4
254-2022	Arredi per interni	Mobili	39100000-3
254-2022	Arredi per interni	Mobili da cucina	39141000-2
254-2022	Arredi per interni	Mobili modulari	39151300-8
254-2022	Arredi per interni	Mobili per camere da letto	39143100-7
254-2022	Arredi per interni	Mobili per camere da letto, esclusi i letti e relativi accessori	39143120-3
254-2022	Arredi per interni	Mobili per il bagno	39144000-3
254-2022	Arredi per interni	Mobili per la casa	39140000-5
254-2022	Arredi per interni	Mobili per camere da letto, sale da pranzo e soggiorni	39143000-6
254-2022	Arredi per interni	Mobili per sala da pranzo	39143200-8
254-2022	Arredi per interni	Mobili per soggiorni	39143300-9
254-2022	Arredi per interni	Mobili vari	39151000-5
254-2022	Arredi per interni	Mobili per laboratorio	39180000-7
254-2022	Arredi per interni	Panchine	39113300-0
254-2022	Arredi per interni	Pareti interne mobili - Sistemimodulari di partizione interna non portanti (arredamento vario)	39290000-1
254-2022	Arredi per interni	Pareti interne mobili - Sistemimodulari di partizione interna non portanti (Parti di mobili)	39157000-7
254-2022	Arredi per interni	Pensiline	44112100-9
254-2022	Arredi per interni	Piani di lavoro	39141200-4
254-2022	Arredi per interni	Poggiapiedi	39113700-4
254-2022	Arredi per interni	Poltrone	39113100-8
254-2022	Arredi per interni	Porte	44221200-7
254-2022	Arredi per interni	Reti da letto	39143111-7
254-2022	Arredi per interni	Ripiani per archiviazione	39131100-0
254-2022	Arredi per interni	Scaffalature	39151100-6
254-2022	Arredi per interni	Scaffalature mobili	39152000-2
254-2022	Arredi per interni	Scaffali biblioteca	39122200-5
254-2022	Arredi per interni	Scrivanie	39121100-7
254-2022	Arredi per interni	Scrivanie e tavoli	39121000-6
254-2022	Arredi per interni	Sedie	39112000-0
254-2022	Arredi per interni	Sedie da tavola	39112100-1
254-2022	Arredi per interni	Sedie e sedili vari	39113000-7
254-2022	Arredi per interni	Sedili	39111000-3
254-2022	Arredi per interni	Sedili per teatri	39111200-5
254-2022	Arredi per interni	Sgabelli	39113500-2
254-2022	Arredi per interni	Sistemi di archiviazione	39132000-6
254-2022	Arredi per interni	Stand per esposizioni	39154100-7
254-2022	Arredi per interni	Tavoli	39121200-8
254-2022	Arredi per interni	Tavoli da disegno	38320000-4
254-2022	Arredi per interni	Tavoli da pranzo	39143210-1
254-2022	Arredi per interni	Tavoli di smistamento	39135000-7
254-2022	Arredi per interni	Tavoli informatici	39134100-1
254-2022	Arredi per interni	Tavoli, armadi, scrivanie e scaffali biblioteca	39120000-9
254-2022	Arredi per interni	Tavolini	39143310-2
254-2022	Arredi per interni	Vetrine	39133000-3 
\.

--:84,$s/\( .*\)\( \)\([0-9]\+\)
--

--
-- PostgreSQL database dump complete
--

