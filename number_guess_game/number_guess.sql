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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    username character varying(30) NOT NULL,
    number_of_guesses integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 'das', 999);
INSERT INTO public.games VALUES (2, 'sadf', 1);
INSERT INTO public.games VALUES (3, 'saddgdagas', 2);
INSERT INTO public.games VALUES (4, 'user_1708083543697', 78);
INSERT INTO public.games VALUES (5, 'user_1708083543697', 410);
INSERT INTO public.games VALUES (6, 'user_1708083543696', 401);
INSERT INTO public.games VALUES (7, 'user_1708083543696', 3);
INSERT INTO public.games VALUES (8, 'user_1708083543697', 484);
INSERT INTO public.games VALUES (9, 'user_1708083543697', 520);
INSERT INTO public.games VALUES (10, 'user_1708083543697', 924);
INSERT INTO public.games VALUES (11, 'dsf', 6);
INSERT INTO public.games VALUES (12, 'sdfsd', 8);
INSERT INTO public.games VALUES (13, 'name', 10);
INSERT INTO public.games VALUES (14, 'user_1708084903069', 676);
INSERT INTO public.games VALUES (15, 'user_1708084903069', 696);
INSERT INTO public.games VALUES (16, 'user_1708084903068', 6);
INSERT INTO public.games VALUES (17, 'user_1708084903068', 170);
INSERT INTO public.games VALUES (18, 'user_1708084903069', 741);
INSERT INTO public.games VALUES (19, 'user_1708084903069', 703);
INSERT INTO public.games VALUES (20, 'user_1708084903069', 432);
INSERT INTO public.games VALUES (21, 'user_1708084975194', 358);
INSERT INTO public.games VALUES (22, 'user_1708084975194', 830);
INSERT INTO public.games VALUES (23, 'user_1708084975193', 843);
INSERT INTO public.games VALUES (24, 'user_1708084975193', 441);
INSERT INTO public.games VALUES (25, 'user_1708084975194', 336);
INSERT INTO public.games VALUES (26, 'user_1708084975194', 362);
INSERT INTO public.games VALUES (27, 'user_1708084975194', 674);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 27, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- PostgreSQL database dump complete
--

