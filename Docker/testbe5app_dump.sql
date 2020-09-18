--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.14
-- Dumped by pg_dump version 12.4 (Ubuntu 12.4-0ubuntu0.20.04.1)

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

-- DROP DATABASE testbe5app;
--
-- Name: testbe5app; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE testbe5app WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';


ALTER DATABASE testbe5app OWNER TO postgres;

\connect testbe5app

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

--
-- Name: be5columnsettings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.be5columnsettings (
    id bigint NOT NULL,
    table_name character varying(30) NOT NULL,
    query_name character varying(255) NOT NULL,
    column_name character varying(255) NOT NULL,
    user_name character varying(100),
    role_name character varying(50),
    wrap character varying(3) DEFAULT 'no'::character varying NOT NULL,
    nowrap character varying(3) DEFAULT 'no'::character varying NOT NULL,
    visible character varying(3) DEFAULT 'yes'::character varying NOT NULL,
    width character varying(5),
    quick character varying(3) DEFAULT 'no'::character varying NOT NULL,
    "grouping" character varying(3) DEFAULT 'no'::character varying NOT NULL,
    sort character varying(7) DEFAULT 'DEFAULT'::character varying NOT NULL,
    aggregate character varying(7) DEFAULT 'DEFAULT'::character varying NOT NULL,
    CONSTRAINT be5columnsettings_aggregate_check CHECK (((aggregate)::text = ANY ((ARRAY['AVG'::character varying, 'COUNT'::character varying, 'DEFAULT'::character varying, 'SUM'::character varying])::text[]))),
    CONSTRAINT be5columnsettings_grouping_check CHECK ((("grouping")::text = ANY ((ARRAY['no'::character varying, 'yes'::character varying])::text[]))),
    CONSTRAINT be5columnsettings_quick_check CHECK (((quick)::text = ANY ((ARRAY['no'::character varying, 'yes'::character varying])::text[]))),
    CONSTRAINT be5columnsettings_sort_check CHECK (((sort)::text = ANY ((ARRAY['ASC'::character varying, 'DEFAULT'::character varying, 'DESC'::character varying])::text[]))),
    CONSTRAINT be5columnsettings_visible_check CHECK (((visible)::text = ANY ((ARRAY['no'::character varying, 'yes'::character varying])::text[])))
);


ALTER TABLE public.be5columnsettings OWNER TO postgres;

--
-- Name: be5columnsettings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.be5columnsettings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.be5columnsettings_id_seq OWNER TO postgres;

--
-- Name: be5columnsettings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.be5columnsettings_id_seq OWNED BY public.be5columnsettings.id;


--
-- Name: be5eventparams; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.be5eventparams (
    id bigint NOT NULL,
    logid bigint NOT NULL,
    paramname character varying(255) NOT NULL,
    paramvalue text
);


ALTER TABLE public.be5eventparams OWNER TO postgres;

--
-- Name: be5eventparams_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.be5eventparams_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.be5eventparams_id_seq OWNER TO postgres;

--
-- Name: be5eventparams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.be5eventparams_id_seq OWNED BY public.be5eventparams.id;


--
-- Name: be5events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.be5events (
    id bigint NOT NULL,
    user_name character varying(100) NOT NULL,
    ip character varying(100),
    starttime timestamp without time zone NOT NULL,
    endtime timestamp without time zone,
    action character varying(12) NOT NULL,
    entity character varying(40),
    title character varying(255),
    result text,
    exception text,
    CONSTRAINT be5events_action_check CHECK (((action)::text = ANY ((ARRAY['logging'::character varying, 'operation'::character varying, 'other'::character varying, 'print'::character varying, 'process'::character varying, 'query'::character varying, 'queryBuilder'::character varying, 'servlet'::character varying])::text[])))
);


ALTER TABLE public.be5events OWNER TO postgres;

--
-- Name: be5events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.be5events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.be5events_id_seq OWNER TO postgres;

--
-- Name: be5events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.be5events_id_seq OWNED BY public.be5events.id;


--
-- Name: be5operationlogparams; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.be5operationlogparams (
    id bigint NOT NULL,
    operlogid bigint NOT NULL,
    type character varying(7) DEFAULT 'input'::character varying NOT NULL,
    paramname character varying(255) NOT NULL,
    paramvalue text,
    CONSTRAINT be5operationlogparams_type_check CHECK (((type)::text = ANY ((ARRAY['context'::character varying, 'input'::character varying, 'session'::character varying])::text[])))
);


ALTER TABLE public.be5operationlogparams OWNER TO postgres;

