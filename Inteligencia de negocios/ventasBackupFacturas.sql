--
-- PostgreSQL database dump
--

-- Dumped from database version 12.0
-- Dumped by pg_dump version 12.0

-- Started on 2019-11-11 15:38:37

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
-- TOC entry 204 (class 1259 OID 16483)
-- Name: almacen; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.almacen (
    id_almacen integer NOT NULL,
    direccion character varying(20),
    telefono character varying(20)
);


ALTER TABLE public.almacen OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16503)
-- Name: almacenproducto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.almacenproducto (
    id_almacen_producto integer NOT NULL,
    id_almacen integer,
    id_producto integer,
    fecha_ingreso date,
    cantidad double precision
);


ALTER TABLE public.almacenproducto OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16473)
-- Name: cabecerafactura; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cabecerafactura (
    id_factura integer NOT NULL,
    codigo_promocion character varying(20),
    fecha date,
    total double precision,
    id_cliente integer NOT NULL
);


ALTER TABLE public.cabecerafactura OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16488)
-- Name: categoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categoria (
    id_categoria integer NOT NULL,
    nombre character varying(20)
);


ALTER TABLE public.categoria OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16533)
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente (
    id_cliente integer NOT NULL,
    nombre character varying(30),
    apellido character varying(30),
    genero character varying(10),
    telefono character varying(20)
);


ALTER TABLE public.cliente OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16518)
-- Name: lineadetallefactura; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lineadetallefactura (
    id_detalle integer NOT NULL,
    id_factura integer,
    id_producto integer,
    cantidad integer
);


ALTER TABLE public.lineadetallefactura OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16493)
-- Name: producto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.producto (
    id_producto integer NOT NULL,
    id_categoria integer,
    nombre character varying(50),
    precio double precision
);


ALTER TABLE public.producto OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16463)
-- Name: promocion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.promocion (
    codigo character varying(20) NOT NULL,
    descripcion character varying(20) NOT NULL
);


ALTER TABLE public.promocion OWNER TO postgres;

--
-- TOC entry 2864 (class 0 OID 16483)
-- Dependencies: 204
-- Data for Name: almacen; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.almacen (id_almacen, direccion, telefono) FROM stdin;
1	Av los shirys	022345789
2	Av los cipreses\n	037645874
3	El Arenal y nueva es	072428764
\.


--
-- TOC entry 2867 (class 0 OID 16503)
-- Dependencies: 207
-- Data for Name: almacenproducto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.almacenproducto (id_almacen_producto, id_almacen, id_producto, fecha_ingreso, cantidad) FROM stdin;
1	1	5	2019-11-11	100
2	2	1	2019-11-10	150
3	3	2	2019-11-11	200
4	3	3	2019-11-11	100
5	3	4	2019-11-13	300
6	1	1	2019-11-03	500
7	2	2	2019-11-05	250
8	2	3	2019-11-23	300
9	1	3	2019-12-23	75
10	3	1	2019-08-23	25
\.


--
-- TOC entry 2863 (class 0 OID 16473)
-- Dependencies: 203
-- Data for Name: cabecerafactura; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cabecerafactura (id_factura, codigo_promocion, fecha, total, id_cliente) FROM stdin;
1	DANNY001	2019-11-04	46.85	3
2	DANNY002	2019-11-03	264.51	2
3	DANNY003	2019-11-11	101.05	1
\.


--
-- TOC entry 2865 (class 0 OID 16488)
-- Dependencies: 205
-- Data for Name: categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categoria (id_categoria, nombre) FROM stdin;
1	ropa
2	zapatos
3	hogar
4	viveres\n
\.


--
-- TOC entry 2869 (class 0 OID 16533)
-- Dependencies: 209
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cliente (id_cliente, nombre, apellido, genero, telefono) FROM stdin;
1	Danny	Díaz	M	0978654040
2	Manual	Guerra	M	0978654034
3	Oscar	Mendoza	M	0999654040
4	Richard	Enriquez	M	0979974040
5	Valentina	Arancibia	F	0912653040
\.


--
-- TOC entry 2868 (class 0 OID 16518)
-- Dependencies: 208
-- Data for Name: lineadetallefactura; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lineadetallefactura (id_detalle, id_factura, id_producto, cantidad) FROM stdin;
1	1	5	7
2	1	4	8
3	2	5	9
4	2	2	10
5	3	2	2
6	3	3	3
7	3	4	4
\.


