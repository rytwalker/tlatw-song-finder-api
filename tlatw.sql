--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 12.2

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
-- Name: albums; Type: TABLE; Schema: public; Owner: ryanwalker
--

CREATE TABLE public.albums (
    id integer NOT NULL,
    "artistId" integer NOT NULL,
    "spotifyId" character varying(255) NOT NULL,
    "spotifyUrl" character varying(255) NOT NULL,
    "albumType" character varying(255),
    name character varying(255) NOT NULL,
    "releaseDate" character varying(255) NOT NULL,
    "largeImageUrl" character varying(255) NOT NULL,
    "smallImageUrl" character varying(255) NOT NULL,
    "thumbnailUrl" character varying(255) NOT NULL,
    "totalTracks" integer NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.albums OWNER TO ryanwalker;

--
-- Name: albums_id_seq; Type: SEQUENCE; Schema: public; Owner: ryanwalker
--

CREATE SEQUENCE public.albums_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.albums_id_seq OWNER TO ryanwalker;

--
-- Name: albums_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ryanwalker
--

ALTER SEQUENCE public.albums_id_seq OWNED BY public.albums.id;


--
-- Name: artists; Type: TABLE; Schema: public; Owner: ryanwalker
--

CREATE TABLE public.artists (
    id integer NOT NULL,
    "spotifyId" character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    "spotifyUrl" character varying(255) NOT NULL,
    followers integer NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.artists OWNER TO ryanwalker;

--
-- Name: artists_id_seq; Type: SEQUENCE; Schema: public; Owner: ryanwalker
--

CREATE SEQUENCE public.artists_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.artists_id_seq OWNER TO ryanwalker;

--
-- Name: artists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ryanwalker
--

ALTER SEQUENCE public.artists_id_seq OWNED BY public.artists.id;


--
-- Name: audio-features; Type: TABLE; Schema: public; Owner: ryanwalker
--

CREATE TABLE public."audio-features" (
    id integer NOT NULL,
    "trackId" integer NOT NULL,
    "spotifyId" character varying(255) NOT NULL,
    "spotifyUrl" character varying(255) NOT NULL,
    danceability real NOT NULL,
    energy real NOT NULL,
    key integer NOT NULL,
    loudness real NOT NULL,
    mode integer NOT NULL,
    speechiness real NOT NULL,
    acousticness real NOT NULL,
    instrumentalness real NOT NULL,
    liveness real NOT NULL,
    valence real NOT NULL,
    tempo real NOT NULL,
    "timeSignature" integer NOT NULL,
    "trackHref" character varying(255) NOT NULL,
    "analysisUrl" character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."audio-features" OWNER TO ryanwalker;

--
-- Name: audio-features_id_seq; Type: SEQUENCE; Schema: public; Owner: ryanwalker
--

CREATE SEQUENCE public."audio-features_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."audio-features_id_seq" OWNER TO ryanwalker;

--
-- Name: audio-features_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ryanwalker
--

ALTER SEQUENCE public."audio-features_id_seq" OWNED BY public."audio-features".id;


--
-- Name: knex_migrations; Type: TABLE; Schema: public; Owner: ryanwalker
--

CREATE TABLE public.knex_migrations (
    id integer NOT NULL,
    name character varying(255),
    batch integer,
    migration_time timestamp with time zone
);


ALTER TABLE public.knex_migrations OWNER TO ryanwalker;

--
-- Name: knex_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: ryanwalker
--

CREATE SEQUENCE public.knex_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.knex_migrations_id_seq OWNER TO ryanwalker;

--
-- Name: knex_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ryanwalker
--

ALTER SEQUENCE public.knex_migrations_id_seq OWNED BY public.knex_migrations.id;


--
-- Name: knex_migrations_lock; Type: TABLE; Schema: public; Owner: ryanwalker
--

CREATE TABLE public.knex_migrations_lock (
    index integer NOT NULL,
    is_locked integer
);


ALTER TABLE public.knex_migrations_lock OWNER TO ryanwalker;

--
-- Name: knex_migrations_lock_index_seq; Type: SEQUENCE; Schema: public; Owner: ryanwalker
--

CREATE SEQUENCE public.knex_migrations_lock_index_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.knex_migrations_lock_index_seq OWNER TO ryanwalker;

--
-- Name: knex_migrations_lock_index_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ryanwalker
--

ALTER SEQUENCE public.knex_migrations_lock_index_seq OWNED BY public.knex_migrations_lock.index;


--
-- Name: tracks; Type: TABLE; Schema: public; Owner: ryanwalker
--

CREATE TABLE public.tracks (
    id integer NOT NULL,
    "albumId" integer NOT NULL,
    "spotifyId" character varying(255) NOT NULL,
    "spotifyUrl" character varying(255) NOT NULL,
    "trackNumber" integer NOT NULL,
    "durationMs" integer NOT NULL,
    name character varying(255) NOT NULL,
    "previewUrl" character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.tracks OWNER TO ryanwalker;

--
-- Name: tracks_id_seq; Type: SEQUENCE; Schema: public; Owner: ryanwalker
--

CREATE SEQUENCE public.tracks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tracks_id_seq OWNER TO ryanwalker;

--
-- Name: tracks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ryanwalker
--

ALTER SEQUENCE public.tracks_id_seq OWNED BY public.tracks.id;


--
-- Name: albums id; Type: DEFAULT; Schema: public; Owner: ryanwalker
--

ALTER TABLE ONLY public.albums ALTER COLUMN id SET DEFAULT nextval('public.albums_id_seq'::regclass);


--
-- Name: artists id; Type: DEFAULT; Schema: public; Owner: ryanwalker
--

ALTER TABLE ONLY public.artists ALTER COLUMN id SET DEFAULT nextval('public.artists_id_seq'::regclass);


--
-- Name: audio-features id; Type: DEFAULT; Schema: public; Owner: ryanwalker
--

ALTER TABLE ONLY public."audio-features" ALTER COLUMN id SET DEFAULT nextval('public."audio-features_id_seq"'::regclass);


--
-- Name: knex_migrations id; Type: DEFAULT; Schema: public; Owner: ryanwalker
--

ALTER TABLE ONLY public.knex_migrations ALTER COLUMN id SET DEFAULT nextval('public.knex_migrations_id_seq'::regclass);


--
-- Name: knex_migrations_lock index; Type: DEFAULT; Schema: public; Owner: ryanwalker
--

ALTER TABLE ONLY public.knex_migrations_lock ALTER COLUMN index SET DEFAULT nextval('public.knex_migrations_lock_index_seq'::regclass);


--
-- Name: tracks id; Type: DEFAULT; Schema: public; Owner: ryanwalker
--

ALTER TABLE ONLY public.tracks ALTER COLUMN id SET DEFAULT nextval('public.tracks_id_seq'::regclass);


--
-- Data for Name: albums; Type: TABLE DATA; Schema: public; Owner: ryanwalker
--

COPY public.albums (id, "artistId", "spotifyId", "spotifyUrl", "albumType", name, "releaseDate", "largeImageUrl", "smallImageUrl", "thumbnailUrl", "totalTracks", created_at, updated_at) FROM stdin;
1	1	7DQVIBQzh3Jef1EeK3Fb1W	https://open.spotify.com/album/7DQVIBQzh3Jef1EeK3Fb1W	album	Mont Royal	2015-08-28	https://i.scdn.co/image/ab67616d0000b273862461784ba5ac4d914caa9b	https://i.scdn.co/image/ab67616d00001e02862461784ba5ac4d914caa9b	https://i.scdn.co/image/ab67616d00004851862461784ba5ac4d914caa9b	10	2020-05-16 09:58:16.238518-04	2020-05-16 09:58:16.238518-04
2	1	0He2jPXqzIMThntrM45sv2	https://open.spotify.com/album/0He2jPXqzIMThntrM45sv2	album	This Is an Adventure	2012-09-18	https://i.scdn.co/image/ab67616d0000b273039bfb19441432d2158531e0	https://i.scdn.co/image/ab67616d00001e02039bfb19441432d2158531e0	https://i.scdn.co/image/ab67616d00004851039bfb19441432d2158531e0	10	2020-05-16 09:58:16.239659-04	2020-05-16 09:58:16.239659-04
3	1	3MTvSiHcDdqtnip99giaMS	https://open.spotify.com/album/3MTvSiHcDdqtnip99giaMS	album	The Lighthouse and the Whaler	2009-11-09	https://i.scdn.co/image/ab67616d0000b2738cd5d656688fc31fa6e3e58e	https://i.scdn.co/image/ab67616d00001e028cd5d656688fc31fa6e3e58e	https://i.scdn.co/image/ab67616d000048518cd5d656688fc31fa6e3e58e	10	2020-05-16 09:58:16.240286-04	2020-05-16 09:58:16.240286-04
4	1	7H4KCwiMf87gTOygXkw1X8	https://open.spotify.com/album/7H4KCwiMf87gTOygXkw1X8	single	Future Blind	2018-05-04	https://i.scdn.co/image/ab67616d0000b273c73b26645933bde63228275d	https://i.scdn.co/image/ab67616d00001e02c73b26645933bde63228275d	https://i.scdn.co/image/ab67616d00004851c73b26645933bde63228275d	1	2020-05-16 09:58:16.240825-04	2020-05-16 09:58:16.240825-04
5	1	6NpAhMmG0TkOpapqs6NFnj	https://open.spotify.com/album/6NpAhMmG0TkOpapqs6NFnj	single	Into the Unknown	2018-04-20	https://i.scdn.co/image/ab67616d0000b273e0f91ea6315c150d84e031be	https://i.scdn.co/image/ab67616d00001e02e0f91ea6315c150d84e031be	https://i.scdn.co/image/ab67616d00004851e0f91ea6315c150d84e031be	1	2020-05-16 09:58:16.241538-04	2020-05-16 09:58:16.241538-04
6	1	6YiRZ1vmvkFzFE5vyqlyVE	https://open.spotify.com/album/6YiRZ1vmvkFzFE5vyqlyVE	single	Oh Holiday!	2017-12-01	https://i.scdn.co/image/ab67616d0000b273f1200a416008e04036bac72e	https://i.scdn.co/image/ab67616d00001e02f1200a416008e04036bac72e	https://i.scdn.co/image/ab67616d00004851f1200a416008e04036bac72e	1	2020-05-16 09:58:16.242111-04	2020-05-16 09:58:16.242111-04
7	1	7AzPfN8g0WyOdnm39gL8Fq	https://open.spotify.com/album/7AzPfN8g0WyOdnm39gL8Fq	single	Paths	2017-08-24	https://i.scdn.co/image/ab67616d0000b27303884598027b1e539482c01b	https://i.scdn.co/image/ab67616d00001e0203884598027b1e539482c01b	https://i.scdn.co/image/ab67616d0000485103884598027b1e539482c01b	1	2020-05-16 09:58:16.243306-04	2020-05-16 09:58:16.243306-04
8	1	1RXH3OPO1el2Y5StktvAA3	https://open.spotify.com/album/1RXH3OPO1el2Y5StktvAA3	single	In Motion	2015-06-30	https://i.scdn.co/image/ab67616d0000b27326106801f125d96329616631	https://i.scdn.co/image/ab67616d00001e0226106801f125d96329616631	https://i.scdn.co/image/ab67616d0000485126106801f125d96329616631	1	2020-05-16 09:58:16.243813-04	2020-05-16 09:58:16.243813-04
9	1	0BXEuHF72MeLKk7aIxkqFE	https://open.spotify.com/album/0BXEuHF72MeLKk7aIxkqFE	single	Paths	2017-10-06	https://i.scdn.co/image/ab67616d0000b273bc91bca5c9ee2b1754eaee54	https://i.scdn.co/image/ab67616d00001e02bc91bca5c9ee2b1754eaee54	https://i.scdn.co/image/ab67616d00004851bc91bca5c9ee2b1754eaee54	5	2020-05-16 09:58:16.242779-04	2020-05-16 09:58:16.242779-04
10	1	7CDr6A6SgMosPV0y0Yr2Ao	https://open.spotify.com/album/7CDr6A6SgMosPV0y0Yr2Ao	single	Venice Remix EP	2014-06-10	https://i.scdn.co/image/ab67616d0000b27320f88f270acbc0472ddc2dbb	https://i.scdn.co/image/ab67616d00001e0220f88f270acbc0472ddc2dbb	https://i.scdn.co/image/ab67616d0000485120f88f270acbc0472ddc2dbb	5	2020-05-16 09:58:16.246155-04	2020-05-16 09:58:16.246155-04
11	1	5yJ22iq0UfHyXNH98QsVdo	https://open.spotify.com/album/5yJ22iq0UfHyXNH98QsVdo	single	I Want to Feel Alive	2015-06-09	https://i.scdn.co/image/ab67616d0000b2732cfc371b3ac8b43728d694c3	https://i.scdn.co/image/ab67616d00001e022cfc371b3ac8b43728d694c3	https://i.scdn.co/image/ab67616d000048512cfc371b3ac8b43728d694c3	1	2020-05-16 09:58:16.244319-04	2020-05-16 09:58:16.244319-04
12	1	3Hq0TflZat1Wjm1lOEyOoM	https://open.spotify.com/album/3Hq0TflZat1Wjm1lOEyOoM	single	Pioneers	2012-03-13	https://i.scdn.co/image/ab67616d0000b273239ef87c50c486154d017caf	https://i.scdn.co/image/ab67616d00001e02239ef87c50c486154d017caf	https://i.scdn.co/image/ab67616d00004851239ef87c50c486154d017caf	3	2020-05-16 09:58:16.246645-04	2020-05-16 09:58:16.246645-04
13	1	2aJqsS3r76WrInYk8nd3aI	https://open.spotify.com/album/2aJqsS3r76WrInYk8nd3aI	compilation	Degrassi: Music from Season 13, Vol. 2	2014-05-27	https://i.scdn.co/image/ab67616d0000b273303627c16acfa5a407a03695	https://i.scdn.co/image/ab67616d00001e02303627c16acfa5a407a03695	https://i.scdn.co/image/ab67616d00004851303627c16acfa5a407a03695	10	2020-05-16 09:58:16.247214-04	2020-05-16 09:58:16.247214-04
14	1	6haNV8YJU3h9ksymZZMAa7	https://open.spotify.com/album/6haNV8YJU3h9ksymZZMAa7	compilation	Cellar Door Volume IV	2013-03-08	https://i.scdn.co/image/ab67616d0000b273d8754449152d8bd350a7271e	https://i.scdn.co/image/ab67616d00001e02d8754449152d8bd350a7271e	https://i.scdn.co/image/ab67616d00004851d8754449152d8bd350a7271e	18	2020-05-16 09:58:16.247667-04	2020-05-16 09:58:16.247667-04
\.


--
-- Data for Name: artists; Type: TABLE DATA; Schema: public; Owner: ryanwalker
--

COPY public.artists (id, "spotifyId", name, "spotifyUrl", followers, created_at, updated_at) FROM stdin;
1	6ls5A8Wys9Swixpz4v6kj3	The Lighthouse And The Whaler	https://open.spotify.com/artist/6ls5A8Wys9Swixpz4v6kj3	41266	2020-05-16 09:13:47.536886-04	2020-05-16 09:13:47.536886-04
\.


--
-- Data for Name: audio-features; Type: TABLE DATA; Schema: public; Owner: ryanwalker
--

COPY public."audio-features" (id, "trackId", "spotifyId", "spotifyUrl", danceability, energy, key, loudness, mode, speechiness, acousticness, instrumentalness, liveness, valence, tempo, "timeSignature", "trackHref", "analysisUrl", created_at, updated_at) FROM stdin;
1	2	1P9eJXAxmkrhanjkIAd6ws	spotify:track:1P9eJXAxmkrhanjkIAd6ws	0.6	0.417	2	-10.306	1	0.038	0.156	1.43e-05	0.0638	0.242	124.04	4	https://api.spotify.com/v1/tracks/1P9eJXAxmkrhanjkIAd6ws	https://api.spotify.com/v1/audio-analysis/1P9eJXAxmkrhanjkIAd6ws	2020-05-16 13:45:38.108537-04	2020-05-16 13:45:38.108537-04
2	4	74uum3qeYsisECdy5CmPju	spotify:track:74uum3qeYsisECdy5CmPju	0.431	0.764	0	-5.271	1	0.0433	0.00521	0	0.064	0.924	154.743	4	https://api.spotify.com/v1/tracks/74uum3qeYsisECdy5CmPju	https://api.spotify.com/v1/audio-analysis/74uum3qeYsisECdy5CmPju	2020-05-16 13:45:38.1236-04	2020-05-16 13:45:38.1236-04
3	10	6GuvUhiNnzxUdUGlEEJuHQ	spotify:track:6GuvUhiNnzxUdUGlEEJuHQ	0.638	0.87	2	-3.895	1	0.0282	0.17	0.00034	0.197	0.832	89.979	4	https://api.spotify.com/v1/tracks/6GuvUhiNnzxUdUGlEEJuHQ	https://api.spotify.com/v1/audio-analysis/6GuvUhiNnzxUdUGlEEJuHQ	2020-05-16 13:45:38.124078-04	2020-05-16 13:45:38.124078-04
4	15	0f9M4GcYyBSMXENA41yo9M	spotify:track:0f9M4GcYyBSMXENA41yo9M	0.521	0.834	2	-5.786	0	0.0323	0.0352	3.16e-06	0.22	0.425	109.005	4	https://api.spotify.com/v1/tracks/0f9M4GcYyBSMXENA41yo9M	https://api.spotify.com/v1/audio-analysis/0f9M4GcYyBSMXENA41yo9M	2020-05-16 13:45:38.124829-04	2020-05-16 13:45:38.124829-04
5	19	014VoiTnsfCOOjCs1xyea3	spotify:track:014VoiTnsfCOOjCs1xyea3	0.44	0.872	8	-3.001	0	0.08	0.206	0	0.118	0.143	155.04	4	https://api.spotify.com/v1/tracks/014VoiTnsfCOOjCs1xyea3	https://api.spotify.com/v1/audio-analysis/014VoiTnsfCOOjCs1xyea3	2020-05-16 13:45:38.141735-04	2020-05-16 13:45:38.141735-04
6	14	3beBx7Mz5JsZI0jxohrQ5h	spotify:track:3beBx7Mz5JsZI0jxohrQ5h	0.607	0.627	8	-7.619	1	0.0457	0.0967	0.00254	0.344	0.322	124.01	4	https://api.spotify.com/v1/tracks/3beBx7Mz5JsZI0jxohrQ5h	https://api.spotify.com/v1/audio-analysis/3beBx7Mz5JsZI0jxohrQ5h	2020-05-16 13:45:38.161254-04	2020-05-16 13:45:38.161254-04
7	3	0gEGOIM1uIewOVWWeULTUm	spotify:track:0gEGOIM1uIewOVWWeULTUm	0.734	0.686	0	-7.778	1	0.0301	0.148	0.00309	0.0504	0.568	129.964	4	https://api.spotify.com/v1/tracks/0gEGOIM1uIewOVWWeULTUm	https://api.spotify.com/v1/audio-analysis/0gEGOIM1uIewOVWWeULTUm	2020-05-16 13:45:38.161817-04	2020-05-16 13:45:38.161817-04
8	72	2MZhH7k2TtL6nmbK7JbG2G	spotify:track:2MZhH7k2TtL6nmbK7JbG2G	0.435	0.744	2	-5.708	1	0.0327	0.00244	4.43e-06	0.125	0.115	150.097	4	https://api.spotify.com/v1/tracks/2MZhH7k2TtL6nmbK7JbG2G	https://api.spotify.com/v1/audio-analysis/2MZhH7k2TtL6nmbK7JbG2G	2020-05-16 13:45:38.162267-04	2020-05-16 13:45:38.162267-04
9	22	0gXVzTmxOV6XMHN5YibXyv	spotify:track:0gXVzTmxOV6XMHN5YibXyv	0.517	0.8	9	-7.096	1	0.0279	0.314	0.00116	0.141	0.61	149.103	4	https://api.spotify.com/v1/tracks/0gXVzTmxOV6XMHN5YibXyv	https://api.spotify.com/v1/audio-analysis/0gXVzTmxOV6XMHN5YibXyv	2020-05-16 13:45:38.162795-04	2020-05-16 13:45:38.162795-04
10	64	08XJkZXrnSlZ8AZiCSNuxp	spotify:track:08XJkZXrnSlZ8AZiCSNuxp	0.434	0.808	9	-7.704	0	0.0322	0.271	6.11e-06	0.191	0.509	160.119	4	https://api.spotify.com/v1/tracks/08XJkZXrnSlZ8AZiCSNuxp	https://api.spotify.com/v1/audio-analysis/08XJkZXrnSlZ8AZiCSNuxp	2020-05-16 13:45:38.1634-04	2020-05-16 13:45:38.1634-04
11	1	3wvvtB5FeboO9piUEwLkCK	spotify:track:3wvvtB5FeboO9piUEwLkCK	0.523	0.688	0	-7.747	1	0.0347	0.023	0.0148	0.0886	0.301	130.002	4	https://api.spotify.com/v1/tracks/3wvvtB5FeboO9piUEwLkCK	https://api.spotify.com/v1/audio-analysis/3wvvtB5FeboO9piUEwLkCK	2020-05-16 13:45:38.173866-04	2020-05-16 13:45:38.173866-04
12	71	6lVfTeGWOnimwikUVTag45	spotify:track:6lVfTeGWOnimwikUVTag45	0.613	0.665	2	-6.625	1	0.0285	0.327	0.0122	0.269	0.217	118.098	4	https://api.spotify.com/v1/tracks/6lVfTeGWOnimwikUVTag45	https://api.spotify.com/v1/audio-analysis/6lVfTeGWOnimwikUVTag45	2020-05-16 13:45:38.176316-04	2020-05-16 13:45:38.176316-04
13	75	74MXcelAYD19tpT6B33uVg	spotify:track:74MXcelAYD19tpT6B33uVg	0.435	0.744	2	-5.708	1	0.0327	0.00244	4.43e-06	0.125	0.115	150.097	4	https://api.spotify.com/v1/tracks/74MXcelAYD19tpT6B33uVg	https://api.spotify.com/v1/audio-analysis/74MXcelAYD19tpT6B33uVg	2020-05-16 13:45:38.178386-04	2020-05-16 13:45:38.178386-04
14	38	1xWFIA47dN7kKgB3pmuL1a	spotify:track:1xWFIA47dN7kKgB3pmuL1a	0.607	0.416	2	-10.312	1	0.0389	0.168	1.44e-05	0.0659	0.24	124.028	4	https://api.spotify.com/v1/tracks/1xWFIA47dN7kKgB3pmuL1a	https://api.spotify.com/v1/audio-analysis/1xWFIA47dN7kKgB3pmuL1a	2020-05-16 13:45:38.178756-04	2020-05-16 13:45:38.178756-04
15	44	6ZhlUtuvIbcISpjwlCwero	spotify:track:6ZhlUtuvIbcISpjwlCwero	0.451	0.435	2	-8.44	1	0.0336	0.0798	0.00141	0.109	0.106	129.99	4	https://api.spotify.com/v1/tracks/6ZhlUtuvIbcISpjwlCwero	https://api.spotify.com/v1/audio-analysis/6ZhlUtuvIbcISpjwlCwero	2020-05-16 13:45:38.179426-04	2020-05-16 13:45:38.179426-04
16	17	3MIqdEgFsprJhehbTFDXNe	spotify:track:3MIqdEgFsprJhehbTFDXNe	0.559	0.215	2	-15.189	1	0.0364	0.901	0.00295	0.0941	0.467	76.514	4	https://api.spotify.com/v1/tracks/3MIqdEgFsprJhehbTFDXNe	https://api.spotify.com/v1/audio-analysis/3MIqdEgFsprJhehbTFDXNe	2020-05-16 13:45:38.180095-04	2020-05-16 13:45:38.180095-04
17	57	1Th26i0FUY7xMzUI2ytdhY	spotify:track:1Th26i0FUY7xMzUI2ytdhY	0.793	0.552	6	-10.691	1	0.0821	0.466	0.0751	0.0874	0.166	119.957	4	https://api.spotify.com/v1/tracks/1Th26i0FUY7xMzUI2ytdhY	https://api.spotify.com/v1/audio-analysis/1Th26i0FUY7xMzUI2ytdhY	2020-05-16 13:45:38.18047-04	2020-05-16 13:45:38.18047-04
18	76	5h5Vdyy1p5ZHrrAuFLdgaT	spotify:track:5h5Vdyy1p5ZHrrAuFLdgaT	0.39	0.809	2	-5.424	1	0.0439	0.00347	0.0151	0.442	0.387	75.016	4	https://api.spotify.com/v1/tracks/5h5Vdyy1p5ZHrrAuFLdgaT	https://api.spotify.com/v1/audio-analysis/5h5Vdyy1p5ZHrrAuFLdgaT	2020-05-16 13:45:38.180825-04	2020-05-16 13:45:38.180825-04
19	37	2f5dViEC0bNW1dgORpeiGc	spotify:track:2f5dViEC0bNW1dgORpeiGc	0.523	0.688	0	-7.747	1	0.0347	0.023	0.0148	0.0886	0.301	130.002	4	https://api.spotify.com/v1/tracks/2f5dViEC0bNW1dgORpeiGc	https://api.spotify.com/v1/audio-analysis/2f5dViEC0bNW1dgORpeiGc	2020-05-16 13:45:38.1812-04	2020-05-16 13:45:38.1812-04
20	67	6ROx3Zds2tplbPgql60RKc	spotify:track:6ROx3Zds2tplbPgql60RKc	0.218	0.291	0	-8.833	1	0.0295	0.846	0.0333	0.115	0.134	93.952	3	https://api.spotify.com/v1/tracks/6ROx3Zds2tplbPgql60RKc	https://api.spotify.com/v1/audio-analysis/6ROx3Zds2tplbPgql60RKc	2020-05-16 13:45:38.181569-04	2020-05-16 13:45:38.181569-04
21	16	7zWO2V6chyRiXrthQ0uXgH	spotify:track:7zWO2V6chyRiXrthQ0uXgH	0.483	0.591	11	-9.886	0	0.0369	0.0272	0.00962	0.115	0.448	119.208	4	https://api.spotify.com/v1/tracks/7zWO2V6chyRiXrthQ0uXgH	https://api.spotify.com/v1/audio-analysis/7zWO2V6chyRiXrthQ0uXgH	2020-05-16 13:45:38.182087-04	2020-05-16 13:45:38.182087-04
22	25	57mqW6s30u14eSmxsHhNLx	spotify:track:57mqW6s30u14eSmxsHhNLx	0.341	0.905	4	-4.824	0	0.0484	1.15e-05	0.27	0.403	0.282	157.877	3	https://api.spotify.com/v1/tracks/57mqW6s30u14eSmxsHhNLx	https://api.spotify.com/v1/audio-analysis/57mqW6s30u14eSmxsHhNLx	2020-05-16 13:45:38.182487-04	2020-05-16 13:45:38.182487-04
23	5	15KUDgDxvkghmtB6FxI7Dt	spotify:track:15KUDgDxvkghmtB6FxI7Dt	0.665	0.571	0	-8.157	1	0.0261	0.303	7.64e-06	0.0605	0.636	104.03	4	https://api.spotify.com/v1/tracks/15KUDgDxvkghmtB6FxI7Dt	https://api.spotify.com/v1/audio-analysis/15KUDgDxvkghmtB6FxI7Dt	2020-05-16 13:45:38.183362-04	2020-05-16 13:45:38.183362-04
24	28	1hjVFYjFMzSyZPg6B3cXL6	spotify:track:1hjVFYjFMzSyZPg6B3cXL6	0.403	0.659	1	-5.452	1	0.0349	0.09	0.000765	0.211	0.385	78.464	4	https://api.spotify.com/v1/tracks/1hjVFYjFMzSyZPg6B3cXL6	https://api.spotify.com/v1/audio-analysis/1hjVFYjFMzSyZPg6B3cXL6	2020-05-16 13:45:38.184429-04	2020-05-16 13:45:38.184429-04
25	21	0ftVc9y2dQ1YaARR0t1Krp	spotify:track:0ftVc9y2dQ1YaARR0t1Krp	0.369	0.766	2	-7.903	1	0.0422	0.00739	0.00239	0.137	0.877	151.48	4	https://api.spotify.com/v1/tracks/0ftVc9y2dQ1YaARR0t1Krp	https://api.spotify.com/v1/audio-analysis/0ftVc9y2dQ1YaARR0t1Krp	2020-05-16 13:45:38.185086-04	2020-05-16 13:45:38.185086-04
26	7	18z06SShzY4JZYaXKBypah	spotify:track:18z06SShzY4JZYaXKBypah	0.49	0.553	7	-7.232	1	0.0296	0.0253	0.0806	0.112	0.296	128.946	4	https://api.spotify.com/v1/tracks/18z06SShzY4JZYaXKBypah	https://api.spotify.com/v1/audio-analysis/18z06SShzY4JZYaXKBypah	2020-05-16 13:45:38.186364-04	2020-05-16 13:45:38.186364-04
27	9	1zaK9B8LvRUNJO4yuZiX6H	spotify:track:1zaK9B8LvRUNJO4yuZiX6H	0.529	0.764	9	-6.09	0	0.0367	0.00895	0.16	0.238	0.311	114.972	4	https://api.spotify.com/v1/tracks/1zaK9B8LvRUNJO4yuZiX6H	https://api.spotify.com/v1/audio-analysis/1zaK9B8LvRUNJO4yuZiX6H	2020-05-16 13:45:38.187361-04	2020-05-16 13:45:38.187361-04
28	24	5nBrzZjCD4V1nPnKWyslxC	spotify:track:5nBrzZjCD4V1nPnKWyslxC	0.291	0.597	0	-9.831	1	0.0575	7.7e-05	0.306	0.201	0.369	146.239	4	https://api.spotify.com/v1/tracks/5nBrzZjCD4V1nPnKWyslxC	https://api.spotify.com/v1/audio-analysis/5nBrzZjCD4V1nPnKWyslxC	2020-05-16 13:45:38.189003-04	2020-05-16 13:45:38.189003-04
29	32	002NUzjuGirNgE34m0ZqBb	spotify:track:002NUzjuGirNgE34m0ZqBb	0.406	0.501	7	-7.944	1	0.0284	0.111	0.000283	0.139	0.171	139.808	4	https://api.spotify.com/v1/tracks/002NUzjuGirNgE34m0ZqBb	https://api.spotify.com/v1/audio-analysis/002NUzjuGirNgE34m0ZqBb	2020-05-16 13:45:38.190697-04	2020-05-16 13:45:38.190697-04
37	29	5XpT1nU9wrdjl2OCNzV3K4	spotify:track:5XpT1nU9wrdjl2OCNzV3K4	0.511	0.803	2	-3.586	1	0.0348	0.00133	0	0.0854	0.547	170.109	4	https://api.spotify.com/v1/tracks/5XpT1nU9wrdjl2OCNzV3K4	https://api.spotify.com/v1/audio-analysis/5XpT1nU9wrdjl2OCNzV3K4	2020-05-16 13:45:38.195183-04	2020-05-16 13:45:38.195183-04
44	27	5K0T4yFMMxG2wLp11m1AnJ	spotify:track:5K0T4yFMMxG2wLp11m1AnJ	0.426	0.519	9	-4.812	1	0.0334	0.000146	0.469	0.128	0.227	110.087	3	https://api.spotify.com/v1/tracks/5K0T4yFMMxG2wLp11m1AnJ	https://api.spotify.com/v1/audio-analysis/5K0T4yFMMxG2wLp11m1AnJ	2020-05-16 13:45:38.198775-04	2020-05-16 13:45:38.198775-04
52	11	45Xml2EJBa6HNTtsqd7Ybs	spotify:track:45Xml2EJBa6HNTtsqd7Ybs	0.506	0.421	2	-8.735	1	0.0238	0.223	4.76e-05	0.109	0.101	95.035	4	https://api.spotify.com/v1/tracks/45Xml2EJBa6HNTtsqd7Ybs	https://api.spotify.com/v1/audio-analysis/45Xml2EJBa6HNTtsqd7Ybs	2020-05-16 13:45:38.203109-04	2020-05-16 13:45:38.203109-04
58	55	61xiEXr9n59BtEsyL87Wmi	spotify:track:61xiEXr9n59BtEsyL87Wmi	0.617	0.714	10	-9.432	1	0.0319	0.00102	0.0643	0.0906	0.828	102.005	4	https://api.spotify.com/v1/tracks/61xiEXr9n59BtEsyL87Wmi	https://api.spotify.com/v1/audio-analysis/61xiEXr9n59BtEsyL87Wmi	2020-05-16 13:45:38.206299-04	2020-05-16 13:45:38.206299-04
66	6	12qJKfqfUz8PejsKlxADZJ	spotify:track:12qJKfqfUz8PejsKlxADZJ	0.526	0.727	9	-6.054	0	0.036	0.215	0.0063	0.0942	0.27	120.009	4	https://api.spotify.com/v1/tracks/12qJKfqfUz8PejsKlxADZJ	https://api.spotify.com/v1/audio-analysis/12qJKfqfUz8PejsKlxADZJ	2020-05-16 13:45:38.209857-04	2020-05-16 13:45:38.209857-04
74	47	0GhjZQB0iXImDNlJwp4SUl	spotify:track:0GhjZQB0iXImDNlJwp4SUl	0.669	0.469	0	-7.389	1	0.0239	0.00824	0.000101	0.137	0.467	103.091	4	https://api.spotify.com/v1/tracks/0GhjZQB0iXImDNlJwp4SUl	https://api.spotify.com/v1/audio-analysis/0GhjZQB0iXImDNlJwp4SUl	2020-05-16 13:45:38.213566-04	2020-05-16 13:45:38.213566-04
30	58	51YX1WKYGHzOuxiBgL3IyC	spotify:track:51YX1WKYGHzOuxiBgL3IyC	0.361	0.254	3	-9.014	1	0.0353	0.737	0	0.0707	0.155	179.714	4	https://api.spotify.com/v1/tracks/51YX1WKYGHzOuxiBgL3IyC	https://api.spotify.com/v1/audio-analysis/51YX1WKYGHzOuxiBgL3IyC	2020-05-16 13:45:38.191186-04	2020-05-16 13:45:38.191186-04
38	30	5fwgKHlLJbewhGfEN0VHAP	spotify:track:5fwgKHlLJbewhGfEN0VHAP	0.574	0.673	9	-10.296	1	0.0353	0.347	0.00949	0.216	0.651	128.889	4	https://api.spotify.com/v1/tracks/5fwgKHlLJbewhGfEN0VHAP	https://api.spotify.com/v1/audio-analysis/5fwgKHlLJbewhGfEN0VHAP	2020-05-16 13:45:38.195646-04	2020-05-16 13:45:38.195646-04
45	23	6esfFRYMue1JRncapQd8lW	spotify:track:6esfFRYMue1JRncapQd8lW	0.47	0.494	2	-8.65	1	0.0285	0.6	0.133	0.0988	0.0662	115.059	4	https://api.spotify.com/v1/tracks/6esfFRYMue1JRncapQd8lW	https://api.spotify.com/v1/audio-analysis/6esfFRYMue1JRncapQd8lW	2020-05-16 13:45:38.199286-04	2020-05-16 13:45:38.199286-04
53	61	6v34zNG3wYTQGExzPyl89D	spotify:track:6v34zNG3wYTQGExzPyl89D	0.373	0.693	6	-7.678	1	0.0544	0.0294	0	0.126	0.442	143.395	4	https://api.spotify.com/v1/tracks/6v34zNG3wYTQGExzPyl89D	https://api.spotify.com/v1/audio-analysis/6v34zNG3wYTQGExzPyl89D	2020-05-16 13:45:38.203507-04	2020-05-16 13:45:38.203507-04
63	20	1ohvoy3do0foFTcFoREkkR	spotify:track:1ohvoy3do0foFTcFoREkkR	0.486	0.839	1	-6.065	1	0.033	0.152	5.85e-05	0.0811	0.536	96.387	4	https://api.spotify.com/v1/tracks/1ohvoy3do0foFTcFoREkkR	https://api.spotify.com/v1/audio-analysis/1ohvoy3do0foFTcFoREkkR	2020-05-16 13:45:38.208799-04	2020-05-16 13:45:38.208799-04
72	66	06UtfzJaPJHDRNII9aTxDQ	spotify:track:06UtfzJaPJHDRNII9aTxDQ	0.492	0.385	4	-8.926	0	0.0271	0.711	0.152	0.175	0.0396	124.994	4	https://api.spotify.com/v1/tracks/06UtfzJaPJHDRNII9aTxDQ	https://api.spotify.com/v1/audio-analysis/06UtfzJaPJHDRNII9aTxDQ	2020-05-16 13:45:38.212561-04	2020-05-16 13:45:38.212561-04
31	48	4rJBx7ZbeoY1Q1VGGkuc1E	spotify:track:4rJBx7ZbeoY1Q1VGGkuc1E	0.72	0.457	0	-7.415	1	0.0317	0.41	0.0126	0.101	0.569	105.013	4	https://api.spotify.com/v1/tracks/4rJBx7ZbeoY1Q1VGGkuc1E	https://api.spotify.com/v1/audio-analysis/4rJBx7ZbeoY1Q1VGGkuc1E	2020-05-16 13:45:38.191448-04	2020-05-16 13:45:38.191448-04
39	74	1kaBZyU084J4HWCDcWby88	spotify:track:1kaBZyU084J4HWCDcWby88	0.602	0.805	2	-3.874	1	0.0624	0.00785	0	0.172	0.712	125.035	4	https://api.spotify.com/v1/tracks/1kaBZyU084J4HWCDcWby88	https://api.spotify.com/v1/audio-analysis/1kaBZyU084J4HWCDcWby88	2020-05-16 13:45:38.195878-04	2020-05-16 13:45:38.195878-04
46	26	2eSadqDmxj2ybqPOgzfn9h	spotify:track:2eSadqDmxj2ybqPOgzfn9h	0.279	0.856	8	-4.389	1	0.0408	1.57e-05	0	0.369	0.397	178.253	4	https://api.spotify.com/v1/tracks/2eSadqDmxj2ybqPOgzfn9h	https://api.spotify.com/v1/audio-analysis/2eSadqDmxj2ybqPOgzfn9h	2020-05-16 13:45:38.199559-04	2020-05-16 13:45:38.199559-04
54	59	6s3w2iKlhFHT8WB8MyxOaI	spotify:track:6s3w2iKlhFHT8WB8MyxOaI	0.525	0.332	7	-13.155	1	0.0273	0.631	0	0.0967	0.146	134.149	4	https://api.spotify.com/v1/tracks/6s3w2iKlhFHT8WB8MyxOaI	https://api.spotify.com/v1/audio-analysis/6s3w2iKlhFHT8WB8MyxOaI	2020-05-16 13:45:38.203831-04	2020-05-16 13:45:38.203831-04
65	56	7840VwyCl71RjvSWYTHMRs	spotify:track:7840VwyCl71RjvSWYTHMRs	0.552	0.959	11	-1.801	1	0.0505	0.00079	1.5e-06	0.668	0.623	115.169	4	https://api.spotify.com/v1/tracks/7840VwyCl71RjvSWYTHMRs	https://api.spotify.com/v1/audio-analysis/7840VwyCl71RjvSWYTHMRs	2020-05-16 13:45:38.209365-04	2020-05-16 13:45:38.209365-04
32	46	0PsCdWEczdow0ZYgmRd1Mq	spotify:track:0PsCdWEczdow0ZYgmRd1Mq	0.382	0.334	0	-10.365	1	0.0281	0.441	0.00563	0.0832	0.069	143.19	4	https://api.spotify.com/v1/tracks/0PsCdWEczdow0ZYgmRd1Mq	https://api.spotify.com/v1/audio-analysis/0PsCdWEczdow0ZYgmRd1Mq	2020-05-16 13:45:38.191711-04	2020-05-16 13:45:38.191711-04
48	8	4z72e87zWhwJWhTz7TXfSV	spotify:track:4z72e87zWhwJWhTz7TXfSV	0.625	0.693	0	-6.377	1	0.0312	0.00797	0.00477	0.0972	0.554	130.009	4	https://api.spotify.com/v1/tracks/4z72e87zWhwJWhTz7TXfSV	https://api.spotify.com/v1/audio-analysis/4z72e87zWhwJWhTz7TXfSV	2020-05-16 13:45:38.200184-04	2020-05-16 13:45:38.200184-04
61	54	6HgeqKb0cKEwBip9w5BwGv	spotify:track:6HgeqKb0cKEwBip9w5BwGv	0.274	0.905	0	-6.153	1	0.0492	0.00171	0.000119	0.359	0.53	158.558	4	https://api.spotify.com/v1/tracks/6HgeqKb0cKEwBip9w5BwGv	https://api.spotify.com/v1/audio-analysis/6HgeqKb0cKEwBip9w5BwGv	2020-05-16 13:45:38.207191-04	2020-05-16 13:45:38.207191-04
76	43	6AATVBcb2BfU3uuCUz0H8U	spotify:track:6AATVBcb2BfU3uuCUz0H8U	0.481	0.732	9	-6.208	0	0.0435	0.00013	0.414	0.0609	0.308	127.043	4	https://api.spotify.com/v1/tracks/6AATVBcb2BfU3uuCUz0H8U	https://api.spotify.com/v1/audio-analysis/6AATVBcb2BfU3uuCUz0H8U	2020-05-16 13:45:38.214553-04	2020-05-16 13:45:38.214553-04
33	31	2JU3lpoAvgxpElt7oMisnC	spotify:track:2JU3lpoAvgxpElt7oMisnC	0.32	0.505	0	-9.269	1	0.0348	0.185	0.842	0.141	0.198	133.331	4	https://api.spotify.com/v1/tracks/2JU3lpoAvgxpElt7oMisnC	https://api.spotify.com/v1/audio-analysis/2JU3lpoAvgxpElt7oMisnC	2020-05-16 13:45:38.193348-04	2020-05-16 13:45:38.193348-04
42	68	5XvS3t5O7c9X8cSoIIp3At	spotify:track:5XvS3t5O7c9X8cSoIIp3At	0.513	0.84	2	-6.07	1	0.0321	0.183	0.0546	0.106	0.269	95.048	4	https://api.spotify.com/v1/tracks/5XvS3t5O7c9X8cSoIIp3At	https://api.spotify.com/v1/audio-analysis/5XvS3t5O7c9X8cSoIIp3At	2020-05-16 13:45:38.19737-04	2020-05-16 13:45:38.19737-04
49	50	4rbwnul12vKm58t4lOcoZF	spotify:track:4rbwnul12vKm58t4lOcoZF	0.588	0.678	6	-4.491	0	0.0312	0.0268	0.0444	0.149	0.229	167.97	4	https://api.spotify.com/v1/tracks/4rbwnul12vKm58t4lOcoZF	https://api.spotify.com/v1/audio-analysis/4rbwnul12vKm58t4lOcoZF	2020-05-16 13:45:38.201486-04	2020-05-16 13:45:38.201486-04
57	51	3nyOKUXV7sQ606GTFpDX1q	spotify:track:3nyOKUXV7sQ606GTFpDX1q	0.601	0.428	0	-10.953	1	0.0303	0.171	3.96e-05	0.139	0.13	79.996	4	https://api.spotify.com/v1/tracks/3nyOKUXV7sQ606GTFpDX1q	https://api.spotify.com/v1/audio-analysis/3nyOKUXV7sQ606GTFpDX1q	2020-05-16 13:45:38.205505-04	2020-05-16 13:45:38.205505-04
69	34	3MQdCK4g3gyE2cDZtjV8YB	spotify:track:3MQdCK4g3gyE2cDZtjV8YB	0.734	0.686	0	-7.778	1	0.0301	0.148	0.00309	0.0504	0.568	129.964	4	https://api.spotify.com/v1/tracks/3MQdCK4g3gyE2cDZtjV8YB	https://api.spotify.com/v1/audio-analysis/3MQdCK4g3gyE2cDZtjV8YB	2020-05-16 13:45:38.2112-04	2020-05-16 13:45:38.2112-04
77	39	6xeQ4BbNVTaB0IvIHKESK2	spotify:track:6xeQ4BbNVTaB0IvIHKESK2	0.377	0.367	7	-9.448	1	0.0306	0.343	0.00456	0.113	0.389	154.602	4	https://api.spotify.com/v1/tracks/6xeQ4BbNVTaB0IvIHKESK2	https://api.spotify.com/v1/audio-analysis/6xeQ4BbNVTaB0IvIHKESK2	2020-05-16 13:45:38.214902-04	2020-05-16 13:45:38.214902-04
34	12	7nq1MRmLZwbnpjcr6AnxFy	spotify:track:7nq1MRmLZwbnpjcr6AnxFy	0.621	0.67	0	-6.241	1	0.0269	0.0277	2.11e-06	0.194	0.483	123.017	4	https://api.spotify.com/v1/tracks/7nq1MRmLZwbnpjcr6AnxFy	https://api.spotify.com/v1/audio-analysis/7nq1MRmLZwbnpjcr6AnxFy	2020-05-16 13:45:38.193733-04	2020-05-16 13:45:38.193733-04
43	45	6yv6Tcl8hBczRiMUW40P41	spotify:track:6yv6Tcl8hBczRiMUW40P41	0.547	0.593	0	-7.256	1	0.0301	0.0017	8.66e-06	0.226	0.286	119.971	4	https://api.spotify.com/v1/tracks/6yv6Tcl8hBczRiMUW40P41	https://api.spotify.com/v1/audio-analysis/6yv6Tcl8hBczRiMUW40P41	2020-05-16 13:45:38.197635-04	2020-05-16 13:45:38.197635-04
55	42	3RETkaUWjLG7cBOj1VLEQz	spotify:track:3RETkaUWjLG7cBOj1VLEQz	0.489	0.65	7	-8.38	1	0.0256	0.000786	0.00445	0.25	0.592	155.01	4	https://api.spotify.com/v1/tracks/3RETkaUWjLG7cBOj1VLEQz	https://api.spotify.com/v1/audio-analysis/3RETkaUWjLG7cBOj1VLEQz	2020-05-16 13:45:38.204092-04	2020-05-16 13:45:38.204092-04
62	63	790IIdLD4PoR5cqxunPNsR	spotify:track:790IIdLD4PoR5cqxunPNsR	0.525	0.697	0	-6.968	1	0.0257	0.0219	1.8e-05	0.0664	0.46	105.078	4	https://api.spotify.com/v1/tracks/790IIdLD4PoR5cqxunPNsR	https://api.spotify.com/v1/audio-analysis/790IIdLD4PoR5cqxunPNsR	2020-05-16 13:45:38.208067-04	2020-05-16 13:45:38.208067-04
71	77	4yuJmyZN8R7BHsW37r2giO	spotify:track:4yuJmyZN8R7BHsW37r2giO	0.45	0.816	0	-4.134	1	0.0381	0.00428	0	0.356	0.561	102.032	4	https://api.spotify.com/v1/tracks/4yuJmyZN8R7BHsW37r2giO	https://api.spotify.com/v1/audio-analysis/4yuJmyZN8R7BHsW37r2giO	2020-05-16 13:45:38.212188-04	2020-05-16 13:45:38.212188-04
35	40	1kwgFd0jiaALIuYuP3GoTk	spotify:track:1kwgFd0jiaALIuYuP3GoTk	0.501	0.551	11	-6.542	1	0.029	0.014	0.00122	0.131	0.384	127.974	4	https://api.spotify.com/v1/tracks/1kwgFd0jiaALIuYuP3GoTk	https://api.spotify.com/v1/audio-analysis/1kwgFd0jiaALIuYuP3GoTk	2020-05-16 13:45:38.194182-04	2020-05-16 13:45:38.194182-04
50	69	2hOQ1TR78TkYU2gbtaK1gm	spotify:track:2hOQ1TR78TkYU2gbtaK1gm	0.537	0.565	6	-7.848	1	0.0274	0.117	0.0102	0.0937	0.401	145.066	4	https://api.spotify.com/v1/tracks/2hOQ1TR78TkYU2gbtaK1gm	https://api.spotify.com/v1/audio-analysis/2hOQ1TR78TkYU2gbtaK1gm	2020-05-16 13:45:38.202052-04	2020-05-16 13:45:38.202052-04
59	13	37POsvF7xupvgDnYYIXoYX	spotify:track:37POsvF7xupvgDnYYIXoYX	0.573	0.652	2	-7.622	1	0.0302	0.0107	0	0.18	0.192	126.022	4	https://api.spotify.com/v1/tracks/37POsvF7xupvgDnYYIXoYX	https://api.spotify.com/v1/audio-analysis/37POsvF7xupvgDnYYIXoYX	2020-05-16 13:45:38.206571-04	2020-05-16 13:45:38.206571-04
67	70	4TQBsE2d7MAMIS4NW5gQMG	spotify:track:4TQBsE2d7MAMIS4NW5gQMG	0.207	0.235	9	-9.461	0	0.0306	0.885	0.0338	0.337	0.112	74.202	4	https://api.spotify.com/v1/tracks/4TQBsE2d7MAMIS4NW5gQMG	https://api.spotify.com/v1/audio-analysis/4TQBsE2d7MAMIS4NW5gQMG	2020-05-16 13:45:38.210153-04	2020-05-16 13:45:38.210153-04
75	60	1sLlGFx6UqgNtu62Xb49la	spotify:track:1sLlGFx6UqgNtu62Xb49la	0.614	0.679	2	-5.542	1	0.0342	0.238	0	0.251	0.399	93.957	4	https://api.spotify.com/v1/tracks/1sLlGFx6UqgNtu62Xb49la	https://api.spotify.com/v1/audio-analysis/1sLlGFx6UqgNtu62Xb49la	2020-05-16 13:45:38.21384-04	2020-05-16 13:45:38.21384-04
36	36	73WHYbHemNFVXvOdF9UJQk	spotify:track:73WHYbHemNFVXvOdF9UJQk	0.506	0.421	2	-8.735	1	0.0238	0.223	4.76e-05	0.109	0.101	95.035	4	https://api.spotify.com/v1/tracks/73WHYbHemNFVXvOdF9UJQk	https://api.spotify.com/v1/audio-analysis/73WHYbHemNFVXvOdF9UJQk	2020-05-16 13:45:38.194573-04	2020-05-16 13:45:38.194573-04
51	33	5Y9QBB0jKP7RDaEvxxUwjH	spotify:track:5Y9QBB0jKP7RDaEvxxUwjH	0.548	0.719	0	-5.118	1	0.0284	0.209	7.77e-06	0.0746	0.685	88.929	4	https://api.spotify.com/v1/tracks/5Y9QBB0jKP7RDaEvxxUwjH	https://api.spotify.com/v1/audio-analysis/5Y9QBB0jKP7RDaEvxxUwjH	2020-05-16 13:45:38.20236-04	2020-05-16 13:45:38.20236-04
64	18	0n2yBAjy5VXoEhDFfG7uOV	spotify:track:0n2yBAjy5VXoEhDFfG7uOV	0.529	0.758	9	-6.087	0	0.0362	0.00886	0.113	0.315	0.294	114.996	4	https://api.spotify.com/v1/tracks/0n2yBAjy5VXoEhDFfG7uOV	https://api.spotify.com/v1/audio-analysis/0n2yBAjy5VXoEhDFfG7uOV	2020-05-16 13:45:38.209092-04	2020-05-16 13:45:38.209092-04
73	41	7cxOEeIEdkp13dpRmF0nzO	spotify:track:7cxOEeIEdkp13dpRmF0nzO	0.343	0.369	0	-8.246	1	0.0285	0.0368	0.0505	0.0813	0.067	80.047	4	https://api.spotify.com/v1/tracks/7cxOEeIEdkp13dpRmF0nzO	https://api.spotify.com/v1/audio-analysis/7cxOEeIEdkp13dpRmF0nzO	2020-05-16 13:45:38.212986-04	2020-05-16 13:45:38.212986-04
40	65	4jar8KtB25FHzTKFdsbNwA	spotify:track:4jar8KtB25FHzTKFdsbNwA	0.576	0.758	9	-6.748	0	0.0242	0.0981	0.00116	0.0972	0.656	89.961	4	https://api.spotify.com/v1/tracks/4jar8KtB25FHzTKFdsbNwA	https://api.spotify.com/v1/audio-analysis/4jar8KtB25FHzTKFdsbNwA	2020-05-16 13:45:38.196173-04	2020-05-16 13:45:38.196173-04
47	35	5NdAiJn8WyAhkaBdbKFRcX	spotify:track:5NdAiJn8WyAhkaBdbKFRcX	0.625	0.693	0	-6.377	1	0.0312	0.00797	0.00477	0.0972	0.554	130.009	4	https://api.spotify.com/v1/tracks/5NdAiJn8WyAhkaBdbKFRcX	https://api.spotify.com/v1/audio-analysis/5NdAiJn8WyAhkaBdbKFRcX	2020-05-16 13:45:38.199804-04	2020-05-16 13:45:38.199804-04
60	49	4iCpqcwYc4YxTpHekTmWvn	spotify:track:4iCpqcwYc4YxTpHekTmWvn	0.594	0.683	0	-8.582	1	0.0389	0.0638	0.000401	0.493	0.437	104.014	4	https://api.spotify.com/v1/tracks/4iCpqcwYc4YxTpHekTmWvn	https://api.spotify.com/v1/audio-analysis/4iCpqcwYc4YxTpHekTmWvn	2020-05-16 13:45:38.206905-04	2020-05-16 13:45:38.206905-04
68	53	5xenYUhLjsF1T3ZiKmvLd2	spotify:track:5xenYUhLjsF1T3ZiKmvLd2	0.464	0.966	7	-4.623	1	0.06	0.00552	6.52e-06	0.0785	0.595	143.956	4	https://api.spotify.com/v1/tracks/5xenYUhLjsF1T3ZiKmvLd2	https://api.spotify.com/v1/audio-analysis/5xenYUhLjsF1T3ZiKmvLd2	2020-05-16 13:45:38.210919-04	2020-05-16 13:45:38.210919-04
41	52	3vUDkRlIkyB9JlhSg3ZJ4g	spotify:track:3vUDkRlIkyB9JlhSg3ZJ4g	0.734	0.686	0	-7.778	1	0.0301	0.148	0.00309	0.0504	0.568	129.964	4	https://api.spotify.com/v1/tracks/3vUDkRlIkyB9JlhSg3ZJ4g	https://api.spotify.com/v1/audio-analysis/3vUDkRlIkyB9JlhSg3ZJ4g	2020-05-16 13:45:38.196502-04	2020-05-16 13:45:38.196502-04
56	73	0iMGKSkVJxmYTVibcRrkTz	spotify:track:0iMGKSkVJxmYTVibcRrkTz	0.313	0.741	5	-5.792	1	0.0318	0.0043	0.00109	0.0961	0.129	135.25	4	https://api.spotify.com/v1/tracks/0iMGKSkVJxmYTVibcRrkTz	https://api.spotify.com/v1/audio-analysis/0iMGKSkVJxmYTVibcRrkTz	2020-05-16 13:45:38.204742-04	2020-05-16 13:45:38.204742-04
70	62	7JnJdw0Wq6xrExON73NLjJ	spotify:track:7JnJdw0Wq6xrExON73NLjJ	0.478	0.301	0	-9.548	1	0.037	0.666	0.0129	0.112	0.116	120.221	4	https://api.spotify.com/v1/tracks/7JnJdw0Wq6xrExON73NLjJ	https://api.spotify.com/v1/audio-analysis/7JnJdw0Wq6xrExON73NLjJ	2020-05-16 13:45:38.211575-04	2020-05-16 13:45:38.211575-04
\.


--
-- Data for Name: knex_migrations; Type: TABLE DATA; Schema: public; Owner: ryanwalker
--

COPY public.knex_migrations (id, name, batch, migration_time) FROM stdin;
1	20200516083930_create-artists-table.js	1	2020-05-16 08:49:21.304-04
2	20200516093311_create-albums-table.js	2	2020-05-16 09:46:32.62-04
3	20200516124027_create-tracks-table.js	3	2020-05-16 12:46:12.37-04
8	20200516125758_create-audio-features-table.js	4	2020-05-16 13:45:31.282-04
\.


--
-- Data for Name: knex_migrations_lock; Type: TABLE DATA; Schema: public; Owner: ryanwalker
--

COPY public.knex_migrations_lock (index, is_locked) FROM stdin;
1	0
\.


--
-- Data for Name: tracks; Type: TABLE DATA; Schema: public; Owner: ryanwalker
--

COPY public.tracks (id, "albumId", "spotifyId", "spotifyUrl", "trackNumber", "durationMs", name, "previewUrl", created_at, updated_at) FROM stdin;
1	8	3wvvtB5FeboO9piUEwLkCK	https://open.spotify.com/track/3wvvtB5FeboO9piUEwLkCK	1	217220	In Motion	https://p.scdn.co/mp3-preview/72d8b3ed5d0f355439f525bb8b05e86250b9c626?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.669494-04	2020-05-16 12:54:44.669494-04
2	11	1P9eJXAxmkrhanjkIAd6ws	https://open.spotify.com/track/1P9eJXAxmkrhanjkIAd6ws	1	184309	I Want to Feel Alive	https://p.scdn.co/mp3-preview/f1d4a03db78742a56cf9530ff06f4e3efc22e9e4?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.677586-04	2020-05-16 12:54:44.677586-04
3	2	0gEGOIM1uIewOVWWeULTUm	https://open.spotify.com/track/0gEGOIM1uIewOVWWeULTUm	1	198133	Pioneers	https://p.scdn.co/mp3-preview/d6b8da023da9d03a2ae8374a259a1b32d3905246?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.679191-04	2020-05-16 12:54:44.679191-04
4	2	74uum3qeYsisECdy5CmPju	https://open.spotify.com/track/74uum3qeYsisECdy5CmPju	2	219533	Chromatic	https://p.scdn.co/mp3-preview/61ccfb23edc058189cbafdd84f27552ee7eb57e9?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.679777-04	2020-05-16 12:54:44.679777-04
6	2	12qJKfqfUz8PejsKlxADZJ	https://open.spotify.com/track/12qJKfqfUz8PejsKlxADZJ	5	207106	Little Vessels	https://p.scdn.co/mp3-preview/07605ddbf8da5a86e64dd6efc77f843148465ed6?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.68192-04	2020-05-16 12:54:44.68192-04
5	2	15KUDgDxvkghmtB6FxI7Dt	https://open.spotify.com/track/15KUDgDxvkghmtB6FxI7Dt	3	199906	Venice	https://p.scdn.co/mp3-preview/0700ee202fae5222fcc0a63329dda78e979e4a30?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.68043-04	2020-05-16 12:54:44.68043-04
7	2	18z06SShzY4JZYaXKBypah	https://open.spotify.com/track/18z06SShzY4JZYaXKBypah	4	233346	The Adriatic	https://p.scdn.co/mp3-preview/014a1b918a0716c0f3cb45aa2b89259ece93530b?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.680911-04	2020-05-16 12:54:44.680911-04
8	2	4z72e87zWhwJWhTz7TXfSV	https://open.spotify.com/track/4z72e87zWhwJWhTz7TXfSV	6	232066	Burst Apart	https://p.scdn.co/mp3-preview/3913e0fccc065acd5e4285c09d2406d27c035a85?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.68241-04	2020-05-16 12:54:44.68241-04
9	2	1zaK9B8LvRUNJO4yuZiX6H	https://open.spotify.com/track/1zaK9B8LvRUNJO4yuZiX6H	9	229813	We've Got the Most	https://p.scdn.co/mp3-preview/35088963303fe30dc0e2710f4c7e9d3ce85f41b6?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.684201-04	2020-05-16 12:54:44.684201-04
10	2	6GuvUhiNnzxUdUGlEEJuHQ	https://open.spotify.com/track/6GuvUhiNnzxUdUGlEEJuHQ	7	181200	This Is an Adventure	https://p.scdn.co/mp3-preview/eeca0e8884fc1ca9a9f0ffafc084c748ed61359b?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.682886-04	2020-05-16 12:54:44.682886-04
12	2	7nq1MRmLZwbnpjcr6AnxFy	https://open.spotify.com/track/7nq1MRmLZwbnpjcr6AnxFy	10	304960	Untitled	https://p.scdn.co/mp3-preview/ac7d2014aac3683124144f49910491901ad72b8f?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.685055-04	2020-05-16 12:54:44.685055-04
11	2	45Xml2EJBa6HNTtsqd7Ybs	https://open.spotify.com/track/45Xml2EJBa6HNTtsqd7Ybs	8	283400	Iron Doors	https://p.scdn.co/mp3-preview/94c3069dbd33fb8393f2d09baa9b0727c4c44f09?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.68361-04	2020-05-16 12:54:44.68361-04
13	5	37POsvF7xupvgDnYYIXoYX	https://open.spotify.com/track/37POsvF7xupvgDnYYIXoYX	1	225273	Into the Unknown	https://p.scdn.co/mp3-preview/3679343b812d05c8cdaeb9ea9d152b92557d3e37?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.687221-04	2020-05-16 12:54:44.687221-04
14	14	3beBx7Mz5JsZI0jxohrQ5h	https://open.spotify.com/track/3beBx7Mz5JsZI0jxohrQ5h	2	243640	All We Have Is Now	https://p.scdn.co/mp3-preview/2e9020239cb494ee1ce54417a9ab0ee779287bf5?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.688476-04	2020-05-16 12:54:44.688476-04
15	4	0f9M4GcYyBSMXENA41yo9M	https://open.spotify.com/track/0f9M4GcYyBSMXENA41yo9M	1	235359	Future Blind	https://p.scdn.co/mp3-preview/236029ec3c037f5fca510498b5f53e86b5e93c60?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.687643-04	2020-05-16 12:54:44.687643-04
16	14	7zWO2V6chyRiXrthQ0uXgH	https://open.spotify.com/track/7zWO2V6chyRiXrthQ0uXgH	3	254786	Telecom	https://p.scdn.co/mp3-preview/e2322ecb22084886657d7c4f2ed7f297c817dd49?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.689295-04	2020-05-16 12:54:44.689295-04
17	14	3MIqdEgFsprJhehbTFDXNe	https://open.spotify.com/track/3MIqdEgFsprJhehbTFDXNe	1	173813	Poc	https://p.scdn.co/mp3-preview/d99b6978a85d247542a951bca04282fb7a7048b1?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.688104-04	2020-05-16 12:54:44.688104-04
18	14	0n2yBAjy5VXoEhDFfG7uOV	https://open.spotify.com/track/0n2yBAjy5VXoEhDFfG7uOV	4	231813	We've Got the Most	https://p.scdn.co/mp3-preview/7a48a0f6670b4bc2ee7e900bf43fc9a834c24b5e?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.690004-04	2020-05-16 12:54:44.690004-04
19	14	014VoiTnsfCOOjCs1xyea3	https://open.spotify.com/track/014VoiTnsfCOOjCs1xyea3	5	250253	Loud Pop	https://p.scdn.co/mp3-preview/c768414d6debd53a762e6bbed30d59bb0ef2d41f?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.690722-04	2020-05-16 12:54:44.690722-04
20	14	1ohvoy3do0foFTcFoREkkR	https://open.spotify.com/track/1ohvoy3do0foFTcFoREkkR	6	271933	As We Grow Old	https://p.scdn.co/mp3-preview/a8eeea7d848bce22e7b1bec6145ee0cefe1424d5?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.691103-04	2020-05-16 12:54:44.691103-04
21	14	0ftVc9y2dQ1YaARR0t1Krp	https://open.spotify.com/track/0ftVc9y2dQ1YaARR0t1Krp	7	202800	Rock and Roll Monster	https://p.scdn.co/mp3-preview/a4690969d65fe919495eb6882efd59d0b359f65e?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.691455-04	2020-05-16 12:54:44.691455-04
22	14	0gXVzTmxOV6XMHN5YibXyv	https://open.spotify.com/track/0gXVzTmxOV6XMHN5YibXyv	8	271986	Open Your Eyes	https://p.scdn.co/mp3-preview/0b1bb7c669e243fdf691902b9988648b21774e79?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.692056-04	2020-05-16 12:54:44.692056-04
23	14	6esfFRYMue1JRncapQd8lW	https://open.spotify.com/track/6esfFRYMue1JRncapQd8lW	9	290666	Rosebush	https://p.scdn.co/mp3-preview/01f18779bb22fd8f85dfdace1cd1003744ce75b7?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.69273-04	2020-05-16 12:54:44.69273-04
24	14	5nBrzZjCD4V1nPnKWyslxC	https://open.spotify.com/track/5nBrzZjCD4V1nPnKWyslxC	10	241960	After the Ether	https://p.scdn.co/mp3-preview/3a516e9210df1c8bec4a765a0790fdecfaad6baf?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.693075-04	2020-05-16 12:54:44.693075-04
25	14	57mqW6s30u14eSmxsHhNLx	https://open.spotify.com/track/57mqW6s30u14eSmxsHhNLx	11	226093	Left On My Own	https://p.scdn.co/mp3-preview/ba350848cb680a02bef3c4e2fd34efa8c7aa6f05?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.693841-04	2020-05-16 12:54:44.693841-04
26	14	2eSadqDmxj2ybqPOgzfn9h	https://open.spotify.com/track/2eSadqDmxj2ybqPOgzfn9h	12	251013	Glitter Girl	https://p.scdn.co/mp3-preview/123f315123e8b64520220a0ecec5251c9dd2f6a3?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.694197-04	2020-05-16 12:54:44.694197-04
27	14	5K0T4yFMMxG2wLp11m1AnJ	https://open.spotify.com/track/5K0T4yFMMxG2wLp11m1AnJ	13	137173	Rainbow Parade	https://p.scdn.co/mp3-preview/61e6e0e48c8069f7e0fc6c234736b8c1de39feca?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.694534-04	2020-05-16 12:54:44.694534-04
28	14	1hjVFYjFMzSyZPg6B3cXL6	https://open.spotify.com/track/1hjVFYjFMzSyZPg6B3cXL6	14	220733	Could Have Handled That Better	https://p.scdn.co/mp3-preview/070bfc59299339f4ea61107d864928363edc036b?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.695078-04	2020-05-16 12:54:44.695078-04
29	14	5XpT1nU9wrdjl2OCNzV3K4	https://open.spotify.com/track/5XpT1nU9wrdjl2OCNzV3K4	15	215520	Matchstick	https://p.scdn.co/mp3-preview/58cd17a8644491a999f230c1e5222e8340885ae9?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.69546-04	2020-05-16 12:54:44.69546-04
30	14	5fwgKHlLJbewhGfEN0VHAP	https://open.spotify.com/track/5fwgKHlLJbewhGfEN0VHAP	16	216893	Bleeding Through	https://p.scdn.co/mp3-preview/2904a7ee523bef69ea332a37b0eeb5b10d3583ee?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.695802-04	2020-05-16 12:54:44.695802-04
31	14	2JU3lpoAvgxpElt7oMisnC	https://open.spotify.com/track/2JU3lpoAvgxpElt7oMisnC	17	382973	Dmt	https://p.scdn.co/mp3-preview/23d0a33941df126aeadb50c3d268585eee5bbb9f?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.69715-04	2020-05-16 12:54:44.69715-04
40	1	1kwgFd0jiaALIuYuP3GoTk	https://open.spotify.com/track/1kwgFd0jiaALIuYuP3GoTk	4	192798	Senses	https://p.scdn.co/mp3-preview/a70f4edb121098277b0b2e5e42d485df799776c0?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.700721-04	2020-05-16 12:54:44.700721-04
47	10	0GhjZQB0iXImDNlJwp4SUl	https://open.spotify.com/track/0GhjZQB0iXImDNlJwp4SUl	1	201087	Venice (Radio Single)	https://p.scdn.co/mp3-preview/912c43f225a1ef667326180105a3ffe930136d89?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.703384-04	2020-05-16 12:54:44.703384-04
56	13	7840VwyCl71RjvSWYTHMRs	https://open.spotify.com/track/7840VwyCl71RjvSWYTHMRs	5	210243	Seven	https://p.scdn.co/mp3-preview/b34e6e65eb89a81f6264caebe3a8d42dd9aa1c2b?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.707006-04	2020-05-16 12:54:44.707006-04
64	3	08XJkZXrnSlZ8AZiCSNuxp	https://open.spotify.com/track/08XJkZXrnSlZ8AZiCSNuxp	3	200560	Windows	https://p.scdn.co/mp3-preview/f0e24bf4460440cff7db40eaf0ef4d0e4cb2c567?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.709809-04	2020-05-16 12:54:44.709809-04
72	7	2MZhH7k2TtL6nmbK7JbG2G	https://open.spotify.com/track/2MZhH7k2TtL6nmbK7JbG2G	1	261604	Paths	https://p.scdn.co/mp3-preview/10e89515f751894fdf4d63263cadedc55fb56b49?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.71264-04	2020-05-16 12:54:44.71264-04
32	14	002NUzjuGirNgE34m0ZqBb	https://open.spotify.com/track/002NUzjuGirNgE34m0ZqBb	18	298200	Always You	https://p.scdn.co/mp3-preview/19a4d9713aa3927199c7d497326da523cdb441a0?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.697504-04	2020-05-16 12:54:44.697504-04
41	1	7cxOEeIEdkp13dpRmF0nzO	https://open.spotify.com/track/7cxOEeIEdkp13dpRmF0nzO	5	245282	We Aren't Who We Thought We Were	https://p.scdn.co/mp3-preview/ddcad65aa6fa3e5f4089388f315ca8e45bbbc388?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.700996-04	2020-05-16 12:54:44.700996-04
48	10	4rJBx7ZbeoY1Q1VGGkuc1E	https://open.spotify.com/track/4rJBx7ZbeoY1Q1VGGkuc1E	2	214499	Venice (Savoir Adore Remix)	https://p.scdn.co/mp3-preview/f9490b363e8c45fa5f1ee1425de372743c57b059?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.703658-04	2020-05-16 12:54:44.703658-04
57	13	1Th26i0FUY7xMzUI2ytdhY	https://open.spotify.com/track/1Th26i0FUY7xMzUI2ytdhY	6	266000	Catch Me If You Can	https://p.scdn.co/mp3-preview/abc9d6061fd2080229ec472845804bb61983caf2?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.707291-04	2020-05-16 12:54:44.707291-04
65	3	4jar8KtB25FHzTKFdsbNwA	https://open.spotify.com/track/4jar8KtB25FHzTKFdsbNwA	4	279133	The Stars and the Trees	https://p.scdn.co/mp3-preview/614b2dc0b400e607e3cb07376541848095804942?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.710079-04	2020-05-16 12:54:44.710079-04
73	9	0iMGKSkVJxmYTVibcRrkTz	https://open.spotify.com/track/0iMGKSkVJxmYTVibcRrkTz	1	174086	Light Waves	https://p.scdn.co/mp3-preview/07b41c8e1d568c675b344337ad983dbc59621458?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.712902-04	2020-05-16 12:54:44.712902-04
33	6	5Y9QBB0jKP7RDaEvxxUwjH	https://open.spotify.com/track/5Y9QBB0jKP7RDaEvxxUwjH	1	238651	Oh Holiday!	https://p.scdn.co/mp3-preview/93dade5df642d36df000833a1f03ae3f0f5933dc?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.698041-04	2020-05-16 12:54:44.698041-04
50	10	4rbwnul12vKm58t4lOcoZF	https://open.spotify.com/track/4rbwnul12vKm58t4lOcoZF	4	130000	Venice (Adam Snow Bootleg)	https://p.scdn.co/mp3-preview/f81f82fecddd91e350119d700df32ff54c4f7dc3?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.70424-04	2020-05-16 12:54:44.70424-04
67	3	6ROx3Zds2tplbPgql60RKc	https://open.spotify.com/track/6ROx3Zds2tplbPgql60RKc	6	330720	Two Years Ago	https://p.scdn.co/mp3-preview/58642d71ace84af2374330d451017333b4609b09?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.710622-04	2020-05-16 12:54:44.710622-04
34	12	3MQdCK4g3gyE2cDZtjV8YB	https://open.spotify.com/track/3MQdCK4g3gyE2cDZtjV8YB	1	198133	Pioneers	https://p.scdn.co/mp3-preview/d6b8da023da9d03a2ae8374a259a1b32d3905246?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.698433-04	2020-05-16 12:54:44.698433-04
42	1	3RETkaUWjLG7cBOj1VLEQz	https://open.spotify.com/track/3RETkaUWjLG7cBOj1VLEQz	6	236468	Closer	https://p.scdn.co/mp3-preview/1108264e3e1b1b062852e0f52b1d451914a908ae?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.701523-04	2020-05-16 12:54:44.701523-04
51	10	3nyOKUXV7sQ606GTFpDX1q	https://open.spotify.com/track/3nyOKUXV7sQ606GTFpDX1q	5	227314	Venice (Acoustic)	https://p.scdn.co/mp3-preview/ecd4b39c141860b285686ca4f882cdb5b29c75f4?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.704617-04	2020-05-16 12:54:44.704617-04
59	13	6s3w2iKlhFHT8WB8MyxOaI	https://open.spotify.com/track/6s3w2iKlhFHT8WB8MyxOaI	8	234609	Hold on Love	https://p.scdn.co/mp3-preview/a35fcab706051cde5f481fdc9962b1b5a2bca469?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.708006-04	2020-05-16 12:54:44.708006-04
68	3	5XvS3t5O7c9X8cSoIIp3At	https://open.spotify.com/track/5XvS3t5O7c9X8cSoIIp3At	7	260066	Under Mountain, Under Ground	https://p.scdn.co/mp3-preview/f19be173019b8e30ed6dc529464d33249642f3ff?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.711046-04	2020-05-16 12:54:44.711046-04
75	9	74MXcelAYD19tpT6B33uVg	https://open.spotify.com/track/74MXcelAYD19tpT6B33uVg	3	261604	Paths	https://p.scdn.co/mp3-preview/10e89515f751894fdf4d63263cadedc55fb56b49?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.71358-04	2020-05-16 12:54:44.71358-04
35	12	5NdAiJn8WyAhkaBdbKFRcX	https://open.spotify.com/track/5NdAiJn8WyAhkaBdbKFRcX	2	232066	Burst Apart	https://p.scdn.co/mp3-preview/3913e0fccc065acd5e4285c09d2406d27c035a85?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.698762-04	2020-05-16 12:54:44.698762-04
43	1	6AATVBcb2BfU3uuCUz0H8U	https://open.spotify.com/track/6AATVBcb2BfU3uuCUz0H8U	7	227049	Under	https://p.scdn.co/mp3-preview/51d10474a470994145625ffaac2fc058952214fa?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.701807-04	2020-05-16 12:54:44.701807-04
52	13	3vUDkRlIkyB9JlhSg3ZJ4g	https://open.spotify.com/track/3vUDkRlIkyB9JlhSg3ZJ4g	1	198133	Pioneers	https://p.scdn.co/mp3-preview/177f232d79b3cf4338d639ce08a9cd3fcf6f3bbe?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.704887-04	2020-05-16 12:54:44.704887-04
60	13	1sLlGFx6UqgNtu62Xb49la	https://open.spotify.com/track/1sLlGFx6UqgNtu62Xb49la	9	204933	Everything's Fine	https://p.scdn.co/mp3-preview/08855778302d51f8b5a33bc977f6cc48d63881f0?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.708279-04	2020-05-16 12:54:44.708279-04
69	3	2hOQ1TR78TkYU2gbtaK1gm	https://open.spotify.com/track/2hOQ1TR78TkYU2gbtaK1gm	8	315026	Soon You'll Be Found	https://p.scdn.co/mp3-preview/d1c9291ce8411892fed3b843c417d9742e0140dc?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.71132-04	2020-05-16 12:54:44.71132-04
76	9	5h5Vdyy1p5ZHrrAuFLdgaT	https://open.spotify.com/track/5h5Vdyy1p5ZHrrAuFLdgaT	4	230785	Ascending	https://p.scdn.co/mp3-preview/0d27c44f3941853810be849c356f513a43986722?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.713845-04	2020-05-16 12:54:44.713845-04
36	12	73WHYbHemNFVXvOdF9UJQk	https://open.spotify.com/track/73WHYbHemNFVXvOdF9UJQk	3	283400	Iron Doors	https://p.scdn.co/mp3-preview/94c3069dbd33fb8393f2d09baa9b0727c4c44f09?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.699044-04	2020-05-16 12:54:44.699044-04
44	1	6ZhlUtuvIbcISpjwlCwero	https://open.spotify.com/track/6ZhlUtuvIbcISpjwlCwero	8	229885	In the Open	https://p.scdn.co/mp3-preview/a883a71264bf82572998f541bf7fda128e72d096?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.702082-04	2020-05-16 12:54:44.702082-04
53	13	5xenYUhLjsF1T3ZiKmvLd2	https://open.spotify.com/track/5xenYUhLjsF1T3ZiKmvLd2	2	229133	Dress It Up	https://p.scdn.co/mp3-preview/62475ec01ea99a994e73b6f81476bba46ad40a28?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.705158-04	2020-05-16 12:54:44.705158-04
61	13	6v34zNG3wYTQGExzPyl89D	https://open.spotify.com/track/6v34zNG3wYTQGExzPyl89D	10	123687	Undress Me	https://p.scdn.co/mp3-preview/aaf462fc906031da2f5f994d1d706547cd7e660b?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.70855-04	2020-05-16 12:54:44.70855-04
70	3	4TQBsE2d7MAMIS4NW5gQMG	https://open.spotify.com/track/4TQBsE2d7MAMIS4NW5gQMG	9	186666	Into the Dark	https://p.scdn.co/mp3-preview/79dc8219b5f10667b04ece9e60197637e8940d31?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.711603-04	2020-05-16 12:54:44.711603-04
77	9	4yuJmyZN8R7BHsW37r2giO	https://open.spotify.com/track/4yuJmyZN8R7BHsW37r2giO	5	219482	We Can Make It	https://p.scdn.co/mp3-preview/6be27df85b714780225e9d4d7528cfecf2f51f7e?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.714108-04	2020-05-16 12:54:44.714108-04
37	1	2f5dViEC0bNW1dgORpeiGc	https://open.spotify.com/track/2f5dViEC0bNW1dgORpeiGc	1	217220	In Motion	https://p.scdn.co/mp3-preview/72d8b3ed5d0f355439f525bb8b05e86250b9c626?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.699503-04	2020-05-16 12:54:44.699503-04
49	10	4iCpqcwYc4YxTpHekTmWvn	https://open.spotify.com/track/4iCpqcwYc4YxTpHekTmWvn	3	225576	Venice (Remix feat. Chancellor Warhol)	https://p.scdn.co/mp3-preview/84abd9c2aff8c4d195ea6ccab64820b5ac1e210c?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.703945-04	2020-05-16 12:54:44.703945-04
58	13	51YX1WKYGHzOuxiBgL3IyC	https://open.spotify.com/track/51YX1WKYGHzOuxiBgL3IyC	7	283333	War of Hearts	https://p.scdn.co/mp3-preview/fb7b375eef2b2ee416be9cdc9be8d94f8435dfdb?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.707572-04	2020-05-16 12:54:44.707572-04
74	9	1kaBZyU084J4HWCDcWby88	https://open.spotify.com/track/1kaBZyU084J4HWCDcWby88	2	243430	Made of Water	https://p.scdn.co/mp3-preview/1187f80cb1b06fabfc9ad8677a68c94b6c2061ab?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.713239-04	2020-05-16 12:54:44.713239-04
38	1	1xWFIA47dN7kKgB3pmuL1a	https://open.spotify.com/track/1xWFIA47dN7kKgB3pmuL1a	2	184309	I Want to Feel Alive	https://p.scdn.co/mp3-preview/cfba457778ce21fa036cdbdaf90a6f73a073bc5a?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.699805-04	2020-05-16 12:54:44.699805-04
54	13	6HgeqKb0cKEwBip9w5BwGv	https://open.spotify.com/track/6HgeqKb0cKEwBip9w5BwGv	3	219405	Run Run	https://p.scdn.co/mp3-preview/d907a4d2b1d091a4b1baed166a13d7f8caadaf48?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.705673-04	2020-05-16 12:54:44.705673-04
66	3	06UtfzJaPJHDRNII9aTxDQ	https://open.spotify.com/track/06UtfzJaPJHDRNII9aTxDQ	5	255853	Of the Heavens and the Earth	https://p.scdn.co/mp3-preview/d7e806df17b50023a0d62640988473410e7bcfee?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.71035-04	2020-05-16 12:54:44.71035-04
39	1	6xeQ4BbNVTaB0IvIHKESK2	https://open.spotify.com/track/6xeQ4BbNVTaB0IvIHKESK2	3	237562	Glory	https://p.scdn.co/mp3-preview/de33419588e874b287f4ab738def7cea5b2df0d0?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.700179-04	2020-05-16 12:54:44.700179-04
46	1	0PsCdWEczdow0ZYgmRd1Mq	https://open.spotify.com/track/0PsCdWEczdow0ZYgmRd1Mq	10	185526	We Are Infinite	https://p.scdn.co/mp3-preview/dfd33cc0361a5e8619528f9322e62474623a6ad9?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.702886-04	2020-05-16 12:54:44.702886-04
55	13	61xiEXr9n59BtEsyL87Wmi	https://open.spotify.com/track/61xiEXr9n59BtEsyL87Wmi	4	207609	Keep Holding on to Me	https://p.scdn.co/mp3-preview/e1eeef5412bae9af11d2364ffe7ef1296c8cabf7?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.706033-04	2020-05-16 12:54:44.706033-04
63	3	790IIdLD4PoR5cqxunPNsR	https://open.spotify.com/track/790IIdLD4PoR5cqxunPNsR	2	211560	White Days	https://p.scdn.co/mp3-preview/e6bdfc2485b8297dcaba2cc4e46043fe0e806028?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.709315-04	2020-05-16 12:54:44.709315-04
71	3	6lVfTeGWOnimwikUVTag45	https://open.spotify.com/track/6lVfTeGWOnimwikUVTag45	10	272226	Always for You	https://p.scdn.co/mp3-preview/215c4d9c370e6717a692034b89a4982232e3b474?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.712164-04	2020-05-16 12:54:44.712164-04
45	1	6yv6Tcl8hBczRiMUW40P41	https://open.spotify.com/track/6yv6Tcl8hBczRiMUW40P41	9	220183	Old World	https://p.scdn.co/mp3-preview/e3665d29fe223376b859b64c4ebc61bcba978262?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.702518-04	2020-05-16 12:54:44.702518-04
62	3	7JnJdw0Wq6xrExON73NLjJ	https://open.spotify.com/track/7JnJdw0Wq6xrExON73NLjJ	1	262706	Morning	https://p.scdn.co/mp3-preview/fc2111dcb461b5c00a15d96b9e062218c69a6f15?cid=52f003f8b2e543b3bec5cc38f3bb3f54	2020-05-16 12:54:44.70904-04	2020-05-16 12:54:44.70904-04
\.


--
-- Name: albums_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ryanwalker
--

SELECT pg_catalog.setval('public.albums_id_seq', 28, true);


--
-- Name: artists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ryanwalker
--

SELECT pg_catalog.setval('public.artists_id_seq', 1, true);


--
-- Name: audio-features_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ryanwalker
--

SELECT pg_catalog.setval('public."audio-features_id_seq"', 77, true);


--
-- Name: knex_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ryanwalker
--

SELECT pg_catalog.setval('public.knex_migrations_id_seq', 8, true);


--
-- Name: knex_migrations_lock_index_seq; Type: SEQUENCE SET; Schema: public; Owner: ryanwalker
--

SELECT pg_catalog.setval('public.knex_migrations_lock_index_seq', 1, true);


--
-- Name: tracks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ryanwalker
--

SELECT pg_catalog.setval('public.tracks_id_seq', 154, true);


--
-- Name: albums albums_pkey; Type: CONSTRAINT; Schema: public; Owner: ryanwalker
--

ALTER TABLE ONLY public.albums
    ADD CONSTRAINT albums_pkey PRIMARY KEY (id);


--
-- Name: artists artists_pkey; Type: CONSTRAINT; Schema: public; Owner: ryanwalker
--

ALTER TABLE ONLY public.artists
    ADD CONSTRAINT artists_pkey PRIMARY KEY (id);


--
-- Name: audio-features audio-features_pkey; Type: CONSTRAINT; Schema: public; Owner: ryanwalker
--

ALTER TABLE ONLY public."audio-features"
    ADD CONSTRAINT "audio-features_pkey" PRIMARY KEY (id);


--
-- Name: knex_migrations_lock knex_migrations_lock_pkey; Type: CONSTRAINT; Schema: public; Owner: ryanwalker
--

ALTER TABLE ONLY public.knex_migrations_lock
    ADD CONSTRAINT knex_migrations_lock_pkey PRIMARY KEY (index);


--
-- Name: knex_migrations knex_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: ryanwalker
--

ALTER TABLE ONLY public.knex_migrations
    ADD CONSTRAINT knex_migrations_pkey PRIMARY KEY (id);


--
-- Name: tracks tracks_pkey; Type: CONSTRAINT; Schema: public; Owner: ryanwalker
--

ALTER TABLE ONLY public.tracks
    ADD CONSTRAINT tracks_pkey PRIMARY KEY (id);


--
-- Name: albums albums_artistid_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ryanwalker
--

ALTER TABLE ONLY public.albums
    ADD CONSTRAINT albums_artistid_foreign FOREIGN KEY ("artistId") REFERENCES public.artists(id);


--
-- Name: audio-features audio_features_trackid_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ryanwalker
--

ALTER TABLE ONLY public."audio-features"
    ADD CONSTRAINT audio_features_trackid_foreign FOREIGN KEY ("trackId") REFERENCES public.tracks(id);


--
-- Name: tracks tracks_albumid_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ryanwalker
--

ALTER TABLE ONLY public.tracks
    ADD CONSTRAINT tracks_albumid_foreign FOREIGN KEY ("albumId") REFERENCES public.albums(id);


--
-- PostgreSQL database dump complete
--