--
-- Name: be5operationlogparams_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.be5operationlogparams_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.be5operationlogparams_id_seq OWNER TO postgres;

--
-- Name: be5operationlogparams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.be5operationlogparams_id_seq OWNED BY public.be5operationlogparams.id;


--
-- Name: be5operationlogs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.be5operationlogs (
    id bigint NOT NULL,
    table_name character varying(30) NOT NULL,
    operation_name character varying(100) NOT NULL,
    user_name character varying(100) NOT NULL,
    localestring character varying(30),
    appurl character varying(150),
    executedat timestamp without time zone NOT NULL,
    remoteaddr character varying(255),
    result text
);


ALTER TABLE public.be5operationlogs OWNER TO postgres;

--
-- Name: be5operationlogs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.be5operationlogs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.be5operationlogs_id_seq OWNER TO postgres;

--
-- Name: be5operationlogs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.be5operationlogs_id_seq OWNED BY public.be5operationlogs.id;


--
-- Name: be5querysettings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.be5querysettings (
    id bigint NOT NULL,
    table_name character varying(30) NOT NULL,
    query_name character varying(255) NOT NULL,
    user_name character varying(100) NOT NULL,
    recordsperpage integer
);


ALTER TABLE public.be5querysettings OWNER TO postgres;

--
-- Name: be5querysettings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.be5querysettings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.be5querysettings_id_seq OWNER TO postgres;

--
-- Name: be5querysettings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.be5querysettings_id_seq OWNED BY public.be5querysettings.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id bigint NOT NULL,
    entity character varying(30) NOT NULL,
    publicid character varying(100),
    name character varying(255) NOT NULL,
    parentid bigint,
    description text
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: classifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.classifications (
    id bigint NOT NULL,
    recordid character varying(200) NOT NULL,
    categoryid bigint NOT NULL,
    whoinserted___ character varying(100),
    creationdate___ timestamp without time zone
);


ALTER TABLE public.classifications OWNER TO postgres;

--
-- Name: classifications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.classifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.classifications_id_seq OWNER TO postgres;

--
-- Name: classifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.classifications_id_seq OWNED BY public.classifications.id;


--
-- Name: countries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.countries (
    id character(2) NOT NULL,
    name character varying(60) NOT NULL,
    telcode character varying(10)
);


ALTER TABLE public.countries OWNER TO postgres;

