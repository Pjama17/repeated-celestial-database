--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    distance_from_milky_way_in_light_years numeric(3,1) NOT NULL,
    type text,
    brightness numeric(2,1) NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: kuiper_belt; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.kuiper_belt (
    kuiper_belt_id integer NOT NULL,
    type character varying(30) NOT NULL,
    name character varying(30)
);


ALTER TABLE public.kuiper_belt OWNER TO freecodecamp;

--
-- Name: kuiper_belt_kuiper_belt_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.kuiper_belt_kuiper_belt_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kuiper_belt_kuiper_belt_id_seq OWNER TO freecodecamp;

--
-- Name: kuiper_belt_kuiper_belt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.kuiper_belt_kuiper_belt_id_seq OWNED BY public.kuiper_belt.kuiper_belt_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30),
    distance_from_mother_planet numeric(5,1) NOT NULL,
    type character varying(40),
    relative_position_to_mother_planet integer,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30),
    distance_from_sun numeric(5,1) NOT NULL,
    type character varying(40),
    relative_position_to_sun integer,
    smaller_diameter_than_earth boolean,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    distance_from_sun_in_light_years numeric(4,1) NOT NULL,
    type character varying(40),
    brightness numeric(4,1) NOT NULL,
    smaller_diameter_than_sun boolean,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: kuiper_belt kuiper_belt_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.kuiper_belt ALTER COLUMN kuiper_belt_id SET DEFAULT nextval('public.kuiper_belt_kuiper_belt_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'andromeda', 2.5, 'barred spiral', 3.4);
INSERT INTO public.galaxy VALUES (2, 'sombrero', 3.5, 'spiral', 8.0);
INSERT INTO public.galaxy VALUES (3, 'large magellanic cloud', 0.2, 'spiral', 0.1);
INSERT INTO public.galaxy VALUES (4, 'small magellanic cloud', 0.2, 'dwarf irregular', 2.7);
INSERT INTO public.galaxy VALUES (5, 'cigar galaxy', 12.0, 'giant elliptical', 8.4);
INSERT INTO public.galaxy VALUES (6, 'pinwheel galaxy', 20.9, 'face-on spiral', 7.9);
INSERT INTO public.galaxy VALUES (7, 'milky way', 0.0, 'spiral', 1.0);


--
-- Data for Name: kuiper_belt; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.kuiper_belt VALUES (1, 'dwarf planet', 'Pluto');
INSERT INTO public.kuiper_belt VALUES (2, 'moon', 'Haumea');
INSERT INTO public.kuiper_belt VALUES (3, 'moon', 'Makemake');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', 239.0, 'rocky', 1, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 3.7, 'rocky', 1, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 14.5, 'rocky', 2, 4);
INSERT INTO public.moon VALUES (4, 'Io', 262.0, 'volcanic', 1, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 414.0, 'icy surface', 2, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 665.0, 'icy', 3, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 3904.0, 'rocky', 4, 5);
INSERT INTO public.moon VALUES (8, 'Enceladus', 148.0, 'icy ocean moon', 2, 6);
INSERT INTO public.moon VALUES (9, 'Titan', 776.0, 'substantial liquid on surface', 4, 6);
INSERT INTO public.moon VALUES (10, 'Dione', 234.0, 'ice with metal core', 3, 6);
INSERT INTO public.moon VALUES (11, 'Epimethus', 94.0, 'rocky', 1, 6);
INSERT INTO public.moon VALUES (12, 'Hyperion', 933.0, 'rocky', 5, 6);
INSERT INTO public.moon VALUES (13, 'Iapetus', 2213.0, 'mountains', 6, 6);
INSERT INTO public.moon VALUES (14, 'Ariel', 118.0, 'water ice and silicate rock', 2, 7);
INSERT INTO public.moon VALUES (15, 'Oberon', 362.0, 'ice and rock', 4, 7);
INSERT INTO public.moon VALUES (16, 'Puck', 53.4, 'rocky', 1, 7);
INSERT INTO public.moon VALUES (17, 'Titania', 270.0, 'geologically active', 3, 7);
INSERT INTO public.moon VALUES (18, 'Triton', 220.0, 'icy surface', 2, 8);
INSERT INTO public.moon VALUES (19, 'Proteus', 73.0, 'box-shaped', 1, 8);
INSERT INTO public.moon VALUES (20, 'Charon', 12.0, 'unknown', 1, 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 41.5, 'terrestrial', 1, true, 7);
INSERT INTO public.planet VALUES (2, 'Venus', 67.0, 'terrestrial', 2, true, 7);
INSERT INTO public.planet VALUES (3, 'Earth', 0.0, 'terrestrial', 3, false, 7);
INSERT INTO public.planet VALUES (4, 'Mars', 155.8, 'terrestrial', 4, true, 7);
INSERT INTO public.planet VALUES (5, 'Jupiter', 460.6, 'gas giant', 5, false, 7);
INSERT INTO public.planet VALUES (6, 'Saturn', 890.9, 'gas giant', 6, false, 7);
INSERT INTO public.planet VALUES (7, 'Uranus', 1074.0, 'gaseous cyan ice giant', 7, false, 7);
INSERT INTO public.planet VALUES (8, 'Neptune', 2793.0, 'ice giant', 8, false, 7);
INSERT INTO public.planet VALUES (9, 'Pluto', 3700.0, 'dwarf planet', 9, true, 7);
INSERT INTO public.planet VALUES (10, 'Eris', 6289.0, 'dwarf planet', 12, true, 7);
INSERT INTO public.planet VALUES (11, 'Makemake', 3486.0, 'dwarf planet', 10, true, 7);
INSERT INTO public.planet VALUES (12, 'Haumea', 4000.0, 'dwarf planet', 11, true, 7);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'alkaid', 104.0, 'blue-white dwarf', 1.9, false, 6);
INSERT INTO public.star VALUES (2, 'alpheratz', 96.9, 'mercury-manganese', 2.1, false, 1);
INSERT INTO public.star VALUES (3, 'sombrero sun', 31.1, 'unknown', 3.0, false, 2);
INSERT INTO public.star VALUES (4, 'R71', 0.3, 'blue super giant', 10.7, false, 3);
INSERT INTO public.star VALUES (5, 'NGC 265', 2.0, 'open cluster', 11.2, false, 4);
INSERT INTO public.star VALUES (6, 'SN 2014J', 12.0, 'supernova', 10.5, false, 5);
INSERT INTO public.star VALUES (7, 'the sun', 0.0, 'white dwarf', 1.0, false, 7);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 7, true);


--
-- Name: kuiper_belt_kuiper_belt_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.kuiper_belt_kuiper_belt_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_brightness_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_brightness_key UNIQUE (brightness);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: kuiper_belt kuiper_belt_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.kuiper_belt
    ADD CONSTRAINT kuiper_belt_name_key UNIQUE (name);


--
-- Name: kuiper_belt kuiper_belt_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.kuiper_belt
    ADD CONSTRAINT kuiper_belt_pkey PRIMARY KEY (kuiper_belt_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_brightness_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_brightness_key UNIQUE (brightness);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_mother_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_mother_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_mother_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_mother_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_mother_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_mother_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

