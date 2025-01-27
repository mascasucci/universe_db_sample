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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    description text,
    age_in_million_of_years integer NOT NULL,
    galaxy_type text,
    has_life boolean,
    distance_from_earth_kpc numeric
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
    name character varying(30),
    planet_id integer,
    description text,
    age_in_million_of_years numeric NOT NULL
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
-- Name: nebula_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.nebula_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nebula_id_seq OWNER TO freecodecamp;

--
-- Name: nebula; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.nebula (
    nebula_id integer DEFAULT nextval('public.nebula_id_seq'::regclass) NOT NULL,
    name character varying(30),
    description text,
    age_in_million_of_years integer NOT NULL,
    distance_from_earth_kpc numeric
);


ALTER TABLE public.nebula OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30),
    star_id integer,
    description text,
    age_in_million_of_years numeric NOT NULL,
    has_life boolean,
    average_distance_from_earth_au numeric
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
    galaxy_id integer,
    description text,
    age_in_million_of_years integer NOT NULL
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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (5, 'Triangulum galaxy', 'The Triangulum galaxy is the third-largest member of the Local Group of galaxies', 10000, 'Spiral galaxy', NULL, 849);
INSERT INTO public.galaxy VALUES (4, 'Sombrero galaxy', 'The Sombrero Galaxy is a unusual galaxy of unclear classification', 13000, 'unclear classification galaxy', NULL, 9550);
INSERT INTO public.galaxy VALUES (7, 'Black eye galaxy', 'It has a spectacular dark band of absorbing dust in front of its bright nucleus', 12000, 'Spiral galaxy', NULL, 5340);
INSERT INTO public.galaxy VALUES (8, 'Milky Way galaxy', 'The Milky Way has three main parts: a disk,a bulge at the core, and an outer halo all around it', 13500, 'Barred Spiral galaxy', NULL, 8.5);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 'Centaurus A or NGC 5128 is a prominent galaxy in the constellation of Centaurus', 13000, 'lenticular and elliptical', NULL, 3800);
INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'The Andromeda Galaxy is a barred spiral galaxy and is the nearest major galaxy to the Milky Way', 10000, 'barred spyral galaxy', NULL, 765);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (3, 'Phobos', 1, 'Phobos is the larger and closer of Mars two moons.', 4600);
INSERT INTO public.moon VALUES (4, 'Deimos', 1, 'Deimos is the smaller and further of Mars two moons', 4600);
INSERT INTO public.moon VALUES (5, 'Moon', 2, 'The Moon is the only natural satellite of Earth. It is a rocky body with a cratered surface', 4460);
INSERT INTO public.moon VALUES (6, 'Io', 3, 'Io is one of the most volcanically active moons in the entire Solar System', 4600);
INSERT INTO public.moon VALUES (7, 'Europa', 3, 'Europa is known for its icy surface and the strong possibility of a vast salty ocean beneath', 4600);
INSERT INTO public.moon VALUES (8, 'Ganymede', 3, 'Ganymede is the largest moon in the solar system even bigger than the planet Mercury!', 4600);
INSERT INTO public.moon VALUES (9, 'Titan', 4, 'Titan is the largest moon of Saturn and the second in the Solar System', 4600);
INSERT INTO public.moon VALUES (10, 'Enceladus', 4, 'Enceladus is famous for its icy surface and the geysers that erupt from its south pole', 4600);
INSERT INTO public.moon VALUES (11, 'Rhea', 4, 'Rhea is heavily cratered, suggesting a long and ancient history', 4600);
INSERT INTO public.moon VALUES (12, 'Miranda', 5, 'Known for its deep canyons, towering cliffs, and a strange patchwork of terrains', 4600);
INSERT INTO public.moon VALUES (13, 'Ariel', 5, 'The brightest of the moons of Uranus with a surface marked by numerous craters and a system of canyons and valleys', 4600);
INSERT INTO public.moon VALUES (14, 'Oberon', 5, 'The outermost of the major moons of Uranus, heavily cratered and evidence of past geological activity', 4600);
INSERT INTO public.moon VALUES (15, 'Naiad', 6, 'Naiad is the smallest and innermost of the known moons of Neptun', 4600);
INSERT INTO public.moon VALUES (16, 'Proteus', 6, 'Proteus is the second-largest moon of Neptune irregularly shaped and heavily cratered', 4600);
INSERT INTO public.moon VALUES (17, 'Nereid', 6, 'Nereid is known for its highly eccentric orbit around Neptune, one of the most eccentric of any known moon', 4600);
INSERT INTO public.moon VALUES (18, 'Charon', 10, 'Believed to have formed from a giant impact event early in the history of the Pluto system', 4500);
INSERT INTO public.moon VALUES (19, 'Nix', 10, ' Likely formed from the debris of the same giant impact that created Charon', 4500);
INSERT INTO public.moon VALUES (20, 'Hydra', 10, ' Likely formed from the debris of the same giant impact that created Charon', 4500);
INSERT INTO public.moon VALUES (21, 'Dysnomia', 12, 'Dysnomia is the only known moon of the dwarf planet Eris, relatively small compared to its parent body', 4500);
INSERT INTO public.moon VALUES (22, 'Kerberos', 10, ' likely formed from debris created during the same impact event that formed Charon', 4500);
INSERT INTO public.moon VALUES (23, 'Dione', 4, 'Dione is known for its heavily cratered surface and striking "wispy" terrain', 4500);