--
-- Name: languages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.languages (
    id character(2) NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.languages OWNER TO postgres;

--
-- Name: mimetypes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mimetypes (
    type character varying(50) NOT NULL,
    name character varying(100)
);


ALTER TABLE public.mimetypes OWNER TO postgres;

--
-- Name: persistent_logins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.persistent_logins (
    series character varying(64) NOT NULL,
    user_name character varying(100) NOT NULL,
    token character varying(64) NOT NULL,
    last_used timestamp without time zone NOT NULL
);


ALTER TABLE public.persistent_logins OWNER TO postgres;

--
-- Name: provinces; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.provinces (
    id character varying(30) NOT NULL,
    countryid character(2) NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.provinces OWNER TO postgres;

--
-- Name: sequences; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sequences (
    section character varying(50) NOT NULL,
    name character varying(50) NOT NULL,
    counter bigint NOT NULL
);


ALTER TABLE public.sequences OWNER TO postgres;

--
-- Name: systemsettings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.systemsettings (
    section_name character varying(255) DEFAULT 'system'::character varying NOT NULL,
    setting_name character varying(64) NOT NULL,
    setting_value text NOT NULL
);


ALTER TABLE public.systemsettings OWNER TO postgres;

--
-- Name: testtable; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.testtable (
    id bigint NOT NULL,
    name character varying(20) NOT NULL,
    value integer
);


ALTER TABLE public.testtable OWNER TO postgres;

--
-- Name: testtable_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.testtable_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.testtable_id_seq OWNER TO postgres;

--
-- Name: testtable_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.testtable_id_seq OWNED BY public.testtable.id;


--
-- Name: user_prefs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_prefs (
    user_name character varying(100) NOT NULL,
    pref_name character varying(30) NOT NULL,
    pref_value text NOT NULL
);


ALTER TABLE public.user_prefs OWNER TO postgres;

--
-- Name: user_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_roles (
    user_name character varying(100) NOT NULL,
    role_name character varying(100) NOT NULL
);


ALTER TABLE public.user_roles OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_name character varying(100) NOT NULL,
    user_pass character varying(50)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: be5columnsettings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.be5columnsettings ALTER COLUMN id SET DEFAULT nextval('public.be5columnsettings_id_seq'::regclass);


--
-- Name: be5eventparams id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.be5eventparams ALTER COLUMN id SET DEFAULT nextval('public.be5eventparams_id_seq'::regclass);


--
-- Name: be5events id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.be5events ALTER COLUMN id SET DEFAULT nextval('public.be5events_id_seq'::regclass);


--
-- Name: be5operationlogparams id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.be5operationlogparams ALTER COLUMN id SET DEFAULT nextval('public.be5operationlogparams_id_seq'::regclass);


--
-- Name: be5operationlogs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.be5operationlogs ALTER COLUMN id SET DEFAULT nextval('public.be5operationlogs_id_seq'::regclass);


--
-- Name: be5querysettings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.be5querysettings ALTER COLUMN id SET DEFAULT nextval('public.be5querysettings_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: classifications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classifications ALTER COLUMN id SET DEFAULT nextval('public.classifications_id_seq'::regclass);


--
-- Name: testtable id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.testtable ALTER COLUMN id SET DEFAULT nextval('public.testtable_id_seq'::regclass);


--
-- Data for Name: be5columnsettings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.be5columnsettings (id, table_name, query_name, column_name, user_name, role_name, wrap, nowrap, visible, width, quick, "grouping", sort, aggregate) FROM stdin;
\.


--
-- Data for Name: be5eventparams; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.be5eventparams (id, logid, paramname, paramvalue) FROM stdin;
\.


--
-- Data for Name: be5events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.be5events (id, user_name, ip, starttime, endtime, action, entity, title, result, exception) FROM stdin;
\.


--
-- Data for Name: be5operationlogparams; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.be5operationlogparams (id, operlogid, type, paramname, paramvalue) FROM stdin;
\.


--
-- Data for Name: be5operationlogs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.be5operationlogs (id, table_name, operation_name, user_name, localestring, appurl, executedat, remoteaddr, result) FROM stdin;
\.


--
-- Data for Name: be5querysettings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.be5querysettings (id, table_name, query_name, user_name, recordsperpage) FROM stdin;
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, entity, publicid, name, parentid, description) FROM stdin;
\.


--
-- Data for Name: classifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.classifications (id, recordid, categoryid, whoinserted___, creationdate___) FROM stdin;
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.countries (id, name, telcode) FROM stdin;
\.


--
-- Data for Name: languages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.languages (id, name) FROM stdin;
aa	Afar
ab	Abkhazian
af	Afrikaans
am	Amharic
ar	Arabic
as	Assamese
ay	Aymara
az	Azerbaijani
ba	Bashkir
be	Byelorussian
bg	Bulgarian
bh	Bihari
bi	Bislama
bn	Bengali; Bangla
bo	Tibetan
br	Breton
ca	Catalan
co	Corsican
cs	Czech
cy	Welsh
da	Danish
de	German
dz	Bhutani
el	Greek
en	English
eo	Esperanto
es	Spanish
et	Estonian
eu	Basque
fa	Persian
fi	Finnish
fj	Fiji
fo	Faroese
fr	French
fy	Frisian
ga	Irish
gd	Scots Gaelic
gl	Galician
gn	Guarani
gu	Gujarati
ha	Hausa
he	Hebrew
hi	Hindi
hr	Croatian
hu	Hungarian
hy	Armenian
ia	Interlingua
id	Indonesian
ie	Interlingue
ik	Inupiak
is	Icelandic
it	Italian
iu	Inuktitut
ja	Japanese
jw	Javanese
ka	Georgian
kk	Kazakh
kl	Greenlandic
km	Cambodian
kn	Kannada
ko	Korean
ks	Kashmiri
ku	Kurdish
ky	Kirghiz
la	Latin
ln	Lingala
lo	Laothian
lt	Lithuanian
lv	Latvian, Lettish
mg	Malagasy
mi	Maori
mk	Macedonian
ml	Malayalam
mn	Mongolian
mo	Moldavian
mr	Marathi
ms	Malay
mt	Maltese
my	Burmese
na	Nauru
ne	Nepali
nl	Dutch
no	Norwegian
oc	Occitan
om	(Afan) Oromo
or	Oriya
pa	Punjabi
pl	Polish
ps	Pashto, Pushto
pt	Portuguese
qu	Quechua
rm	Rhaeto-Romance
rn	Kirundi
ro	Romanian
ru	Russian
rw	Kinyarwanda
sa	Sanskrit
sd	Sindhi
sg	Sangho
sh	Serbo-Croatian
si	Sinhalese
sk	Slovak
sl	Slovenian
sm	Samoan
sn	Shona
so	Somali
sq	Albanian
sr	Serbian
ss	Siswati
st	Sesotho
su	Sundanese
sv	Swedish
sw	Swahili
ta	Tamil
te	Telugu
tg	Tajik
th	Thai
ti	Tigrinya
tk	Turkmen
tl	Tagalog
tn	Setswana
to	Tonga
tr	Turkish
ts	Tsonga
tt	Tatar
tw	Twi
ug	Uighur
uk	Ukrainian
ur	Urdu
uz	Uzbek
vi	Vietnamese
vo	Volapuk
wo	Wolof
xh	Xhosa
yi	Yiddish (formerly ji)
yo	Yoruba
za	Zhuang
zh	Chinese
zu	Zulu
\.


--
-- Data for Name: mimetypes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mimetypes (type, name) FROM stdin;
application/xml	\N
application/x-zip-compressed	\N
application/x-msdownload	\N
application/x-java	\N
application/x-javascript	\N
message/rfc822	\N
text/x-vcard	\N
application/java-archive	\N
application/java	\N
application/mac-binhex40	\N
application/msword	\N
application/octet-stream	\N
application/oda	\N
application/pdf	\N
application/postscript	\N
application/rtf	\N
application/vnd.ms-excel	\N
application/vnd.ms-powerpoint	\N
application/vnd.rim.cod	\N
application/vnd.rn-realmedia	\N
application/vnd.wap.wmlc	\N
application/vnd.wap.wmlscriptc	\N
application/x-aim	\N
application/x-bcpio	\N
application/x-cdf	\N
application/x-compress	\N
application/x-cpio	\N
application/x-csh	\N
application/x-dvi	\N
application/x-gtar	\N
application/x-gzip	\N
application/x-hdf	\N
application/x-java-jnlp-file	\N
application/x-latex	\N
application/x-mif	\N
application/x-netcdf	\N
application/x-shar	\N
application/x-sh	\N
application/x-shockwave-flash	\N
application/x-sv4cpio	\N
application/x-sv4crc	\N
application/x-tar	\N
application/x-tcl	\N
application/x-texinfo	\N
application/x-tex	\N
application/x-troff-man	\N
application/x-troff-me	\N
application/x-troff	\N
application/x-ustar	\N
application/x-wais-source	\N
application/x-x509-ca-cert	\N
application/zip	\N
audio/basic	\N
audio/x-aiff	\N
audio/x-midi	\N
audio/x-mpeg	\N
audio/x-mpegurl	\N
audio/x-scpls	\N
audio/x-wav	\N
image/bmp	\N
image/gif	\N
image/ief	\N
image/jpeg	\N
image/pjpeg	\N
image/pict	\N
image/png	\N
image/tiff	\N
image/vnd.wap.wbmp	\N
image/x-cmu-raster	\N
image/x-jg	\N
image/x-macpaint	\N
image/x-photoshop	\N
image/x-portable-anymap	\N
image/x-portable-bitmap	\N
image/x-portable-graymap	\N
image/x-portable-pixmap	\N
image/x-quicktime	\N
image/x-rgb	\N
image/x-xbitmap	\N
image/x-xpixmap	\N
image/x-xwindowdump	\N
text/css	\N
text/html	\N
text/javascript	\N
text/plain	\N
text/richtext	\N
text/tab-separated-values	\N
text/vnd.sun.j2me.app-descriptor	\N
text/vnd.wap.wml	\N
text/vnd.wap.wmls	\N
text/x-setext	\N
video/mpeg2	\N
video/mpeg	\N
video/quicktime	\N
video/x-dv	\N
video/x-ms-asf	\N
video/x-msvideo	\N
video/x-rad-screenplay	\N
video/x-sgi-movie	\N
x-world/x-vrml	\N
\.


--
-- Data for Name: persistent_logins; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.persistent_logins (series, user_name, token, last_used) FROM stdin;
\.


--
-- Data for Name: provinces; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.provinces (id, countryid, name) FROM stdin;
\.


--
-- Data for Name: sequences; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sequences (section, name, counter) FROM stdin;
\.


--
-- Data for Name: systemsettings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.systemsettings (section_name, setting_name, setting_value) FROM stdin;
\.


--
-- Data for Name: testtable; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.testtable (id, name, value) FROM stdin;
1	test	1
2	test	2
\.


--
-- Data for Name: user_prefs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_prefs (user_name, pref_name, pref_value) FROM stdin;
\.


--
-- Data for Name: user_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_roles (user_name, role_name) FROM stdin;
Administrator	Administrator
Administrator	SystemDeveloper
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_name, user_pass) FROM stdin;
Administrator	12345
\.


--
-- Name: be5columnsettings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.be5columnsettings_id_seq', 1, false);


--
-- Name: be5eventparams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.be5eventparams_id_seq', 1, false);


--
-- Name: be5events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.be5events_id_seq', 1, false);


--
-- Name: be5operationlogparams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.be5operationlogparams_id_seq', 1, false);


--
-- Name: be5operationlogs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.be5operationlogs_id_seq', 1, false);


--
-- Name: be5querysettings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.be5querysettings_id_seq', 1, false);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 1, false);


--
-- Name: classifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.classifications_id_seq', 1, false);


--
-- Name: testtable_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.testtable_id_seq', 2, true);


--
-- Name: be5columnsettings be5columnsettings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.be5columnsettings
    ADD CONSTRAINT be5columnsettings_pkey PRIMARY KEY (id);


--
-- Name: be5eventparams be5eventparams_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.be5eventparams
    ADD CONSTRAINT be5eventparams_pkey PRIMARY KEY (id);


--
-- Name: be5events be5events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.be5events
    ADD CONSTRAINT be5events_pkey PRIMARY KEY (id);


--
-- Name: be5operationlogparams be5operationlogparams_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.be5operationlogparams
    ADD CONSTRAINT be5operationlogparams_pkey PRIMARY KEY (id);


--
-- Name: be5operationlogs be5operationlogs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.be5operationlogs
    ADD CONSTRAINT be5operationlogs_pkey PRIMARY KEY (id);


--
-- Name: be5querysettings be5querysettings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.be5querysettings
    ADD CONSTRAINT be5querysettings_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: classifications classifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classifications
    ADD CONSTRAINT classifications_pkey PRIMARY KEY (id);


--
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- Name: languages languages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.languages
    ADD CONSTRAINT languages_pkey PRIMARY KEY (id);


--
-- Name: mimetypes mimetypes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mimetypes
    ADD CONSTRAINT mimetypes_pkey PRIMARY KEY (type);


--
-- Name: persistent_logins persistent_logins_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persistent_logins
    ADD CONSTRAINT persistent_logins_pkey PRIMARY KEY (series);


--
-- Name: provinces provinces_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provinces
    ADD CONSTRAINT provinces_pkey PRIMARY KEY (id);


--
-- Name: testtable testtable_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.testtable
    ADD CONSTRAINT testtable_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_name);


