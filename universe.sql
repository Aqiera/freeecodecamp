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
    name character varying(35) NOT NULL,
    distance integer,
    magnitude numeric(18,3),
    constellation text,
    discovered boolean DEFAULT true
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(35) NOT NULL,
    equatorial_diameter numeric(18,3),
    mass double precision,
    planet_id integer,
    planet_moon integer DEFAULT 1
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(35) NOT NULL,
    equatorial_diameter numeric(18,3),
    mass double precision,
    star_id integer,
    star_planet integer DEFAULT 1
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: species; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.species (
    species_id integer NOT NULL,
    name character varying(30),
    reached_moon boolean NOT NULL,
    number integer NOT NULL
);


ALTER TABLE public.species OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(35) NOT NULL,
    magnitude numeric(18,3),
    galaxy_id integer,
    discovered boolean DEFAULT true
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 0, -6.500, 'Sagittarius', NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 2500000, 3.400, 'Andromeda', NULL);
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy', 2900000, 5.700, 'Triangulum', NULL);
INSERT INTO public.galaxy VALUES (4, 'Centaurus A', 13700000, 6.840, 'Centaurus', NULL);
INSERT INTO public.galaxy VALUES (5, 'Bode"s Galaxy', 12000000, 6.940, 'Ursa Major', NULL);
INSERT INTO public.galaxy VALUES (6, 'Sculptor Galaxy', 12000000, 7.200, 'Sculptr', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 0.272, 0.0123, 3, NULL);
INSERT INTO public.moon VALUES (2, 'Io', 0.285, 0.015, 5, NULL);
INSERT INTO public.moon VALUES (3, 'Europa', 0.246, 0.00804, 5, NULL);
INSERT INTO public.moon VALUES (4, 'Ganymede', 0.413, 0.0248, 5, NULL);
INSERT INTO public.moon VALUES (5, 'Callisto', 0.378, 0.018, 5, NULL);
INSERT INTO public.moon VALUES (6, 'Mimas', 0.031, 6.28e-06, 6, NULL);
INSERT INTO public.moon VALUES (7, 'Enceladus', 0.040, 1.81e-05, 6, NULL);
INSERT INTO public.moon VALUES (8, 'Tethys', 0.084, 0.000103, 6, NULL);
INSERT INTO public.moon VALUES (9, 'Dione', 0.088, 0.000183, 6, NULL);
INSERT INTO public.moon VALUES (10, 'Rhea', 0.120, 0.000386, 6, NULL);
INSERT INTO public.moon VALUES (11, 'Titan', 0.404, 0.0225, 6, NULL);
INSERT INTO public.moon VALUES (12, 'Iapetus', 0.115, 0.000302, 6, NULL);
INSERT INTO public.moon VALUES (13, 'Miranda', 0.037, 1.1e-05, 7, NULL);
INSERT INTO public.moon VALUES (14, 'Ariel', 0.091, 0.000226, 7, NULL);
INSERT INTO public.moon VALUES (15, 'Umbriel', 0.092, 0.0002, 7, NULL);
INSERT INTO public.moon VALUES (16, 'Titania', 0.124, 0.00059, 7, NULL);
INSERT INTO public.moon VALUES (17, 'Oberon', 0.119, 0.000505, 7, NULL);
INSERT INTO public.moon VALUES (18, 'Triton', 0.212, 0.00358, 8, NULL);
INSERT INTO public.moon VALUES (19, 'Charon', 0.095, 0.000255, 10, NULL);
INSERT INTO public.moon VALUES (20, 'Proteus', NULL, NULL, 8, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0.383, 0.06, 1, NULL);
INSERT INTO public.planet VALUES (2, 'Venus', 0.949, 0.81, 1, NULL);
INSERT INTO public.planet VALUES (3, 'Earth', 1.000, 1, 1, NULL);
INSERT INTO public.planet VALUES (4, 'Mars', 0.532, 0.11, 1, NULL);
INSERT INTO public.planet VALUES (6, 'Saturn', 9.449, 95.16, 1, NULL);
INSERT INTO public.planet VALUES (7, 'Uranus', 4.007, 14.54, 1, NULL);
INSERT INTO public.planet VALUES (8, 'Neptune', 3.883, 17.15, 1, NULL);
INSERT INTO public.planet VALUES (10, 'Pluto', 0.186, 0.0022, 1, NULL);
INSERT INTO public.planet VALUES (11, 'Haumea', 0.130, 0.0007, 1, NULL);
INSERT INTO public.planet VALUES (5, 'Jupiter', 11.209, 317.83, 1, NULL);
INSERT INTO public.planet VALUES (9, 'Ceres', 0.074, 0.00016, 1, NULL);
INSERT INTO public.planet VALUES (12, 'Quaoar', 0.085, 0.0002, 1, NULL);


--
-- Data for Name: species; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.species VALUES (1, 'Human', true, 12);
INSERT INTO public.species VALUES (2, 'Silkworm', true, 1);
INSERT INTO public.species VALUES (3, 'Tardigrade', true, 1000);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4.830, 1, NULL);
INSERT INTO public.star VALUES (2, 'Apheratz', 2.070, 2, NULL);
INSERT INTO public.star VALUES (3, 'Mirach', 2.070, 2, NULL);
INSERT INTO public.star VALUES (4, '51 And', 3.590, 2, NULL);
INSERT INTO public.star VALUES (5, 'β Tri', 3.420, 3, NULL);
INSERT INTO public.star VALUES (6, 'α Tri', 3.420, 3, NULL);


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
-- Name: species species_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_name_key UNIQUE (name);


--
-- Name: species species_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_pkey PRIMARY KEY (species_id);


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

