--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: clients; Type: TABLE; Schema: public; Owner: Lucas; Tablespace: 
--

CREATE TABLE clients (
    clientid integer NOT NULL,
    clientname text NOT NULL
);


ALTER TABLE clients OWNER TO "Lucas";

--
-- Name: product_details; Type: TABLE; Schema: public; Owner: Lucas; Tablespace: 
--

CREATE TABLE product_details (
    productid integer NOT NULL,
    clientid integer NOT NULL,
    stakeholderid integer
);


ALTER TABLE product_details OWNER TO "Lucas";

--
-- Name: products; Type: TABLE; Schema: public; Owner: Lucas; Tablespace: 
--

CREATE TABLE products (
    productid integer NOT NULL,
    productname text NOT NULL
);


ALTER TABLE products OWNER TO "Lucas";

--
-- Name: stakeholders; Type: TABLE; Schema: public; Owner: Lucas; Tablespace: 
--

CREATE TABLE stakeholders (
    stakeholderid integer NOT NULL,
    stakeholdername text NOT NULL,
    clientid integer,
    contactinfo text NOT NULL,
    role text NOT NULL
);


ALTER TABLE stakeholders OWNER TO "Lucas";

--
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: Lucas
--

COPY clients (clientid, clientname) FROM stdin;
1	WalMart
2	Exxon Mobil
3	Chevron
4	Berkshire Hathaway
5	Apple
\.


--
-- Data for Name: product_details; Type: TABLE DATA; Schema: public; Owner: Lucas
--

COPY product_details (productid, clientid, stakeholderid) FROM stdin;
5	1	9
5	4	4
2	4	3
4	4	15
3	3	14
5	5	1
1	1	10
4	2	11
5	3	2
4	3	13
1	3	6
2	1	25
1	2	12
2	3	5
1	4	20
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: Lucas
--

COPY products (productid, productname) FROM stdin;
1	Product 1
2	Product 2
3	Product 3
4	Product 4
5	Product 5
\.


--
-- Data for Name: stakeholders; Type: TABLE DATA; Schema: public; Owner: Lucas
--

COPY stakeholders (stakeholderid, stakeholdername, clientid, contactinfo, role) FROM stdin;
1	Alisya Park	5	ap@mail.com	HR
2	Careen Fylan	5	cf@mail.com	Tech
3	Jerrod Gaspar	4	jg@mail.com	HR
4	Esta Terrazas	4	et@mail.com	Tech
5	Huey Sadler	3	hs@mail.com	HR
6	Robert Paterson	3	rp@mail.com	Tech
7	Quin Yong	2	qy@mail.com	HR
8	Abby Gardener	2	ag@mail.com	Tech
9	Janet Godfrey	1	jg@mail.com	HR
10	Sue Paris	1	sp@mail.com	Tech
11	Nora Garry	2	ng@mail.com	HR
12	Marcelina Hyland	2	mh@mail.com	Tech
13	Alisha Donohoe	3	ad@mail.com	HR
14	Baxter Robert	3	br@mail.com	Tech
15	Bidelia Quincey	4	bq@mail.com	HR
16	Remedios Kitchens	4	rk@mail.com	Tech
17	Troy Rios	5	tr@mail.com	HR
18	Kamryn Klimek	5	kk@mail.com	Tech
19	Paderau Southers	4	ps@mail.com	HR
20	Edgardo Earls	4	ee@mail.com	Tech
21	Frannie Abraham	3	fa@mail.com	HR
22	Jay Powers	3	jp@mail.com	Tech
23	Winston Norris	2	wn@mail.com	HR
24	Dermot Shea	2	ds@mail.com	Tech
25	Crystal Milford	1	cm@mail.com	HR
\.


--
-- Name: clients_pkey; Type: CONSTRAINT; Schema: public; Owner: Lucas; Tablespace: 
--

ALTER TABLE ONLY clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (clientid);


--
-- Name: products_pkey; Type: CONSTRAINT; Schema: public; Owner: Lucas; Tablespace: 
--

ALTER TABLE ONLY products
    ADD CONSTRAINT products_pkey PRIMARY KEY (productid);


--
-- Name: stakeholders_pkey; Type: CONSTRAINT; Schema: public; Owner: Lucas; Tablespace: 
--

ALTER TABLE ONLY stakeholders
    ADD CONSTRAINT stakeholders_pkey PRIMARY KEY (stakeholderid);


--
-- Name: product_details_clientid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Lucas
--

ALTER TABLE ONLY product_details
    ADD CONSTRAINT product_details_clientid_fkey FOREIGN KEY (clientid) REFERENCES clients(clientid);


--
-- Name: product_details_productid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Lucas
--

ALTER TABLE ONLY product_details
    ADD CONSTRAINT product_details_productid_fkey FOREIGN KEY (productid) REFERENCES products(productid);


--
-- Name: product_details_stakeholderid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Lucas
--

ALTER TABLE ONLY product_details
    ADD CONSTRAINT product_details_stakeholderid_fkey FOREIGN KEY (stakeholderid) REFERENCES stakeholders(stakeholderid);


--
-- Name: stakeholders_clientid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Lucas
--

ALTER TABLE ONLY stakeholders
    ADD CONSTRAINT stakeholders_clientid_fkey FOREIGN KEY (clientid) REFERENCES clients(clientid);


--
-- Name: public; Type: ACL; Schema: -; Owner: Lucas
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM "Lucas";
GRANT ALL ON SCHEMA public TO "Lucas";
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