--
-- Name: i_ue_ss_sn_sn; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX i_ue_ss_sn_sn ON public.systemsettings USING btree (section_name, setting_name);


--
-- Name: i_userprefs_uname; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX i_userprefs_uname ON public.user_prefs USING btree (user_name, pref_name);


--
-- Name: idx_cat_entity_par; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_cat_entity_par ON public.categories USING btree (entity, parentid);


--
-- Name: idx_cat_entity_pub; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_cat_entity_pub ON public.categories USING btree (entity, publicid);


--
-- Name: idx_cat_parent_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_cat_parent_id ON public.categories USING btree (parentid);


--
-- Name: idx_cat_publicid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_cat_publicid ON public.categories USING btree (publicid);


--
-- Name: idx_classif1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_classif1 ON public.classifications USING btree (recordid, categoryid);


--
-- Name: idx_classif2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_classif2 ON public.classifications USING btree (categoryid, recordid);


--
-- Name: idx_eventpars_logid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_eventpars_logid ON public.be5eventparams USING btree (logid);


--
-- Name: idx_events_start; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_events_start ON public.be5events USING btree (starttime);


--
-- Name: idx_events_user_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_events_user_name ON public.be5events USING btree (user_name);


--
-- Name: idx_op_log_p_oid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_op_log_p_oid ON public.be5operationlogparams USING btree (operlogid);


--
-- Name: idx_op_log_p_oid_n; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_op_log_p_oid_n ON public.be5operationlogparams USING btree (operlogid, paramname);


--
-- Name: idx_op_logs_tname; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_op_logs_tname ON public.be5operationlogs USING btree (table_name, operation_name);


--
-- Name: idx_op_logs_utoe; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_op_logs_utoe ON public.be5operationlogs USING btree (user_name, table_name, operation_name, executedat);


--
-- Name: idx_provinces_cid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_provinces_cid ON public.provinces USING btree (countryid);


--
-- Name: idx_sequences_sn; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_sequences_sn ON public.sequences USING btree (section, name);


--
-- Name: idx_ur_full; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_ur_full ON public.user_roles USING btree (user_name, role_name);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

