--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: elements; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.elements (
    elements_id integer NOT NULL,
    name character varying(30) NOT NULL,
    designation character varying(30) NOT NULL
);


ALTER TABLE public.elements OWNER TO freecodecamp;

--
-- Name: elements_elements_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.elements_elements_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.elements_elements_id_seq OWNER TO freecodecamp;

--
-- Name: elements_elements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.elements_elements_id_seq OWNED BY public.elements.elements_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40),
    is_elliptical boolean,
    galaxy_types character varying(40),
    age_in_billions_of_years numeric(4,1) NOT NULL
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
-- Name: junction; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.junction (
    junction_id integer NOT NULL,
    elements_id integer,
    planet_id integer NOT NULL,
    name character varying(30)
);


ALTER TABLE public.junction OWNER TO freecodecamp;

--
-- Name: junction_junction_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.junction_junction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.junction_junction_id_seq OWNER TO freecodecamp;

--
-- Name: junction_junction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.junction_junction_id_seq OWNED BY public.junction.junction_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40),
    planet_id integer NOT NULL,
    distance_millions_km numeric(4,2) NOT NULL,
    age_in_billions_of_years numeric(4,1)
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
    name character varying(40),
    has_life boolean,
    description text NOT NULL,
    star_id integer NOT NULL,
    ring_count integer
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
    name character varying(40),
    galaxy_id integer NOT NULL,
    age_in_billions_of_years numeric(4,2) NOT NULL,
    surface_temp_c integer NOT NULL
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
-- Name: elements elements_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.elements ALTER COLUMN elements_id SET DEFAULT nextval('public.elements_elements_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: junction junction_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.junction ALTER COLUMN junction_id SET DEFAULT nextval('public.junction_junction_id_seq'::regclass);


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
-- Data for Name: elements; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.elements VALUES (1, 'Hydrogen', 'H');
INSERT INTO public.elements VALUES (2, 'Nitrogen', 'N');
INSERT INTO public.elements VALUES (3, 'Carbon', 'C');
INSERT INTO public.elements VALUES (4, 'Helium', 'He');
INSERT INTO public.elements VALUES (5, 'Oxygen', 'O');
INSERT INTO public.elements VALUES (6, 'Calcium', 'Ca');
INSERT INTO public.elements VALUES (7, 'Iron', 'Fe');
INSERT INTO public.elements VALUES (8, 'Aluminum', 'Al');
INSERT INTO public.elements VALUES (9, 'Sodium', 'Na');
INSERT INTO public.elements VALUES (10, 'Potassium', 'K');
INSERT INTO public.elements VALUES (11, 'Silicon', 'Si');
INSERT INTO public.elements VALUES (12, 'Sulfur', 'S');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Andromeda M31', false, 'spiral', 5.0);
INSERT INTO public.galaxy VALUES (3, 'Whirpool M51', false, 'spiral', 0.5);
INSERT INTO public.galaxy VALUES (4, 'Centaurus A', true, 'elliptical', 13.3);
INSERT INTO public.galaxy VALUES (5, 'M82', false, 'irregular', 13.0);
INSERT INTO public.galaxy VALUES (6, 'Sunflower M63', false, 'spiral', 13.2);
INSERT INTO public.galaxy VALUES (1, 'Milky Way', false, 'barred spiral', 13.6);


--
-- Data for Name: junction; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.junction VALUES (1, 1, 12, NULL);
INSERT INTO public.junction VALUES (2, 4, 12, NULL);
INSERT INTO public.junction VALUES (3, 2, 12, NULL);
INSERT INTO public.junction VALUES (4, 3, 12, NULL);
INSERT INTO public.junction VALUES (5, 3, 11, NULL);
INSERT INTO public.junction VALUES (6, 7, 11, NULL);
INSERT INTO public.junction VALUES (7, 11, 11, NULL);
INSERT INTO public.junction VALUES (8, 5, 11, NULL);
INSERT INTO public.junction VALUES (9, 2, 11, NULL);
INSERT INTO public.junction VALUES (10, 2, 10, NULL);
INSERT INTO public.junction VALUES (11, 1, 10, NULL);
INSERT INTO public.junction VALUES (12, 3, 10, NULL);
INSERT INTO public.junction VALUES (13, 1, 9, NULL);
INSERT INTO public.junction VALUES (14, 4, 9, NULL);
INSERT INTO public.junction VALUES (15, 1, 8, NULL);
INSERT INTO public.junction VALUES (16, 4, 8, NULL);
INSERT INTO public.junction VALUES (17, 3, 8, NULL);
INSERT INTO public.junction VALUES (18, 2, 8, NULL);
INSERT INTO public.junction VALUES (19, 5, 8, NULL);
INSERT INTO public.junction VALUES (20, 1, 7, NULL);
INSERT INTO public.junction VALUES (21, 5, 7, NULL);
INSERT INTO public.junction VALUES (22, 3, 7, NULL);
INSERT INTO public.junction VALUES (23, 7, 7, NULL);
INSERT INTO public.junction VALUES (24, 11, 7, NULL);
INSERT INTO public.junction VALUES (25, 1, 6, NULL);
INSERT INTO public.junction VALUES (26, 4, 6, NULL);
INSERT INTO public.junction VALUES (27, 3, 6, NULL);
INSERT INTO public.junction VALUES (28, 2, 6, NULL);
INSERT INTO public.junction VALUES (29, 1, 5, NULL);
INSERT INTO public.junction VALUES (30, 4, 5, NULL);
INSERT INTO public.junction VALUES (31, 2, 5, NULL);
INSERT INTO public.junction VALUES (32, 5, 5, NULL);
INSERT INTO public.junction VALUES (33, 2, 4, NULL);
INSERT INTO public.junction VALUES (34, 5, 4, NULL);
INSERT INTO public.junction VALUES (35, 3, 4, NULL);
INSERT INTO public.junction VALUES (36, 11, 4, NULL);
INSERT INTO public.junction VALUES (37, 7, 4, NULL);
INSERT INTO public.junction VALUES (38, 8, 4, NULL);
INSERT INTO public.junction VALUES (39, 10, 4, NULL);
INSERT INTO public.junction VALUES (40, 1, 2, NULL);
INSERT INTO public.junction VALUES (41, 2, 2, NULL);
INSERT INTO public.junction VALUES (42, 3, 2, NULL);
INSERT INTO public.junction VALUES (43, 12, 2, NULL);
INSERT INTO public.junction VALUES (44, 5, 2, NULL);
INSERT INTO public.junction VALUES (45, 7, 2, NULL);
INSERT INTO public.junction VALUES (46, 7, 1, NULL);
INSERT INTO public.junction VALUES (47, 11, 1, NULL);
INSERT INTO public.junction VALUES (48, 12, 1, NULL);
INSERT INTO public.junction VALUES (49, 9, 1, NULL);
INSERT INTO public.junction VALUES (50, 10, 1, NULL);
INSERT INTO public.junction VALUES (51, 1, 3, NULL);
INSERT INTO public.junction VALUES (52, 2, 3, NULL);
INSERT INTO public.junction VALUES (53, 3, 3, NULL);
INSERT INTO public.junction VALUES (54, 4, 3, NULL);
INSERT INTO public.junction VALUES (55, 5, 3, NULL);
INSERT INTO public.junction VALUES (56, 6, 3, NULL);
INSERT INTO public.junction VALUES (57, 7, 3, NULL);
INSERT INTO public.junction VALUES (58, 8, 3, NULL);
INSERT INTO public.junction VALUES (59, 9, 3, NULL);
INSERT INTO public.junction VALUES (60, 10, 3, NULL);
INSERT INTO public.junction VALUES (61, 11, 3, NULL);
INSERT INTO public.junction VALUES (62, 12, 3, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 0.40, 4.5);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 0.01, 2.7);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 0.02, 4.6);
INSERT INTO public.moon VALUES (4, 'Ganymede', 5, 1.07, 4.5);
INSERT INTO public.moon VALUES (5, 'Callisto', 5, 1.89, 4.5);
INSERT INTO public.moon VALUES (6, 'Io', 5, 0.42, 4.5);
INSERT INTO public.moon VALUES (7, 'Europa', 5, 0.67, 4.5);
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, 0.18, 4.5);
INSERT INTO public.moon VALUES (9, 'Thebe', 5, 0.22, 4.5);
INSERT INTO public.moon VALUES (10, 'Metis', 5, 0.13, 4.5);
INSERT INTO public.moon VALUES (11, 'Himalia', 5, 11.50, 4.5);
INSERT INTO public.moon VALUES (12, 'Valetudo', 5, 19.00, 4.5);
INSERT INTO public.moon VALUES (13, 'S 2003 J2', 5, 29.54, 4.5);
INSERT INTO public.moon VALUES (14, 'Titan', 6, 1.22, 4.5);
INSERT INTO public.moon VALUES (15, 'Enceladus', 6, 0.24, 1.0);
INSERT INTO public.moon VALUES (16, 'Iapetus', 6, 3.56, 4.5);
INSERT INTO public.moon VALUES (17, 'Mimas', 6, 0.19, 4.5);
INSERT INTO public.moon VALUES (18, 'Rhea', 6, 0.53, 4.0);
INSERT INTO public.moon VALUES (19, 'Titania', 7, 0.43, 4.5);
INSERT INTO public.moon VALUES (20, 'Oberon', 7, 0.58, 4.5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, 'Smallest planet in solar system', 1, 0);
INSERT INTO public.planet VALUES (2, 'Venus', false, 'brightest natural object in the night sky after the moon', 1, 0);
INSERT INTO public.planet VALUES (3, 'Earth', true, 'only planet to harbor life', 1, 0);
INSERT INTO public.planet VALUES (4, 'Mars', false, 'known as the red planet', 1, 0);
INSERT INTO public.planet VALUES (5, 'Jupyter', false, 'largest planet in the solar system', 1, 4);
INSERT INTO public.planet VALUES (6, 'Saturn', false, 'most extensive ring system', 1, 7);
INSERT INTO public.planet VALUES (7, 'Uranus', false, 'classified has the ice giant', 1, 13);
INSERT INTO public.planet VALUES (8, 'Neptune', false, 'most distant planet from the sun', 1, 5);
INSERT INTO public.planet VALUES (9, 'Aldebaran B', false, 'gaseous exoplanet similar to Jupyter', 6, 0);
INSERT INTO public.planet VALUES (10, 'Pluto', false, 'dwarf planet in the outer region of solar system', 1, 0);
INSERT INTO public.planet VALUES (11, '55 Cancri E', false, 'exoplanet planet, located 41 light-years away from the Constellation of Cancer', 7, 0);
INSERT INTO public.planet VALUES (12, '55 Cancri F', false, 'exoplanet known has Harriot, with surface temperature around 27C', 7, 0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 4.50, 5500);
INSERT INTO public.star VALUES (3, 'Antares', 1, 0.01, 3400);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 0.01, 3300);
INSERT INTO public.star VALUES (5, 'Sirius A', 1, 0.30, 9600);
INSERT INTO public.star VALUES (6, 'Aldebaran', 1, 6.60, 3600);
INSERT INTO public.star VALUES (2, 'Alpheratz', 2, 0.10, 12700);
INSERT INTO public.star VALUES (7, '55 Cancri A', 1, 10.20, 4900);


