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
    description text,
    name character varying(30) NOT NULL,
    images text,
    distance_ly integer
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
    name character varying(30) NOT NULL,
    planet_id integer,
    images text,
    name_meaning text
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
    name character varying(30) NOT NULL,
    star_id integer,
    discovery text,
    discoverer character varying(30),
    year_of_discovery integer,
    type character varying(30),
    gravity numeric(10,2),
    has_atmosphere boolean,
    images text
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
-- Name: rovers; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.rovers (
    rovers_id integer NOT NULL,
    name character varying(30) NOT NULL,
    weight integer,
    landing_year integer,
    distance_m integer
);


ALTER TABLE public.rovers OWNER TO freecodecamp;

--
-- Name: rovers_rover_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.rovers_rover_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rovers_rover_id_seq OWNER TO freecodecamp;

--
-- Name: rovers_rover_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.rovers_rover_id_seq OWNED BY public.rovers.rovers_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer,
    constellation character varying(30),
    discoverer character varying(30),
    year_of_discovery integer,
    type character varying(30),
    visible_to_eye boolean,
    star_images text
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
-- Name: rovers rovers_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.rovers ALTER COLUMN rovers_id SET DEFAULT nextval('public.rovers_rover_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Our own galaxy', 'Milky Way', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Milky_way_map.png/800px-Milky_way_map.png', NULL);
INSERT INTO public.galaxy VALUES (2, 'The Centaurus A is the largest and nearest radio galaxy, a massive source of radio wavelengths in the constellation Centaurus', 'Centaurus A', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f9/StuctureCenA-EN.png/1280px-StuctureCenA-EN.png', 13000000);
INSERT INTO public.galaxy VALUES (3, 'The LMC is classified as a Magellanic spiral. It contains a stellar bar that is geometrically off center, suggesting that it was a barred dwarf spiral galaxy before its spiral arms were disrupted.', 'Large Magellanic Cloud', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Eso1021d.jpg/1024px-Eso1021d.jpg', 163000);
INSERT INTO public.galaxy VALUES (4, 'NGC 4194, the Medusa merger, is a pair of interacting galaxies in the constellation Ursa Major about 130 million light-years away.', 'Medusa merger', 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/db/Snakes_and_Stones_NGC_4194.jpg/1024px-Snakes_and_Stones_NGC_4194.jpg', 128800000);
INSERT INTO public.galaxy VALUES (5, 'The Sunflower Galaxy was first discovered by the French astronomer Pierre Mechain on June 14, 1779. However, it was his colleague Charles Messier who officially cataloged the galaxy as Messier 63, along with 102 other objects, in his famous astronomical catalog.', 'Sunflower Galaxy', 'https://cdn.shopify.com/s/files/1/0742/7719/1954/files/sunflower-galaxy-3_1024x1024.jpg?v=1682602510', 29300000);
INSERT INTO public.galaxy VALUES (6, 'The Triangulum Galaxy, also known as M33, is a spiral galaxy located in the constellation Triangulum, and is one of the closest neighbors to our Milky Way galaxy. With a diameter of approximately 60,000 light-years, it is one of the smaller galaxies in our local group, but its proximity and unique features make it a fascinating object of study for astronomers and stargazers alike.', 'Triangulum Galaxy', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/64/VST_snaps_a_very_detailed_view_of_the_Triangulum_Galaxy.jpg/800px-VST_snaps_a_very_detailed_view_of_the_Triangulum_Galaxy.jpg', 3200000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e1/FullMoon2010.jpg/435px-FullMoon2010.jpg', NULL);
INSERT INTO public.moon VALUES (8, 'Dione', 6, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d0/Dione_in_natural_light_%28cropped%29.jpg/435px-Dione_in_natural_light_%28cropped%29.jpg', NULL);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/PIA17202_-_Approaching_Enceladus.jpg/435px-PIA17202_-_Approaching_Enceladus.jpg', NULL);
INSERT INTO public.moon VALUES (10, 'Prometheus', 6, 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/08/Prometheus_12-26-09b.jpg/435px-Prometheus_12-26-09b.jpg', NULL);
INSERT INTO public.moon VALUES (11, 'Mimas', 6, 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Mimas_Cassini.jpg/435px-Mimas_Cassini.jpg', NULL);
INSERT INTO public.moon VALUES (12, 'Rhea', 6, 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/62/PIA12714_Janus_crop.jpg/435px-PIA12714_Janus_crop.jpg', NULL);
INSERT INTO public.moon VALUES (13, 'Tethys', 6, 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/PIA18317-SaturnMoon-Tethys-Cassini-20150411.jpg/435px-PIA18317-SaturnMoon-Tethys-Cassini-20150411.jpg', NULL);
INSERT INTO public.moon VALUES (14, 'Titan', 6, 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Titan_in_true_color_by_Kevin_M._Gill.jpg/435px-Titan_in_true_color_by_Kevin_M._Gill.jpg', NULL);
INSERT INTO public.moon VALUES (15, 'Ariel', 7, 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/84/Ariel_in_monochrome.jpg/435px-Ariel_in_monochrome.jpg', NULL);
INSERT INTO public.moon VALUES (16, 'Puck', 7, 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Puck.png/435px-Puck.png', NULL);
INSERT INTO public.moon VALUES (17, 'Miranda', 7, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Miranda_-_January_24_1986_%2830906319004%29.jpg/435px-Miranda_-_January_24_1986_%2830906319004%29.jpg', NULL);
INSERT INTO public.moon VALUES (18, 'Umbriel', 7, 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/PIA00040_Umbrielx2.47.jpg/435px-PIA00040_Umbrielx2.47.jpg', NULL);
INSERT INTO public.moon VALUES (19, 'Titania', 7, 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/Titania_%28moon%29_color%2C_cropped.jpg/435px-Titania_%28moon%29_color%2C_cropped.jpg', NULL);
INSERT INTO public.moon VALUES (20, 'Oberon', 7, 'https://upload.wikimedia.org/wikipedia/commons/6/6d/Oberon_in_true_color_by_Kevin_M._Gill.jpg', NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Phobos_colour_2008.jpg/435px-Phobos_colour_2008.jpg', 'the god and personification of fear and panic in Greek mythology');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/86/NASA-Deimos-MarsMoon-20090221.jpg/435px-NASA-Deimos-MarsMoon-20090221.jpg', 'He is the son of Ares and Aphrodite, and the brother of Phobos. Deimos served to represent the feelings of dread and terror that befell those before a battle, while Phobos personified feelings of fear and panic in the midst of battle.');
INSERT INTO public.moon VALUES (4, 'Io', 5, 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/Io_highest_resolution_true_color.jpg/435px-Io_highest_resolution_true_color.jpg', 'Io was, in Greek mythology, one of the mortal lovers of Zeus. An Argive princess, she was an ancestor of many kings and heroes');
INSERT INTO public.moon VALUES (5, 'Europa', 5, 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1c/Europa_in_natural_color.png/435px-Europa_in_natural_color.png', 'Europa, in Greek mythology, the daughter either of Phoenix or of Agenor, king of Phoenicia. The beauty of Europa inspired the love of Zeus, who approached her in the form of a white bull and carried her away from Phoenicia to Crete. There she bore Zeus three sons: Minos, ruler of Crete; Rhadamanthys, ruler of the Cyclades Islands; and, according to some legends, Sarpedon, ruler of Lycia.');
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Ganymede_-_Perijove_34_Composite.png/435px-Ganymede_-_Perijove_34_Composite.png', 'The story of Ganymede in Greek mythology spins an intriguing yarn about an alluring young mortal who caught the eye of Zeus, ruler of gods. As Zeus infatuation grew, he transformed into an eagle and whisked Ganymede away to Olympus to become his personal cupbearer – and this act forever changed his destiny');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/Callisto_-_July_8_1979_%2838926064465%29.jpg/435px-Callisto_-_July_8_1979_%2838926064465%29.jpg', 'Callisto (fairest) In Greek mythology, an Arcadian nymph, follower of Artemis; daughter of Lycam and Cyllene');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 11, '', '', NULL, 'terrestrial planet', 0.38, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4a/Mercury_in_true_color.jpg/435px-Mercury_in_true_color.jpg');
INSERT INTO public.planet VALUES (2, 'Venus', 11, '', '', NULL, 'terrestrial planet', 0.90, true, 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b2/Venus_2_Approach_Image.jpg/435px-Venus_2_Approach_Image.jpg');
INSERT INTO public.planet VALUES (3, 'Earth', 11, '', '', NULL, 'terrestrial planet', 1.00, true, 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/The_Blue_Marble_%28remastered%29.jpg/435px-The_Blue_Marble_%28remastered%29.jpg');
INSERT INTO public.planet VALUES (4, 'Mars', 11, '', '', NULL, 'terrestrial planet', 0.38, true, 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0c/Mars_-_August_30_2021_-_Flickr_-_Kevin_M._Gill.png/435px-Mars_-_August_30_2021_-_Flickr_-_Kevin_M._Gill.png');
INSERT INTO public.planet VALUES (5, 'Jupiter', 11, '', '', NULL, 'gas giant', 2.53, true, 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Jupiter_New_Horizons.jpg/435px-Jupiter_New_Horizons.jpg');
INSERT INTO public.planet VALUES (6, 'Saturn', 11, '', '', NULL, 'gas giant', 1.06, true, 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c7/Saturn_during_Equinox.jpg/450px-Saturn_during_Equinox.jpg');
INSERT INTO public.planet VALUES (7, 'Uranus', 11, 'Sir William Herschel first observed Uranus on 13 March 1781, leading to its discovery as a planet, expanding the known boundaries of the Solar System for the first time in history and making Uranus the first planet classified as such with the aid of a telescope', 'William Herschel', 1781, 'ice giant', 0.89, true, 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/69/Uranus_Voyager2_color_calibrated.png/435px-Uranus_Voyager2_color_calibrated.png');
INSERT INTO public.planet VALUES (8, 'Neptune', 11, 'The planet Neptune was mathematically predicted before it was directly observed. With a prediction by Urbain Le Verrier, telescopic observations confirming the existence of a major planet were made on the night of September 23–24, 1846, at the Berlin Observatory', 'Johann Gottfried Galle', 1846, 'ice giant', 1.14, true, 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b9/Neptune_Voyager2_color_calibrated.png/435px-Neptune_Voyager2_color_calibrated.png');
INSERT INTO public.planet VALUES (9, 'Tahay', 15, '', '', NULL, '', NULL, false, 'https://leonardo.osnova.io/973401db-ff21-5672-814b-7d2a096711f7/-/preview/2000/-/format/webp/');
INSERT INTO public.planet VALUES (10, 'Ceres', 11, 'It was the first asteroid discovered on 1 January 1801, by Giuseppe Piazzi at Palermo Astronomical Observatory in Sicily and announced as a new planet. Ceres was later classified as an asteroid and then a dwarf planet, the only one always inside Neptune_s orbit.', 'Giuseppe Piazzi', 1801, 'dwarf planet', 0.03, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/76/Ceres_-_RC3_-_Haulani_Crater_%2822381131691%29_%28cropped%29.jpg/435px-Ceres_-_RC3_-_Haulani_Crater_%2822381131691%29_%28cropped%29.jpg');
INSERT INTO public.planet VALUES (11, 'Pluto', 11, 'Tombaugh_s task was to systematically image the night sky in pairs of photographs, then examine each pair and determine whether any objects had shifted position. Using a blink comparator, he rapidly shifted back and forth between views of each of the plates to create the illusion of movement of any objects that had changed position or appearance between photographs. On February 18, 1930, after nearly a year of searching, Tombaugh discovered a possible moving object on photographic plates taken on January 23 and 29. A lesser-quality photograph taken on January 21 helped confirm the movement', 'Clyde Tombaugh', 1930, 'dwarf planet', 0.06, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ef/Pluto_in_True_Color_-_High-Res.jpg/435px-Pluto_in_True_Color_-_High-Res.jpg');
INSERT INTO public.planet VALUES (12, 'Eris', 11, 'Routine observations were taken by the team on October 21, 2003, using the 1.2 m Samuel Oschin Schmidt telescope at Palomar Observatory, California, but the image of Eris was not discovered at that point due to its very slow motion across the sky: The team_s automatic image-searching software excluded all objects moving at less than 1.5 arcseconds per hour to reduce the number of false positives returned.', 'Mike Brown', 2005, 'dwarf planet', 0.08, false, 'https://upload.wikimedia.org/wikipedia/commons/5/5b/Eris_and_dysnomia2.jpg');


--
-- Data for Name: rovers; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.rovers VALUES (1, 'Lunokhod 1', 756, 1970, 10540);
INSERT INTO public.rovers VALUES (2, 'Pragyan', 26, 2023, 101);
INSERT INTO public.rovers VALUES (3, 'Perseverance', 1025, 2021, 40000);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (11, 'Sun', 1, '', '', NULL, 'G2V', true, 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/-_panoramio_%28785%29.jpg/1024px--_panoramio_%28785%29.jpg');
INSERT INTO public.star VALUES (12, 'Vega', 1, 'Lyra', '', NULL, 'A0V', true, 'https://starwalk.space/gallery/images/vega-first-photo/1140x641.jpg');
INSERT INTO public.star VALUES (13, 'Sirius', 1, 'Canis Major', '', NULL, 'DA2', true, 'https://upload.wikimedia.org/wikipedia/commons/4/49/Sirius_Midnight_Culmination_New_Year_2022.png');
INSERT INTO public.star VALUES (14, 'Tau Ceti', 1, 'Ceti', '', NULL, 'G8,5V', true, 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c7/Tau_ceti_map.png/1024px-Tau_ceti_map.png');
INSERT INTO public.star VALUES (15, 'Añañuca (Gliese 367)', 1, 'Vela', '', NULL, ' M1.0V', false, 'https://universemagazine.com/wp-content/uploads/2024/01/gliese-367-b-is-a-dark.jpg');
INSERT INTO public.star VALUES (16, 'OS Andromedae', 1, 'Andromeda', 'Mitsuri Suzuki', 1986, '', false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/OSAndLocation.png/1024px-OSAndLocation.png');


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: rovers_rover_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.rovers_rover_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 16, true);


--
-- Name: galaxy galaxy_images_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_images_key UNIQUE (images);


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
-- Name: moon moon_images_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_images_key UNIQUE (images);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_images_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_images_key UNIQUE (images);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: rovers rovers_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.rovers
    ADD CONSTRAINT rovers_name_key UNIQUE (name);


--
-- Name: rovers rovers_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.rovers
    ADD CONSTRAINT rovers_pkey PRIMARY KEY (rovers_id);


--
-- Name: star star_images_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_images_key UNIQUE (star_images);


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

