--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text DEFAULT ''::text NOT NULL,
    star_id integer,
    planet_id integer
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text DEFAULT ''::text NOT NULL,
    has_life boolean DEFAULT false,
    distance_to_earth integer,
    brightness numeric(2,1),
    int1 integer,
    int2 integer,
    num1 numeric,
    bool1 boolean,
    bool2 boolean,
    txt1 text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text DEFAULT ''::text NOT NULL,
    planet_id integer NOT NULL,
    int1 integer,
    int2 integer,
    num1 numeric,
    bool1 boolean,
    bool2 boolean,
    txt1 text
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
    name character varying(20) NOT NULL,
    description text DEFAULT ''::text NOT NULL,
    star_id integer NOT NULL,
    int1 integer,
    int2 integer,
    num1 numeric,
    bool1 boolean,
    bool2 boolean,
    txt1 text
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
    name character varying(20) NOT NULL,
    description text DEFAULT ''::text NOT NULL,
    galaxy_id integer NOT NULL,
    int1 integer,
    int2 integer,
    num1 numeric,
    bool1 boolean,
    bool2 boolean,
    txt1 text
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'a1', '', NULL, NULL);
INSERT INTO public.asteroid VALUES (2, 'a2', '', NULL, NULL);
INSERT INTO public.asteroid VALUES (3, 'a3', '', NULL, NULL);
INSERT INTO public.asteroid VALUES (4, 'a44', '', 3, NULL);
INSERT INTO public.asteroid VALUES (5, 'asda99', '', 4, 5);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'g1', '', false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'g2', '', false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'g3', '', false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'g4', '', false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'g5', '', false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'g6', '', false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon1', '', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'moon2', '', 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'moon3', '', 3, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'moon4', '', 4, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'moon5', '', 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'moon6', '', 6, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'moon7', '', 7, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'moon8', '', 9, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'moon9', '', 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'moon10', '', 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'moon11', '', 6, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'moon12', '', 9, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'moon13', '', 11, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'moon14', '', 12, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'moon15', '', 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'moon16', '', 13, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'moon17', '', 3, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'moon18', '', 14, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'moon19', '', 13, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'moon20', '', 12, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'planet1', '', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (2, 'planet2', '', 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (3, 'planet3', '', 3, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (4, 'planet4', '', 4, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (5, 'planet5', '', 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (6, 'planet6', '', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (7, 'planet7', '', 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (8, 'planet8', '', 3, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (9, 'planet9', '', 4, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (10, 'planet10', '', 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (11, 'planet11', '', 6, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (12, 'planet12', '', 9, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (13, 'planet13', '', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (14, 'planet14', '', 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (15, 'planet15', '', 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (16, 'planet16', '', 3, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (17, 'planet17', '', 3, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (18, 'planet18', '', 4, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (19, 'planet19', '', 3, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (20, 'planet20', '', 2, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'star1', '', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (2, 'star2', '', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (3, 'star3', '', 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (4, 'star4', '', 3, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (5, 'star5', '', 4, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (6, 'star6', '', 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (7, 'star7', '', 6, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (8, 'star8', '', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (9, 'star9', '', 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (10, 'star10', '', 3, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 20, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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
-- Name: asteroid asteroid_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: asteroid asteroid_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