--
-- Data for Name: nebula; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.nebula VALUES (1, 'Orion', 'A prominent diffuse nebula in the constellation Orion, visible to the naked eye', 3, 1.3);
INSERT INTO public.nebula VALUES (2, 'Eagle', 'A large emission nebula known for its dramatic formations of interstellar gas and dst', 6, 1.7);
INSERT INTO public.nebula VALUES (3, 'Lagoon', 'A large emission nebula containing a young open cluster of stars', 3, 1.1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mars', 1, 'Mars,the "Red Planet" is a cold, desert world with a thin atmosphere', 4600, false, 1.52);
INSERT INTO public.planet VALUES (2, 'Earth', 1, 'Earth is the third planet from the Sun and the only known planet to support life', 4540, true, 0);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, 'Jupiter is the largest planet in our solar system, it is made of gasses', 4600, false, 5.2);
INSERT INTO public.planet VALUES (4, 'Saturn', 1, 'Saturn is a gas giant renowned for its stunning system of rings', 4600, false, 9.5);
INSERT INTO public.planet VALUES (5, 'Uranus', 1, 'Uranus is an ice giant, known for its unusual tilt, causing extreme seasons', 4600, false, 19.2);
INSERT INTO public.planet VALUES (6, 'Neptune', 1, 'Neptune is the eighth and farthest-known planet from the Sun', 4600, false, 30);
INSERT INTO public.planet VALUES (7, 'Mercury', 1, 'Mercury is the smallest and closest planet to the Sun, a rocky world with extreme temperatures ', 4600, false, 1.39);
INSERT INTO public.planet VALUES (8, 'Venus', 1, 'Venus is the hottest planet in our solar system, with a thick atmosphere trapping heat', 4600, false, 1);
INSERT INTO public.planet VALUES (10, 'Pluto', 1, 'Pluto is a dwarf planet located in the Kuiper Belt, a region beyond Neptune', 4600, false, 38.5);
INSERT INTO public.planet VALUES (9, 'Ceres', 1, 'Ceres is the largest object and the only dwarf planet in the asteroid belt between Mars and Jupiter', 4600, false, 1.77);
INSERT INTO public.planet VALUES (11, 'Haumea', 1, 'Haumea is a dwarf planet known for its extremely fast rotation, giving it an elongated shape', 4600, false, 42.1);
INSERT INTO public.planet VALUES (12, 'Eris', 1, 'Eris is the most massive known dwarf planet in our solar system', 4600, false, 66.7);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 8, 'The Sun is a hot glowing ball of gas at the center of our solar system', 4600);
INSERT INTO public.star VALUES (2, 'Alpheratz', 1, 'The brightest star in the Andromeda constellation', 60);
INSERT INTO public.star VALUES (3, 'Upsilon', 1, 'Upsilon is in a binary star system with a primary yellow-white dwarf star component.', 3120);
INSERT INTO public.star VALUES (4, 'Mirach', 1, 'Mirach is a red giant star in the constellation Andromeda', 2000);
INSERT INTO public.star VALUES (6, 'Betelgeuse', 8, 'Betelgeuse is a massive red supergiant star, one of the brightest in the night sky', 10);
INSERT INTO public.star VALUES (5, 'Sirio', 8, 'Sirius is the brightest star in our night sky. It is a binary star system', 230);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: nebula_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.nebula_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: nebula nebula_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_pkey PRIMARY KEY (nebula_id);


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
-- Name: nebula unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: planet fk_planet_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon fk_smoon_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_smoon_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star fk_star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