--
-- Name: elements_elements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.elements_elements_id_seq', 13, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: junction_junction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.junction_junction_id_seq', 62, true);


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
-- Name: elements element_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.elements
    ADD CONSTRAINT element_unique UNIQUE (designation);


--
-- Name: elements elements_designation_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.elements
    ADD CONSTRAINT elements_designation_key UNIQUE (designation);


--
-- Name: elements elements_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.elements
    ADD CONSTRAINT elements_name_key UNIQUE (name);


--
-- Name: elements elements_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.elements
    ADD CONSTRAINT elements_pkey PRIMARY KEY (elements_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: junction junction_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.junction
    ADD CONSTRAINT junction_name_key UNIQUE (name);


--
-- Name: junction junction_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.junction
    ADD CONSTRAINT junction_pkey PRIMARY KEY (junction_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: galaxy name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT name UNIQUE (name);


--
-- Name: moon name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT name_unique UNIQUE (name);


--
-- Name: planet planet2_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet2_unique UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_unique UNIQUE (name);


--
-- Name: junction junction_elements_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.junction
    ADD CONSTRAINT junction_elements_id_fkey FOREIGN KEY (elements_id) REFERENCES public.elements(elements_id);


--
-- Name: junction junction_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.junction
    ADD CONSTRAINT junction_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