--
-- TOC entry 2866 (class 0 OID 16493)
-- Dependencies: 206
-- Data for Name: producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.producto (id_producto, id_categoria, nombre, precio) FROM stdin;
1	1	Producto 1	10.56
2	2	Producto 2	25.56
3	3	Producto 3	9.99
4	4	Producto 4	4.99
5	1	Producto 5	0.99
\.


--
-- TOC entry 2862 (class 0 OID 16463)
-- Dependencies: 202
-- Data for Name: promocion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.promocion (codigo, descripcion) FROM stdin;
DANNY001	influencer
DANNY002	influencer
DANNY003	influencer
DANNY004	influencer
DANNY005	influencer
DANNY007	influencer
DANNY008	influencer
DANNY009	influencer
DANNY010\n	influencer
\.


--
-- TOC entry 2718 (class 2606 OID 16487)
-- Name: almacen almacen_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.almacen
    ADD CONSTRAINT almacen_pkey PRIMARY KEY (id_almacen);


--
-- TOC entry 2724 (class 2606 OID 16507)
-- Name: almacenproducto almacenproducto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.almacenproducto
    ADD CONSTRAINT almacenproducto_pkey PRIMARY KEY (id_almacen_producto);


--
-- TOC entry 2716 (class 2606 OID 16477)
-- Name: cabecerafactura cabecerafactura_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cabecerafactura
    ADD CONSTRAINT cabecerafactura_pkey PRIMARY KEY (id_factura);


--
-- TOC entry 2720 (class 2606 OID 16492)
-- Name: categoria categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (id_categoria);


--
-- TOC entry 2728 (class 2606 OID 16537)
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id_cliente);


--
-- TOC entry 2726 (class 2606 OID 16522)
-- Name: lineadetallefactura lineadetallefactura_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lineadetallefactura
    ADD CONSTRAINT lineadetallefactura_pkey PRIMARY KEY (id_detalle);


--
-- TOC entry 2722 (class 2606 OID 16497)
-- Name: producto producto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_pkey PRIMARY KEY (id_producto);


--
-- TOC entry 2714 (class 2606 OID 16467)
-- Name: promocion promocion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promocion
    ADD CONSTRAINT promocion_pkey PRIMARY KEY (codigo);


--
-- TOC entry 2732 (class 2606 OID 16508)
-- Name: almacenproducto almacenproducto_id_almacen_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.almacenproducto
    ADD CONSTRAINT almacenproducto_id_almacen_fkey FOREIGN KEY (id_almacen) REFERENCES public.almacen(id_almacen);


--
-- TOC entry 2733 (class 2606 OID 16513)
-- Name: almacenproducto almacenproducto_id_producto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.almacenproducto
    ADD CONSTRAINT almacenproducto_id_producto_fkey FOREIGN KEY (id_producto) REFERENCES public.producto(id_producto);


--
-- TOC entry 2729 (class 2606 OID 16478)
-- Name: cabecerafactura cabecerafactura_codigo_promocion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cabecerafactura
    ADD CONSTRAINT cabecerafactura_codigo_promocion_fkey FOREIGN KEY (codigo_promocion) REFERENCES public.promocion(codigo);


--
-- TOC entry 2730 (class 2606 OID 16538)
-- Name: cabecerafactura fk_factura_cliente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cabecerafactura
    ADD CONSTRAINT fk_factura_cliente FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente);


--
-- TOC entry 2734 (class 2606 OID 16523)
-- Name: lineadetallefactura lineadetallefactura_id_factura_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lineadetallefactura
    ADD CONSTRAINT lineadetallefactura_id_factura_fkey FOREIGN KEY (id_factura) REFERENCES public.cabecerafactura(id_factura);


--
-- TOC entry 2735 (class 2606 OID 16528)
-- Name: lineadetallefactura lineadetallefactura_id_producto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lineadetallefactura
    ADD CONSTRAINT lineadetallefactura_id_producto_fkey FOREIGN KEY (id_producto) REFERENCES public.producto(id_producto);


--
-- TOC entry 2731 (class 2606 OID 16498)
-- Name: producto producto_id_categoria_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_id_categoria_fkey FOREIGN KEY (id_categoria) REFERENCES public.categoria(id_categoria);


-- Completed on 2019-11-11 15:38:38

--
-- PostgreSQL database dump complete
--

