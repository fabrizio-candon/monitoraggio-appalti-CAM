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
-- Name: enti_rdv; Type: TABLE; Schema: public; Owner: anac
--

CREATE TABLE public.enti_rdv (
    cf character varying(16) NOT NULL,
    rag_soc character varying(150)
);


ALTER TABLE public.enti_rdv OWNER TO "anac";

--
-- Data for Name: enti_rdv; Type: TABLE DATA; Schema: public; Owner: anac
--

COPY public.enti_rdv (cf, rag_soc) FROM stdin;
92111430283	ARPAV
90098670277	AVEPA
91004990288	Ente Parco Colli Euganei
91005860258	Ente Parco Nazionale Dolomiti Bellunesi
94023150264	Ente Parco Naturale Regionale del Fiume Sile
90008170293	Ente Parco Regionale Veneto Delta del Po
00815750286	E.S.U. DI PADOVA - AZIENDA REGIONALE PER IL DIRITTO ALLO STUDIO UNVERSITARIO
01740230279	ESU AZIENDA REGIONALE PER IL DIRITTO ALLO STUDIO UNVERSITARIO
01527330235	ESU AZIENDA REGIONALE PER IL DIRITTO ALLO STUDIO UNVERSITARIO DI VERONA
80017460272	ISTITUTO REGIONALE VILLE VENETE
00206200289	ISTITUTO ZOOPROFILATTICO SPERIMENTALE DELLE VENEZIE
93287640234	PARCO NATURALE REGIONALE DELLA LESSINIA
00806650255	PARCO NATURALE DELLE DOLOMITI D'AMPEZZO
03180130274	VENETO LAVORO
92281270287	AGENZIA VENETA PER L'INNOVAZIONE NEL SETTORE PRIMARIO - AVISP
00092050251	AZIENDA TERRITORIALE PER L'EDILIZIA RESIDENZIALE PROV. BELLUNO
00222610289	AZIENDA TERRITORIALE EDILIZIA RESIDENZIALE PROVINCIA DI PADOVA A.T.E.R.
00223640236	AZIENDA TERRITORIALE EDILIZIA RESIDENZIALE PROVINCIA DI VERONA (A.T.E.R.)
00193710266	AZIENDA TERRITORIALE EDILIZIA RESIDENZIALE PROVINCIA DI TREVISO - A.T.E.R.
00181510272	AZIENDA TERRITORIALE EDILIZIA RESIDENZIALE PROVINCIA DI VENEZIA
00165800244	AZIENDA TERRITORIALE EDILIZIA RESIDENZIALE PROVINCIA DI VICENZA
03792380283	INFRASTRUTTURE VENETE S.R.L.
06070650582	SISTEMI TERRITORIALI SPA
03875491007	VENETO ACQUE SPA
03298360268	VENETO EDIFICI MONUMENTALI S.R.L.
03345230274	VENETO STRADE S.P.A.
00854750270	VENETO SVILUPPO S.P.A.
01112230329	FVS SGR S.P.A.
02568090274	VENETO INNOVAZIONE S.P.A.
80007580279	REGIONE VENETO
01234190930	FINEST S.P.A.
00041640293	ATER Rovigo
03829590276	CONCESSIONI AUTOSTRADALI VENETE - CAV S.P.A.
01310930324	SOCIETA' AUTOSTRADALE ALTO ADRIATICO S.P.A.
16406341004	SOCIETA' INFRASTRUTTURE MILANO CORTINA 2020-2026 S.P.A.
\.


--
-- Name: enti_rdv enti_rdv_pkey; Type: CONSTRAINT; Schema: public; Owner: anac
--

ALTER TABLE ONLY public.enti_rdv
    ADD CONSTRAINT enti_rdv_pkey PRIMARY KEY (cf);


--
-- PostgreSQL database dump complete
--

