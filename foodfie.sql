--
-- PostgreSQL database dump
--

-- Dumped from database version 11.3 (Ubuntu 11.3-1.pgdg18.04+1)
-- Dumped by pg_dump version 11.3 (Ubuntu 11.3-1.pgdg18.04+1)

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

SET default_with_oids = false;

--
-- Name: active_admin_comments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_admin_comments (
    id integer NOT NULL,
    namespace character varying,
    body text,
    resource_id character varying NOT NULL,
    resource_type character varying NOT NULL,
    author_id integer,
    author_type character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_admin_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_admin_comments_id_seq OWNED BY public.active_admin_comments.id;


--
-- Name: admin_users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.admin_users (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: admin_users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.admin_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: admin_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.admin_users_id_seq OWNED BY public.admin_users.id;


--
-- Name: authentications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.authentications (
    id integer NOT NULL,
    user_id integer,
    provider character varying,
    uid character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: authentications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.authentications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: authentications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.authentications_id_seq OWNED BY public.authentications.id;


--
-- Name: badges; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.badges (
    id integer NOT NULL,
    title character varying,
    description text,
    image_file_name character varying,
    image_content_type character varying,
    image_file_size integer,
    image_updated_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: badges_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.badges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: badges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.badges_id_seq OWNED BY public.badges.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.comments (
    id integer NOT NULL,
    context text,
    commentable_id integer,
    commentable_type character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id integer,
    average_rating double precision,
    report character varying
);


--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: delayed_jobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.delayed_jobs (
    id integer NOT NULL,
    priority integer DEFAULT 0 NOT NULL,
    attempts integer DEFAULT 0 NOT NULL,
    handler text NOT NULL,
    last_error text,
    run_at timestamp without time zone,
    locked_at timestamp without time zone,
    failed_at timestamp without time zone,
    locked_by character varying,
    queue character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: delayed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.delayed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: delayed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.delayed_jobs_id_seq OWNED BY public.delayed_jobs.id;


--
-- Name: dish_affections; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dish_affections (
    id integer NOT NULL,
    favouriter_id integer,
    dish_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: dish_affections_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dish_affections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dish_affections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dish_affections_id_seq OWNED BY public.dish_affections.id;


--
-- Name: dish_likes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dish_likes (
    id integer NOT NULL,
    user_id integer,
    image_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: dish_likes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dish_likes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dish_likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dish_likes_id_seq OWNED BY public.dish_likes.id;


--
-- Name: dishes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dishes (
    id integer NOT NULL,
    restaurant_id integer,
    name character varying,
    price numeric(5,2),
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_rating double precision,
    image_id integer,
    no_of_followers integer,
    no_of_dishes integer,
    avg_rating double precision
);


--
-- Name: dishes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dishes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dishes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dishes_id_seq OWNED BY public.dishes.id;


--
-- Name: dishes_users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dishes_users (
    id integer NOT NULL,
    user_id integer,
    dish_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    reposted boolean DEFAULT false
);


--
-- Name: dishes_users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dishes_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dishes_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dishes_users_id_seq OWNED BY public.dishes_users.id;


--
-- Name: images; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.images (
    id integer NOT NULL,
    image_file_name character varying,
    image_content_type character varying,
    image_file_size integer,
    image_updated_at timestamp without time zone,
    attachable_id integer,
    attachable_type character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id integer,
    image_processing boolean DEFAULT false,
    local_image_file_name character varying,
    local_image_content_type character varying,
    local_image_file_size integer,
    local_image_updated_at timestamp without time zone
);


--
-- Name: images_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.images_id_seq OWNED BY public.images.id;


--
-- Name: ratings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ratings (
    id integer NOT NULL,
    user_id integer,
    dish_id integer,
    weight double precision,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: ratings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ratings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ratings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ratings_id_seq OWNED BY public.ratings.id;


--
-- Name: restaurant_affections; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.restaurant_affections (
    id integer NOT NULL,
    favouriter_id integer,
    restaurant_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: restaurant_affections_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.restaurant_affections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: restaurant_affections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.restaurant_affections_id_seq OWNED BY public.restaurant_affections.id;


--
-- Name: restaurant_fellowships; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.restaurant_fellowships (
    id integer NOT NULL,
    follower_id integer,
    restaurant_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: restaurant_fellowships_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.restaurant_fellowships_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: restaurant_fellowships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.restaurant_fellowships_id_seq OWNED BY public.restaurant_fellowships.id;


--
-- Name: restaurants; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.restaurants (
    id integer NOT NULL,
    name character varying,
    address character varying,
    phone_number character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    google_place_id character varying,
    latitude double precision,
    longitude double precision,
    website character varying,
    rating double precision,
    city character varying
);


--
-- Name: restaurants_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.restaurants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: restaurants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.restaurants_id_seq OWNED BY public.restaurants.id;


--
-- Name: rpush_apps; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.rpush_apps (
    id integer NOT NULL,
    name character varying NOT NULL,
    environment character varying,
    certificate text,
    password character varying,
    connections integer DEFAULT 1 NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    type character varying NOT NULL,
    auth_key character varying,
    client_id character varying,
    client_secret character varying,
    access_token character varying,
    access_token_expiration timestamp without time zone
);


--
-- Name: rpush_apps_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.rpush_apps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rpush_apps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.rpush_apps_id_seq OWNED BY public.rpush_apps.id;


--
-- Name: rpush_feedback; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.rpush_feedback (
    id integer NOT NULL,
    device_token character varying(64) NOT NULL,
    failed_at timestamp without time zone NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    app_id integer
);


--
-- Name: rpush_feedback_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.rpush_feedback_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rpush_feedback_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.rpush_feedback_id_seq OWNED BY public.rpush_feedback.id;


--
-- Name: rpush_notifications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.rpush_notifications (
    id integer NOT NULL,
    badge integer,
    device_token character varying(64),
    sound character varying,
    alert text,
    data text,
    expiry integer DEFAULT 86400,
    delivered boolean DEFAULT false NOT NULL,
    delivered_at timestamp without time zone,
    failed boolean DEFAULT false NOT NULL,
    failed_at timestamp without time zone,
    error_code integer,
    error_description text,
    deliver_after timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    alert_is_json boolean DEFAULT false NOT NULL,
    type character varying NOT NULL,
    collapse_key character varying,
    delay_while_idle boolean DEFAULT false NOT NULL,
    registration_ids text,
    app_id integer NOT NULL,
    retries integer DEFAULT 0,
    uri character varying,
    fail_after timestamp without time zone,
    processing boolean DEFAULT false NOT NULL,
    priority integer,
    url_args text,
    category character varying,
    content_available boolean DEFAULT false NOT NULL,
    notification text,
    mutable_content boolean DEFAULT false NOT NULL,
    external_device_id character varying
);


--
-- Name: rpush_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.rpush_notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rpush_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.rpush_notifications_id_seq OWNED BY public.rpush_notifications.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: settings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.settings (
    id integer NOT NULL,
    share_text text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    google_places_api character varying,
    google_maps_api character varying
);


--
-- Name: settings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.settings_id_seq OWNED BY public.settings.id;


--
-- Name: taggings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.taggings (
    id integer NOT NULL,
    tag_id integer,
    taggable_id integer,
    taggable_type character varying,
    tagger_id integer,
    tagger_type character varying,
    context character varying(128),
    created_at timestamp without time zone
);


--
-- Name: taggings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.taggings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: taggings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.taggings_id_seq OWNED BY public.taggings.id;


--
-- Name: tags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tags (
    id integer NOT NULL,
    name character varying,
    taggings_count integer DEFAULT 0,
    count integer
);


--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tags_id_seq OWNED BY public.tags.id;


--
-- Name: user_fellowships; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_fellowships (
    id integer NOT NULL,
    follower_id integer,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: user_fellowships_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_fellowships_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_fellowships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_fellowships_id_seq OWNED BY public.user_fellowships.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying,
    first_name character varying,
    last_name character varying,
    email character varying,
    password_digest character varying,
    activation_token character varying,
    authentication_token character varying,
    activated boolean DEFAULT false,
    reset_password_token character varying,
    activated_at timestamp without time zone,
    reset_password_token_sent_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    no_of_post integer,
    no_of_followers integer,
    no_of_following integer,
    device_id character varying,
    fav_restaurant boolean DEFAULT true,
    fav_dish boolean DEFAULT true,
    post_by_follow_user boolean DEFAULT true,
    starts_following boolean DEFAULT true
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: active_admin_comments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_admin_comments ALTER COLUMN id SET DEFAULT nextval('public.active_admin_comments_id_seq'::regclass);


--
-- Name: admin_users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_users ALTER COLUMN id SET DEFAULT nextval('public.admin_users_id_seq'::regclass);


--
-- Name: authentications id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.authentications ALTER COLUMN id SET DEFAULT nextval('public.authentications_id_seq'::regclass);


--
-- Name: badges id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.badges ALTER COLUMN id SET DEFAULT nextval('public.badges_id_seq'::regclass);


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: delayed_jobs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.delayed_jobs ALTER COLUMN id SET DEFAULT nextval('public.delayed_jobs_id_seq'::regclass);


--
-- Name: dish_affections id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dish_affections ALTER COLUMN id SET DEFAULT nextval('public.dish_affections_id_seq'::regclass);


--
-- Name: dish_likes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dish_likes ALTER COLUMN id SET DEFAULT nextval('public.dish_likes_id_seq'::regclass);


--
-- Name: dishes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dishes ALTER COLUMN id SET DEFAULT nextval('public.dishes_id_seq'::regclass);


--
-- Name: dishes_users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dishes_users ALTER COLUMN id SET DEFAULT nextval('public.dishes_users_id_seq'::regclass);


--
-- Name: images id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.images ALTER COLUMN id SET DEFAULT nextval('public.images_id_seq'::regclass);


--
-- Name: ratings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ratings ALTER COLUMN id SET DEFAULT nextval('public.ratings_id_seq'::regclass);


--
-- Name: restaurant_affections id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.restaurant_affections ALTER COLUMN id SET DEFAULT nextval('public.restaurant_affections_id_seq'::regclass);


--
-- Name: restaurant_fellowships id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.restaurant_fellowships ALTER COLUMN id SET DEFAULT nextval('public.restaurant_fellowships_id_seq'::regclass);


--
-- Name: restaurants id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.restaurants ALTER COLUMN id SET DEFAULT nextval('public.restaurants_id_seq'::regclass);


--
-- Name: rpush_apps id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rpush_apps ALTER COLUMN id SET DEFAULT nextval('public.rpush_apps_id_seq'::regclass);


--
-- Name: rpush_feedback id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rpush_feedback ALTER COLUMN id SET DEFAULT nextval('public.rpush_feedback_id_seq'::regclass);


--
-- Name: rpush_notifications id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rpush_notifications ALTER COLUMN id SET DEFAULT nextval('public.rpush_notifications_id_seq'::regclass);


--
-- Name: settings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.settings ALTER COLUMN id SET DEFAULT nextval('public.settings_id_seq'::regclass);


--
-- Name: taggings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.taggings ALTER COLUMN id SET DEFAULT nextval('public.taggings_id_seq'::regclass);


--
-- Name: tags id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tags ALTER COLUMN id SET DEFAULT nextval('public.tags_id_seq'::regclass);


--
-- Name: user_fellowships id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_fellowships ALTER COLUMN id SET DEFAULT nextval('public.user_fellowships_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: active_admin_comments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.active_admin_comments (id, namespace, body, resource_id, resource_type, author_id, author_type, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: admin_users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.admin_users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at) FROM stdin;
1	chaitanya_nyros@yahoo.com	$2a$10$hEItys80tKC.MnRdlaIRuekJZ5SL652lno.UlK/vf/sdc4RB02sBu	\N	\N	\N	3	2018-05-11 04:20:59.735793	2018-05-07 04:21:30.819049	127.0.0.1	127.0.0.1	2018-05-04 08:55:39.571919	2018-05-11 04:20:59.73738
3	messagelien@gmail.com	$2a$10$ti3jfZh9lfKOTAoscgBseODX73.NRwSgjj9YESzVG1fxw7LPjiz6S	\N	\N	\N	0	\N	\N	\N	\N	2019-06-13 05:24:14.525414	2019-06-13 05:24:14.525414
4	arslanaly47@gmail.com	$2a$10$eAUOVjDJPdajyJCCudgAbeKUHD9MvftszDPpdkuj91CzndQ5kU20m	\N	\N	\N	0	\N	\N	\N	\N	2019-06-13 05:24:14.609125	2019-06-13 05:24:14.609125
2	nageswararao.nyros@gmail.com	$2a$10$tqtXAqxtrQ9p25QjpaIfou04DQUbiSJfQf6qjjMvyY1H4epZ85Rqy	\N	\N	\N	2	2019-06-17 06:47:13.118384	2019-06-13 04:50:25.046934	203.193.173.118	203.193.173.118	2019-06-13 04:49:42.415387	2019-06-17 06:47:13.119624
\.


--
-- Data for Name: authentications; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.authentications (id, user_id, provider, uid, created_at, updated_at) FROM stdin;
1	5	facebook	962280683949916	2018-05-10 04:58:04.576848	2018-05-10 04:58:04.576848
\.


--
-- Data for Name: badges; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.badges (id, title, description, image_file_name, image_content_type, image_file_size, image_updated_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.comments (id, context, commentable_id, commentable_type, created_at, updated_at, user_id, average_rating, report) FROM stdin;
1	Nice	203	Dish	2018-05-10 05:04:37.317295	2018-05-10 05:04:37.317295	2	\N	\N
\.


--
-- Data for Name: delayed_jobs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.delayed_jobs (id, priority, attempts, handler, last_error, run_at, locked_at, failed_at, locked_by, queue, created_at, updated_at) FROM stdin;
69	0	0	--- !ruby/struct:SendNotificationJob\ntype: restaurant\ntype_id: 489\ntitle: New Dish!\nmessage: New Dish is added to your favorite/followed restaurant\nregistration_ids: []\n	\N	2019-06-13 04:52:50.875219	\N	\N	\N	\N	2019-06-13 04:52:50.875363	2019-06-13 04:52:50.875363
\.


--
-- Data for Name: dish_affections; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dish_affections (id, favouriter_id, dish_id, created_at, updated_at) FROM stdin;
66	3	392	2018-05-17 06:45:54.628429	2018-05-17 06:45:54.628429
\.


--
-- Data for Name: dish_likes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dish_likes (id, user_id, image_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: dishes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dishes (id, restaurant_id, name, price, description, created_at, updated_at, user_rating, image_id, no_of_followers, no_of_dishes, avg_rating) FROM stdin;
204	572	Contonese	0.00	\N	2018-05-09 04:04:11.776892	2018-05-09 05:24:12.290931	\N	\N	\N	\N	\N
206	654	Hot & Sour	0.00	\N	2018-05-09 04:04:11.8457	2018-05-09 05:24:12.34434	\N	\N	\N	\N	\N
208	519	Tom Yam	0.00	\N	2018-05-09 04:04:11.912194	2018-05-09 05:24:12.389717	\N	\N	\N	\N	\N
209	647	Talumen(Prawn/Chicken)	0.00	\N	2018-05-09 04:04:11.959197	2018-05-09 05:24:12.409781	\N	\N	\N	\N	\N
210	515	Sweet Corn Chicken	0.00	\N	2018-05-09 04:04:11.996273	2018-05-09 05:24:12.431847	\N	\N	\N	\N	\N
211	539	Cantonese	0.00	\N	2018-05-09 04:04:12.026696	2018-05-09 05:24:12.452278	\N	\N	\N	\N	\N
212	652	Manchow Chicken	0.00	\N	2018-05-09 04:04:12.055953	2018-05-09 05:24:12.474309	\N	\N	\N	\N	\N
213	572	Dragon Chicken	0.00	\N	2018-05-09 04:04:12.093785	2018-05-09 05:24:12.494354	\N	\N	\N	\N	\N
216	500	Tandoori Chicken Half	0.00	\N	2018-05-09 04:04:12.207631	2018-05-09 05:24:12.536345	\N	\N	\N	\N	\N
217	563	Tandoori Chicken Full	0.00	\N	2018-05-09 04:04:12.238861	2018-05-09 05:24:12.5584	\N	\N	\N	\N	\N
219	529	Tangdi Kabab(1 pcs)	0.00	\N	2018-05-09 04:04:12.304689	2018-05-09 05:24:12.600405	\N	\N	\N	\N	\N
220	521	Tangdi Kabab(4 pcs)	0.00	\N	2018-05-09 04:04:12.336458	2018-05-09 05:24:12.620678	\N	\N	\N	\N	\N
221	633	Kalmi Kabab	0.00	\N	2018-05-09 04:04:12.372318	2018-05-09 05:24:12.640974	\N	\N	\N	\N	\N
222	556	Banjara Kabab	0.00	\N	2018-05-09 04:04:12.408971	2018-05-09 05:24:12.663069	\N	\N	\N	\N	\N
223	575	Tandoori Fish	0.00	\N	2018-05-09 04:04:12.450468	2018-05-09 05:24:12.68344	\N	\N	\N	\N	\N
224	557	Tandoori Tigar Prawn	0.00	\N	2018-05-09 04:04:12.478262	2018-05-09 05:24:12.704966	\N	\N	\N	\N	\N
226	555	Tandoori Badshah	0.00	\N	2018-05-09 04:04:12.554401	2018-05-09 05:24:12.725865	\N	\N	\N	\N	\N
227	648	Chicken Roast(Bones)	0.00	\N	2018-05-09 04:04:12.592129	2018-05-09 05:24:12.747376	\N	\N	\N	\N	\N
228	530	Chicken 555	0.00	\N	2018-05-09 04:04:12.628258	2018-05-09 05:24:12.767739	\N	\N	\N	\N	\N
229	580	Chicken 65	0.00	\N	2018-05-09 04:04:12.656616	2018-05-09 05:24:12.789211	\N	\N	\N	\N	\N
230	589	Spring Roll	0.00	\N	2018-05-09 04:04:12.694561	2018-05-09 05:24:12.80968	\N	\N	\N	\N	\N
231	558	Manchurian	0.00	\N	2018-05-09 04:04:12.732998	2018-05-09 05:24:12.831683	\N	\N	\N	\N	\N
232	651	Polo Vegetables	0.00	\N	2018-05-09 04:04:12.771211	2018-05-09 05:24:12.851777	\N	\N	\N	\N	\N
233	608	Dragon Vegetables	0.00	\N	2018-05-09 04:04:12.807044	2018-05-09 05:24:12.872298	\N	\N	\N	\N	\N
234	651	Crispy Chilly Veg	0.00	\N	2018-05-09 04:04:12.845026	2018-05-09 05:24:12.894225	\N	\N	\N	\N	\N
235	506	Veg Compogi	0.00	\N	2018-05-09 04:04:12.883059	2018-05-09 05:24:12.914593	\N	\N	\N	\N	\N
237	560	Chilly Paneer	0.00	\N	2018-05-09 04:04:12.956743	2018-05-09 05:24:12.936214	\N	\N	\N	\N	\N
238	586	Chilly Baby Corn	0.00	\N	2018-05-09 04:04:12.993372	2018-05-09 05:24:12.948301	\N	\N	\N	\N	\N
239	535	Crispy Baby Corn	0.00	\N	2018-05-09 04:04:13.023483	2018-05-09 05:24:12.961936	\N	\N	\N	\N	\N
240	525	Egg Manchuria	0.00	\N	2018-05-09 04:04:13.060985	2018-05-09 05:24:12.982171	\N	\N	\N	\N	\N
241	570	Chicken Spring Roll	0.00	\N	2018-05-09 04:04:13.08992	2018-05-09 05:24:12.995669	\N	\N	\N	\N	\N
242	615	Chilly Chicken	0.00	\N	2018-05-09 04:04:13.119444	2018-05-09 05:24:13.016272	\N	\N	\N	\N	\N
243	614	Spicy Fried Chicken	0.00	\N	2018-05-09 04:04:13.15614	2018-05-09 05:24:13.037845	\N	\N	\N	\N	\N
244	637	Kung Pao Chicken	0.00	\N	2018-05-09 04:04:13.20821	2018-05-09 05:24:13.058429	\N	\N	\N	\N	\N
245	576	Spicy Fried Chicken	0.00	\N	2018-05-09 04:04:13.239146	2018-05-09 05:24:13.078624	\N	\N	\N	\N	\N
247	532	Chicken Winglets(8 pcs)	0.00	\N	2018-05-09 04:04:13.305139	2018-05-09 05:24:13.100649	\N	\N	\N	\N	\N
248	581	Thai Winglets	0.00	\N	2018-05-09 04:04:13.336129	2018-05-09 05:24:13.120946	\N	\N	\N	\N	\N
249	559	Supreme Chicken	0.00	\N	2018-05-09 04:04:13.37314	2018-05-09 05:24:13.142963	\N	\N	\N	\N	\N
250	618	Malasiyan Chicken	0.00	\N	2018-05-09 04:04:13.408598	2018-05-09 05:24:13.163234	\N	\N	\N	\N	\N
251	524	Santhony Chicken(Bones)	0.00	\N	2018-05-09 04:04:13.439315	2018-05-09 05:24:13.184828	\N	\N	\N	\N	\N
252	611	Thai Fried Chicken	0.00	\N	2018-05-09 04:04:13.474996	2018-05-09 05:24:13.205117	\N	\N	\N	\N	\N
253	585	Spicy Fried Fish	0.00	\N	2018-05-09 04:04:13.51385	2018-05-09 05:24:13.218691	\N	\N	\N	\N	\N
254	625	Roasted Chilly Fish	0.00	\N	2018-05-09 04:04:13.541445	2018-05-09 05:24:13.239324	\N	\N	\N	\N	\N
255	612	Apollo Fish	0.00	\N	2018-05-09 04:04:13.580394	2018-05-09 05:24:13.262604	\N	\N	\N	\N	\N
256	526	Fish Bell Pepper	0.00	\N	2018-05-09 04:04:13.618728	2018-05-09 05:24:13.281186	\N	\N	\N	\N	\N
257	507	Beijing Prawn	0.00	\N	2018-05-09 04:04:13.654475	2018-05-09 05:24:13.301647	\N	\N	\N	\N	\N
259	634	Prawn(Dry Item)	0.00	\N	2018-05-09 04:04:13.720322	2018-05-09 05:24:13.323196	\N	\N	\N	\N	\N
260	489	Tomyam Prawns	0.00	\N	2018-05-09 04:04:13.758519	2018-05-09 05:24:13.344298	\N	\N	\N	\N	\N
261	560	Chinese Platter	0.00	\N	2018-05-09 04:04:13.795736	2018-05-09 05:24:13.365938	\N	\N	\N	\N	\N
262	620	Loose Prawn	0.00	\N	2018-05-09 04:04:13.824697	2018-05-09 05:24:13.3857	\N	\N	\N	\N	\N
263	616	Chef's Special	0.00	\N	2018-05-09 04:04:13.862437	2018-05-09 05:24:13.399452	\N	\N	\N	\N	\N
264	640	Pulka	0.00	\N	2018-05-09 04:04:13.898964	2018-05-09 05:24:13.419639	\N	\N	\N	\N	\N
265	569	Butter Pulka	0.00	\N	2018-05-09 04:04:13.936565	2018-05-09 05:24:13.441634	\N	\N	\N	\N	\N
266	509	Tandoori Roti	0.00	\N	2018-05-09 04:04:13.965631	2018-05-09 05:24:13.462119	\N	\N	\N	\N	\N
268	585	Plain Naan	0.00	\N	2018-05-09 04:04:14.077405	2018-05-09 05:24:13.483588	\N	\N	\N	\N	\N
269	628	Butter Naan	0.00	\N	2018-05-09 04:04:14.11555	2018-05-09 05:24:13.504214	\N	\N	\N	\N	\N
270	652	Aloo Paratha	0.00	\N	2018-05-09 04:04:14.151843	2018-05-09 05:24:13.524533	\N	\N	\N	\N	\N
271	629	Mughalai Naan	0.00	\N	2018-05-09 04:04:14.182268	2018-05-09 05:24:13.546381	\N	\N	\N	\N	\N
272	520	Stuffed Masala Kulcha	0.00	\N	2018-05-09 04:04:14.218598	2018-05-09 05:24:13.566951	\N	\N	\N	\N	\N
273	496	Punjabi Naan	0.00	\N	2018-05-09 04:04:14.25668	2018-05-09 05:24:13.58832	\N	\N	\N	\N	\N
274	597	Garlic Naan	0.00	\N	2018-05-09 04:04:14.293623	2018-05-09 05:24:13.600852	\N	\N	\N	\N	\N
275	547	Paneer Butter Masala	0.00	\N	2018-05-09 04:04:14.321996	2018-05-09 05:24:13.622238	\N	\N	\N	\N	\N
276	634	Mixed Veg Curry	0.00	\N	2018-05-09 04:04:14.361504	2018-05-09 05:24:13.643176	\N	\N	\N	\N	\N
278	619	Veg Makhani	0.00	\N	2018-05-09 04:04:14.444574	2018-05-09 05:24:13.664493	\N	\N	\N	\N	\N
279	509	Gobi Masala(Seasonal)	0.00	\N	2018-05-09 04:04:14.481548	2018-05-09 05:24:13.685011	\N	\N	\N	\N	\N
280	647	Veg Kolhapuri	0.00	\N	2018-05-09 04:04:14.519349	2018-05-09 05:24:13.706869	\N	\N	\N	\N	\N
281	641	Dal Fry	0.00	\N	2018-05-09 04:04:14.547357	2018-05-09 05:24:13.727391	\N	\N	\N	\N	\N
282	648	Lazzidar Veg	0.00	\N	2018-05-09 04:04:14.584202	2018-05-09 05:24:13.748021	\N	\N	\N	\N	\N
283	490	Tomato Cashew Curry	0.00	\N	2018-05-09 04:04:14.622014	2018-05-09 05:24:13.769328	\N	\N	\N	\N	\N
284	606	Malai Kofta	0.00	\N	2018-05-09 04:04:14.660768	2018-05-09 05:24:13.789514	\N	\N	\N	\N	\N
285	519	Panner Pasanda	0.00	\N	2018-05-09 04:04:14.705847	2018-05-09 05:24:13.811698	\N	\N	\N	\N	\N
287	632	Methi Chamana	0.00	\N	2018-05-09 04:04:14.773256	2018-05-09 05:24:13.831716	\N	\N	\N	\N	\N
288	557	Kadai Veg	0.00	\N	2018-05-09 04:04:14.800639	2018-05-09 05:24:13.853613	\N	\N	\N	\N	\N
289	633	Nizami Veg	0.00	\N	2018-05-09 04:04:14.829433	2018-05-09 05:24:13.874608	\N	\N	\N	\N	\N
290	632	Mashroom Curry	0.00	\N	2018-05-09 04:04:14.867877	2018-05-09 05:24:13.895616	\N	\N	\N	\N	\N
291	490	Malai Kofta	0.00	\N	2018-05-09 04:04:14.903884	2018-05-09 05:24:13.908239	\N	\N	\N	\N	\N
292	528	Egg Masala	0.00	\N	2018-05-09 04:04:14.934184	2018-05-09 05:24:13.929553	\N	\N	\N	\N	\N
293	575	Butter Chicken	0.00	\N	2018-05-09 04:04:14.96287	2018-05-09 05:24:13.95282	\N	\N	\N	\N	\N
294	539	Kadai Chicken	0.00	\N	2018-05-09 04:04:14.993214	2018-05-09 05:24:13.978889	\N	\N	\N	\N	\N
296	589	Chicken Mughalai	0.00	\N	2018-05-09 04:04:15.049224	2018-05-09 05:24:14.001625	\N	\N	\N	\N	\N
297	611	Ginger Chicken	0.00	\N	2018-05-09 04:04:15.087922	2018-05-09 05:24:14.021177	\N	\N	\N	\N	\N
298	560	Chicken Maharani	0.00	\N	2018-05-09 04:04:15.116102	2018-05-09 05:24:14.076243	\N	\N	\N	\N	\N
299	579	Chicken Haradaniya	0.00	\N	2018-05-09 04:04:15.155246	2018-05-09 05:24:14.097028	\N	\N	\N	\N	\N
300	644	Murga Afgani	0.00	\N	2018-05-09 04:04:15.193498	2018-05-09 05:24:14.118373	\N	\N	\N	\N	\N
301	561	Kavery Chicken	0.00	\N	2018-05-09 04:04:15.230314	2018-05-09 05:24:14.13849	\N	\N	\N	\N	\N
302	512	Bawarchi Chicken	0.00	\N	2018-05-09 04:04:15.266942	2018-05-09 05:24:14.160561	\N	\N	\N	\N	\N
303	540	Mutton Afthabi	0.00	\N	2018-05-09 04:04:15.294092	2018-05-09 05:24:14.18181	\N	\N	\N	\N	\N
304	651	Mutton Roganjosh	0.00	\N	2018-05-09 04:04:15.332798	2018-05-09 05:24:14.202442	\N	\N	\N	\N	\N
305	629	Prawn Curry	0.00	\N	2018-05-09 04:04:15.369311	2018-05-09 05:24:14.22285	\N	\N	\N	\N	\N
307	516	Crab Curry	0.00	\N	2018-05-09 04:04:15.445313	2018-05-09 05:24:14.243746	\N	\N	\N	\N	\N
308	622	Chicken Curry	0.00	\N	2018-05-09 04:04:15.483172	2018-05-09 05:24:14.270129	\N	\N	\N	\N	\N
309	609	Andhra Tarkari Biryani	0.00	\N	2018-05-09 04:04:15.511569	2018-05-09 05:24:14.290483	\N	\N	\N	\N	\N
310	648	Veg Biryani	0.00	\N	2018-05-09 04:04:15.548465	2018-05-09 05:24:14.311232	\N	\N	\N	\N	\N
311	519	Jeera Rice	0.00	\N	2018-05-09 04:04:15.586671	2018-05-09 05:24:14.334101	\N	\N	\N	\N	\N
312	608	Curd Rice	0.00	\N	2018-05-09 04:04:15.615122	2018-05-09 05:24:14.355197	\N	\N	\N	\N	\N
313	508	Steamed Rice	0.00	\N	2018-05-09 04:04:15.65252	2018-05-09 05:24:14.377793	\N	\N	\N	\N	\N
203	622	Lung Fung	70.00	\N	2018-05-09 04:04:11.713799	2018-05-10 05:04:23.613329	\N	\N	\N	\N	\N
205	504	Baby Corn Garden	0.00	\N	2018-05-09 04:04:11.813849	2018-05-09 05:24:12.316814	\N	\N	\N	\N	\N
202	629	Tomato	0.00	\N	2018-05-09 04:04:11.53245	2018-05-09 05:24:14.39938	\N	\N	\N	\N	\N
215	490	Dingri Kabab(Mushroom)	0.00	\N	2018-05-09 04:04:12.16926	2018-05-09 05:24:14.421786	\N	\N	\N	\N	\N
225	599	Murg Najakath Kabab	0.00	\N	2018-05-09 04:04:12.516998	2018-05-09 05:24:14.443064	\N	\N	\N	\N	\N
236	523	Baby Corn Mushroom(Pepper & Salt)	0.00	\N	2018-05-09 04:04:12.919043	2018-05-09 05:24:14.465242	\N	\N	\N	\N	\N
246	495	Chicken Winglets(4 pcs)	0.00	\N	2018-05-09 04:04:13.276314	2018-05-09 05:24:14.486432	\N	\N	\N	\N	\N
258	637	Spanish Prawn	0.00	\N	2018-05-09 04:04:13.684274	2018-05-09 05:24:14.517111	\N	\N	\N	\N	\N
267	518	Tandoori Paratha	0.00	\N	2018-05-09 04:04:14.04075	2018-05-09 05:24:14.539936	\N	\N	\N	\N	\N
277	497	Palak Paneer	0.00	\N	2018-05-09 04:04:14.406793	2018-05-09 05:24:14.56192	\N	\N	\N	\N	\N
286	638	Panner Chut Put	0.00	\N	2018-05-09 04:04:14.735614	2018-05-09 05:24:14.583336	\N	\N	\N	\N	\N
295	606	Chicken Rajasthani	0.00	\N	2018-05-09 04:04:15.021153	2018-05-09 05:24:14.604594	\N	\N	\N	\N	\N
306	527	Fish Curry	0.00	\N	2018-05-09 04:04:15.40875	2018-05-09 05:24:14.627367	\N	\N	\N	\N	\N
314	540	Egg Biryani	0.00	\N	2018-05-09 04:04:15.681548	2018-05-09 05:24:14.648333	\N	\N	\N	\N	\N
315	503	Chicken Dum Biryani	0.00	\N	2018-05-09 04:04:15.71015	2018-05-09 05:24:14.662901	\N	\N	\N	\N	\N
316	605	Chicken Biryani Frybit	0.00	\N	2018-05-09 04:04:15.740784	2018-05-09 05:24:14.683776	\N	\N	\N	\N	\N
317	647	Chicken Biryani(Boneless)	0.00	\N	2018-05-09 04:04:15.777074	2018-05-09 05:24:14.706157	\N	\N	\N	\N	\N
318	533	Keema Biryani	0.00	\N	2018-05-09 04:04:15.815194	2018-05-09 05:24:14.72915	\N	\N	\N	\N	\N
319	582	Mutton Biryani	0.00	\N	2018-05-09 04:04:15.845635	2018-05-09 05:24:14.750155	\N	\N	\N	\N	\N
320	626	Prawn Biryani	0.00	\N	2018-05-09 04:04:15.883525	2018-05-09 05:24:14.772874	\N	\N	\N	\N	\N
321	652	Chicken Biryani Dum Half	0.00	\N	2018-05-09 04:04:15.91838	2018-05-09 05:24:14.793868	\N	\N	\N	\N	\N
322	538	Chicken Biryani Dum Fry Bit	0.00	\N	2018-05-09 04:04:15.946773	2018-05-09 05:24:14.816153	\N	\N	\N	\N	\N
323	554	Jumbo Biryani Dum	0.00	\N	2018-05-09 04:04:15.985344	2018-05-09 05:24:14.829486	\N	\N	\N	\N	\N
324	566	Jumbo Biryani Fry Bit	0.00	\N	2018-05-09 04:04:16.013404	2018-05-09 05:24:14.851648	\N	\N	\N	\N	\N
325	647	Mixed Biryani	0.00	\N	2018-05-09 04:04:16.04352	2018-05-09 05:24:14.873324	\N	\N	\N	\N	\N
326	654	Chef's Sepcial Biryani	0.00	\N	2018-05-09 04:04:16.088631	2018-05-09 05:24:14.895695	\N	\N	\N	\N	\N
327	560	Mutton Dum Biryani Special	0.00	\N	2018-05-09 04:04:16.128205	2018-05-09 05:24:14.917062	\N	\N	\N	\N	\N
328	556	Veg	0.00	\N	2018-05-09 04:04:16.163178	2018-05-09 05:24:14.939301	\N	\N	\N	\N	\N
329	548	Egg	0.00	\N	2018-05-09 04:04:16.193051	2018-05-09 05:24:14.962047	\N	\N	\N	\N	\N
330	636	Chicken	0.00	\N	2018-05-09 04:04:16.229638	2018-05-09 05:24:14.98322	\N	\N	\N	\N	\N
331	653	Prawn	0.00	\N	2018-05-09 04:04:16.259165	2018-05-09 05:24:15.005381	\N	\N	\N	\N	\N
332	595	Mixed	0.00	\N	2018-05-09 04:04:16.29039	2018-05-09 05:24:15.027515	\N	\N	\N	\N	\N
333	609	Schezuwan Veg	0.00	\N	2018-05-09 04:04:16.318657	2018-05-09 05:24:15.049123	\N	\N	\N	\N	\N
334	626	Schezuwan Egg	0.00	\N	2018-05-09 04:04:16.349431	2018-05-09 05:24:15.070607	\N	\N	\N	\N	\N
336	632	Schezuwan Mixed	0.00	\N	2018-05-09 04:04:16.422197	2018-05-09 05:24:15.114314	\N	\N	\N	\N	\N
337	567	Yancho Veg	0.00	\N	2018-05-09 04:04:16.452093	2018-05-09 05:24:15.136728	\N	\N	\N	\N	\N
338	625	Yancho Chicken	0.00	\N	2018-05-09 04:04:16.480581	2018-05-09 05:24:15.159621	\N	\N	\N	\N	\N
339	543	Special Veg	0.00	\N	2018-05-09 04:04:16.51853	2018-05-09 05:24:15.180307	\N	\N	\N	\N	\N
340	518	Special Chicken	0.00	\N	2018-05-09 04:04:16.555905	2018-05-09 05:24:15.197917	\N	\N	\N	\N	\N
341	531	Special Prawn	0.00	\N	2018-05-09 04:04:16.584917	2018-05-09 05:24:15.215939	\N	\N	\N	\N	\N
342	597	Special Mutton	0.00	\N	2018-05-09 04:04:16.613473	2018-05-09 05:24:15.239455	\N	\N	\N	\N	\N
343	609	Veg	0.00	\N	2018-05-09 04:04:16.650159	2018-05-09 05:24:15.260205	\N	\N	\N	\N	\N
344	522	Egg	0.00	\N	2018-05-09 04:04:16.680207	2018-05-09 05:24:15.282166	\N	\N	\N	\N	\N
345	540	Chicken	0.00	\N	2018-05-09 04:04:16.708929	2018-05-09 05:24:15.303475	\N	\N	\N	\N	\N
346	582	Mixed	0.00	\N	2018-05-09 04:04:16.739602	2018-05-09 05:24:15.325663	\N	\N	\N	\N	\N
347	629	Hakka(Veg)	0.00	\N	2018-05-09 04:04:16.766648	2018-05-09 05:24:15.339495	\N	\N	\N	\N	\N
348	654	Hakka(Non Veg)	0.00	\N	2018-05-09 04:04:16.797055	2018-05-09 05:24:15.361354	\N	\N	\N	\N	\N
349	637	American Chopsuey(Veg)	0.00	\N	2018-05-09 04:04:16.825772	2018-05-09 05:24:15.383737	\N	\N	\N	\N	\N
350	561	American Chopsuey(Non Veg)	0.00	\N	2018-05-09 04:04:16.855954	2018-05-09 05:24:15.405297	\N	\N	\N	\N	\N
351	622	Veg Chowmin	0.00	\N	2018-05-09 04:04:16.90008	2018-05-09 05:24:15.427919	\N	\N	\N	\N	\N
352	558	Mixed Chowmin	0.00	\N	2018-05-09 04:04:16.928751	2018-05-09 05:24:15.448771	\N	\N	\N	\N	\N
353	538	Special Chowmin	0.00	\N	2018-05-09 04:04:16.959191	2018-05-09 05:24:15.471524	\N	\N	\N	\N	\N
354	651	Chowmin(Non-Veg)	0.00	\N	2018-05-09 04:04:16.988173	2018-05-09 05:24:15.492629	\N	\N	\N	\N	\N
355	513	Veg Hot Garlic Sauce	0.00	\N	2018-05-09 04:04:17.016699	2018-05-09 05:24:15.515152	\N	\N	\N	\N	\N
356	592	Chilli Chicken	0.00	\N	2018-05-09 04:04:17.04579	2018-05-09 05:24:15.53636	\N	\N	\N	\N	\N
357	622	Chicken Hot Garlic Sauce	0.00	\N	2018-05-09 04:04:17.082331	2018-05-09 05:24:15.558986	\N	\N	\N	\N	\N
358	635	Diced Chicken with Cashew Nut	0.00	\N	2018-05-09 04:04:17.120366	2018-05-09 05:24:15.580272	\N	\N	\N	\N	\N
359	523	Chicken Pepper Sauce	0.00	\N	2018-05-09 04:04:17.158141	2018-05-09 05:24:15.611011	\N	\N	\N	\N	\N
360	619	Half Veg Fried Rice	0.00	\N	2018-05-09 04:04:17.196049	2018-05-09 05:24:15.633275	\N	\N	\N	\N	\N
361	561	Half Egg Fried Rice	0.00	\N	2018-05-09 04:04:17.224304	2018-05-09 05:24:15.654442	\N	\N	\N	\N	\N
362	508	Half Chicken Fried Rice	0.00	\N	2018-05-09 04:04:17.252393	2018-05-09 05:24:15.677331	\N	\N	\N	\N	\N
363	634	Half Prawns Fried Rice	0.00	\N	2018-05-09 04:04:17.282442	2018-05-09 05:24:15.698187	\N	\N	\N	\N	\N
364	530	Half Veg Noodles	0.00	\N	2018-05-09 04:04:17.31148	2018-05-09 05:24:15.712543	\N	\N	\N	\N	\N
365	584	Half Egg Noodles	0.00	\N	2018-05-09 04:04:17.349546	2018-05-09 05:24:15.733951	\N	\N	\N	\N	\N
366	649	Half Chicken Noodles	0.00	\N	2018-05-09 04:04:17.395245	2018-05-09 05:24:15.756344	\N	\N	\N	\N	\N
367	646	Soft Drink	0.00	\N	2018-05-09 04:04:17.441185	2018-05-09 05:24:15.777773	\N	\N	\N	\N	\N
368	606	Packaged Drinking Water	0.00	\N	2018-05-09 04:04:17.470099	2018-05-09 05:24:15.799748	\N	\N	\N	\N	\N
369	559	Fresh Lime Soda	0.00	\N	2018-05-09 04:04:17.497557	2018-05-09 05:24:15.822834	\N	\N	\N	\N	\N
370	622	Lassi	0.00	\N	2018-05-09 04:04:17.527935	2018-05-09 05:24:15.843984	\N	\N	\N	\N	\N
371	643	Butter Milk	0.00	\N	2018-05-09 04:04:17.556742	2018-05-09 05:24:15.866166	\N	\N	\N	\N	\N
372	541	Fresh Fruit Juice	0.00	\N	2018-05-09 04:04:17.585914	2018-05-09 05:24:15.879497	\N	\N	\N	\N	\N
373	531	Fruit Salad	0.00	\N	2018-05-09 04:04:17.61411	2018-05-09 05:24:15.901552	\N	\N	\N	\N	\N
374	559	Fruit Salad with Ice Cream	0.00	\N	2018-05-09 04:04:17.644073	2018-05-09 05:24:15.923579	\N	\N	\N	\N	\N
375	493	Vanilla(Single Scoop)	0.00	\N	2018-05-09 04:04:17.664721	2018-05-09 05:24:15.945861	\N	\N	\N	\N	\N
376	582	Vanilla(Double Scoop)	0.00	\N	2018-05-09 04:04:17.693174	2018-05-09 05:24:15.966498	\N	\N	\N	\N	\N
377	500	Butterscotch(Single Scoop)	0.00	\N	2018-05-09 04:04:17.722971	2018-05-09 05:24:15.989428	\N	\N	\N	\N	\N
378	598	Butterscotch(Double Scoop)	0.00	\N	2018-05-09 04:04:17.751571	2018-05-09 05:24:16.01072	\N	\N	\N	\N	\N
379	567	Strawberry(Double Scoop)	0.00	\N	2018-05-09 04:04:17.781645	2018-05-09 05:24:16.032893	\N	\N	\N	\N	\N
380	571	Chocolate(Double Scoop)	0.00	\N	2018-05-09 04:04:17.810074	2018-05-09 05:24:16.0557	\N	\N	\N	\N	\N
381	632	Fruit Over Load	0.00	\N	2018-05-09 04:04:17.841733	2018-05-09 05:24:16.076651	\N	\N	\N	\N	\N
382	610	Haveli Special Ice Cream	0.00	\N	2018-05-09 04:04:17.868212	2018-05-09 05:24:16.099064	\N	\N	\N	\N	\N
383	629	Milk Shake	0.00	\N	2018-05-09 04:04:17.89624	2018-05-09 05:24:16.112539	\N	\N	\N	\N	\N
384	651	Milk Shake with Ice Cream	0.00	\N	2018-05-09 04:04:17.926131	2018-05-09 05:24:16.134388	\N	\N	\N	\N	\N
385	557	White Rice	0.00	\N	2018-05-09 04:04:17.95547	2018-05-09 05:24:16.155712	\N	\N	\N	\N	\N
386	653	Sambar	0.00	\N	2018-05-09 04:04:17.985764	2018-05-09 05:24:16.180213	\N	\N	\N	\N	\N
387	526	Chicken Curry(100 Gms)	0.00	\N	2018-05-09 04:04:18.013184	2018-05-09 05:24:16.201096	\N	\N	\N	\N	\N
388	596	Chicken Fry(100 Gms)	0.00	\N	2018-05-09 04:04:18.042814	2018-05-09 05:24:16.224033	\N	\N	\N	\N	\N
389	498	Fish Curry(2 Pcs)	0.00	\N	2018-05-09 04:04:18.071841	2018-05-09 05:24:16.246639	\N	\N	\N	\N	\N
390	497	Fish Curry(1 Pcs)	0.00	\N	2018-05-09 04:04:18.091964	2018-05-09 05:24:16.267474	\N	\N	\N	\N	\N
391	529	Fish Fry(2 Pcs)	0.00	\N	2018-05-09 04:04:18.123923	2018-05-09 05:24:16.290058	\N	\N	\N	\N	\N
392	619	Fish Fry(1 Pcs)	0.00	\N	2018-05-09 04:04:18.150271	2018-05-09 05:24:16.311234	\N	\N	\N	\N	\N
434	489	Dhum Biryani	500.00	Hyderabad Biryani	2019-06-13 04:52:50.833951	2019-06-13 04:52:50.833951	\N	\N	\N	\N	\N
207	504	Sweet Corn	0.00	\N	2018-05-09 04:04:11.883044	2018-05-09 05:24:12.36929	\N	\N	\N	\N	\N
\.


--
-- Data for Name: dishes_users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dishes_users (id, user_id, dish_id, created_at, updated_at, reposted) FROM stdin;
241	11	204	2018-05-17 06:30:57.264508	2018-05-17 06:30:57.264508	f
242	11	206	2018-05-17 06:30:57.28622	2018-05-17 06:30:57.28622	f
243	11	207	2018-05-17 06:30:57.378035	2018-05-17 06:30:57.378035	f
244	11	208	2018-05-17 06:30:57.435694	2018-05-17 06:30:57.435694	f
245	11	209	2018-05-17 06:30:57.459763	2018-05-17 06:30:57.459763	f
246	11	210	2018-05-17 06:30:57.543286	2018-05-17 06:30:57.543286	f
247	11	211	2018-05-17 06:30:57.602881	2018-05-17 06:30:57.602881	f
248	11	212	2018-05-17 06:30:57.62634	2018-05-17 06:30:57.62634	f
249	11	213	2018-05-17 06:30:57.651143	2018-05-17 06:30:57.651143	f
250	11	216	2018-05-17 06:30:57.701201	2018-05-17 06:30:57.701201	f
251	11	217	2018-05-17 06:30:57.743198	2018-05-17 06:30:57.743198	f
252	11	219	2018-05-17 06:30:57.766401	2018-05-17 06:30:57.766401	f
253	11	220	2018-05-17 06:30:57.791387	2018-05-17 06:30:57.791387	f
254	11	221	2018-05-17 06:30:57.816929	2018-05-17 06:30:57.816929	f
255	11	222	2018-05-17 06:30:57.841803	2018-05-17 06:30:57.841803	f
256	11	223	2018-05-17 06:30:57.899536	2018-05-17 06:30:57.899536	f
257	11	224	2018-05-17 06:30:57.958964	2018-05-17 06:30:57.958964	f
258	11	226	2018-05-17 06:30:58.024991	2018-05-17 06:30:58.024991	f
259	11	227	2018-05-17 06:30:58.049235	2018-05-17 06:30:58.049235	f
260	11	228	2018-05-17 06:30:58.141305	2018-05-17 06:30:58.141305	f
261	11	229	2018-05-17 06:30:58.199227	2018-05-17 06:30:58.199227	f
262	11	230	2018-05-17 06:30:58.290671	2018-05-17 06:30:58.290671	f
263	11	231	2018-05-17 06:30:58.350635	2018-05-17 06:30:58.350635	f
264	11	232	2018-05-17 06:30:58.407797	2018-05-17 06:30:58.407797	f
265	11	233	2018-05-17 06:30:58.515005	2018-05-17 06:30:58.515005	f
266	11	234	2018-05-17 06:30:58.539286	2018-05-17 06:30:58.539286	f
267	11	235	2018-05-17 06:30:58.56494	2018-05-17 06:30:58.56494	f
268	11	237	2018-05-17 06:30:58.58927	2018-05-17 06:30:58.58927	f
269	11	238	2018-05-17 06:30:58.614344	2018-05-17 06:30:58.614344	f
270	11	239	2018-05-17 06:30:58.639356	2018-05-17 06:30:58.639356	f
271	11	240	2018-05-17 06:30:58.664808	2018-05-17 06:30:58.664808	f
272	11	241	2018-05-17 06:30:58.688146	2018-05-17 06:30:58.688146	f
273	11	242	2018-05-17 06:30:58.713249	2018-05-17 06:30:58.713249	f
274	11	243	2018-05-17 06:30:58.738333	2018-05-17 06:30:58.738333	f
275	11	244	2018-05-17 06:30:58.763138	2018-05-17 06:30:58.763138	f
276	11	245	2018-05-17 06:30:58.789525	2018-05-17 06:30:58.789525	f
277	11	247	2018-05-17 06:30:58.815103	2018-05-17 06:30:58.815103	f
278	11	248	2018-05-17 06:30:58.84011	2018-05-17 06:30:58.84011	f
279	11	249	2018-05-17 06:30:58.863646	2018-05-17 06:30:58.863646	f
280	11	250	2018-05-17 06:30:58.889024	2018-05-17 06:30:58.889024	f
281	11	251	2018-05-17 06:30:58.913672	2018-05-17 06:30:58.913672	f
282	11	252	2018-05-17 06:30:58.938595	2018-05-17 06:30:58.938595	f
283	11	253	2018-05-17 06:30:58.963934	2018-05-17 06:30:58.963934	f
284	11	254	2018-05-17 06:30:59.034655	2018-05-17 06:30:59.034655	f
285	11	255	2018-05-17 06:30:59.075357	2018-05-17 06:30:59.075357	f
286	11	256	2018-05-17 06:30:59.1003	2018-05-17 06:30:59.1003	f
287	11	257	2018-05-17 06:30:59.125573	2018-05-17 06:30:59.125573	f
288	11	259	2018-05-17 06:30:59.150576	2018-05-17 06:30:59.150576	f
289	11	260	2018-05-17 06:30:59.174149	2018-05-17 06:30:59.174149	f
290	11	261	2018-05-17 06:30:59.199393	2018-05-17 06:30:59.199393	f
291	11	262	2018-05-17 06:30:59.224471	2018-05-17 06:30:59.224471	f
292	11	263	2018-05-17 06:30:59.249607	2018-05-17 06:30:59.249607	f
293	11	264	2018-05-17 06:30:59.307879	2018-05-17 06:30:59.307879	f
294	11	265	2018-05-17 06:30:59.332879	2018-05-17 06:30:59.332879	f
295	11	266	2018-05-17 06:30:59.35749	2018-05-17 06:30:59.35749	f
296	11	268	2018-05-17 06:30:59.423295	2018-05-17 06:30:59.423295	f
297	11	269	2018-05-17 06:30:59.473937	2018-05-17 06:30:59.473937	f
298	11	270	2018-05-17 06:30:59.540251	2018-05-17 06:30:59.540251	f
299	11	271	2018-05-17 06:30:59.564908	2018-05-17 06:30:59.564908	f
300	11	272	2018-05-17 06:30:59.590797	2018-05-17 06:30:59.590797	f
301	11	273	2018-05-17 06:30:59.651776	2018-05-17 06:30:59.651776	f
302	11	274	2018-05-17 06:30:59.707604	2018-05-17 06:30:59.707604	f
303	11	275	2018-05-17 06:30:59.797273	2018-05-17 06:30:59.797273	f
304	11	276	2018-05-17 06:30:59.822193	2018-05-17 06:30:59.822193	f
305	11	278	2018-05-17 06:30:59.849224	2018-05-17 06:30:59.849224	f
306	11	279	2018-05-17 06:30:59.872561	2018-05-17 06:30:59.872561	f
307	11	280	2018-05-17 06:30:59.897597	2018-05-17 06:30:59.897597	f
308	11	281	2018-05-17 06:30:59.922173	2018-05-17 06:30:59.922173	f
309	11	282	2018-05-17 06:30:59.94766	2018-05-17 06:30:59.94766	f
310	11	283	2018-05-17 06:31:00.003916	2018-05-17 06:31:00.003916	f
311	11	284	2018-05-17 06:31:00.095906	2018-05-17 06:31:00.095906	f
312	11	285	2018-05-17 06:31:00.120783	2018-05-17 06:31:00.120783	f
313	11	287	2018-05-17 06:31:00.179332	2018-05-17 06:31:00.179332	f
314	11	288	2018-05-17 06:31:00.20523	2018-05-17 06:31:00.20523	f
315	11	289	2018-05-17 06:31:00.26251	2018-05-17 06:31:00.26251	f
316	11	290	2018-05-17 06:31:00.286611	2018-05-17 06:31:00.286611	f
317	11	291	2018-05-17 06:31:00.344888	2018-05-17 06:31:00.344888	f
318	11	292	2018-05-17 06:31:00.436671	2018-05-17 06:31:00.436671	f
319	11	293	2018-05-17 06:31:00.495087	2018-05-17 06:31:00.495087	f
320	11	294	2018-05-17 06:31:00.587403	2018-05-17 06:31:00.587403	f
321	11	296	2018-05-17 06:31:00.644443	2018-05-17 06:31:00.644443	f
322	11	297	2018-05-17 06:31:00.703414	2018-05-17 06:31:00.703414	f
323	11	298	2018-05-17 06:31:00.786451	2018-05-17 06:31:00.786451	f
324	11	299	2018-05-17 06:31:00.868778	2018-05-17 06:31:00.868778	f
325	11	300	2018-05-17 06:31:00.926725	2018-05-17 06:31:00.926725	f
326	11	301	2018-05-17 06:31:00.952082	2018-05-17 06:31:00.952082	f
327	11	302	2018-05-17 06:31:01.00182	2018-05-17 06:31:01.00182	f
328	11	303	2018-05-17 06:31:01.026693	2018-05-17 06:31:01.026693	f
329	11	304	2018-05-17 06:31:01.084995	2018-05-17 06:31:01.084995	f
330	11	305	2018-05-17 06:31:01.10868	2018-05-17 06:31:01.10868	f
331	11	307	2018-05-17 06:31:01.13436	2018-05-17 06:31:01.13436	f
332	11	308	2018-05-17 06:31:01.161507	2018-05-17 06:31:01.161507	f
333	11	309	2018-05-17 06:31:01.187101	2018-05-17 06:31:01.187101	f
334	11	310	2018-05-17 06:31:01.213842	2018-05-17 06:31:01.213842	f
335	11	311	2018-05-17 06:31:01.239405	2018-05-17 06:31:01.239405	f
336	11	312	2018-05-17 06:31:01.265596	2018-05-17 06:31:01.265596	f
337	11	313	2018-05-17 06:31:01.325369	2018-05-17 06:31:01.325369	f
338	11	203	2018-05-17 06:31:01.384172	2018-05-17 06:31:01.384172	f
339	11	205	2018-05-17 06:31:01.410256	2018-05-17 06:31:01.410256	f
340	11	202	2018-05-17 06:31:01.436522	2018-05-17 06:31:01.436522	f
341	11	215	2018-05-17 06:31:01.46228	2018-05-17 06:31:01.46228	f
342	11	225	2018-05-17 06:31:01.488232	2018-05-17 06:31:01.488232	f
343	11	236	2018-05-17 06:31:01.51541	2018-05-17 06:31:01.51541	f
344	11	246	2018-05-17 06:31:01.540505	2018-05-17 06:31:01.540505	f
345	11	258	2018-05-17 06:31:01.566632	2018-05-17 06:31:01.566632	f
346	11	267	2018-05-17 06:31:01.592579	2018-05-17 06:31:01.592579	f
347	11	277	2018-05-17 06:31:01.618616	2018-05-17 06:31:01.618616	f
348	11	286	2018-05-17 06:31:01.64482	2018-05-17 06:31:01.64482	f
349	11	295	2018-05-17 06:31:01.670686	2018-05-17 06:31:01.670686	f
350	11	306	2018-05-17 06:31:01.696768	2018-05-17 06:31:01.696768	f
351	11	314	2018-05-17 06:31:01.723113	2018-05-17 06:31:01.723113	f
352	11	315	2018-05-17 06:31:01.748833	2018-05-17 06:31:01.748833	f
353	11	316	2018-05-17 06:31:01.775357	2018-05-17 06:31:01.775357	f
354	11	317	2018-05-17 06:31:01.800732	2018-05-17 06:31:01.800732	f
355	11	318	2018-05-17 06:31:01.828132	2018-05-17 06:31:01.828132	f
356	11	319	2018-05-17 06:31:01.851871	2018-05-17 06:31:01.851871	f
357	11	320	2018-05-17 06:31:01.886183	2018-05-17 06:31:01.886183	f
358	11	321	2018-05-17 06:31:01.912571	2018-05-17 06:31:01.912571	f
359	11	322	2018-05-17 06:31:01.937898	2018-05-17 06:31:01.937898	f
360	11	323	2018-05-17 06:31:01.963904	2018-05-17 06:31:01.963904	f
361	11	324	2018-05-17 06:31:01.990479	2018-05-17 06:31:01.990479	f
362	11	325	2018-05-17 06:31:02.016429	2018-05-17 06:31:02.016429	f
363	11	326	2018-05-17 06:31:02.042698	2018-05-17 06:31:02.042698	f
364	11	327	2018-05-17 06:31:02.06819	2018-05-17 06:31:02.06819	f
365	11	328	2018-05-17 06:31:02.128381	2018-05-17 06:31:02.128381	f
366	11	329	2018-05-17 06:31:02.187195	2018-05-17 06:31:02.187195	f
367	11	330	2018-05-17 06:31:02.214422	2018-05-17 06:31:02.214422	f
368	11	331	2018-05-17 06:31:02.239419	2018-05-17 06:31:02.239419	f
369	11	332	2018-05-17 06:31:02.265104	2018-05-17 06:31:02.265104	f
370	11	333	2018-05-17 06:31:02.291815	2018-05-17 06:31:02.291815	f
371	11	334	2018-05-17 06:31:02.317464	2018-05-17 06:31:02.317464	f
372	11	335	2018-05-17 06:31:02.343256	2018-05-17 06:31:02.343256	f
373	11	336	2018-05-17 06:31:02.369614	2018-05-17 06:31:02.369614	f
374	11	337	2018-05-17 06:31:02.395351	2018-05-17 06:31:02.395351	f
375	11	338	2018-05-17 06:31:02.421939	2018-05-17 06:31:02.421939	f
376	11	339	2018-05-17 06:31:02.447341	2018-05-17 06:31:02.447341	f
377	11	340	2018-05-17 06:31:02.4741	2018-05-17 06:31:02.4741	f
378	11	341	2018-05-17 06:31:02.499468	2018-05-17 06:31:02.499468	f
379	11	342	2018-05-17 06:31:02.526134	2018-05-17 06:31:02.526134	f
380	11	343	2018-05-17 06:31:02.55157	2018-05-17 06:31:02.55157	f
381	11	344	2018-05-17 06:31:02.577564	2018-05-17 06:31:02.577564	f
382	11	345	2018-05-17 06:31:02.604052	2018-05-17 06:31:02.604052	f
383	11	346	2018-05-17 06:31:02.630106	2018-05-17 06:31:02.630106	f
384	11	347	2018-05-17 06:31:02.655815	2018-05-17 06:31:02.655815	f
385	11	348	2018-05-17 06:31:02.681838	2018-05-17 06:31:02.681838	f
386	11	349	2018-05-17 06:31:02.708295	2018-05-17 06:31:02.708295	f
387	11	350	2018-05-17 06:31:02.736153	2018-05-17 06:31:02.736153	f
388	11	351	2018-05-17 06:31:02.836475	2018-05-17 06:31:02.836475	f
389	11	352	2018-05-17 06:31:02.929386	2018-05-17 06:31:02.929386	f
390	11	353	2018-05-17 06:31:02.989291	2018-05-17 06:31:02.989291	f
391	11	354	2018-05-17 06:31:03.081169	2018-05-17 06:31:03.081169	f
392	11	355	2018-05-17 06:31:03.172963	2018-05-17 06:31:03.172963	f
393	11	356	2018-05-17 06:31:03.207595	2018-05-17 06:31:03.207595	f
394	11	357	2018-05-17 06:31:03.308253	2018-05-17 06:31:03.308253	f
395	11	358	2018-05-17 06:31:03.334248	2018-05-17 06:31:03.334248	f
396	11	359	2018-05-17 06:31:03.393798	2018-05-17 06:31:03.393798	f
397	11	360	2018-05-17 06:31:03.452992	2018-05-17 06:31:03.452992	f
398	11	361	2018-05-17 06:31:03.512354	2018-05-17 06:31:03.512354	f
399	11	362	2018-05-17 06:31:03.60491	2018-05-17 06:31:03.60491	f
400	11	363	2018-05-17 06:31:03.665226	2018-05-17 06:31:03.665226	f
401	11	364	2018-05-17 06:31:03.724409	2018-05-17 06:31:03.724409	f
402	11	365	2018-05-17 06:31:03.782522	2018-05-17 06:31:03.782522	f
403	11	366	2018-05-17 06:31:03.809085	2018-05-17 06:31:03.809085	f
404	11	367	2018-05-17 06:31:03.893926	2018-05-17 06:31:03.893926	f
405	11	368	2018-05-17 06:31:03.969811	2018-05-17 06:31:03.969811	f
406	11	369	2018-05-17 06:31:04.045368	2018-05-17 06:31:04.045368	f
407	11	370	2018-05-17 06:31:04.105181	2018-05-17 06:31:04.105181	f
408	11	371	2018-05-17 06:31:04.130958	2018-05-17 06:31:04.130958	f
409	11	372	2018-05-17 06:31:04.181852	2018-05-17 06:31:04.181852	f
410	11	373	2018-05-17 06:31:04.291309	2018-05-17 06:31:04.291309	f
411	11	374	2018-05-17 06:31:04.392633	2018-05-17 06:31:04.392633	f
412	11	375	2018-05-17 06:31:04.451707	2018-05-17 06:31:04.451707	f
413	11	376	2018-05-17 06:31:04.511494	2018-05-17 06:31:04.511494	f
414	11	377	2018-05-17 06:31:04.570654	2018-05-17 06:31:04.570654	f
415	11	378	2018-05-17 06:31:04.59686	2018-05-17 06:31:04.59686	f
416	11	379	2018-05-17 06:31:04.622163	2018-05-17 06:31:04.622163	f
417	11	380	2018-05-17 06:31:04.647977	2018-05-17 06:31:04.647977	f
418	11	381	2018-05-17 06:31:04.673523	2018-05-17 06:31:04.673523	f
419	11	382	2018-05-17 06:31:04.742346	2018-05-17 06:31:04.742346	f
420	11	383	2018-05-17 06:31:04.852307	2018-05-17 06:31:04.852307	f
421	11	384	2018-05-17 06:31:04.977137	2018-05-17 06:31:04.977137	f
422	11	385	2018-05-17 06:31:05.069519	2018-05-17 06:31:05.069519	f
423	11	386	2018-05-17 06:31:05.095574	2018-05-17 06:31:05.095574	f
424	11	387	2018-05-17 06:31:05.147238	2018-05-17 06:31:05.147238	f
425	11	388	2018-05-17 06:31:05.189717	2018-05-17 06:31:05.189717	f
426	11	389	2018-05-17 06:31:05.231978	2018-05-17 06:31:05.231978	f
427	11	390	2018-05-17 06:31:05.283514	2018-05-17 06:31:05.283514	f
428	11	391	2018-05-17 06:31:05.333106	2018-05-17 06:31:05.333106	f
429	11	392	2018-05-17 06:31:05.392143	2018-05-17 06:31:05.392143	f
\.


--
-- Data for Name: images; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.images (id, image_file_name, image_content_type, image_file_size, image_updated_at, attachable_id, attachable_type, created_at, updated_at, user_id, image_processing, local_image_file_name, local_image_content_type, local_image_file_size, local_image_updated_at) FROM stdin;
859	1525842813	image/jpeg	89693	2018-05-09 05:13:33.636464	489	Restaurant	2018-05-09 05:13:33.841467	2018-05-17 07:01:31.891665	11	f	\N	\N	\N	\N
860	1525842816	image/jpeg	80022	2018-05-09 05:13:36.016375	490	Restaurant	2018-05-09 05:13:36.18941	2018-05-17 07:01:31.923523	11	f	\N	\N	\N	\N
861	1525842818	image/jpeg	269702	2018-05-09 05:13:38.514289	491	Restaurant	2018-05-09 05:13:38.74426	2018-05-17 07:01:31.935427	11	f	\N	\N	\N	\N
862	1525842821	image/jpeg	105438	2018-05-09 05:13:40.937844	492	Restaurant	2018-05-09 05:13:41.141722	2018-05-17 07:01:31.948658	11	f	\N	\N	\N	\N
863	1525842824	image/jpeg	141524	2018-05-09 05:13:43.85881	494	Restaurant	2018-05-09 05:13:44.063677	2018-05-17 07:01:31.983641	11	f	\N	\N	\N	\N
864	1525842827	image/jpeg	125380	2018-05-09 05:13:46.924586	495	Restaurant	2018-05-09 05:13:47.119402	2018-05-17 07:01:31.998427	11	f	\N	\N	\N	\N
865	1525842829	image/jpeg	101695	2018-05-09 05:13:49.484906	496	Restaurant	2018-05-09 05:13:49.716209	2018-05-17 07:01:32.010707	11	f	\N	\N	\N	\N
866	1525842832	image/jpeg	129996	2018-05-09 05:13:52.168762	497	Restaurant	2018-05-09 05:13:52.586638	2018-05-17 07:01:32.03101	11	f	\N	\N	\N	\N
868	1525842838	image/jpeg	106067	2018-05-09 05:13:57.9494	499	Restaurant	2018-05-09 05:13:58.124062	2018-05-17 07:01:32.071902	11	f	\N	\N	\N	\N
869	1525842840	image/jpeg	174175	2018-05-09 05:14:00.452731	500	Restaurant	2018-05-09 05:14:00.712444	2018-05-17 07:01:32.085006	11	f	\N	\N	\N	\N
870	1525842842	image/jpeg	48620	2018-05-09 05:14:02.807945	501	Restaurant	2018-05-09 05:14:02.953473	2018-05-17 07:01:32.097103	11	f	\N	\N	\N	\N
871	1525842845	image/jpeg	52759	2018-05-09 05:14:04.920257	502	Restaurant	2018-05-09 05:14:05.10147	2018-05-17 07:01:32.110535	11	f	\N	\N	\N	\N
872	1525842847	image/jpeg	59036	2018-05-09 05:14:06.989296	503	Restaurant	2018-05-09 05:14:07.181627	2018-05-17 07:01:32.12206	11	f	\N	\N	\N	\N
873	1525842849	image/jpeg	99365	2018-05-09 05:14:08.930386	504	Restaurant	2018-05-09 05:14:09.123325	2018-05-17 07:01:32.134133	11	f	\N	\N	\N	\N
874	1525842851	image/jpeg	139675	2018-05-09 05:14:11.106804	505	Restaurant	2018-05-09 05:14:11.326909	2018-05-17 07:01:32.147378	11	f	\N	\N	\N	\N
875	1525842853	image/jpeg	108811	2018-05-09 05:14:13.344482	506	Restaurant	2018-05-09 05:14:13.524411	2018-05-17 07:01:32.158983	11	f	\N	\N	\N	\N
876	1525842855	image/jpeg	54536	2018-05-09 05:14:15.482593	507	Restaurant	2018-05-09 05:14:15.663767	2018-05-17 07:01:32.1722	11	f	\N	\N	\N	\N
877	1525842858	image/jpeg	139959	2018-05-09 05:14:18.501497	509	Restaurant	2018-05-09 05:14:18.693936	2018-05-17 07:01:32.184573	11	f	\N	\N	\N	\N
878	1525842861	image/jpeg	133737	2018-05-09 05:14:21.068439	511	Restaurant	2018-05-09 05:14:21.23294	2018-05-17 07:01:32.197536	11	f	\N	\N	\N	\N
879	1525842864	image/jpeg	82676	2018-05-09 05:14:24.616301	514	Restaurant	2018-05-09 05:14:24.796035	2018-05-17 07:01:32.209432	11	f	\N	\N	\N	\N
880	1525842867	image/jpeg	117354	2018-05-09 05:14:27.087905	515	Restaurant	2018-05-09 05:14:27.276584	2018-05-17 07:01:32.221312	11	f	\N	\N	\N	\N
882	1525842871	image/jpeg	53097	2018-05-09 05:14:31.09683	517	Restaurant	2018-05-09 05:14:31.356125	2018-05-17 07:01:32.246072	11	f	\N	\N	\N	\N
883	1525842873	image/jpeg	193460	2018-05-09 05:14:33.308194	518	Restaurant	2018-05-09 05:14:33.545453	2018-05-17 07:01:32.259786	11	f	\N	\N	\N	\N
884	1525842875	image/jpeg	139460	2018-05-09 05:14:35.681405	519	Restaurant	2018-05-09 05:14:35.859594	2018-05-17 07:01:32.2714	11	f	\N	\N	\N	\N
885	1525842877	image/jpeg	119804	2018-05-09 05:14:37.542627	520	Restaurant	2018-05-09 05:14:37.790681	2018-05-17 07:01:32.284605	11	f	\N	\N	\N	\N
886	1525842880	image/jpeg	75408	2018-05-09 05:14:40.46544	522	Restaurant	2018-05-09 05:14:40.66267	2018-05-17 07:01:32.2962	11	f	\N	\N	\N	\N
887	1525842882	image/jpeg	182987	2018-05-09 05:14:42.805534	523	Restaurant	2018-05-09 05:14:43.001956	2018-05-17 07:01:32.308267	11	f	\N	\N	\N	\N
888	1525842885	image/jpeg	129265	2018-05-09 05:14:44.798665	524	Restaurant	2018-05-09 05:14:45.025443	2018-05-17 07:01:32.321273	11	f	\N	\N	\N	\N
889	1525842887	image/jpeg	273703	2018-05-09 05:14:47.177061	525	Restaurant	2018-05-09 05:14:47.439444	2018-05-17 07:01:32.33337	11	f	\N	\N	\N	\N
890	1525842889	image/jpeg	130938	2018-05-09 05:14:49.413749	526	Restaurant	2018-05-09 05:14:49.594543	2018-05-17 07:01:32.346332	11	f	\N	\N	\N	\N
891	1525842892	image/jpeg	93737	2018-05-09 05:14:52.794803	527	Restaurant	2018-05-09 05:14:52.966607	2018-05-17 07:01:32.358135	11	f	\N	\N	\N	\N
892	1525842896	image/jpeg	80583	2018-05-09 05:14:56.41993	528	Restaurant	2018-05-09 05:14:56.637761	2018-05-17 07:01:32.371224	11	f	\N	\N	\N	\N
893	1525842898	image/jpeg	181348	2018-05-09 05:14:58.831332	529	Restaurant	2018-05-09 05:14:58.988866	2018-05-17 07:01:32.383071	11	f	\N	\N	\N	\N
894	1525842902	image/jpeg	74395	2018-05-09 05:15:01.865071	531	Restaurant	2018-05-09 05:15:02.223969	2018-05-17 07:01:32.394913	11	f	\N	\N	\N	\N
896	1525842906	image/jpeg	48312	2018-05-09 05:15:06.304518	533	Restaurant	2018-05-09 05:15:06.535548	2018-05-17 07:01:32.419996	11	f	\N	\N	\N	\N
897	1525842908	image/jpeg	93225	2018-05-09 05:15:08.576039	534	Restaurant	2018-05-09 05:15:08.774578	2018-05-17 07:01:32.433552	11	f	\N	\N	\N	\N
898	1525842911	image/jpeg	90289	2018-05-09 05:15:10.880415	535	Restaurant	2018-05-09 05:15:11.064016	2018-05-17 07:01:32.445275	11	f	\N	\N	\N	\N
899	1525842913	image/jpeg	82372	2018-05-09 05:15:12.955682	536	Restaurant	2018-05-09 05:15:13.169616	2018-05-17 07:01:32.458475	11	f	\N	\N	\N	\N
900	1525842915	image/jpeg	141595	2018-05-09 05:15:15.461251	537	Restaurant	2018-05-09 05:15:15.626251	2018-05-17 07:01:32.47015	11	f	\N	\N	\N	\N
901	1525842918	image/jpeg	180415	2018-05-09 05:15:17.888302	538	Restaurant	2018-05-09 05:15:18.057948	2018-05-17 07:01:32.482082	11	f	\N	\N	\N	\N
902	1525842920	image/jpeg	169355	2018-05-09 05:15:20.283711	539	Restaurant	2018-05-09 05:15:20.504358	2018-05-17 07:01:32.495201	11	f	\N	\N	\N	\N
903	1525842923	image/jpeg	147934	2018-05-09 05:15:22.683051	540	Restaurant	2018-05-09 05:15:23.018512	2018-05-17 07:01:32.506903	11	f	\N	\N	\N	\N
904	1525842925	image/jpeg	82381	2018-05-09 05:15:24.963344	541	Restaurant	2018-05-09 05:15:25.15892	2018-05-17 07:01:32.520147	11	f	\N	\N	\N	\N
905	1525842927	image/jpeg	75751	2018-05-09 05:15:26.941799	542	Restaurant	2018-05-09 05:15:27.158337	2018-05-17 07:01:32.531969	11	f	\N	\N	\N	\N
906	1525843035	image/jpeg	106151	2018-05-09 05:17:15.327481	544	Restaurant	2018-05-09 05:17:15.516556	2018-05-17 07:01:32.544301	11	f	\N	\N	\N	\N
907	1525843037	image/jpeg	148617	2018-05-09 05:17:17.363488	545	Restaurant	2018-05-09 05:17:17.54732	2018-05-17 07:01:32.557214	11	f	\N	\N	\N	\N
908	1525843041	image/jpeg	107778	2018-05-09 05:17:21.226851	546	Restaurant	2018-05-09 05:17:21.411469	2018-05-17 07:01:32.569142	11	f	\N	\N	\N	\N
910	1525843046	image/jpeg	113363	2018-05-09 05:17:26.143804	548	Restaurant	2018-05-09 05:17:26.331238	2018-05-17 07:01:32.594072	11	f	\N	\N	\N	\N
911	1525843048	image/jpeg	52902	2018-05-09 05:17:27.983746	549	Restaurant	2018-05-09 05:17:28.2031	2018-05-17 07:01:32.607295	11	f	\N	\N	\N	\N
912	1525843050	image/jpeg	161491	2018-05-09 05:17:30.424426	550	Restaurant	2018-05-09 05:17:30.660855	2018-05-17 07:01:32.618716	11	f	\N	\N	\N	\N
913	1525843052	image/jpeg	95443	2018-05-09 05:17:32.327133	551	Restaurant	2018-05-09 05:17:32.507204	2018-05-17 07:01:32.630936	11	f	\N	\N	\N	\N
914	1525843054	image/jpeg	49356	2018-05-09 05:17:34.494536	552	Restaurant	2018-05-09 05:17:34.749413	2018-05-17 07:01:32.644065	11	f	\N	\N	\N	\N
915	1525843056	image/jpeg	69649	2018-05-09 05:17:36.676837	553	Restaurant	2018-05-09 05:17:36.879523	2018-05-17 07:01:32.655903	11	f	\N	\N	\N	\N
916	1525843060	image/jpeg	88974	2018-05-09 05:17:40.39378	554	Restaurant	2018-05-09 05:17:40.501493	2018-05-17 07:01:32.66907	11	f	\N	\N	\N	\N
917	1525843062	image/jpeg	86817	2018-05-09 05:17:42.58598	555	Restaurant	2018-05-09 05:17:42.764105	2018-05-17 07:01:32.681099	11	f	\N	\N	\N	\N
918	1525843065	image/jpeg	35137	2018-05-09 05:17:44.905481	556	Restaurant	2018-05-09 05:17:45.008115	2018-05-17 07:01:32.694204	11	f	\N	\N	\N	\N
919	1525843067	image/jpeg	84817	2018-05-09 05:17:46.891477	557	Restaurant	2018-05-09 05:17:47.017302	2018-05-17 07:01:32.705816	11	f	\N	\N	\N	\N
920	1525843070	image/jpeg	97606	2018-05-09 05:17:49.935319	558	Restaurant	2018-05-09 05:17:50.07646	2018-05-17 07:01:32.717855	11	f	\N	\N	\N	\N
921	1525843072	image/jpeg	131643	2018-05-09 05:17:52.309267	559	Restaurant	2018-05-09 05:17:52.522459	2018-05-17 07:01:32.731068	11	f	\N	\N	\N	\N
922	1525843075	image/jpeg	119923	2018-05-09 05:17:54.813084	560	Restaurant	2018-05-09 05:17:55.006901	2018-05-17 07:01:32.74314	11	f	\N	\N	\N	\N
924	1525843078	image/jpeg	152325	2018-05-09 05:17:57.964501	562	Restaurant	2018-05-09 05:17:58.120635	2018-05-17 07:01:32.768052	11	f	\N	\N	\N	\N
925	1525843081	image/jpeg	94886	2018-05-09 05:17:59.732032	563	Restaurant	2018-05-09 05:18:01.46292	2018-05-17 07:01:32.781201	11	f	\N	\N	\N	\N
926	1525843083	image/jpeg	78165	2018-05-09 05:18:03.206217	564	Restaurant	2018-05-09 05:18:03.363142	2018-05-17 07:01:32.792908	11	f	\N	\N	\N	\N
927	1525843085	image/jpeg	119061	2018-05-09 05:18:05.425319	565	Restaurant	2018-05-09 05:18:05.569318	2018-05-17 07:01:32.804721	11	f	\N	\N	\N	\N
928	1525843087	image/jpeg	82788	2018-05-09 05:18:07.085955	566	Restaurant	2018-05-09 05:18:07.228756	2018-05-17 07:01:32.817951	11	f	\N	\N	\N	\N
929	1525843088	image/jpeg	126369	2018-05-09 05:18:08.70272	567	Restaurant	2018-05-09 05:18:08.835913	2018-05-17 07:01:32.82995	11	f	\N	\N	\N	\N
930	1525843090	image/jpeg	120759	2018-05-09 05:18:10.382429	568	Restaurant	2018-05-09 05:18:10.540633	2018-05-17 07:01:32.843205	11	f	\N	\N	\N	\N
931	1525843092	image/jpeg	99737	2018-05-09 05:18:12.299132	569	Restaurant	2018-05-09 05:18:12.480529	2018-05-17 07:01:32.854713	11	f	\N	\N	\N	\N
932	1525843094	image/jpeg	88159	2018-05-09 05:18:14.11956	570	Restaurant	2018-05-09 05:18:14.238551	2018-05-17 07:01:32.86795	11	f	\N	\N	\N	\N
933	1525843096	image/jpeg	77311	2018-05-09 05:18:15.958867	571	Restaurant	2018-05-09 05:18:16.045891	2018-05-17 07:01:32.879998	11	f	\N	\N	\N	\N
934	1525843097	image/jpeg	95480	2018-05-09 05:18:17.497592	572	Restaurant	2018-05-09 05:18:17.628732	2018-05-17 07:01:32.891506	11	f	\N	\N	\N	\N
935	1525843099	image/jpeg	145951	2018-05-09 05:18:19.269816	573	Restaurant	2018-05-09 05:18:19.381456	2018-05-17 07:01:32.90503	11	f	\N	\N	\N	\N
936	1525843101	image/jpeg	70078	2018-05-09 05:18:21.241861	574	Restaurant	2018-05-09 05:18:21.340598	2018-05-17 07:01:32.916723	11	f	\N	\N	\N	\N
937	1525843102	image/jpeg	49307	2018-05-09 05:18:22.799558	575	Restaurant	2018-05-09 05:18:22.949852	2018-05-17 07:01:32.930152	11	f	\N	\N	\N	\N
938	1525843105	image/jpeg	140131	2018-05-09 05:18:25.024006	577	Restaurant	2018-05-09 05:18:25.203998	2018-05-17 07:01:32.942176	11	f	\N	\N	\N	\N
939	1525843108	image/jpeg	53776	2018-05-09 05:18:28.143138	578	Restaurant	2018-05-09 05:18:28.290141	2018-05-17 07:01:32.955246	11	f	\N	\N	\N	\N
940	1525843110	image/jpeg	92550	2018-05-09 05:18:30.23993	579	Restaurant	2018-05-09 05:18:30.356948	2018-05-17 07:01:32.967185	11	f	\N	\N	\N	\N
941	1525843112	image/jpeg	87432	2018-05-09 05:18:32.081429	580	Restaurant	2018-05-09 05:18:32.20482	2018-05-17 07:01:32.978904	11	f	\N	\N	\N	\N
942	1525843114	image/jpeg	94647	2018-05-09 05:18:34.269497	582	Restaurant	2018-05-09 05:18:34.381055	2018-05-17 07:01:32.991769	11	f	\N	\N	\N	\N
943	1525843117	image/jpeg	167702	2018-05-09 05:18:36.90055	583	Restaurant	2018-05-09 05:18:37.017455	2018-05-17 07:01:33.003808	11	f	\N	\N	\N	\N
944	1525843118	image/jpeg	159658	2018-05-09 05:18:38.872988	584	Restaurant	2018-05-09 05:18:39.002184	2018-05-17 07:01:33.017403	11	f	\N	\N	\N	\N
945	1525843120	image/jpeg	209854	2018-05-09 05:18:40.751357	585	Restaurant	2018-05-09 05:18:40.938936	2018-05-17 07:01:33.029167	11	f	\N	\N	\N	\N
946	1525843123	image/jpeg	106834	2018-05-09 05:18:43.065449	587	Restaurant	2018-05-09 05:18:43.177117	2018-05-17 07:01:33.042512	11	f	\N	\N	\N	\N
947	1525843124	image/jpeg	160265	2018-05-09 05:18:44.881675	588	Restaurant	2018-05-09 05:18:44.994091	2018-05-17 07:01:33.054046	11	f	\N	\N	\N	\N
948	1525843126	image/jpeg	139256	2018-05-09 05:18:46.498448	589	Restaurant	2018-05-09 05:18:46.646693	2018-05-17 07:01:33.065734	11	f	\N	\N	\N	\N
949	1525843128	image/jpeg	122049	2018-05-09 05:18:48.251523	590	Restaurant	2018-05-09 05:18:48.372356	2018-05-17 07:01:33.079049	11	f	\N	\N	\N	\N
950	1525843130	image/png	579079	2018-05-09 05:18:50.478175	591	Restaurant	2018-05-09 05:18:50.680559	2018-05-17 07:01:33.090585	11	f	\N	\N	\N	\N
951	1525843132	image/jpeg	83376	2018-05-09 05:18:52.853015	592	Restaurant	2018-05-09 05:18:52.958189	2018-05-17 07:01:33.112187	11	f	\N	\N	\N	\N
957	1525843255	image/jpeg	93740	2018-05-09 05:20:55.796369	600	Restaurant	2018-05-09 05:20:55.90375	2018-05-17 07:01:33.123896	11	f	\N	\N	\N	\N
959	1525843259	image/jpeg	108068	2018-05-09 05:20:59.613993	602	Restaurant	2018-05-09 05:20:59.742979	2018-05-17 07:01:33.148923	11	f	\N	\N	\N	\N
960	1525843261	image/jpeg	119804	2018-05-09 05:21:01.631526	603	Restaurant	2018-05-09 05:21:01.775801	2018-05-17 07:01:33.16137	11	f	\N	\N	\N	\N
961	1525843263	image/jpeg	165256	2018-05-09 05:21:03.728819	604	Restaurant	2018-05-09 05:21:03.849229	2018-05-17 07:01:33.174006	11	f	\N	\N	\N	\N
962	1525843267	image/png	617804	2018-05-09 05:21:06.96215	605	Restaurant	2018-05-09 05:21:07.277521	2018-05-17 07:01:33.185925	11	f	\N	\N	\N	\N
963	1525843269	image/jpeg	100569	2018-05-09 05:21:09.413471	606	Restaurant	2018-05-09 05:21:09.5168	2018-05-17 07:01:33.199113	11	f	\N	\N	\N	\N
964	1525843271	image/jpeg	138854	2018-05-09 05:21:11.394985	607	Restaurant	2018-05-09 05:21:11.522162	2018-05-17 07:01:33.211628	11	f	\N	\N	\N	\N
965	1525843273	image/jpeg	175667	2018-05-09 05:21:13.175927	608	Restaurant	2018-05-09 05:21:13.324488	2018-05-17 07:01:33.223004	11	f	\N	\N	\N	\N
966	1525843275	image/jpeg	120426	2018-05-09 05:21:15.130806	609	Restaurant	2018-05-09 05:21:15.275062	2018-05-17 07:01:33.236165	11	f	\N	\N	\N	\N
967	1525843277	image/jpeg	115463	2018-05-09 05:21:17.111076	610	Restaurant	2018-05-09 05:21:17.228894	2018-05-17 07:01:33.248103	11	f	\N	\N	\N	\N
968	1525843279	image/jpeg	142081	2018-05-09 05:21:19.262689	611	Restaurant	2018-05-09 05:21:19.371428	2018-05-17 07:01:33.263298	11	f	\N	\N	\N	\N
969	1525843281	image/jpeg	96742	2018-05-09 05:21:20.916073	612	Restaurant	2018-05-09 05:21:21.019588	2018-05-17 07:01:33.276881	11	f	\N	\N	\N	\N
970	1525843283	image/jpeg	138512	2018-05-09 05:21:23.666183	613	Restaurant	2018-05-09 05:21:23.819313	2018-05-17 07:01:33.289404	11	f	\N	\N	\N	\N
971	1525843285	image/jpeg	101040	2018-05-09 05:21:25.675826	614	Restaurant	2018-05-09 05:21:25.796202	2018-05-17 07:01:33.310372	11	f	\N	\N	\N	\N
973	1525843291	image/jpeg	120605	2018-05-09 05:21:31.070063	616	Restaurant	2018-05-09 05:21:31.194999	2018-05-17 07:01:33.33592	11	f	\N	\N	\N	\N
974	1525843293	image/jpeg	96418	2018-05-09 05:21:33.272142	617	Restaurant	2018-05-09 05:21:33.371429	2018-05-17 07:01:33.349482	11	f	\N	\N	\N	\N
975	1525843295	image/jpeg	76840	2018-05-09 05:21:35.740058	618	Restaurant	2018-05-09 05:21:35.892528	2018-05-17 07:01:33.361907	11	f	\N	\N	\N	\N
976	1525843298	image/jpeg	117082	2018-05-09 05:21:38.312307	619	Restaurant	2018-05-09 05:21:38.410204	2018-05-17 07:01:33.376815	11	f	\N	\N	\N	\N
977	1525843300	image/jpeg	121807	2018-05-09 05:21:40.4094	620	Restaurant	2018-05-09 05:21:40.520833	2018-05-17 07:01:33.387725	11	f	\N	\N	\N	\N
978	1525843302	image/jpeg	96430	2018-05-09 05:21:42.174943	621	Restaurant	2018-05-09 05:21:42.279083	2018-05-17 07:01:33.401613	11	f	\N	\N	\N	\N
979	1525843303	image/jpeg	109965	2018-05-09 05:21:43.876712	622	Restaurant	2018-05-09 05:21:43.981437	2018-05-17 07:01:33.414055	11	f	\N	\N	\N	\N
980	1525843306	image/jpeg	318412	2018-05-09 05:21:46.294115	623	Restaurant	2018-05-09 05:21:46.494183	2018-05-17 07:01:33.427871	11	f	\N	\N	\N	\N
981	1525843309	image/jpeg	29690	2018-05-09 05:21:49.526739	624	Restaurant	2018-05-09 05:21:49.613044	2018-05-17 07:01:33.440394	11	f	\N	\N	\N	\N
982	1525843311	image/jpeg	87524	2018-05-09 05:21:51.769284	625	Restaurant	2018-05-09 05:21:51.898234	2018-05-17 07:01:33.45379	11	f	\N	\N	\N	\N
983	1525843314	image/jpeg	57367	2018-05-09 05:21:54.242425	626	Restaurant	2018-05-09 05:21:54.361103	2018-05-17 07:01:33.466393	11	f	\N	\N	\N	\N
984	1525843316	image/jpeg	122285	2018-05-09 05:21:56.01232	627	Restaurant	2018-05-09 05:21:56.145959	2018-05-17 07:01:33.479846	11	f	\N	\N	\N	\N
985	1525843318	image/jpeg	95703	2018-05-09 05:21:58.328607	628	Restaurant	2018-05-09 05:21:58.473448	2018-05-17 07:01:33.492227	11	f	\N	\N	\N	\N
987	1525843323	image/jpeg	123105	2018-05-09 05:22:03.750205	630	Restaurant	2018-05-09 05:22:03.884373	2018-05-17 07:01:33.518219	11	f	\N	\N	\N	\N
988	1525843326	image/jpeg	224339	2018-05-09 05:22:06.302768	631	Restaurant	2018-05-09 05:22:06.499214	2018-05-17 07:01:33.531691	11	f	\N	\N	\N	\N
989	1525843329	image/png	331038	2018-05-09 05:22:09.659293	632	Restaurant	2018-05-09 05:22:09.84164	2018-05-17 07:01:33.556812	11	f	\N	\N	\N	\N
990	1525843332	image/jpeg	125069	2018-05-09 05:22:12.06897	633	Restaurant	2018-05-09 05:22:12.187002	2018-05-17 07:01:33.572361	11	f	\N	\N	\N	\N
991	1525843333	image/jpeg	91052	2018-05-09 05:22:13.812069	634	Restaurant	2018-05-09 05:22:13.961758	2018-05-17 07:01:33.591163	11	f	\N	\N	\N	\N
992	1525843336	image/jpeg	141678	2018-05-09 05:22:16.274861	635	Restaurant	2018-05-09 05:22:16.410291	2018-05-17 07:01:33.605858	11	f	\N	\N	\N	\N
993	1525843338	image/jpeg	76904	2018-05-09 05:22:18.421398	636	Restaurant	2018-05-09 05:22:18.517349	2018-05-17 07:01:33.625429	11	f	\N	\N	\N	\N
994	1525843340	image/jpeg	111151	2018-05-09 05:22:20.826316	638	Restaurant	2018-05-09 05:22:20.953437	2018-05-17 07:01:33.639272	11	f	\N	\N	\N	\N
995	1525843343	image/jpeg	104824	2018-05-09 05:22:23.450361	640	Restaurant	2018-05-09 05:22:23.553935	2018-05-17 07:01:33.651451	11	f	\N	\N	\N	\N
996	1525843345	image/jpeg	89025	2018-05-09 05:22:25.404384	641	Restaurant	2018-05-09 05:22:25.518508	2018-05-17 07:01:33.665086	11	f	\N	\N	\N	\N
997	1525843350	image/jpeg	121045	2018-05-09 05:22:30.839888	642	Restaurant	2018-05-09 05:22:30.996137	2018-05-17 07:01:33.677618	11	f	\N	\N	\N	\N
998	1525843352	image/jpeg	113218	2018-05-09 05:22:32.803062	643	Restaurant	2018-05-09 05:22:32.929239	2018-05-17 07:01:33.691075	11	f	\N	\N	\N	\N
999	1525843355	image/jpeg	138801	2018-05-09 05:22:35.06936	644	Restaurant	2018-05-09 05:22:35.200096	2018-05-17 07:01:33.704074	11	f	\N	\N	\N	\N
1001	1525843359	image/jpeg	93585	2018-05-09 05:22:39.60544	646	Restaurant	2018-05-09 05:22:39.705753	2018-05-17 07:01:33.729538	11	f	\N	\N	\N	\N
1002	1525843361	image/jpeg	120613	2018-05-09 05:22:41.465102	647	Restaurant	2018-05-09 05:22:41.618837	2018-05-17 07:01:33.743696	11	f	\N	\N	\N	\N
1003	1525843363	image/jpeg	150714	2018-05-09 05:22:43.339505	648	Restaurant	2018-05-09 05:22:43.469161	2018-05-17 07:01:33.755703	11	f	\N	\N	\N	\N
1004	1525843365	image/jpeg	72419	2018-05-09 05:22:45.366324	649	Restaurant	2018-05-09 05:22:45.470204	2018-05-17 07:01:33.769904	11	f	\N	\N	\N	\N
1005	1525843367	image/jpeg	152209	2018-05-09 05:22:47.551509	650	Restaurant	2018-05-09 05:22:47.694738	2018-05-17 07:01:33.782249	11	f	\N	\N	\N	\N
1006	1525843369	image/jpeg	127244	2018-05-09 05:22:49.706794	651	Restaurant	2018-05-09 05:22:49.806216	2018-05-17 07:01:33.795363	11	f	\N	\N	\N	\N
1007	1525843372	image/jpeg	159785	2018-05-09 05:22:52.205935	652	Restaurant	2018-05-09 05:22:52.328961	2018-05-17 07:01:33.807781	11	f	\N	\N	\N	\N
1008	1525843374	image/jpeg	232539	2018-05-09 05:22:54.578665	653	Restaurant	2018-05-09 05:22:54.734113	2018-05-17 07:01:33.821587	11	f	\N	\N	\N	\N
1009	1525843377	image/jpeg	148232	2018-05-09 05:22:57.058205	654	Restaurant	2018-05-09 05:22:57.183048	2018-05-17 07:01:33.834309	11	f	\N	\N	\N	\N
1015	1526291181	image/jpeg	49583	2018-05-14 09:46:20.939807	656	Restaurant	2018-05-14 09:46:21.325868	2018-05-17 07:01:33.847958	11	f	\N	\N	\N	\N
952	1525843134	image/jpeg	102803	2018-05-09 05:18:54.673911	593	Restaurant	2018-05-09 05:18:54.783661	2018-05-17 07:01:33.859965	11	f	\N	\N	\N	\N
953	1525843137	image/jpeg	139221	2018-05-09 05:18:57.135555	594	Restaurant	2018-05-09 05:18:57.261344	2018-05-17 07:01:33.873608	11	f	\N	\N	\N	\N
954	1525843139	image/jpeg	93078	2018-05-09 05:18:58.916466	595	Restaurant	2018-05-09 05:18:59.048965	2018-05-17 07:01:33.886118	11	f	\N	\N	\N	\N
663	open-uri20180509-8006-8cbmu3	image/jpeg	115432	2018-05-09 04:04:54.750928	202	Dish	2018-05-09 04:04:54.871794	2018-05-17 07:01:33.899861	11	f	\N	\N	\N	\N
664	open-uri20180509-8006-1d91j82	image/jpeg	16317	2018-05-09 04:04:55.504566	203	Dish	2018-05-09 04:04:55.577573	2018-05-17 07:01:33.912175	11	f	\N	\N	\N	\N
665	open-uri20180509-8006-ukcggw	image/jpeg	104146	2018-05-09 04:04:56.340303	204	Dish	2018-05-09 04:04:56.431618	2018-05-17 07:01:33.92566	11	f	\N	\N	\N	\N
667	open-uri20180509-8006-16nml4f	image/jpeg	69783	2018-05-09 04:04:59.542492	206	Dish	2018-05-09 04:04:59.671842	2018-05-17 07:01:33.952002	11	f	\N	\N	\N	\N
670	open-uri20180509-8006-fsv8uv	image/jpeg	39923	2018-05-09 04:05:01.962057	209	Dish	2018-05-09 04:05:02.125164	2018-05-17 07:01:33.990089	11	f	\N	\N	\N	\N
673	open-uri20180509-8006-1oymaq8	image/jpeg	667243	2018-05-09 04:05:04.709645	212	Dish	2018-05-09 04:05:05.222511	2018-05-17 07:01:34.028385	11	f	\N	\N	\N	\N
674	open-uri20180509-8006-1rc27fe	image/jpeg	35732	2018-05-09 04:05:06.036282	213	Dish	2018-05-09 04:05:06.156911	2018-05-17 07:01:34.042188	11	f	\N	\N	\N	\N
678	open-uri20180509-8006-1sgmznp	image/jpeg	150686	2018-05-09 04:05:09.075998	217	Dish	2018-05-09 04:05:09.515436	2018-05-17 07:01:34.080812	11	f	\N	\N	\N	\N
683	open-uri20180509-8006-1wmdqty	image/jpeg	82020	2018-05-09 04:05:18.483037	222	Dish	2018-05-09 04:05:18.614901	2018-05-17 07:01:34.132923	11	f	\N	\N	\N	\N
684	open-uri20180509-8006-1qdutex	image/jpeg	120782	2018-05-09 04:05:20.475422	223	Dish	2018-05-09 04:05:20.671035	2018-05-17 07:01:34.155166	11	f	\N	\N	\N	\N
685	open-uri20180509-8006-1pwcbzj	image/jpeg	38888	2018-05-09 04:05:22.079373	224	Dish	2018-05-09 04:05:22.174707	2018-05-17 07:01:34.167671	11	f	\N	\N	\N	\N
686	open-uri20180509-8006-1h9uxth	image/jpeg	165726	2018-05-09 04:05:22.693352	225	Dish	2018-05-09 04:05:22.949251	2018-05-17 07:01:34.180946	11	f	\N	\N	\N	\N
687	open-uri20180509-8006-lvq1z3	image/jpeg	36282	2018-05-09 04:05:23.828135	226	Dish	2018-05-09 04:05:23.906411	2018-05-17 07:01:34.193926	11	f	\N	\N	\N	\N
688	open-uri20180509-8006-1lxjsbm	image/jpeg	83973	2018-05-09 04:05:25.027362	227	Dish	2018-05-09 04:05:25.197819	2018-05-17 07:01:34.20687	11	f	\N	\N	\N	\N
690	open-uri20180509-8006-1m5drlg	image/jpeg	581002	2018-05-09 04:05:27.196227	229	Dish	2018-05-09 04:05:27.757256	2018-05-17 07:01:34.23322	11	f	\N	\N	\N	\N
691	open-uri20180509-8006-1vxbeqc	image/jpeg	43781	2018-05-09 04:05:30.003389	230	Dish	2018-05-09 04:05:30.113213	2018-05-17 07:01:34.245183	11	f	\N	\N	\N	\N
692	open-uri20180509-8006-pyxym	image/jpeg	48198	2018-05-09 04:05:30.734093	231	Dish	2018-05-09 04:05:30.839115	2018-05-17 07:01:34.258938	11	f	\N	\N	\N	\N
693	open-uri20180509-8006-3dn291	image/jpeg	202058	2018-05-09 04:05:33.107061	232	Dish	2018-05-09 04:05:33.358307	2018-05-17 07:01:34.271303	11	f	\N	\N	\N	\N
694	open-uri20180509-8006-zyimvc	image/jpeg	94856	2018-05-09 04:05:34.042356	233	Dish	2018-05-09 04:05:34.215896	2018-05-17 07:01:34.28528	11	f	\N	\N	\N	\N
695	open-uri20180509-8006-1k00nq9	image/jpeg	146495	2018-05-09 04:05:37.387767	234	Dish	2018-05-09 04:05:37.491467	2018-05-17 07:01:34.297623	11	f	\N	\N	\N	\N
699	open-uri20180509-8006-5bodbt	image/jpeg	42671	2018-05-09 04:05:43.354684	238	Dish	2018-05-09 04:05:43.458486	2018-05-17 07:01:34.349517	11	f	\N	\N	\N	\N
702	open-uri20180509-8006-4cmd7e	image/jpeg	62581	2018-05-09 04:05:46.381558	241	Dish	2018-05-09 04:05:46.517731	2018-05-17 07:01:34.389946	11	f	\N	\N	\N	\N
703	open-uri20180509-8006-7nswi4	image/jpeg	68459	2018-05-09 04:05:48.046782	242	Dish	2018-05-09 04:05:48.186861	2018-05-17 07:01:34.402084	11	f	\N	\N	\N	\N
704	open-uri20180509-8006-s4mfke	image/jpeg	84323	2018-05-09 04:05:49.083842	243	Dish	2018-05-09 04:05:49.18113	2018-05-17 07:01:34.415389	11	f	\N	\N	\N	\N
705	open-uri20180509-8006-d6nxma	image/jpeg	194921	2018-05-09 04:05:50.995111	244	Dish	2018-05-09 04:05:51.089288	2018-05-17 07:01:34.427367	11	f	\N	\N	\N	\N
706	open-uri20180509-8006-1b2cgjk	image/jpeg	172645	2018-05-09 04:05:51.795468	243	Dish	2018-05-09 04:05:51.949975	2018-05-17 07:01:34.441185	11	f	\N	\N	\N	\N
709	open-uri20180509-8006-15k81ao	image/jpeg	1129348	2018-05-09 04:06:08.347792	248	Dish	2018-05-09 04:06:08.604019	2018-05-17 07:01:34.479863	11	f	\N	\N	\N	\N
710	open-uri20180509-8006-1ecfw6f	image/jpeg	367743	2018-05-09 04:06:10.197312	249	Dish	2018-05-09 04:06:10.46701	2018-05-17 07:01:34.49225	11	f	\N	\N	\N	\N
711	open-uri20180509-8006-68flwh	image/jpeg	38762	2018-05-09 04:06:11.235434	250	Dish	2018-05-09 04:06:11.315851	2018-05-17 07:01:34.505777	11	f	\N	\N	\N	\N
713	open-uri20180509-8006-r0b9xk	image/jpeg	52500	2018-05-09 04:06:12.991485	252	Dish	2018-05-09 04:06:13.083594	2018-05-17 07:01:34.532079	11	f	\N	\N	\N	\N
715	open-uri20180509-8006-qelsrn	image/jpeg	516779	2018-05-09 04:06:14.596132	254	Dish	2018-05-09 04:06:14.889241	2018-05-17 07:01:34.557992	11	f	\N	\N	\N	\N
716	open-uri20180509-8006-1hynbhe	image/jpeg	236454	2018-05-09 04:06:16.786555	255	Dish	2018-05-09 04:06:16.941376	2018-05-17 07:01:34.570289	11	f	\N	\N	\N	\N
719	open-uri20180509-8006-1jtvea1	image/jpeg	136725	2018-05-09 04:06:22.744923	258	Dish	2018-05-09 04:06:22.86435	2018-05-17 07:01:34.610417	11	f	\N	\N	\N	\N
720	open-uri20180509-8006-4w1320	image/jpeg	211863	2018-05-09 04:06:23.557612	259	Dish	2018-05-09 04:06:23.659212	2018-05-17 07:01:34.622298	11	f	\N	\N	\N	\N
722	open-uri20180509-8006-15gwevm	image/jpeg	32450	2018-05-09 04:06:26.721097	261	Dish	2018-05-09 04:06:26.82315	2018-05-17 07:01:34.648316	11	f	\N	\N	\N	\N
723	open-uri20180509-8006-we6oia	image/jpeg	407817	2018-05-09 04:06:27.608982	262	Dish	2018-05-09 04:06:27.885303	2018-05-17 07:01:34.661835	11	f	\N	\N	\N	\N
724	open-uri20180509-8006-1nagcdu	image/jpeg	47382	2018-05-09 04:06:28.88628	263	Dish	2018-05-09 04:06:28.977664	2018-05-17 07:01:34.674169	11	f	\N	\N	\N	\N
725	open-uri20180509-8006-hw86lh	image/jpeg	19239	2018-05-09 04:06:29.303567	264	Dish	2018-05-09 04:06:29.370246	2018-05-17 07:01:34.688336	11	f	\N	\N	\N	\N
726	open-uri20180509-8006-47o9or	image/jpeg	25081	2018-05-09 04:06:30.068099	265	Dish	2018-05-09 04:06:30.16459	2018-05-17 07:01:34.701176	11	f	\N	\N	\N	\N
668	sweet-corn.jpg	image/jpeg	31362	2019-06-17 11:06:46.61276	207	Dish	2018-05-09 04:05:00.446823	2019-06-17 11:06:46.975263	11	f	\N	\N	\N	\N
669	Tom_Yam.jpg	image/jpeg	400299	2019-06-17 11:09:02.631683	208	Dish	2018-05-09 04:05:01.334623	2019-06-17 11:09:02.858459	11	f	\N	\N	\N	\N
671	sweet-corn-chicken.jpg	image/jpeg	165087	2019-06-17 11:10:54.287129	210	Dish	2018-05-09 04:05:02.803863	2019-06-17 11:10:54.460024	11	f	\N	\N	\N	\N
672	Cantonese.jpg	image/jpeg	130185	2019-06-17 11:13:10.636233	211	Dish	2018-05-09 04:05:03.572304	2019-06-17 11:13:10.732748	11	f	\N	\N	\N	\N
676	DingriDhingri.jpg	image/jpeg	151502	2019-06-17 11:14:27.872292	215	Dish	2018-05-09 04:05:07.619819	2019-06-17 11:14:28.04235	11	f	\N	\N	\N	\N
677	half-tandoori-chicken.jpg	image/jpeg	52608	2019-06-17 11:15:30.20214	216	Dish	2018-05-09 04:05:08.292867	2019-06-17 11:15:30.407145	11	f	\N	\N	\N	\N
680	tangdi-kabab.jpg	image/jpeg	83349	2019-06-17 11:16:57.17868	219	Dish	2018-05-09 04:05:15.412552	2019-06-17 11:16:57.292647	11	f	\N	\N	\N	\N
681	chicken-tangdi-kabab.jpg	image/jpeg	62284	2019-06-17 11:20:40.841038	220	Dish	2018-05-09 04:05:16.840596	2019-06-17 11:20:40.946648	11	f	\N	\N	\N	\N
689	Chicken-555.jpg	image/jpeg	28680	2019-06-17 11:22:01.975428	228	Dish	2018-05-09 04:05:26.282815	2019-06-17 11:22:02.034156	11	f	\N	\N	\N	\N
696	Veg-Compogi.jpeg	image/jpeg	9404	2019-06-17 11:23:47.28706	235	Dish	2018-05-09 04:05:38.903296	2019-06-17 11:23:47.336726	11	f	\N	\N	\N	\N
697	Babycorn-Salt-and-Pepper.jpg	image/jpeg	142242	2019-06-17 11:24:56.149603	236	Dish	2018-05-09 04:05:40.485586	2019-06-17 11:24:56.231311	11	f	\N	\N	\N	\N
700	Crispy-Baby-Corn.JPG	image/jpeg	1588594	2019-06-17 11:28:19.771531	239	Dish	2018-05-09 04:05:45.162316	2019-06-17 11:28:20.425783	11	f	\N	\N	\N	\N
701	Egg_Manchurian_.jpg	image/jpeg	154419	2019-06-17 11:29:27.193607	240	Dish	2018-05-09 04:05:45.915042	2019-06-17 11:29:27.365128	11	f	\N	\N	\N	\N
707	Chicken-Winglets.jpg	image/jpeg	38867	2019-06-17 11:30:55.225075	246	Dish	2018-05-09 04:05:52.81901	2019-06-17 11:30:55.295278	11	f	\N	\N	\N	\N
708	Chicken-Winglets-8.jpg	image/jpeg	127096	2019-06-17 11:31:51.378951	247	Dish	2018-05-09 04:06:02.070623	2019-06-17 11:31:51.537943	11	f	\N	\N	\N	\N
712	bones.jpg	image/jpeg	163252	2019-06-17 11:32:53.32603	251	Dish	2018-05-09 04:06:12.296899	2019-06-17 11:32:53.464454	11	f	\N	\N	\N	\N
717	capsicumfish_M.JPG	image/jpeg	120125	2019-06-17 11:34:10.462899	256	Dish	2018-05-09 04:06:19.696745	2019-06-17 11:34:10.591961	11	f	\N	\N	\N	\N
718	Beijing_Prawn.jpg	image/jpeg	41000	2019-06-17 11:34:58.918902	257	Dish	2018-05-09 04:06:20.487451	2019-06-17 11:34:58.998342	11	f	\N	\N	\N	\N
721	Tomyam_Prawns.JPG	image/jpeg	47163	2019-06-17 11:36:22.162171	260	Dish	2018-05-09 04:06:26.010479	2019-06-17 11:36:22.22261	11	f	\N	\N	\N	\N
728	open-uri20180509-8006-1s8gvuj	image/jpeg	51038	2018-05-09 04:06:33.618232	267	Dish	2018-05-09 04:06:33.722564	2018-05-17 07:01:34.743298	11	f	\N	\N	\N	\N
729	open-uri20180509-8006-sgyyqd	image/jpeg	117548	2018-05-09 04:06:35.794078	268	Dish	2018-05-09 04:06:35.898717	2018-05-17 07:01:34.758618	11	f	\N	\N	\N	\N
730	open-uri20180509-8006-1moikuk	image/jpeg	122748	2018-05-09 04:06:36.752483	269	Dish	2018-05-09 04:06:36.967458	2018-05-17 07:01:34.770787	11	f	\N	\N	\N	\N
731	open-uri20180509-8006-1bq7p2k	image/jpeg	65332	2018-05-09 04:06:37.583212	270	Dish	2018-05-09 04:06:37.667931	2018-05-17 07:01:34.78449	11	f	\N	\N	\N	\N
732	open-uri20180509-8006-11uv52w	image/jpeg	31315	2018-05-09 04:06:38.404533	271	Dish	2018-05-09 04:06:38.502523	2018-05-17 07:01:34.796907	11	f	\N	\N	\N	\N
733	open-uri20180509-8006-1fvlxyi	image/jpeg	343315	2018-05-09 04:06:39.295612	272	Dish	2018-05-09 04:06:39.466952	2018-05-17 07:01:34.810534	11	f	\N	\N	\N	\N
734	open-uri20180509-8006-1lohobd	image/jpeg	39872	2018-05-09 04:06:40.420657	273	Dish	2018-05-09 04:06:40.481847	2018-05-17 07:01:34.823107	11	f	\N	\N	\N	\N
735	open-uri20180509-8006-k73yjy	image/jpeg	37369	2018-05-09 04:06:40.973924	274	Dish	2018-05-09 04:06:41.069387	2018-05-17 07:01:34.83645	11	f	\N	\N	\N	\N
736	open-uri20180509-8006-husioy	image/jpeg	89930	2018-05-09 04:06:42.054146	275	Dish	2018-05-09 04:06:42.227037	2018-05-17 07:01:34.848867	11	f	\N	\N	\N	\N
737	open-uri20180509-8006-1ebmhtk	image/jpeg	871394	2018-05-09 04:06:43.701453	276	Dish	2018-05-09 04:06:44.606518	2018-05-17 07:01:34.86314	11	f	\N	\N	\N	\N
738	open-uri20180509-8006-mik513	image/jpeg	65003	2018-05-09 04:06:45.234831	277	Dish	2018-05-09 04:06:45.359316	2018-05-17 07:01:34.875158	11	f	\N	\N	\N	\N
739	open-uri20180509-8006-e8nvvo	image/jpeg	163889	2018-05-09 04:06:47.029847	278	Dish	2018-05-09 04:06:47.189911	2018-05-17 07:01:34.888652	11	f	\N	\N	\N	\N
740	open-uri20180509-8006-r68vmt	image/jpeg	168853	2018-05-09 04:06:47.94873	279	Dish	2018-05-09 04:06:48.20148	2018-05-17 07:01:34.901382	11	f	\N	\N	\N	\N
741	open-uri20180509-8006-x2ymg9	image/jpeg	40943	2018-05-09 04:06:48.721116	280	Dish	2018-05-09 04:06:48.822744	2018-05-17 07:01:34.914728	11	f	\N	\N	\N	\N
743	open-uri20180509-8006-1nog8vq	image/jpeg	59599	2018-05-09 04:06:51.276569	282	Dish	2018-05-09 04:06:51.388723	2018-05-17 07:01:34.940569	11	f	\N	\N	\N	\N
745	open-uri20180509-8006-1gf9wa1	image/jpeg	69462	2018-05-09 04:06:53.875781	284	Dish	2018-05-09 04:06:53.976991	2018-05-17 07:01:34.967773	11	f	\N	\N	\N	\N
747	open-uri20180509-8006-12ea994	image/jpeg	141849	2018-05-09 04:06:57.881294	286	Dish	2018-05-09 04:06:58.017607	2018-05-17 07:01:34.991679	11	f	\N	\N	\N	\N
748	open-uri20180509-8006-1c53uy1	image/jpeg	36140	2018-05-09 04:07:00.296241	287	Dish	2018-05-09 04:07:00.387403	2018-05-17 07:01:35.005148	11	f	\N	\N	\N	\N
749	open-uri20180509-8006-ftjb8d	image/jpeg	151155	2018-05-09 04:07:02.250253	288	Dish	2018-05-09 04:07:02.51495	2018-05-17 07:01:35.017587	11	f	\N	\N	\N	\N
750	open-uri20180509-8006-11tk9ig	image/jpeg	126327	2018-05-09 04:07:03.048976	289	Dish	2018-05-09 04:07:03.204054	2018-05-17 07:01:35.03154	11	f	\N	\N	\N	\N
751	open-uri20180509-8006-lv3hho	image/jpeg	49398	2018-05-09 04:07:04.156787	290	Dish	2018-05-09 04:07:04.269629	2018-05-17 07:01:35.043717	11	f	\N	\N	\N	\N
752	open-uri20180509-8006-1vdj9r	image/jpeg	197533	2018-05-09 04:07:06.350721	284	Dish	2018-05-09 04:07:06.535786	2018-05-17 07:01:35.057583	11	f	\N	\N	\N	\N
753	open-uri20180509-8006-jq1p46	image/jpeg	306594	2018-05-09 04:07:10.939804	292	Dish	2018-05-09 04:07:11.160717	2018-05-17 07:01:35.069779	11	f	\N	\N	\N	\N
754	open-uri20180509-8006-1erp7r6	image/jpeg	36730	2018-05-09 04:07:11.725259	293	Dish	2018-05-09 04:07:11.847999	2018-05-17 07:01:35.083735	11	f	\N	\N	\N	\N
756	open-uri20180509-8006-1hvo1dh	image/jpeg	2403419	2018-05-09 04:07:53.602351	295	Dish	2018-05-09 04:07:54.466281	2018-05-17 07:01:35.10971	11	f	\N	\N	\N	\N
758	open-uri20180509-8006-48d0oi	image/jpeg	42830	2018-05-09 04:07:57.666853	297	Dish	2018-05-09 04:07:57.744857	2018-05-17 07:01:35.13582	11	f	\N	\N	\N	\N
759	open-uri20180509-8006-1dwb9lo	image/jpeg	158853	2018-05-09 04:07:58.831963	298	Dish	2018-05-09 04:07:58.963497	2018-05-17 07:01:35.147977	11	f	\N	\N	\N	\N
760	open-uri20180509-8006-1w4xovp	image/jpeg	86165	2018-05-09 04:08:00.684615	299	Dish	2018-05-09 04:08:00.76242	2018-05-17 07:01:35.161856	11	f	\N	\N	\N	\N
761	open-uri20180509-8006-l2u17w	image/jpeg	35855	2018-05-09 04:08:01.835138	300	Dish	2018-05-09 04:08:01.918015	2018-05-17 07:01:35.173709	11	f	\N	\N	\N	\N
762	open-uri20180509-8006-m3tt7k	image/jpeg	48534	2018-05-09 04:08:02.417669	301	Dish	2018-05-09 04:08:02.512238	2018-05-17 07:01:35.187622	11	f	\N	\N	\N	\N
763	open-uri20180509-8006-6xiocq	image/jpeg	48610	2018-05-09 04:08:03.123619	302	Dish	2018-05-09 04:08:03.219125	2018-05-17 07:01:35.200707	11	f	\N	\N	\N	\N
765	open-uri20180509-8006-kjkiem	image/jpeg	34897	2018-05-09 04:08:04.608249	304	Dish	2018-05-09 04:08:04.801796	2018-05-17 07:01:35.226809	11	f	\N	\N	\N	\N
766	open-uri20180509-8006-11j7sx9	image/jpeg	40592	2018-05-09 04:08:06.578758	305	Dish	2018-05-09 04:08:06.670932	2018-05-17 07:01:35.239569	11	f	\N	\N	\N	\N
767	open-uri20180509-8006-1tahjt5	image/jpeg	43951	2018-05-09 04:08:07.22478	306	Dish	2018-05-09 04:08:07.331932	2018-05-17 07:01:35.252078	11	f	\N	\N	\N	\N
768	open-uri20180509-8006-com8i4	image/jpeg	149371	2018-05-09 04:08:10.660395	307	Dish	2018-05-09 04:08:10.751858	2018-05-17 07:01:35.266345	11	f	\N	\N	\N	\N
769	open-uri20180509-8006-1p0qknd	image/jpeg	24311	2018-05-09 04:08:11.566788	308	Dish	2018-05-09 04:08:11.661784	2018-05-17 07:01:35.278266	11	f	\N	\N	\N	\N
770	open-uri20180509-8006-14b40ce	image/jpeg	72876	2018-05-09 04:08:12.963065	309	Dish	2018-05-09 04:08:13.088437	2018-05-17 07:01:35.292062	11	f	\N	\N	\N	\N
771	open-uri20180509-8006-1lay2f3	image/jpeg	139854	2018-05-09 04:08:13.904194	310	Dish	2018-05-09 04:08:14.106806	2018-05-17 07:01:35.304008	11	f	\N	\N	\N	\N
773	open-uri20180509-8006-qokop0	image/jpeg	164488	2018-05-09 04:08:16.164425	312	Dish	2018-05-09 04:08:16.362617	2018-05-17 07:01:35.330493	11	f	\N	\N	\N	\N
777	open-uri20180509-8006-1x6fpvj	image/jpeg	81339	2018-05-09 04:08:22.13922	316	Dish	2018-05-09 04:08:22.291671	2018-05-17 07:01:35.38217	11	f	\N	\N	\N	\N
778	open-uri20180509-8006-uolwci	image/jpeg	46968	2018-05-09 04:08:22.967875	317	Dish	2018-05-09 04:08:23.077025	2018-05-17 07:01:35.396151	11	f	\N	\N	\N	\N
780	open-uri20180509-8006-1wtzg63	image/jpeg	161131	2018-05-09 04:08:26.255506	319	Dish	2018-05-09 04:08:26.416981	2018-05-17 07:01:35.421825	11	f	\N	\N	\N	\N
781	open-uri20180509-8006-1va9od1	image/jpeg	41906	2018-05-09 04:08:27.289128	320	Dish	2018-05-09 04:08:27.398817	2018-05-17 07:01:35.435134	11	f	\N	\N	\N	\N
782	open-uri20180509-8006-17bh105	image/jpeg	27580	2018-05-09 04:08:27.87848	321	Dish	2018-05-09 04:08:27.951883	2018-05-17 07:01:35.446889	11	f	\N	\N	\N	\N
784	open-uri20180509-8006-1xt34xs	image/jpeg	49926	2018-05-09 04:08:39.129232	323	Dish	2018-05-09 04:08:39.26153	2018-05-17 07:01:35.472658	11	f	\N	\N	\N	\N
785	open-uri20180509-8006-yxfc78	image/jpeg	47002	2018-05-09 04:08:39.930456	324	Dish	2018-05-09 04:08:40.978748	2018-05-17 07:01:35.486466	11	f	\N	\N	\N	\N
786	open-uri20180509-8006-1898516	image/jpeg	11362	2018-05-09 04:08:41.566924	325	Dish	2018-05-09 04:08:41.634327	2018-05-17 07:01:35.499195	11	f	\N	\N	\N	\N
787	open-uri20180509-8006-3isg40	image/jpeg	44043	2018-05-09 04:08:42.414795	326	Dish	2018-05-09 04:08:42.511904	2018-05-17 07:01:35.512524	11	f	\N	\N	\N	\N
788	open-uri20180509-8006-1g59wv4	image/jpeg	190891	2018-05-09 04:08:45.142367	327	Dish	2018-05-09 04:08:45.32944	2018-05-17 07:01:35.525012	11	f	\N	\N	\N	\N
790	open-uri20180509-8006-hs93dj	image/jpeg	129975	2018-05-09 04:08:48.414987	329	Dish	2018-05-09 04:08:48.542769	2018-05-17 07:01:35.55079	11	f	\N	\N	\N	\N
791	open-uri20180509-8006-96cqbc	image/jpeg	11445	2018-05-09 04:08:48.896092	330	Dish	2018-05-09 04:08:48.972324	2018-05-17 07:01:35.564756	11	f	\N	\N	\N	\N
746	Panner_Pasanda.jpg	image/jpeg	15730	2019-06-17 11:42:11.568599	285	Dish	2018-05-09 04:06:56.9742	2019-06-17 11:42:11.620168	11	f	\N	\N	\N	\N
755	kadai-chicken-recipe.jpg	image/jpeg	86696	2019-06-17 11:46:18.060148	294	Dish	2018-05-09 04:07:13.401423	2019-06-17 11:46:18.183927	11	f	\N	\N	\N	\N
744	Tomato_Cashew_Curry.jpg	image/jpeg	145092	2019-06-17 11:53:56.416982	283	Dish	2018-05-09 04:06:52.81594	2019-06-17 11:53:56.535894	11	f	\N	\N	\N	\N
775	egg-biryani-recipe-1.jpg	image/jpeg	69957	2019-06-18 09:10:05.348789	314	Dish	2018-05-09 04:08:18.441851	2019-06-18 09:10:05.515572	11	f	\N	\N	\N	\N
776	Chicken_Dum_Biryani.jpg	image/jpeg	125717	2019-06-18 09:13:26.424387	315	Dish	2018-05-09 04:08:20.690129	2019-06-18 09:13:26.688722	11	f	\N	\N	\N	\N
779	lamb-keema-biryani-109579-1.jpeg	image/jpeg	837379	2019-06-18 09:14:42.374623	318	Dish	2018-05-09 04:08:24.157257	2019-06-18 09:14:42.842653	11	f	\N	\N	\N	\N
764	Mutton_Afthabi.jpg	image/jpeg	79811	2019-06-18 09:33:29.489833	303	Dish	2018-05-09 04:08:04.194455	2019-06-18 09:33:29.580451	11	f	\N	\N	\N	\N
792	open-uri20180509-8006-1ktfy5r	image/jpeg	12835	2018-05-09 04:08:49.279657	331	Dish	2018-05-09 04:08:49.345641	2018-05-17 07:01:35.577016	11	f	\N	\N	\N	\N
793	open-uri20180509-8006-1e148ru	image/jpeg	14747	2018-05-09 04:08:49.667996	332	Dish	2018-05-09 04:08:49.758331	2018-05-17 07:01:35.590713	11	f	\N	\N	\N	\N
794	open-uri20180509-8006-2qhd8v	image/jpeg	142865	2018-05-09 04:08:50.342881	333	Dish	2018-05-09 04:08:50.49962	2018-05-17 07:01:35.603177	11	f	\N	\N	\N	\N
795	open-uri20180509-8006-cizgk4	image/jpeg	349657	2018-05-09 04:08:51.370559	334	Dish	2018-05-09 04:08:51.600372	2018-05-17 07:01:35.616558	11	f	\N	\N	\N	\N
797	open-uri20180509-8006-1hbkvd0	image/jpeg	161368	2018-05-09 04:08:53.012572	336	Dish	2018-05-09 04:08:53.140034	2018-05-17 07:01:35.642596	11	f	\N	\N	\N	\N
798	open-uri20180509-8006-1la255m	image/jpeg	51797	2018-05-09 04:08:54.050557	337	Dish	2018-05-09 04:08:54.134277	2018-05-17 07:01:35.654957	11	f	\N	\N	\N	\N
799	open-uri20180509-8006-1ci6uwt	image/jpeg	63719	2018-05-09 04:08:55.09425	338	Dish	2018-05-09 04:08:55.180139	2018-05-17 07:01:35.669172	11	f	\N	\N	\N	\N
800	open-uri20180509-8006-t1gozx	image/jpeg	111916	2018-05-09 04:08:55.900622	339	Dish	2018-05-09 04:08:56.075366	2018-05-17 07:01:35.681021	11	f	\N	\N	\N	\N
801	open-uri20180509-8006-glc7kt	image/jpeg	54343	2018-05-09 04:08:56.643264	340	Dish	2018-05-09 04:08:56.753621	2018-05-17 07:01:35.695521	11	f	\N	\N	\N	\N
802	open-uri20180509-8006-6nmw7l	image/jpeg	60494	2018-05-09 04:08:57.14787	341	Dish	2018-05-09 04:08:57.256377	2018-05-17 07:01:35.707012	11	f	\N	\N	\N	\N
803	open-uri20180509-8006-1lpsomv	image/jpeg	642606	2018-05-09 04:08:58.915425	342	Dish	2018-05-09 04:08:59.631294	2018-05-17 07:01:35.720804	11	f	\N	\N	\N	\N
804	open-uri20180509-8006-1rtuko0	image/jpeg	229516	2018-05-09 04:09:00.568364	328	Dish	2018-05-09 04:09:00.834564	2018-05-17 07:01:35.7336	11	f	\N	\N	\N	\N
805	open-uri20180509-8006-19iruib	image/jpeg	60756	2018-05-09 04:09:03.344923	329	Dish	2018-05-09 04:09:03.438479	2018-05-17 07:01:35.747135	11	f	\N	\N	\N	\N
806	open-uri20180509-8006-6o47gi	image/jpeg	126120	2018-05-09 04:09:03.98019	330	Dish	2018-05-09 04:09:04.130236	2018-05-17 07:01:35.759625	11	f	\N	\N	\N	\N
807	open-uri20180509-8006-srvyzr	image/jpeg	69351	2018-05-09 04:09:05.521671	332	Dish	2018-05-09 04:09:05.607301	2018-05-17 07:01:35.772843	11	f	\N	\N	\N	\N
808	open-uri20180509-8006-1xd0tpo	image/jpeg	132456	2018-05-09 04:09:06.200179	347	Dish	2018-05-09 04:09:06.363224	2018-05-17 07:01:35.785297	11	f	\N	\N	\N	\N
809	open-uri20180509-8006-xxg9bu	image/jpeg	1261686	2018-05-09 04:09:11.66576	348	Dish	2018-05-09 04:09:12.182262	2018-05-17 07:01:35.799279	11	f	\N	\N	\N	\N
810	open-uri20180509-8006-lja2p2	image/jpeg	51224	2018-05-09 04:09:14.14229	349	Dish	2018-05-09 04:09:14.275159	2018-05-17 07:01:35.811378	11	f	\N	\N	\N	\N
811	open-uri20180509-8006-158wlk4	image/jpeg	89331	2018-05-09 04:09:15.111402	350	Dish	2018-05-09 04:09:15.172581	2018-05-17 07:01:35.824963	11	f	\N	\N	\N	\N
812	open-uri20180509-8006-abr2dc	image/jpeg	174439	2018-05-09 04:09:16.220321	351	Dish	2018-05-09 04:09:16.390836	2018-05-17 07:01:35.837299	11	f	\N	\N	\N	\N
813	open-uri20180509-8006-5l84xl	image/jpeg	126120	2018-05-09 04:09:17.438637	352	Dish	2018-05-09 04:09:17.57998	2018-05-17 07:01:35.850983	11	f	\N	\N	\N	\N
815	open-uri20180509-8006-8uq0ie	image/jpeg	43265	2018-05-09 04:09:19.647713	354	Dish	2018-05-09 04:09:19.7312	2018-05-17 07:01:35.877446	11	f	\N	\N	\N	\N
816	open-uri20180509-8006-1xb5u0e	image/jpeg	220884	2018-05-09 04:09:20.679245	355	Dish	2018-05-09 04:09:20.82265	2018-05-17 07:01:35.889353	11	f	\N	\N	\N	\N
817	open-uri20180509-8006-1m23smf	image/jpeg	101122	2018-05-09 04:09:22.863504	356	Dish	2018-05-09 04:09:23.017223	2018-05-17 07:01:35.903322	11	f	\N	\N	\N	\N
818	open-uri20180509-8006-vh616q	image/jpeg	139818	2018-05-09 04:09:23.495051	357	Dish	2018-05-09 04:09:23.560342	2018-05-17 07:01:35.915491	11	f	\N	\N	\N	\N
819	open-uri20180509-8006-16uikj3	image/jpeg	54330	2018-05-09 04:09:25.197983	358	Dish	2018-05-09 04:09:25.325475	2018-05-17 07:01:35.92817	11	f	\N	\N	\N	\N
821	open-uri20180509-8006-14kxab3	image/jpeg	101616	2018-05-09 04:09:29.531827	360	Dish	2018-05-09 04:09:29.653258	2018-05-17 07:01:35.95447	11	f	\N	\N	\N	\N
822	open-uri20180509-8006-1pe880f	image/jpeg	71143	2018-05-09 04:09:35.14561	361	Dish	2018-05-09 04:09:35.267075	2018-05-17 07:01:35.967915	11	f	\N	\N	\N	\N
823	open-uri20180509-8006-1630qvj	image/jpeg	268856	2018-05-09 04:09:42.24682	362	Dish	2018-05-09 04:09:42.672728	2018-05-17 07:01:35.980667	11	f	\N	\N	\N	\N
824	open-uri20180509-8006-9exr8t	image/jpeg	60494	2018-05-09 04:09:45.983756	363	Dish	2018-05-09 04:09:46.067418	2018-05-17 07:01:35.994241	11	f	\N	\N	\N	\N
826	open-uri20180509-8006-1t6d528	image/jpeg	60756	2018-05-09 04:09:48.563654	365	Dish	2018-05-09 04:09:48.658511	2018-05-17 07:01:36.019663	11	f	\N	\N	\N	\N
827	open-uri20180509-8006-ud8vd0	image/jpeg	46470	2018-05-09 04:09:50.278795	366	Dish	2018-05-09 04:09:50.387485	2018-05-17 07:01:36.032309	11	f	\N	\N	\N	\N
828	open-uri20180509-8006-1pqi3v7	image/jpeg	13492	2018-05-09 04:09:50.867074	367	Dish	2018-05-09 04:09:50.938107	2018-05-17 07:01:36.045797	11	f	\N	\N	\N	\N
829	open-uri20180509-8006-a9lujl	image/jpeg	14730	2018-05-09 04:09:51.731063	368	Dish	2018-05-09 04:09:51.803345	2018-05-17 07:01:36.057889	11	f	\N	\N	\N	\N
830	open-uri20180509-8006-qlj61	image/jpeg	1081390	2018-05-09 04:09:55.508303	369	Dish	2018-05-09 04:09:56.040405	2018-05-17 07:01:36.071657	11	f	\N	\N	\N	\N
831	open-uri20180509-8006-1emico5	image/jpeg	17825	2018-05-09 04:09:57.345527	370	Dish	2018-05-09 04:09:57.526017	2018-05-17 07:01:36.084199	11	f	\N	\N	\N	\N
832	open-uri20180509-8006-940yjd	image/jpeg	13697	2018-05-09 04:09:58.408536	371	Dish	2018-05-09 04:09:58.523784	2018-05-17 07:01:36.09817	11	f	\N	\N	\N	\N
833	open-uri20180509-8006-1rzcx45	image/jpeg	191194	2018-05-09 04:10:01.392622	372	Dish	2018-05-09 04:10:01.709482	2018-05-17 07:01:36.110168	11	f	\N	\N	\N	\N
834	open-uri20180509-8006-7qi96	image/jpeg	10268	2018-05-09 04:10:02.050495	373	Dish	2018-05-09 04:10:02.107491	2018-05-17 07:01:36.123742	11	f	\N	\N	\N	\N
835	open-uri20180509-8006-1yt11to	image/jpeg	128728	2018-05-09 04:10:03.086604	374	Dish	2018-05-09 04:10:03.353183	2018-05-17 07:01:36.136837	11	f	\N	\N	\N	\N
836	open-uri20180509-8006-1ybno2j	image/jpeg	108546	2018-05-09 04:10:15.568966	375	Dish	2018-05-09 04:10:15.694105	2018-05-17 07:01:36.150608	11	f	\N	\N	\N	\N
837	open-uri20180509-8006-2kj4p9	image/jpeg	13182	2018-05-09 04:10:16.862037	376	Dish	2018-05-09 04:10:16.963028	2018-05-17 07:01:36.162758	11	f	\N	\N	\N	\N
839	open-uri20180509-8006-1o3tec	image/jpeg	15637	2018-05-09 04:10:18.024321	378	Dish	2018-05-09 04:10:18.097455	2018-05-17 07:01:36.1884	11	f	\N	\N	\N	\N
840	open-uri20180509-8006-1aa8yaq	image/jpeg	26097	2018-05-09 04:10:18.655731	379	Dish	2018-05-09 04:10:18.727232	2018-05-17 07:01:36.203956	11	f	\N	\N	\N	\N
842	open-uri20180509-8006-1wd534n	image/jpeg	38312	2018-05-09 04:10:21.473365	381	Dish	2018-05-09 04:10:21.581727	2018-05-17 07:01:36.228927	11	f	\N	\N	\N	\N
843	open-uri20180509-8006-wybt6s	image/jpeg	1672130	2018-05-09 04:10:26.723978	382	Dish	2018-05-09 04:10:27.989502	2018-05-17 07:01:36.240362	11	f	\N	\N	\N	\N
844	open-uri20180509-8006-1urcc04	image/jpeg	156167	2018-05-09 04:10:28.604356	383	Dish	2018-05-09 04:10:28.851789	2018-05-17 07:01:36.252498	11	f	\N	\N	\N	\N
845	open-uri20180509-8006-xbubzn	image/jpeg	85099	2018-05-09 04:10:29.573817	384	Dish	2018-05-09 04:10:29.757957	2018-05-17 07:01:36.265802	11	f	\N	\N	\N	\N
846	open-uri20180509-8006-a6lxxt	image/jpeg	30987	2018-05-09 04:10:30.490539	385	Dish	2018-05-09 04:10:30.594306	2018-05-17 07:01:36.277422	11	f	\N	\N	\N	\N
847	open-uri20180509-8006-10pw3zc	image/jpeg	60255	2018-05-09 04:10:31.17207	386	Dish	2018-05-09 04:10:31.294286	2018-05-17 07:01:36.290887	11	f	\N	\N	\N	\N
849	open-uri20180509-8006-1x7axac	image/jpeg	51011	2018-05-09 04:10:33.706353	388	Dish	2018-05-09 04:10:33.801157	2018-05-17 07:01:36.31492	11	f	\N	\N	\N	\N
850	open-uri20180509-8006-1k5ocif	image/jpeg	113135	2018-05-09 04:10:34.469943	389	Dish	2018-05-09 04:10:34.682936	2018-05-17 07:01:36.32773	11	f	\N	\N	\N	\N
851	open-uri20180509-8006-19qbiyp	image/jpeg	27405	2018-05-09 04:10:35.777256	390	Dish	2018-05-09 04:10:35.891108	2018-05-17 07:01:36.339404	11	f	\N	\N	\N	\N
838	Butterscotch.jpg	image/jpeg	87599	2019-06-17 11:56:24.083248	377	Dish	2018-05-09 04:10:17.636632	2019-06-17 11:56:24.218823	11	f	\N	\N	\N	\N
825	Half_Veg_Noodles.jpeg	image/jpeg	10465	2019-06-17 11:59:20.726338	364	Dish	2018-05-09 04:09:46.907045	2019-06-17 11:59:20.783044	11	f	\N	\N	\N	\N
820	Chicken_In_Paprika_And_Pepper_Sauce.jpg	image/jpeg	30023	2019-06-17 12:01:27.934276	359	Dish	2018-05-09 04:09:27.045087	2019-06-17 12:01:28.004934	11	f	\N	\N	\N	\N
848	Chicken_Curry.jpg	image/jpeg	281276	2019-06-17 12:10:29.899554	387	Dish	2018-05-09 04:10:32.746967	2019-06-17 12:10:30.056858	11	f	\N	\N	\N	\N
814	Special_Chowmin.jpg	image/jpeg	23642	2019-06-18 09:47:48.834298	353	Dish	2018-05-09 04:09:18.372856	2019-06-18 09:47:48.889852	11	f	\N	\N	\N	\N
853	open-uri20180509-8006-1al7ol	image/jpeg	24566	2018-05-09 04:10:37.650441	392	Dish	2018-05-09 04:10:37.747332	2018-05-17 07:01:36.364431	11	f	\N	\N	\N	\N
955	1525843141	image/jpeg	144668	2018-05-09 05:19:01.022459	597	Restaurant	2018-05-09 05:19:01.185882	2018-05-17 07:01:36.377661	11	f	\N	\N	\N	\N
956	1525843143	image/jpeg	98982	2018-05-09 05:19:03.285532	598	Restaurant	2018-05-09 05:19:03.449703	2018-05-17 07:01:36.423075	11	f	\N	\N	\N	\N
1017	1526291186	image/jpeg	131318	2018-05-14 09:46:26.386954	658	Restaurant	2018-05-14 09:46:26.524579	2018-05-17 07:01:36.448351	11	f	\N	\N	\N	\N
1018	1526291188	image/jpeg	154174	2018-05-14 09:46:28.203336	659	Restaurant	2018-05-14 09:46:28.370217	2018-05-17 07:01:36.460042	11	f	\N	\N	\N	\N
1019	1526291191	image/jpeg	46206	2018-05-14 09:46:30.982417	660	Restaurant	2018-05-14 09:46:31.092753	2018-05-17 07:01:36.472982	11	f	\N	\N	\N	\N
1020	1526291193	image/jpeg	20232	2018-05-14 09:46:33.072418	661	Restaurant	2018-05-14 09:46:33.158601	2018-05-17 07:01:36.484536	11	f	\N	\N	\N	\N
1021	1526291195	image/jpeg	69065	2018-05-14 09:46:35.391903	662	Restaurant	2018-05-14 09:46:35.511879	2018-05-17 07:01:36.497694	11	f	\N	\N	\N	\N
1022	1526291198	image/jpeg	113556	2018-05-14 09:46:37.9356	663	Restaurant	2018-05-14 09:46:38.054175	2018-05-17 07:01:36.510185	11	f	\N	\N	\N	\N
1023	1526291201	image/jpeg	245156	2018-05-14 09:46:40.806583	664	Restaurant	2018-05-14 09:46:41.012198	2018-05-17 07:01:36.521398	11	f	\N	\N	\N	\N
1024	1526291203	image/jpeg	104385	2018-05-14 09:46:43.429634	665	Restaurant	2018-05-14 09:46:43.541226	2018-05-17 07:01:36.535093	11	f	\N	\N	\N	\N
1026	1526291207	image/jpeg	54428	2018-05-14 09:46:47.170948	667	Restaurant	2018-05-14 09:46:47.34847	2018-05-17 07:01:36.569177	11	f	\N	\N	\N	\N
1027	1526291209	image/jpeg	94662	2018-05-14 09:46:49.829132	668	Restaurant	2018-05-14 09:46:49.992567	2018-05-17 07:01:36.580733	11	f	\N	\N	\N	\N
1028	1526291212	image/jpeg	83874	2018-05-14 09:46:51.871117	669	Restaurant	2018-05-14 09:46:52.028123	2018-05-17 07:01:36.593604	11	f	\N	\N	\N	\N
1029	1526291214	image/jpeg	95870	2018-05-14 09:46:53.9703	670	Restaurant	2018-05-14 09:46:54.107377	2018-05-17 07:01:36.605152	11	f	\N	\N	\N	\N
1030	1526291216	image/jpeg	77480	2018-05-14 09:46:56.628012	671	Restaurant	2018-05-14 09:46:56.766627	2018-05-17 07:01:36.616827	11	f	\N	\N	\N	\N
1031	1526291219	image/jpeg	249502	2018-05-14 09:46:59.096984	672	Restaurant	2018-05-14 09:46:59.349958	2018-05-17 07:01:36.630022	11	f	\N	\N	\N	\N
1032	1526291221	image/jpeg	107908	2018-05-14 09:47:01.542749	674	Restaurant	2018-05-14 09:47:01.72881	2018-05-17 07:01:36.642569	11	f	\N	\N	\N	\N
1033	1526291227	image/jpeg	235467	2018-05-14 09:47:07.619102	675	Restaurant	2018-05-14 09:47:07.808105	2018-05-17 07:01:36.655004	11	f	\N	\N	\N	\N
1034	1526291229	image/jpeg	62907	2018-05-14 09:47:09.59445	676	Restaurant	2018-05-14 09:47:09.667192	2018-05-17 07:01:36.667016	11	f	\N	\N	\N	\N
1035	1526291231	image/jpeg	57780	2018-05-14 09:47:11.348687	677	Restaurant	2018-05-14 09:47:11.455227	2018-05-17 07:01:36.719324	11	f	\N	\N	\N	\N
1036	1526291233	image/jpeg	105355	2018-05-14 09:47:13.376184	678	Restaurant	2018-05-14 09:47:13.5594	2018-05-17 07:01:36.763525	11	f	\N	\N	\N	\N
1037	1526291235	image/jpeg	35011	2018-05-14 09:47:15.218817	679	Restaurant	2018-05-14 09:47:15.321876	2018-05-17 07:01:36.77603	11	f	\N	\N	\N	\N
1038	1526291237	image/jpeg	73749	2018-05-14 09:47:17.349749	680	Restaurant	2018-05-14 09:47:17.45793	2018-05-17 07:01:36.786987	11	f	\N	\N	\N	\N
1040	1526291245	image/jpeg	87588	2018-05-14 09:47:24.918342	682	Restaurant	2018-05-14 09:47:25.023299	2018-05-17 07:01:36.812564	11	f	\N	\N	\N	\N
1041	1526291248	image/jpeg	76552	2018-05-14 09:47:28.511616	683	Restaurant	2018-05-14 09:47:28.634791	2018-05-17 07:01:36.825376	11	f	\N	\N	\N	\N
1042	1526291250	image/jpeg	159983	2018-05-14 09:47:30.873133	684	Restaurant	2018-05-14 09:47:30.999934	2018-05-17 07:01:36.837351	11	f	\N	\N	\N	\N
1043	1526291252	image/jpeg	80373	2018-05-14 09:47:32.830046	685	Restaurant	2018-05-14 09:47:32.941877	2018-05-17 07:01:36.850264	11	f	\N	\N	\N	\N
1044	1526291255	image/jpeg	129244	2018-05-14 09:47:35.522376	687	Restaurant	2018-05-14 09:47:35.696485	2018-05-17 07:01:36.862092	11	f	\N	\N	\N	\N
1045	1526291257	image/jpeg	176915	2018-05-14 09:47:37.693192	688	Restaurant	2018-05-14 09:47:37.842681	2018-05-17 07:01:36.874638	11	f	\N	\N	\N	\N
1046	1526291259	image/jpeg	168362	2018-05-14 09:47:39.745754	689	Restaurant	2018-05-14 09:47:39.932832	2018-05-17 07:01:36.895538	11	f	\N	\N	\N	\N
1047	1526291261	image/jpeg	97391	2018-05-14 09:47:41.661095	690	Restaurant	2018-05-14 09:47:41.772444	2018-05-17 07:01:36.907713	11	f	\N	\N	\N	\N
1048	1526291263	image/jpeg	160587	2018-05-14 09:47:43.836373	691	Restaurant	2018-05-14 09:47:43.99964	2018-05-17 07:01:36.920383	11	f	\N	\N	\N	\N
1049	1526291266	image/jpeg	90039	2018-05-14 09:47:45.978049	692	Restaurant	2018-05-14 09:47:46.080104	2018-05-17 07:01:36.932371	11	f	\N	\N	\N	\N
1050	1526291268	image/jpeg	178050	2018-05-14 09:47:48.01792	693	Restaurant	2018-05-14 09:47:48.183034	2018-05-17 07:01:36.946168	11	f	\N	\N	\N	\N
1051	1526291270	image/jpeg	92765	2018-05-14 09:47:50.113646	694	Restaurant	2018-05-14 09:47:50.225321	2018-05-17 07:01:36.957836	11	f	\N	\N	\N	\N
1052	1526291271	image/jpeg	101767	2018-05-14 09:47:51.90442	695	Restaurant	2018-05-14 09:47:52.001081	2018-05-17 07:01:36.969375	11	f	\N	\N	\N	\N
1054	1526291276	image/jpeg	87235	2018-05-14 09:47:55.985485	697	Restaurant	2018-05-14 09:47:56.096096	2018-05-17 07:01:36.994374	11	f	\N	\N	\N	\N
1055	1526291279	image/jpeg	103562	2018-05-14 09:47:58.956476	700	Restaurant	2018-05-14 09:47:59.054208	2018-05-17 07:01:37.008333	11	f	\N	\N	\N	\N
1056	1526291280	image/jpeg	100425	2018-05-14 09:48:00.79183	701	Restaurant	2018-05-14 09:48:00.908739	2018-05-17 07:01:37.027958	11	f	\N	\N	\N	\N
1057	1526291283	image/jpeg	144240	2018-05-14 09:48:03.085052	702	Restaurant	2018-05-14 09:48:03.263673	2018-05-17 07:01:37.039759	11	f	\N	\N	\N	\N
1058	1526291285	image/jpeg	182048	2018-05-14 09:48:05.776365	704	Restaurant	2018-05-14 09:48:05.949453	2018-05-17 07:01:37.053052	11	f	\N	\N	\N	\N
1059	1526291287	image/jpeg	116766	2018-05-14 09:48:07.72819	705	Restaurant	2018-05-14 09:48:07.884514	2018-05-17 07:01:37.064558	11	f	\N	\N	\N	\N
1060	1526291290	image/jpeg	44217	2018-05-14 09:48:10.323552	706	Restaurant	2018-05-14 09:48:10.469878	2018-05-17 07:01:37.078231	11	f	\N	\N	\N	\N
1061	1526291293	image/jpeg	123205	2018-05-14 09:48:13.816063	707	Restaurant	2018-05-14 09:48:13.968662	2018-05-17 07:01:37.090062	11	f	\N	\N	\N	\N
1062	1526291297	image/jpeg	102012	2018-05-14 09:48:17.063498	708	Restaurant	2018-05-14 09:48:17.201099	2018-05-17 07:01:37.102976	11	f	\N	\N	\N	\N
1063	1526291299	image/jpeg	107039	2018-05-14 09:48:19.500032	709	Restaurant	2018-05-14 09:48:19.618303	2018-05-17 07:01:37.115498	11	f	\N	\N	\N	\N
1064	1526291306	image/jpeg	116367	2018-05-14 09:48:26.399238	710	Restaurant	2018-05-14 09:48:26.523459	2018-05-17 07:01:37.127169	11	f	\N	\N	\N	\N
1065	1526291308	image/jpeg	65288	2018-05-14 09:48:28.256726	711	Restaurant	2018-05-14 09:48:28.391487	2018-05-17 07:01:37.139721	11	f	\N	\N	\N	\N
1066	1526291318	image/jpeg	157709	2018-05-14 09:48:38.783559	712	Restaurant	2018-05-14 09:48:38.927775	2018-05-17 07:01:37.151633	11	f	\N	\N	\N	\N
1068	1526291326	image/jpeg	132370	2018-05-14 09:48:46.301985	714	Restaurant	2018-05-14 09:48:46.429613	2018-05-17 07:01:37.177147	11	f	\N	\N	\N	\N
1069	1526291329	image/jpeg	75867	2018-05-14 09:48:49.701372	715	Restaurant	2018-05-14 09:48:49.811715	2018-05-17 07:01:37.189817	11	f	\N	\N	\N	\N
1070	1526291342	image/jpeg	153021	2018-05-14 09:49:02.599765	716	Restaurant	2018-05-14 09:49:02.747484	2018-05-17 07:01:37.201728	11	f	\N	\N	\N	\N
1071	1526291363	image/jpeg	138841	2018-05-14 09:49:23.813638	717	Restaurant	2018-05-14 09:49:23.93955	2018-05-17 07:01:37.214134	11	f	\N	\N	\N	\N
1072	1526291381	image/jpeg	115091	2018-05-14 09:49:41.684084	718	Restaurant	2018-05-14 09:49:41.831571	2018-05-17 07:01:37.226993	11	f	\N	\N	\N	\N
1073	1526291394	image/jpeg	84819	2018-05-14 09:49:54.637084	720	Restaurant	2018-05-14 09:49:54.781533	2018-05-17 07:01:37.23887	11	f	\N	\N	\N	\N
1074	1526291406	image/jpeg	99683	2018-05-14 09:50:05.899223	721	Restaurant	2018-05-14 09:50:06.022171	2018-05-17 07:01:37.251748	11	f	\N	\N	\N	\N
1075	1526291411	image/jpeg	158757	2018-05-14 09:50:11.571779	722	Restaurant	2018-05-14 09:50:11.752166	2018-05-17 07:01:37.263615	11	f	\N	\N	\N	\N
1076	1526291414	image/jpeg	100505	2018-05-14 09:50:14.20325	724	Restaurant	2018-05-14 09:50:14.346144	2018-05-17 07:01:37.277221	11	f	\N	\N	\N	\N
1077	1526291416	image/jpeg	89602	2018-05-14 09:50:16.375594	725	Restaurant	2018-05-14 09:50:16.576165	2018-05-17 07:01:37.288609	11	f	\N	\N	\N	\N
1078	1526291425	image/jpeg	153545	2018-05-14 09:50:24.872719	726	Restaurant	2018-05-14 09:50:25.087527	2018-05-17 07:01:37.301171	11	f	\N	\N	\N	\N
1079	1526291429	image/jpeg	96347	2018-05-14 09:50:29.023456	727	Restaurant	2018-05-14 09:50:29.147254	2018-05-17 07:01:37.314063	11	f	\N	\N	\N	\N
1080	1526291431	image/jpeg	223714	2018-05-14 09:50:31.527651	728	Restaurant	2018-05-14 09:50:31.716311	2018-05-17 07:01:37.326282	11	f	\N	\N	\N	\N
1082	1526291436	image/jpeg	229166	2018-05-14 09:50:36.189176	730	Restaurant	2018-05-14 09:50:36.388063	2018-05-17 07:01:37.360256	11	f	\N	\N	\N	\N
1083	1526291438	image/jpeg	76198	2018-05-14 09:50:38.472935	731	Restaurant	2018-05-14 09:50:38.590624	2018-05-17 07:01:37.380631	11	f	\N	\N	\N	\N
1084	1526291442	image/jpeg	149795	2018-05-14 09:50:41.814915	733	Restaurant	2018-05-14 09:50:42.012867	2018-05-17 07:01:37.392768	11	f	\N	\N	\N	\N
1085	1526291444	image/jpeg	69582	2018-05-14 09:50:44.163304	734	Restaurant	2018-05-14 09:50:44.281227	2018-05-17 07:01:37.404222	11	f	\N	\N	\N	\N
1086	1526291446	image/jpeg	144300	2018-05-14 09:50:46.792146	735	Restaurant	2018-05-14 09:50:46.982637	2018-05-17 07:01:37.417964	11	f	\N	\N	\N	\N
1087	1526291449	image/jpeg	145232	2018-05-14 09:50:49.041788	736	Restaurant	2018-05-14 09:50:49.190344	2018-05-17 07:01:37.42974	11	f	\N	\N	\N	\N
1088	1526291451	image/jpeg	82449	2018-05-14 09:50:51.013335	737	Restaurant	2018-05-14 09:50:51.16322	2018-05-17 07:01:37.443523	11	f	\N	\N	\N	\N
1089	1526291453	image/jpeg	236292	2018-05-14 09:50:53.437275	738	Restaurant	2018-05-14 09:50:53.63314	2018-05-17 07:01:37.454449	11	f	\N	\N	\N	\N
1090	1526291455	image/jpeg	65194	2018-05-14 09:50:55.334076	739	Restaurant	2018-05-14 09:50:55.477813	2018-05-17 07:01:37.46755	11	f	\N	\N	\N	\N
1092	1526291463	image/jpeg	215507	2018-05-14 09:51:03.014724	742	Restaurant	2018-05-14 09:51:03.208096	2018-05-17 07:01:37.491284	11	f	\N	\N	\N	\N
1093	1526291472	image/jpeg	117899	2018-05-14 09:51:12.117498	743	Restaurant	2018-05-14 09:51:12.303278	2018-05-17 07:01:37.504461	11	f	\N	\N	\N	\N
1094	1526291487	image/jpeg	284000	2018-05-14 09:51:27.430507	745	Restaurant	2018-05-14 09:51:27.664775	2018-05-17 07:01:37.516204	11	f	\N	\N	\N	\N
1095	1526291490	image/jpeg	161074	2018-05-14 09:51:30.325285	746	Restaurant	2018-05-14 09:51:30.509649	2018-05-17 07:01:37.529706	11	f	\N	\N	\N	\N
1096	1526291492	image/jpeg	65405	2018-05-14 09:51:32.481498	747	Restaurant	2018-05-14 09:51:32.620895	2018-05-17 07:01:37.541584	11	f	\N	\N	\N	\N
1097	1526291498	image/jpeg	107537	2018-05-14 09:51:38.820518	748	Restaurant	2018-05-14 09:51:38.967131	2018-05-17 07:01:37.554778	11	f	\N	\N	\N	\N
1098	1526291502	image/jpeg	93232	2018-05-14 09:51:42.279544	749	Restaurant	2018-05-14 09:51:42.428675	2018-05-17 07:01:37.566914	11	f	\N	\N	\N	\N
1099	1526291506	image/jpeg	120910	2018-05-14 09:51:46.04902	750	Restaurant	2018-05-14 09:51:46.200444	2018-05-17 07:01:37.578512	11	f	\N	\N	\N	\N
1101	1526291512	image/jpeg	88821	2018-05-14 09:51:52.827181	753	Restaurant	2018-05-14 09:51:52.958387	2018-05-17 07:01:37.611812	11	f	\N	\N	\N	\N
1102	1526291515	image/jpeg	192498	2018-05-14 09:51:55.118757	754	Restaurant	2018-05-14 09:51:55.307906	2018-05-17 07:01:37.649821	11	f	\N	\N	\N	\N
1103	1526291517	image/jpeg	76806	2018-05-14 09:51:57.144258	755	Restaurant	2018-05-14 09:51:57.314703	2018-05-17 07:01:37.661981	11	f	\N	\N	\N	\N
1104	1526291519	image/jpeg	119316	2018-05-14 09:51:59.154376	756	Restaurant	2018-05-14 09:51:59.796098	2018-05-17 07:01:37.673387	11	f	\N	\N	\N	\N
1105	1526291522	image/jpeg	151179	2018-05-14 09:52:02.033344	757	Restaurant	2018-05-14 09:52:02.210169	2018-05-17 07:01:37.686617	11	f	\N	\N	\N	\N
1106	1526291525	image/jpeg	75207	2018-05-14 09:52:05.771868	758	Restaurant	2018-05-14 09:52:05.908351	2018-05-17 07:01:37.698442	11	f	\N	\N	\N	\N
1107	1526291529	image/jpeg	156464	2018-05-14 09:52:09.797136	759	Restaurant	2018-05-14 09:52:09.963451	2018-05-17 07:01:37.711837	11	f	\N	\N	\N	\N
1108	1526291533	image/jpeg	141646	2018-05-14 09:52:13.360654	761	Restaurant	2018-05-14 09:52:13.526305	2018-05-17 07:01:37.723659	11	f	\N	\N	\N	\N
1109	1526291537	image/jpeg	122248	2018-05-14 09:52:17.310194	762	Restaurant	2018-05-14 09:52:17.473517	2018-05-17 07:01:37.737042	11	f	\N	\N	\N	\N
1110	1526291540	image/jpeg	270011	2018-05-14 09:52:20.778196	764	Restaurant	2018-05-14 09:52:20.986233	2018-05-17 07:01:37.748838	11	f	\N	\N	\N	\N
1111	1526291543	image/jpeg	79285	2018-05-14 09:52:22.905946	765	Restaurant	2018-05-14 09:52:23.074368	2018-05-17 07:01:37.761087	11	f	\N	\N	\N	\N
1112	1526291545	image/jpeg	86621	2018-05-14 09:52:25.297911	766	Restaurant	2018-05-14 09:52:25.455195	2018-05-17 07:01:37.775424	11	f	\N	\N	\N	\N
1113	1526291547	image/jpeg	149357	2018-05-14 09:52:27.632397	767	Restaurant	2018-05-14 09:52:27.862462	2018-05-17 07:01:37.78706	11	f	\N	\N	\N	\N
1115	1526291564	image/jpeg	105641	2018-05-14 09:52:44.29342	769	Restaurant	2018-05-14 09:52:44.502962	2018-05-17 07:01:37.812257	11	f	\N	\N	\N	\N
1116	1526291568	image/jpeg	85853	2018-05-14 09:52:48.365946	770	Restaurant	2018-05-14 09:52:48.582255	2018-05-17 07:01:37.825687	11	f	\N	\N	\N	\N
1117	1526291573	image/jpeg	152976	2018-05-14 09:52:53.455229	772	Restaurant	2018-05-14 09:52:53.643703	2018-05-17 07:01:37.837658	11	f	\N	\N	\N	\N
1118	1526291580	image/jpeg	83325	2018-05-14 09:53:00.671011	773	Restaurant	2018-05-14 09:53:00.894549	2018-05-17 07:01:37.849393	11	f	\N	\N	\N	\N
1119	1526291584	image/jpeg	113821	2018-05-14 09:53:04.096898	774	Restaurant	2018-05-14 09:53:04.30894	2018-05-17 07:01:37.86254	11	f	\N	\N	\N	\N
1120	1526291588	image/jpeg	190774	2018-05-14 09:53:08.334467	775	Restaurant	2018-05-14 09:53:08.49467	2018-05-17 07:01:37.874044	11	f	\N	\N	\N	\N
1121	1526291591	image/jpeg	102639	2018-05-14 09:53:11.109984	776	Restaurant	2018-05-14 09:53:11.314917	2018-05-17 07:01:37.887204	11	f	\N	\N	\N	\N
1122	1526291594	image/jpeg	99775	2018-05-14 09:53:14.030623	777	Restaurant	2018-05-14 09:53:14.20547	2018-05-17 07:01:37.89914	11	f	\N	\N	\N	\N
1123	1526291597	image/jpeg	68959	2018-05-14 09:53:17.1822	778	Restaurant	2018-05-14 09:53:17.368902	2018-05-17 07:01:37.912532	11	f	\N	\N	\N	\N
1124	1526291599	image/jpeg	47014	2018-05-14 09:53:19.325505	779	Restaurant	2018-05-14 09:53:19.499871	2018-05-17 07:01:37.92431	11	f	\N	\N	\N	\N
1125	1526291601	image/jpeg	121576	2018-05-14 09:53:21.537558	780	Restaurant	2018-05-14 09:53:21.77247	2018-05-17 07:01:37.935917	11	f	\N	\N	\N	\N
1126	1526291604	image/jpeg	95269	2018-05-14 09:53:23.801195	781	Restaurant	2018-05-14 09:53:24.02872	2018-05-17 07:01:37.949515	11	f	\N	\N	\N	\N
1127	1526291606	image/jpeg	117107	2018-05-14 09:53:25.993536	782	Restaurant	2018-05-14 09:53:26.159593	2018-05-17 07:01:37.961884	11	f	\N	\N	\N	\N
1129	1526291612	image/jpeg	153838	2018-05-14 09:53:32.138646	784	Restaurant	2018-05-14 09:53:32.363657	2018-05-17 07:01:37.986147	11	f	\N	\N	\N	\N
1130	1526291619	image/jpeg	106526	2018-05-14 09:53:39.637661	785	Restaurant	2018-05-14 09:53:39.862353	2018-05-17 07:01:37.999406	11	f	\N	\N	\N	\N
1131	1526291623	image/jpeg	151522	2018-05-14 09:53:43.489687	786	Restaurant	2018-05-14 09:53:43.674678	2018-05-17 07:01:38.011181	11	f	\N	\N	\N	\N
1132	1526291631	image/jpeg	96102	2018-05-14 09:53:51.717067	787	Restaurant	2018-05-14 09:53:51.875097	2018-05-17 07:01:38.023004	11	f	\N	\N	\N	\N
1133	1526291639	image/jpeg	170336	2018-05-14 09:53:58.86106	788	Restaurant	2018-05-14 09:53:59.075971	2018-05-17 07:01:38.036114	11	f	\N	\N	\N	\N
1134	1526291643	image/jpeg	143710	2018-05-14 09:54:03.586343	789	Restaurant	2018-05-14 09:54:03.82927	2018-05-17 07:01:38.048327	11	f	\N	\N	\N	\N
1135	1526291647	image/jpeg	287335	2018-05-14 09:54:06.767545	790	Restaurant	2018-05-14 09:54:07.042221	2018-05-17 07:01:38.06185	11	f	\N	\N	\N	\N
1136	1526291650	image/jpeg	125668	2018-05-14 09:54:10.477206	791	Restaurant	2018-05-14 09:54:10.696835	2018-05-17 07:01:38.07291	11	f	\N	\N	\N	\N
1137	1526291657	image/jpeg	114288	2018-05-14 09:54:17.464875	792	Restaurant	2018-05-14 09:54:17.706462	2018-05-17 07:01:38.08633	11	f	\N	\N	\N	\N
1138	1526291671	image/jpeg	73644	2018-05-14 09:54:31.691815	793	Restaurant	2018-05-14 09:54:31.850917	2018-05-17 07:01:38.098613	11	f	\N	\N	\N	\N
1139	1526291681	image/jpeg	119763	2018-05-14 09:54:40.922375	794	Restaurant	2018-05-14 09:54:41.099497	2018-05-17 07:01:38.110309	11	f	\N	\N	\N	\N
1140	1526291691	image/jpeg	111252	2018-05-14 09:54:51.484996	796	Restaurant	2018-05-14 09:54:51.671551	2018-05-17 07:01:38.123263	11	f	\N	\N	\N	\N
1141	1526291700	image/jpeg	134415	2018-05-14 09:55:00.146947	797	Restaurant	2018-05-14 09:55:00.320992	2018-05-17 07:01:38.135284	11	f	\N	\N	\N	\N
1143	1526291728	image/jpeg	139887	2018-05-14 09:55:27.896997	800	Restaurant	2018-05-14 09:55:28.125312	2018-05-17 07:01:38.16141	11	f	\N	\N	\N	\N
1144	1526291739	image/jpeg	82270	2018-05-14 09:55:39.653126	801	Restaurant	2018-05-14 09:55:39.837696	2018-05-17 07:01:38.173414	11	f	\N	\N	\N	\N
1145	1526291747	image/jpeg	88496	2018-05-14 09:55:47.191739	803	Restaurant	2018-05-14 09:55:47.380356	2018-05-17 07:01:38.185089	11	f	\N	\N	\N	\N
1146	1526291754	image/png	497643	2018-05-14 09:55:53.294889	804	Restaurant	2018-05-14 09:55:54.016733	2018-05-17 07:01:38.196995	11	f	\N	\N	\N	\N
1147	1526291762	image/jpeg	85894	2018-05-14 09:56:02.304912	805	Restaurant	2018-05-14 09:56:02.539712	2018-05-17 07:01:38.210217	11	f	\N	\N	\N	\N
1148	1526291766	image/jpeg	82282	2018-05-14 09:56:06.386203	806	Restaurant	2018-05-14 09:56:06.560456	2018-05-17 07:01:38.222406	11	f	\N	\N	\N	\N
1149	1526291773	image/jpeg	156089	2018-05-14 09:56:12.930545	807	Restaurant	2018-05-14 09:56:13.120533	2018-05-17 07:01:38.235285	11	f	\N	\N	\N	\N
1150	1526291775	image/jpeg	183262	2018-05-14 09:56:15.379028	808	Restaurant	2018-05-14 09:56:15.618156	2018-05-17 07:01:38.24729	11	f	\N	\N	\N	\N
1151	1526291777	image/jpeg	6573	2018-05-14 09:56:17.456211	809	Restaurant	2018-05-14 09:56:17.632181	2018-05-17 07:01:38.259962	11	f	\N	\N	\N	\N
1152	1526291781	image/jpeg	62667	2018-05-14 09:56:20.924679	810	Restaurant	2018-05-14 09:56:21.095544	2018-05-17 07:01:38.272062	11	f	\N	\N	\N	\N
1153	1526291785	image/jpeg	217201	2018-05-14 09:56:25.481852	811	Restaurant	2018-05-14 09:56:25.699331	2018-05-17 07:01:38.28424	11	f	\N	\N	\N	\N
1154	1526291789	image/jpeg	182697	2018-05-14 09:56:29.584643	812	Restaurant	2018-05-14 09:56:29.794774	2018-05-17 07:01:38.297087	11	f	\N	\N	\N	\N
1155	1526291792	image/jpeg	87182	2018-05-14 09:56:32.123369	813	Restaurant	2018-05-14 09:56:32.325334	2018-05-17 07:01:38.309236	11	f	\N	\N	\N	\N
1157	1526291800	image/jpeg	89773	2018-05-14 09:56:39.986723	815	Restaurant	2018-05-14 09:56:40.225947	2018-05-17 07:01:38.333984	11	f	\N	\N	\N	\N
1158	1526291803	image/jpeg	148167	2018-05-14 09:56:43.718639	816	Restaurant	2018-05-14 09:56:43.881107	2018-05-17 07:01:38.345747	11	f	\N	\N	\N	\N
1159	1526291807	image/jpeg	122959	2018-05-14 09:56:47.359307	817	Restaurant	2018-05-14 09:56:47.601402	2018-05-17 07:01:38.359855	11	f	\N	\N	\N	\N
1160	1526291810	image/jpeg	104198	2018-05-14 09:56:50.758239	818	Restaurant	2018-05-14 09:56:50.948978	2018-05-17 07:01:38.370683	11	f	\N	\N	\N	\N
1161	1526291814	image/jpeg	119180	2018-05-14 09:56:54.444695	819	Restaurant	2018-05-14 09:56:54.635652	2018-05-17 07:01:38.384388	11	f	\N	\N	\N	\N
1162	1526291818	image/jpeg	120087	2018-05-14 09:56:58.214637	820	Restaurant	2018-05-14 09:56:58.414896	2018-05-17 07:01:38.395928	11	f	\N	\N	\N	\N
1163	1526291822	image/jpeg	124791	2018-05-14 09:57:01.951413	821	Restaurant	2018-05-14 09:57:02.235868	2018-05-17 07:01:38.409295	11	f	\N	\N	\N	\N
1164	1526291825	image/png	480016	2018-05-14 09:57:05.069259	822	Restaurant	2018-05-14 09:57:05.326466	2018-05-17 07:01:38.421126	11	f	\N	\N	\N	\N
1165	1526291828	image/jpeg	124018	2018-05-14 09:57:07.801812	823	Restaurant	2018-05-14 09:57:08.029647	2018-05-17 07:01:38.433007	11	f	\N	\N	\N	\N
1167	1526291842	image/jpeg	101975	2018-05-14 09:57:22.431644	825	Restaurant	2018-05-14 09:57:22.622681	2018-05-17 07:01:38.45827	11	f	\N	\N	\N	\N
1168	1526291844	image/jpeg	127528	2018-05-14 09:57:24.625453	826	Restaurant	2018-05-14 09:57:24.820843	2018-05-17 07:01:38.470903	11	f	\N	\N	\N	\N
1169	1526291847	image/jpeg	81857	2018-05-14 09:57:27.519493	827	Restaurant	2018-05-14 09:57:27.675904	2018-05-17 07:01:38.483094	11	f	\N	\N	\N	\N
1170	1526291850	image/jpeg	80236	2018-05-14 09:57:30.740744	828	Restaurant	2018-05-14 09:57:30.956811	2018-05-17 07:01:38.49599	11	f	\N	\N	\N	\N
1171	1526291853	image/jpeg	105407	2018-05-14 09:57:33.567286	830	Restaurant	2018-05-14 09:57:33.762169	2018-05-17 07:01:38.508079	11	f	\N	\N	\N	\N
1172	1526291856	image/jpeg	104125	2018-05-14 09:57:36.147976	831	Restaurant	2018-05-14 09:57:36.33406	2018-05-17 07:01:38.52012	11	f	\N	\N	\N	\N
1173	1526291859	image/jpeg	35653	2018-05-14 09:57:39.508612	832	Restaurant	2018-05-14 09:57:39.706323	2018-05-17 07:01:38.534333	11	f	\N	\N	\N	\N
1174	1526291863	image/jpeg	97086	2018-05-14 09:57:42.849416	834	Restaurant	2018-05-14 09:57:43.077839	2018-05-17 07:01:38.559358	11	f	\N	\N	\N	\N
1176	1526291870	image/jpeg	98388	2018-05-14 09:57:50.290965	836	Restaurant	2018-05-14 09:57:50.469187	2018-05-17 07:01:38.583516	11	f	\N	\N	\N	\N
1177	1526291874	image/jpeg	72131	2018-05-14 09:57:53.312226	837	Restaurant	2018-05-14 09:57:54.058984	2018-05-17 07:01:38.595076	11	f	\N	\N	\N	\N
1178	1526291878	image/png	732680	2018-05-14 09:57:58.066136	838	Restaurant	2018-05-14 09:57:58.379674	2018-05-17 07:01:38.607006	11	f	\N	\N	\N	\N
1179	1526291881	image/jpeg	97168	2018-05-14 09:58:01.351566	839	Restaurant	2018-05-14 09:58:01.557806	2018-05-17 07:01:38.62061	11	f	\N	\N	\N	\N
1180	1526291884	image/jpeg	137094	2018-05-14 09:58:04.003178	840	Restaurant	2018-05-14 09:58:04.205674	2018-05-17 07:01:38.63183	11	f	\N	\N	\N	\N
1181	1526291887	image/jpeg	84685	2018-05-14 09:58:07.175024	841	Restaurant	2018-05-14 09:58:07.394254	2018-05-17 07:01:38.644979	11	f	\N	\N	\N	\N
1182	1526291891	image/jpeg	114490	2018-05-14 09:58:11.059492	842	Restaurant	2018-05-14 09:58:11.200152	2018-05-17 07:01:38.657222	11	f	\N	\N	\N	\N
1183	1526291900	image/jpeg	97856	2018-05-14 09:58:20.8256	843	Restaurant	2018-05-14 09:58:20.938778	2018-05-17 07:01:38.670318	11	f	\N	\N	\N	\N
1184	1526291923	image/jpeg	91503	2018-05-14 09:58:43.682402	844	Restaurant	2018-05-14 09:58:43.918263	2018-05-17 07:01:38.682169	11	f	\N	\N	\N	\N
1185	1526291943	image/jpeg	145819	2018-05-14 09:59:03.762447	845	Restaurant	2018-05-14 09:59:03.893924	2018-05-17 07:01:38.694372	11	f	\N	\N	\N	\N
1186	1526291962	image/jpeg	122312	2018-05-14 09:59:22.845548	846	Restaurant	2018-05-14 09:59:22.995218	2018-05-17 07:01:38.706866	11	f	\N	\N	\N	\N
1187	1526291971	image/jpeg	92375	2018-05-14 09:59:31.179836	847	Restaurant	2018-05-14 09:59:31.294652	2018-05-17 07:01:38.71917	11	f	\N	\N	\N	\N
1188	1526291977	image/jpeg	125338	2018-05-14 09:59:37.654527	848	Restaurant	2018-05-14 09:59:37.782928	2018-05-17 07:01:38.731966	11	f	\N	\N	\N	\N
1190	1526291997	image/jpeg	144565	2018-05-14 09:59:57.336821	850	Restaurant	2018-05-14 09:59:57.470258	2018-05-17 07:01:38.798804	11	f	\N	\N	\N	\N
1191	1526292012	image/jpeg	66032	2018-05-14 10:00:12.722827	851	Restaurant	2018-05-14 10:00:12.837221	2018-05-17 07:01:38.810825	11	f	\N	\N	\N	\N
1192	1526292028	image/jpeg	98325	2018-05-14 10:00:28.614489	852	Restaurant	2018-05-14 10:00:28.744188	2018-05-17 07:01:38.822544	11	f	\N	\N	\N	\N
1193	1526292041	image/jpeg	110706	2018-05-14 10:00:40.972823	853	Restaurant	2018-05-14 10:00:41.096863	2018-05-17 07:01:38.835336	11	f	\N	\N	\N	\N
1194	1526292051	image/jpeg	157632	2018-05-14 10:00:51.811288	854	Restaurant	2018-05-14 10:00:51.936911	2018-05-17 07:01:38.847257	11	f	\N	\N	\N	\N
1195	1526292061	image/jpeg	108196	2018-05-14 10:01:00.950087	855	Restaurant	2018-05-14 10:01:01.07908	2018-05-17 07:01:38.861485	11	f	\N	\N	\N	\N
1196	1526292069	image/jpeg	66330	2018-05-14 10:01:09.722538	856	Restaurant	2018-05-14 10:01:09.872502	2018-05-17 07:01:38.872396	11	f	\N	\N	\N	\N
1197	1526292093	image/jpeg	118417	2018-05-14 10:01:33.706707	857	Restaurant	2018-05-14 10:01:33.823454	2018-05-17 07:01:38.88453	11	f	\N	\N	\N	\N
1198	1526292105	image/jpeg	88689	2018-05-14 10:01:45.285213	858	Restaurant	2018-05-14 10:01:45.411936	2018-05-17 07:01:38.897212	11	f	\N	\N	\N	\N
1199	1526292147	image/jpeg	91994	2018-05-14 10:02:27.549342	859	Restaurant	2018-05-14 10:02:27.656106	2018-05-17 07:01:38.90927	11	f	\N	\N	\N	\N
1200	1526292164	image/jpeg	88104	2018-05-14 10:02:44.650806	860	Restaurant	2018-05-14 10:02:44.762394	2018-05-17 07:01:38.922601	11	f	\N	\N	\N	\N
1201	1526292175	image/jpeg	74244	2018-05-14 10:02:55.656536	861	Restaurant	2018-05-14 10:02:55.753375	2018-05-17 07:01:38.934163	11	f	\N	\N	\N	\N
1202	1526292183	image/jpeg	191563	2018-05-14 10:03:03.614728	862	Restaurant	2018-05-14 10:03:03.789653	2018-05-17 07:01:38.947363	11	f	\N	\N	\N	\N
1204	1526292192	image/jpeg	32738	2018-05-14 10:03:12.810127	864	Restaurant	2018-05-14 10:03:12.903675	2018-05-17 07:01:38.979391	11	f	\N	\N	\N	\N
1205	1526292195	image/jpeg	88599	2018-05-14 10:03:15.791466	865	Restaurant	2018-05-14 10:03:15.907369	2018-05-17 07:01:38.994355	11	f	\N	\N	\N	\N
1206	1526292207	image/jpeg	92204	2018-05-14 10:03:27.346772	866	Restaurant	2018-05-14 10:03:27.475404	2018-05-17 07:01:39.012811	11	f	\N	\N	\N	\N
1207	1526292214	image/jpeg	278866	2018-05-14 10:03:34.191531	867	Restaurant	2018-05-14 10:03:34.353514	2018-05-17 07:01:39.027589	11	f	\N	\N	\N	\N
1208	1526292221	image/jpeg	167343	2018-05-14 10:03:41.773572	868	Restaurant	2018-05-14 10:03:41.93914	2018-05-17 07:01:39.046347	11	f	\N	\N	\N	\N
1209	1526292224	image/jpeg	144736	2018-05-14 10:03:44.643107	869	Restaurant	2018-05-14 10:03:44.824683	2018-05-17 07:01:39.061056	11	f	\N	\N	\N	\N
1210	1526292227	image/jpeg	135927	2018-05-14 10:03:47.565585	870	Restaurant	2018-05-14 10:03:47.694191	2018-05-17 07:01:39.079558	11	f	\N	\N	\N	\N
1211	1526292231	image/jpeg	159003	2018-05-14 10:03:50.916332	871	Restaurant	2018-05-14 10:03:51.043236	2018-05-17 07:01:39.09358	11	f	\N	\N	\N	\N
1212	1526292235	image/jpeg	179539	2018-05-14 10:03:54.993215	873	Restaurant	2018-05-14 10:03:55.09651	2018-05-17 07:01:39.113224	11	f	\N	\N	\N	\N
1213	1526292246	image/jpeg	88177	2018-05-14 10:04:06.098745	874	Restaurant	2018-05-14 10:04:06.221776	2018-05-17 07:01:39.133426	11	f	\N	\N	\N	\N
1214	1526292248	image/jpeg	161253	2018-05-14 10:04:08.794842	875	Restaurant	2018-05-14 10:04:08.943158	2018-05-17 07:01:39.146265	11	f	\N	\N	\N	\N
1215	1526292252	image/jpeg	42342	2018-05-14 10:04:12.095858	876	Restaurant	2018-05-14 10:04:12.215513	2018-05-17 07:01:39.159083	11	f	\N	\N	\N	\N
1216	1526292257	image/jpeg	132566	2018-05-14 10:04:17.667013	878	Restaurant	2018-05-14 10:04:17.818683	2018-05-17 07:01:39.179695	11	f	\N	\N	\N	\N
1218	1526292272	image/jpeg	81109	2018-05-14 10:04:32.808199	880	Restaurant	2018-05-14 10:04:32.916065	2018-05-17 07:01:39.211757	11	f	\N	\N	\N	\N
1219	1526292277	image/jpeg	249309	2018-05-14 10:04:37.270695	881	Restaurant	2018-05-14 10:04:37.481049	2018-05-17 07:01:39.225752	11	f	\N	\N	\N	\N
1220	1526292283	image/jpeg	92887	2018-05-14 10:04:43.598041	882	Restaurant	2018-05-14 10:04:43.731271	2018-05-17 07:01:39.245041	11	f	\N	\N	\N	\N
1221	1526292312	image/jpeg	86109	2018-05-14 10:05:11.971565	883	Restaurant	2018-05-14 10:05:12.127152	2018-05-17 07:01:39.261649	11	f	\N	\N	\N	\N
1222	1526292317	image/jpeg	116334	2018-05-14 10:05:17.214209	884	Restaurant	2018-05-14 10:05:17.341142	2018-05-17 07:01:39.272794	11	f	\N	\N	\N	\N
1223	1526292326	image/jpeg	112496	2018-05-14 10:05:26.389051	885	Restaurant	2018-05-14 10:05:26.494997	2018-05-17 07:01:39.287646	11	f	\N	\N	\N	\N
1224	1526292337	image/jpeg	133334	2018-05-14 10:05:37.518496	886	Restaurant	2018-05-14 10:05:37.661389	2018-05-17 07:01:39.307168	11	f	\N	\N	\N	\N
1225	1526292346	image/jpeg	85825	2018-05-14 10:05:46.140126	887	Restaurant	2018-05-14 10:05:46.286138	2018-05-17 07:01:39.321323	11	f	\N	\N	\N	\N
1226	1526292354	image/jpeg	57296	2018-05-14 10:05:54.217294	888	Restaurant	2018-05-14 10:05:54.309294	2018-05-17 07:01:39.333128	11	f	\N	\N	\N	\N
1227	1526292365	image/jpeg	89286	2018-05-14 10:06:05.006319	890	Restaurant	2018-05-14 10:06:05.174177	2018-05-17 07:01:39.346759	11	f	\N	\N	\N	\N
1228	1526292374	image/jpeg	85433	2018-05-14 10:06:14.869406	891	Restaurant	2018-05-14 10:06:14.985107	2018-05-17 07:01:39.359825	11	f	\N	\N	\N	\N
1229	1526292382	image/jpeg	113231	2018-05-14 10:06:22.040185	892	Restaurant	2018-05-14 10:06:22.157921	2018-05-17 07:01:39.37294	11	f	\N	\N	\N	\N
1230	1526292394	image/jpeg	185163	2018-05-14 10:06:34.048647	893	Restaurant	2018-05-14 10:06:34.244836	2018-05-17 07:01:39.385882	11	f	\N	\N	\N	\N
1232	1526292422	image/jpeg	108779	2018-05-14 10:07:02.794675	895	Restaurant	2018-05-14 10:07:02.94601	2018-05-17 07:01:39.411408	11	f	\N	\N	\N	\N
1233	1526292439	image/jpeg	74702	2018-05-14 10:07:19.680904	896	Restaurant	2018-05-14 10:07:19.788529	2018-05-17 07:01:39.425134	11	f	\N	\N	\N	\N
1234	1526292454	image/jpeg	111537	2018-05-14 10:07:34.232184	898	Restaurant	2018-05-14 10:07:34.354446	2018-05-17 07:01:39.437608	11	f	\N	\N	\N	\N
1235	1526292471	image/jpeg	99827	2018-05-14 10:07:50.955039	899	Restaurant	2018-05-14 10:07:51.07672	2018-05-17 07:01:39.451306	11	f	\N	\N	\N	\N
1236	1526292483	image/jpeg	149159	2018-05-14 10:08:03.010352	900	Restaurant	2018-05-14 10:08:03.214056	2018-05-17 07:01:39.463493	11	f	\N	\N	\N	\N
1237	1526292485	image/jpeg	49370	2018-05-14 10:08:05.542211	901	Restaurant	2018-05-14 10:08:05.692724	2018-05-17 07:01:39.477158	11	f	\N	\N	\N	\N
1238	1526292494	image/jpeg	102583	2018-05-14 10:08:14.378436	902	Restaurant	2018-05-14 10:08:14.497181	2018-05-17 07:01:39.489742	11	f	\N	\N	\N	\N
1239	1526292510	image/jpeg	98103	2018-05-14 10:08:30.652891	903	Restaurant	2018-05-14 10:08:30.781123	2018-05-17 07:01:39.501951	11	f	\N	\N	\N	\N
1240	1526292513	image/jpeg	122122	2018-05-14 10:08:33.38762	904	Restaurant	2018-05-14 10:08:33.516822	2018-05-17 07:01:39.524226	11	f	\N	\N	\N	\N
1242	1526292527	image/jpeg	141999	2018-05-14 10:08:47.318217	906	Restaurant	2018-05-14 10:08:47.443885	2018-05-17 07:01:39.549877	11	f	\N	\N	\N	\N
1243	1526292536	image/jpeg	192858	2018-05-14 10:08:56.140826	908	Restaurant	2018-05-14 10:08:56.296994	2018-05-17 07:01:39.562402	11	f	\N	\N	\N	\N
1244	1526292542	image/jpeg	231614	2018-05-14 10:09:01.863009	909	Restaurant	2018-05-14 10:09:02.025826	2018-05-17 07:01:39.576591	11	f	\N	\N	\N	\N
1245	1526292544	image/jpeg	123687	2018-05-14 10:09:04.731425	910	Restaurant	2018-05-14 10:09:04.928141	2018-05-17 07:01:39.58879	11	f	\N	\N	\N	\N
1246	1526292556	image/jpeg	107323	2018-05-14 10:09:16.431649	911	Restaurant	2018-05-14 10:09:16.5505	2018-05-17 07:01:39.602402	11	f	\N	\N	\N	\N
1247	1526292572	image/jpeg	107468	2018-05-14 10:09:32.714329	912	Restaurant	2018-05-14 10:09:32.848355	2018-05-17 07:01:39.614407	11	f	\N	\N	\N	\N
1248	1526292597	image/jpeg	152872	2018-05-14 10:09:57.681266	913	Restaurant	2018-05-14 10:09:57.811255	2018-05-17 07:01:39.628091	11	f	\N	\N	\N	\N
1249	1526292608	image/jpeg	218517	2018-05-14 10:10:08.014383	914	Restaurant	2018-05-14 10:10:08.199641	2018-05-17 07:01:39.64074	11	f	\N	\N	\N	\N
1251	1526292648	image/jpeg	191352	2018-05-14 10:10:47.999544	916	Restaurant	2018-05-14 10:10:48.208509	2018-05-17 07:01:39.666514	11	f	\N	\N	\N	\N
1252	1526292661	image/jpeg	116669	2018-05-14 10:11:01.470194	917	Restaurant	2018-05-14 10:11:01.616753	2018-05-17 07:01:39.68002	11	f	\N	\N	\N	\N
1253	1526292668	image/jpeg	142390	2018-05-14 10:11:08.803352	919	Restaurant	2018-05-14 10:11:08.92774	2018-05-17 07:01:39.692868	11	f	\N	\N	\N	\N
1254	1526292679	image/jpeg	166604	2018-05-14 10:11:19.583667	920	Restaurant	2018-05-14 10:11:19.752624	2018-05-17 07:01:39.706724	11	f	\N	\N	\N	\N
1255	1526292682	image/jpeg	83837	2018-05-14 10:11:22.370346	921	Restaurant	2018-05-14 10:11:22.497081	2018-05-17 07:01:39.718791	11	f	\N	\N	\N	\N
1256	1526292685	image/jpeg	72459	2018-05-14 10:11:25.35728	922	Restaurant	2018-05-14 10:11:25.508568	2018-05-17 07:01:39.732318	11	f	\N	\N	\N	\N
1257	1526292705	image/jpeg	163866	2018-05-14 10:11:45.66871	923	Restaurant	2018-05-14 10:11:45.871298	2018-05-17 07:01:39.744608	11	f	\N	\N	\N	\N
1258	1526292713	image/jpeg	106660	2018-05-14 10:11:53.366214	924	Restaurant	2018-05-14 10:11:53.507807	2018-05-17 07:01:39.758949	11	f	\N	\N	\N	\N
1259	1526292717	image/jpeg	90801	2018-05-14 10:11:57.053494	925	Restaurant	2018-05-14 10:11:57.20031	2018-05-17 07:01:39.770971	11	f	\N	\N	\N	\N
1260	1526292721	image/jpeg	144817	2018-05-14 10:12:01.699858	926	Restaurant	2018-05-14 10:12:01.855294	2018-05-17 07:01:39.784383	11	f	\N	\N	\N	\N
1261	1526292725	image/jpeg	200289	2018-05-14 10:12:04.976263	927	Restaurant	2018-05-14 10:12:05.127153	2018-05-17 07:01:39.796956	11	f	\N	\N	\N	\N
1262	1526292736	image/jpeg	112310	2018-05-14 10:12:16.049222	928	Restaurant	2018-05-14 10:12:16.254194	2018-05-17 07:01:39.810882	11	f	\N	\N	\N	\N
1263	1526292740	image/jpeg	162041	2018-05-14 10:12:20.205448	929	Restaurant	2018-05-14 10:12:20.492114	2018-05-17 07:01:39.822886	11	f	\N	\N	\N	\N
1265	1526292751	image/jpeg	103410	2018-05-14 10:12:31.37009	931	Restaurant	2018-05-14 10:12:31.548409	2018-05-17 07:01:39.848793	11	f	\N	\N	\N	\N
1266	1526292754	image/jpeg	102213	2018-05-14 10:12:34.32175	932	Restaurant	2018-05-14 10:12:34.527454	2018-05-17 07:01:39.862699	11	f	\N	\N	\N	\N
1267	1526292757	image/jpeg	91750	2018-05-14 10:12:36.975729	933	Restaurant	2018-05-14 10:12:37.20047	2018-05-17 07:01:39.874941	11	f	\N	\N	\N	\N
1268	1526292764	image/jpeg	104593	2018-05-14 10:12:44.523925	934	Restaurant	2018-05-14 10:12:44.749997	2018-05-17 07:01:39.888481	11	f	\N	\N	\N	\N
1269	1526292768	image/jpeg	116368	2018-05-14 10:12:47.897197	935	Restaurant	2018-05-14 10:12:48.163071	2018-05-17 07:01:39.901032	11	f	\N	\N	\N	\N
1270	1526292771	image/jpeg	121244	2018-05-14 10:12:50.903399	936	Restaurant	2018-05-14 10:12:51.102028	2018-05-17 07:01:39.914656	11	f	\N	\N	\N	\N
1271	1526292774	image/jpeg	47240	2018-05-14 10:12:54.576407	937	Restaurant	2018-05-14 10:12:54.747504	2018-05-17 07:01:39.927223	11	f	\N	\N	\N	\N
1272	1526292779	image/jpeg	289710	2018-05-14 10:12:59.322099	938	Restaurant	2018-05-14 10:12:59.551296	2018-05-17 07:01:39.940825	11	f	\N	\N	\N	\N
1273	1526292785	image/jpeg	101873	2018-05-14 10:13:05.255037	939	Restaurant	2018-05-14 10:13:05.437361	2018-05-17 07:01:39.953199	11	f	\N	\N	\N	\N
1274	1526292790	image/jpeg	108519	2018-05-14 10:13:09.932725	940	Restaurant	2018-05-14 10:13:10.107395	2018-05-17 07:01:39.966974	11	f	\N	\N	\N	\N
1275	1526292807	image/jpeg	124377	2018-05-14 10:13:27.364281	941	Restaurant	2018-05-14 10:13:27.606215	2018-05-17 07:01:39.979024	11	f	\N	\N	\N	\N
1276	1526292814	image/jpeg	75909	2018-05-14 10:13:34.561161	942	Restaurant	2018-05-14 10:13:34.747736	2018-05-17 07:01:39.991304	11	f	\N	\N	\N	\N
1277	1526292818	image/jpeg	37550	2018-05-14 10:13:38.722691	943	Restaurant	2018-05-14 10:13:38.919979	2018-05-17 07:01:40.005718	11	f	\N	\N	\N	\N
1279	1526292831	image/jpeg	132882	2018-05-14 10:13:51.692788	945	Restaurant	2018-05-14 10:13:51.905384	2018-05-17 07:01:40.031379	11	f	\N	\N	\N	\N
1280	1526292844	image/jpeg	170858	2018-05-14 10:14:04.517885	946	Restaurant	2018-05-14 10:14:04.758254	2018-05-17 07:01:40.043695	11	f	\N	\N	\N	\N
1281	1526292859	image/jpeg	68647	2018-05-14 10:14:19.18845	947	Restaurant	2018-05-14 10:14:19.360165	2018-05-17 07:01:40.057323	11	f	\N	\N	\N	\N
1282	1526292864	image/jpeg	113327	2018-05-14 10:14:24.824353	948	Restaurant	2018-05-14 10:14:24.979057	2018-05-17 07:01:40.069799	11	f	\N	\N	\N	\N
1283	1526292869	image/jpeg	75309	2018-05-14 10:14:29.56709	949	Restaurant	2018-05-14 10:14:29.749746	2018-05-17 07:01:40.083305	11	f	\N	\N	\N	\N
1284	1526292876	image/jpeg	49350	2018-05-14 10:14:35.861866	950	Restaurant	2018-05-14 10:14:36.075925	2018-05-17 07:01:40.095859	11	f	\N	\N	\N	\N
1285	1526292883	image/jpeg	138100	2018-05-14 10:14:43.458418	951	Restaurant	2018-05-14 10:14:43.651474	2018-05-17 07:01:40.109319	11	f	\N	\N	\N	\N
1286	1526292890	image/jpeg	109383	2018-05-14 10:14:50.307293	952	Restaurant	2018-05-14 10:14:50.503001	2018-05-17 07:01:40.121977	11	f	\N	\N	\N	\N
1287	1526292898	image/jpeg	122859	2018-05-14 10:14:57.854377	954	Restaurant	2018-05-14 10:14:58.03643	2018-05-17 07:01:40.135893	11	f	\N	\N	\N	\N
1288	1526292903	image/jpeg	98255	2018-05-14 10:15:03.782841	955	Restaurant	2018-05-14 10:15:03.998685	2018-05-17 07:01:40.147902	11	f	\N	\N	\N	\N
1289	1526292906	image/jpeg	99883	2018-05-14 10:15:06.818404	956	Restaurant	2018-05-14 10:15:07.002308	2018-05-17 07:01:40.161259	11	f	\N	\N	\N	\N
1290	1526292911	image/jpeg	102771	2018-05-14 10:15:11.375439	957	Restaurant	2018-05-14 10:15:11.581985	2018-05-17 07:01:40.173854	11	f	\N	\N	\N	\N
1291	1526292924	image/jpeg	83955	2018-05-14 10:15:24.633802	958	Restaurant	2018-05-14 10:15:24.833767	2018-05-17 07:01:40.187414	11	f	\N	\N	\N	\N
1293	1526292944	image/jpeg	143766	2018-05-14 10:15:44.633145	960	Restaurant	2018-05-14 10:15:44.813666	2018-05-17 07:01:40.213486	11	f	\N	\N	\N	\N
1294	1526292951	image/jpeg	160032	2018-05-14 10:15:51.076374	961	Restaurant	2018-05-14 10:15:51.2653	2018-05-17 07:01:40.225986	11	f	\N	\N	\N	\N
1295	1526292963	image/jpeg	126832	2018-05-14 10:16:02.82344	962	Restaurant	2018-05-14 10:16:03.062086	2018-05-17 07:01:40.239953	11	f	\N	\N	\N	\N
1296	1526376450	image/jpeg	99563	2018-05-15 09:27:30.186213	963	Restaurant	2018-05-15 09:27:30.472796	2018-05-17 07:01:40.252138	11	f	\N	\N	\N	\N
1297	1526376452	image/jpeg	171486	2018-05-15 09:27:32.426073	964	Restaurant	2018-05-15 09:27:32.591635	2018-05-17 07:01:40.265752	11	f	\N	\N	\N	\N
1298	1526376454	image/jpeg	82932	2018-05-15 09:27:34.077216	965	Restaurant	2018-05-15 09:27:34.191229	2018-05-17 07:01:40.277906	11	f	\N	\N	\N	\N
1299	1526376456	image/jpeg	137387	2018-05-15 09:27:36.102693	966	Restaurant	2018-05-15 09:27:36.238668	2018-05-17 07:01:40.291844	11	f	\N	\N	\N	\N
1300	1526376458	image/jpeg	142440	2018-05-15 09:27:38.120692	967	Restaurant	2018-05-15 09:27:38.319329	2018-05-17 07:01:40.304015	11	f	\N	\N	\N	\N
1301	1526376460	image/jpeg	94275	2018-05-15 09:27:39.9711	968	Restaurant	2018-05-15 09:27:40.113989	2018-05-17 07:01:40.317976	11	f	\N	\N	\N	\N
1302	1526376461	image/jpeg	115812	2018-05-15 09:27:41.49512	969	Restaurant	2018-05-15 09:27:41.607327	2018-05-17 07:01:40.330232	11	f	\N	\N	\N	\N
1303	1526376463	image/jpeg	112122	2018-05-15 09:27:42.991294	970	Restaurant	2018-05-15 09:27:43.118548	2018-05-17 07:01:40.343843	11	f	\N	\N	\N	\N
1304	1526376464	image/jpeg	92893	2018-05-15 09:27:44.66185	971	Restaurant	2018-05-15 09:27:44.768221	2018-05-17 07:01:40.356347	11	f	\N	\N	\N	\N
1305	1526376466	image/jpeg	74455	2018-05-15 09:27:46.546555	972	Restaurant	2018-05-15 09:27:46.703284	2018-05-17 07:01:40.369857	11	f	\N	\N	\N	\N
1307	1526376472	image/jpeg	162284	2018-05-15 09:27:52.135582	974	Restaurant	2018-05-15 09:27:52.309963	2018-05-17 07:01:40.396315	11	f	\N	\N	\N	\N
1308	1526376474	image/jpeg	212146	2018-05-15 09:27:54.178774	975	Restaurant	2018-05-15 09:27:54.346721	2018-05-17 07:01:40.408459	11	f	\N	\N	\N	\N
1309	1526376476	image/jpeg	279842	2018-05-15 09:27:56.806152	977	Restaurant	2018-05-15 09:27:56.996227	2018-05-17 07:01:40.422403	11	f	\N	\N	\N	\N
1310	1526376478	image/jpeg	126296	2018-05-15 09:27:58.23366	978	Restaurant	2018-05-15 09:27:58.37816	2018-05-17 07:01:40.434444	11	f	\N	\N	\N	\N
1311	1526376480	image/jpeg	67523	2018-05-15 09:28:00.34163	979	Restaurant	2018-05-15 09:28:00.461438	2018-05-17 07:01:40.446968	11	f	\N	\N	\N	\N
1312	1526376483	image/jpeg	107267	2018-05-15 09:28:03.174371	980	Restaurant	2018-05-15 09:28:03.38659	2018-05-17 07:01:40.468862	11	f	\N	\N	\N	\N
1313	1526376490	image/jpeg	103099	2018-05-15 09:28:10.625698	981	Restaurant	2018-05-15 09:28:10.728182	2018-05-17 07:01:40.480929	11	f	\N	\N	\N	\N
1314	1526376492	image/jpeg	151075	2018-05-15 09:28:12.054428	982	Restaurant	2018-05-15 09:28:12.179542	2018-05-17 07:01:40.494624	11	f	\N	\N	\N	\N
1315	1526376495	image/jpeg	209779	2018-05-15 09:28:15.488512	983	Restaurant	2018-05-15 09:28:15.664833	2018-05-17 07:01:40.507139	11	f	\N	\N	\N	\N
1317	1526376499	image/jpeg	99210	2018-05-15 09:28:19.481827	985	Restaurant	2018-05-15 09:28:19.60282	2018-05-17 07:01:40.533483	11	f	\N	\N	\N	\N
1318	1526376501	image/jpeg	124546	2018-05-15 09:28:21.702257	986	Restaurant	2018-05-15 09:28:21.826677	2018-05-17 07:01:40.546765	11	f	\N	\N	\N	\N
1319	1526376504	image/jpeg	218302	2018-05-15 09:28:23.862574	988	Restaurant	2018-05-15 09:28:24.027397	2018-05-17 07:01:40.559266	11	f	\N	\N	\N	\N
1320	1526376506	image/jpeg	117213	2018-05-15 09:28:26.601892	989	Restaurant	2018-05-15 09:28:26.724662	2018-05-17 07:01:40.57278	11	f	\N	\N	\N	\N
1321	1526376509	image/jpeg	234622	2018-05-15 09:28:29.115783	991	Restaurant	2018-05-15 09:28:29.278379	2018-05-17 07:01:40.585359	11	f	\N	\N	\N	\N
1322	1526376511	image/jpeg	59143	2018-05-15 09:28:31.224432	992	Restaurant	2018-05-15 09:28:31.339038	2018-05-17 07:01:40.59903	11	f	\N	\N	\N	\N
1323	1526376513	image/jpeg	139587	2018-05-15 09:28:32.992776	993	Restaurant	2018-05-15 09:28:33.143243	2018-05-17 07:01:40.611209	11	f	\N	\N	\N	\N
1324	1526376514	image/jpeg	62959	2018-05-15 09:28:34.548967	994	Restaurant	2018-05-15 09:28:34.663826	2018-05-17 07:01:40.624859	11	f	\N	\N	\N	\N
1326	1526376518	image/jpeg	122013	2018-05-15 09:28:37.949342	996	Restaurant	2018-05-15 09:28:38.079276	2018-05-17 07:01:40.651066	11	f	\N	\N	\N	\N
1327	1526376525	image/jpeg	137971	2018-05-15 09:28:45.612262	997	Restaurant	2018-05-15 09:28:45.767783	2018-05-17 07:01:40.663425	11	f	\N	\N	\N	\N
1328	1526376527	image/jpeg	66833	2018-05-15 09:28:46.93363	998	Restaurant	2018-05-15 09:28:47.051372	2018-05-17 07:01:40.677301	11	f	\N	\N	\N	\N
1329	1526376528	image/jpeg	148053	2018-05-15 09:28:48.466959	999	Restaurant	2018-05-15 09:28:48.59551	2018-05-17 07:01:40.68942	11	f	\N	\N	\N	\N
1330	1526376530	image/jpeg	143772	2018-05-15 09:28:50.442302	1000	Restaurant	2018-05-15 09:28:50.584985	2018-05-17 07:01:40.703713	11	f	\N	\N	\N	\N
1331	1526376532	image/jpeg	129928	2018-05-15 09:28:52.411314	1001	Restaurant	2018-05-15 09:28:52.583752	2018-05-17 07:01:40.731219	11	f	\N	\N	\N	\N
1332	1526376534	image/jpeg	236330	2018-05-15 09:28:54.086843	1002	Restaurant	2018-05-15 09:28:54.348447	2018-05-17 07:01:40.757198	11	f	\N	\N	\N	\N
1333	1526376536	image/jpeg	188895	2018-05-15 09:28:55.967026	1003	Restaurant	2018-05-15 09:28:56.136249	2018-05-17 07:01:40.783773	11	f	\N	\N	\N	\N
1334	1526376537	image/jpeg	105740	2018-05-15 09:28:57.603606	1004	Restaurant	2018-05-15 09:28:57.764467	2018-05-17 07:01:40.809177	11	f	\N	\N	\N	\N
1335	1526376539	image/jpeg	196769	2018-05-15 09:28:59.817415	1005	Restaurant	2018-05-15 09:28:59.990722	2018-05-17 07:01:40.821629	11	f	\N	\N	\N	\N
1336	1526376541	image/jpeg	78180	2018-05-15 09:29:01.295995	1006	Restaurant	2018-05-15 09:29:01.407342	2018-05-17 07:01:40.835194	11	f	\N	\N	\N	\N
1337	1526376542	image/jpeg	50886	2018-05-15 09:29:02.582825	1007	Restaurant	2018-05-15 09:29:02.681826	2018-05-17 07:01:40.84733	11	f	\N	\N	\N	\N
1338	1526376544	image/jpeg	42925	2018-05-15 09:29:04.562559	1008	Restaurant	2018-05-15 09:29:04.670237	2018-05-17 07:01:40.861004	11	f	\N	\N	\N	\N
1340	1526376548	image/jpeg	95758	2018-05-15 09:29:07.929233	1010	Restaurant	2018-05-15 09:29:08.043881	2018-05-17 07:01:40.887659	11	f	\N	\N	\N	\N
1341	1526376550	image/jpeg	101071	2018-05-15 09:29:09.915299	1012	Restaurant	2018-05-15 09:29:10.035175	2018-05-17 07:01:40.899559	11	f	\N	\N	\N	\N
1342	1526376551	image/jpeg	104805	2018-05-15 09:29:11.181589	1013	Restaurant	2018-05-15 09:29:11.304167	2018-05-17 07:01:40.912988	11	f	\N	\N	\N	\N
1343	1526376553	image/jpeg	138321	2018-05-15 09:29:13.050987	1014	Restaurant	2018-05-15 09:29:13.183582	2018-05-17 07:01:40.925389	11	f	\N	\N	\N	\N
1344	1526376562	image/jpeg	119837	2018-05-15 09:29:21.903946	1015	Restaurant	2018-05-15 09:29:22.615413	2018-05-17 07:01:40.938211	11	f	\N	\N	\N	\N
1345	1526376564	image/jpeg	97828	2018-05-15 09:29:24.474429	1016	Restaurant	2018-05-15 09:29:24.592477	2018-05-17 07:01:40.951921	11	f	\N	\N	\N	\N
1346	1526376566	image/jpeg	116033	2018-05-15 09:29:26.306237	1017	Restaurant	2018-05-15 09:29:26.46657	2018-05-17 07:01:40.963854	11	f	\N	\N	\N	\N
1347	1526376568	image/jpeg	179062	2018-05-15 09:29:28.59101	1019	Restaurant	2018-05-15 09:29:28.761778	2018-05-17 07:01:40.9779	11	f	\N	\N	\N	\N
1348	1526376570	image/jpeg	101937	2018-05-15 09:29:30.671242	1020	Restaurant	2018-05-15 09:29:30.797786	2018-05-17 07:01:40.989984	11	f	\N	\N	\N	\N
1349	1526376573	image/jpeg	88923	2018-05-15 09:29:33.062381	1022	Restaurant	2018-05-15 09:29:33.177155	2018-05-17 07:01:41.003895	11	f	\N	\N	\N	\N
1350	1526376574	image/jpeg	149136	2018-05-15 09:29:34.56765	1023	Restaurant	2018-05-15 09:29:34.745664	2018-05-17 07:01:41.01617	11	f	\N	\N	\N	\N
1351	1526376576	image/jpeg	92670	2018-05-15 09:29:36.28048	1024	Restaurant	2018-05-15 09:29:36.416007	2018-05-17 07:01:41.030119	11	f	\N	\N	\N	\N
1352	1526376577	image/jpeg	90277	2018-05-15 09:29:37.799311	1025	Restaurant	2018-05-15 09:29:37.908921	2018-05-17 07:01:41.042546	11	f	\N	\N	\N	\N
1354	1526376583	image/jpeg	87606	2018-05-15 09:29:43.022232	1028	Restaurant	2018-05-15 09:29:43.146496	2018-05-17 07:01:41.06814	11	f	\N	\N	\N	\N
1355	1526376586	image/jpeg	99000	2018-05-15 09:29:46.013364	1029	Restaurant	2018-05-15 09:29:46.141357	2018-05-17 07:01:41.081786	11	f	\N	\N	\N	\N
1356	1526376590	image/jpeg	136427	2018-05-15 09:29:49.970304	1030	Restaurant	2018-05-15 09:29:50.137228	2018-05-17 07:01:41.094036	11	f	\N	\N	\N	\N
1357	1526376593	image/jpeg	77039	2018-05-15 09:29:53.790263	1032	Restaurant	2018-05-15 09:29:53.902638	2018-05-17 07:01:41.10808	11	f	\N	\N	\N	\N
1358	1526376597	image/png	527425	2018-05-15 09:29:57.427197	1033	Restaurant	2018-05-15 09:29:57.780511	2018-05-17 07:01:41.120679	11	f	\N	\N	\N	\N
1359	1526376599	image/jpeg	102720	2018-05-15 09:29:59.716146	1035	Restaurant	2018-05-15 09:29:59.84301	2018-05-17 07:01:41.134211	11	f	\N	\N	\N	\N
1360	1526376601	image/jpeg	227830	2018-05-15 09:30:01.359129	1036	Restaurant	2018-05-15 09:30:01.617007	2018-05-17 07:01:41.146192	11	f	\N	\N	\N	\N
1361	1526376603	image/jpeg	109978	2018-05-15 09:30:03.196474	1037	Restaurant	2018-05-15 09:30:03.387465	2018-05-17 07:01:41.159928	11	f	\N	\N	\N	\N
1362	1526376606	image/jpeg	182921	2018-05-15 09:30:06.339003	1038	Restaurant	2018-05-15 09:30:06.491011	2018-05-17 07:01:41.172422	11	f	\N	\N	\N	\N
1363	1526376614	image/jpeg	170304	2018-05-15 09:30:13.859633	1039	Restaurant	2018-05-15 09:30:14.068941	2018-05-17 07:01:41.186474	11	f	\N	\N	\N	\N
1364	1526376616	image/jpeg	115055	2018-05-15 09:30:16.049925	1040	Restaurant	2018-05-15 09:30:16.215716	2018-05-17 07:01:41.198478	11	f	\N	\N	\N	\N
1365	1526376618	image/jpeg	115148	2018-05-15 09:30:18.290364	1042	Restaurant	2018-05-15 09:30:18.421747	2018-05-17 07:01:41.212361	11	f	\N	\N	\N	\N
1366	1526376620	image/jpeg	106759	2018-05-15 09:30:19.861205	1043	Restaurant	2018-05-15 09:30:20.040816	2018-05-17 07:01:41.224355	11	f	\N	\N	\N	\N
1368	1526376624	image/jpeg	136411	2018-05-15 09:30:24.842387	1045	Restaurant	2018-05-15 09:30:24.971021	2018-05-17 07:01:41.250784	11	f	\N	\N	\N	\N
1369	1526376626	image/jpeg	162076	2018-05-15 09:30:26.412247	1046	Restaurant	2018-05-15 09:30:26.539607	2018-05-17 07:01:41.264532	11	f	\N	\N	\N	\N
1370	1526376628	image/jpeg	80384	2018-05-15 09:30:28.082004	1047	Restaurant	2018-05-15 09:30:28.196255	2018-05-17 07:01:41.276796	11	f	\N	\N	\N	\N
1371	1526376629	image/jpeg	123397	2018-05-15 09:30:29.564609	1048	Restaurant	2018-05-15 09:30:29.700466	2018-05-17 07:01:41.290543	11	f	\N	\N	\N	\N
1372	1526376631	image/jpeg	91602	2018-05-15 09:30:31.533092	1050	Restaurant	2018-05-15 09:30:31.668852	2018-05-17 07:01:41.302692	11	f	\N	\N	\N	\N
1373	1526376633	image/jpeg	113818	2018-05-15 09:30:33.506528	1051	Restaurant	2018-05-15 09:30:33.648961	2018-05-17 07:01:41.31638	11	f	\N	\N	\N	\N
1374	1526376635	image/jpeg	68549	2018-05-15 09:30:35.340516	1052	Restaurant	2018-05-15 09:30:35.455166	2018-05-17 07:01:41.328767	11	f	\N	\N	\N	\N
1375	1526376637	image/jpeg	70128	2018-05-15 09:30:36.995493	1053	Restaurant	2018-05-15 09:30:37.121272	2018-05-17 07:01:41.342559	11	f	\N	\N	\N	\N
1376	1526376638	image/jpeg	94669	2018-05-15 09:30:38.530275	1054	Restaurant	2018-05-15 09:30:38.656197	2018-05-17 07:01:41.354677	11	f	\N	\N	\N	\N
1377	1526376640	image/jpeg	103306	2018-05-15 09:30:40.063787	1055	Restaurant	2018-05-15 09:30:40.177902	2018-05-17 07:01:41.368661	11	f	\N	\N	\N	\N
1378	1526376641	image/jpeg	57900	2018-05-15 09:30:41.558238	1056	Restaurant	2018-05-15 09:30:41.673708	2018-05-17 07:01:41.38081	11	f	\N	\N	\N	\N
1379	1526376643	image/jpeg	62232	2018-05-15 09:30:43.256359	1057	Restaurant	2018-05-15 09:30:43.402445	2018-05-17 07:01:41.392958	11	f	\N	\N	\N	\N
1380	1526376645	image/jpeg	139532	2018-05-15 09:30:45.091759	1058	Restaurant	2018-05-15 09:30:45.267063	2018-05-17 07:01:41.415425	11	f	\N	\N	\N	\N
1382	1526376649	image/jpeg	48144	2018-05-15 09:30:49.802103	1061	Restaurant	2018-05-15 09:30:49.923201	2018-05-17 07:01:41.440939	11	f	\N	\N	\N	\N
1383	1526376651	image/jpeg	193341	2018-05-15 09:30:51.392969	1062	Restaurant	2018-05-15 09:30:51.591462	2018-05-17 07:01:41.453511	11	f	\N	\N	\N	\N
1384	1526376653	image/jpeg	66923	2018-05-15 09:30:53.06719	1063	Restaurant	2018-05-15 09:30:53.187241	2018-05-17 07:01:41.467432	11	f	\N	\N	\N	\N
1385	1526376656	image/jpeg	196844	2018-05-15 09:30:55.979035	1064	Restaurant	2018-05-15 09:30:56.169218	2018-05-17 07:01:41.479914	11	f	\N	\N	\N	\N
1386	1526376668	image/jpeg	114539	2018-05-15 09:31:08.225042	1067	Restaurant	2018-05-15 09:31:08.357929	2018-05-17 07:01:41.493087	11	f	\N	\N	\N	\N
1387	1526376670	image/jpeg	109300	2018-05-15 09:31:10.034142	1068	Restaurant	2018-05-15 09:31:10.230346	2018-05-17 07:01:41.505244	11	f	\N	\N	\N	\N
1388	1526376671	image/jpeg	130339	2018-05-15 09:31:11.683812	1069	Restaurant	2018-05-15 09:31:11.825392	2018-05-17 07:01:41.519324	11	f	\N	\N	\N	\N
1389	1526376673	image/jpeg	91322	2018-05-15 09:31:13.717604	1070	Restaurant	2018-05-15 09:31:13.879787	2018-05-17 07:01:41.531682	11	f	\N	\N	\N	\N
1390	1526376675	image/jpeg	112427	2018-05-15 09:31:15.26367	1071	Restaurant	2018-05-15 09:31:15.404038	2018-05-17 07:01:41.545369	11	f	\N	\N	\N	\N
1392	1526376679	image/jpeg	115286	2018-05-15 09:31:19.384811	1073	Restaurant	2018-05-15 09:31:19.51115	2018-05-17 07:01:41.649114	11	f	\N	\N	\N	\N
1393	1526376681	image/jpeg	91146	2018-05-15 09:31:21.229081	1074	Restaurant	2018-05-15 09:31:21.443262	2018-05-17 07:01:41.662688	11	f	\N	\N	\N	\N
1394	1526376683	image/jpeg	138601	2018-05-15 09:31:22.939881	1075	Restaurant	2018-05-15 09:31:23.082047	2018-05-17 07:01:41.675013	11	f	\N	\N	\N	\N
1395	1526376684	image/jpeg	82212	2018-05-15 09:31:24.321327	1076	Restaurant	2018-05-15 09:31:24.441209	2018-05-17 07:01:41.688826	11	f	\N	\N	\N	\N
1396	1526376686	image/jpeg	139083	2018-05-15 09:31:25.97718	1077	Restaurant	2018-05-15 09:31:26.098751	2018-05-17 07:01:41.70116	11	f	\N	\N	\N	\N
1397	1526376688	image/jpeg	92796	2018-05-15 09:31:28.265227	1078	Restaurant	2018-05-15 09:31:28.389327	2018-05-17 07:01:41.715407	11	f	\N	\N	\N	\N
1398	1526376690	image/jpeg	136996	2018-05-15 09:31:29.91378	1079	Restaurant	2018-05-15 09:31:30.05558	2018-05-17 07:01:41.727216	11	f	\N	\N	\N	\N
1399	1526376691	image/jpeg	149061	2018-05-15 09:31:31.60755	1080	Restaurant	2018-05-15 09:31:31.832021	2018-05-17 07:01:41.740856	11	f	\N	\N	\N	\N
1401	1526376696	image/jpeg	90289	2018-05-15 09:31:36.254979	1082	Restaurant	2018-05-15 09:31:36.376896	2018-05-17 07:01:41.766901	11	f	\N	\N	\N	\N
1402	1526376698	image/jpeg	67449	2018-05-15 09:31:37.981887	1083	Restaurant	2018-05-15 09:31:38.104417	2018-05-17 07:01:41.779543	11	f	\N	\N	\N	\N
1403	1526376699	image/jpeg	119568	2018-05-15 09:31:39.695812	1084	Restaurant	2018-05-15 09:31:39.861286	2018-05-17 07:01:41.793024	11	f	\N	\N	\N	\N
1404	1526376701	image/jpeg	72857	2018-05-15 09:31:41.380577	1085	Restaurant	2018-05-15 09:31:41.495973	2018-05-17 07:01:41.805384	11	f	\N	\N	\N	\N
1405	1526376703	image/jpeg	158173	2018-05-15 09:31:43.02136	1086	Restaurant	2018-05-15 09:31:43.182132	2018-05-17 07:01:41.819612	11	f	\N	\N	\N	\N
1406	1526376704	image/jpeg	95192	2018-05-15 09:31:44.798424	1087	Restaurant	2018-05-15 09:31:44.917073	2018-05-17 07:01:41.831658	11	f	\N	\N	\N	\N
1407	1526376707	image/jpeg	73492	2018-05-15 09:31:46.982496	1089	Restaurant	2018-05-15 09:31:47.103997	2018-05-17 07:01:41.845319	11	f	\N	\N	\N	\N
1408	1526376709	image/jpeg	106578	2018-05-15 09:31:49.168093	1090	Restaurant	2018-05-15 09:31:49.335707	2018-05-17 07:01:41.857542	11	f	\N	\N	\N	\N
1409	1526376711	image/jpeg	116518	2018-05-15 09:31:51.192001	1091	Restaurant	2018-05-15 09:31:51.304983	2018-05-17 07:01:41.870986	11	f	\N	\N	\N	\N
1410	1526376713	image/jpeg	88365	2018-05-15 09:31:53.34241	1092	Restaurant	2018-05-15 09:31:53.501955	2018-05-17 07:01:41.883743	11	f	\N	\N	\N	\N
1411	1526376716	image/jpeg	79977	2018-05-15 09:31:56.514832	1094	Restaurant	2018-05-15 09:31:56.64397	2018-05-17 07:01:41.897315	11	f	\N	\N	\N	\N
1412	1526376719	image/jpeg	138436	2018-05-15 09:31:59.051513	1095	Restaurant	2018-05-15 09:31:59.180279	2018-05-17 07:01:41.909427	11	f	\N	\N	\N	\N
1413	1526376721	image/jpeg	107010	2018-05-15 09:32:01.66194	1096	Restaurant	2018-05-15 09:32:01.778769	2018-05-17 07:01:41.922947	11	f	\N	\N	\N	\N
1415	1526376726	image/jpeg	143066	2018-05-15 09:32:06.165093	1099	Restaurant	2018-05-15 09:32:06.315359	2018-05-17 07:01:41.949314	11	f	\N	\N	\N	\N
1416	1526376727	image/jpeg	180424	2018-05-15 09:32:07.779466	1100	Restaurant	2018-05-15 09:32:07.933293	2018-05-17 07:01:41.961423	11	f	\N	\N	\N	\N
1417	1526376729	image/jpeg	47203	2018-05-15 09:32:09.678756	1101	Restaurant	2018-05-15 09:32:09.796843	2018-05-17 07:01:41.97379	11	f	\N	\N	\N	\N
1418	1526376732	image/jpeg	124036	2018-05-15 09:32:12.058939	1103	Restaurant	2018-05-15 09:32:12.285145	2018-05-17 07:01:41.987606	11	f	\N	\N	\N	\N
1419	1526376734	image/jpeg	193863	2018-05-15 09:32:14.163326	1104	Restaurant	2018-05-15 09:32:14.433073	2018-05-17 07:01:42.00062	11	f	\N	\N	\N	\N
1420	1526376736	image/jpeg	78313	2018-05-15 09:32:16.068419	1105	Restaurant	2018-05-15 09:32:16.272505	2018-05-17 07:01:42.022103	11	f	\N	\N	\N	\N
1421	1526376738	image/jpeg	269034	2018-05-15 09:32:18.11562	1106	Restaurant	2018-05-15 09:32:18.32018	2018-05-17 07:01:42.035044	11	f	\N	\N	\N	\N
1422	1526376741	image/jpeg	145157	2018-05-15 09:32:20.887657	1107	Restaurant	2018-05-15 09:32:21.126312	2018-05-17 07:01:42.04833	11	f	\N	\N	\N	\N
1423	1526376743	image/jpeg	67075	2018-05-15 09:32:22.88318	1108	Restaurant	2018-05-15 09:32:23.074722	2018-05-17 07:01:42.060819	11	f	\N	\N	\N	\N
1424	1526376745	image/jpeg	94099	2018-05-15 09:32:24.893105	1109	Restaurant	2018-05-15 09:32:25.122357	2018-05-17 07:01:42.074283	11	f	\N	\N	\N	\N
1425	1526376747	image/jpeg	136317	2018-05-15 09:32:26.846267	1110	Restaurant	2018-05-15 09:32:27.145027	2018-05-17 07:01:42.086726	11	f	\N	\N	\N	\N
1426	1526376749	image/jpeg	94249	2018-05-15 09:32:28.880856	1111	Restaurant	2018-05-15 09:32:29.093861	2018-05-17 07:01:42.100806	11	f	\N	\N	\N	\N
1427	1526376751	image/jpeg	58624	2018-05-15 09:32:30.831408	1112	Restaurant	2018-05-15 09:32:31.032064	2018-05-17 07:01:42.11252	11	f	\N	\N	\N	\N
1429	1526376754	image/jpeg	32287	2018-05-15 09:32:34.717133	1114	Restaurant	2018-05-15 09:32:34.870789	2018-05-17 07:01:42.138563	11	f	\N	\N	\N	\N
1430	1526376756	image/jpeg	97072	2018-05-15 09:32:36.665995	1115	Restaurant	2018-05-15 09:32:36.868235	2018-05-17 07:01:42.15253	11	f	\N	\N	\N	\N
1431	1526376759	image/jpeg	101873	2018-05-15 09:32:38.87752	1116	Restaurant	2018-05-15 09:32:39.116571	2018-05-17 07:01:42.164825	11	f	\N	\N	\N	\N
1432	1526376761	image/jpeg	218988	2018-05-15 09:32:41.290218	1117	Restaurant	2018-05-15 09:32:41.51403	2018-05-17 07:01:42.178514	11	f	\N	\N	\N	\N
1433	1526376763	image/jpeg	52048	2018-05-15 09:32:43.109211	1118	Restaurant	2018-05-15 09:32:43.311777	2018-05-17 07:01:42.19056	11	f	\N	\N	\N	\N
1434	1526376765	image/jpeg	157678	2018-05-15 09:32:45.012105	1119	Restaurant	2018-05-15 09:32:45.218627	2018-05-17 07:01:42.204302	11	f	\N	\N	\N	\N
1435	1526376766	image/jpeg	31228	2018-05-15 09:32:46.760824	1120	Restaurant	2018-05-15 09:32:46.983932	2018-05-17 07:01:42.216892	11	f	\N	\N	\N	\N
1436	1526376769	image/jpeg	103696	2018-05-15 09:32:48.950477	1121	Restaurant	2018-05-15 09:32:49.164852	2018-05-17 07:01:42.230689	11	f	\N	\N	\N	\N
1437	1526376771	image/jpeg	113323	2018-05-15 09:32:50.991227	1122	Restaurant	2018-05-15 09:32:51.212146	2018-05-17 07:01:42.242591	11	f	\N	\N	\N	\N
1438	1526376773	image/jpeg	79579	2018-05-15 09:32:53.037874	1123	Restaurant	2018-05-15 09:32:53.301967	2018-05-17 07:01:42.256347	11	f	\N	\N	\N	\N
1439	1526376783	image/jpeg	112023	2018-05-15 09:33:03.145735	1124	Restaurant	2018-05-15 09:33:03.392117	2018-05-17 07:01:42.269053	11	f	\N	\N	\N	\N
1440	1526376785	image/jpeg	112564	2018-05-15 09:33:05.44282	1125	Restaurant	2018-05-15 09:33:05.614814	2018-05-17 07:01:42.284394	11	f	\N	\N	\N	\N
1441	1526376787	image/jpeg	97286	2018-05-15 09:33:07.561641	1126	Restaurant	2018-05-15 09:33:07.770844	2018-05-17 07:01:42.296049	11	f	\N	\N	\N	\N
1443	1526376791	image/jpeg	94446	2018-05-15 09:33:11.52853	1128	Restaurant	2018-05-15 09:33:11.716919	2018-05-17 07:01:42.321247	11	f	\N	\N	\N	\N
1444	1526376793	image/jpeg	133988	2018-05-15 09:33:13.565156	1129	Restaurant	2018-05-15 09:33:13.773749	2018-05-17 07:01:42.333546	11	f	\N	\N	\N	\N
1445	1526376795	image/jpeg	166346	2018-05-15 09:33:15.500501	1130	Restaurant	2018-05-15 09:33:15.737256	2018-05-17 07:01:42.346313	11	f	\N	\N	\N	\N
1446	1526376798	image/jpeg	273799	2018-05-15 09:33:17.795798	1131	Restaurant	2018-05-15 09:33:18.019039	2018-05-17 07:01:42.358114	11	f	\N	\N	\N	\N
1447	1526376799	image/jpeg	81226	2018-05-15 09:33:19.486872	1132	Restaurant	2018-05-15 09:33:19.667202	2018-05-17 07:01:42.371236	11	f	\N	\N	\N	\N
1448	1526376802	image/jpeg	148640	2018-05-15 09:33:22.52284	1133	Restaurant	2018-05-15 09:33:22.747079	2018-05-17 07:01:42.383319	11	f	\N	\N	\N	\N
1449	1526376805	image/jpeg	134588	2018-05-15 09:33:25.119893	1134	Restaurant	2018-05-15 09:33:25.327837	2018-05-17 07:01:42.395003	11	f	\N	\N	\N	\N
1450	1526376807	image/jpeg	118496	2018-05-15 09:33:27.494286	1135	Restaurant	2018-05-15 09:33:27.766986	2018-05-17 07:01:42.407932	11	f	\N	\N	\N	\N
1451	1526376809	image/jpeg	103680	2018-05-15 09:33:29.712459	1136	Restaurant	2018-05-15 09:33:29.93153	2018-05-17 07:01:42.420142	11	f	\N	\N	\N	\N
1452	1526376811	image/jpeg	96679	2018-05-15 09:33:31.565572	1137	Restaurant	2018-05-15 09:33:31.838849	2018-05-17 07:01:42.433658	11	f	\N	\N	\N	\N
1453	1526376814	image/jpeg	127773	2018-05-15 09:33:34.306699	1138	Restaurant	2018-05-15 09:33:34.477038	2018-05-17 07:01:42.444825	11	f	\N	\N	\N	\N
1454	1526376818	image/jpeg	98441	2018-05-15 09:33:38.078022	1139	Restaurant	2018-05-15 09:33:38.28155	2018-05-17 07:01:42.457856	11	f	\N	\N	\N	\N
1455	1526376821	image/jpeg	89546	2018-05-15 09:33:41.244029	1140	Restaurant	2018-05-15 09:33:41.444873	2018-05-17 07:01:42.469904	11	f	\N	\N	\N	\N
1457	1526376828	image/jpeg	130036	2018-05-15 09:33:48.082185	1142	Restaurant	2018-05-15 09:33:48.287106	2018-05-17 07:01:42.495431	11	f	\N	\N	\N	\N
1458	1526376830	image/jpeg	51097	2018-05-15 09:33:50.140937	1143	Restaurant	2018-05-15 09:33:50.352657	2018-05-17 07:01:42.506782	11	f	\N	\N	\N	\N
1459	1526376832	image/jpeg	91645	2018-05-15 09:33:52.595543	1144	Restaurant	2018-05-15 09:33:52.866315	2018-05-17 07:01:42.520311	11	f	\N	\N	\N	\N
1460	1526376835	image/jpeg	186791	2018-05-15 09:33:54.77007	1145	Restaurant	2018-05-15 09:33:55.006001	2018-05-17 07:01:42.532398	11	f	\N	\N	\N	\N
1461	1526376837	image/jpeg	224463	2018-05-15 09:33:57.159916	1146	Restaurant	2018-05-15 09:33:57.395129	2018-05-17 07:01:42.545231	11	f	\N	\N	\N	\N
1462	1526376839	image/jpeg	88609	2018-05-15 09:33:59.60341	1147	Restaurant	2018-05-15 09:33:59.793541	2018-05-17 07:01:42.557155	11	f	\N	\N	\N	\N
1463	1526376843	image/jpeg	172694	2018-05-15 09:34:03.494663	1148	Restaurant	2018-05-15 09:34:03.722009	2018-05-17 07:01:42.568933	11	f	\N	\N	\N	\N
1464	1526376845	image/jpeg	162698	2018-05-15 09:34:05.723003	1149	Restaurant	2018-05-15 09:34:05.937373	2018-05-17 07:01:42.581886	11	f	\N	\N	\N	\N
1465	1526376848	image/jpeg	140359	2018-05-15 09:34:08.178925	1150	Restaurant	2018-05-15 09:34:08.383425	2018-05-17 07:01:42.594219	11	f	\N	\N	\N	\N
1467	1526376857	image/jpeg	75635	2018-05-15 09:34:17.171617	1156	Restaurant	2018-05-15 09:34:17.42495	2018-05-17 07:01:42.619184	11	f	\N	\N	\N	\N
1468	1526376860	image/jpeg	86984	2018-05-15 09:34:20.075693	1158	Restaurant	2018-05-15 09:34:20.255863	2018-05-17 07:01:42.632636	11	f	\N	\N	\N	\N
1469	1526376862	image/jpeg	64680	2018-05-15 09:34:22.218965	1159	Restaurant	2018-05-15 09:34:22.385536	2018-05-17 07:01:42.643729	11	f	\N	\N	\N	\N
1470	1526376864	image/jpeg	178160	2018-05-15 09:34:24.767864	1160	Restaurant	2018-05-15 09:34:24.958873	2018-05-17 07:01:42.656034	11	f	\N	\N	\N	\N
1471	1526376867	image/jpeg	281878	2018-05-15 09:34:27.224065	1161	Restaurant	2018-05-15 09:34:27.422868	2018-05-17 07:01:42.668972	11	f	\N	\N	\N	\N
1472	1526376870	image/jpeg	207888	2018-05-15 09:34:29.802884	1163	Restaurant	2018-05-15 09:34:30.020386	2018-05-17 07:01:42.6809	11	f	\N	\N	\N	\N
1473	1526376872	image/jpeg	60952	2018-05-15 09:34:32.061734	1164	Restaurant	2018-05-15 09:34:32.251547	2018-05-17 07:01:42.694723	11	f	\N	\N	\N	\N
1474	1526376875	image/jpeg	124758	2018-05-15 09:34:35.601389	1165	Restaurant	2018-05-15 09:34:35.822274	2018-05-17 07:01:42.705838	11	f	\N	\N	\N	\N
1476	1526376882	image/jpeg	111434	2018-05-15 09:34:42.212298	1168	Restaurant	2018-05-15 09:34:42.456939	2018-05-17 07:01:42.731267	11	f	\N	\N	\N	\N
1477	1526376886	image/jpeg	157990	2018-05-15 09:34:46.19544	1170	Restaurant	2018-05-15 09:34:46.51973	2018-05-17 07:01:42.743349	11	f	\N	\N	\N	\N
1478	1526376889	image/jpeg	87008	2018-05-15 09:34:49.210919	1171	Restaurant	2018-05-15 09:34:49.358957	2018-05-17 07:01:42.756146	11	f	\N	\N	\N	\N
1479	1526376892	image/jpeg	125940	2018-05-15 09:34:52.099866	1172	Restaurant	2018-05-15 09:34:52.280485	2018-05-17 07:01:42.768138	11	f	\N	\N	\N	\N
1480	1526376894	image/jpeg	125255	2018-05-15 09:34:54.591066	1174	Restaurant	2018-05-15 09:34:54.778081	2018-05-17 07:01:42.781146	11	f	\N	\N	\N	\N
1481	1526376896	image/jpeg	107208	2018-05-15 09:34:56.380362	1175	Restaurant	2018-05-15 09:34:56.567996	2018-05-17 07:01:42.793379	11	f	\N	\N	\N	\N
1482	1526376898	image/jpeg	84928	2018-05-15 09:34:58.2818	1176	Restaurant	2018-05-15 09:34:58.507641	2018-05-17 07:01:42.805996	11	f	\N	\N	\N	\N
1483	1526376900	image/jpeg	74710	2018-05-15 09:35:00.253466	1177	Restaurant	2018-05-15 09:35:00.505177	2018-05-17 07:01:42.817838	11	f	\N	\N	\N	\N
1484	1526376903	image/jpeg	132281	2018-05-15 09:35:03.033231	1178	Restaurant	2018-05-15 09:35:03.261626	2018-05-17 07:01:42.830045	11	f	\N	\N	\N	\N
1485	1526376905	image/jpeg	168123	2018-05-15 09:35:05.143431	1179	Restaurant	2018-05-15 09:35:05.317336	2018-05-17 07:01:42.842986	11	f	\N	\N	\N	\N
1486	1526376907	image/jpeg	98032	2018-05-15 09:35:07.535294	1180	Restaurant	2018-05-15 09:35:07.731633	2018-05-17 07:01:42.855052	11	f	\N	\N	\N	\N
1487	1526376909	image/jpeg	123492	2018-05-15 09:35:09.337828	1181	Restaurant	2018-05-15 09:35:09.546793	2018-05-17 07:01:42.868143	11	f	\N	\N	\N	\N
1488	1526376911	image/jpeg	156669	2018-05-15 09:35:11.707911	1182	Restaurant	2018-05-15 09:35:11.909653	2018-05-17 07:01:42.879965	11	f	\N	\N	\N	\N
1490	1526376916	image/jpeg	140030	2018-05-15 09:35:16.618171	1184	Restaurant	2018-05-15 09:35:16.780639	2018-05-17 07:01:42.904842	11	f	\N	\N	\N	\N
1491	1526376918	image/jpeg	75040	2018-05-15 09:35:18.808426	1185	Restaurant	2018-05-15 09:35:18.987905	2018-05-17 07:01:42.91672	11	f	\N	\N	\N	\N
1492	1526376921	image/jpeg	139153	2018-05-15 09:35:21.198156	1186	Restaurant	2018-05-15 09:35:21.391209	2018-05-17 07:01:42.930094	11	f	\N	\N	\N	\N
1493	1526376923	image/jpeg	164595	2018-05-15 09:35:23.053512	1187	Restaurant	2018-05-15 09:35:23.290203	2018-05-17 07:01:42.942147	11	f	\N	\N	\N	\N
1494	1526376938	image/jpeg	128415	2018-05-15 09:35:38.297087	1188	Restaurant	2018-05-15 09:35:38.499475	2018-05-17 07:01:42.955207	11	f	\N	\N	\N	\N
1495	1526376940	image/jpeg	211829	2018-05-15 09:35:40.142664	1189	Restaurant	2018-05-15 09:35:40.355377	2018-05-17 07:01:43.000491	11	f	\N	\N	\N	\N
1496	1526376942	image/jpeg	86378	2018-05-15 09:35:41.969461	1190	Restaurant	2018-05-15 09:35:42.145723	2018-05-17 07:01:43.012072	11	f	\N	\N	\N	\N
1497	1526376944	image/jpeg	97980	2018-05-15 09:35:44.320138	1191	Restaurant	2018-05-15 09:35:44.576505	2018-05-17 07:01:43.025607	11	f	\N	\N	\N	\N
1498	1526376947	image/jpeg	148530	2018-05-15 09:35:47.120056	1192	Restaurant	2018-05-15 09:35:47.349733	2018-05-17 07:01:43.036976	11	f	\N	\N	\N	\N
1499	1526376949	image/jpeg	124306	2018-05-15 09:35:48.908029	1193	Restaurant	2018-05-15 09:35:49.14637	2018-05-17 07:01:43.050099	11	f	\N	\N	\N	\N
1500	1526376951	image/jpeg	108134	2018-05-15 09:35:50.889295	1194	Restaurant	2018-05-15 09:35:51.10317	2018-05-17 07:01:43.062613	11	f	\N	\N	\N	\N
1501	1526376953	image/jpeg	82050	2018-05-15 09:35:52.772393	1195	Restaurant	2018-05-15 09:35:53.010255	2018-05-17 07:01:43.075311	11	f	\N	\N	\N	\N
1502	1526376955	image/jpeg	167712	2018-05-15 09:35:54.870339	1196	Restaurant	2018-05-15 09:35:55.08296	2018-05-17 07:01:43.087044	11	f	\N	\N	\N	\N
1504	1526376959	image/jpeg	29716	2018-05-15 09:35:59.18001	1198	Restaurant	2018-05-15 09:35:59.402725	2018-05-17 07:01:43.112133	11	f	\N	\N	\N	\N
1505	1526376962	image/jpeg	236464	2018-05-15 09:36:01.779952	1200	Restaurant	2018-05-15 09:36:02.042583	2018-05-17 07:01:43.12414	11	f	\N	\N	\N	\N
1506	1526376964	image/jpeg	187846	2018-05-15 09:36:03.88885	1201	Restaurant	2018-05-15 09:36:04.089375	2018-05-17 07:01:43.137545	11	f	\N	\N	\N	\N
1507	1526376966	image/jpeg	176269	2018-05-15 09:36:05.922069	1202	Restaurant	2018-05-15 09:36:06.203526	2018-05-17 07:01:43.149389	11	f	\N	\N	\N	\N
1508	1526376968	image/jpeg	81726	2018-05-15 09:36:08.194352	1203	Restaurant	2018-05-15 09:36:08.434561	2018-05-17 07:01:43.162565	11	f	\N	\N	\N	\N
1509	1526376971	image/jpeg	87275	2018-05-15 09:36:10.867778	1204	Restaurant	2018-05-15 09:36:11.058059	2018-05-17 07:01:43.173826	11	f	\N	\N	\N	\N
1510	1526376973	image/jpeg	147818	2018-05-15 09:36:12.797193	1205	Restaurant	2018-05-15 09:36:13.005645	2018-05-17 07:01:43.185997	11	f	\N	\N	\N	\N
1511	1526376975	image/jpeg	182580	2018-05-15 09:36:15.157941	1207	Restaurant	2018-05-15 09:36:15.428031	2018-05-17 07:01:43.199723	11	f	\N	\N	\N	\N
1512	1526376978	image/jpeg	114941	2018-05-15 09:36:17.95464	1208	Restaurant	2018-05-15 09:36:18.141372	2018-05-17 07:01:43.2109	11	f	\N	\N	\N	\N
1513	1526376980	image/jpeg	81744	2018-05-15 09:36:20.116896	1209	Restaurant	2018-05-15 09:36:20.296947	2018-05-17 07:01:43.224346	11	f	\N	\N	\N	\N
1514	1526376982	image/jpeg	109737	2018-05-15 09:36:22.249395	1210	Restaurant	2018-05-15 09:36:22.436981	2018-05-17 07:01:43.236065	11	f	\N	\N	\N	\N
1515	1526376985	image/jpeg	85219	2018-05-15 09:36:24.925395	1212	Restaurant	2018-05-15 09:36:25.142229	2018-05-17 07:01:43.249256	11	f	\N	\N	\N	\N
1516	1526376987	image/jpeg	130285	2018-05-15 09:36:26.938524	1213	Restaurant	2018-05-15 09:36:27.182265	2018-05-17 07:01:43.261773	11	f	\N	\N	\N	\N
1518	1526376992	image/jpeg	111401	2018-05-15 09:36:32.123367	1217	Restaurant	2018-05-15 09:36:32.309814	2018-05-17 07:01:43.286	11	f	\N	\N	\N	\N
1519	1526376994	image/jpeg	79004	2018-05-15 09:36:34.043132	1218	Restaurant	2018-05-15 09:36:34.24996	2018-05-17 07:01:43.298144	11	f	\N	\N	\N	\N
1520	1526376997	image/jpeg	96049	2018-05-15 09:36:37.297183	1220	Restaurant	2018-05-15 09:36:37.479603	2018-05-17 07:01:43.31117	11	f	\N	\N	\N	\N
1521	1526377002	image/jpeg	116726	2018-05-15 09:36:42.277346	1221	Restaurant	2018-05-15 09:36:42.449381	2018-05-17 07:01:43.322861	11	f	\N	\N	\N	\N
1522	1526377004	image/jpeg	152677	2018-05-15 09:36:44.482468	1222	Restaurant	2018-05-15 09:36:44.671734	2018-05-17 07:01:43.336362	11	f	\N	\N	\N	\N
1523	1526377007	image/jpeg	137383	2018-05-15 09:36:46.766914	1223	Restaurant	2018-05-15 09:36:47.095135	2018-05-17 07:01:43.347976	11	f	\N	\N	\N	\N
1524	1526377009	image/jpeg	64404	2018-05-15 09:36:48.880696	1224	Restaurant	2018-05-15 09:36:49.100317	2018-05-17 07:01:43.360797	11	f	\N	\N	\N	\N
1525	1526377012	image/png	56278	2018-05-15 09:36:51.891158	1226	Restaurant	2018-05-15 09:36:52.097316	2018-05-17 07:01:43.381355	11	f	\N	\N	\N	\N
1526	1526377014	image/jpeg	135773	2018-05-15 09:36:54.62793	1227	Restaurant	2018-05-15 09:36:54.811352	2018-05-17 07:01:43.393426	11	f	\N	\N	\N	\N
1527	1526377016	image/jpeg	167211	2018-05-15 09:36:56.60217	1228	Restaurant	2018-05-15 09:36:56.802052	2018-05-17 07:01:43.406919	11	f	\N	\N	\N	\N
1528	1526377018	image/jpeg	105028	2018-05-15 09:36:58.700404	1229	Restaurant	2018-05-15 09:36:58.915701	2018-05-17 07:01:43.418535	11	f	\N	\N	\N	\N
1529	1526377021	image/jpeg	282406	2018-05-15 09:37:01.215753	1230	Restaurant	2018-05-15 09:37:01.43812	2018-05-17 07:01:43.431823	11	f	\N	\N	\N	\N
1530	1526377024	image/jpeg	85018	2018-05-15 09:37:04.147726	1232	Restaurant	2018-05-15 09:37:04.326465	2018-05-17 07:01:43.443563	11	f	\N	\N	\N	\N
1532	1526377029	image/jpeg	224943	2018-05-15 09:37:09.11805	1235	Restaurant	2018-05-15 09:37:09.347527	2018-05-17 07:01:43.468446	11	f	\N	\N	\N	\N
1533	1526377031	image/jpeg	135626	2018-05-15 09:37:11.131291	1236	Restaurant	2018-05-15 09:37:11.41927	2018-05-17 07:01:43.480689	11	f	\N	\N	\N	\N
1534	1526377034	image/jpeg	108646	2018-05-15 09:37:14.241728	1238	Restaurant	2018-05-15 09:37:14.532226	2018-05-17 07:01:43.493675	11	f	\N	\N	\N	\N
1535	1526377037	image/jpeg	137452	2018-05-15 09:37:17.044027	1240	Restaurant	2018-05-15 09:37:17.246532	2018-05-17 07:01:43.514156	11	f	\N	\N	\N	\N
1536	1526377039	image/jpeg	99748	2018-05-15 09:37:19.119334	1241	Restaurant	2018-05-15 09:37:19.312056	2018-05-17 07:01:43.525667	11	f	\N	\N	\N	\N
1537	1526377042	image/jpeg	88437	2018-05-15 09:37:21.591923	1242	Restaurant	2018-05-15 09:37:22.033218	2018-05-17 07:01:43.539052	11	f	\N	\N	\N	\N
1538	1526377044	image/jpeg	124603	2018-05-15 09:37:24.348262	1243	Restaurant	2018-05-15 09:37:24.546535	2018-05-17 07:01:43.550695	11	f	\N	\N	\N	\N
1539	1526377046	image/jpeg	99848	2018-05-15 09:37:26.165734	1244	Restaurant	2018-05-15 09:37:26.338002	2018-05-17 07:01:43.563864	11	f	\N	\N	\N	\N
1540	1526377048	image/jpeg	137796	2018-05-15 09:37:28.352847	1245	Restaurant	2018-05-15 09:37:28.576541	2018-05-17 07:01:43.575415	11	f	\N	\N	\N	\N
1542	1526377053	image/png	565586	2018-05-15 09:37:33.396433	1247	Restaurant	2018-05-15 09:37:33.663678	2018-05-17 07:01:43.600745	11	f	\N	\N	\N	\N
1543	1526377059	image/jpeg	169741	2018-05-15 09:37:39.677021	1248	Restaurant	2018-05-15 09:37:39.981209	2018-05-17 07:01:43.612659	11	f	\N	\N	\N	\N
1544	1526377061	image/jpeg	80517	2018-05-15 09:37:41.628323	1249	Restaurant	2018-05-15 09:37:41.836972	2018-05-17 07:01:43.62615	11	f	\N	\N	\N	\N
1545	1526377064	image/jpeg	130790	2018-05-15 09:37:44.116517	1251	Restaurant	2018-05-15 09:37:44.246683	2018-05-17 07:01:43.637631	11	f	\N	\N	\N	\N
1546	1526377065	image/jpeg	44775	2018-05-15 09:37:45.647983	1252	Restaurant	2018-05-15 09:37:45.763308	2018-05-17 07:01:43.650782	11	f	\N	\N	\N	\N
1547	1526377067	image/jpeg	203066	2018-05-15 09:37:47.558043	1253	Restaurant	2018-05-15 09:37:47.739197	2018-05-17 07:01:43.6626	11	f	\N	\N	\N	\N
1548	1526377071	image/jpeg	171096	2018-05-15 09:37:51.262674	1255	Restaurant	2018-05-15 09:37:51.950912	2018-05-17 07:01:43.675672	11	f	\N	\N	\N	\N
1549	1526377076	image/jpeg	150884	2018-05-15 09:37:56.189926	1256	Restaurant	2018-05-15 09:37:56.366069	2018-05-17 07:01:43.687416	11	f	\N	\N	\N	\N
1551	1526377081	image/jpeg	82859	2018-05-15 09:38:00.916072	1258	Restaurant	2018-05-15 09:38:01.054308	2018-05-17 07:01:43.714975	11	f	\N	\N	\N	\N
1552	1526377084	image/jpeg	76076	2018-05-15 09:38:04.167844	1259	Restaurant	2018-05-15 09:38:04.306284	2018-05-17 07:01:43.726133	11	f	\N	\N	\N	\N
1553	1526377086	image/jpeg	39057	2018-05-15 09:38:06.127452	1260	Restaurant	2018-05-15 09:38:06.241879	2018-05-17 07:01:43.739294	11	f	\N	\N	\N	\N
1554	1526377088	image/jpeg	167433	2018-05-15 09:38:08.036575	1261	Restaurant	2018-05-15 09:38:08.175689	2018-05-17 07:01:43.751299	11	f	\N	\N	\N	\N
1555	1526377091	image/jpeg	152531	2018-05-15 09:38:11.369279	1264	Restaurant	2018-05-15 09:38:11.519907	2018-05-17 07:01:43.764383	11	f	\N	\N	\N	\N
1556	1526377094	image/jpeg	127528	2018-05-15 09:38:13.919139	1266	Restaurant	2018-05-15 09:38:14.064188	2018-05-17 07:01:43.776537	11	f	\N	\N	\N	\N
1557	1526377096	image/jpeg	150064	2018-05-15 09:38:16.521141	1267	Restaurant	2018-05-15 09:38:16.673446	2018-05-17 07:01:43.788221	11	f	\N	\N	\N	\N
1558	1526377099	image/jpeg	59328	2018-05-15 09:38:19.345191	1270	Restaurant	2018-05-15 09:38:19.476009	2018-05-17 07:01:43.801564	11	f	\N	\N	\N	\N
1559	1526377102	image/jpeg	136761	2018-05-15 09:38:22.15028	1271	Restaurant	2018-05-15 09:38:22.656334	2018-05-17 07:01:43.813583	11	f	\N	\N	\N	\N
1560	1526377105	image/jpeg	103351	2018-05-15 09:38:25.560878	1272	Restaurant	2018-05-15 09:38:25.688895	2018-05-17 07:01:43.826294	11	f	\N	\N	\N	\N
1561	1526377108	image/png	374768	2018-05-15 09:38:28.045699	1273	Restaurant	2018-05-15 09:38:28.230276	2018-05-17 07:01:43.838376	11	f	\N	\N	\N	\N
1562	1526377111	image/jpeg	168442	2018-05-15 09:38:31.068539	1274	Restaurant	2018-05-15 09:38:31.22976	2018-05-17 07:01:43.851293	11	f	\N	\N	\N	\N
1563	1526377113	image/jpeg	107548	2018-05-15 09:38:33.650407	1275	Restaurant	2018-05-15 09:38:33.822472	2018-05-17 07:01:43.863237	11	f	\N	\N	\N	\N
1565	1526377124	image/jpeg	130550	2018-05-15 09:38:44.549794	1278	Restaurant	2018-05-15 09:38:44.669055	2018-05-17 07:01:43.888196	11	f	\N	\N	\N	\N
1566	1526377126	image/jpeg	159929	2018-05-15 09:38:46.779665	1279	Restaurant	2018-05-15 09:38:46.953527	2018-05-17 07:01:43.90048	11	f	\N	\N	\N	\N
1567	1526377129	image/jpeg	107943	2018-05-15 09:38:49.22759	1280	Restaurant	2018-05-15 09:38:49.339026	2018-05-17 07:01:43.914049	11	f	\N	\N	\N	\N
1568	1526377131	image/jpeg	219126	2018-05-15 09:38:51.226837	1281	Restaurant	2018-05-15 09:38:51.436108	2018-05-17 07:01:43.926196	11	f	\N	\N	\N	\N
1569	1526377133	image/jpeg	86882	2018-05-15 09:38:53.394219	1282	Restaurant	2018-05-15 09:38:53.511585	2018-05-17 07:01:43.938584	11	f	\N	\N	\N	\N
1570	1526377135	image/jpeg	77856	2018-05-15 09:38:55.380923	1283	Restaurant	2018-05-15 09:38:55.499119	2018-05-17 07:01:43.950217	11	f	\N	\N	\N	\N
1571	1526377137	image/jpeg	86451	2018-05-15 09:38:57.125629	1284	Restaurant	2018-05-15 09:38:57.236303	2018-05-17 07:01:43.962041	11	f	\N	\N	\N	\N
1572	1526377138	image/jpeg	127278	2018-05-15 09:38:58.783233	1285	Restaurant	2018-05-15 09:38:58.908707	2018-05-17 07:01:43.975273	11	f	\N	\N	\N	\N
1573	1526377140	image/jpeg	119413	2018-05-15 09:39:00.779628	1286	Restaurant	2018-05-15 09:39:00.898907	2018-05-17 07:01:43.986964	11	f	\N	\N	\N	\N
1574	1526377142	image/jpeg	218069	2018-05-15 09:39:02.655684	1287	Restaurant	2018-05-15 09:39:02.830633	2018-05-17 07:01:44.000336	11	f	\N	\N	\N	\N
1575	1526377144	image/jpeg	30560	2018-05-15 09:39:04.496544	1288	Restaurant	2018-05-15 09:39:04.642307	2018-05-17 07:01:44.012693	11	f	\N	\N	\N	\N
1576	1526377146	image/jpeg	161068	2018-05-15 09:39:06.831117	1289	Restaurant	2018-05-15 09:39:06.958009	2018-05-17 07:01:44.025217	11	f	\N	\N	\N	\N
1577	1526377151	image/jpeg	132132	2018-05-15 09:39:11.204447	1292	Restaurant	2018-05-15 09:39:11.382622	2018-05-17 07:01:44.03741	11	f	\N	\N	\N	\N
1579	1526377157	image/jpeg	86034	2018-05-15 09:39:17.757788	1294	Restaurant	2018-05-15 09:39:17.879224	2018-05-17 07:01:44.062668	11	f	\N	\N	\N	\N
1580	1526377160	image/jpeg	126609	2018-05-15 09:39:20.389125	1295	Restaurant	2018-05-15 09:39:20.509784	2018-05-17 07:01:44.074323	11	f	\N	\N	\N	\N
1581	1526377163	image/jpeg	92323	2018-05-15 09:39:22.998761	1296	Restaurant	2018-05-15 09:39:23.115387	2018-05-17 07:01:44.087281	11	f	\N	\N	\N	\N
1582	1526377165	image/jpeg	46428	2018-05-15 09:39:25.176187	1297	Restaurant	2018-05-15 09:39:25.301338	2018-05-17 07:01:44.098955	11	f	\N	\N	\N	\N
1583	1526377168	image/jpeg	112743	2018-05-15 09:39:28.08831	1298	Restaurant	2018-05-15 09:39:28.219096	2018-05-17 07:01:44.111356	11	f	\N	\N	\N	\N
1584	1526377171	image/jpeg	171554	2018-05-15 09:39:31.045578	1299	Restaurant	2018-05-15 09:39:31.208373	2018-05-17 07:01:44.124498	11	f	\N	\N	\N	\N
1585	1526377175	image/jpeg	64445	2018-05-15 09:39:35.546346	1302	Restaurant	2018-05-15 09:39:35.666521	2018-05-17 07:01:44.136235	11	f	\N	\N	\N	\N
1586	1526377178	image/jpeg	118229	2018-05-15 09:39:37.940919	1303	Restaurant	2018-05-15 09:39:38.051815	2018-05-17 07:01:44.149183	11	f	\N	\N	\N	\N
1587	1526377180	image/jpeg	66319	2018-05-15 09:39:40.140122	1304	Restaurant	2018-05-15 09:39:40.254238	2018-05-17 07:01:44.161147	11	f	\N	\N	\N	\N
1588	1526377183	image/jpeg	190082	2018-05-15 09:39:42.824169	1305	Restaurant	2018-05-15 09:39:43.008417	2018-05-17 07:01:44.174351	11	f	\N	\N	\N	\N
1589	1526377186	image/jpeg	117798	2018-05-15 09:39:46.411184	1306	Restaurant	2018-05-15 09:39:46.577529	2018-05-17 07:01:44.185775	11	f	\N	\N	\N	\N
1590	1526377197	image/jpeg	92266	2018-05-15 09:39:57.575414	1307	Restaurant	2018-05-15 09:39:57.669906	2018-05-17 07:01:44.197759	11	f	\N	\N	\N	\N
1591	1526377200	image/jpeg	131363	2018-05-15 09:40:00.133641	1308	Restaurant	2018-05-15 09:40:00.247344	2018-05-17 07:01:44.211295	11	f	\N	\N	\N	\N
1593	1526377205	image/jpeg	93552	2018-05-15 09:40:05.379772	1310	Restaurant	2018-05-15 09:40:05.482054	2018-05-17 07:01:44.235966	11	f	\N	\N	\N	\N
1594	1526377208	image/jpeg	114857	2018-05-15 09:40:08.264945	1311	Restaurant	2018-05-15 09:40:08.392443	2018-05-17 07:01:44.248328	11	f	\N	\N	\N	\N
1595	1526377210	image/jpeg	94546	2018-05-15 09:40:10.229367	1312	Restaurant	2018-05-15 09:40:10.320513	2018-05-17 07:01:44.261072	11	f	\N	\N	\N	\N
1596	1526377212	image/jpeg	151047	2018-05-15 09:40:12.39777	1313	Restaurant	2018-05-15 09:40:12.536448	2018-05-17 07:01:44.273145	11	f	\N	\N	\N	\N
1597	1526377215	image/jpeg	169945	2018-05-15 09:40:14.853357	1314	Restaurant	2018-05-15 09:40:15.006787	2018-05-17 07:01:44.285213	11	f	\N	\N	\N	\N
1598	1526377217	image/jpeg	98728	2018-05-15 09:40:17.205003	1315	Restaurant	2018-05-15 09:40:17.317089	2018-05-17 07:01:44.298105	11	f	\N	\N	\N	\N
1599	1526377219	image/jpeg	73235	2018-05-15 09:40:19.65526	1316	Restaurant	2018-05-15 09:40:19.770921	2018-05-17 07:01:44.311188	11	f	\N	\N	\N	\N
1600	1526377222	image/jpeg	112163	2018-05-15 09:40:21.950025	1317	Restaurant	2018-05-15 09:40:22.073805	2018-05-17 07:01:44.331481	11	f	\N	\N	\N	\N
1601	1526377224	image/jpeg	171906	2018-05-15 09:40:24.285418	1318	Restaurant	2018-05-15 09:40:24.433572	2018-05-17 07:01:44.344171	11	f	\N	\N	\N	\N
1605	1526377233	image/jpeg	177328	2018-05-15 09:40:32.982127	1322	Restaurant	2018-05-15 09:40:33.167475	2018-05-17 07:01:44.394494	11	f	\N	\N	\N	\N
1607	1526377238	image/jpeg	148200	2018-05-15 09:40:38.271366	1324	Restaurant	2018-05-15 09:40:38.442328	2018-05-17 07:01:44.418214	11	f	\N	\N	\N	\N
1608	1526377241	image/jpeg	120647	2018-05-15 09:40:40.890061	1325	Restaurant	2018-05-15 09:40:41.049041	2018-05-17 07:01:44.430005	11	f	\N	\N	\N	\N
1609	1526377244	image/jpeg	148620	2018-05-15 09:40:44.084519	1326	Restaurant	2018-05-15 09:40:44.222383	2018-05-17 07:01:44.44439	11	f	\N	\N	\N	\N
1610	1526377246	image/jpeg	298219	2018-05-15 09:40:46.810711	1327	Restaurant	2018-05-15 09:40:46.993143	2018-05-17 07:01:44.455084	11	f	\N	\N	\N	\N
1611	1526377249	image/jpeg	161951	2018-05-15 09:40:49.154145	1328	Restaurant	2018-05-15 09:40:49.322098	2018-05-17 07:01:44.466993	11	f	\N	\N	\N	\N
1612	1526377251	image/jpeg	133533	2018-05-15 09:40:51.171795	1329	Restaurant	2018-05-15 09:40:51.283673	2018-05-17 07:01:44.480879	11	f	\N	\N	\N	\N
1613	1526377253	image/jpeg	82992	2018-05-15 09:40:53.205864	1330	Restaurant	2018-05-15 09:40:53.32587	2018-05-17 07:01:44.492116	11	f	\N	\N	\N	\N
1614	1526377255	image/jpeg	92857	2018-05-15 09:40:55.767586	1331	Restaurant	2018-05-15 09:40:55.90657	2018-05-17 07:01:44.505428	11	f	\N	\N	\N	\N
1615	1526377258	image/jpeg	99893	2018-05-15 09:40:57.974295	1332	Restaurant	2018-05-15 09:40:58.088853	2018-05-17 07:01:44.516944	11	f	\N	\N	\N	\N
1616	1526377260	image/jpeg	176160	2018-05-15 09:41:00.151293	1333	Restaurant	2018-05-15 09:41:00.321863	2018-05-17 07:01:44.530185	11	f	\N	\N	\N	\N
1617	1526377264	image/jpeg	81700	2018-05-15 09:41:04.109356	1334	Restaurant	2018-05-15 09:41:04.235269	2018-05-17 07:01:44.54374	11	f	\N	\N	\N	\N
1618	1526377267	image/jpeg	93791	2018-05-15 09:41:07.569418	1335	Restaurant	2018-05-15 09:41:07.674905	2018-05-17 07:01:44.562223	11	f	\N	\N	\N	\N
1619	1526377269	image/jpeg	102636	2018-05-15 09:41:09.799124	1336	Restaurant	2018-05-15 09:41:09.915615	2018-05-17 07:01:44.576697	11	f	\N	\N	\N	\N
1620	1526377274	image/jpeg	123512	2018-05-15 09:41:13.67499	1337	Restaurant	2018-05-15 09:41:14.013104	2018-05-17 07:01:44.595834	11	f	\N	\N	\N	\N
1603	Dhum_Biryani.jpg	image/jpeg	213888	2019-06-17 12:14:09.521276	434	Dish	2018-05-15 09:40:28.601291	2019-06-17 12:14:09.720725	11	f	\N	\N	\N	\N
1604	chicken.jpg	image/jpeg	86119	2019-06-18 09:40:01.231046	345	Dish	2018-05-15 09:40:30.844054	2019-06-18 09:40:48.204985	11	f	\N	\N	\N	\N
1621	1526377276	image/jpeg	76978	2018-05-15 09:41:16.485997	1338	Restaurant	2018-05-15 09:41:16.604863	2018-05-17 07:01:44.61006	11	f	\N	\N	\N	\N
1622	1526377279	image/jpeg	137181	2018-05-15 09:41:19.369917	1339	Restaurant	2018-05-15 09:41:19.494094	2018-05-17 07:01:44.628969	11	f	\N	\N	\N	\N
858	1525842811	image/jpeg	114590	2018-05-09 05:13:31.755031	488	Restaurant	2018-05-09 05:13:31.98489	2018-05-17 07:01:31.799257	11	f	\N	\N	\N	\N
867	1525842834	image/jpeg	170530	2018-05-09 05:13:54.540418	498	Restaurant	2018-05-09 05:13:54.719859	2018-05-17 07:01:32.055356	11	f	\N	\N	\N	\N
881	1525842869	image/jpeg	96910	2018-05-09 05:14:29.085051	516	Restaurant	2018-05-09 05:14:29.27452	2018-05-17 07:01:32.23468	11	f	\N	\N	\N	\N
895	1525842904	image/jpeg	133472	2018-05-09 05:15:04.400505	532	Restaurant	2018-05-09 05:15:04.613828	2018-05-17 07:01:32.408004	11	f	\N	\N	\N	\N
909	1525843043	image/jpeg	109889	2018-05-09 05:17:23.287734	547	Restaurant	2018-05-09 05:17:23.485575	2018-05-17 07:01:32.58226	11	f	\N	\N	\N	\N
923	1525843076	image/jpeg	112921	2018-05-09 05:17:56.435786	561	Restaurant	2018-05-09 05:17:56.567494	2018-05-17 07:01:32.75653	11	f	\N	\N	\N	\N
958	1525843257	image/jpeg	101914	2018-05-09 05:20:57.794273	601	Restaurant	2018-05-09 05:20:57.898484	2018-05-17 07:01:33.135796	11	f	\N	\N	\N	\N
972	1525843288	image/jpeg	97496	2018-05-09 05:21:28.20186	615	Restaurant	2018-05-09 05:21:28.319464	2018-05-17 07:01:33.323579	11	f	\N	\N	\N	\N
986	1525843320	image/jpeg	44110	2018-05-09 05:22:00.243171	629	Restaurant	2018-05-09 05:22:00.345006	2018-05-17 07:01:33.505883	11	f	\N	\N	\N	\N
1000	1525843357	image/jpeg	110903	2018-05-09 05:22:37.725672	645	Restaurant	2018-05-09 05:22:37.835895	2018-05-17 07:01:33.717582	11	f	\N	\N	\N	\N
682	open-uri20180509-8006-1d108zm	image/jpeg	139656	2018-05-09 04:05:17.657044	221	Dish	2018-05-09 04:05:17.897758	2018-05-17 07:01:34.120516	11	f	\N	\N	\N	\N
698	open-uri20180509-8006-1g5ue5d	image/jpeg	148800	2018-05-09 04:05:42.606743	237	Dish	2018-05-09 04:05:42.854645	2018-05-17 07:01:34.337123	11	f	\N	\N	\N	\N
714	open-uri20180509-8006-10kiqot	image/jpeg	104042	2018-05-09 04:06:13.61388	253	Dish	2018-05-09 04:06:13.727152	2018-05-17 07:01:34.544544	11	f	\N	\N	\N	\N
727	open-uri20180509-8006-eusuqx	image/jpeg	57642	2018-05-09 04:06:31.870698	266	Dish	2018-05-09 04:06:32.029228	2018-05-17 07:01:34.71407	11	f	\N	\N	\N	\N
742	open-uri20180509-8006-iy8s9b	image/jpeg	170723	2018-05-09 04:06:50.160339	281	Dish	2018-05-09 04:06:50.365075	2018-05-17 07:01:34.927667	11	f	\N	\N	\N	\N
757	open-uri20180509-8006-10h43qk	image/jpeg	82692	2018-05-09 04:07:56.007486	296	Dish	2018-05-09 04:07:56.122853	2018-05-17 07:01:35.121784	11	f	\N	\N	\N	\N
774	open-uri20180509-8006-evxdrn	image/jpeg	18363	2018-05-09 04:08:17.114336	313	Dish	2018-05-09 04:08:17.194316	2018-05-17 07:01:35.3438	11	f	\N	\N	\N	\N
789	open-uri20180509-8006-1pwbu70	image/jpeg	152333	2018-05-09 04:08:47.411709	328	Dish	2018-05-09 04:08:47.660498	2018-05-17 07:01:35.538225	11	f	\N	\N	\N	\N
841	open-uri20180509-8006-1fhdzvi	image/jpeg	215194	2018-05-09 04:10:20.609599	380	Dish	2018-05-09 04:10:20.966868	2018-05-17 07:01:36.216069	11	f	\N	\N	\N	\N
1016	1526291183	image/jpeg	129168	2018-05-14 09:46:23.57197	657	Restaurant	2018-05-14 09:46:23.712466	2018-05-17 07:01:36.434923	11	f	\N	\N	\N	\N
1025	1526291205	image/jpeg	94834	2018-05-14 09:46:45.102025	666	Restaurant	2018-05-14 09:46:45.227142	2018-05-17 07:01:36.547435	11	f	\N	\N	\N	\N
1039	1526291240	image/jpeg	149441	2018-05-14 09:47:20.837818	681	Restaurant	2018-05-14 09:47:20.953844	2018-05-17 07:01:36.800257	11	f	\N	\N	\N	\N
1053	1526291274	image/jpeg	210201	2018-05-14 09:47:53.908375	696	Restaurant	2018-05-14 09:47:54.073791	2018-05-17 07:01:36.982819	11	f	\N	\N	\N	\N
1067	1526291323	image/jpeg	190392	2018-05-14 09:48:43.48891	713	Restaurant	2018-05-14 09:48:43.683004	2018-05-17 07:01:37.164894	11	f	\N	\N	\N	\N
1081	1526291434	image/jpeg	192347	2018-05-14 09:50:33.816453	729	Restaurant	2018-05-14 09:50:34.028745	2018-05-17 07:01:37.347271	11	f	\N	\N	\N	\N
1091	1526291457	image/jpeg	90339	2018-05-14 09:50:57.373721	740	Restaurant	2018-05-14 09:50:57.509166	2018-05-17 07:01:37.479686	11	f	\N	\N	\N	\N
1100	1526291509	image/jpeg	73758	2018-05-14 09:51:49.490391	751	Restaurant	2018-05-14 09:51:49.648924	2018-05-17 07:01:37.591597	11	f	\N	\N	\N	\N
1114	1526291550	image/jpeg	153341	2018-05-14 09:52:30.023926	768	Restaurant	2018-05-14 09:52:30.309852	2018-05-17 07:01:37.800279	11	f	\N	\N	\N	\N
1128	1526291608	image/jpeg	134190	2018-05-14 09:53:28.473367	783	Restaurant	2018-05-14 09:53:28.665734	2018-05-17 07:01:37.974347	11	f	\N	\N	\N	\N
1142	1526291709	image/jpeg	127409	2018-05-14 09:55:09.559926	798	Restaurant	2018-05-14 09:55:09.785552	2018-05-17 07:01:38.148504	11	f	\N	\N	\N	\N
1156	1526291795	image/jpeg	127327	2018-05-14 09:56:35.300461	814	Restaurant	2018-05-14 09:56:35.497003	2018-05-17 07:01:38.32251	11	f	\N	\N	\N	\N
1166	1526291839	image/jpeg	117422	2018-05-14 09:57:19.63033	824	Restaurant	2018-05-14 09:57:19.850969	2018-05-17 07:01:38.445999	11	f	\N	\N	\N	\N
1175	1526291865	image/jpeg	169262	2018-05-14 09:57:45.454518	835	Restaurant	2018-05-14 09:57:45.682334	2018-05-17 07:01:38.569864	11	f	\N	\N	\N	\N
1623	1526377283	image/jpeg	133950	2018-05-15 09:41:23.105676	1340	Restaurant	2018-05-15 09:41:23.277193	2018-05-17 07:01:44.643121	11	f	\N	\N	\N	\N
1624	1526377285	image/jpeg	73967	2018-05-15 09:41:25.032364	1341	Restaurant	2018-05-15 09:41:25.142023	2018-05-17 07:01:44.662373	11	f	\N	\N	\N	\N
1625	1526377287	image/jpeg	118053	2018-05-15 09:41:27.013883	1342	Restaurant	2018-05-15 09:41:27.149362	2018-05-17 07:01:44.675246	11	f	\N	\N	\N	\N
1626	1526377289	image/jpeg	142568	2018-05-15 09:41:29.259186	1343	Restaurant	2018-05-15 09:41:29.38606	2018-05-17 07:01:44.695793	11	f	\N	\N	\N	\N
1627	1526377291	image/jpeg	109113	2018-05-15 09:41:31.030556	1344	Restaurant	2018-05-15 09:41:31.142194	2018-05-17 07:01:44.708145	11	f	\N	\N	\N	\N
1628	1526377293	image/jpeg	100199	2018-05-15 09:41:32.951845	1345	Restaurant	2018-05-15 09:41:33.075118	2018-05-17 07:01:44.720849	11	f	\N	\N	\N	\N
1629	1526377295	image/jpeg	107655	2018-05-15 09:41:35.038411	1346	Restaurant	2018-05-15 09:41:35.147226	2018-05-17 07:01:44.73392	11	f	\N	\N	\N	\N
1630	1526377297	image/jpeg	99034	2018-05-15 09:41:37.391495	1347	Restaurant	2018-05-15 09:41:37.513568	2018-05-17 07:01:44.745007	11	f	\N	\N	\N	\N
1631	1526377299	image/jpeg	111907	2018-05-15 09:41:39.517823	1348	Restaurant	2018-05-15 09:41:39.64592	2018-05-17 07:01:44.757579	11	f	\N	\N	\N	\N
1632	1526377301	image/jpeg	101384	2018-05-15 09:41:41.796523	1349	Restaurant	2018-05-15 09:41:41.920241	2018-05-17 07:01:44.770104	11	f	\N	\N	\N	\N
1633	1526377304	image/jpeg	110370	2018-05-15 09:41:43.988139	1350	Restaurant	2018-05-15 09:41:44.118849	2018-05-17 07:01:44.782527	11	f	\N	\N	\N	\N
1634	1526377307	image/jpeg	259490	2018-05-15 09:41:47.471758	1351	Restaurant	2018-05-15 09:41:47.655039	2018-05-17 07:01:44.794479	11	f	\N	\N	\N	\N
1635	1526377311	image/jpeg	142360	2018-05-15 09:41:51.0757	1352	Restaurant	2018-05-15 09:41:51.203898	2018-05-17 07:01:44.809363	11	f	\N	\N	\N	\N
1636	1526377313	image/jpeg	140005	2018-05-15 09:41:53.662758	1353	Restaurant	2018-05-15 09:41:53.799222	2018-05-17 07:01:44.827839	11	f	\N	\N	\N	\N
1637	1526377316	image/jpeg	101983	2018-05-15 09:41:56.609203	1354	Restaurant	2018-05-15 09:41:56.734977	2018-05-17 07:01:44.840314	11	f	\N	\N	\N	\N
1638	1526377319	image/jpeg	108125	2018-05-15 09:41:59.814771	1355	Restaurant	2018-05-15 09:41:59.949894	2018-05-17 07:01:44.861228	11	f	\N	\N	\N	\N
1639	1526377323	image/jpeg	171612	2018-05-15 09:42:03.724965	1356	Restaurant	2018-05-15 09:42:03.89111	2018-05-17 07:01:44.873649	11	f	\N	\N	\N	\N
1640	1526377327	image/jpeg	131783	2018-05-15 09:42:07.07952	1357	Restaurant	2018-05-15 09:42:07.20155	2018-05-17 07:01:44.886293	11	f	\N	\N	\N	\N
1641	1526377330	image/jpeg	219234	2018-05-15 09:42:10.221643	1358	Restaurant	2018-05-15 09:42:10.381969	2018-05-17 07:01:44.898185	11	f	\N	\N	\N	\N
1189	1526291989	image/jpeg	129540	2018-05-14 09:59:49.294951	849	Restaurant	2018-05-14 09:59:49.427768	2018-05-17 07:01:38.744258	11	f	\N	\N	\N	\N
1203	1526292191	image/jpeg	73898	2018-05-14 10:03:11.096362	863	Restaurant	2018-05-14 10:03:11.249394	2018-05-17 07:01:38.960917	11	f	\N	\N	\N	\N
1217	1526292267	image/jpeg	147910	2018-05-14 10:04:27.661995	879	Restaurant	2018-05-14 10:04:27.835928	2018-05-17 07:01:39.193631	11	f	\N	\N	\N	\N
1231	1526292409	image/jpeg	107679	2018-05-14 10:06:49.235341	894	Restaurant	2018-05-14 10:06:49.37868	2018-05-17 07:01:39.398933	11	f	\N	\N	\N	\N
1241	1526292516	image/jpeg	44668	2018-05-14 10:08:36.173303	905	Restaurant	2018-05-14 10:08:36.312133	2018-05-17 07:01:39.536228	11	f	\N	\N	\N	\N
1250	1526292616	image/jpeg	154118	2018-05-14 10:10:16.817601	915	Restaurant	2018-05-14 10:10:16.950023	2018-05-17 07:01:39.654515	11	f	\N	\N	\N	\N
1264	1526292747	image/jpeg	80610	2018-05-14 10:12:27.503412	930	Restaurant	2018-05-14 10:12:27.676977	2018-05-17 07:01:39.836737	11	f	\N	\N	\N	\N
1278	1526292824	image/jpeg	106083	2018-05-14 10:13:44.810346	944	Restaurant	2018-05-14 10:13:44.995771	2018-05-17 07:01:40.017426	11	f	\N	\N	\N	\N
1292	1526292937	image/jpeg	105246	2018-05-14 10:15:37.424925	959	Restaurant	2018-05-14 10:15:37.612329	2018-05-17 07:01:40.200059	11	f	\N	\N	\N	\N
1306	1526376469	image/jpeg	127127	2018-05-15 09:27:49.813914	973	Restaurant	2018-05-15 09:27:49.987055	2018-05-17 07:01:40.382053	11	f	\N	\N	\N	\N
1316	1526376497	image/jpeg	68179	2018-05-15 09:28:17.295742	984	Restaurant	2018-05-15 09:28:17.412308	2018-05-17 07:01:40.521307	11	f	\N	\N	\N	\N
1325	1526376516	image/jpeg	97124	2018-05-15 09:28:36.505362	995	Restaurant	2018-05-15 09:28:36.651665	2018-05-17 07:01:40.637491	11	f	\N	\N	\N	\N
1339	1526376546	image/jpeg	154618	2018-05-15 09:29:06.234089	1009	Restaurant	2018-05-15 09:29:06.365894	2018-05-17 07:01:40.873499	11	f	\N	\N	\N	\N
1353	1526376581	image/jpeg	105544	2018-05-15 09:29:40.8994	1027	Restaurant	2018-05-15 09:29:41.035	2018-05-17 07:01:41.055802	11	f	\N	\N	\N	\N
1367	1526376622	image/jpeg	120774	2018-05-15 09:30:22.513858	1044	Restaurant	2018-05-15 09:30:22.666093	2018-05-17 07:01:41.237977	11	f	\N	\N	\N	\N
1381	1526376648	image/jpeg	155198	2018-05-15 09:30:47.97996	1060	Restaurant	2018-05-15 09:30:48.145905	2018-05-17 07:01:41.427464	11	f	\N	\N	\N	\N
1391	1526376677	image/jpeg	107425	2018-05-15 09:31:16.962491	1072	Restaurant	2018-05-15 09:31:17.086509	2018-05-17 07:01:41.597985	11	f	\N	\N	\N	\N
1400	1526376693	image/jpeg	103892	2018-05-15 09:31:33.763613	1081	Restaurant	2018-05-15 09:31:33.981418	2018-05-17 07:01:41.753759	11	f	\N	\N	\N	\N
1414	1526376723	image/jpeg	124063	2018-05-15 09:32:03.425451	1097	Restaurant	2018-05-15 09:32:03.54286	2018-05-17 07:01:41.935802	11	f	\N	\N	\N	\N
1428	1526376752	image/jpeg	129507	2018-05-15 09:32:32.700843	1113	Restaurant	2018-05-15 09:32:32.939408	2018-05-17 07:01:42.126229	11	f	\N	\N	\N	\N
1442	1526376789	image/jpeg	104664	2018-05-15 09:33:09.704166	1127	Restaurant	2018-05-15 09:33:09.89333	2018-05-17 07:01:42.307774	11	f	\N	\N	\N	\N
1456	1526376825	image/jpeg	113550	2018-05-15 09:33:44.898444	1141	Restaurant	2018-05-15 09:33:45.117119	2018-05-17 07:01:42.482094	11	f	\N	\N	\N	\N
1466	1526376854	image/jpeg	155631	2018-05-15 09:34:13.801055	1155	Restaurant	2018-05-15 09:34:14.05331	2018-05-17 07:01:42.607162	11	f	\N	\N	\N	\N
1475	1526376878	image/jpeg	136482	2018-05-15 09:34:38.369643	1166	Restaurant	2018-05-15 09:34:38.594784	2018-05-17 07:01:42.719135	11	f	\N	\N	\N	\N
1489	1526376913	image/jpeg	107005	2018-05-15 09:35:13.795242	1183	Restaurant	2018-05-15 09:35:13.98375	2018-05-17 07:01:42.891993	11	f	\N	\N	\N	\N
1503	1526376957	image/jpeg	159417	2018-05-15 09:35:57.255634	1197	Restaurant	2018-05-15 09:35:57.471116	2018-05-17 07:01:43.099615	11	f	\N	\N	\N	\N
1517	1526376989	image/jpeg	198159	2018-05-15 09:36:29.483503	1215	Restaurant	2018-05-15 09:36:29.746826	2018-05-17 07:01:43.272686	11	f	\N	\N	\N	\N
1531	1526377027	image/jpeg	84559	2018-05-15 09:37:07.010428	1234	Restaurant	2018-05-15 09:37:07.190015	2018-05-17 07:01:43.4551	11	f	\N	\N	\N	\N
1541	1526377050	image/jpeg	127151	2018-05-15 09:37:30.571183	1246	Restaurant	2018-05-15 09:37:30.765485	2018-05-17 07:01:43.588674	11	f	\N	\N	\N	\N
1550	1526377078	image/jpeg	245700	2018-05-15 09:37:58.596857	1257	Restaurant	2018-05-15 09:37:58.78715	2018-05-17 07:01:43.69961	11	f	\N	\N	\N	\N
1564	1526377121	image/jpeg	118933	2018-05-15 09:38:41.717164	1276	Restaurant	2018-05-15 09:38:41.844955	2018-05-17 07:01:43.875459	11	f	\N	\N	\N	\N
1578	1526377154	image/jpeg	218069	2018-05-15 09:39:14.719195	1293	Restaurant	2018-05-15 09:39:14.921882	2018-05-17 07:01:44.049093	11	f	\N	\N	\N	\N
1592	1526377202	image/jpeg	103275	2018-05-15 09:40:02.23627	1309	Restaurant	2018-05-15 09:40:02.354565	2018-05-17 07:01:44.22262	11	f	\N	\N	\N	\N
1606	1526377235	image/jpeg	66406	2018-05-15 09:40:35.344854	1323	Restaurant	2018-05-15 09:40:35.45317	2018-05-17 07:01:44.404998	11	f	\N	\N	\N	\N
666	baby.jpg	image/jpeg	39067	2019-06-13 08:16:40.994843	205	Dish	2018-05-09 04:04:58.839037	2019-06-13 08:16:41.482359	11	f	\N	\N	\N	\N
772	Jeera-Rice-Recipe.jpg	image/jpeg	109661	2019-06-17 11:41:01.148944	311	Dish	2018-05-09 04:08:15.413294	2019-06-17 11:41:01.230594	11	f	\N	\N	\N	\N
1602	malai-kofta-recipe.jpg	image/jpeg	72556	2019-06-17 11:52:14.975746	291	Dish	2018-05-15 09:40:26.394852	2019-06-17 11:52:15.085093	11	f	\N	\N	\N	\N
852	Mathi-Tawa-Fish-Fry-2-Pcs.jpg	image/jpeg	315109	2019-06-17 11:57:39.604091	391	Dish	2018-05-09 04:10:36.68114	2019-06-17 11:57:39.719622	11	f	\N	\N	\N	\N
783	Chicken_Biryani_Dum_Fry_Bit.jpg	image/jpeg	266603	2019-06-18 09:16:37.359908	322	Dish	2018-05-09 04:08:32.244928	2019-06-18 09:16:37.494401	11	f	\N	\N	\N	\N
1648	chickenbiryani.jpg	image/jpeg	77708	2019-06-18 11:39:17.420899	203	Dish	2019-06-18 11:39:17.560525	2019-06-18 11:39:17.560525	\N	f	\N	\N	\N	\N
1649	chickenbiryani.jpg	image/jpeg	77708	2019-06-18 11:40:50.813206	204	Dish	2019-06-18 11:40:50.928158	2019-06-18 11:40:50.928158	\N	f	\N	\N	\N	\N
1650	chickenbiryani.jpg	image/jpeg	77708	2019-06-18 11:43:55.298896	335	Dish	2019-06-18 11:43:55.426905	2019-06-18 11:43:55.426905	\N	f	\N	\N	\N	\N
1651	chickenbiryani.jpg	image/jpeg	77708	2019-06-18 11:46:09.49137	204	Dish	2019-06-18 11:46:09.609875	2019-06-18 11:46:09.609875	\N	f	\N	\N	\N	\N
1652	chickenbiryani.jpg	image/jpeg	77708	2019-06-18 11:46:32.772586	367	Dish	2019-06-18 11:46:32.885613	2019-06-18 11:46:32.885613	\N	f	\N	\N	\N	\N
1653	chickenbiryani.jpg	image/jpeg	77708	2019-06-18 11:46:37.406368	367	Dish	2019-06-18 11:46:37.521465	2019-06-18 11:46:37.521465	\N	f	\N	\N	\N	\N
1654	chickenbiryani.jpg	image/jpeg	77708	2019-06-18 11:46:40.244753	367	Dish	2019-06-18 11:46:40.358178	2019-06-18 11:46:40.358178	\N	f	\N	\N	\N	\N
1655	chickenbiryani.jpg	image/jpeg	77708	2019-06-18 11:57:58.208387	356	Dish	2019-06-18 11:57:58.33636	2019-06-18 11:57:58.33636	\N	f	\N	\N	\N	\N
796	Szechuan-Chicken_.jpg	image/jpeg	182059	2019-06-19 04:25:50.704415	335	Dish	2018-05-09 04:08:52.518163	2019-06-19 04:25:50.828719	11	f	\N	\N	\N	\N
\.


--
-- Data for Name: ratings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ratings (id, user_id, dish_id, weight, created_at, updated_at) FROM stdin;
2	2	203	4.5	2018-05-09 06:32:37.070568	2018-05-14 11:54:47.43837
\.


--
-- Data for Name: restaurant_affections; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.restaurant_affections (id, favouriter_id, restaurant_id, created_at, updated_at) FROM stdin;
38	3	494	2018-05-16 06:11:16.53599	2018-05-16 06:11:16.53599
\.


--
-- Data for Name: restaurant_fellowships; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.restaurant_fellowships (id, follower_id, restaurant_id, created_at, updated_at) FROM stdin;
6	5	505	2018-05-15 11:36:34.896397	2018-05-15 11:36:34.896397
7	3	505	2018-05-15 11:43:04.779364	2018-05-15 11:43:04.779364
\.


--
-- Data for Name: restaurants; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.restaurants (id, name, address, phone_number, created_at, updated_at, google_place_id, latitude, longitude, website, rating, city) FROM stdin;
497	Subway	Ramasomayajulu St, Surya Rao Peta, Kakinada, Andhra Pradesh 533001, India	079952 35621	2018-05-09 05:13:50.936877	2018-05-09 05:13:50.936877	ChIJz6BqOQsoODoRzxcuQ-bsqNI	16.957558800000001	82.2356647000000009	http://www.subway.com/	3.79999999999999982	kakinada
491	Seasons 5 The Restaurant	Nookalamma Temple Street, Rama Rao Pet, Rama Rao Peta, Kakinada. East Godavari District., Andhra Pradesh 533004, India	0884 234 7788	2018-05-09 05:13:37.377269	2019-06-13 05:28:38.824586	\N	16.9634800000000006	82.2324579999999941	\N	3.89999999999999991	kakinada
492	Subbayya Gari Hotel OLD & ORIGINAL	10-6-14, ramarao peta, subbayya hotel road, Rama Rao Peta, Kakinada, Andhra Pradesh 533001, India	0884 237 9365	2018-05-09 05:13:40.034611	2019-06-13 05:28:38.83292	\N	16.9639552000000009	82.2280971999999934	http://www.subbayahotel.com/	4.29999999999999982	kakinada
493	food park family restaurant	Datlavari Street, Pratap Nagar, Kakinada, Andhra Pradesh 533003, India	075696 90123	2018-05-09 05:13:41.766328	2019-06-13 05:28:38.841216	\N	16.9686465999999996	82.2247243000000054	\N	3.79999999999999982	kakinada
498	SMS food cort	Turangi, Kakinada, Andhra Pradesh 533016, India	\N	2018-05-09 05:13:53.724073	2019-06-13 05:28:38.876688	\N	16.9404061000000006	82.2313141999999999	\N	\N	kakinada
551	Kamat Restaurant	Vuda Complex, Waltair Club Rd, Siripuram, Visakhapatnam, Andhra Pradesh 530003, India	089127 88984	2018-05-09 05:17:31.847221	2019-06-13 05:28:39.066263	\N	17.7220210999999992	83.3182752999999963	\N	3.60000000000000009	Visakhapatnam
544	Paradise Food Court Pvt Ltd	No 9-14-1, VIP Road, CBM Compound, Sector 4, Siripuram, Asilmetta, Visakhapatnam, Andhra Pradesh 530003, India	0891 666 6260	2018-05-09 05:17:14.749605	2019-06-13 05:28:39.249599	\N	17.7268478000000016	83.3162607000000008	http://www.paradisefoodcourt.in/restaurants-in-vizag.html	3.89999999999999991	Visakhapatnam
545	Delicacies Restaurant	Sec 19 Near, Pedda Rushikonda, Rushikonda, Beach road, Visakhapatnam 530017, India	\N	2018-05-09 05:17:16.746419	2019-06-13 05:28:39.257925	\N	17.795770000000001	83.3799499999999938	\N	3	Visakhapatnam
546	Zeeshan Restaurant - Apna Hyderabadi Food	Chitralaya Rd, Jagadamba Junction, Suryabagh, Jagadamba Junction, Visakhapatnam, Andhra Pradesh 530002, India	070954 63726	2018-05-09 05:17:19.087197	2019-06-13 05:28:39.266269	\N	17.7119730000000004	83.3017109999999974	https://www.zomato.com/visakhapatnam/zeeshan-restaurant-apna-hyderabadi-food-jagadamba-junction-vizag	3.39999999999999991	Visakhapatnam
547	My Restaurant	NH 16, Behind Pot Biryani Point, Near Isukathota Bus Stop, Isukathota, Shivaji Palem, Pithapuram Colony, Maddilapalem, Visakhapatnam, Andhra Pradesh 530022, India	088865 33555	2018-05-09 05:17:22.727503	2019-06-13 05:28:39.27512	\N	17.7401258000000013	83.3269851999999958	http://www.myrestaurant.in/	4.20000000000000018	Visakhapatnam
574	Sri Sairam Parlour	Opposite Diamond Park, Dondaparthy, Dwaraka Nagar, Visakhapatnam, Andhra Pradesh 530016, India	098660 76575	2018-05-09 05:18:20.637602	2019-06-13 05:28:39.283033	\N	17.7263042999999989	83.3033293999999955	\N	4.09999999999999964	Visakhapatnam
521	Mirchi Restaurant	Pithapuram-Kakinada Rd, APSP, Rayudupalem, 3 APSP, Rayudupalem, Kakinada, Andhra Pradesh 533005, India	098664 66789	2018-05-09 05:14:38.451478	2018-05-09 05:14:38.451478	ChIJjQvDxq8pODoRKzaokj6kVEo	17.0106532000000001	82.2486013999999983	http://website-776668588263908290960-restaurant.business.site/	3	kakinada
531	Mirchi Restaurant	533003, 67-20-1/2A, 5th Cross Road, Lalbahadur Nagar, Rajeshwari Nagar, Kakinada, Andhra Pradesh 533003, India	\N	2018-05-09 05:15:00.695932	2018-05-09 05:15:00.695932	ChIJq9kfcEcoODoRcdw5xApi6kY	16.9850165000000004	82.2373548999999997	\N	3.5	kakinada
522	Jaya Restaurant	Surya Rao Peta, Kakinada, Andhra Pradesh 533001, India	0884 237 2314	2018-05-09 05:14:39.476713	2019-06-13 05:28:39.076601	\N	16.9551853000000001	82.2361877999999962	\N	3.89999999999999991	kakinada
554	Food Zone	Beach Rd, RK Beach, Beside Coffee Wave, Paanduranga Puram, Visakhapatnam, Andhra Pradesh 530003, India	099897 84448	2018-05-09 05:17:39.136035	2018-05-09 05:17:39.136035	ChIJmwyvTW9DOToRf53Z9lSkUow	17.715174300000001	83.3245976999999982	\N	3.79999999999999982	Visakhapatnam
562	Barbeque Nation	1st Floor, ATR Towers, East Wing, Harbour Park Road, Pandurangapuram, Paanduranga Puram, Visakhapatnam, Andhra Pradesh 530003, India	097117 26060	2018-05-09 05:17:57.491016	2018-05-09 05:17:57.491016	ChIJk45YuGtDOToRVbSgKYBj2nU	17.7174520000000015	83.3185519999999968	http://www.barbeque-nation.com/	4.5	Visakhapatnam
549	Ashray Restaurant	GNT Rd, New Gajuwaka, Gajuwaka, Visakhapatnam, Andhra Pradesh 530026, India	089125 11363	2018-05-09 05:17:27.474162	2019-06-13 05:28:39.299846	\N	17.6859824000000003	83.2084191000000004	\N	3.70000000000000018	Visakhapatnam
550	Ashray Sweets Bakery Restaurants	Araku - Vishakhapatnam Road, MVP Colony, Dungalavanipalem, Nad Junction, Dungalavanipalem, Visakhapatnam, Andhra Pradesh 530027, India	089127 56688	2018-05-09 05:17:29.453482	2019-06-13 05:28:39.308071	\N	17.742893200000001	83.2343165000000056	\N	3.29999999999999982	Visakhapatnam
697	Gujrat Hotel	Palace Compound, Indranagar, Agartala, Tripura 799001, India	\N	2018-05-14 09:47:55.045429	2019-06-13 05:28:39.316414	\N	23.8341920999999992	91.2810304000000059	\N	3	Agartala
552	Heritage Tycoon restaurants	Balaji`s Mangalagiri Chamber, Siripuram Fort, Balaji Nagar, Asilmetta, Visakhapatnam, Andhra Pradesh 530003, India	089125 40202	2018-05-09 05:17:33.643928	2019-06-13 05:28:39.324727	\N	17.7253347000000012	83.317052700000005	\N	4	Visakhapatnam
553	Kanhaji Restaurant, Visakhapatnam	#31-1-31, N.S.N. Towers, Near to Church, Allipuram, Bangaramma Metta, Railway Quarters, Allipuram, Visakhapatnam, Andhra Pradesh 530004, India	089127 09003	2018-05-09 05:17:36.051604	2019-06-13 05:28:39.333082	\N	17.7201990000000009	83.2980000000000018	https://www.facebook.com/KanhajiVizag/	4.20000000000000018	Visakhapatnam
555	Hotel Prabha Veg Restaurant	Ground Floor, PML Complex, Marripalem Main Rd, Nad Junction, Dungalavanipalem, Visakhapatnam, Andhra Pradesh 530009, India	098492 48624	2018-05-09 05:17:41.923315	2019-06-13 05:28:39.343777	\N	17.7430969000000012	83.2352015999999963	\N	4	Visakhapatnam
556	Eleven Restaurant	10-1-4 &5, 5th Floor, Jagapathi Plaza, Waltair Main Rd, Siripuram, Ram Nagar, Visakhapatnam, Andhra Pradesh 530003, India	0891 664 6111	2018-05-09 05:17:44.160789	2019-06-13 05:28:39.349739	\N	17.7241980999999988	83.3177567000000039	\N	4	Visakhapatnam
557	Horizon Multi-cuisine Restaurant	Jagadamba Junction ,Daba, Nehru Nagar TPT/VUDA Colony, Ram Nagar, Waltair main road, Andhra Pradesh 530020, India	\N	2018-05-09 05:17:46.214359	2019-06-13 05:28:39.358067	\N	17.7189699999999988	83.3099200000000053	\N	3	Visakhapatnam
558	Dharani VEG Restaurant	Hotel Dasapalla ,Suryabagh, Suryabagh, Jagadamba Junction, Town Main Road, Andhra Pradesh 530020, India	089125 63141	2018-05-09 05:17:49.250249	2019-06-13 05:28:39.366283	\N	17.7106673000000008	83.3005021999999968	\N	4.20000000000000018	Visakhapatnam
559	Hotel Kamat	Beach Rd, Lawsons Bay Colony, Pedda Waltair, Visakhapatnam(Vizag), Andhra Pradesh 530017, India	089127 88984	2018-05-09 05:17:51.417474	2019-06-13 05:28:39.374673	\N	17.7343675000000012	83.3411124000000001	http://hotelkamat.com/	3.70000000000000018	Visakhapatnam
560	The Eatery	10-28-3, Uplands, Waltair Main Road, Waltair Uplands, Ram Nagar, Visakhapatnam, Andhra Pradesh 530003, India	0891 305 1111	2018-05-09 05:17:53.646686	2019-06-13 05:28:39.383848	\N	17.7205589000000003	83.3122453999999948	\N	4	Visakhapatnam
561	Red Roast Restaurant	105, Sarovar Apartment, Beach Rd, Lawsons Bay Colony, Pedda Waltair, Visakhapatnam, Andhra Pradesh 530017, India	099486 55766	2018-05-09 05:17:55.950137	2019-06-13 05:28:39.391426	\N	17.7314155000000007	83.3410393000000056	\N	3.39999999999999991	Visakhapatnam
563	Seven Days Cafe	Vuda Complex, Siripuram, Beside Gurujada KalaKhsetram, Siripuram, Visakhapatnam, Andhra Pradesh 530002, India	087123 12777	2018-05-09 05:17:59.254146	2019-06-13 05:28:39.401722	\N	17.7207885000000012	83.318187199999997	\N	3.79999999999999982	Visakhapatnam
564	Ming Garden	The Gateway Hotel, Beach Road, Paanduranga Puram, Visakhapatnam, Andhra Pradesh 520010, India	0891 662 3685	2018-05-09 05:18:02.735923	2019-06-13 05:28:39.407961	\N	17.7112949999999998	83.3166539999999998	https://gateway.tajhotels.com/en-in/beach-road-visakhapatnam/restaurants/ming-garden/?utm_medium=Local&utm_source=Google&utm_campaign=Ming-Garden-Restaurant	4.29999999999999982	Visakhapatnam
565	Bombay Restaurant	Beside Jyothi Theatre Ladies Gate, Suryabagh, Daba Gardens, 104 Area, Visakhapatnam, Andhra Pradesh 530020, India	0891 667 2222	2018-05-09 05:18:04.95508	2019-06-13 05:28:39.416377	\N	17.7140912999999998	83.296872300000004	\N	3.79999999999999982	Visakhapatnam
566	Punjabi Grill	RK Beach Rd, Near Chocolate Room, Paanduranga Puram, Pandurangapuram, Paanduranga Puram, Visakhapatnam, Andhra Pradesh 530003, India	0891 662 5777	2018-05-09 05:18:06.659482	2019-06-13 05:28:39.424724	\N	17.7130161999999984	83.3196523000000013	http://punjabigrill.business.site/	3.39999999999999991	Visakhapatnam
567	Mr and Mrs Idly South Indian Restaurant	RK Beach Rd, Beside Kali Temple, Paanduranga Puram, Visakhapatnam, Andhra Pradesh 530003, India	0891 662 5778	2018-05-09 05:18:08.232782	2019-06-13 05:28:39.433072	\N	17.7128967000000017	83.3197950999999932	http://www.mrandmrsidly.in/outlets.html	2.10000000000000009	Visakhapatnam
568	Marcopolo Lounge Bar - Restaurants In Visakhapatnam	Beach Road, Krishna Nagar, Maharani Peta, Visakhapatnam, Andhra Pradesh 530002, India	0891 660 0101	2018-05-09 05:18:09.879941	2019-06-13 05:28:39.441417	\N	17.7118891000000005	83.3155431999999934	https://www.itchotels.in/hotels/visakhapatnam/welcomhotelgrandbay/dining/marcopolo-lounge-bar.html?utm_source=google&utm_medium=organic%20Search&utm_term=welcomhotelgrandbay%20Restaurants&utm_campaign=listing	4	Visakhapatnam
569	Venkatadri Vantillu	Waltair Main Road, Balaji Nagar, Asilmetta, Visakhapatnam, Andhra Pradesh 530003, India	091776 55999	2018-05-09 05:18:11.806187	2019-06-13 05:28:39.449702	\N	17.7249687000000016	83.3205056000000042	\N	4	Visakhapatnam
570	Flying Spaghetti Monster	G2, Sai Dakshita Complex, Waltair Uplands, Waltair Main Road, Opposite Waltair Club, Ram Nagar, Visakhapatnam, Andhra Pradesh 530003, India	089125 66652	2018-05-09 05:18:13.696214	2019-06-13 05:28:39.45802	\N	17.7210849999999986	83.3148709999999966	http://www.fsm.in/	4.40000000000000036	Visakhapatnam
571	Fortune Inn Sree Kanya - Restaurants in Visakhapatnam	47-10-34 & 35, Dwaraknagar, Diamond Park, Sree Kanya Road, Dondaparthy, Dwaraka Nagar, Visakhapatnam, Andhra Pradesh 530016, India	0891 398 8444	2018-05-09 05:18:15.452438	2019-06-13 05:28:39.474703	\N	17.7268860000000004	83.3017320000000012	https://www.fortunehotels.in/visakhapatnam-fortune-inn-sree-kanya-dining.dhm.183?utm_source=google&utm_medium=organic&utm_term=visakhapatnam-fortune-inn-sree-kanya-dining&utm_content=visakhapatnam&utm_campaign=Listings	3.89999999999999991	Visakhapatnam
572	Konaseema Food Court	Beside Telephone Exchange Office, Chandrampalem, N.H-5, Madhurawada, Chandrampalem, Srinivasa Nagar, Madhurawada, Visakhapatnam, Andhra Pradesh 530048, India	099486 54999	2018-05-09 05:18:17.027357	2019-06-13 05:28:39.483023	\N	17.8093578000000008	83.3561169999999976	http://www.restaurantsinvizag.com/konaseema-food-court-madhurawada/	3.70000000000000018	Visakhapatnam
573	Soul Delhi	11-9-61, Dasapalla Hills, Varun Park, 3rd Floor, Near Jagarnath Swammi Temple, Paanduranga Puram, Visakhapatnam, Andhra Pradesh 530003, India	0891 666 4244	2018-05-09 05:18:18.685058	2019-06-13 05:28:39.491399	\N	17.7178280000000008	83.3164069999999981	\N	4.09999999999999964	Visakhapatnam
595	KFC	Chitralaya Mall, N.T.S. No. 1678, Block No. 47, Suryabagh, Alipuram, Jagadamba Junction, Visakhapatnam, Andhra Pradesh 530020, India	0891 339 9444	2018-05-09 05:18:58.446514	2018-05-09 05:18:58.446514	ChIJF-rrsRtDOToRF3xPDQRYvyI	17.7124720000000018	83.3011989999999969	http://online.kfc.co.in/	4	Visakhapatnam
576	Siva Sai Restaurant	Opposite Mahendra & Co, Poorna Market, Suryabagh, Jagadamba Junction, Visakhapatnam, Andhra Pradesh 530001, India	0891 662 6718	2018-05-09 05:18:23.509994	2019-06-13 05:28:39.508097	\N	17.7121500000000012	83.3013665999999944	\N	2	Visakhapatnam
577	Shree Shyam Restaurant & Lodge	30- 30-11-2, Near J.K Silks, Daba Gardens, 530020, 11-2, Lakshmi Street, Daba Gardens, Allipuram, Visakhapatnam, Andhra Pradesh 530020, India	089127 48113	2018-05-09 05:18:24.518925	2019-06-13 05:28:39.516458	\N	17.7156459999999996	83.3016485999999929	\N	3.70000000000000018	Visakhapatnam
578	Alpha Hotel	Near Sharada Theatre, Jagadamba Junction, Jagadamba Junction, Visakhapatnam, Andhra Pradesh 530020, India	089127 97533	2018-05-09 05:18:27.563018	2019-06-13 05:28:39.524767	\N	17.7121868000000013	83.3017361999999935	\N	3.79999999999999982	Visakhapatnam
579	Amaravathi Veg and Nonveg Restaurant	30-15-117-16, Daba Garden Rd, Lalitha Colony, Daba Gardens, Ram Nagar, Visakhapatnam, Andhra Pradesh 530020, India	073962 29687	2018-05-09 05:18:29.74807	2019-06-13 05:28:39.533128	\N	17.7194737000000018	83.3032495000000068	\N	3.89999999999999991	Visakhapatnam
580	Delicacies	Sector 10, MVP Colony, Visakhapatnam, Andhra Pradesh 530017, India	098485 34965	2018-05-09 05:18:31.573506	2019-06-13 05:28:39.541451	\N	17.7413218000000015	83.3384553000000068	\N	3.79999999999999982	Visakhapatnam
581	Abhiruchi Restaurant	D. No. 50-40-10, Iswarya Enclave, T P T Colony, Seethammadhara, Seethammadara, Visakhapatnam, Andhra Pradesh 530013, India	098498 29157	2018-05-09 05:18:32.779989	2019-06-13 05:28:39.549792	\N	17.7429030999999995	83.3081171999999981	\N	4	Visakhapatnam
582	Ramayya Veg. Restaurant	8, Daba Garden Road, Near Bank Of Baroda, Daba Gardens, Ram Nagar, Prakasharao Peta, Jagadamba Junction, Visakhapatnam, Andhra Pradesh 530020, India	092950 66511	2018-05-09 05:18:33.811058	2019-06-13 05:28:39.558114	\N	17.7149104999999984	83.3019974000000047	\N	3.89999999999999991	Visakhapatnam
583	Jaipur Restaurant	Hotel Jaipur, 31-32-15, Near Jyothi Theatre Road, Daba Gardens, Allipuram, Visakhapatnam, Andhra Pradesh 530020, India	081022 51143	2018-05-09 05:18:35.473803	2019-06-13 05:28:39.566374	\N	17.7144109999999984	83.2941509999999994	\N	3.79999999999999982	Visakhapatnam
584	Godavari Restaurant	Shop No. 69-2-37, High School Rd, Sriharipuram, Visakhapatnam, Andhra Pradesh 530011, India	094941 86438	2018-05-09 05:18:38.207762	2019-06-13 05:28:39.574731	\N	17.6896464999999985	83.236313999999993	\N	3.39999999999999991	Visakhapatnam
585	Vilas Family Restaurant	1, Vizag - Srikakulam Hwy, Anand Nagar, Pothinamallayya Palem, Visakhapatnam, Andhra Pradesh 530041, India	088867 92888	2018-05-09 05:18:40.223482	2019-06-13 05:28:39.583083	\N	17.8017098000000011	83.3526930999999962	http://www.restaurantsinvizag.com/madhurawada/	3.60000000000000009	Visakhapatnam
586	4 Seasons, Visakhapatnam, Restaurant	Telugu Talli Flyover, CBM Compound, Dondaparthy, Railway New Colony, Visakhapatnam, Andhra Pradesh 530016, India	0891 662 0068	2018-05-09 05:18:41.485019	2019-06-13 05:28:39.591424	\N	17.7245440000000016	83.3091309999999936	\N	4.20000000000000018	Visakhapatnam
587	Six Degree's	1-83-29, Opposite Pollock Lotus School, MVP Double Rd, Sector 4, Sector 5, MVP Colony, Visakhapatnam, Andhra Pradesh 530017, India	089127 93793	2018-05-09 05:18:42.59338	2019-06-13 05:28:39.599712	\N	17.7419243000000009	83.3313837000000035	\N	4	Visakhapatnam
588	Jollee Bee	10-1-24, Valanki Plaza, Sampath Vinayaka Temple Road, CBM Compound, Asilmetta, CBM Compound Rd, CBM Compound, Asilmetta, Visakhapatnam, Andhra Pradesh 530003, India	0891 666 5859	2018-05-09 05:18:44.385188	2019-06-13 05:28:39.608076	\N	17.7245871000000008	83.309534400000004	\N	4.09999999999999964	Visakhapatnam
589	Mayuri Restaurant	Beach Rd, RK Beach, Beside KFC Chicken, Paanduranga Puram, Visakhapatnam, Andhra Pradesh 530003, India	\N	2018-05-09 05:18:45.963714	2019-06-13 05:28:39.616486	\N	17.7120213	83.3182833999999986	\N	3.39999999999999991	Visakhapatnam
590	Plot 17	plot 17, gangapur layout, near governors bungalow, 530002, Siripuram, Visakhapatnam, Andhra Pradesh 530002, India	085001 44144	2018-05-09 05:18:47.765853	2019-06-13 05:28:39.624832	\N	17.7195186000000007	83.3152299000000056	http://www.plot17.in/	4.29999999999999982	Visakhapatnam
591	Percolator Coffee House	Beach Rd, Pandurangapuram, Maharani Peta, Visakhapatnam, Andhra Pradesh 530003, India	0891 666 6123	2018-05-09 05:18:49.437057	2019-06-13 05:28:39.633181	\N	17.7126741999999986	83.3198351000000059	\N	4	Visakhapatnam
592	Hotel Nimantran	50-15-151/1, Ranga St, Near By Main Road, Daba Gardens, Allipuram, Visakhapatnam, Andhra Pradesh 530020, India	\N	2018-05-09 05:18:51.940894	2019-06-13 05:28:39.641498	\N	17.7155382999999986	83.2993332000000066	\N	4	Visakhapatnam
593	Palm Beach Hotel	Beach Rd, East Point Colony, Pedda Waltair, Visakhapatnam, Andhra Pradesh 530017, India	080082 00122	2018-05-09 05:18:54.081409	2019-06-13 05:28:39.649798	\N	17.7211181000000018	83.3357885000000067	http://palmbeachhotel.in/	4.20000000000000018	Visakhapatnam
594	Sea Inn - Raju Ka Dhaba	Vizag- Bhimli Road, Rushikonda, Visakhapatnam, Andhra Pradesh 530045, India	099890 12102	2018-05-09 05:18:55.950476	2019-06-13 05:28:39.658173	\N	17.7838831000000006	83.3829527999999982	http://seainn.info/	4.09999999999999964	Visakhapatnam
596	Jai Jagannath Restaurant	Waltair Main Rd, NTR Circle, Nehru Nagar, Ram Nagar, Visakhapatnam, Andhra Pradesh 530002, India	088978 94904	2018-05-09 05:18:59.595057	2019-06-13 05:28:39.668597	\N	17.7175772999999985	83.3097446000000019	\N	3.79999999999999982	Visakhapatnam
597	Hotel Dakshin	47-11-20/5, 1st Lane, Opposite Hotel Sarovar, Dwaraka Nagar, Visakhapatnam, Andhra Pradesh 530016, India	080960 58888	2018-05-09 05:19:00.466611	2019-06-13 05:28:39.674734	\N	17.7258174000000004	83.3065043000000003	https://www.itchotels.in/hotels/hyderabad/itckakatiya/dining/dakshin.html	2.70000000000000018	Visakhapatnam
598	Tandoori Treats	10-1-44/1, VIP Rd, CBM Compound, Opposite IDBI Bank, Siripuram, Visakhapatnam, Andhra Pradesh 530003, India	096666 97651	2018-05-09 05:19:02.699787	2019-06-13 05:28:39.683154	\N	17.7251839000000011	83.3166958000000051	\N	3.60000000000000009	Visakhapatnam
599	Sri Janaki Ram Family Restaurant	7-17-1, Old Gajuwaka, Chaitanya Nagar, Gajuwaka, Visakhapatnam, Andhra Pradesh 530026, India	098498 19585	2018-05-09 05:19:04.007565	2019-06-13 05:28:39.691492	\N	17.6843214000000017	83.2020150000000029	\N	3.79999999999999982	Visakhapatnam
600	TFL	Door No. 36-11-7/A, Shanti Nagar 1st Line, Jammi Chettu Center, Mughal Raj Puram, Shanti Nagar, Labbipet, Vijayawada, Andhra Pradesh 520010, India	070950 04567	2018-05-09 05:20:52.820179	2019-06-13 05:28:39.699752	\N	16.506571000000001	80.643763000000007	\N	4	Vijayawada
601	Rasoie	No. 40-1-29, Mahatma Gandhi Rd, Sidhartha Nagar, Labbipet, Revenue Colony Park, Sidhartha Nagar, Labbipet, Vijayawada, Andhra Pradesh 520010, India	0866 248 8585	2018-05-09 05:20:56.910234	2019-06-13 05:28:39.708188	\N	16.5009569999999997	80.6462389999999942	\N	4	Vijayawada
602	Manor Food Plaza	40-5-16, MG Road, Labbipet, Opp. Savitri Netralayam, Acharya Ranga Nagar, Vijayawada, Andhra Pradesh 520010, India	0866 246 4455	2018-05-09 05:20:58.960962	2019-06-13 05:28:39.716472	\N	16.5021529999999998	80.6488630000000057	http://www.hoteldvmanor.com/	3.89999999999999991	Vijayawada
603	Cross Roads Restaurant	No. 27-6-141, Prakasam Road, Governorpet, Governorpet, Vijayawada, Andhra Pradesh 520002, India	0866 257 2424	2018-05-09 05:21:00.747873	2018-05-09 05:21:00.747873	ChIJp6xdBQLwNToRHZfDSvTtUi4	16.5117772000000009	80.6264070000000004	\N	3.60000000000000009	Vijayawada
607	Sri Anjaneya Restaurants	27-18-104, Congress Office Rd, Near Navarang Theater, Governorpet, Vijayawada, Andhra Pradesh 520002, India	098085 58888	2018-05-09 05:21:10.753579	2018-05-09 05:21:10.753579	ChIJf8Tg7QHwNToRzIl43x1EZ5U	16.5114078999999982	80.6279123999999996	http://anjaneyarestaurants.com/	3.79999999999999982	Vijayawada
625	Tamarind Restaurant	48-10-15/1, National Highway 5, Opposite NTR Health University, Sri Ramachandra Nagar, Nagarjuna Nagar, Sri Ramachandra Nagar, Vijayawada, Andhra Pradesh 520007, India	0866 254 3389	2018-05-09 05:21:50.973504	2018-05-09 05:21:50.973504	ChIJN1agvCzlNToR7LeW6bRTPRQ	16.5153199999999991	80.6707298999999978	\N	3.5	Vijayawada
628	Cross Roads Restaurant	32, Siddhartha College Road, Near Jammichuttu, Moghalrajpuram, Labbipet, Madhu Gardens, Christurajupuram, Vijayawada, Andhra Pradesh 520010, India	0866 246 4949	2018-05-09 05:21:57.200606	2018-05-09 05:21:57.200606	ChIJ6xS3_a36NToR3ijQBLjgnM0	16.5076186000000007	80.6430457000000018	http://crossroadshotel.in/	3.79999999999999982	Vijayawada
605	RR Durbar	# 40-7-3, Near Jammichettu Centre, Moghalarajapuram, Sidhartha Nagar, Labbipet, Vijayawada, Andhra Pradesh 520010, India	0866 248 3270	2018-05-09 05:21:04.799232	2019-06-13 05:28:39.733185	\N	16.5055382000000002	80.6443473000000068	http://business.google.com/website/rr-durbar	3.5	Vijayawada
606	Barbeque Pride	Trendset Mall, 2nd Floor, Opposite Food Court, Benz Circle, Sai Nagar, Kala Nagar, Acharya Ranga Nagar, Vijayawada, Andhra Pradesh 520010, India	0866 665 6633	2018-05-09 05:21:08.498634	2019-06-13 05:28:39.741572	\N	16.4982875	80.6537313999999981	http://barbequepride.com/	4.09999999999999964	Vijayawada
608	The New Dolphin's Family Restaurant A.C.	D.No 26-12-72, Hotel Jagapathi Complex Film Chamber St, Opposite Sailaja Theater, Gandhi Nagar, Vijayawada, Andhra Pradesh 520003, India	0866 257 1740	2018-05-09 05:21:12.564099	2019-06-13 05:28:39.751845	\N	16.5166764000000015	80.6264546999999965	http://storendoor.com/order/dolphins/	3.60000000000000009	Vijayawada
609	anjaneya restaurants,opp : Ramineni, LabbiPet	#39-1-67, opp :, Ramineni St, Labbipet, Vijayawada, Andhra Pradesh 520010, India	098087 78888	2018-05-09 05:21:14.356363	2019-06-13 05:28:39.758195	\N	16.5027293999999998	80.6399320999999958	http://www.srianjaneyarestaurants.com/	3.60000000000000009	Vijayawada
610	New Taj Restaurant	M G Road, Opp. Andhra Bank, Patamata, Benz Circle, JD Nagar, Patamata, Vijayawada, Andhra Pradesh 520010, India	0866 247 1583	2018-05-09 05:21:16.220771	2019-06-13 05:28:39.766525	\N	16.4932149999999993	80.6644880000000057	\N	3.60000000000000009	Vijayawada
611	Food Republic	MG Road, Revenue Colony Park, Near Murali Fortune Park, Revenue Colony Park, Sidhartha Nagar, Labbipet, Vijayawada, Andhra Pradesh 520010, India	093392 34234	2018-05-09 05:21:18.382671	2019-06-13 05:28:39.774822	\N	16.5014070000000004	80.6465630000000004	http://business.google.com/website/foodrepublic	4.09999999999999964	Vijayawada
612	Sarovar Mess	26-3-44, Rama Rao Street, Gandhi Nagar, Vijayawada, Andhra Pradesh 520003, India	0866 257 6620	2018-05-09 05:21:20.342757	2019-06-13 05:28:39.783178	\N	16.5178460999999999	80.6278805000000034	\N	4.29999999999999982	Vijayawada
613	Sri Ramayya Mess And Caterers	Prakasam Road, Venkatswara Rao Street, Governorpet, Vijayawada, Andhra Pradesh 520002, India	0866 657 2212	2018-05-09 05:21:22.222924	2019-06-13 05:28:39.791513	\N	16.511087100000001	80.6304111999999975	http://ramayyamess.business.site/	4	Vijayawada
614	Sweet Magic	M. G.ROAD Opp.D .V.MANOR.. Chandramouli Puram, Chandra Mouli Puram, Sriram Nagar, Vijayawada, Andhra Pradesh 520010, India	0866 247 3223	2018-05-09 05:21:24.980184	2019-06-13 05:28:39.799831	\N	16.4996779999999994	80.6483800000000031	http://www.sweetmagic.co.in/	3.89999999999999991	Vijayawada
615	Babai Hotel	N.R.P Road, Gandhi Nagar, Vijayawada, Andhra Pradesh 520003, India	098480 64321	2018-05-09 05:21:26.835755	2019-06-13 05:28:39.808168	\N	16.5172385999999989	80.6265005000000059	\N	4	Vijayawada
616	Violin Restaurant	Guru Nanak Road, Beside S.B.H. ATM, Teacher's Colony, Benz Circle, Vijayawada, Andhra Pradesh 520007, India	0866 248 9333	2018-05-09 05:21:30.198373	2019-06-13 05:28:39.816556	\N	16.5038604000000007	80.6642637000000065	\N	3.60000000000000009	Vijayawada
617	Idly N Idly	Back Side Of Relance Fresh, MG Road, Acharya Ranga Nagar, Benz Circle, Vijayawada, Andhra Pradesh 520010, India	097046 41286	2018-05-09 05:21:32.32371	2019-06-13 05:28:39.824908	\N	16.4991462999999996	80.6525249000000031	\N	3.60000000000000009	Vijayawada
618	Naidu Gari Kunda Biryani	Indira Gandhi Stadium Complex, Food Court, Opp. Pratyusha Pet Care, Labbipet, Vijayawada, Andhra Pradesh 520002, India	093937 87847	2018-05-09 05:21:34.74997	2019-06-13 05:28:39.833239	\N	16.5052289999999999	80.6367649999999969	\N	4.20000000000000018	Vijayawada
619	Monk's Kitchen	54-20-15, Beside Med Plus, Guru Nanak Colony Road, Beside Med Plus, Guru Nanak Colony, Vijayawada, Andhra Pradesh 520008, India	0866 246 6654	2018-05-09 05:21:37.130477	2019-06-13 05:28:39.841559	\N	16.5032679999999985	80.6674040000000048	http://business.google.com/website/monkskitchen	4	Vijayawada
620	Alankar Restaurant	Kalyanachakravarthi Complex, Vuyyur Zamindar St, Gandhi Nagar, Vijayawada, Andhra Pradesh 520003, India	0866 652 3366	2018-05-09 05:21:39.435327	2019-06-13 05:28:39.849916	\N	16.5166317000000014	80.6280950999999959	\N	3.70000000000000018	Vijayawada
621	Burger King, vijayawada	3rd Floor, PVP square Mall, Opp.petrol Bunk, MG Road, Labbipet, Labbipet, Vijayawada, Andhra Pradesh 520010, India	0866 676 7969	2018-05-09 05:21:41.493196	2019-06-13 05:28:39.858222	\N	16.5025714000000008	80.6428516999999943	http://www.burgerkingindia.in/	4.09999999999999964	Vijayawada
622	Hotel Jayadurga	Eluru Road, Besant Road,, Near Apsara Theatre, Kaleswara Rao Road, Governorpet, Vijayawada, Andhra Pradesh 520002, India	0866 257 6884	2018-05-09 05:21:43.345637	2019-06-13 05:28:39.866556	\N	16.5128309000000009	80.6261221999999975	http://hotel-jayadurga.business.site/	3.89999999999999991	Vijayawada
623	midas taste buds	Near Jammi Chettu Centre, Beside Siddhartha Public School,, Moghalrajpuram, Sidhartha Nagar, Labbipet, Vijayawada, Andhra Pradesh 520010, India	0866 247 9913	2018-05-09 05:21:45.025909	2019-06-13 05:28:39.87652	\N	16.5054866999999987	80.6444924999999984	\N	3.39999999999999991	Vijayawada
624	Blue Fox Restaurant	27-20-10, Museum Road, Governorpet, Near Big Bazar, Governorpet, Vijayawada, Andhra Pradesh 520002, India	093917 82838	2018-05-09 05:21:47.682166	2019-06-13 05:28:39.88322	\N	16.5098973999999998	80.6284583000000055	http://bluefoxrestaurant.com/	3.89999999999999991	Vijayawada
626	Biryanis And More	40-1-52/5I, Sai Nag Complex, Opp. HDFC Bank M. G. Road Acharya Ranga Nagar, Acharya Ranga Nagar, Vijayawada, Andhra Pradesh 520010, India	070322 02222	2018-05-09 05:21:53.011506	2019-06-13 05:28:39.893898	\N	16.4987999999999992	80.6519289999999955	https://biryanis.com/vijayawada	4	Vijayawada
627	Seven Days Restaurant	60-9-1/A, Pinnamaneni Polyclinic Road, Siddhartha Nagar, Kedareswarapeta, Siddhartha Nagar, Vijayawada, Andhra Pradesh 520001, India	\N	2018-05-09 05:21:55.270612	2019-06-13 05:28:39.899856	\N	16.5033005000000017	80.6514049000000028	http://www.sevendayscafe.com/	3.5	Vijayawada
686	Jayashree Restaurant	Usha Bazar, Agartala, Tripura 799009, India	\N	2018-05-14 09:47:33.448431	2019-06-13 05:28:39.910128	\N	23.8888394999999996	91.244673700000007	\N	2.89999999999999991	Agartala
635	Barbeque Nation	3rd Floor, 40-1-147, CPR Hotel Fortune, Murali Park, MG Road, Labbipet, Brindavan Colony, Sriram Nagar, Vijayawada, Andhra Pradesh 520008, India	080990 86060	2018-05-09 05:22:15.370854	2018-05-09 05:22:15.370854	ChIJv58o7br6NToROPPDiCZ-HTU	16.5002969999999998	80.6457520000000017	http://www.barbeque-nation.com/	4.40000000000000036	Vijayawada
641	Sri Anjaneya Restaurants	no 76, 8-20, Crombway Rd, Bhavanipuram, Housing Board Colony, Vijayawada, Andhra Pradesh 520012, India	0866 241 1888	2018-05-09 05:22:24.660751	2018-05-09 05:22:24.660751	ChIJ_ZMjuc7vNToRw2Kd2dnAaaQ	16.5269089999999998	80.5947010000000006	http://business.google.com/website/srianjaneyarestaurants	3.70000000000000018	Vijayawada
630	Khaan Saab Restaurant	40-1-35,Vanisree Building,MG Road,Beside RS Brothers, Revenue Colony Park, Sidhartha Nagar, Labbipet, Vijayawada, Andhra Pradesh 520010, India	091006 67666	2018-05-09 05:22:01.38455	2019-06-13 05:28:39.92498	\N	16.5009146000000015	80.646437199999994	http://www.khaansaab.com/	3.79999999999999982	Vijayawada
631	Kingdom Ice Cream Parlour and Fast Food Restaurant	Route No. 5 ,SBI Building,Madhu Gardens Center,Prajasakthi Nagar, Labbipet, Vijayawada, Andhra Pradesh 520010, India	0866 248 5898	2018-05-09 05:22:05.000422	2019-06-13 05:28:39.944639	\N	16.5079059999999984	80.6420533000000006	\N	3.70000000000000018	Vijayawada
632	Bawarchi The Family Restaurant	Opp Stella College, Frontage Road, Gayatri Nagar, Gayatri Nagar, Krishna Nagar, Vijayawada, Andhra Pradesh 520010, India	0866 248 8004	2018-05-09 05:22:07.937044	2019-06-13 05:28:39.950039	\N	16.5008212999999984	80.6566020000000066	http://storendoor.com/order/bawarchi/	3.70000000000000018	Vijayawada
633	Golden Pavilion Family Restaurant	Door No. 27-12-39, Bandar Road, Near Raghavaiah Park, Opposite Vijaya Krishna Super Bazar, Governorpet, Vijayawada, Andhra Pradesh 520002, India	091778 61508	2018-05-09 05:22:11.329406	2019-06-13 05:28:39.958352	\N	16.5093509999999988	80.6242206999999951	http://goldenpavilion.in/	3.5	Vijayawada
634	Sri Anjaneya Vilas	Brp Road, Opposite Kaleswararao Market, 1 Town, Kaleswara Rao Market, Tarapet, Vijayawada, Andhra Pradesh 520001, India	0866 242 2434	2018-05-09 05:22:13.115176	2019-06-13 05:28:39.966602	\N	16.512221199999999	80.6130808000000059	\N	4.20000000000000018	Vijayawada
636	Southern Spice	No.40-6-22/2, Hotel Fortune Muralipark Road, Opposite Revenue Colony Park, Beside BSNL Office, Revenue Colony Park, Sidhartha Nagar, Labbipet, Vijayawada, Andhra Pradesh 520010, India	0866 663 3333	2018-05-09 05:22:17.530056	2019-06-13 05:28:39.976851	\N	16.5031673999999988	80.6467719999999986	\N	3.89999999999999991	Vijayawada
637	Dinesh Home Food	Syam Associates, Revenue Colony Park, Sidhartha Nagar, Labbipet, Vijayawada, Andhra Pradesh 520002, India	076758 14999	2018-05-09 05:22:19.079656	2019-06-13 05:28:39.983264	\N	16.5019294000000016	80.6486026999999979	\N	5	Vijayawada
638	SS Food Plaza Family Restaurant	Opp : School Of Planning &Architecture, Nidamanuru High Way, Gudavalli, Vijayawada, Andhra Pradesh 521104, India	088855 18585	2018-05-09 05:22:20.074077	2019-06-13 05:28:39.991599	\N	16.5119100000000003	80.7420089999999959	http://business.google.com/website/ss-food-plaza-family-restaurant	2.70000000000000018	Vijayawada
639	Akshaya's Food Express	Siddhartha College Rd, Moghalrajpuram, Sidhartha Nagar, Labbipet, Vijayawada, Andhra Pradesh 520010, India	0866 666 6100	2018-05-09 05:22:21.475645	2019-06-13 05:28:39.999909	\N	16.5065866999999997	80.6450794999999943	\N	4.29999999999999982	Vijayawada
640	Rainbow Restaurant	#40/6/21/6, sree square, ground floor,, siddartha public school road, mogalrajpuram,, Revenue colony, Revenue Colony Park, Sidhartha Nagar, Labbipet, Vijayawada, Andhra Pradesh 520010, India	089776 64444	2018-05-09 05:22:22.509057	2019-06-13 05:28:40.008304	\N	16.5048229999999982	80.6474050000000062	\N	4.79999999999999982	Vijayawada
642	BayLeaves Kitchen	Door 40-5-3, Tickle Road, Sri Natrajan Guljar Road, Acharya Ranga Nagar, Benz Circle, Vijayawada, Andhra Pradesh 520010, India	0866 654 9999	2018-05-09 05:22:26.577205	2019-06-13 05:28:40.018546	\N	16.5015681000000001	80.6487704999999977	http://www.bayleaves.in/	3.89999999999999991	Vijayawada
643	Cube Multicuisine Restaurant	Near Akshara Public School, Bandar Road, Ashok Nagar, M.G.Road, Ayyappa Nagar, Vijayawada, Andhra Pradesh 520007, India	074166 61666	2018-05-09 05:22:31.986693	2019-06-13 05:28:40.024926	\N	16.4849122000000001	80.6827489000000071	\N	3.60000000000000009	Vijayawada
644	Bay Leaves Kitchen	Giripuram, Kasturibaipet, Giripuram, Labbipet, Vijayawada, Andhra Pradesh 520010, India	078425 47777	2018-05-09 05:22:34.135029	2019-06-13 05:28:40.033306	\N	16.5071271000000017	80.6401275000000055	http://bayleaves.in/	4.20000000000000018	Vijayawada
645	Sri Anjaneya Fast Food	Shop No. 12, Stadium Road, Bandar Road, Buckinghampeta, Labbipet, Vijayawada, Andhra Pradesh 520002, India	\N	2018-05-09 05:22:36.338631	2019-06-13 05:28:40.041635	\N	16.5044299999999993	80.6365317000000061	\N	3.60000000000000009	Vijayawada
646	New Good Morning Tea & Fast Food	33-25-39, Puspha Hotel Road, Suryaraopet, Sitharamapuram, Vijayawada, Andhra Pradesh 520002, India	095054 39577	2018-05-09 05:22:38.997705	2019-06-13 05:28:40.049954	\N	16.5135992999999992	80.6393436999999977	http://business.google.com/website/new-good-morning-tea-fast-food/	4	Vijayawada
647	Santos Kitchen	60-5-10, Siddarth Nagar 2nd Lane, Polyclinic Road, Moghalrajpuram, Kedareswarapeta, Siddhartha Nagar, Vijayawada, Andhra Pradesh 520010, India	0866 247 3666	2018-05-09 05:22:40.755489	2019-06-13 05:28:40.058271	\N	16.5039298999999993	80.6497004000000004	http://santos.co.in/	4.09999999999999964	Vijayawada
648	Southern Spice Restaurant & Takeaway	3-14, 40-5/3-14, Sri Natrajan Guljar Road, Shyam Nagar, Acharya Ranga Nagar, Labbipet, Vijayawada, Andhra Pradesh 520010, India	099496 86333	2018-05-09 05:22:42.54489	2019-06-13 05:28:40.066582	\N	16.5018184999999988	80.6487790000000047	\N	3.79999999999999982	Vijayawada
649	Shiridi Restaurant	Kanaka Durgamma Temple Rd, Departure Block, Pandit Nehru Bus Stop, Krishnalanka, Vijayawada, Andhra Pradesh 520003, India	086424 33056	2018-05-09 05:22:44.593891	2019-06-13 05:28:40.074938	\N	16.5088179000000004	80.6161364999999961	\N	3.39999999999999991	Vijayawada
650	Bismillah Paradise Dum Biryani Restaurant	40-2-3/3E, Opp. PVP Exit Gate, Gouse Street, MG Rd, Labbipet, Sidhartha Nagar, Labbipet, Vijayawada, Andhra Pradesh 520010, India	0866 248 7303	2018-05-09 05:22:46.584008	2019-06-13 05:28:40.083241	\N	16.5023751999999995	80.6441576999999938	\N	3.70000000000000018	Vijayawada
651	DOSA PALACE	13, Polyclinic Road, Kedareswarapeta, Siddhartha Nagar, Benz Circle, Vijayawada, Andhra Pradesh 520010, India	\N	2018-05-09 05:22:48.845792	2019-06-13 05:28:40.091591	\N	16.5038155000000017	80.6489463000000057	\N	3.89999999999999991	Vijayawada
652	Ruchi Restaurant	38-8-52, Opp SP Bunglaw, Mahatma Gandhi Rd, Punammathota, Labbipet, Vijayawada, Andhra Pradesh 520010, India	0866 247 1241	2018-05-09 05:22:51.025948	2019-06-13 05:28:40.099899	\N	16.5052260000000004	80.6328890000000058	\N	3.5	Vijayawada
653	Royal Food Court	# Eluru Rod, Kothavanthena Center, Anjaneya Swamy Temple, Durga Agraharam, Arundalpet, Governorpet, Vijayawada, Andhra Pradesh 520002, India	095424 56572	2018-05-09 05:22:53.374931	2019-06-13 05:28:40.108312	\N	16.5154029000000016	80.636919000000006	http://business.google.com/website/royal-food-court	3.70000000000000018	Vijayawada
687	5 Star Fast Food	Ranirbazar, Tripura 799035, India	098622 38944	2018-05-14 09:47:34.402023	2019-06-13 05:28:40.116629	\N	23.8358656999999994	91.3664313000000021	\N	3.60000000000000009	Agartala
655	Kakinada	Kakinada, Andhra Pradesh, India	\N	2018-05-14 06:46:44.729721	2018-05-14 06:46:44.729721	\N	16.9890648000000013	82.247464800000003	\N	\N	\N
680	Cafe Coffee Day	Ginger Hotel, Airport Road, Khejur Bagan, Next To Shri Krishna Mission School, 79 Tilla, Agartala, Tripura 799001, India	0381 241 1333	2018-05-14 09:47:16.485667	2018-05-14 09:47:16.485667	ChIJq5V2V672UzcRKYFAefxMqZE	23.8621943999999999	91.2824743999999981	http://www.cafecoffeeday.com/	3.89999999999999991	Agartala
656	Pizza'ria	B.K. Road, Palace Compound, Palace Compound, Indranagar, Agartala, Tripura 799001, India	094021 55333	2018-05-14 09:46:19.785326	2019-06-13 05:28:40.135545	\N	23.8358032999999985	91.2849001000000015	\N	3.20000000000000018	Agartala
657	Hotel Invitation	SakuntalaRoad, near Aitorma Centrum, Madhyapara, Dhaleswar, Agartala, Tripura 799001, India	094361 21759	2018-05-14 09:46:22.64689	2019-06-13 05:28:40.141684	\N	23.8304870000000015	91.2805673999999954	\N	3.60000000000000009	Agartala
658	MOMOS N MORE	Advisor Chowmuhani, Krishna Nagar, Agartala, Tripura 799001, India	0381 230 3663	2018-05-14 09:46:25.071629	2019-06-13 05:28:40.149961	\N	23.8379472999999997	91.277007999999995	https://www.facebook.com/momos.and.more	4	Agartala
659	Raasta Cafe	Salka Residency, Opp. Nehru Park, Gorkhabasti, 79 Tilla, Agartala, Tripura 799006, India	081318 77317	2018-05-14 09:46:27.519218	2019-06-13 05:28:40.158285	\N	23.854334699999999	91.2831288000000001	\N	3.60000000000000009	Agartala
660	Royal Veg	Airport Road, Gurkhabasti, 79 Tilla, Agartala, Tripura 799006, India	098622 20069	2018-05-14 09:46:29.446341	2019-06-13 05:28:40.166661	\N	23.8572777000000009	91.2820301000000001	\N	3.5	Agartala
661	Ginger Hotel	Khejur Bagan, Airport Road, Opposite Industrial Office, Barjala Mouja, 79 Tilla, Agartala, Tripura 799006, India	0381 241 1333	2018-05-14 09:46:32.522771	2019-06-13 05:28:40.176276	\N	23.8622738000000005	91.2824968000000041	http://www.gingerhotels.com/agartala-hotels/budget-hotels-in-agartala	3.89999999999999991	Agartala
662	Eatopia Zannat	2nd Floor, Agartala City Center, Melarmath, Dhaleswar, Agartala, Tripura 799001, India	088123 80317	2018-05-14 09:46:34.426855	2019-06-13 05:28:40.183224	\N	23.8292254999999997	91.2747942000000023	\N	3.60000000000000009	Agartala
663	Curlies restoraa agartala	Krishna Nagar, Agartala, Tripura 799002, India	097748 85865	2018-05-14 09:46:36.749647	2019-06-13 05:28:40.191506	\N	23.8382329999999989	91.2724429999999955	http://curlies-restoraa-agartala.business.site/	3.89999999999999991	Agartala
664	Sherowali Fast Food	VIP Road, Radha Nagar, Buddhamandir, Abhay Nagar, Agartala, Tripura 799005, India	098563 83737	2018-05-14 09:46:39.185726	2019-06-13 05:28:40.199906	\N	23.8463637000000013	91.2833609000000052	\N	3.5	Agartala
665	Momo 20	Near Bholagiri Ashram, Bholananda Palli, 79 Tilla, Agartala, Tripura 799006, India	098639 34276	2018-05-14 09:46:42.031683	2019-06-13 05:28:40.208272	\N	23.8587917999999988	91.2815630999999996	http://momo20.business.site/	3.79999999999999982	Agartala
666	Nandan's Food World	ML Plaza, Mantribari Rd Ext, Post office chowmuhani, Dhaleswar, Agartala, Tripura 799001, India	084150 42424	2018-05-14 09:46:44.556245	2019-06-13 05:28:40.216653	\N	23.8285030000000013	91.2789711000000068	\N	3.5	Agartala
667	Kurry Club	H.G.Basak Road, Agartala, Dhaleswar, Agartala, Tripura 799001, India	0381 238 0101	2018-05-14 09:46:46.257396	2019-06-13 05:28:40.224966	\N	23.8294233999999996	91.2794422000000054	\N	3.39999999999999991	Agartala
668	Khunti Kadai	H.G.B. Road, Opp. Sarkar Nursing Home, Dhaleswar, Agartala, Tripura 799001, India	098625 17780	2018-05-14 09:46:48.35154	2019-06-13 05:28:40.233315	\N	23.8293414000000006	91.277165999999994	\N	3.79999999999999982	Agartala
669	Abhishek Restaurant	Thakur Pally Rd, Palace Compound, RdPalace Compound, Agartala, Tripura 799001, India	\N	2018-05-14 09:46:51.127369	2019-06-13 05:28:40.241643	\N	23.8341625999999991	91.279890800000004	\N	3.89999999999999991	Agartala
670	Delicious Fast Food And Tiffin Hub	ONGC Bank Chowmuhani, Near UBI Bank, Badharghat, Agartala, Tripura 799014, India	087319 50796	2018-05-14 09:46:52.969214	2019-06-13 05:28:40.24987	\N	23.7927120000000016	91.2684514999999976	\N	3.89999999999999991	Agartala
671	Cafe Coffee Day - Mantribari Road	Rupasi Cinema, Mantribari Road, Dhaleswar, Dhaleswar, Agartala, Tripura 799001, India	084159 38237	2018-05-14 09:46:55.478846	2019-06-13 05:28:40.258262	\N	23.8285298999999995	91.2792333000000013	https://www.cafecoffeeday.com/	3.79999999999999982	Agartala
672	Khana Khazana Restaurant	East Thana Road, Banamalipur, Indranagar, Agartala, Tripura 799001, India	098621 10561	2018-05-14 09:46:57.812008	2019-06-13 05:28:40.266619	\N	23.8351514000000009	91.2870891999999969	\N	3.5	Agartala
673	Fast Food Centre	Unnamed Road, Arundhauti Nagar, Agartala, Tripura 799003, India	\N	2018-05-14 09:46:59.938844	2019-06-13 05:28:40.274873	\N	23.8105222999999988	91.2773447000000004	\N	5	Agartala
674	Litttle Chef Agartala	4,Mantribari Road Old RMS Chowmoni Corporate House SBI RASMECCC Building, Madhyapara, Dhaleswar, Agartala, Tripura 799001, India	087948 32701	2018-05-14 09:47:00.891663	2019-06-13 05:28:40.283265	\N	23.8313489999999994	91.278854999999993	\N	3.70000000000000018	Agartala
675	Excellence Fast Food	Ronaldsay Rd, Jay Nagar, Agartala, Tripura 799001, India	\N	2018-05-14 09:47:02.825946	2019-06-13 05:28:40.29164	\N	23.8315227999999983	91.2694572999999991	\N	2.89999999999999991	Agartala
676	Green Chilli	37, Akhaura Rd, Old RMS Chowmuhani, Krishna Nagar, Agartala, Tripura 799001, India	097745 22953	2018-05-14 09:47:09.159095	2019-06-13 05:28:40.300053	\N	23.8317376000000003	91.2809304000000026	http://www.greenchillirestaurant.in/	3.89999999999999991	Agartala
677	Chatpata	63, Central Road, Dhaleswar, Santipara, Dhaleswar, Agartala, Tripura 799001, India	097746 02792	2018-05-14 09:47:10.742601	2019-06-13 05:28:40.308308	\N	23.8288384999999998	91.2825732999999957	\N	3.89999999999999991	Agartala
678	Restaurant Rajdarbar	BK Road, Banamalipur, Indranagar, Banamalipur, Indranagar, Agartala, Tripura 799001, India	0381 232 3387	2018-05-14 09:47:12.524049	2019-06-13 05:28:40.316712	\N	23.8390768000000008	91.2852531999999997	\N	4.09999999999999964	Agartala
679	ROCK & ROLL	Krishna Nagar,Near Sanghati Club, Krishna Nagar, Agartala, Tripura 799001, India	097747 14829	2018-05-14 09:47:14.573145	2019-06-13 05:28:40.325049	\N	23.8384855000000009	91.2716992999999945	\N	3.60000000000000009	Agartala
681	AFC	Unit No. 315, 316 & 317, 2nd Floor, Aitorma Agartala Sentrum, Sakuntala Road, Madhyapara, Dhaleswar, Agartala, Tripura 799001, India	0381 238 4095	2018-05-14 09:47:19.700945	2019-06-13 05:28:40.335561	\N	23.8304584999999989	91.2802930999999944	http://www.agartalafriedchicken.webs.com/	2.89999999999999991	Agartala
682	Taj Sweets and Veg Restaurant	Orient Chowmuhani, Indranagar, Agartala, Tripura 799001, India	0381 230 3017	2018-05-14 09:47:23.878718	2019-06-13 05:28:40.341683	\N	23.8325725000000013	91.2806556000000029	\N	3.60000000000000009	Agartala
683	Restaurant Blossom	Inside Executive Inn, Mantribari Road, Dhaleswar, Agartala, Tripura 799001, India	0381 232 5047	2018-05-14 09:47:26.590877	2019-06-13 05:28:40.350019	\N	23.8301398000000013	91.2785281999999967	\N	3	Agartala
684	MAMA Hotel And Restaurant	Usha Bazar, Agartala, Tripura 799009, India	\N	2018-05-14 09:47:30.050976	2019-06-13 05:28:40.358313	\N	23.8923835000000011	91.2449948999999947	\N	3.10000000000000009	Agartala
685	Sankar Hotel	Netaji Chowmuhani, Dhaleswar, Agartala, Tripura 799001, India	094364 62462	2018-05-14 09:47:31.964579	2019-06-13 05:28:40.366656	\N	23.8269970999999998	91.2790411999999947	http://dialeat.com/store/menu/merchant/more1111	2.89999999999999991	Agartala
690	Feast	Thakur Palli Road, T.G. Road Kar Chowmuhani, Krishna Nagar, Agartala, Tripura 799001, India	094361 29264	2018-05-14 09:47:40.931318	2018-05-14 09:47:40.931318	ChIJJ17A-xX0UzcROkwjyqWN8Eo	23.834473899999999	91.2702086000000037	\N	3.39999999999999991	Agartala
715	Subway	Bara Bazar, Dawrpui, Aizawl, Mizoram 796001, India	\N	2018-05-14 09:48:47.960839	2018-05-14 09:48:47.960839	ChIJSTTbtLeUTTcRPSRAWICaEYQ	23.7305464000000015	92.7168362999999971	http://www.subway.com/en-us	3.89999999999999991	Aizawl
689	Shyamasree Restaurant	Lane No:1, Battala, Near Shiv Mandir, Battala, Agartala, Tripura 799001, India	0381 231 0671	2018-05-14 09:47:38.790979	2019-06-13 05:28:40.38432	\N	23.8291338999999986	91.2690821999999997	https://www.facebook.com/shyamasree.restaurent/info?tab=overview	2.89999999999999991	Agartala
691	Wow Shawarma Agartala	Opp. BJP Party Office, B.K. Chowmohani, Krishna Nagar, Agartala, Tripura 799001, India	098624 21269	2018-05-14 09:47:42.758186	2019-06-13 05:28:40.39387	\N	23.8380614000000008	91.2758070999999944	\N	4	Agartala
692	Nirmala Hotel	A.B. Road, Opp.Jute Mill, Bivakananda Chowmuhani, Hapania, Hapania, Agartala, Tripura 799014, India	0381 237 0409	2018-05-14 09:47:45.027577	2019-06-13 05:28:40.399943	\N	23.784362999999999	91.2651630999999952	http://www.nirmalahotel.in/	3.60000000000000009	Agartala
693	Shanghai Bites	Palace Compound, Krishna Nagar, Agartala, Tripura 799002, India	080143 74305	2018-05-14 09:47:47.024052	2019-06-13 05:28:40.408269	\N	23.8352314000000014	91.2796610999999984	\N	3.60000000000000009	Agartala
694	Rolling Joint	Thakur Pally Road ,Opp Shiv Kali Bari, Krishna Nagar, Ker Chowmuhani, Krishna Nagar, Agartala, Tripura 799001, India	080140 51851	2018-05-14 09:47:49.193808	2019-06-13 05:28:40.416742	\N	23.835072499999999	91.2703884000000016	\N	4.5	Agartala
695	Coffee Tea & Me	T.G Road, Near Road Number 3, Ram Nagar, Agartala, Tripura 799002, India	0381 233 2016	2018-05-14 09:47:51.179052	2019-06-13 05:28:40.425094	\N	23.8371521999999985	91.2700602000000032	http://www.cafectm.com/	4	Agartala
696	MAIRANG RESTAURANT	Bolagiri Road, Barjala, Near Shyandan Press, Bhubanban, Agartala, Tripura 799001, India	070051 74327	2018-05-14 09:47:52.935139	2019-06-13 05:28:40.43341	\N	23.8612199999999994	91.2778050000000007	\N	4	Agartala
698	Bhuri Bhoj	Hari Ganga Basak Road, Melarmath, Dhaleswar, Agartala, Tripura 799001, India	098629 34826	2018-05-14 09:47:56.613311	2019-06-13 05:28:40.441755	\N	23.8292576999999994	91.2714347000000004	\N	3.20000000000000018	Agartala
699	Yummies@Pramila Market	Padma Pukur, Krishna Nagar, Agartala, Tripura 799002, India	084148 43271	2018-05-14 09:47:57.110478	2019-06-13 05:28:40.450029	\N	23.8347103999999987	91.2745417999999944	\N	3.79999999999999982	Agartala
700	Tandoor Hut	Krishna Nagar, Bijoy Kumar Chowmuhani, Krishna Nagar, Agartala, Tripura 799001, India	084149 34111	2018-05-14 09:47:57.982293	2019-06-13 05:28:40.458313	\N	23.8381770000000017	91.2746420000000001	\N	3.79999999999999982	Agartala
701	ভোজ-On	Dhaleswar A.A.Road, Dhaleswar, Agartala, Tripura 799007, India	094850 98365	2018-05-14 09:47:59.966227	2019-06-13 05:28:40.466677	\N	23.8328865000000008	91.2959397000000052	http://bhoj-on.business.site/	4.09999999999999964	Agartala
702	Best Dhaba	Laxmipur, Tripura 799210, India	\N	2018-05-14 09:48:02.016522	2019-06-13 05:28:40.475427	\N	23.8762284999999999	91.3574873999999966	\N	3.10000000000000009	Agartala
703	Pizza Hut	HGB Road, Shiv Nagar, Indranagar, Agartala, Tripura 799001, India	096271 41856	2018-05-14 09:48:03.821902	2019-06-13 05:28:40.483382	\N	23.8314570000000003	91.2867777000000018	\N	2.79999999999999982	Agartala
704	Abar Khabo	Jail Ashram Rd, Indranagar, Agartala, Tripura 799007, India	\N	2018-05-14 09:48:04.800132	2019-06-13 05:28:40.491677	\N	23.8354345000000016	91.2934379999999948	\N	3.5	Agartala
705	Bawarchi Resturant	Hari Ganga Basak Rd, Dhaleswar, Agartala, Tripura 799001, India	094361 23322	2018-05-14 09:48:06.967804	2019-06-13 05:28:40.500018	\N	23.8288195999999992	91.2761040000000037	\N	3.79999999999999982	Agartala
706	KFC Agartala	Lakshmi Narayan Bari Rd, Palace Compound, Indranagar, Agartala, Tripura 799001, India	089748 65610	2018-05-14 09:48:09.280809	2019-06-13 05:28:40.508419	\N	23.8341218999999995	91.2807293000000044	\N	3.79999999999999982	Agartala
707	Restaurant Hungrilla	BK Road, Palace Compound, Near Air India City Office, Indranagar, Palace Compound, Indranagar, Agartala, Tripura 799001, India	098629 80217	2018-05-14 09:48:11.835674	2019-06-13 05:28:40.516746	\N	23.8395009999999985	91.2843620000000016	http://restaurant-hungrilla.business.site/	4	Agartala
708	SKF Food World	Chitrakatha Complex, H.G.B Road, Near Post Office, Chowmuhani, Dhaleswar, Agartala, Tripura 799002, India	0381 238 4878	2018-05-14 09:48:15.797219	2019-06-13 05:28:40.525063	\N	23.8294984999999997	91.2797841000000005	\N	4.59999999999999964	Agartala
709	Curry In Hurry - Chakde	Agartala airport, Tripura, Usha Bazar, Agartala, Tripura 799009, India	082580 01313	2018-05-14 09:48:18.702087	2019-06-13 05:28:40.53337	\N	23.8927444999999992	91.2442570999999987	http://chakdecurryinhurry.com/	4.29999999999999982	Agartala
710	Eat NJoy	T.G.Road, Krishna Nagar, Nutanpalli, Krishna Nagar, Agartala, Tripura 799002, India	097740 12370	2018-05-14 09:48:25.557664	2019-06-13 05:28:40.541696	\N	23.8403394000000013	91.270573799999994	\N	4	Agartala
711	Green Touch Resort	Durga Bari, Agartala, Tripura 799001, India	0381 239 7742	2018-05-14 09:48:27.567153	2019-06-13 05:28:40.550023	\N	23.9126103000000008	91.2881643999999994	\N	3.60000000000000009	Agartala
712	Chopstyx Restaurant	F-78, lower chanmari. Below New Life Hospital, Electric Veng, Aizawl, Mizoram 796007, India	097746 64490	2018-05-14 09:48:37.930377	2019-06-13 05:28:40.558377	\N	23.7385903999999996	92.7171069000000045	\N	4.09999999999999964	Aizawl
713	Octangle	Kaisara Road, Aizawl, Mizoram 796001, India	096125 29181	2018-05-14 09:48:40.644646	2019-06-13 05:28:40.566659	\N	23.7367100999999998	92.7130314000000055	\N	4.59999999999999964	Aizawl
714	Red Pepper, Aizawl	Chanmari, Aizawl, Mizoram 796007, India	096123 09411	2018-05-14 09:48:45.135837	2019-06-13 05:28:40.575073	\N	23.739450999999999	92.7167395000000027	http://www.redpepper.com/	4	Aizawl
716	Pemarin Corner Restaurant	B 40 ,First Floor, Millennium Centre, Upper Bazar, Dawrpui, Aizawl, Mizoram 796001, India	0389 234 2000	2018-05-14 09:48:53.920425	2019-06-13 05:28:40.585233	\N	23.7337543999999987	92.7168834000000004	\N	4.29999999999999982	Aizawl
717	TL RESTAURANT	Bawngkawn, Aizawl, Mizoram 796014, India	089747 33803	2018-05-14 09:49:13.375758	2019-06-13 05:28:40.591715	\N	23.7549932999999989	92.7301266999999996	\N	3.29999999999999982	Aizawl
718	Flavour of Korea	Aizawl, Mizoram 796001, India	085879 78991	2018-05-14 09:49:35.161566	2019-06-13 05:28:40.600211	\N	23.7276385000000012	92.7172594999999973	\N	4.09999999999999964	Aizawl
719	Hi Five	Millenium Center, Dawrpui, Aizawl, Mizoram 796007, India	084149 00194	2018-05-14 09:49:48.00485	2019-06-13 05:28:40.608413	\N	23.7335467999999992	92.7169260000000008	http://www.facebook.com/pages/Hi-Five-Restaurant-Aizawl/143769585697003	4.20000000000000018	Aizawl
720	Dig Jam Restaurant	Khatla Kawn, Khatla, Aizawl, Mizoram 796001, India	\N	2018-05-14 09:49:50.540284	2019-06-13 05:28:40.616706	\N	23.7205720999999983	92.7160611999999986	\N	3.79999999999999982	Aizawl
721	KFC Restaurant	Chanmari, Aizawl, Mizoram 796007, India	\N	2018-05-14 09:50:01.171195	2019-06-13 05:28:40.625023	\N	23.738702700000001	92.7165695000000056	https://online.kfc.co.in/	4.09999999999999964	Aizawl
722	Aroma Restaurant	Dawrpui, Aizawl, Mizoram 796007, India	\N	2018-05-14 09:50:09.580364	2019-06-13 05:28:40.633361	\N	23.7338917999999985	92.7175780000000032	\N	4.29999999999999982	Aizawl
723	MYKOP Restaurant	B-57, Main Street, Zarkawt, Aizawl, Mizoram 796001, India	\N	2018-05-14 09:50:12.489173	2019-06-13 05:28:40.641718	\N	23.7377889000000017	92.716602199999997	\N	3.5	Aizawl
724	Crown Restaurant	Main Street, Near Temple Square, Aizawl, Mizoram 796001, India	0389 231 4224	2018-05-14 09:50:13.354706	2019-06-13 05:28:40.650087	\N	23.7272812000000002	92.7178732999999937	\N	3.89999999999999991	Aizawl
725	Jerry's The Restaurant	(Near Power House),, Zarkawt, Electric Veng, Aizawl, Mizoram 796007, India	096158 09904	2018-05-14 09:50:15.263412	2019-06-13 05:28:40.658543	\N	23.7352798000000007	92.7181522999999999	\N	4.09999999999999964	Aizawl
726	Nung Nung Restaurant	College Veng, Aizawl, Mizoram 796005, India	\N	2018-05-14 09:50:20.148485	2019-06-13 05:28:40.666834	\N	23.723924499999999	92.724700900000002	\N	3.60000000000000009	Aizawl
727	KAN RESTAURANT	Unnamed Road, 796005, Venghlui, Aizawl, Mizoram 796005, India	\N	2018-05-14 09:50:27.914862	2019-06-13 05:28:40.675124	\N	23.7237691999999996	92.7265933999999987	\N	3.29999999999999982	Aizawl
728	Top Chef	Dawrpui, Aizawl, Mizoram 796001, India	\N	2018-05-14 09:50:30.379177	2019-06-13 05:28:40.683397	\N	23.7266866999999984	92.7181425999999931	\N	3.89999999999999991	Aizawl
729	David's Kitchen	Chanmari, Aizawl, Mizoram 796012, India	0389 234 1263	2018-05-14 09:50:32.703806	2019-06-13 05:28:40.691863	\N	23.744674100000001	92.7194755999999956	\N	3.60000000000000009	Aizawl
730	Beraw Tlang Restaurant	Aizawl-Seling-Champhai Rd, Aizawl, Mizoram 796017, India	\N	2018-05-14 09:50:35.210786	2019-06-13 05:28:40.700127	\N	23.7314401000000004	92.7610592999999994	\N	3.79999999999999982	Aizawl
731	Curry Pot Restaurant	MG Road, Upper Khatla, Khatla, Aizawl, Mizoram 796001, India	0389 232 4567	2018-05-14 09:50:37.701489	2019-06-13 05:28:40.708505	\N	23.7221541000000009	92.7178877000000057	\N	3.39999999999999991	Aizawl
732	Arya Mess	Khatla, Aizawl, Mizoram 796001, India	\N	2018-05-14 09:50:39.272433	2019-06-13 05:28:40.716829	\N	23.7198938999999989	92.7146795000000026	\N	3.79999999999999982	Aizawl
733	Zam Zam	Dawrpui, Aizawl, Mizoram 796001, India	0389 231 2303	2018-05-14 09:50:40.398626	2019-06-13 05:28:40.725161	\N	23.7266784999999985	92.7181041999999991	\N	4.20000000000000018	Aizawl
734	Matthew's Restaurant&Catering	Chaltlang, Aizawl, Mizoram 796012, India	096121 39158	2018-05-14 09:50:43.177861	2019-06-13 05:28:40.733487	\N	23.7491495000000015	92.7228501999999963	\N	4	Aizawl
735	Funky Kitchen	Aizawl-Mamit-Vanhmun-Kumarghat Rd, Chaltlang, Aizawl, Mizoram 796001, India	\N	2018-05-14 09:50:45.295733	2019-06-13 05:28:40.741787	\N	23.7395722000000013	92.7113930999999951	\N	\N	Aizawl
736	Six Miles	Tanhril Road, Aizawl, Mizoram 796009, India	096122 07605	2018-05-14 09:50:48.190466	2019-06-13 05:28:40.750126	\N	23.7341346000000009	92.6758059000000003	\N	3.5	Aizawl
737	Rami Restaurant	Zarkawt, Aizawl, Mizoram 796001, India	0389 234 0530	2018-05-14 09:50:50.162983	2019-06-13 05:28:40.758492	\N	23.7357106000000009	92.7159730000000053	\N	2.5	Aizawl
738	Tete's Hog 'n' Dine	Bungkawn Veng, Aizawl, Mizoram 796005, India	\N	2018-05-14 09:50:52.059943	2019-06-13 05:28:40.766837	\N	23.7199096999999988	92.7092396000000036	\N	3.79999999999999982	Aizawl
739	Cojoy	Khatla, Aizawl, Mizoram 796001, India	090772 58675	2018-05-14 09:50:54.657669	2019-06-13 05:28:40.775667	\N	23.7229844000000014	92.7171907000000033	\N	3	Aizawl
740	ILMOV FOODS	Vaivakawn, Aizawl, Mizoram 796009, India	096122 02373	2018-05-14 09:50:56.515924	2019-06-13 05:28:40.783512	\N	23.7383728000000005	92.7117176999999941	\N	5	Aizawl
741	Lalhlun Tea Stall	Dawrpui, Aizawl, Mizoram 796001, India	0389 232 9578	2018-05-14 09:50:58.665875	2019-06-13 05:28:40.791763	\N	23.7323608999999998	92.7174952000000019	\N	3.29999999999999982	Aizawl
742	Zira Bawitlung's Home	I.T.I Veng, Aizawl, Mizoram 796005, India	098623 65581	2018-05-14 09:51:00.79138	2019-06-13 05:28:40.800201	\N	23.7195275999999993	92.7323968000000036	\N	5	Aizawl
743	Zonun Restaurent🍝☕	Durtlang Leitan Rd, Durtlang Leitan, Aizawl, Mizoram 796025, India	097745 25933	2018-05-14 09:51:05.288627	2019-06-13 05:28:40.808519	\N	23.7709557999999994	92.7358524999999929	\N	3.70000000000000018	Aizawl
744	Malzo	Zarkawt Main Rd, Chaltlang, Aizawl, Mizoram 796007, India	0389 234 1807	2018-05-14 09:51:14.625588	2019-06-13 05:28:40.816846	\N	23.7346710999999999	92.7169727999999935	\N	4.5	Aizawl
745	Jai Jawan Stall	Ngaizel Rd, Kulikawn, Aizawl, Mizoram 796005, India	098623 73889	2018-05-14 09:51:16.124154	2019-06-13 05:28:40.825178	\N	23.7054210000000012	92.7176865999999933	\N	4	Aizawl
746	MK Restaurant	National Highway 54, Aizawl, Mizoram 796017, India	094851 20280	2018-05-14 09:51:29.366472	2019-06-13 05:28:40.833489	\N	23.7389681999999986	92.7473343999999997	https://www.mkrestaurant.com/en	4.5	Aizawl
747	Oliva Restaurant	Aizawl, Mizoram 796001, India	0389 232 0040	2018-05-14 09:51:31.787423	2019-06-13 05:28:40.841836	\N	23.7355298999999995	92.7139770999999939	\N	4	Aizawl
748	Royz The Southside Restaurant	C-53, Mission Veng Rd, Mission Veng, Khatla South, Aizawl, Mizoram 796001, India	\N	2018-05-14 09:51:35.59586	2019-06-13 05:28:40.850102	\N	23.7134779000000009	92.7198960999999997	\N	4.20000000000000018	Aizawl
749	Zamzo Grill& Kitchen Restaurant(Hotel Floria)	A-13, Chanmari-Lower Zarkawt-Israel Point, Zarkawt, Chanmari-Lower Zarkawt-Israel Point, Zarkawt, Aizawl, Mizoram 796007, India	\N	2018-05-14 09:51:41.216253	2019-06-13 05:28:40.85847	\N	23.733519900000001	92.7176898999999963	\N	\N	Aizawl
750	Kathi Junction	Bara Bazar, Dawrpui, Aizawl, Mizoram 796001, India	082599 87302	2018-05-14 09:51:43.940098	2019-06-13 05:28:40.866714	\N	23.7328717000000005	92.7170938000000007	\N	4.09999999999999964	Aizawl
751	Hotpot	Zarkawt Main Rd, Chaltlang, Aizawl, Mizoram 796007, India	0389 230 6752	2018-05-14 09:51:48.618274	2019-06-13 05:28:40.875088	\N	23.7370984999999983	92.7163994999999943	\N	3.79999999999999982	Aizawl
752	Pizza House	Bara Bazar, Dawrpui, Aizawl, Mizoram 796001, India	\N	2018-05-14 09:51:50.275512	2019-06-13 05:28:40.883454	\N	23.7326663000000018	92.7171608999999961	\N	2.79999999999999982	Aizawl
753	OMG! Karaoke Parlour 노래방	Ramhlun N Rd, Chaltlang, Aizawl, Mizoram 796012, India	090899 87039	2018-05-14 09:51:51.92423	2019-06-13 05:28:40.891793	\N	23.7473573000000009	92.7226255000000066	\N	3.39999999999999991	Aizawl
754	Zofoods	Dawrpui, Aizawl, Mizoram 796001, India	\N	2018-05-14 09:51:53.927633	2019-06-13 05:28:40.900083	\N	23.726712899999999	92.718186700000004	\N	3.79999999999999982	Aizawl
755	Eureka Lounge	Treasury Square, Aizawl, Mizoram 796001, India	0389 232 2149	2018-05-14 09:51:56.29109	2019-06-13 05:28:40.908488	\N	23.7252867000000016	92.7190795000000065	\N	5	Aizawl
756	The Grand Hotel	G-47, Chanmari, Opposite To New Life Hospital, Zarkawt, Aizawl, Mizoram 796001, India	0389 234 7777	2018-05-14 09:51:58.397954	2019-06-13 05:28:40.916862	\N	23.7388724999999994	92.7165078000000022	\N	3.79999999999999982	Aizawl
757	West Cafe	Dinthar Veng, Aizawl, Mizoram 796001, India	\N	2018-05-14 09:52:00.744434	2019-06-13 05:28:40.925142	\N	23.7340602999999994	92.7149806000000041	\N	4.20000000000000018	Aizawl
758	Alpha Pizza House	Bawngkawn, Aizawl, Mizoram 796014, India	0389 234 0136	2018-05-14 09:52:04.671537	2019-06-13 05:28:40.933481	\N	23.7547180000000004	92.7300843000000015	\N	4.59999999999999964	Aizawl
759	Samuel Catering	Ramhlun Venglai, Chaltlang, Ramhlun Venglai, Aizawl, Mizoram 796012, India	081310 59926	2018-05-14 09:52:07.507862	2019-06-13 05:28:40.941758	\N	23.7457847999999991	92.723119699999998	\N	4.59999999999999964	Aizawl
760	Thomas Cook India Ltd	Hauva Buiding, Chanmari,, Aizwal, Mizoram 796001, India	0389 230 6314	2018-05-14 09:52:10.532117	2019-06-13 05:28:40.950278	\N	23.7246029999999983	92.7158390000000026	http://www.thomascook.in/	3.70000000000000018	Aizawl
761	Nuteii Restaurant & Catering Service	Aizawl, Dawrpui, Aizawl, Mizoram 796001, India	0389 231 1737	2018-05-14 09:52:12.119637	2019-06-13 05:28:40.958507	\N	23.7309009000000017	92.7174509000000029	\N	4.70000000000000018	Aizawl
763	Benjee Restaurant	Aizawl, Mizoram 796001, India	\N	2018-05-14 09:52:18.248764	2019-06-13 05:28:40.975202	\N	23.7243898999999985	92.7174415000000067	\N	\N	Aizawl
764	Setha Restaurant	Chhinga Veng-Bungkawn Road, Dawrpui, Aizawl, Mizoram 796007, India	084138 51313	2018-05-14 09:52:19.30471	2019-06-13 05:28:40.983564	\N	23.7334953000000013	92.7188430000000068	\N	3.60000000000000009	Aizawl
765	Red Lantern Chinese Restaurant	Zuangtui - Selesih Rd, Durtlang Leitan, Aizawl, Mizoram 796025, India	070859 04448	2018-05-14 09:52:22.04085	2019-06-13 05:28:40.991791	\N	23.7774239999999999	92.733350999999999	\N	3.79999999999999982	Aizawl
766	DeVo Pizza	Ramhlun South Seventh Day Adventist Building shop No 5, Ramlun South, Aizawl, Mizoram 796012, India	082590 50550	2018-05-14 09:52:24.078164	2019-06-13 05:28:41.000182	\N	23.7442509999999984	92.7224300000000028	http://devo-pizza.business.site/	4.5	Aizawl
767	Jeremy's Hideaway	Kawnpui - Durtlang - Silchar Rd, Aizawl, Mizoram 796014, India	\N	2018-05-14 09:52:26.559904	2019-06-13 05:28:41.0085	\N	23.8103179999999988	92.7335005999999993	\N	4.20000000000000018	Aizawl
768	Hotel Good Luck	Aizawl, Mizoram 796009, India	\N	2018-05-14 09:52:28.968952	2019-06-13 05:28:41.01696	\N	23.7938538999999984	92.6692100000000067	\N	4.5	Aizawl
770	Time Traveller	144-C/1, Kirloskar Rd, Bommasandra Industrial Area, Electronic City, Bengaluru, Karnataka 560099, India	080 4040 0400	2018-05-14 09:52:46.742169	2019-06-13 05:28:41.033638	\N	12.8246584000000006	77.6811844000000065	\N	4.20000000000000018	Bengaluru
771	Bengaluru Multi Cuisine Restaurant	La Classic Hotel, Lobby Level, Yadavanahalli, Attibele, Anekal Taluk, Electronic City, Bangalore, Electronic City, South Bangalore, Bengaluru, Karnataka 562107, India	096862 03939	2018-05-14 09:52:49.544681	2019-06-13 05:28:41.041937	\N	12.7839980000000004	77.7571829999999977	\N	5	Bengaluru
772	Rim Naam	37-39, MG Road, Yellappa Garden, Yellappa Chetty Layout, Sivanchetti Gardens, Bengaluru, Karnataka 560001, India	080 2558 5858	2018-05-14 09:52:51.029082	2019-06-13 05:28:41.050251	\N	12.9735558999999991	77.6180738999999988	http://www.oberoihotels.com/hotels-in-bengaluru/restaurants/	4.5	Bengaluru
773	Le Jardin	37-39, MG Road, Yellappa Garden, Yellappa Chetty Layout, Sampangi Rama Nagar, Bengaluru, Karnataka 560001, India	080 2558 5858	2018-05-14 09:52:58.069713	2019-06-13 05:28:41.058578	\N	12.9734394000000002	77.6178100999999998	https://www.oberoihotels.com/hotels-in-bengaluru/restaurants/le-jardin?utm_source=GMBlisting&utm_medium=organic	4.20000000000000018	Bengaluru
774	Jamavar	Lobby level, The Leela Palace Bengaluru,, 23, Old Airport Road, HAL 2nd Stage, Kodihalli, Bengaluru, Karnataka 560008, India	080 3057 1344	2018-05-14 09:53:02.907448	2019-06-13 05:28:41.066909	\N	12.9602191999999992	77.648517499999997	https://www.theleela.com/en_us/hotels-in-bengaluru/the-leela-palace-hotel-bengaluru/dining/jamavar	4.40000000000000036	Bengaluru
775	Persian Terrace	26/1, 4th Floor, Sheeraton Grand Bangalore Hotel at Brigade Gateway, Dr. Rajkumar Road, Malleswaram-Rajajinagar, Rajaji Nagar, Bengaluru, Karnataka 560055, India	080 4252 1000	2018-05-14 09:53:05.964083	2019-06-13 05:28:41.075744	\N	13.0127270999999993	77.5550357000000048	http://www.starwoodhotels.com/sheraton/property/dining/index.html?propertyID=3110	4.20000000000000018	Bengaluru
776	Edo Japanese Restaurant and Bar	ITC Gardenia, No.1, Residency Road, Bangalore, Karnataka 560025, India, Ashok Nagar, Bengaluru, Karnataka 560025, India	080 2211 9898	2018-05-14 09:53:09.663762	2019-06-13 05:28:41.083548	\N	12.9672520000000002	77.5956429999999955	https://www.itchotels.in/hotels/bengaluru/itcgardenia/dining/edo.html	4.40000000000000036	Bengaluru
777	Alto Vino	Bengaluru Marriott Hotel, 8th Road, Plot No 75, EPIP Area, Whitefield, KIADB Export Promotion Industrial Area, Whitefield, Bengaluru, Karnataka 560066, India	080 4943 5000	2018-05-14 09:53:12.783885	2019-06-13 05:28:41.091849	\N	12.9794677000000007	77.728302400000004	http://www.marriott.com/hotels/hotel-information/restaurant/blrwf-bengaluru-marriott-hotel-whitefield/	4.40000000000000036	Bengaluru
778	Karavalli	66, Ground Floor,The Gateway Hotel, Residency Road, Ashok Nagar, Bengaluru, Karnataka 560025, India	080666 04545	2018-05-14 09:53:15.801634	2019-06-13 05:28:41.100175	\N	12.9723199999999999	77.6086209999999994	https://gateway.tajhotels.com/	4.29999999999999982	Bengaluru
779	Yataii	No 56-6B, Palace Road, Abshot Layout, Vasanth Nagar, Abshot Layout, Vasanth Nagar, Bengaluru, Karnataka 560052, India	080 4512 6450	2018-05-14 09:53:18.44792	2019-06-13 05:28:41.108609	\N	12.9921238999999993	77.5882382000000064	http://www.shangri-la.com/bengaluru/shangrila/dining/restaurants/yataii/	4.09999999999999964	Bengaluru
780	JW Kitchen	JW Marriott Bengaluru, 24/1, Vittal Mallya Road, Ashok Nagar, KG Halli, Shanthala Nagar, Ashok Nagar, Bengaluru, Karnataka 560001, India	080671 89999	2018-05-14 09:53:20.603512	2019-06-13 05:28:41.116894	\N	12.9722164000000006	77.5949171999999976	http://www.marriott.com/hotels/hotel-information/restaurant/blrjw-jw-marriott-hotel-bengaluru/?scid=bb1a189a-fec3-4d19-a255-54ba596febe2	4.40000000000000036	Bengaluru
781	The Cubbon Pavilion	ITC Gardenia, 1, Residency Road, Ashok Nagar, Bengaluru, Karnataka 560025, India	080 2211 9898	2018-05-14 09:53:22.86203	2019-06-13 05:28:41.125259	\N	12.9671751999999998	77.5961120000000051	http://www.itchotels.in/hotels/itcgardenia/cubbon-pavilion-restaurant.aspx	4.5	Bengaluru
782	Ministry of Food	100 Feet Rd, Embassy Golf Links Business Park, Domlur, Bengaluru, Karnataka 560071, India	080667 99999	2018-05-14 09:53:25.121024	2019-06-13 05:28:41.133586	\N	12.9484321999999992	77.6452510999999959	http://www.liveinstyle.com/nightlife/Bangalore/outlet/ministry-of-food%20-%20hilton-bangalore-embassy-golflinks	3.79999999999999982	Bengaluru
783	Taaza Thindi	1004, Main road, Jayanagar 4T Block, 4th T Block East, Jayanagara 9th Block, Jayanagar, Bengaluru, Karnataka 560041, India	080 4091 2277	2018-05-14 09:53:27.398329	2019-06-13 05:28:41.141896	\N	12.9228422999999992	77.5932410000000061	\N	4.59999999999999964	Bengaluru
784	Blue Ginger	The Taj West End, 25, Race Course Road, High Grounds, High Grounds, Bengaluru, Karnataka 560001, India	080666 05660	2018-05-14 09:53:29.910789	2019-06-13 05:28:41.150196	\N	12.9842619999999993	77.5845350000000025	https://taj.tajhotels.com/en-in/taj-west-end-bengaluru/restaurants/blue-ginger/?utm_source=Google&utm_campaign=Blue-Ginger-Bengaluru-TWE&utm_medium=Local	4.20000000000000018	Bengaluru
785	Brahmins' Coffee Bar	Near Shankar Mutt, Ranga Rao Road, Shankarapura, Bengaluru, Karnataka 560004, India	098450 30234	2018-05-14 09:53:38.655417	2019-06-13 05:28:41.158577	\N	12.9539208000000006	77.5688741000000022	\N	4.5	Bengaluru
786	Polo Club - The Oberoi	MG Road, Yellappa Garden, Yellappa Chetty Layout, Sivanchetti Gardens, Bengaluru, Karnataka 560001, India	080 2558 5858	2018-05-14 09:53:41.027413	2019-06-13 05:28:41.166805	\N	12.9733385000000006	77.6182017000000002	http://www.oberoihotels.com/	4.59999999999999964	Bengaluru
787	Nagarjuna Andhra Style	44/1, Residency Road, Beside Galaxy Theatre, Shanti Nagar, Shanthala Nagar, Ashok Nagar, Bengaluru, Karnataka 560025, India	080 2555 9848	2018-05-14 09:53:48.548053	2019-06-13 05:28:41.175215	\N	12.9732296999999992	77.6091220999999933	http://www.nagarjunarestaurants.com/	4.20000000000000018	Bengaluru
793	New Punjabi Food Corner	Near Zone - By The Park, Electronics City Phase 1, Electronic City, Bengaluru, Karnataka 560100, India	073490 43228	2018-05-14 09:54:27.427178	2018-05-14 09:54:27.427178	ChIJycysjY9srjsRwXzHjBhsGmo	12.8447019999999998	77.6656030000000044	\N	4.29999999999999982	Bengaluru
797	Feast	26/1, Dr. Rajkumar Road, Malleswaram-Rajajinagar, Rajaji Nagar, Bengaluru, Karnataka 560055, India	080 4252 0133	2018-05-14 09:54:54.55022	2018-05-14 09:54:54.55022	ChIJSciIwng9rjsRKyOoikfNWjo	13.0124964999999992	77.5553543000000047	http://www.sheratonbangalore.com/sheraton-bangalore-dining-venue-restaurants-coffee-shop-feast-all-day	4.20000000000000018	Bengaluru
798	New Punjabi Food Corner	Phase-I, Near Velnakani, Opposite Axis Bank ATM, Doddathogur, Electronic City, Konappana Agrahara, Electronic City, Bengaluru, Karnataka 560100, India	073534 23333	2018-05-14 09:55:02.21234	2018-05-14 09:55:02.21234	ChIJHclfx51srjsR6aiimJtMzFA	12.8503697999999993	77.656937499999998	http://business.google.com/website/new-punjabi-food-corner	4	Bengaluru
809	Nandhana Palace - Andhra Restaurants	No.1,1st Floor Outer Ring Road,Next to Relince Fresh,Munenkollal, Marathahalli, Aswath Nagar, Chinnapanna Halli, Bengaluru, Karnataka 560037, India	080 4311 1555	2018-05-14 09:56:16.931643	2018-05-14 09:56:16.931643	ChIJ1_kkby0SrjsRaLH9P72_pMs	12.9618459999999995	77.7012672999999978	https://www.nandhanarestaurants.com/	4.5	Bengaluru
810	Nandhana Palace - Andhra Restaurants	No.7, BDA Complex, Cross Road, Koramangala 4-B Block, SBI Colony, Koramangala, Koramangala 1A Block, Koramangala 3 Block, Koramangala, Bengaluru, Karnataka 560034, India	080 2563 0202	2018-05-14 09:56:20.230567	2018-05-14 09:56:20.230567	ChIJq6o2UGAUrjsRhsOrNB1QNgg	12.9260195000000007	77.6330064999999934	https://www.nandhanarestaurants.com/	3.89999999999999991	Bengaluru
789	Barbeque Nation -Bengaluru JP Nagar	67, 3rd Floor, 6th B Main, Phase III, J P Nagar, Dollar Layout, 3rd Phase, JP Nagar, Bengaluru, Karnataka 560078, India	1800 108 6060	2018-05-14 09:54:02.315945	2019-06-13 05:28:41.191913	\N	12.9064189999999996	77.5967760000000055	http://www.barbeque-nation.com/	4.29999999999999982	Bengaluru
790	Veena Stores	183, 15th Cross, Margosa Road, Malleshwaram, Malleshwaram West, Bengaluru, Karnataka 560003, India	080 2334 4838	2018-05-14 09:54:05.331725	2019-06-13 05:28:41.200274	\N	13.0056446000000001	77.5692430000000002	\N	4.40000000000000036	Bengaluru
791	Shri Sagar	7th cross Road, Margosa Road, Malleshwaram, Malleshwaram, Shri Rampura, Malleshwaram West, Bengaluru, Karnataka 560003, India	080 2331 7531	2018-05-14 09:54:08.57541	2019-06-13 05:28:41.20858	\N	12.9982574	77.5695208000000065	\N	4.5	Bengaluru
792	La Brasserie Restaurant	28, Hotel Le Meridien, Sankeys Road, Vasanth Nagar, Bengaluru, Karnataka 560052, India	080 2226 2233	2018-05-14 09:54:12.837079	2019-06-13 05:28:41.216992	\N	12.9901923999999998	77.5865026999999969	http://www.starwoodhotels.com/lemeridien/property/dining/index.html?propertyID=1833	4.20000000000000018	Bengaluru
794	Paradise Food Court	No. 47/11, Doddathogur Village, Opp. Velankani Tech Park Gate No 4, Next to SJR Equinox, Electronic City, Hosur Road, Electronics City Phase 1, Electronic City, Bengaluru, Karnataka 560100, India	080 6940 8401	2018-05-14 09:54:38.138274	2019-06-13 05:28:41.227173	\N	12.8482722000000003	77.6577108999999979	http://www.paradisefoodcourt.in/	3.79999999999999982	Bengaluru
795	Bengali Food	6, Electronics City Phase 1, Electronic City, Bengaluru, Karnataka 560100, India	\N	2018-05-14 09:54:43.753731	2019-06-13 05:28:41.233455	\N	12.8514900000000001	77.6638408000000027	\N	3.39999999999999991	Bengaluru
796	Reddy Restaurant	Anekal Main Road, Terracon Residency, Chandapura, Bengaluru, Karnataka 560081, India	099867 98233	2018-05-14 09:54:46.620816	2019-06-13 05:28:41.241925	\N	12.7969606000000002	77.7062338000000068	\N	3.39999999999999991	Bengaluru
799	Pool Bar	JW Marriott Hotel Bengaluru, Grant Rd, KG Halli, Shanthala Nagar, Sampangi Rama Nagar, Bengaluru, Karnataka 560001, India	1800 102 5000	2018-05-14 09:55:13.956382	2019-06-13 05:28:41.254046	\N	12.9719715000000004	77.5949173999999999	http://www.marriott.com/hotels/hotel-information/restaurant/blrjw-jw-marriott-hotel-bengaluru/	2	Bengaluru
800	The Fisherman's Wharf	Survey No.26, Opp. Shub Enclave, Harulur Road, Ambalipura Village, Varthur Hobli, Off. Sarjapur Road, Amblipura, PWD Quarters, 1st Sector, HSR Layout, Bengaluru, Karnataka 560102, India	098440 80000	2018-05-14 09:55:22.435315	2019-06-13 05:28:41.258598	\N	12.9143817999999992	77.6666242999999952	http://thefishermanswharf.in/	4.09999999999999964	Bengaluru
801	Orbis Restaurants	Ozone Entrance Rd, Prestige Ozone, Whitefield, Bengaluru, Karnataka 560066, India	080 4099 0088	2018-05-14 09:55:32.278114	2019-06-13 05:28:41.266965	\N	12.9582470000000001	77.7467606000000018	https://www.facebook.com/Orbisrestaurant/	4.09999999999999964	Bengaluru
802	Star Restaurants	63, Fort Bus Stop, Kalasipalyam Main Rd, Kalasipalya, Bengaluru, Karnataka 560002, India	093412 30292	2018-05-14 09:55:41.211158	2019-06-13 05:28:41.275231	\N	12.9612999999999996	77.5768750000000011	\N	3	Bengaluru
803	Absolute Barbecue	3rd Floor, 90/4, Marathahalli Outer Ring Road, Near Park Plaza Hotel, Marathahalli Village, Marathahalli, Bengaluru, Karnataka 560037, India	080889 22203	2018-05-14 09:55:44.57966	2019-06-13 05:28:41.283601	\N	12.9498300999999998	77.6991265999999996	http://www.absolute-barbecue.com/	4.29999999999999982	Bengaluru
804	Yummy	Survey No 148, Near KSRP Camp, Choodasandra Road, Hosa Rd, KSDB Quarters Kaveri Layout, KSRP Campus, Harlur, Bengaluru, Karnataka 560099, India	090665 07865	2018-05-14 09:55:50.93471	2019-06-13 05:28:41.291897	\N	12.8894483999999991	77.6729851000000053	\N	4.09999999999999964	Bengaluru
805	Megabyte Restaurant	#03 , 2nd Cross, Opp.KIADB Quarters. Bommasandra Industrial Area, Hosur Road, Anekal Taluk, Bangalore - 560099, Chennekothapalli Rd, Bommasandra Industrial Area, Bengaluru, Karnataka 560099, India	\N	2018-05-14 09:55:59.999676	2019-06-13 05:28:41.300385	\N	12.8139198000000007	77.6897670000000033	\N	3	Bengaluru
806	Empire Food Court – Infosys	Infosys Limited, Plot, #44 Heritage Food Court, Electronics City Phase 1, Electronic City, Bengaluru, Karnataka 560100, India	080 4041 4141	2018-05-14 09:56:04.506407	2019-06-13 05:28:41.308688	\N	12.8473591999999996	77.6646884000000028	http://www.hotelempire.in/empire-food-court-infosys/	3.79999999999999982	Bengaluru
807	Rajdhani Thali Restaurant	No. 115 , 1st Floor , Opp Raheja Arcade , ganapathi rd , Koramangala 7th Block, 7th Block, Koramangala, Bengaluru, Karnataka 560095, India	098860 99229	2018-05-14 09:56:10.819168	2019-06-13 05:28:41.316973	\N	12.9352478000000009	77.6134816000000001	http://rajdhani.co.in/	4	Bengaluru
808	Vishnu Garden Bar and Restaurants	166, Hosa Rd, IAS Layout, Eastwood Twp, Kasavanahalli, Bengaluru, Karnataka 560035, India	099807 35834	2018-05-14 09:56:14.441086	2019-06-13 05:28:41.325279	\N	12.9046591999999993	77.6758685000000071	\N	3.89999999999999991	Bengaluru
811	New Food Magic Fp Express Meals	Infosys, 4th Gate, Electronic City, Konappana Agrahara, Electronic City, Bengaluru, Karnataka 560100, India	081050 00008	2018-05-14 09:56:22.738952	2019-06-13 05:28:41.337628	\N	12.8496249999999996	77.6638640000000038	\N	3.89999999999999991	Bengaluru
812	Jashn Restaurant	20/5, Panathur Junction, Outer Ring Road, Kaverappa Layout, Marathahalli, East Bangalore, Kaverappa Layout, Kadubeesanahalli, Bengaluru, Karnataka 560103, India	097422 84226	2018-05-14 09:56:28.03414	2019-06-13 05:28:41.341955	\N	12.9386671	77.695093600000007	\N	3.39999999999999991	Bengaluru
818	KFC	No.56, Survey No. 66, Opp. Wipro Gate 5, Electronics City Phase -1, Electronics City Phase 1, Electronic City, Bengaluru, Karnataka 560100, India	080 3399 4444	2018-05-14 09:56:49.435561	2018-05-14 09:56:49.435561	ChIJ3fc2TYFsrjsRZzVFWPuGCt8	12.8395931999999995	77.6594309000000038	https://online.kfc.co.in/	4	Bengaluru
814	Sunny's Restaurant	No.50, Lavelle Road,ML Subbaraju Road, Shanthala Nagar, Ashok Nagar, Bengaluru, Karnataka 560001, India	080 4132 9366	2018-05-14 09:56:34.172055	2019-06-13 05:28:41.358708	\N	12.9718487000000007	77.5985967999999957	\N	4.09999999999999964	Bengaluru
815	Nandhana Restaurants - Andhra Restaurant	8A, Bannerghatta Main Rd, NS Palya, Sundar Ram Shetty Nagar, BTM 2nd Stage, Bengaluru, Karnataka 560076, India	080 2678 2244	2018-05-14 09:56:38.114594	2019-06-13 05:28:41.367046	\N	12.9020080000000004	77.6010990000000049	https://www.nandhanarestaurants.com/	4	Bengaluru
816	Chinita Real Mexican Food	218, Indira Nagar Double Road, Indira Nagar II Stage, Hoysala Nagar, Indiranagar, Bengaluru, Karnataka 560038, India	096865 51896	2018-05-14 09:56:42.475037	2019-06-13 05:28:41.375623	\N	12.9810049999999997	77.6370730000000009	http://www.chinita.in/	4.29999999999999982	Bengaluru
817	Kanua	6/2, Near Wipro Headquarters, Sarjapur Road, Kaikondrahalli, Kasavanahalli, Bengaluru, Karnataka 560035, India	080 6537 4471	2018-05-14 09:56:45.739346	2019-06-13 05:28:41.383786	\N	12.9090065000000003	77.6806974999999937	http://zoma.to/r/51988	4.09999999999999964	Bengaluru
819	Cafe Noir	36, Upper Ground Floor, Phoenix Marketcity Mall, Mahadevpura, Near Krishnarajapuram Flyover, Devasandra Industrial Estate, Krishnarajapura, Bengaluru, Karnataka 50048, India	080672 66099	2018-05-14 09:56:53.489375	2019-06-13 05:28:41.393834	\N	12.9977046000000005	77.6961742000000015	http://cafenoir.co.in/	4	Bengaluru
820	DAKSHIN	164, 5th Cross Rd, Vinayaka Nagar, Wilson Garden, Bengaluru, Karnataka 560027, India	097438 87741	2018-05-14 09:56:56.210472	2019-06-13 05:28:41.400406	\N	12.9508721999999992	77.5953606000000065	\N	3.79999999999999982	Bengaluru
821	Homely Food Point (South/North/Bengali/Chinese)	109, Dodda Thogur Gate , Electronic City -Phase-1 Bangalore 100, Doddathogur Main Rd, Konappana Agrahara, Electronic City, Doddathoguru, Karnataka 560100, India	\N	2018-05-14 09:56:59.84614	2019-06-13 05:28:41.408784	\N	12.8559511999999998	77.6636945999999995	\N	4.5	Bengaluru
822	Rajathadri Food Fort	19/49, 2nd Main Road, 31st Cross Road, Near Jayanagar National College, 7th Block, Jayanagar, 7th Block, Jayanagar, Bengaluru, Karnataka 560070, India	097318 29798	2018-05-14 09:57:03.70181	2019-06-13 05:28:41.417123	\N	12.9279104	77.5781949999999938	\N	4.09999999999999964	Bengaluru
823	The Fatty Bao	610, 3rd Floor, 12th A Main Road, 80 feet Road, HAL 2nd Stage, Indira Nagar, 7th Cross, HAL 2nd Stage, Indiranagar, Bengaluru, Karnataka 560008, India	080 4411 4499	2018-05-14 09:57:06.551432	2019-06-13 05:28:41.425452	\N	12.9705121999999999	77.6452665999999994	https://www.zomato.com/bangalore/the-fatty-bao-indiranagar	4.40000000000000036	Bengaluru
824	Manohar Dairy And Restaurant	6, Hamidia Rd, New Sabji Market, Gurudwara Market, Ghora Nakkas, Peer Gate Area, Bhopal, Madhya Pradesh 462001, India	0755 274 0454	2018-05-14 09:57:17.525997	2019-06-13 05:28:41.433715	\N	23.2640360000000008	77.408251000000007	http://www.manohardairy.com/	4.29999999999999982	Bhopal
825	Khan Sahab Restaurant & Fast Food	Model Ground, Hamidia Road, Badabagh, Shahjahanabad, Bhopal, Madhya Pradesh 462001, India	095842 22666	2018-05-14 09:57:21.503686	2019-06-13 05:28:41.442108	\N	23.2673220000000001	77.3978170000000034	http://www.khansahabrestaurant.com/	4.20000000000000018	Bhopal
826	Zam Zam Fast Food	Besides Corporation Bank, Bharat Talkies Road, Dangi Colony, Railway Colony, Bhopal, Madhya Pradesh 462001, India	092295 89047	2018-05-14 09:57:23.879066	2019-06-13 05:28:41.450392	\N	23.262183799999999	77.4111984999999976	http://www.zamzamfastfood.com/	4.29999999999999982	Bhopal
827	Nerbada Sweets & Restaurant	Shop No.1,2 & 3, Sultania Road, Royal Market, Medical College Campus, Kohefiza, Bhopal, Madhya Pradesh 462001, India	0755 254 0507	2018-05-14 09:57:26.321813	2019-06-13 05:28:41.458631	\N	23.2606612000000013	77.3929293999999999	http://www.nerbadasweets.com/	4	Bhopal
828	Food Craft	C-8, Kolar Road, Mandakini Society, Mandakini HSG colony, Mandakini Colony, Kolar Road, Bhopal, Madhya Pradesh 462042, India	0755 405 6498	2018-05-14 09:57:30.057653	2019-06-13 05:28:41.467013	\N	23.1829867000000007	77.4176046000000042	http://www.foodcraftrestaurant.com/	3.89999999999999991	Bhopal
829	Bay Leaf - Fine Dining	DB City, inside the Courtyard hotel, Zone-I, Arera Hills, Bhopal, Madhya Pradesh 462011, India	0755 309 6241	2018-05-14 09:57:31.659225	2019-06-13 05:28:41.475389	\N	23.2329203	77.429526800000005	http://www.marriott.com/hotels/hotel-information/restaurant/bhocy-courtyard-bhopal/?scid=bb1a189a-fec3-4d19-a255-54ba596febe2	3.29999999999999982	Bhopal
830	Chi Kitchen	T-12, Dainik Bhaskar Mall, 13, Hoshangabad Rd, Zone-I, Maharana Pratap Nagar, Bhopal, Madhya Pradesh 462016, India	0755 664 4470	2018-05-14 09:57:32.880534	2019-06-13 05:28:41.483753	\N	23.2322603000000001	77.429957200000004	https://www.facebook.com/ChiKitchenBhopal/	3.39999999999999991	Bhopal
831	Sagar Gaire Fast Food Corner	Shop No 101, Bda Complex, 7 No Stop, Shivaji Nagar, No 6 Locality, Shivaji Nagar, Bhopal, Madhya Pradesh 462016, India	094254 03707	2018-05-14 09:57:35.375735	2019-06-13 05:28:41.492075	\N	23.2232525999999986	77.4335698000000008	http://www.sagargairefastfoodcorner.com/	4.20000000000000018	Bhopal
832	Sankalp Restaurant	Ground Floor Plot -85 Zone -2 M. P. Opp. Raymonds Showroom, Zone-II, Maharana Pratap Nagar, Bhopal, Madhya Pradesh 462023, India	0755 427 5555	2018-05-14 09:57:38.88421	2019-06-13 05:28:41.500423	\N	23.2326629999999987	77.4354979999999955	https://m.facebook.com/SankalpRestaurantBhopal	4	Bhopal
833	Swastik Restaurant	Berasia Rd, D.I.G Square, Raj Deo Colony, JP Nagar, Bhopal, Madhya Pradesh 462001, India	088272 50656	2018-05-14 09:57:40.410923	2019-06-13 05:28:41.508749	\N	23.2753768000000001	77.4039826000000062	\N	4	Bhopal
834	1st Date Fast Food & Restaurant	shop no . 7, fine avenue (phase 1) 1st floor naya Pura kolar road, Lalita Nagar, Kolar Road, Bhopal, Madhya Pradesh 462042, India	081094 09002	2018-05-14 09:57:41.525545	2019-06-13 05:28:41.517053	\N	23.1621759999999988	77.4146340000000066	http://business.google.com/website/1st-date-fast-food-restaurant	2.39999999999999991	Bhopal
835	Sharma & Vishnu Fast Food Corner	E-6, Hoshangabad Rd, Surendra Landmark, Shri Rameshwaram, Chinar Fortune City, Bhopal, Madhya Pradesh 462026, India	084255 64654	2018-05-14 09:57:44.632342	2019-06-13 05:28:41.525381	\N	23.1816892999999986	77.4561987000000016	http://www.sharmaandvishnufastfood.com/	4.09999999999999964	Bhopal
836	Sharma Vishnu Fast Food,Lalghati,Bhopal	Lalghati, Bhopal, Madhya Pradesh 462030, India	091110 16975	2018-05-14 09:57:47.941964	2019-06-13 05:28:41.533671	\N	23.2770016999999996	77.3641726000000034	http://sharmaandvishnufastfood.com/contact/	4	Bhopal
837	New Inn Restaurant & Coffee House	28, Bhadbhada Road, New Market, South TT Nagar, New Market, STT Nagar, TT Nagar, Bhopal, Madhya Pradesh 462003, India	0755 422 3777	2018-05-14 09:57:51.784874	2019-06-13 05:28:41.542043	\N	23.2365509999999986	77.4001952999999929	\N	3.60000000000000009	Bhopal
838	Sagar Gaire , 10 No. Market	Shop No 72, 10 No Market, E-4, Arera Colony, E-4, Arera Colony, Bhopal, Madhya Pradesh 462016, India	094254 03723	2018-05-14 09:57:55.357065	2019-06-13 05:28:41.5503	\N	23.2143012000000013	77.4353047000000032	http://www.sagargairefastfoodcorner.com/	4.20000000000000018	Bhopal
849	Bawarchi Restaurant	Chinar Fortune City, Bhopal, Madhya Pradesh 462026, India	086022 33346	2018-05-14 09:59:41.055671	2018-05-14 09:59:41.055671	ChIJeSqN6sFDfDkRgJ3nyLzp5VQ	23.1876697999999983	77.4516423999999972	\N	3.70000000000000018	Bhopal
840	Under The Mango Tree	157, Shymala Hills, Bhopal, Madhya Pradesh 462013, India	0755 266 1100	2018-05-14 09:58:02.770148	2019-06-13 05:28:41.700448	\N	23.2397601999999992	77.3869298999999984	\N	4.20000000000000018	Bhopal
841	Ganesh Chinese & Fast Food Centre	Shop No.3, V.D. Nayer Complex, Kolar Rd, Netaji Housing Co Op Society, Mahabali, Kolar Road, Bhopal, Madhya Pradesh 462042, India	0755 405 6287	2018-05-14 09:58:05.280975	2019-06-13 05:28:41.708742	\N	23.1820869999999992	77.4171003000000013	http://www.ganeshchinesefastfood.com/	4	Bhopal
842	Sharma and Vishnu Chinese Fast Food	462032, 7-A, Gufa Mandir Rd, Opp. Domino's , Near Axis Bank ,Lalghati Square, Nayapura, Lalghati, Bhopal, Madhya Pradesh 462032, India	091110 16975	2018-05-14 09:58:09.218464	2019-06-13 05:28:41.71711	\N	23.2743995999999989	77.3707792999999953	http://sharmaandvishnufastfood.com/menu-list/	4	Bhopal
843	Manohar Dairy & Restaurant MP Nagar	132 A & B, Zone I, Zone-I, Maharana Pratap Nagar, Bhopal, Madhya Pradesh 462001, India	0755 404 0406	2018-05-14 09:58:19.321623	2019-06-13 05:28:41.725376	\N	23.2341672999999993	77.4340327999999971	http://www.manohardairy.com/	4.29999999999999982	Bhopal
844	Tapti Restaurant	GTB Complex, Bhadbhada Road, 45 Bunglows, North TT Nagar, TT Nagar, Bhopal, Madhya Pradesh 462003, India	0755 522 1836	2018-05-14 09:58:38.549672	2019-06-13 05:28:41.733758	\N	23.2372514000000017	77.3994940000000042	\N	4	Bhopal
845	Evening Point	7, Main Road, Bittan Market, E-5, Arera Colony, Bhopal, Madhya Pradesh 462016, India	090390 09217	2018-05-14 09:58:56.91324	2019-06-13 05:28:41.742113	\N	23.2149616999999999	77.4300534000000056	http://www.eveningpointbhopal.com	3.79999999999999982	Bhopal
846	Taste of India	L-1, Radhakrishna Shopping Complex, Behind Sangam Cinema, Zone-II, M.P. Nagar, Zone-II, Maharana Pratap Nagar, Bhopal, Madhya Pradesh 462011, India	0755 427 2290	2018-05-14 09:59:15.403297	2019-06-13 05:28:41.750459	\N	23.2273087999999994	77.4363948000000022	http://tasteofindia.net.in/	4	Bhopal
847	The Royal Court Restaurant and BAR	Fortune Pride, Shahpura, Bhopal, Madhya Pradesh 462039, India	\N	2018-05-14 09:59:28.162141	2019-06-13 05:28:41.758719	\N	23.1875736000000003	77.4325096999999971	\N	3.70000000000000018	Bhopal
848	Bum Chik Restaurant	Indrapuri A sector, Sector A, Indrapuri, Bhopal, Madhya Pradesh 462022, India	098827 68020	2018-05-14 09:59:32.751646	2019-06-13 05:28:41.767052	\N	23.2514778	77.4585096999999934	\N	3.60000000000000009	Bhopal
850	Wind And Waves Restaurant	Lake View Road, Shymala Hills, Bhopal, Madhya Pradesh 462002, India	0755 266 0113	2018-05-14 09:59:53.730327	2019-06-13 05:28:41.777495	\N	23.2417435999999995	77.3806663000000015	\N	4.09999999999999964	Bhopal
851	Bhopal Express	Shymala Hills, Hotel Lake View Campus, Shymala Hills, Bhopal, Madhya Pradesh 462013, India	0755 266 0802	2018-05-14 10:00:05.28701	2019-06-13 05:28:41.78375	\N	23.2425820999999999	77.3874552999999992	\N	4.09999999999999964	Bhopal
852	CKC Restaurant	Shahpura, Bhopal, Madhya Pradesh 462039, India	0755 435 0101	2018-05-14 10:00:22.454979	2019-06-13 05:28:41.792049	\N	23.1889758000000015	77.4354028000000056	http://www.ckc.co.in/	4.09999999999999964	Bhopal
853	Mezbaan Bhopal	Near Rose Beauty Parlour, Lily Talkies, Sultania Road, Lower Lake, Jahangirabad, Jahangirabad, Bhopal, Madhya Pradesh 462008, India	0755 490 4486	2018-05-14 10:00:34.109122	2019-06-13 05:28:41.800422	\N	23.2537130000000012	77.4125659999999982	http://mezbaanbhopal.business.site/	4	Bhopal
854	E-Square	E-8/2, Arera Colony, Near 12 No. Bus stop, Indra Nagar, E8, Arera Colony, Bhopal, Madhya Pradesh 462016, India	0755 403 4000	2018-05-14 10:00:47.519203	2019-06-13 05:28:41.808873	\N	23.2024499999999989	77.4373779999999954	https://www.facebook.com/ESquare.Bhopal	4.09999999999999964	Bhopal
855	Bapu Ki Kutia	Rajbhavan Road, Roashanpura Naka, Malviya Nagar, Roshanpura Slums, TT Nagar, Bhopal, Madhya Pradesh 462003, India	0755 422 0849	2018-05-14 10:00:56.141625	2019-06-13 05:28:41.817142	\N	23.2385303000000008	77.4023226999999991	http://www.bapukikutia.in/	4	Bhopal
856	Shahi Haveli Bar & Restaurant	238,, 1st Floor, Shashwat Tower, Opp. DB Mall, Zone-I, Maharana Pratap Nagar, Bhopal, Madhya Pradesh 462026, India	0755 404 5151	2018-05-14 10:01:05.372421	2019-06-13 05:28:41.825466	\N	23.2330396999999991	77.4315280000000001	\N	3.89999999999999991	Bhopal
857	Arya Bhawan Restaurant	231, Near Sargam Cinema, Zone-II, Maharana Pratap Nagar, Zone-II, Maharana Pratap Nagar, Bhopal, Madhya Pradesh 462011, India	0755 427 1623	2018-05-14 10:01:26.243596	2019-06-13 05:28:41.833823	\N	23.227313800000001	77.4369466999999929	\N	4	Bhopal
858	The Kasbah	Kolar Road, Opposite Union Bank, Shalimar Garden, Kolar Road, Bhopal, Madhya Pradesh 462042, India	0755 422 4757	2018-05-14 10:01:40.749631	2019-06-13 05:28:41.842131	\N	23.1851841000000007	77.4171859000000069	http://thekasbahbhopal.business.site/	3.79999999999999982	Bhopal
859	Hakeems Restaurant	Plot No. 129, Obedulla Ganj Rd, Zone-II, Behind Pragati Petrol Pump, Maharana Pratap Nagar, Zone-II, Maharana Pratap Nagar, Bhopal, Madhya Pradesh 462011, India	0755 423 3342	2018-05-14 10:01:54.196314	2019-06-13 05:28:41.850463	\N	23.2294674000000008	77.436062199999995	\N	3.79999999999999982	Bhopal
860	Bhoj Inn Restaurant	Palm Square Building, Near Axis Bank Dominos Road, Lalghati Square, Nayapura, Lalghati, Bhopal, Madhya Pradesh 462030, India	0755 401 7190	2018-05-14 10:02:40.318392	2019-06-13 05:28:41.858728	\N	23.2743053999999994	77.3703904000000051	http://bhojinn.com/	3.60000000000000009	Bhopal
861	Hong Kong Chinese Restaurant	131/4, Obedulla Ganj Rd, Near Pragati Petrol Pump, Zone-II, MP Nagar, Zone-II, Maharana Pratap Nagar, Bhopal, Madhya Pradesh 462021, India	0755 427 1900	2018-05-14 10:02:53.22223	2019-06-13 05:28:41.867103	\N	23.2292348000000004	77.435161800000003	\N	4.20000000000000018	Bhopal
862	Sagar Gaire, Idgah Hills	Shop No:1,2,3, Meenakshi Complex, Aali Manzil Road, Niyamatpura, Idgah Hills, Idgah Hills, Bhopal, Madhya Pradesh 462001, India	094254 03709	2018-05-14 10:03:00.880651	2019-06-13 05:28:41.875434	\N	23.2659227999999985	77.3870086999999955	http://sagargairefastfoodcorner.com/	4.09999999999999964	Bhopal
863	Picnik Restaurant	North TT Nagar, TT Nagar, Bhopal, Madhya Pradesh 462003, India	0755 422 8228	2018-05-14 10:03:08.888002	2019-06-13 05:28:41.883759	\N	23.2288859999999993	77.3880896000000007	http://www.veradis.in/	4.09999999999999964	Bhopal
864	Jains Tasty Bite Fast Food & Restaurant	Mansarovar Complex, Hoshangabad Road, E-3, Arera Colony, Bhopal, Madhya Pradesh 462016, India	\N	2018-05-14 10:03:12.359693	2019-06-13 05:28:41.892144	\N	23.2165378000000011	77.4401457999999963	\N	3.39999999999999991	Bhopal
865	Da Pizzeria	177, Zone-II, Near TIME Coaching Center, Maharana Pratap Nagar, Zone-II, Maharana Pratap Nagar, Bhopal, Madhya Pradesh 462023, India	0755 425 5333	2018-05-14 10:03:14.774897	2019-06-13 05:28:41.900501	\N	23.2284013999999992	77.4353909999999956	http://www.dapizzeria.com/	4	Bhopal
866	Filfora	Sultania Rd, BDA Colony Rd, Kohefiza, Bhopal, Madhya Pradesh 462030, India	0755 425 6926	2018-05-14 10:03:19.161479	2019-06-13 05:28:41.908763	\N	23.2639302000000008	77.3802919999999972	\N	3.79999999999999982	Bhopal
867	Hot Spot Fast Food	Shop No.1, Polytechnic College Road, Opposite Kilol Park Petrol Pump, Krishna Nagar, Shymala Hills, Bhopal, Madhya Pradesh 462001, India	074153 12888	2018-05-14 10:03:31.243707	2019-06-13 05:28:41.917109	\N	23.2480919999999998	77.3967487000000034	\N	3.60000000000000009	Bhopal
883	Keyar's Food	219, Bapuji Nagar Main St, Bapuji Nagar, Bhubaneswar, Odisha 751009, India	0674 259 7488	2018-05-14 10:05:09.271012	2018-05-14 10:05:09.271012	ChIJB18aY0enGToRjmQln4v1AWs	20.2570119999999996	85.8361208999999974	http://www.keyarsfood.com/	3.60000000000000009	Bhubaneswar
885	Keyar's Food	Plot No. 625/A, Janpath, Opposite IDBI Bank, Sahid Nagar, Saheed Nagar, Bhubaneswar, Odisha 751007, India	094370 10507	2018-05-14 10:05:24.295052	2018-05-14 10:05:24.295052	ChIJ03aa3PsJGToRJ3iIcICB2cQ	20.2857039999999991	85.8438318000000038	http://www.keyarsfood.com/	4	Bhubaneswar
891	99 North Restaurant	Maruti complex, 1st floor, KIIT Road, Patia, Aryapalli, Patia, Bhubaneswar, Odisha 751024, India	077900 03499	2018-05-14 10:06:12.916397	2018-05-14 10:06:12.916397	ChIJSUjM0T8JGToRe1PWh-tFkXQ	20.3535520000000005	85.8258926999999971	http://www.99northrestaurant.com/	4.09999999999999964	Bhubaneswar
869	parv fastfood and restaurant	Plot No.188, Near Milan Sweets, Zone 1,MP Nagar, Zone-I, Maharana Pratap Nagar, Bhopal, Madhya Pradesh 462023, India	078797 84847	2018-05-14 10:03:43.447456	2019-06-13 05:28:41.933948	\N	23.2329499999999989	77.4333759999999955	\N	3.79999999999999982	Bhopal
870	IRCTC Restaurant	Bhopal Junction Railway Station, Navbahar Colony, Bhopal, Madhya Pradesh 462001, India	0731 425 9554	2018-05-14 10:03:46.26242	2019-06-13 05:28:41.942304	\N	23.2671080000000003	77.4137261999999993	http://ecatering.irctc.co.in/	3.20000000000000018	Bhopal
871	Tilak's Chocolady Bakery & Restaurant	Plot no 2 Trilochan nagar E 8 Near Bank of baroda, Fortune Pride, Shahpura, Fortune Pride, Shahpura, Bhopal, Madhya Pradesh 462039, India	097541 30545	2018-05-14 10:03:49.524832	2019-06-13 05:28:41.950649	\N	23.1925920000000012	77.4332279999999997	\N	4.20000000000000018	Bhopal
872	Neelam Chat & Restaurant	Indore Road, Block B, Hemu Kalani, Bairagarh, Bhopal, Madhya Pradesh 462030, India	093296 64774	2018-05-14 10:03:51.848575	2019-06-13 05:28:41.958859	\N	23.2709465999999985	77.3371249000000063	\N	4.29999999999999982	Bhopal
873	Rubaab	S86, Indus Garden, Rohit Nagar, Bawadiya Kalan, Gulmohar Colony, Bhopal, Madhya Pradesh 462026, India	099933 19590	2018-05-14 10:03:53.495532	2019-06-13 05:28:41.967222	\N	23.1783609999999989	77.4391009999999937	http://www.rubaabsingh.com/	3.70000000000000018	Bhopal
874	Naveen's Bapu ki Kutia	123, Jyoti Shopping Centre, Behind Jyothi Talkies, Zone-I, Maharana Pratap Nagar, Zone-I, Maharana Pratap Nagar, Bhopal, Madhya Pradesh 462011, India	0755 427 3779	2018-05-14 10:04:00.023774	2019-06-13 05:28:41.975928	\N	23.2332248999999997	77.4335298999999964	http://www.naveensbapukikutia.co.in/	3.89999999999999991	Bhopal
875	Aachman Restaurant	New Bypass Square, Khurd, Raisen Road, Khajuri, Patel Nagar, Patel Nagar, Bhopal, Madhya Pradesh 462021, India	091655 84444	2018-05-14 10:04:07.47055	2019-06-13 05:28:41.983884	\N	23.2503461000000016	77.510594299999994	\N	3.5	Bhopal
876	Spice Ring	E-5 , Garden Estate Plaza, Airport-Gandhinagar Road, Near Colonel's Corner, New Central Jail, Gandhi Nagar, Bhopal, Madhya Pradesh 462030, India	0755 492 8071	2018-05-14 10:04:11.100284	2019-06-13 05:28:41.992152	\N	23.2946747999999992	77.3551393000000047	http://spicering.com/	4	Bhopal
877	Royal Treat Restaurant & Fast Food	Shop No. 4, Bhadbhada Road, Depot Square, Chhatra Shakti Bhawan, Police Radio ColonyPolice Radio Colony, Shastri Nagar, Bhopal, Madhya Pradesh 462003, India	088785 28046	2018-05-14 10:04:12.985332	2019-06-13 05:28:42.000495	\N	23.2270357999999995	77.3884814999999975	\N	3.5	Bhopal
878	Laxmi Chinese & Fast Food	Jyoti Talkies Bus Stop,, Chetak Bridge, Zone-I, Maharana Pratap Nagar, Bhopal, Madhya Pradesh 462023, India	099819 06460	2018-05-14 10:04:14.409665	2019-06-13 05:28:42.008911	\N	23.2334847000000018	77.4348432000000031	\N	5	Bhopal
879	Odian Food Zone Restaurant	52, Church Rd, Pratap Nagar, Jahangirabad, Bhopal, Madhya Pradesh 462008, India	099772 76639	2018-05-14 10:04:22.999983	2019-06-13 05:28:42.017246	\N	23.2481262000000015	77.4142961000000014	\N	3.60000000000000009	Bhopal
880	7 course	Shop No. G-10, Kk Platinum, Trilanga, Gulmohar, Fortune Pride, Shahpura, Bhopal, Madhya Pradesh 462016, India	098266 77744	2018-05-14 10:04:31.799074	2019-06-13 05:28:42.025566	\N	23.1884109000000009	77.4333354000000043	\N	3.5	Bhopal
881	Food Junction Family Restaurant	E-8, 12 No. Street, Near Dana Pani Restaurant, Beside Ishwar Nagar Gate, Ishwar Nagar, Gulmohar Colony, Bhopal, Madhya Pradesh 462016, India	095892 76448	2018-05-14 10:04:34.146538	2019-06-13 05:28:42.033811	\N	23.1938150000000007	77.4401569999999992	\N	2.79999999999999982	Bhopal
882	Lazeez Hakeem Restaurant Bhopal	187, Near Milan Sweet, Zone-I, Maharana Pratap Nagar, Bhopal, Madhya Pradesh 462023, India	077459 77459	2018-05-14 10:04:40.868825	2019-06-13 05:28:42.042237	\N	23.2327070000000013	77.4334010000000035	https://www.lhdindia.com/	3.79999999999999982	Bhopal
884	Venus Inn Restaurant - Best Restaurants in Bhubaneswar	217, Bapuji Nagar Main St, Bapuji Nagar, Bhubaneswar, Odisha 751009, India	094370 51812	2018-05-14 10:05:14.408157	2019-06-13 05:28:42.052668	\N	20.2567315000000008	85.8359066999999953	\N	4	Bhubaneswar
886	Yum Yum Fast Food	Hotel Pushpak, In Front Of Fire Station, 68, Kalpana Square, Buddha Nagar, Laxmi Sagar, Bhubaneswar, Odisha 751006, India	0674 231 0185	2018-05-14 10:05:31.057202	2019-06-13 05:28:42.060756	\N	20.2588559000000004	85.8413460000000015	\N	3.89999999999999991	Bhubaneswar
887	Food Fever	A-54, Saheed Nager, Oposite of Law University, Saheed Nagar, Bhubaneswar, Odisha 751007, India	077357 37777	2018-05-14 10:05:42.701347	2019-06-13 05:28:42.067197	\N	20.2955460999999993	85.845326600000007	\N	4.20000000000000018	Bhubaneswar
888	The Chef	Plot No-426/2260, Ground Floor, N.B Tower, Nilakantha Nagar, Nayapalli, Nilakantha Nagar, Nayapalli, Bhubaneswar, Odisha 751012, India	0674 256 3448	2018-05-14 10:05:52.007006	2019-06-13 05:28:42.075542	\N	20.2862380000000009	85.8111310000000032	http://www.thechefrestaurant.com/	4.09999999999999964	Bhubaneswar
889	Dev's Fast Food	Kananbihar Phase-2, Patia, Karan Vihar, Chandrasekharpur, Near Bajrang Petrol Pump, Patia, Bhubaneswar, Odisha 751031, India	090400 27286	2018-05-14 10:05:55.137278	2019-06-13 05:28:42.083856	\N	20.3490248999999999	85.8248310000000032	\N	4.20000000000000018	Bhubaneswar
890	Shree Kunj Restaurant	737, P, Near Bijupatnayak College, Jayadev Vihar,Bhubaneshwar, Jayadev Vihar, Bhubaneswar, Odisha 751013, India	096921 22245	2018-05-14 10:06:01.022729	2019-06-13 05:28:42.092214	\N	20.2969845000000007	85.819386300000005	\N	3.10000000000000009	Bhubaneswar
892	Sizzler Fast Food	Masjid Road, A.G.Colony, Unit 4, Bhauma Nagar, AG Colony, Unit 4, Bhauma Nagar, Bhubaneswar, Odisha 751001, India	099388 53262	2018-05-14 10:06:20.314421	2019-06-13 05:28:42.102582	\N	20.2785073999999987	85.834275599999998	\N	4.40000000000000036	Bhubaneswar
893	Hi Bhubaneswar, Multi Cuisine Restaurant	F/100 , Infocity Road, Near Info Heights, Patia, Bhubaneswar, Odisha 751024, India	078099 89998	2018-05-14 10:06:30.194801	2019-06-13 05:28:42.108893	\N	20.3427840000000018	85.8111590000000035	\N	4	Bhubaneswar
894	Padma Veg Restaurant & Sweets	Plot 1203 A, Naka Gate, Khandagiri, Bhubaneswar, Odisha 751030, India	0674 238 6056	2018-05-14 10:06:45.294395	2019-06-13 05:28:42.117249	\N	20.271329699999999	85.7837961999999976	\N	4.09999999999999964	Bhubaneswar
895	Bery's Food Park	Plot No.F1, Chandaka Industrial Estate, Near Trident College, Infocity Road, Infocity, Chandrasekharpur, Bhubaneswar, Odisha 751024, India	0674 602 0555	2018-05-14 10:06:56.315939	2019-06-13 05:28:42.125588	\N	20.3396900000000009	85.8077300000000065	\N	4.09999999999999964	Bhubaneswar
1010	BMG- All Day Dining	Rajpur Rd, Jakhan, Dehradun, Uttarakhand 248195, India	0135 273 3000	2018-05-15 09:29:07.343601	2019-06-13 05:28:42.133892	\N	30.3621742999999995	78.0687188999999933	http://www.facebook.com/bmgalldaydining	4	Dehradun
924	99 North Restaurant	No.36/A, Chandaka Industrial Estate, Infocity Road, Near CTTC, Patia, Patia, Bhubaneswar, Odisha 751024, India	077900 03499	2018-05-14 10:11:51.027634	2018-05-14 10:11:51.027634	ChIJMa4xdx0JGToRWw-C8lbYtt8	20.3430509999999991	85.8085310000000021	http://www.99northrestaurant.com/	4.09999999999999964	Bhubaneswar
897	Hot Chilly Fast Food	Near Beer Parlour, Sector A, Rasulgarh, Bhubaneswar, Odisha 751010, India	091328 64269	2018-05-14 10:07:22.085392	2019-06-13 05:28:42.150543	\N	20.2985009000000005	85.8609469999999959	\N	4	Bhubaneswar
898	Mamma Mia (Cafe)	Shop No 4, Lagoon, Mayfair Rd, Jayadev Vihar, Bhubaneswar, Odisha 751013, India	092384 13098	2018-05-14 10:07:30.990305	2019-06-13 05:28:42.158895	\N	20.3003560000000007	85.8194359999999961	http://www.mayfairhotels.com/mayfair-lagoon/wine-and-dine/mamma-mia.html	4.5	Bhubaneswar
899	Food Express	near swosti grand, Kharvelanagar, Master Canteen Area, Kharabela Nagar, Bhubaneswar, Odisha 751001, India	\N	2018-05-14 10:07:42.654404	2019-06-13 05:28:42.167267	\N	20.2701132999999984	85.8418924000000061	\N	4.20000000000000018	Bhubaneswar
900	Food Plaza	Kharabela Nagar, Bhubaneswar, Odisha 751006, India	094703 24289	2018-05-14 10:07:56.76247	2019-06-13 05:28:42.175676	\N	20.2671722999999986	85.8438258999999988	\N	3.39999999999999991	Bhubaneswar
901	Malva Restaurant	Plot No. 1307, 3B, 4th Floor, Expo Towers, Nandan Kanan Road, KIIT, Patia, Bhubaneswar, Odisha 751024, India	0674 272 7229	2018-05-14 10:08:05.014223	2019-06-13 05:28:42.18399	\N	20.3676370999999996	85.831429099999994	\N	4.20000000000000018	Bhubaneswar
902	Truptee Veg Restaurant	67, Budha Nagar, Kalpana Chowk, Buddha Nagar, Laxmi Sagar, Bhubaneswar, Odisha 751006, India	082600 20777	2018-05-14 10:08:11.252876	2019-06-13 05:28:42.192208	\N	20.2591895999999991	85.8417854000000062	\N	4.09999999999999964	Bhubaneswar
903	Bling It On	The New Marrion, # 6, Janpath, Industrial Area, Kharabela Nagar, Bhubaneswar, Odisha 751001, India	0674 238 0850	2018-05-14 10:08:23.629437	2019-06-13 05:28:42.200684	\N	20.2776607999999996	85.8444630000000046	https://www.liveinstyle.com/nightlife/Bhubneshwar/outlet/Bling-it-On-Hotel-Marrion-bhubneshwar	4.09999999999999964	Bhubaneswar
904	3Q Restaurant	National Highway 5, Near Presidency Hotel, Nayapalli, ESIC Quarters, Nayapalli, Bhubaneswar, Odisha 751016, India	090909 61196	2018-05-14 10:08:32.441632	2019-06-13 05:28:42.209003	\N	20.2876271999999993	85.8114295000000027	\N	3.20000000000000018	Bhubaneswar
905	Tangerine 9	Master Canteen Area, Kharabela Nagar, Bhubaneswar, Odisha 751001, India	0674 253 3009	2018-05-14 10:08:34.932152	2019-06-13 05:28:42.217358	\N	20.2694110000000016	85.8416251999999957	\N	4	Bhubaneswar
906	KANIKA	Shop No: 2 Lagoon, Mayfair Rd, Jayadev Vihar, Bhubaneswar, Odisha 751013, India	092384 13009	2018-05-14 10:08:42.750947	2019-06-13 05:28:42.225639	\N	20.3002910000000014	85.8192379999999986	http://www.mayfairhotels.com/mayfair-lagoon/wine-and-dine/kanika.html	4.20000000000000018	Bhubaneswar
907	The Oasis	Saheed Nagar, Bhubaneswar, Odisha 751007, India	083389 35124	2018-05-14 10:08:48.946134	2019-06-13 05:28:42.233991	\N	20.2863962999999998	85.8473288999999937	\N	3.70000000000000018	Bhubaneswar
908	Super Snax	Shop No: 3 Lagoon, MayFair Road, Jayadev Vihar, Bhubaneswar, Odisha 751013, India	092384 13097	2018-05-14 10:08:51.850661	2019-06-13 05:28:42.242294	\N	20.3002530000000014	85.8194089999999932	http://www.mayfairhotels.com/mayfair-lagoon/wine-and-dine/super-snax.html	4.40000000000000036	Bhubaneswar
909	Confucius Restaurant	Hotel Swosti Premium, P-1, Jaydev Vihar, Bhubaneswar, Gajapati Nagar, Bhubaneswar, Odisha 751013, India	0674 301 7000	2018-05-14 10:09:00.355547	2019-06-13 05:28:42.250661	\N	20.3038689999999988	85.8231449999999967	http://www.swostihotels.com/swosti-premium-dine	5	Bhubaneswar
910	Zaika Multi Cuisine Fine Dining Restaurant	Plot NUmber J/7, Jaydev Vihar , Nandankanan Road, Inside Pal Heights, Jayadev Vihar, Bhubaneswar, Odisha 751013, India	099370 28918	2018-05-14 10:09:03.086867	2019-06-13 05:28:42.258919	\N	20.2985275999999999	85.8232897999999977	http://www.palheights.com/	3.79999999999999982	Bhubaneswar
911	Garam Masala	1881, Above PNB bank, Opp BPCL Petrol Pump, Nandankanan Rd, Chandrasekharpur, Bhubaneswar, Odisha 751017, India	099370 14000	2018-05-14 10:09:08.303149	2019-06-13 05:28:42.267341	\N	20.3261709999999987	85.8211100000000044	http://www.garammasala.co.in/	3.79999999999999982	Bhubaneswar
912	Nirmala Hotel & Restaurant	Near Tarini Temple, Samantarapur, Sriram Nagar, Old Town, Bhubaneswar, Odisha 751002, India	078738 68415	2018-05-14 10:09:27.392761	2019-06-13 05:28:42.275624	\N	20.227449	85.8409819999999968	\N	3.70000000000000018	Bhubaneswar
913	Lemon Grass	Shop No 6 Lagoon, MayFair Road, Jayadev Vihar, Bhubaneswar, Odisha 751013, India	092384 13108	2018-05-14 10:09:55.539317	2019-06-13 05:28:42.283957	\N	20.3010249999999992	85.8193260000000038	http://www.mayfairhotels.com/mayfair-lagoon/wine-and-dine/lemon-grass.html	4.5	Bhubaneswar
914	Venus Restaurant	Plot No-346/01, Service Rd S, Patrapada, Bhubaneswar, Odisha 751019, India	0674 600 2230	2018-05-14 10:10:06.219452	2019-06-13 05:28:42.292322	\N	20.2440536999999985	85.7750520999999964	\N	4	Bhubaneswar
915	Tea Pot	Shop No 8 MayFair Lagoon, Jayadev Vihar, Bhubaneswar, Odisha 751013, India	092384 13099	2018-05-14 10:10:11.302859	2019-06-13 05:28:42.300844	\N	20.3028140000000015	85.8192520000000059	http://www.mayfairhotels.com/mayfair-lagoon/wine-and-dine/tea-pot-lounge.html	4.40000000000000036	Bhubaneswar
916	Mirch Masala	Hotel New Marrion, #6, Janpath, Unit 3, Kharabela Nagar, Bhubaneswar, Odisha 751001, India	096923 73205	2018-05-14 10:10:33.540218	2019-06-13 05:28:42.309079	\N	20.2725480000000005	85.8358470000000011	http://www.liveinstyle.com/nightlife/Bhubaneshwar/outlet/Mirch-Masala-bhubaneshwar	4	Bhubaneswar
917	The Pakwan Family Restaurant	Jayadev Vihar, Block N6, IRC Village, Nayapalli, Bhubaneswar, Odisha 751015, India	090408 92234	2018-05-14 10:10:57.405672	2019-06-13 05:28:42.317383	\N	20.2948394000000008	85.817333700000006	\N	4.09999999999999964	Bhubaneswar
918	The Silver Spoon	Prayas 3/6, Nalco Square, Near RCM College, Chandrasekharpur, NALCO Nagar, Chandrasekharpur, Bhubaneswar, Odisha 751023, India	094381 26801	2018-05-14 10:11:05.047698	2019-06-13 05:28:42.325718	\N	20.3128419999999998	85.8198438999999951	\N	3.79999999999999982	Bhubaneswar
919	Narula's Restaurant	45, Hotel Basera, Janpath Road, Ashok Nagar, Ashok Nagar, Bhubaneswar, Odisha 751009, India	097760 00009	2018-05-14 10:11:06.926956	2019-06-13 05:28:42.334024	\N	20.2645090000000003	85.8389600000000002	\N	4.20000000000000018	Bhubaneswar
920	Jungle View	Chudanga Ghar, Chandaka-Nandankanan Road, Chandaka, Jujhagada, Bhubaneswar, Odisha 751024, India	094382 43002	2018-05-14 10:11:11.934309	2019-06-13 05:28:42.342314	\N	20.4019429999999993	85.8060669999999988	http://jungleview.eodisha.com/	4.20000000000000018	Bhubaneswar
921	Wok - Authentic Thai And Chinese Restaurant	P1 & P1/A, XIMB Square, Jayadev Vihar, Gajapati Nagar, Bhubaneswar, Odisha 751013, India	0674 666 5555	2018-05-14 10:11:21.437021	2019-06-13 05:28:42.35069	\N	20.3071719000000002	85.8209413000000012	\N	4	Bhubaneswar
922	Keeva Restaurant & Banquet	Khandagiri Temple Road, Inside Shopping Plaza 1st Floor, Near State Bank Of India, Khandagiri, Bhubaneswar, Odisha 751030, India	0674 238 4718	2018-05-14 10:11:23.945329	2019-06-13 05:28:42.358912	\N	20.2597978999999988	85.7877864999999957	http://keeva.co.in/	3.70000000000000018	Bhubaneswar
923	Chandini Food Magic	University Office, KIIT Road, Chandaka Industrial Estate, K I I T University, Patia, Bhubaneswar, Odisha 751024, India	098536 84859	2018-05-14 10:11:37.579863	2019-06-13 05:28:42.367365	\N	20.3534399999999991	85.8211148999999978	\N	3.70000000000000018	Bhubaneswar
937	Mainland China	A1/A, Ground Floor, The Crown, Service Rd, IRC Village, Nayapalli, Indradhanu Market, IRC Village, Nayapalli, Bhubaneswar, Odisha 751015, India	093388 32133	2018-05-14 10:12:53.757211	2018-05-14 10:12:53.757211	ChIJP_qmpNoJGToRrzkEd3ELwdU	20.2923077999999997	85.8187805000000026	http://www.liveinstyle.com/nightlife/Bhubaneshwar/outlet/Mainland-China-bhubaneshwar	4.29999999999999982	Bhubaneswar
943	Mainland China	SCO 40, Madhya Marg, Sector 26, Chandigarh, 160019, India	0172 500 0007	2018-05-14 10:13:35.947432	2018-05-14 10:13:35.947432	ChIJMfM3_yDtDzkRzFQeZKuvlHw	30.7252229999999997	76.80565	\N	4.09999999999999964	Chandigarh
950	Barbeque Nation	SCO 39, Madhya Marg, Block 2, Sector 26, Near Green Market Chowk, Sector 26, Chandigarh, 160019, India	096549 16060	2018-05-14 10:14:35.044085	2018-05-14 10:14:35.044085	ChIJedogrCHtDzkRBEx9LIGhVr4	30.7256655000000016	76.8053344000000067	http://www.barbeque-nation.com/	4.5	Chandigarh
926	Chandan Restaurant	Hotel Swosti Premium P-1, Jayadev Vihar, Bhubaneswar, Odisha 751013, India	0674 301 7000	2018-05-14 10:11:59.892828	2019-06-13 05:28:42.39263	\N	20.3038980000000002	85.8229194999999976	http://www.swostihotels.com/swosti-premium-dine	3.70000000000000018	Bhubaneswar
927	Nakli Dhaba	1, Shop No: 1 Mayfair Lagoon, Jayadev Vihar, Bhubaneswar, Odisha 751013, India	092384 13099	2018-05-14 10:12:03.403419	2019-06-13 05:28:42.400714	\N	20.3003280000000004	85.8193140000000056	http://www.mayfairhotels.com/mayfair-lagoon/wine-and-dine/nakli-dhaba.html	4.20000000000000018	Bhubaneswar
928	All Swag - Food Hub & Sisha Lounge	Plot No. 1023, Khandagiri-Chandaka Rd, Jagamara, Bhubaneswar, Odisha 751030, India	\N	2018-05-14 10:12:14.839755	2019-06-13 05:28:42.409128	\N	20.2557809000000013	85.8001622999999967	https://m.facebook.com/ALLSWAGTHEFOODHUB/	4.09999999999999964	Bhubaneswar
929	GREENCHILLYZ The Fast Food	3/18 prayas near kalingahospital nalco square chandrassekharpur, NALCO Nagar, Chandrasekharpur, Bhubaneswar, Odisha 751023, India	0674 230 0930	2018-05-14 10:12:17.915246	2019-06-13 05:28:42.417433	\N	20.3137779999999992	85.8199579999999997	http://www.greenchillyz.com/	3.60000000000000009	Bhubaneswar
930	Food Delight	Plot No. GA - 55, Near Patia Square, Gayatri Vihar, C.S. Pur, Gayatri Vihar, Kanan Vihar, Chandrasekharpur, Bhubaneswar, Odisha 751024, India	072054 81050	2018-05-14 10:12:25.202045	2019-06-13 05:28:42.425768	\N	20.3419910000000002	85.8205379999999991	\N	3	Bhubaneswar
931	Food Junction	3rd Floor, Forum Mart, Kharavela Nagar, Industrial Area, Kharabela Nagar, Bhubaneswar, Odisha 751007, India	\N	2018-05-14 10:12:29.282207	2019-06-13 05:28:42.434094	\N	20.2784438999999992	85.8452721999999966	\N	3.70000000000000018	Bhubaneswar
932	Hotel Priya	738 p, Rath Arcade, Jayadev Vihar - Ekamra Kanana Rd, Block N3, IRC Village, Nayapalli, Jayadev Vihar, Bhubaneswar, Odisha 751013, India	0674 236 2323	2018-05-14 10:12:33.690983	2019-06-13 05:28:42.442386	\N	20.296130999999999	85.8227921000000009	\N	4.20000000000000018	Bhubaneswar
933	Aqua Seafood Restaurant	Hotel Swosti 103, Unit 3, Kharabela Nagar Bhubaneshwar, Odisha 751001, India, Master Canteen Area, Kharabela Nagar, Bhubaneswar, Odisha 751001, India	0674 301 9000	2018-05-14 10:12:35.745477	2019-06-13 05:28:42.450704	\N	20.2695530999999995	85.8418711000000059	\N	4.09999999999999964	Bhubaneswar
934	Club Dine Restaurant	Plot 316 , District Centre, Near Aakash Institute, District Center, Chandrasekharpur, Bhubaneswar, Odisha 751016, India	093481 43366	2018-05-14 10:12:43.476717	2019-06-13 05:28:42.459036	\N	20.3257936000000008	85.8184133000000031	\N	4.09999999999999964	Bhubaneswar
935	Sai Bhog	Master Canteen Area, Kharabela Nagar, Bhubaneswar, Odisha 751001, India	090400 44444	2018-05-14 10:12:46.908529	2019-06-13 05:28:42.467316	\N	20.2690550000000016	85.8419336000000044	\N	3.79999999999999982	Bhubaneswar
936	The Regal Food Park	Plot No. 55B, K I I T University, Patia, Patia, Bhubaneswar, Odisha 751024, India	078090 76052	2018-05-14 10:12:49.42156	2019-06-13 05:28:42.475668	\N	20.3464850999999989	85.8106054	\N	4.40000000000000036	Bhubaneswar
938	Subyonjan Restaurant	352, Metro Classic Building, Rupali Street, Opp jagannath hospital, Sahid Nagar, Saheed Nagar, Bhubaneswar, Odisha 751007, India	0674 254 7537	2018-05-14 10:12:56.214892	2019-06-13 05:28:42.486101	\N	20.2897189000000004	85.8453798999999975	\N	3.79999999999999982	Bhubaneswar
939	Milky Den Restaurant	13, Subham Market Complex, Near Ram Mandir, Kharvel Nagar, Industrial Area, Kharabela Nagar, Bhubaneswar, Odisha 751001, India	095561 61655	2018-05-14 10:13:02.179171	2019-06-13 05:28:42.492416	\N	20.2784914000000001	85.8441423999999955	\N	4.59999999999999964	Bhubaneswar
940	Pathik Restaurant	361, Near Rupali Chak, Sahid Nagar, Saheed Nagar, Bhubaneswar, Odisha 751007, India	0674 254 1509	2018-05-14 10:13:07.38894	2019-06-13 05:28:42.500729	\N	20.2892550000000007	85.8432600000000008	http://www.pathikrestaurant.com/	3.79999999999999982	Bhubaneswar
941	Urban Café	Hyatt Regency Chandigarh 178 Industrial and Business Park, Phase I Ground Floor, Industrial Area Phase I, Chandigarh, 160002, India	084484 96363	2018-05-14 10:13:25.168014	2019-06-13 05:28:42.509064	\N	30.7044069999999998	76.8005509999999987	http://urbancafe-restaurant.business.site/	4.20000000000000018	Chandigarh
942	Buffet Hut	SCO 143-44, Madhya Marg, Sector 9 C, 9C, Sector 9, Chandigarh, 160009, India	089687 85780	2018-05-14 10:13:33.163433	2019-06-13 05:28:42.517406	\N	30.7424259000000006	76.7898174999999981	http://www.buffethut.com/	4	Chandigarh
944	Buffet 35	Sco 349-350, Near AXIS Bank, Sector 35 -B, 35B, Sector 35, Chandigarh, 160035, India	090411 38138	2018-05-14 10:13:42.116699	2019-06-13 05:28:42.527861	\N	30.7243068999999984	76.7644947999999943	\N	3.5	Chandigarh
945	Pirates Of Grill	178/178A, Purv Marg, Industrial Area Phase I, Chandigarh, 160002, India	0172 401 7444	2018-05-14 10:13:48.624103	2019-06-13 05:28:42.534092	\N	30.7059229999999985	76.8007031000000069	\N	4.09999999999999964	Chandigarh
946	Kelong	178-178A, Purv Marg, Industrial Area Phase I, Chandigarh, 160002, India	0172 468 1742	2018-05-14 10:13:56.520051	2019-06-13 05:28:42.542435	\N	30.7060738999999998	76.8007393999999977	https://m.facebook.com/kelongchandigarh/	3.79999999999999982	Chandigarh
947	Sip 'n' Dine	SCO 16A, Sector 7-C, Madhya Marg, Sector 7-C, Sector 7, Chandigarh, 160019, India	0172 464 1656	2018-05-14 10:14:15.179334	2019-06-13 05:28:42.550742	\N	30.7320071000000006	76.7989812999999941	http://sipndine.co.in/	3.89999999999999991	Chandigarh
948	Ghazal Restaurant	SCO 189-190-191, Sector 17C, Near Bridge Road, Bridge Market, 17C, Sector 17, Chandigarh, 160017, India	0172 270 4448	2018-05-14 10:14:23.930118	2019-06-13 05:28:42.559101	\N	30.7388599000000013	76.7850801000000018	\N	4.20000000000000018	Chandigarh
949	Treato Bakery and Fast Food Restaurant	SCF-14, Sector-20 C, 20C, Sector 20, Chandigarh, 160020, India	0172 500 7213	2018-05-14 10:14:27.141236	2019-06-13 05:28:42.567404	\N	30.719319200000001	76.7832736000000011	https://www.facebook.com/treatochd	4.09999999999999964	Chandigarh
951	Prem's Restaurant And Fast Food	SCO 3, Sector 41D, Badheri, Sector 41, Chandigarh, 160040, India	0172 262 6260	2018-05-14 10:14:38.500948	2019-06-13 05:28:42.577407	\N	30.7342009000000012	76.7370468999999957	http://www.facebook.com/PremRestaurantChd	3.70000000000000018	Chandigarh
952	Swagath Restaurant And Bar	SCO No.7, Madhya Marg, Sector 26, Chandigarh, 160019, India	0172 500 2626	2018-05-14 10:14:47.138626	2019-06-13 05:28:42.584036	\N	30.72851	76.8026899999999983	http://www.swagath.in/	4.20000000000000018	Chandigarh
1011	Curry Club	Saharanpur Rd, Niranjanpur, Dehradun, Uttarakhand 248001, India	0135 262 5762	2018-05-15 09:29:08.470357	2019-06-13 05:28:42.592414	\N	30.3044766999999986	78.0122218000000061	\N	3.5	Dehradun
979	Bawarchi Restaurant	Near ISBT, Sharanpur Road, Morowala, Morowala, Clement Town, Dehradun, Uttarakhand 248001, India	099179 46980	2018-05-15 09:27:59.359986	2018-05-15 09:27:59.359986	ChIJE7rLJbYrCTkRC4gYc_dfzD0	30.2874493999999999	77.9963156999999967	https://www.facebook.com/BawarchiRestaurantDehraduN	4.09999999999999964	Dehradun
954	Sankalp Vegetarian Restaurant	Showroom # 11, Sector 26, Madhya Marg, Sector 26, Chandigarh, 160026, India	0172 465 3355	2018-05-14 10:14:55.012355	2019-06-13 05:28:42.609163	\N	30.7281770999999999	76.8028730000000053	http://www.sankalponline.com/	4	Chandigarh
955	Golconda Food Point	No. 401, Shopping Plaza, Sector 32D, Sector 9C, Sector 32D, Sector 32, Chandigarh, 160033, India	0172 266 4866	2018-05-14 10:15:00.859841	2019-06-13 05:28:42.617523	\N	30.710663799999999	76.7725195999999954	\N	3.79999999999999982	Chandigarh
956	Dera	Taj Chandigarh, Block No. 9, Sector-17 A, 17A, Sector 17, Chandigarh, 160017, India	0172 661 3000	2018-05-14 10:15:05.032829	2019-06-13 05:28:42.625816	\N	30.7455624000000007	76.7852158999999972	https://vivanta.tajhotels.com/en-in/chandigarh-punjab/restaurants/dera/?utm_medium=Local&utm_source=Google&utm_campaign=Dera-Restaurant	4.40000000000000036	Chandigarh
957	Sundarams South Indian Food	SCO -35, Madhya Marg, Sector 26, Chandigarh, 160017, India	093160 17509	2018-05-14 10:15:09.695237	2019-06-13 05:28:42.634111	\N	30.7259005999999992	76.8051844000000017	http://www.sundaramsfoods.com/	4.29999999999999982	Chandigarh
958	Café 17	Taj Chandigarh, Block No. 9, 17A, Sector 17, Chandigarh, 160017, India	0172 661 3000	2018-05-14 10:15:17.781246	2019-06-13 05:28:42.642434	\N	30.7455350000000003	76.7852050000000048	https://taj.tajhotels.com/en-in/taj-palace-new-delhi/restaurants/orient-express-restaurant/?utm_source=Google&utm_campaign=Orient-Express&utm_medium=Local	4.5	Chandigarh
959	Baluchi Chandigarh	The Lalit Chandigarh Hotel, Rajiv Gandhi IT Park, Near DLF Commercial Complex, Chandigarh, 160101, India	0172 300 7777	2018-05-14 10:15:32.208358	2019-06-13 05:28:42.650783	\N	30.730678000000001	76.841431	http://www.thelalit.com/the-lalit-chandigarh/eat-and-drink/baluchi/	4.79999999999999982	Chandigarh
960	Black Lotus	Taj Chandigarh, Jan Marg, Block No. 9, Sector 17, Chandigarh, 160017, India	0172 661 3000	2018-05-14 10:15:41.560698	2019-06-13 05:28:42.659142	\N	30.7454889999999992	76.7853870000000001	https://taj.tajhotels.com/en-in/taj-exotica-maldives/restaurants/equator-bar/?utm_source=Google&utm_campaign=Equator-Bar&utm_medium=Local	4.5	Chandigarh
961	Food@U	182/72, Industrial Area Phase I, Chandigarh, 160002, India	086990 05669	2018-05-14 10:15:46.270414	2019-06-13 05:28:42.667499	\N	30.7030357999999985	76.7967957999999982	http://foodatu.co.in/	4.09999999999999964	Chandigarh
962	Hotel KLG International	SCO 121-22-23-24, Sector 43-B, Himalaya Marg, 43B, Sector 43, Chandigarh, 160034, India	0172 465 0001	2018-05-14 10:15:57.027648	2019-06-13 05:28:42.675822	\N	30.7176662	76.7537726000000049	http://www.hotelklg.com/	3.79999999999999982	Chandigarh
963	Punjab Restaurant	1, Patel Market, Near Clock Tower, Rajpur Road, Race Course, Dehradun, Uttarakhand 248001, India	0135 265 0303	2018-05-15 09:27:29.050183	2019-06-13 05:28:42.684167	\N	30.3256461000000002	78.0434501000000012	\N	3.79999999999999982	Dehradun
964	Lakshmi Restaurant	38, Paltan Bazar Rd, Moti Bazar, Paltan Bazaar, Dehradun, Uttarakhand 248001, India	099530 21861	2018-05-15 09:27:31.410569	2019-06-13 05:28:42.69249	\N	30.3229010000000017	78.0402449999999988	http://www.facebook.com/lakshmirestaurant	3.60000000000000009	Dehradun
965	Jassi Restaurant Dehradun	Shop No.6 & 7, J.N.Plaza, Haridwar Road, Opp. Chappan Bhog Sweet Shop, Chander Nagar, Race Course, Dehradun, Uttarakhand 248001, India	073518 73620	2018-05-15 09:27:33.634744	2019-06-13 05:28:42.700837	\N	30.3151140000000012	78.0391740000000027	\N	3.79999999999999982	Dehradun
966	Kwik Bite Centre - Fast Food Restaurant in Dehradun	2/4, Clock Tower, Next To Allahabad Bank, Gandhi Rd, Ghanta Ghar, Race Course, Dehradun, Uttarakhand 248001, India	097566 04566	2018-05-15 09:27:35.310729	2019-06-13 05:28:42.709139	\N	30.3237249999999996	78.0419880000000035	http://kwik-bite-centre-in.business.site/	4.09999999999999964	Dehradun
967	The Barons Restaurant	Kishan Nagar Chowk, Premier Shopping Complex, 51-Rajender Nagar, Kaulagarh Rd, Rajender Nagar, Dehradun, Uttarakhand 248001, India	0135 275 4119	2018-05-15 09:27:37.249859	2019-06-13 05:28:42.717443	\N	30.3392793000000012	78.0201256000000001	\N	3.70000000000000018	Dehradun
968	Nanking Restaurant & Caterer’s	361/1, Ballupur Rd, Ballupur, Dehradun, Uttarakhand 248001, India	081267 11001	2018-05-15 09:27:39.149633	2019-06-13 05:28:42.725797	\N	30.3336359999999985	78.0164680000000033	http://www.nankingrestaurant.in/	3.70000000000000018	Dehradun
969	Walk In Woods Restaurant	Sahastradhara Road, Mandakini Vihar, Saundhon wali, Chironwali, Dehradun, Uttarakhand 248001, India	078954 23317	2018-05-15 09:27:40.924568	2019-06-13 05:28:42.734093	\N	30.3462439999999987	78.0753019999999935	http://walk-in-woods.business.site/	4.70000000000000018	Dehradun
970	Kumar Vegetarian	Rajpur Road, Chukkuwala, Dehradun, Uttarakhand 248001, India	0135 265 9266	2018-05-15 09:27:42.346186	2019-06-13 05:28:42.742433	\N	30.3269289999999998	78.0447891999999968	\N	4	Dehradun
1002	Tondon's Fast Food	47, Dhakpatti, Rajpur Rd, Kairwaan Gaon, Dehradun, Uttarakhand 248009, India	098974 69074	2018-05-15 09:28:53.310895	2019-06-13 05:28:42.75074	\N	30.3910772000000016	78.0935793000000018	\N	4.70000000000000018	Dehradun
971	Salt & Cravings	10, Rajpur Rd, Ashtley Hall, Irigation Colony, Karanpur, Dehradun, Uttarakhand 248001, India	0135 265 7082	2018-05-15 09:27:43.858196	2019-06-13 05:28:42.759106	\N	30.3280889000000009	78.0462454000000037	\N	4.20000000000000018	Dehradun
972	Dope High On Food	Old Mussoorie Rd, Malsi, Dehradun, Uttarakhand 248009, India	099114 03900	2018-05-15 09:27:45.645218	2019-06-13 05:28:42.767488	\N	30.3928373000000001	78.0918341999999939	\N	4.20000000000000018	Dehradun
973	Cafe B. M. G	Vasant Vihar, Indra Nagar Colony, Dehradun, Uttarakhand 248001, India	0135 276 6677	2018-05-15 09:27:48.264445	2019-06-13 05:28:42.775791	\N	30.3222640000000006	78.0029849999999954	\N	3.89999999999999991	Dehradun
974	The Food Festival	Haridwar Road, Haridwar Bypass, Pragati Vihar, Ajabpur Kalan, Dehradun, Uttarakhand 248001, India	\N	2018-05-15 09:27:51.331985	2019-06-13 05:28:42.78416	\N	30.2952852999999998	78.0549833000000035	\N	3.70000000000000018	Dehradun
975	Malabar Restaurant	193/1, Kathbungla, Near Sai Mandir, Rajpur Road, IAS Officers Colony, Rajpur, Dehradun, Uttarakhand 248009, India	094550 79562	2018-05-15 09:27:53.310687	2019-06-13 05:28:42.792478	\N	30.3790058999999992	78.0889020000000045	http://www.malabarkabunglow.in/	3.60000000000000009	Dehradun
976	Uttarakhand Food Junction	No.30,Clock Tower, Chakarata Rd, Bindaal Tirahya, Tagore Villa, Chukkuwala, Dehradun, Uttarakhand 248001, India	094561 18812	2018-05-15 09:27:55.095835	2019-06-13 05:28:42.800863	\N	30.3263248999999995	78.0351385999999962	\N	4.20000000000000018	Dehradun
977	Step-In Restaurant	Chakarata Rd, Shahpur, Prem Nagar, Dehradun, Uttarakhand 248001, India	097590 74724	2018-05-15 09:27:55.870014	2019-06-13 05:28:42.809159	\N	30.335598000000001	77.9619564999999994	\N	3.79999999999999982	Dehradun
978	Fiesta Multicusine Restaurant	Vasant Vihar Road, Near Anurag Nursery, Shivalik Puram, Dehradun, Uttarakhand 248001, India	098978 79815	2018-05-15 09:27:57.75791	2019-06-13 05:28:42.817486	\N	30.3245503999999997	78.0068876999999929	\N	3.29999999999999982	Dehradun
1047	Little Chef	Rukmini Gaon, Guwahati, Assam 781036, India	084860 40647	2018-05-15 09:30:27.355044	2019-06-13 05:28:42.827891	\N	26.1361182999999997	91.7918765999999948	\N	3	Dispur
999	Flavours restaurant	patel nagar, opp telephone exchange( near lal pul ), saharanpur road, Patel Nagar, Dehradun, Uttarakhand 248001, India	0135 272 6166	2018-05-15 09:28:47.775447	2018-05-15 09:28:47.775447	ChIJP8YnlSgqCTkRCbpNeY9hbmM	30.3070829999999987	78.0158380000000022	http://www.hoteldooncastle.com/	3.60000000000000009	Dehradun
982	Kalsang Restaurant	88 A, Rajpur Road, Opposite Osho, Chander Lok Colony, Hathibarkala Salwala, Dehradun, Uttarakhand 248001, India	095572 70285	2018-05-15 09:28:11.492265	2019-06-13 05:28:42.850802	\N	30.3469233000000003	78.0625481999999948	\N	4.20000000000000018	Dehradun
983	Ladpur Restaurant- Restaurants in Raipur Road Dehradun	Ladpur, Ring Road Chowk, Contact no. 7417173737, Rakshapuram, Ladpur, Dehradun, Uttarakhand 248001, India	074171 73737	2018-05-15 09:28:13.079741	2019-06-13 05:28:42.859268	\N	30.3171871000000017	78.0808210000000003	http://ladpur-restaurant.business.site/	4	Dehradun
984	Anandam	Krishna Towers, 69, Rajpur Rd, Ravindrapuri, Hathibarkala Salwala, Dehradun, Uttarakhand 248001, India	0135 274 6061	2018-05-15 09:28:16.723342	2019-06-13 05:28:42.867531	\N	30.3353493999999984	78.0531385000000029	http://www.anandamfood.com/	4	Dehradun
985	BEST BUDDY'S CAFE	GROUND FLOOR, PACIFIC HILLS, MAIN MUSSORIE DIVERSION, Malsi, Dehradun, Uttarakhand 248009, India	082720 00068	2018-05-15 09:28:18.425074	2019-06-13 05:28:42.876258	\N	30.3722269999999988	78.0771079999999955	\N	3.89999999999999991	Dehradun
986	grille restaurant and bar	Jakhan, Dehradun, Uttarakhand 248195, India	084497 15899	2018-05-15 09:28:20.948368	2019-06-13 05:28:42.884227	\N	30.3592133000000004	78.071124999999995	\N	3.60000000000000009	Dehradun
987	Negi Food Restaurant	Near Gandhi Park, Rajpur Rd, Race Course, Dehradun, Uttarakhand 248001, India	098974 09006	2018-05-15 09:28:22.322321	2019-06-13 05:28:42.892606	\N	30.3259509999999999	78.0442242999999962	\N	\N	Dehradun
988	Ashirwad Fast Food Restaurant in Raipur Dehradun	Chakki No.4 Opp. UCO Bank, Ranjhawala Raipur, Near Nanda Gas godown Raipur, Contact No. 9027769272, Raipur, Dehradun, Uttarakhand 248001, India	090277 69272	2018-05-15 09:28:23.024475	2019-06-13 05:28:42.900912	\N	30.3053360000000005	78.0980679999999978	http://ashirwad-fast-food-restaurant.business.site/	3.89999999999999991	Dehradun
989	Town Table	101, Rajpur Rd, Hathibarkala Salwala, Dehradun, Uttarakhand 248001, India	0135 274 9999	2018-05-15 09:28:25.494622	2019-06-13 05:28:42.90927	\N	30.3409365000000015	78.0600318999999985	\N	4.09999999999999964	Dehradun
990	Siddharth Restaurant	EC Road, Survey Chowk, Irigation Colony, Karanpur, Dehradun, Uttarakhand 248001, India	078951 99802	2018-05-15 09:28:27.245572	2019-06-13 05:28:42.917574	\N	30.3252495000000017	78.0517401000000035	\N	1	Dehradun
991	Oberoi's Restaurant	57 B, Tyagi Rd, East Rest Camp, Govind Nagar, Race Course, Dehradun, Uttarakhand 248001, India	097604 20261	2018-05-15 09:28:28.31897	2019-06-13 05:28:42.925889	\N	30.3095376999999999	78.0373084000000006	\N	4.5	Dehradun
992	Orchard	3/B, Rajpur Rd, Dhakpatti, Kairwaan Gaon, Dehradun, Uttarakhand 248009, India	099177 33111	2018-05-15 09:28:30.140348	2019-06-13 05:28:42.93423	\N	30.3898082000000009	78.0946182999999934	\N	4.29999999999999982	Dehradun
993	Dana Pani Restaurant	Near ISBT, Saharanpur Road, Morowala, Clement Town, Dehradun, Uttarakhand 248002, India	0135 264 1777	2018-05-15 09:28:32.345601	2019-06-13 05:28:42.942552	\N	30.2879207000000008	77.9964709000000056	http://www.danapanirestaurant.in/	3.70000000000000018	Dehradun
994	Kebab hub	Shree Tower, Near Domino's, Ambala-Dehradun-Haridwar Rd, Shastri Nagar, Ajabpur Kalan, Danda Dharampur, Ajabpur Kalan, Dehradun, Uttarakhand 248001, India	074177 76677	2018-05-15 09:28:33.914575	2019-06-13 05:28:42.950952	\N	30.2924843999999993	78.0590964999999954	\N	3.20000000000000018	Dehradun
995	Daddy's take out food corner	Doon Vihar, Jakhan, Dehradun, Uttarakhand 248195, India	098974 93712	2018-05-15 09:28:35.397235	2019-06-13 05:28:42.959256	\N	30.3635668999999986	78.0687681999999938	\N	4.40000000000000036	Dehradun
996	Sammaan Restaurant	5, Darshani Gate, Paltan Bazar Rd, Jhanda Mohalla, Dehradun, Uttarakhand 248001, India	095680 00078	2018-05-15 09:28:37.42629	2019-06-13 05:28:42.967606	\N	30.3171762999999999	78.033533300000002	\N	3.5	Dehradun
997	Tirupati	opposite of St. Joseph's Academy, 12, Rajpur Road, Dobhalwala, Chukkuwala, Dehradun, Uttarakhand 248001, India	070551 91119	2018-05-15 09:28:39.717364	2019-06-13 05:28:42.97591	\N	30.3293277000000003	78.0466406000000035	http://www.tirupatirestaurant.com/	4	Dehradun
998	The Punjabi Essence	16, Rajpur Rd, Irigation Colony, Karanpur Irigation Colony, Karanpur, Dobhalwala, Chukkuwala, Dehradun, Uttarakhand 248001, India	0135 271 3380	2018-05-15 09:28:46.544876	2019-06-13 05:28:42.984269	\N	30.3293710999999995	78.046617800000007	http://www.thepunjabiessence.com/	4.20000000000000018	Dehradun
1000	Lhasa Restaurant	Rajpur Rd, Kairwaan Gaon, Dehradun, Uttarakhand 248009, India	0135 273 4839	2018-05-15 09:28:49.652202	2019-06-13 05:28:42.994849	\N	30.3935209999999998	78.0952874999999977	\N	4	Dehradun
1001	Raaga The Restaurant	17-b,Opp Gandhi Park Gate, Rajpur Rd, Race Course, Dehradun, Uttarakhand 248001, India	0135 265 3919	2018-05-15 09:28:51.544266	2019-06-13 05:28:43.000906	\N	30.326474000000001	78.046101500000006	\N	4.29999999999999982	Dehradun
1003	Burger King	156 A, Rajpur Rd, Kishanpur, Dehradun, Uttarakhand 248001, India	0135 273 5658	2018-05-15 09:28:55.330985	2019-06-13 05:28:43.009243	\N	30.3663859999999985	78.070168300000006	http://www.burgerking.com/	4.20000000000000018	Dehradun
1004	Sagar Ratna	166, Rajpur Rd, Dobhalwala, Malsi, Dehradun, Uttarakhand 248001, India	081929 18018	2018-05-15 09:28:56.946643	2019-06-13 05:28:43.0176	\N	30.3692880000000009	78.0744966999999974	http://sagarratna.in/	3.70000000000000018	Dehradun
1005	Rajdhani Restaurant	177, Raj Market (W), Opposite FRI Gate, Chakarata Rd, Vasant Vihar, Dehradun, Uttarakhand 248001, India	\N	2018-05-15 09:28:58.734448	2019-06-13 05:28:43.025936	\N	30.3324929999999995	77.9970528999999999	http://rajdhani.co.in/	3.10000000000000009	Dehradun
1006	Level One Restaurant	448/2, Rajpur Rd, Hathibarkala Salwala, Dehradun, Uttarakhand 248001, India	0135 274 9900	2018-05-15 09:29:00.822525	2019-06-13 05:28:43.034239	\N	30.341392299999999	78.0605501000000004	\N	3.79999999999999982	Dehradun
1007	'SFC' sethi's food corner	uttrakhand, 71, Ansari Marg, Bindaal Tirahya, Connaught Place, Dehradun, Uttarakhand 248001, India	087550 23999	2018-05-15 09:29:02.178294	2019-06-13 05:28:43.042559	\N	30.3259475999999992	78.0344147999999933	\N	4.79999999999999982	Dehradun
1008	South Indian Vibes	9, Rajpur Rd, Ashtley Hall, Irigation Colony, Karanpur, Dehradun, Uttarakhand 248001, India	0135 271 9978	2018-05-15 09:29:03.520678	2019-06-13 05:28:43.050821	\N	30.3279151999999996	78.046058599999995	http://southindianvibes.com/	4.40000000000000036	Dehradun
1009	First Gear Cafe	Mussoorie Road, Near Shiv Mandir, Khala Gaon, Dehradun District, Rajpur, Uttarakhand 248009, India	074091 12200	2018-05-15 09:29:05.465257	2019-06-13 05:28:43.059275	\N	30.4116293000000013	78.0850546000000065	http://firstgearcafe.com/	4.09999999999999964	Dehradun
1012	Food Funda	5D Rajpur road, dehradun, Chukkuwala, Dehradun, Uttarakhand 248001, India	094120 54726	2018-05-15 09:29:09.1576	2019-06-13 05:28:43.067548	\N	30.3258451999999998	78.0432258999999959	\N	4.20000000000000018	Dehradun
1014	9 Downtown Restro & Cafe	Shop no.8 Pacific hills, Mussorie diversion, Malsi, Dehradun, Uttarakhand 248001, India	097191 11191	2018-05-15 09:29:12.092175	2019-06-13 05:28:43.084262	\N	30.3723363000000006	78.0771168999999929	\N	3.20000000000000018	Dehradun
1015	SPICE ROUTE	Ground Floor, Divine Plaza,G.S Road, Supermarket, Dispur, Swaraj Nagar, Sarumotoria, Guwahati, Assam 781005, India	098540 77077	2018-05-15 09:29:21.033724	2019-06-13 05:28:43.092589	\N	26.142631999999999	91.795371700000004	\N	4.09999999999999964	Dispur
1016	Gam's Delicacy Restaurant	Krishna Market, Ganeshguri, R.G. Baruah Road, GMC Ward Number 44, Nayanpur, Guwahati, Assam 781006, India	082560 20001	2018-05-15 09:29:23.545965	2019-06-13 05:28:43.10097	\N	26.1489247999999996	91.7866302000000047	http://gamsdelicacy.in/	4.20000000000000018	Dispur
1017	Mosaic Restaurants	The Residency Tourist, GMC Ward Number 44, Nayanpur, GS Road, Assam 781005, India	\N	2018-05-15 09:29:25.612232	2019-06-13 05:28:43.109269	\N	26.1501200000000011	91.7860900000000015	\N	3.60000000000000009	Dispur
1018	Ajalitora Fast Food	Secretariat Rd, Dispur, Basisthpur, Guwahati, Assam 781005, India	\N	2018-05-15 09:29:26.916508	2019-06-13 05:28:43.117583	\N	26.1391999999999989	91.7885617000000025	\N	\N	Dispur
1019	J 14	Dr. R.P. Road, M.L.A Hostel, Dipsur Last Gate, Dispur, Basisthpur, Guwahati, Assam 781006, India	093805 07700	2018-05-15 09:29:27.822704	2019-06-13 05:28:43.125944	\N	26.1392817999999991	91.7877584000000013	\N	4	Dispur
1020	Gandharb Restaurant	Dr R.P. Rd, Behind MLA Hostel, Last Gate, Dispur, Basisthpur, Guwahati, Assam 781006, India	097070 15378	2018-05-15 09:29:29.808735	2019-06-13 05:28:43.13428	\N	26.1399141999999998	91.7875970000000052	\N	3.89999999999999991	Dispur
1021	Cinderella Restaurant	Dr RP Rd, Dispur, Guwahati, Assam 781006, India	082540 92145	2018-05-15 09:29:31.349861	2019-06-13 05:28:43.142567	\N	26.1488280999999994	91.785796899999994	\N	3	Dispur
1022	The SecreTrait	Hotel Rajdhani Regency, Dispur Last Gate, Beltola - Basistha Rd, Rukmini Gaon, Guwahati, Assam 781006, India	0361 222 7575	2018-05-15 09:29:32.245713	2019-06-13 05:28:43.150863	\N	26.1374470000000017	91.791253999999995	http://www.hotelrajdhaniregency.com/	3.89999999999999991	Dispur
1023	Jonali Hotel & Restaurant	GS Rd, Super Market, Dispur, Rukmini Gaon, Guwahati, Assam 781006, India	\N	2018-05-15 09:29:33.950523	2019-06-13 05:28:43.159265	\N	26.1409687999999996	91.795854300000002	\N	3.20000000000000018	Dispur
1024	The Dispur Dhaba	RG Baruah Rd, Ganeshguri, Guwahati, Assam 781005, India	098545 31497	2018-05-15 09:29:35.591819	2019-06-13 05:28:43.167609	\N	26.1508316000000001	91.784734499999999	\N	3.60000000000000009	Dispur
1025	Snack Mafia	Rajendra Prasad Rd, Dr. R.P. Rd, Last gate, Dispur, Basisthpur, Guwahati, Assam 781006, India	098599 35556	2018-05-15 09:29:37.154881	2019-06-13 05:28:43.176358	\N	26.1389868000000014	91.7885806999999971	\N	4.09999999999999964	Dispur
1026	Delicious Hut	Nayanpur Rd, Amritpur Path, RG Baruah Rd, Ganeshguri Chariali, Dispur, Ganeshguri, Guwahati, Assam 781006, India	097076 35611	2018-05-15 09:29:38.475339	2019-06-13 05:28:43.184334	\N	26.1498056000000005	91.7863592000000068	\N	\N	Dispur
1027	Food.com Restaurant	7, Jayanagar Rd, Jaya Nagar, Six Mile, Guwahati, Assam 781022, India	073990 01122	2018-05-15 09:29:39.417214	2019-06-13 05:28:43.192669	\N	26.1295174999999986	91.8070105999999981	\N	3.5	Dispur
1028	J14 Good Food	GS Rd, Six Mile, Guwahati, Assam 781022, India	095770 41305	2018-05-15 09:29:42.069012	2019-06-13 05:28:43.201008	\N	26.131844000000001	91.8080156999999986	\N	3.89999999999999991	Dispur
1029	Ichchapuron	1st Floor, B K Tower, Dispur, Guwahati, Assam 781006, India	091270 19000	2018-05-15 09:29:44.420513	2019-06-13 05:28:43.20937	\N	26.1483740000000004	91.7860074999999966	\N	3.70000000000000018	Dispur
1030	N.E. Food Express	Near Old CID Office, Beltola - Basistha Rd, Nandanpur Path, Beltola, Guwahati, Assam 781036, India	084038 55840	2018-05-15 09:29:48.011431	2019-06-13 05:28:43.217677	\N	26.1262238000000018	91.7968919999999997	\N	3.79999999999999982	Dispur
1031	Ganeshguri Gmch Road	Dispur College Rd, Ganeshguri, Guwahati, Assam 781034, India	084720 86628	2018-05-15 09:29:50.978599	2019-06-13 05:28:43.226021	\N	26.1489705000000008	91.7848331000000002	\N	\N	Dispur
1032	Mughlai Kolkata	RG Baruah Rd, Ganeshguri Chariali, Ganeshguri, Guwahati, Assam 781006, India	096787 88850	2018-05-15 09:29:52.56151	2019-06-13 05:28:43.234284	\N	26.150573399999999	91.7847033000000039	\N	3.39999999999999991	Dispur
1033	Mughals Taste Meets Tradition	1st Floor, Kanchan Complex, B N Saikia Road, Wireless, Dispur, Wireless, Rukmini Gaon, Guwahati, Assam 781006, India	098540 55022	2018-05-15 09:29:55.501628	2019-06-13 05:28:43.242583	\N	26.1349954000000011	91.7925283999999948	http://www.mughalsguwahati.com/	4	Dispur
1034	Food World Restaurant	GS Rd, Walford Bus Stop,Near International Hospital, Christian Basti, Guwahati, Assam 781005, India	098641 45849	2018-05-15 09:29:58.244547	2019-06-13 05:28:43.250926	\N	26.1529710999999985	91.7814333000000033	\N	5	Dispur
1035	Raja Mircha	Near GNRC HOSPITALS, 781006, Usha Nagar, Rukmini Gaon, Guwahati, Assam 781006, India	070052 04865	2018-05-15 09:29:59.264526	2019-06-13 05:28:43.259361	\N	26.1390339999999988	91.7951369999999969	\N	4.29999999999999982	Dispur
1036	Missisippi Basin	Near Dispur Dhaba, RG Baruah Rd, Ganeshguri, Guwahati, Assam 781006, India	090852 03002	2018-05-15 09:30:00.635705	2019-06-13 05:28:43.267647	\N	26.1508935999999999	91.7847419000000002	https://plus.google.com/108836136554358618075/about?hl=en	4.70000000000000018	Dispur
1037	Gogoi's Pork	supermarket, GS Rd, Dispur, Bormotoria, Guwahati, Assam 781005, India	096138 51585	2018-05-15 09:30:02.731358	2019-06-13 05:28:43.275925	\N	26.1396036000000009	91.7981917999999979	\N	4.09999999999999964	Dispur
1038	Silver Orchid Bar	Avtar Complex, Avtar Complex Path, Basisthpur, Guwahati, Assam 781036, India	\N	2018-05-15 09:30:04.494849	2019-06-13 05:28:43.28435	\N	26.137572500000001	91.790510299999994	\N	3.79999999999999982	Dispur
1039	Dumpling Restaurant	Basistha Road, Survey Point, Beltola, Guwahati, Assam 781028, India	070028 35765	2018-05-15 09:30:12.487498	2019-06-13 05:28:43.292658	\N	26.1304927000000013	91.7950208000000032	\N	3.79999999999999982	Dispur
1040	Rajlakshmi Restaurant	Beltola - Basistha Rd, Dispur Last Gate, Hatigaon, Guwahati, Assam 781006, India	\N	2018-05-15 09:30:15.071849	2019-06-13 05:28:43.301007	\N	26.136420600000001	91.7917582000000039	\N	3.70000000000000018	Dispur
1041	Alpine Restaurant	GS Rd, Saraswati Market, Six Mile, Guwahati, Assam 781022, India	098646 54508	2018-05-15 09:30:16.916195	2019-06-13 05:28:43.309369	\N	26.1328856999999992	91.8058460999999966	\N	3.70000000000000018	Dispur
1042	Naga Kitchen	Opp Pantaloons, G.S. Road, Dispur, Rukmini Gaon, Guwahati, Assam 781006, India	0361 222 0249	2018-05-15 09:30:17.792928	2019-06-13 05:28:43.31769	\N	26.1375211000000007	91.8000815000000046	\N	4	Dispur
1043	Shillong Restaurant	35, GS Rd, Six Mile, Guwahati, Assam 781036, India	\N	2018-05-15 09:30:19.189542	2019-06-13 05:28:43.325996	\N	26.1377670000000002	91.7997886999999935	\N	2.79999999999999982	Dispur
1044	Food Inn	1st Floor, Alokananda Complex, Beltola - Basistha Rd, Basistha Chariali, Beltola, Guwahati, Assam 781029, India	088760 16034	2018-05-15 09:30:21.558701	2019-06-13 05:28:43.334369	\N	26.1132790999999997	91.7976194000000021	\N	3.10000000000000009	Dispur
1045	The Zouq Resto Cafe	Royal Orchard, Beltola, Bylane Number 2, Rani Bagan, Guwahati, Assam 781036, India	091270 50997	2018-05-15 09:30:24.285585	2019-06-13 05:28:43.342687	\N	26.1331178000000008	91.7932083000000034	\N	3.89999999999999991	Dispur
1046	Barbie's Food Court Restaurant	R.G Baruah Rd, Zoo Rd, Tiniali, Guwahati, Assam 781024, India	095085 99312	2018-05-15 09:30:25.838001	2019-06-13 05:28:43.35094	\N	26.1743696999999997	91.7770814999999942	\N	4	Dispur
1050	Cafe Coffee Day	Inside Dee Tee Towers, Down Town Hospital Complex, GS Road, Dispur, Bormotoria, Guwahati, Assam 781006, India	092077 00312	2018-05-15 09:30:30.906013	2018-05-15 09:30:30.906013	ChIJs4v7XtpYWjcRdelbTjKzSNs	26.1383304999999986	91.8001354999999961	http://www.cafecoffeeday.com/	3.70000000000000018	Dispur
1049	Otithi Fast Food & Restaurant	Bishnu Rabha Path, Bhetapara Chariali, Beltola, Guwahati, Assam 781028, India	096131 42999	2018-05-15 09:30:30.155461	2019-06-13 05:28:43.36766	\N	26.1202368000000007	91.7873546000000005	\N	3.79999999999999982	Dispur
1051	Yoko Restaurant	Beltola - Basistha Rd, Das Market, Opposite Bank Of Baroda, Beltola, Guwahati, Assam 781028, India	097060 74290	2018-05-15 09:30:32.528944	2019-06-13 05:28:43.377968	\N	26.1239227000000014	91.7985900999999984	\N	4.20000000000000018	Dispur
1052	Three Guys Restaurant	RG Baruah Road, Next to Syndicate Bank, Nabin Nagar, Guwahati, Assam 781024, India	088110 00222	2018-05-15 09:30:34.648506	2019-06-13 05:28:43.384414	\N	26.167473300000001	91.7789577000000065	http://www.threeguys.in/	4	Dispur
1053	Just Chill Hot Food	Bormotoria, Guwahati, Assam 781036, India	076640 87510	2018-05-15 09:30:36.228455	2019-06-13 05:28:43.417936	\N	26.1439196000000003	91.811842900000002	\N	3.60000000000000009	Dispur
1054	JB's	MG Road, Latasil, Uzan Bazar, Guwahati, Assam 781001, India	098640 30579	2018-05-15 09:30:37.938698	2019-06-13 05:28:43.426062	\N	26.1912739999999999	91.7524336999999974	\N	4	Dispur
1055	Food Hub	GS Rd, Lachit Nagar Bus Stand,Opp.Reliance Trends, Ulubari, Guwahati, Assam 781007, India	084866 03068	2018-05-15 09:30:39.493695	2019-06-13 05:28:43.434403	\N	26.1722733000000005	91.7602555999999936	\N	3.29999999999999982	Dispur
1056	Mosaic Restaurant	Near Gold Gym, GS Rd, Swaraj Nagar, Sarumotoria, Guwahati, Assam 781005, India	\N	2018-05-15 09:30:40.954972	2019-06-13 05:28:43.442679	\N	26.1453336000000007	91.7913374000000033	\N	3.89999999999999991	Dispur
1057	Bhabani Bhojanalaya	G.S. Rd, Near Catholic Church, Six Mile, Six Mile, Guwahati, Assam 781022, India	083990 22129	2018-05-15 09:30:42.431339	2019-06-13 05:28:43.451047	\N	26.1344566	91.8040148000000045	\N	3.89999999999999991	Dispur
1058	Jutire Akhaj Restaurant	Beltola - Basistha Rd, Wireless, Basisthpur, Guwahati, Assam 781036, India	099572 98722	2018-05-15 09:30:44.22044	2019-06-13 05:28:43.459391	\N	26.1346369000000003	91.792697000000004	\N	3.79999999999999982	Dispur
1059	Atrium Restaurant	Hotel Grand Star, Ananda Nagar, Christian Basti, GS Road, Assam 781005, India	\N	2018-05-15 09:30:45.766897	2019-06-13 05:28:43.4677	\N	26.1592756999999985	91.7741096999999968	\N	4	Dispur
1060	Zoya's	Hatigaon, Guwahati, Assam 781038, India	097060 54246	2018-05-15 09:30:46.661279	2019-06-13 05:28:43.476235	\N	26.1369645000000013	91.7860126000000065	\N	4.5	Dispur
1061	The Crown	Dispur, Guwahati, Assam 781006, India	098549 30200	2018-05-15 09:30:49.019671	2019-06-13 05:28:43.484388	\N	26.1486391000000005	91.7858633999999967	\N	3.10000000000000009	Dispur
1062	Crackling Mustard	318, 1st Floor, Crystal Grove, Dr Bhabendra Nath Saikia Path, Near Bhabendra Alay, Survey, Nandanpur Path, Beltola, Guwahati, Assam 781028, India	098540 00504	2018-05-15 09:30:50.728353	2019-06-13 05:28:43.492696	\N	26.1277311999999995	91.7960855999999978	\N	3.70000000000000018	Dispur
1063	Chai Break	Near Hotel Kamrupa Private Limited, RG Baruah Rd, GMC Ward Number 44, Ganeshguri, Guwahati, Assam 781005, India	076700 20777	2018-05-15 09:30:52.456104	2019-06-13 05:28:43.501061	\N	26.1520606999999998	91.7841796000000016	\N	4	Dispur
1064	Mising Kitchen	House No 24, 1st Floor, Near Public Health Chariali, Hengrabari Road, Ganeshguri, GMC Ward Number 44, Lichubagan, Nayanpur, Guwahati, Assam 781006, India	081340 32862	2018-05-15 09:30:54.184508	2019-06-13 05:28:43.509413	\N	26.1512822000000007	91.7912254000000019	\N	4.40000000000000036	Dispur
1065	Flamez Restaurants	Agneedeep Continenal Hotel, South Sarania, Lachit Nagar, GS Road, Guwahati 781005, India	\N	2018-05-15 09:30:56.680097	2019-06-13 05:28:43.517751	\N	26.1703599999999987	91.763149999999996	\N	4	Dispur
1066	Yash Food Point & Cafe	Near GH-O Circle, Infocity Rd, Infocity, Gandhinagar, Gujarat 382409, India	078781 97330	2018-05-15 09:31:06.291528	2019-06-13 05:28:43.526049	\N	23.1958738000000011	72.6346381999999977	\N	3.29999999999999982	Gandhinagar
1067	Sankalp	Shop No.101, Super Mall-1, Infocity, Nr. GH-0 Circle, Infocity, Gandhinagar, Gujarat 382009, India	079 4002 5751	2018-05-15 09:31:07.123853	2019-06-13 05:28:43.534291	\N	23.1963839000000007	72.6331097000000057	http://www.sankalponline.com/	3.79999999999999982	Gandhinagar
1068	Furat Restaurant	Pramukh Arcade, Reliance Cross Road, Opp NID, Urjanagar 1, Kudasan, Urjanagar 1, Gandhinagar, Gujarat 382421, India	079 2321 3440	2018-05-15 09:31:09.334929	2019-06-13 05:28:43.542661	\N	23.1847433999999986	72.6292607000000032	http://www.furatrestaurant.com/	4	Gandhinagar
1069	Greenz Restaurant	Gandhinagar Bypass Road, Opp. Aashka Hospital, Sargaasan, Gandhinagar, Gujarat 382010, India	094266 66500	2018-05-15 09:31:11.106445	2019-06-13 05:28:43.551038	\N	23.1842490999999988	72.6244789999999938	\N	4.20000000000000018	Gandhinagar
1070	Javazzi Food & Coffee	Gandhinagar - Kudasan Road, Urjanagar 1, Kudasan, Gujarat 382421, India	\N	2018-05-15 09:31:12.648527	2019-06-13 05:28:43.559457	\N	23.1842870000000012	72.629610999999997	\N	3.70000000000000018	Gandhinagar
1071	Krishna Fast Food & Restaurant	200, CHH Rd, Sector 21, Gandhinagar, Gujarat 382021, India	079 2324 0440	2018-05-15 09:31:14.633119	2019-06-13 05:28:43.567692	\N	23.2301584000000005	72.6677477000000067	\N	3.89999999999999991	Gandhinagar
1072	Spices and Herbs	Swagat Rainforest-II, Opp. Swaminarayan Dham, Koba, Gandhinagar Highway, Urjanagar 1, Gandhinagar, Gujarat 382421, India	099099 06166	2018-05-15 09:31:16.280388	2019-06-13 05:28:43.576076	\N	23.1815849999999983	72.637395699999999	https://spicesnherbs.in/	4	Gandhinagar
1073	Jiya Fast Food	Patnagar Yojna Bhavan, Behind Bank Of India, Sector 16, Gandhinagar, Gujarat 382016, India	098246 79335	2018-05-15 09:31:18.011571	2019-06-13 05:28:43.584434	\N	23.2273673999999986	72.6470738999999952	\N	3.79999999999999982	Gandhinagar
1074	Pooja Parlour & Fast Food Centre	B/B, District Shopping Centre, CHH Rd, Sector 21, Gandhinagar, Gujarat 382021, India	079 2324 5555	2018-05-15 09:31:20.499794	2019-06-13 05:28:43.592723	\N	23.2304403000000015	72.6673427000000061	http://www.poojaparlour.com/	4.09999999999999964	Gandhinagar
1075	Green Apple Restaurant	1st Floor, Nr. Gandhinagar Nagrik Bank GH-4II, Sector 16, Gandhinagar, Gujarat 382016, India	079 2322 3440	2018-05-15 09:31:22.394847	2019-06-13 05:28:43.601108	\N	23.2291922	72.6483778000000058	\N	4.09999999999999964	Gandhinagar
1076	Saffron	Infocity, Gandhinagar, Gujarat 382009, India	079 4030 4500	2018-05-15 09:31:23.916048	2019-06-13 05:28:43.609405	\N	23.1964863000000001	72.6321489999999983	http://www.sankalponline.com/saffron/destination.aspx?res=2&loc=144	3.20000000000000018	Gandhinagar
1077	Bhagyoday restaurant	197, CHH Road, Sector 21, Gandhinagar, Gujarat 382021, India	079 2323 4440	2018-05-15 09:31:25.205838	2019-06-13 05:28:43.617755	\N	23.2305813999999984	72.6679744000000056	\N	4.20000000000000018	Gandhinagar
1078	Savoury Restaurant and Banquet	Atria Business Hub, KH '0', Sargasan Cross Roads, S.G. Highway, Sargaasan, Gandhinagar, Gujarat 382421, India	095749 78736	2018-05-15 09:31:27.485623	2019-06-13 05:28:43.626068	\N	23.1934010000000015	72.6149939999999958	http://savoury.business.site/	4	Gandhinagar
1079	Village Vatika Garden Restaurant	Plot 32, Near Raisan Petrol Pump, Koba-Gandhinagar Highway, Urjanagar 1, Gandhinagar, Gujarat 382007, India	097377 47879	2018-05-15 09:31:29.225689	2019-06-13 05:28:43.634326	\N	23.1665634000000011	72.6370612999999992	\N	3.60000000000000009	Gandhinagar
1097	Subway	Infocity Super-Mall ANNEXE, G F-01 A, 01 B, 01 C, 01 D, S.G. Highway, Near Indroda Circle, Infocity, Gandhinagar, Gujarat 382009, India	079 4004 0101	2018-05-15 09:32:02.817256	2018-05-15 09:32:02.817256	ChIJX2r73jkqXDkRqzOFYsHjsyM	23.1962149000000011	72.6345615999999978	http://www.subway.co.in/	3.70000000000000018	Gandhinagar
1081	Pathikashram Sarbhara Restaurant - Hotel Pathikashram	GH 3 Circle, GH Road,, Sector 11,, Sector 11, Gandhinagar, Gujarat 382011, India	079 2324 3161	2018-05-15 09:31:32.669191	2019-06-13 05:28:43.651103	\N	23.2179049999999982	72.6429370000000034	\N	4	Gandhinagar
1082	DINE 10 The Restaurant	19-22, Sarthak Heaven Complex, Near Raisan Petrol Pump, Airport Gandhinagar Highway, Koba, Gandhinagar, Gujarat 382421, India	081281 91814	2018-05-15 09:31:35.527193	2019-06-13 05:28:43.659423	\N	23.1630037000000009	72.6367189000000053	http://www.dine10.com/	3.79999999999999982	Gandhinagar
1083	Blake Pepper Restaurant & Banquet Hall	C-117, Swagat Rain Forest 1, Gandhinagar- Ahmedabad Highway, Urjanagar 1, Gandhinagar, Gujarat 382421, India	099980 00188	2018-05-15 09:31:37.382427	2019-06-13 05:28:43.667752	\N	23.1783302999999989	72.6369643999999965	\N	3.89999999999999991	Gandhinagar
1084	South Cafe	Super Mall, 382009, Infocity Rd, Infocity, Gandhinagar, Gujarat 382003, India	097238 16277	2018-05-15 09:31:39.06274	2019-06-13 05:28:43.676145	\N	23.1961551999999998	72.6325030999999939	\N	3.70000000000000018	Gandhinagar
1085	Qwiches	Ground Floor, Info City Super Mall , Unit No. 01, SG Road, Infocity, Infocity, Gandhinagar, Gujarat 382421, India	079 4004 6262	2018-05-15 09:31:40.864176	2019-06-13 05:28:43.684482	\N	23.1964095999999991	72.6331246000000021	http://www.qwiches.com/	4	Gandhinagar
1086	Aavkar Restaurant	Plot No. 318, GH Road, Sector 16, Sector 16, Gandhinagar, Gujarat 382017, India	079 2324 4888	2018-05-15 09:31:42.348475	2019-06-13 05:28:43.692822	\N	23.2266438999999991	72.6467839000000026	\N	3.60000000000000009	Gandhinagar
1087	Parampara Garden Restaurant	Opposite Panchshil House, K-7 Circle, Mansa - Gandhinagar Hwy, Sector 26, Gandhinagar, Gujarat 382041, India	098790 01008	2018-05-15 09:31:44.145499	2019-06-13 05:28:43.701164	\N	23.2654177000000004	72.6427494999999936	http://www.parampararestaurant.co.in/	3.79999999999999982	Gandhinagar
1088	Dev Anjali Fast Food	4, Prabik Mall, Koba- Gandhinagar Highway, Gandhinagar - Ahmedabad Rd, Urjanagar 1, Kudasan, Randesan, Gandhinagar, Gujarat 382421, India	075676 70701	2018-05-15 09:31:45.330983	2019-06-13 05:28:43.709489	\N	23.1782971999999994	72.6385176000000001	\N	2.5	Gandhinagar
1089	Fortune Inn Haveli - Restaurants in Gandhinagar	Plot No. 235, Sector 11, Gandhinagar, Gujarat 382011, India	079 3988 4422	2018-05-15 09:31:46.103155	2019-06-13 05:28:43.717785	\N	23.2177979999999984	72.6496109999999931	https://www.fortunehotels.in/gandhinagar-fortune-inn-haveli-dining.dhm.169?utm_source=google&utm_medium=organic&utm_term=gandhinagar-fortune-inn-haveli-dining&utm_content=gandhinagar&utm_campaign=Listings	4.29999999999999982	Gandhinagar
1090	Kansar Garden Restaurant	Kudasan-Por Road, Nr.Kisan Petrol Pump, Kudasan, Urjanagar 1, Gandhinagar, Gujarat 382424, India	076210 21111	2018-05-15 09:31:48.382839	2019-06-13 05:28:43.726111	\N	23.1751250999999989	72.6282944999999955	http://www.kansargarden.com/	4.09999999999999964	Gandhinagar
1091	Satkar Garden Restaurant & Banquet Hall	Behind Suyash Elegance, Reliance Cross Road, Infocity-, Kudasan Road, Urjanagar 1, Gandhinagar, Gujarat 382421, India	099786 10317	2018-05-15 09:31:50.541747	2019-06-13 05:28:43.734378	\N	23.1818217000000004	72.6299189000000069	http://www.satkarrestaurant.com/	4.09999999999999964	Gandhinagar
1092	Dadi "Sa"	286, Sector 16, Gandhinagar, Gujarat 382016, India	079 2324 2440	2018-05-15 09:31:52.26939	2019-06-13 05:28:43.742737	\N	23.2284569999999988	72.647876999999994	\N	4	Gandhinagar
1093	Nagpuja Dining Hall	Shop No. 133, First Floor, Super Mall-1, Infocity Road, Infocity, Gandhinagar, Gujarat 382409, India	099253 43797	2018-05-15 09:31:54.530311	2019-06-13 05:28:43.7511	\N	23.1960048999999984	72.633808099999996	\N	3.70000000000000018	Gandhinagar
1094	Subway Gandhinagar	Plot No. 231, Shop No. G02A, Haveli Arcade Sector 11, Near Fortune Inn, Sector 11, Gandhinagar, Gujarat 382011, India	079 2323 0001	2018-05-15 09:31:55.725386	2019-06-13 05:28:43.75947	\N	23.2169944000000008	72.6495369000000011	http://www.subway.co.in/	4.09999999999999964	Gandhinagar
1095	DESSERT FOOD COURT	TARAPUR VILLAGE, S.G. HIGHWAY ROAD, Gandhinagar, Gujarat 382421, India	084691 89189	2018-05-15 09:31:57.776069	2019-06-13 05:28:43.767795	\N	23.1837330000000001	72.5987369999999999	http://dessert-food-court.business.site/	3.39999999999999991	Gandhinagar
1096	Chhel Chhabila Restaurant	112/13/14, B Block, 1st Floor, AtriaComplex, Gandhinagar, Sargasan Cir, Sargaasan, Gandhinagar, Gujarat 382421, India	095743 42331	2018-05-15 09:32:00.502669	2019-06-13 05:28:43.776749	\N	23.1936503999999992	72.6147318999999953	\N	3.79999999999999982	Gandhinagar
1098	Hot Bite	Plot No. 443/2, Near HDFC Bank, GH-5 Circle, GH Road, Sector 16, Sector 16, Gandhinagar, Gujarat 382016, India	090679 90990	2018-05-15 09:32:04.252108	2019-06-13 05:28:43.786255	\N	23.230792000000001	72.6461611000000005	\N	5	Gandhinagar
1099	Shambhubhai Shivshakti Bhajipau (Gh 5 Food Court)	Sector 16, Gandhinagar, Gujarat 382016, India	094270 54196	2018-05-15 09:32:05.334664	2019-06-13 05:28:43.792823	\N	23.2343037999999993	72.6486122000000023	http://shambhubhai-shivshakti-bhajipau-gh-5-food.business.site/	3.79999999999999982	Gandhinagar
1100	Chef iffi's Food Truck	Inflibnet Centre Rd, Infocity, Gandhinagar, Gujarat 382421, India	097262 69706	2018-05-15 09:32:07.136513	2019-06-13 05:28:43.801135	\N	23.190052699999999	72.630426099999994	\N	4.20000000000000018	Gandhinagar
1135	The Coffee Shop	Anola Building, MG Marg, Vishal Gaon, Gangtok, Sikkim 737101, India	099327 88462	2018-05-15 09:33:26.332164	2019-06-13 05:28:43.809484	\N	27.3259202999999999	88.6118481999999972	\N	4.40000000000000036	Gangtok
1101	Atithi Food Junction	431 A-B, 4th Floor, Super Mall, 31,Super Mall -1 Nr.SBI,, Infocity, Gandhinagar, Gujarat 382421, India	096011 98152	2018-05-15 09:32:08.771547	2019-06-13 05:28:43.817809	\N	23.1959990000000005	72.6344100000000026	\N	3	Gandhinagar
1102	Balaji Fast Food	Chopati, GH Rd, Sector 16, Gandhinagar, Gujarat 382016, India	097267 24456	2018-05-15 09:32:10.368058	2019-06-13 05:28:43.826098	\N	23.2323264000000016	72.6496554999999944	\N	3.5	Gandhinagar
1103	Sattviko Restaurant and Banquet	Fun N Feast Theme Park, Kudasan Road, Urjanagar 1, Kudasan, Gujarat 382421, India	074900 35987	2018-05-15 09:32:11.338121	2019-06-13 05:28:43.834471	\N	23.1716368999999993	72.6320716999999973	http://www.sattviko.com/	3.89999999999999991	Gandhinagar
1104	Eat Repeat	Shop No.2 Shyam Shukan Residency, Gandhinagar - Ahmedabad Rd, Gandhinagar, Gujarat 382421, India	085110 00909	2018-05-15 09:32:13.27627	2019-06-13 05:28:43.842762	\N	23.1612316000000007	72.6364624999999933	https://www.facebook.com/eat2repeat	3.70000000000000018	Gandhinagar
1105	ChilliHut Restaurant	Urjanagar 1, Kudasan, Gujarat 382421, India	099981 53469	2018-05-15 09:32:15.461159	2019-06-13 05:28:43.851099	\N	23.1835309999999986	72.6290783000000033	https://www.facebook.com/chillihutrestaurant/	3.39999999999999991	Gandhinagar
1106	Hotel Marigold	281, Sector-16, Sector 16, Gandhinagar, Gujarat 382016, India	095584 78637	2018-05-15 09:32:17.205858	2019-06-13 05:28:43.859536	\N	23.2287110000000006	72.6481160000000017	\N	3.70000000000000018	Gandhinagar
1107	Dawat Restaurant	A-11,Super Mall - 1, Infocity, Gandhinagar, Gujarat 382421, India	079 2321 3744	2018-05-15 09:32:19.814449	2019-06-13 05:28:43.867765	\N	23.1960684999999991	72.6333536000000066	\N	3.70000000000000018	Gandhinagar
1123	Cafe Coffee Day	Inside Super Mall 2, Shop No 17, Commercial Complex, Infocity, Infocity, Gandhinagar, Gujarat 382009, India	090819 13962	2018-05-15 09:32:52.300361	2018-05-15 09:32:52.300361	ChIJmTkarDAqXDkRbVu4FovnqjM	23.1965578000000008	72.632204900000005	http://www.cafecoffeeday.com/	4	Gandhinagar
1109	Chatkazz	19, Ground floor, Super Mall 1, Infocity, Gandhinagar, Gujarat 382421, India	081411 17267	2018-05-15 09:32:24.059314	2019-06-13 05:28:43.884489	\N	23.1961018999999986	72.6335679999999968	http://www.chatkazz.com/	3.79999999999999982	Gandhinagar
1110	Havmor The Eatery	Balaji Food, Shop No. 11, 12, 13, Ground Floor Infocity Shopping Mall, Infocity, Gandhinagar, Gujarat 382007, India	079 4004 0201	2018-05-15 09:32:26.041583	2019-06-13 05:28:43.892802	\N	23.1962000999999987	72.6346566999999936	http://www.havmor.com/	3.60000000000000009	Gandhinagar
1111	Plush restaurant	Urjanagar 1, Kudasan, Gujarat 382421, India	072270 36410	2018-05-15 09:32:28.106351	2019-06-13 05:28:43.901232	\N	23.179474299999999	72.6346017000000046	http://prominenthotels.in/plush-menu/	4.09999999999999964	Gandhinagar
1112	Adarsh Bhojnalaya	Plot No-381 , Behind Trupti Parlour, Sector 16, Gandhinagar, Gujarat 382016, India	098245 38880	2018-05-15 09:32:30.031836	2019-06-13 05:28:43.909576	\N	23.2306150000000002	72.6491680000000031	\N	4	Gandhinagar
1113	Radhe Sweets and Snacks	Shop No. 3-4, Plot No.231, Haveli Arcade Ch-road, Sector 11, Sector 11, Gandhinagar, Gujarat 382010, India	079 2324 9596	2018-05-15 09:32:32.06149	2019-06-13 05:28:43.917909	\N	23.2169789999999985	72.6498219000000063	http://www.premnimithaas.com/	4	Gandhinagar
1114	56 Bhog	F 1 & 2, Siddhraj Zavod, Sargasan Cross Road, S.G. Highway, Sargaasan, Gandhinagar, Gujarat 382010, India	070481 26565	2018-05-15 09:32:34.043085	2019-06-13 05:28:43.926211	\N	23.1956553999999997	72.6192319000000026	http://www.56bhog.org/contact-us.html	3.70000000000000018	Gandhinagar
1115	Gulalvadi	Near GH-5 Circle, GH Rd, Sector 22, Gandhinagar, Gujarat 382022, India	094260 06769	2018-05-15 09:32:35.837476	2019-06-13 05:28:43.934582	\N	23.2334360000000011	72.6521089999999958	\N	4.59999999999999964	Gandhinagar
1116	Sam's Pizza	SF101, 1st Floor, Super Mall, 2, Infocity Rd, Infocity, Gandhinagar, Gujarat 382006, India	099099 21022	2018-05-15 09:32:37.955434	2019-06-13 05:28:43.942919	\N	23.1965135999999994	72.6317082000000056	http://www.sankalponline.com/sams-pizza.aspx	3.5	Gandhinagar
1117	Hogger's Den	DA IICT Road, Opp DAIICT College, Infocity, Infocity, Gandhinagar, Gujarat 382421, India	099988 00999	2018-05-15 09:32:40.136031	2019-06-13 05:28:43.951273	\N	23.1893789999999989	72.6304499999999962	\N	4.40000000000000036	Gandhinagar
1118	Delicious Food	Plot No-381, Sector 16,Behind Trupti Parlour, Sector 16, Gandhinagar, Gujarat 382016, India	070462 54555	2018-05-15 09:32:42.53157	2019-06-13 05:28:43.959684	\N	23.2303935000000017	72.648947800000002	\N	4	Gandhinagar
1119	Mr. & Mrs Idly	109, Infocity Rd, Infocity, Gandhinagar, Gujarat 382006, India	099790 99901	2018-05-15 09:32:44.271677	2019-06-13 05:28:43.967919	\N	23.1960316000000013	72.6335880999999972	\N	4.20000000000000018	Gandhinagar
1120	MOMOMAN	NICM Rd, Infocity, Gandhinagar, Gujarat 382421, India	079 4009 0789	2018-05-15 09:32:46.195356	2019-06-13 05:28:43.97616	\N	23.1961753000000002	72.6329460999999981	http://www.momoman.in/	4.29999999999999982	Gandhinagar
1121	Milan Fastfood	Shop No -10,Chopati, Sector 16, Gandhinagar, Gujarat 382016, India	096013 54621	2018-05-15 09:32:47.946476	2019-06-13 05:28:43.984608	\N	23.2314751999999984	72.6491409000000061	\N	3	Gandhinagar
1122	New Dawat Restaurant	61-62-63, Radhe Square, Reliance (DAIICT)Cross Road, Kudasan Road,, Urjanagar 1, Ghandhinagar, Gujarat 382421, India	088661 05888	2018-05-15 09:32:50.159912	2019-06-13 05:28:43.992914	\N	23.1839461	72.6296509999999955	\N	3.70000000000000018	Gandhinagar
1124	Parivar Restaurant	MG Marg, Arithang, Gangtok, Sikkim 737101, India	\N	2018-05-15 09:33:02.305175	2019-06-13 05:28:44.003296	\N	27.3293351999999992	88.6122028000000057	\N	3.39999999999999991	Gangtok
1125	Food Court	Mahatma Gandhi Marg,Beside Mahatma Gandhi Statue, Arithang, Gangtok, Sikkim 737101, India	03592 202 050	2018-05-15 09:33:04.365967	2019-06-13 05:28:44.009562	\N	27.3285939999999989	88.6122239999999977	http://mayainn.co.in/food-court.php	3.70000000000000018	Gangtok
1126	Taste Of Tibet	Mahatma Gandhi Marg, Vishal Gaon, Arithang, Gangtok, Sikkim 737102, India	091631 22020	2018-05-15 09:33:06.616189	2019-06-13 05:28:44.017904	\N	27.3276558999999999	88.6126059000000055	\N	4	Gangtok
1127	Snow Lion Restaurant	Arithang, Gangtok, Sikkim 737101, India	\N	2018-05-15 09:33:08.78782	2019-06-13 05:28:44.026211	\N	27.3322013999999989	88.6139299000000022	\N	3.10000000000000009	Gangtok
1128	Chopstick	MG Marg, Vishal Gaon, Gangtok, Sikkim 737102, India	\N	2018-05-15 09:33:10.856088	2019-06-13 05:28:44.034531	\N	27.3263110000000005	88.6118898000000002	\N	3.89999999999999991	Gangtok
1129	Roll House	MG Marg, Arithang, Gangtok, Sikkim 737101, India	098320 92219	2018-05-15 09:33:12.637579	2019-06-13 05:28:44.042904	\N	27.3288225000000011	88.6125703999999956	\N	4.29999999999999982	Gangtok
1130	Masala - The Restaurant	M.G.Marg, Arithang Opp SBI, Arithang, Gangtok, Sikkim 737101, India	03592 204 384	2018-05-15 09:33:14.840298	2019-06-13 05:28:44.05119	\N	27.3285392999999992	88.6123869999999982	http://www.masalatherestaurant.in	3.79999999999999982	Gangtok
1131	9ine Native Cuisine	Gangtok, Sikkim 737135, India	03592 205 061	2018-05-15 09:33:16.720931	2019-06-13 05:28:44.059622	\N	27.3302999	88.5901049	\N	3.89999999999999991	Gangtok
1132	Metro's Fast Food	Metro Point National Highway India, Arithang, Gangtok, Sikkim 737101, India	03592 203 245	2018-05-15 09:33:18.932088	2019-06-13 05:28:44.06784	\N	27.3305536999999994	88.6129317999999984	\N	3.5	Gangtok
1133	Agarwal's Fast Food	MG Marg, Arithang, Gangtok, Sikkim 737101, India	097330 15768	2018-05-15 09:33:20.689433	2019-06-13 05:28:44.076156	\N	27.3286510000000007	88.6124382999999938	\N	3.79999999999999982	Gangtok
1134	Jungle Cafe	Mayfair Spa Resort & Casino, Lower Samdur Block, Ranipool, Gangtok, Sikkim 737135, India	092328 55025	2018-05-15 09:33:23.833232	2019-06-13 05:28:44.084439	\N	27.2961239999999989	88.5891660000000059	http://www.mayfairhotels.com/mayfair-gangtok/wine-and-dine/jungle-cafe.html	4.20000000000000018	Gangtok
1136	Khan Uncle's Biryani House	Nam Nang Road, New Market, Beside ICICI Bank, Vishal Gaon, Gangtok, Sikkim 737101, India	099324 80018	2018-05-15 09:33:29.046517	2019-06-13 05:28:44.092869	\N	27.3259846000000017	88.6117088000000024	\N	3.70000000000000018	Gangtok
1137	Rasoi Restaurant	MG Marg, Arithang, Gangtok, Sikkim 737101, India	\N	2018-05-15 09:33:30.876998	2019-06-13 05:28:44.101235	\N	27.3301125999999996	88.6124614000000008	\N	3.20000000000000018	Gangtok
1138	Thuendel	Sungava, Gangtok, Sikkim 737101, India	096098 77491	2018-05-15 09:33:33.138907	2019-06-13 05:28:44.109467	\N	27.3444701999999999	88.6066771999999929	\N	4.29999999999999982	Gangtok
1139	Fusion Restaurant and Bar	Convoy Ground, Tadong, Upper Tadong, National Highway 31A, M.P.Golai, Tadong, Gangtok, Sikkim 737102, India	03592 270 130	2018-05-15 09:33:36.742729	2019-06-13 05:28:44.117886	\N	27.3178610000000006	88.6023277000000036	http://www.shumbukhomes.com/	3.60000000000000009	Gangtok
1140	Food Stand	Vishal Gaon, Gangtok, Sikkim 737102, India	070766 98846	2018-05-15 09:33:39.376697	2019-06-13 05:28:44.126198	\N	27.3248801000000014	88.611761400000006	\N	4.40000000000000036	Gangtok
1141	Avi's Fast Food	Gangtok,, Arithang, Gangtok, Sikkim 737101, India	\N	2018-05-15 09:33:43.75762	2019-06-13 05:28:44.134551	\N	27.3298021999999996	88.6123156000000023	\N	5	Gangtok
1142	Wachipa Traditional Food Court	M.G. Marg, Star Hall,, Vishal Gaon, Gangtok, Sikkim 737102, India	097754 35419	2018-05-15 09:33:46.695828	2019-06-13 05:28:44.142874	\N	27.3253036999999992	88.6116729000000021	\N	3.60000000000000009	Gangtok
1147	Cafe Coffee Day	Near Gandhi Statue, MG Marg, Arithang, Gangtok, Sikkim 737101, India	1800 102 5093	2018-05-15 09:33:58.409727	2018-05-15 09:33:58.409727	ChIJT-1_BhWl5jkRuR7P8zeGCoc	27.328906400000001	88.6123699000000045	http://www.cafecoffeeday.com/	3.70000000000000018	Gangtok
1143	Apna Dhaba	MG Marg, Vishal Gaon, Gangtok, Sikkim 737102, India	\N	2018-05-15 09:33:49.609529	2019-06-13 05:28:44.151268	\N	27.3285651999999999	88.6122193000000067	\N	3.79999999999999982	Gangtok
1144	Hotlix	Ropeway Building Deorali Bazaar, Deorali Bazar, Gangtok, Sikkim 737101, India	03592 281 548	2018-05-15 09:33:51.262436	2019-06-13 05:28:44.15962	\N	27.3178541000000017	88.6065732999999938	\N	3.70000000000000018	Gangtok
1145	Mu Kimchi	Vishal Gaon, Gangtok, Sikkim 737102, India	095933 40401	2018-05-15 09:33:53.924075	2019-06-13 05:28:44.167917	\N	27.3233226000000009	88.6113691000000046	\N	3.89999999999999991	Gangtok
1146	South Indian Restaurant	Lal Market Rd, Arithang, Gangtok, Sikkim 737101, India	\N	2018-05-15 09:33:56.02961	2019-06-13 05:28:44.176274	\N	27.3263852000000007	88.6108487000000054	\N	4.09999999999999964	Gangtok
1148	The-Cube	H#169, National Highway 31A, Upper Tadong, Tadong Upper Tadong, Tadong, Upper Tadong, Tadong, Gangtok, Sikkim 737102, India	089672 14331	2018-05-15 09:34:00.796784	2019-06-13 05:28:44.186628	\N	27.3159571999999997	88.5955957000000041	\N	3.79999999999999982	Gangtok
1149	Wangdi Restaurant	169, NH 31A, Upper Tadong, Upper Tadong, Tadong, Gangtok, Sikkim 737102, India	080169 01312	2018-05-15 09:34:04.746746	2019-06-13 05:28:44.192938	\N	27.3165344999999995	88.5960922000000011	\N	3.70000000000000018	Gangtok
1150	Desi Bitez	Hotel Tushita, Gangtok, Nam Nang Road, Vishal Gaon, Gangtok, Sikkim 737101, India	096418 09577	2018-05-15 09:34:06.974618	2019-06-13 05:28:44.201261	\N	27.3224209999999985	88.6108097000000043	http://www.facebook.com/desibitezrestaurant	4.09999999999999964	Gangtok
1151	Restaurant	M.P.Golai, Tadong, Gangtok, Sikkim 737102, India	\N	2018-05-15 09:34:08.955238	2019-06-13 05:28:44.209621	\N	27.307603799999999	88.5974245999999965	\N	3	Gangtok
1152	Indulge Karaoke Restaurant	Arithang, Gangtok, Sikkim 737101, India	03592 204 534	2018-05-15 09:34:09.506817	2019-06-13 05:28:44.217931	\N	27.3287748999999991	88.6131799999999998	\N	4.20000000000000018	Gangtok
1153	Y.O.L.O Lounge & Bar	National Highway 31A, Deorali Bazar, Gangtok, Sikkim 737102, India	097494 01555	2018-05-15 09:34:10.05051	2019-06-13 05:28:44.226246	\N	27.3179067000000018	88.6049857999999944	\N	4	Gangtok
1154	Doma Restaurant and Bar. Upper Sichey	Upper Sichey Rd, Sungava, Gangtok, Sikkim 737101, India	098328 61620	2018-05-15 09:34:12.019529	2019-06-13 05:28:44.234555	\N	27.3374029000000007	88.6106106999999952	\N	4.40000000000000036	Gangtok
1155	Infinity Futsal Arena	H#169, NH 31A Upper Tadong, Tadong Gangtok, Sikkim, Tadong, Deorali Bazar, Gangtok, Sikkim 737102, India	095937 30227	2018-05-15 09:34:12.867213	2019-06-13 05:28:44.242887	\N	27.3195896000000005	88.6039813000000009	\N	4	Gangtok
1156	Surkhang Karaoke Bar & Restaurant.	Tashi view point,Gangtok, Gangtok, Sikkim 737101, India	095475 58545	2018-05-15 09:34:15.690277	2019-06-13 05:28:44.251231	\N	27.3690350000000002	88.6112027000000069	\N	2.5	Gangtok
1157	Rhythm And wine cafe	Mg Marg Market, Mahatma Gandhi Marg, Arithang, Gangtok, Sikkim 737101, India	096471 80911	2018-05-15 09:34:18.061027	2019-06-13 05:28:44.25961	\N	27.3298942999999994	88.612668400000004	\N	3.20000000000000018	Gangtok
1158	Clique The Lounge	Nam Nang Rd, Vishal Gaon, Gangtok, Sikkim 737101, India	075508 95820	2018-05-15 09:34:19.496816	2019-06-13 05:28:44.267962	\N	27.3232451999999988	88.6113845999999938	\N	3	Gangtok
1159	Osm Restro & Lounge	MG Marg, Above Food Court, Arithang, Gangtok, Sikkim 737101, India	098326 60400	2018-05-15 09:34:21.417164	2019-06-13 05:28:44.276309	\N	27.3291320000000013	88.6122670000000028	https://www.facebook.com/pg/Osm-Restro-Lounge-106807983397946/photos/?ref=page_internal	4.70000000000000018	Gangtok
1160	Shuffle Momos	Deorali Bazar, Gangtok, Sikkim 737102, India	090830 35126	2018-05-15 09:34:23.376359	2019-06-13 05:28:44.284651	\N	27.3200314000000013	88.6092598999999979	http://shuffle-momos.business.site/	4.70000000000000018	Gangtok
1161	The Golden Crest Hotel	National Highway 31A, Amdo Golai, Deorali Bazar, Amdo Golai, Deorali Bazar, Gangtok, Sikkim 737102, India	098005 33911	2018-05-15 09:34:25.941062	2019-06-13 05:28:44.292995	\N	27.3212329999999994	88.6070840000000004	http://www.thegoldencrest.com/	4.09999999999999964	Gangtok
1162	Hotlix (Food and Drinks)	MG Marg, Vishal Gaon, Gangtok, Sikkim 737101, India	03592 201 632	2018-05-15 09:34:28.019672	2019-06-13 05:28:44.301388	\N	27.326739400000001	88.6120262000000025	\N	\N	Gangtok
1163	Golden Dragon	Arithang, Gangtok, Sikkim 737101, India	\N	2018-05-15 09:34:28.904531	2019-06-13 05:28:44.309801	\N	27.3294022000000005	88.6086272000000008	\N	3.60000000000000009	Gangtok
1164	Hotel Pomra	Bhanupath, Secretariat Road, Arithang, Gangtok, Sikkim 737103, India	096355 00921	2018-05-15 09:34:31.069013	2019-06-13 05:28:44.318042	\N	27.3274262000000014	88.6143172000000021	http://hotelpomra.com/	3.79999999999999982	Gangtok
1165	Orthodox Restaurant	Mahatma Gandhi Marg, Vishal Gaon, Gangtok, Sikkim 737102, India	03592 201 141	2018-05-15 09:34:34.017609	2019-06-13 05:28:44.326335	\N	27.3254520999999997	88.6118988000000058	\N	1	Gangtok
1166	Orchid Restaurant	MAYFAIR Spa Resort, Lower Sumdur, Ranipool, NH 31A, Ranipool, Sikkim 737102, India	092328 55014	2018-05-15 09:34:37.288472	2019-06-13 05:28:44.334679	\N	27.2962489999999995	88.5889059999999944	http://www.mayfairhotels.com/mayfair-gangtok/wine-and-dine/orchid.html	4.29999999999999982	Gangtok
1167	Heena Restaurant	Deorali Bazar, East District, NH-31A, Deorali Road, Gangtok, Deorali Bazar, Gangtok, Sikkim 737101, India	078720 42331	2018-05-15 09:34:39.227474	2019-06-13 05:28:44.342979	\N	27.3193829999999984	88.608666999999997	\N	\N	Gangtok
1168	Bakers Cafe	tadong,daragoan, Upper Tadong, Tadong, Gangtok, Sikkim 737102, India	\N	2018-05-15 09:34:40.643293	2019-06-13 05:28:44.351337	\N	27.3174519999999994	88.6018248000000028	http://www.bakercafe.com/	4	Gangtok
1169	Fizz Bar & Restaurant	Chandmari, Gangtok, Sikkim 737103, India	074076 61767	2018-05-15 09:34:43.24393	2019-06-13 05:28:44.359687	\N	27.3383284999999994	88.624406300000004	\N	3	Gangtok
1170	Solpon	Singtam - Chungthang Rd, Arithang, Gangtok, Sikkim 737101, India	077978 96230	2018-05-15 09:34:44.942547	2019-06-13 05:28:44.36788	\N	27.3284273000000013	88.6116719000000046	\N	4.5	Gangtok
1171	Absolute Demazong Restaurant	Hungry Jack Complex,Above Hdfc Bank. East District, NH-31A, Gangtok, # Near Dominos, Arithang, Gangtok, Sikkim 737101, India	03592 203 488	2018-05-15 09:34:47.699089	2019-06-13 05:28:44.376595	\N	27.3290849999999992	88.6116909999999933	\N	4.20000000000000018	Gangtok
1172	TANDOORI ZAIKA	INDIRA BYE PASS, Gangtok, Sikkim, Vishal Gaon, Gangtok, Sikkim 737101, India	096479 05897	2018-05-15 09:34:50.931299	2019-06-13 05:28:44.388552	\N	27.3275089999999992	88.6081369999999993	\N	3.5	Gangtok
1173	Calcutta sweets and bakery	Deorali Bazar, Gangtok, Sikkim 737102, India	\N	2018-05-15 09:34:52.871834	2019-06-13 05:28:44.393045	\N	27.3186083999999987	88.6078238999999996	\N	4.5	Gangtok
1174	The Oriental	MG Marg, The Mall, Gangtok, Sikkim 737101, India	03592 201 180	2018-05-15 09:34:53.789849	2019-06-13 05:28:44.401386	\N	27.3284935000000004	88.6130614000000065	http://www.orientalsikkim.com/	3.89999999999999991	Gangtok
1175	Dynasty Chinese Reasturant	Vishal Gaon, Gangtok, Sikkim 737101, India	\N	2018-05-15 09:34:55.737008	2019-06-13 05:28:44.409694	\N	27.3224474000000015	88.6118995000000069	\N	4.20000000000000018	Gangtok
1176	Naya Hotel (bengali cuisine)	MG Marg, Arithang, Gangtok, Sikkim 737101, India	\N	2018-05-15 09:34:57.515138	2019-06-13 05:28:44.418037	\N	27.330980799999999	88.6136245000000002	\N	1	Gangtok
1177	Beli Pushpa Restaurant	Paljor Stadium Rd, Upper Sichey, Arithang, Gangtok, Sikkim 737101, India	\N	2018-05-15 09:34:59.465932	2019-06-13 05:28:44.426319	\N	27.3335049999999988	88.614333000000002	\N	3.70000000000000018	Gangtok
1185	Bikanervala	253 Tanjong Katong Rd, Singapore 437041	8333 4978	2018-05-15 09:35:18.145324	2018-05-15 09:35:18.145324	ChIJFw8zxhQY2jER2QJnMRERk90	1.30815560000000009	103.895358700000003	http://www.bikanervala.com/	2.5	Delhi
1187	Bikanervala	Singapore Changi Airport Terminal 3, Level 4 (Viewing Mall), Singapore 819663	6584 2590	2018-05-15 09:35:22.344679	2018-05-15 09:35:22.344679	ChIJG4HBP5M82jERqbo7uo6pc-g	1.3557570000000001	103.985468999999995	http://www.bikanervala.com/	3.20000000000000018	Delhi
1190	Food Villa	Nagamapal Road, Nagamapal Lamabam Leikai, Majorkhul, Thangal Bazar, Kangjabi Leirak, Thangmeiband Hijam Leikai, Imphal West, Manipur 795001, India	095764 35787	2018-05-15 09:35:41.290913	2018-05-15 09:35:41.290913	ChIJWVjN1LEnSTcR0ubonzSAWSk	24.8124952999999984	93.9348186999999939	\N	3.89999999999999991	Imphal
1179	Delhi 6 Singapore	30 East Coast Road, Katong V Mall #01-12/13, Singapore 428751	6342 0049	2018-05-15 09:35:04.221416	2019-06-13 05:28:44.443027	\N	1.30377399999999999	103.902913999999996	http://www.delhi6.com.sg/	4.29999999999999982	Delhi
1180	Indian Express	38 Race Course Rd, Singapore 218555	6341 7429	2018-05-15 09:35:06.476775	2019-06-13 05:28:44.451385	\N	1.30803310000000006	103.850728599999997	http://www.indianexpress.com.sg/	3.5	Delhi
1181	Taj Authentic Indian Cuisine	214 South Bridge Rd, Singapore 058763	6226 6020	2018-05-15 09:35:08.724712	2019-06-13 05:28:44.459704	\N	1.28313319999999997	103.845625999999996	https://www.tajhotels.com/	4.09999999999999964	Delhi
1182	Jaggi’s Northern Indian Cuisine	37, 39 Chander Rd, Singapore 219541	6296 6141	2018-05-15 09:35:10.758743	2019-06-13 05:28:44.468029	\N	1.3082879999999999	103.851457999999994	http://www.jaggis.com.sg/	4.20000000000000018	Delhi
1183	Kailash Parbat Restaurant	3 Belilios Road, #01-03 Hilton Garden Inn, Singapore 219924	6836 5545	2018-05-15 09:35:12.886139	2019-06-13 05:28:44.476349	\N	1.30806690000000003	103.852572300000006	http://www.kailashparbat.com.sg/	4.20000000000000018	Delhi
1184	Khansama Restaurant	166 Serangoon Rd, Singapore 218050	6299 0300	2018-05-15 09:35:15.100363	2019-06-13 05:28:44.484706	\N	1.30813099999999993	103.853061999999994	http://khansama.com.sg/	4.09999999999999964	Delhi
1186	PizzaExpress	6 Scotts Rd, Unit B1 08/09, Singapore 228209	6538 0083	2018-05-15 09:35:20.09787	2019-06-13 05:28:44.495267	\N	1.30593200000000009	103.832887999999997	http://www.pizzaexpress.sg/	4	Delhi
1188	Frys Restaurant	Bir Tikendrajit Rd, Paona Bazar, Imphal, Manipur 795001, India	081189 43112	2018-05-15 09:35:37.39899	2019-06-13 05:28:44.50333	\N	24.8073170000000012	93.9354100000000045	https://www.facebook.com/frysimphal	3.5	Imphal
1189	Naoba's Restaurant	Rims Road, Next to Axis Bank ATM, Thangmeiband, Lalambung Makhong, Thangmeiband Hijam Leikai, Imphal, Lamphel, Manipur 795004, India	0385 241 4827	2018-05-15 09:35:39.419064	2019-06-13 05:28:44.5097	\N	24.8131525999999987	93.9277450999999957	\N	3.60000000000000009	Imphal
1191	Blue Chilli	Kwakeithel Thokchom Leikai, Keishamthong, Imphal, Manipur 795001, India	097744 67125	2018-05-15 09:35:43.327544	2019-06-13 05:28:44.520252	\N	24.7900577999999996	93.925983500000001	https://www.facebook.com/bluechilli.cafe	3.89999999999999991	Imphal
1192	The Palace	Palace Gate, Nityaiband Chuthek - Konun Mang Rd, Nongpok Inkhol, Imphal, Manipur 795001, India	097744 91919	2018-05-15 09:35:45.455692	2019-06-13 05:28:44.526346	\N	24.8028623999999986	93.948377899999997	\N	3.89999999999999991	Imphal
1193	Hot Pot	Wangkhei, Imphal, Manipur 795005, India	070055 72836	2018-05-15 09:35:48.32511	2019-06-13 05:28:44.534703	\N	24.7962650999999994	93.9513112000000064	\N	3.89999999999999991	Imphal
1194	Forage	2nd Floor, KokSamLai Tower (oppt. Thau Ground), DM College Road, Thangmeiband, Thangmeiband Hijam Leikai, Imphal West, Manipur 795004, India	090894 12615	2018-05-15 09:35:50.104124	2019-06-13 05:28:44.559877	\N	24.8231399999999987	93.9396509999999978	http://forage.warakki.com/	4	Imphal
1195	Zaika	Dewlahland, Adjacent to ISBT Bus Stand, Kabo Leika, Imphal, Manipur 795001, India	089742 25750	2018-05-15 09:35:52.118502	2019-06-13 05:28:44.568046	\N	24.8252379999999988	93.9469052000000033	\N	3.79999999999999982	Imphal
1196	A-to-Z Delicacies	Kwakeithel Road, Sagolband, Imphal, Manipur 795001, India	081318 32665	2018-05-15 09:35:54.075438	2019-06-13 05:28:44.576366	\N	24.7915714999999999	93.925697900000003	\N	4.09999999999999964	Imphal
1197	In-N-Out Fast Food	Lamphelpat, Imphal, Lamphelpat, Imphal, Manipur 795004, India	082569 19128	2018-05-15 09:35:55.998684	2019-06-13 05:28:44.584696	\N	24.8183119999999988	93.9256780000000049	\N	3.39999999999999991	Imphal
1198	Cafe Bake Studio	Angom Colony, Imphal, Manipur 795001, India	073084 95232	2018-05-15 09:35:58.589107	2019-06-13 05:28:44.593006	\N	24.8033743999999992	93.9534316000000018	\N	3	Imphal
1199	Fire Bowl Restaurant	Nongmeibung Rd, Angom Colony, Imphal, Manipur 795005, India	\N	2018-05-15 09:36:00.033443	2019-06-13 05:28:44.601383	\N	24.8030386999999983	93.9530567000000048	\N	3.10000000000000009	Imphal
1200	The Classic Cafe	Soibam Leikai, Imphal, Manipur 795001, India	\N	2018-05-15 09:36:00.869673	2019-06-13 05:28:44.609717	\N	24.8124420999999984	93.9575042000000025	\N	4.29999999999999982	Imphal
1201	Adventure Cafe	Khuman Lampak, Imphal, Manipur 795001, India	087319 21044	2018-05-15 09:36:02.963594	2019-06-13 05:28:44.617985	\N	24.8145586000000016	93.9487067999999965	\N	3.79999999999999982	Imphal
1202	Nikheel Cafe	North A.O.C, A.T.Line, Indo - Myanmar Road, Ragailong, Imphal, Manipur 795001, India	094360 25259	2018-05-15 09:36:05.164866	2019-06-13 05:28:44.626399	\N	24.8154992000000014	93.9443729999999988	\N	3.10000000000000009	Imphal
1203	Mellow	DM College Rd, Thangmeiband Hijam Leikai, Imphal, Manipur 795001, India	089746 02755	2018-05-15 09:36:07.191286	2019-06-13 05:28:44.634705	\N	24.8228930000000005	93.939633900000004	\N	4.09999999999999964	Imphal
1204	Spice Food	opp Cid, Babupara, Imphal, Manipur 795001, India	098624 60513	2018-05-15 09:36:09.843715	2019-06-13 05:28:44.643049	\N	24.7982739000000016	93.9412358999999952	\N	3.29999999999999982	Imphal
1205	Toshan Fast Food	Wangkhei Ningthem Pukhri Mapal, Wangkhei Keithel Ashangbi, Keithel Asangbi Leirak, Wangkhei, Imphal, Manipur 795001, India	070056 33773	2018-05-15 09:36:11.967009	2019-06-13 05:28:44.65138	\N	24.7981668000000006	93.9527595999999932	\N	3.20000000000000018	Imphal
1206	Konung Mamang Fast Food	Wangkhei, Imphal, Manipur 795005, India	\N	2018-05-15 09:36:13.585916	2019-06-13 05:28:44.659712	\N	24.7981988000000015	93.9449876999999987	\N	3.79999999999999982	Imphal
1207	Luxmi Kitchen	Wahengbam Leikai, सगोल्बंद, इम्फाल, मणिपुर 795001, India	0385 244 0885	2018-05-15 09:36:14.399988	2019-06-13 05:28:44.668048	\N	24.8065937000000005	93.9326755999999961	\N	4.40000000000000036	Imphal
1208	ABC Fast Food	Opp.Kasturi Bridge, Nagamapal Rd, Nagamapal, Uripok Khumanthem Leikai, Imphal, Manipur 795001, India	082598 39419	2018-05-15 09:36:16.367684	2019-06-13 05:28:44.676417	\N	24.8101203000000012	93.9334111999999948	\N	4.29999999999999982	Imphal
1209	Prince Restaurant	MBC LINE KHONGNANG KARAK, OPPOSITE OF CITY HOSPITAL, Dewlahland, Imphal, Manipur 795001, India	076410 41323	2018-05-15 09:36:19.194746	2019-06-13 05:28:44.684734	\N	24.8247710999999995	93.9441709999999972	http://www.facebook.com/Princerestaurantimphalmanipur	3.89999999999999991	Imphal
1210	Boris Enterprises	Babupara, Imphal, Manipur 795001, India	082589 93912	2018-05-15 09:36:21.370587	2019-06-13 05:28:44.693068	\N	24.7976606000000004	93.9412073999999961	\N	3.70000000000000018	Imphal
1211	7 Heaven Green Fast Food	Naoremthong, Imphal, Manipur 795001, India	070859 80355	2018-05-15 09:36:23.045181	2019-06-13 05:28:44.701384	\N	24.8066609000000007	93.9144972999999936	\N	4.70000000000000018	Imphal
1278	Chingtsuong Restaurant	National Highway 61, Kohima, Nagaland 797001, India	094360 01855	2018-05-15 09:38:43.544414	2019-06-13 05:28:44.709747	\N	25.6741150000000005	94.1083797999999945	\N	4.29999999999999982	Kohima
1229	Flavours Restaurant	Levi's Showroom, DM college Road, Thangmeiband, Imphal, Manipur, Kabrabam Leikai, Thangmeiband Hijam Leikai, Imphal, Manipur 795001, India	070851 65767	2018-05-15 09:36:57.995282	2018-05-15 09:36:57.995282	ChIJraEc-aQnSTcR4LXhqRuvoRw	24.8204300999999994	93.9391947999999957	\N	3.89999999999999991	Imphal
1213	Delikat Food Music	Keisampat Wahengbam Leikai Road, Sagolband, Imphal, Manipur 795001, India	096128 90596	2018-05-15 09:36:25.995653	2019-06-13 05:28:44.726438	\N	24.8029916999999998	93.933737899999997	\N	3.5	Imphal
1214	Oolala Food Club	Thawanthaba Leirak, Nongmeibang, Angom Palli Road, Angom Colony, Imphal, Manipur 795001, India	087941 80649	2018-05-15 09:36:27.782375	2019-06-13 05:28:44.734773	\N	24.8060836000000009	93.9577072999999956	\N	4.5	Imphal
1215	Westo Cafe & Restaurant	Keishampat, Kheidam Leikai, Sagolband, Keishamthong, Imphal, Manipur 795004, India	074218 41928	2018-05-15 09:36:28.610612	2019-06-13 05:28:44.743143	\N	24.7982818999999992	93.9339125000000053	\N	3.39999999999999991	Imphal
1216	Rooftop Cafe	Keishampat Aheibam Leirak ,Near ccpur Parking, Opposite cada Office, Keishamthong, Imphal, Manipur 795001, India	092063 25982	2018-05-15 09:36:30.330205	2019-06-13 05:28:44.751479	\N	24.7982577999999982	93.9339207999999957	\N	4.5	Imphal
1217	Shosa Kitchen	Opp. Chingmeirong Police Outpost, Chingmeirong, Imphal, Manipur 795010, India	096121 20985	2018-05-15 09:36:31.354085	2019-06-13 05:28:44.759782	\N	24.8316231000000016	93.945831499999997	\N	4.20000000000000018	Imphal
1218	Bubbles Cafe'	Near MBC Center Church, Chingmeirong,, Dewlahland, Imphal, Manipur 795001, India	090891 40613	2018-05-15 09:36:33.156223	2019-06-13 05:28:44.768058	\N	24.8242569000000017	93.9441518000000002	\N	3.60000000000000009	Imphal
1219	Panthoibi Fast Food	Kwakeithel Bazar, Lourembam Leikai, Lourembam Leikai, Imphal, Manipur 795004, India	084148 30353	2018-05-15 09:36:35.01751	2019-06-13 05:28:44.77645	\N	24.7896302000000013	93.9241528999999957	\N	4	Imphal
1220	Tasty Tastes Snack Bar	Opposite to Kasturi bridge, Nagamapal Rd, Nagamapal, Uripok Khumanthem Leikai, Imphal, Manipur 795001, India	084135 03627	2018-05-15 09:36:36.584899	2019-06-13 05:28:44.784746	\N	24.8101978999999986	93.9334017999999986	\N	3.10000000000000009	Imphal
1221	Asian Bowl	Yaiskul Police Lane, Sanakhwa Yaima Kollup, Imphal, Manipur 795001, India	070056 13534	2018-05-15 09:36:40.0132	2019-06-13 05:28:44.793115	\N	24.7955621000000015	93.9403238999999957	http://asian-bowl.business.site/	4	Imphal
1222	Mitfil	Chingamakha MU Road, Chingamakha, Imphal, Manipur 795008, India	084158 23125	2018-05-15 09:36:43.666158	2019-06-13 05:28:44.801442	\N	24.7768112999999985	93.9318190000000044	\N	3.79999999999999982	Imphal
1223	Talk Of The Town	Bir Tikendrajit Rd, Kangla, Imphal, Manipur 795001, India	081198 92660	2018-05-15 09:36:45.784508	2019-06-13 05:28:44.809838	\N	24.8077597999999995	93.9374610999999931	\N	3.89999999999999991	Imphal
1224	Babu Hotel	Thoidingjam Leikai, Imphal, Manipur 795010, India	096126 00429	2018-05-15 09:36:48.27401	2019-06-13 05:28:44.818114	\N	24.8274310000000007	93.9668120999999985	\N	3.79999999999999982	Imphal
1225	Kili-Chana Hotel	Imphal, Uripok Khumanthem Leikai, Imphal, Manipur 795004, India	\N	2018-05-15 09:36:49.734781	2019-06-13 05:28:44.826427	\N	24.8076656	93.9068586000000067	\N	4.20000000000000018	Imphal
1226	Mangza	Near ISBT, DM College Campus, Khongnang Ani Karak, Kabo Leika, Imphal, Manipur 795001, India	098624 89086	2018-05-15 09:36:50.892133	2019-06-13 05:28:44.834811	\N	24.8255939999999988	93.9466199999999958	\N	5	Imphal
1227	Hot Millions	Uripok Kangchup Road, Uripok Khumanthem Leikai, Imphal, Manipur 795001, India	087941 14208	2018-05-15 09:36:53.868968	2019-06-13 05:28:44.843104	\N	24.8078645999999985	93.9154319999999956	http://hotmillions.biz/	4.09999999999999964	Imphal
1228	Blue Moon	Khoyathong Road, Thangal Bazar, Majorkhul, Thangal Bazar, Imphal, Manipur 795001, India	\N	2018-05-15 09:36:55.977085	2019-06-13 05:28:44.851475	\N	24.8122076999999983	93.9355950000000064	\N	3.5	Imphal
1230	Sikkimese Momo	Maning Longjam Leikai, Keishamthong, Hodam Leirak, Maning Longjam Leikai, Keishamthong, Imphal, Manipur 795001, India	097745 06307	2018-05-15 09:37:00.132114	2019-06-13 05:28:44.861914	\N	24.7941104999999986	93.9331073999999973	\N	4.20000000000000018	Imphal
1231	Romi	Uripok Khumanthem Leikai, Imphal, Manipur 795001, India	097743 25927	2018-05-15 09:37:02.058875	2019-06-13 05:28:44.868114	\N	24.8093180000000011	93.9194765000000018	\N	4.40000000000000036	Imphal
1232	Spoon, The Multicuisine Restaurant	Deulahland Stadium Road, Kabo Leika, Imphal, Manipur 795001, India	089718 79511	2018-05-15 09:37:03.160666	2019-06-13 05:28:44.87649	\N	24.8256523999999992	93.9464008000000064	\N	3.60000000000000009	Imphal
1233	Cuisine To Go	Paona Bazar, Imphal, Manipur 795004, India	090894 32095	2018-05-15 09:37:04.954913	2019-06-13 05:28:44.884806	\N	24.8056435999999998	93.934465000000003	\N	2	Imphal
1234	Sunny's	Keishampat, Airport Road, Near Top Leirak, Keishamthong, Imphal, Manipur 795001, India	097744 23315	2018-05-15 09:37:05.953009	2019-06-13 05:28:44.893142	\N	24.7962436000000004	93.9316412999999955	http://eat-at-sunnys.business.site/	4.40000000000000036	Imphal
1235	Laziz Pizza	keishapat thouda bhabok leikai, Thouda Bhavok Leikai, Keishamthong, Imphal, Manipur 795004, India	094362 12121	2018-05-15 09:37:08.320564	2019-06-13 05:28:44.901475	\N	24.7930035000000011	93.9279853999999972	http://www.lazizpizza.com/	3.89999999999999991	Imphal
1236	Hot Stuff	Lamphelpat, Thangmeiband Hijam Leikai, Imphal, Manipur 795004, India	\N	2018-05-15 09:37:10.431857	2019-06-13 05:28:44.909809	\N	24.8175278000000006	93.9275468999999958	\N	3.5	Imphal
1237	Diplomat Centre Vaiphei Christian Church	2nd St, New Lambulane, Hatta Golapati Maning Leikai, Imphal, Manipur 795001, India	\N	2018-05-15 09:37:12.375908	2019-06-13 05:28:44.918158	\N	24.8100169000000008	93.9485904999999946	\N	3.29999999999999982	Imphal
1238	Ibocha Hotel	Meena Bazar, Idgah Road, Kshetrigao, Imphal, Manipur 795005, India	\N	2018-05-15 09:37:13.479966	2019-06-13 05:28:44.926443	\N	24.8013711000000008	93.9764794999999964	\N	3.20000000000000018	Imphal
1239	Siroy Lily Cafe	Governer Road, Paona Bazar, Imphal, Manipur 795001, India	098561 52094	2018-05-15 09:37:15.189826	2019-06-13 05:28:44.934763	\N	24.8045806999999989	93.9352042000000012	\N	4.29999999999999982	Imphal
1240	Eljay's Pizza & Burger	Kwakeithel Thokchom Leikai, Imphal, Manipur 795004, India	\N	2018-05-15 09:37:16.164196	2019-06-13 05:28:44.943085	\N	24.790920400000001	93.925745500000005	\N	3.39999999999999991	Imphal
1241	Delight Cafe	Chingamakha, Imphal, Manipur 795003, India	\N	2018-05-15 09:37:18.42359	2019-06-13 05:28:44.951466	\N	24.7781960999999988	93.9334128999999933	\N	3.20000000000000018	Imphal
1242	Aries Cafe	Uripok Kangchup Road, Uripok Khumanthem Leikai, Imphal, Manipur 795004, India	087298 69022	2018-05-15 09:37:20.596424	2019-06-13 05:28:44.959883	\N	24.8074370000000002	93.9268612000000047	\N	3.89999999999999991	Imphal
1243	Paona Plaza	Paona Bazar, Imphal, Manipur 795001, India	\N	2018-05-15 09:37:23.155111	2019-06-13 05:28:44.968068	\N	24.8026324000000002	93.9349373999999955	\N	3.70000000000000018	Imphal
1244	Pollito's	DM college Rd, Kabrabam Leikai, Thangmeiband, Kabrabam Leikai, Thangmeiband Hijam Leikai, Imphal, Manipur 795001, India	0385 241 6230	2018-05-15 09:37:25.644133	2019-06-13 05:28:44.976612	\N	24.8186913000000011	93.9388548000000014	\N	3.60000000000000009	Imphal
1245	9 Hills Bistro	3rd Floor, Olympia Mall, Chingmeirong Road, Kabo Leika, Imphal, Manipur 795001, India	081189 43285	2018-05-15 09:37:27.436946	2019-06-13 05:28:44.984763	\N	24.8255003000000016	93.9468437000000023	http://www.facebook.com/9HillsBistro	3.79999999999999982	Imphal
513	Veerabhadra Resturant	G.P.T.Colony, Kakinada, Andhra Pradesh 533003, India	092466 44933	2018-05-09 05:14:22.881876	2019-06-13 05:28:38.999614	\N	16.9761895000000003	82.2286186999999984	\N	3.39999999999999991	kakinada
514	Kshatriya Foods	Door No 67-11-7/C, 5th Cross Road, Opposite JNTU 2nd Gate, Nagamalli Thota, Kakinada, Andhra Pradesh 533003, India	088831 11999	2018-05-09 05:14:23.873266	2019-06-13 05:28:39.00793	\N	16.9833950999999992	82.239710500000001	\N	3.89999999999999991	kakinada
515	Sri Venkata Sai Family Restaurant	Veg Market Street, Vidya Nagar, Ramanayapeta, Near Cancer Hospital, Vidya Nagar, Ramanayapeta, Kakinada, Andhra Pradesh 533005, India	0884 236 8667	2018-05-09 05:14:25.881455	2019-06-13 05:28:39.016245	\N	16.9846235000000014	82.2420108000000027	\N	3.20000000000000018	kakinada
516	Bommarillu Foods	50 Building Center, RTC Complex, Bhaskar Nagar, Srinagar, Kakinada, Andhra Pradesh 533003, India	091332 74067	2018-05-09 05:14:28.409305	2019-06-13 05:28:39.024599	\N	16.9701704999999983	82.2398517000000027	\N	3.5	kakinada
517	New Galaxy	NH 214, Kondayya Palem, Kakinada, Andhra Pradesh 533003, India	\N	2018-05-09 05:14:30.393885	2019-06-13 05:28:39.032943	\N	16.9711193000000016	82.2359218999999939	\N	2.29999999999999982	kakinada
1251	ABC Restaurant	Upper Chimi, F - Sector, Cona, Itanagar, Arunachal Pradesh 791111	098562 27731	2018-05-15 09:37:43.517219	2018-05-15 09:37:43.517219	ChIJUcMI3LEHRDcRFeKc_uQbuc8	27.0879815999999991	93.6112860000000069	\N	3.5	Itanagar
1274	ABC Restaurant	National Highway 52A, Cona, Naharlagun, Arunachal Pradesh 791110	\N	2018-05-15 09:38:29.303525	2018-05-15 09:38:29.303525	ChIJxbl8fY4ARDcR9TW6SLlfd38	27.1080839000000005	93.6952739999999977	\N	3.5	Itanagar
1247	Ngamok	Chingmeirong Rd, Chingmeirong, Imphal, Manipur 795010, India	082599 29274	2018-05-15 09:37:31.818871	2019-06-13 05:28:45.001553	\N	24.8283646000000005	93.9444452999999982	\N	3.89999999999999991	Imphal
1248	Chillies Restaurant	Upper Chimi, Cona, Itanagar, Arunachal Pradesh 791113	\N	2018-05-15 09:37:38.995183	2019-06-13 05:28:45.009828	\N	27.0868731999999994	93.6082111000000054	\N	3.10000000000000009	Itanagar
1249	DD MM Enterprises Food Stall and Restaurant	C Sector, Papum Pare, NH-52A, Itanagar Main Road, Itanagar, C- Sector, Itanagar, Arunachal Pradesh 791111	096122 60107	2018-05-15 09:37:41.01729	2019-06-13 05:28:45.018168	\N	27.1000750000000004	93.6284349999999961	\N	4.5	Itanagar
1250	Jyoti Restaurant	Bank-Tinali Rd, C- Sector, Itanagar, Arunachal Pradesh 791111	096157 25477	2018-05-15 09:37:42.491348	2019-06-13 05:28:45.026515	\N	27.0981346000000016	93.6247761999999994	\N	3.60000000000000009	Itanagar
1252	Annu Restaurant	B Sector, Papum Pare, NH-52A, Itanagar Main Road, Itanagar, Cona, Itanagar, Arunachal Pradesh 791111	089742 41178	2018-05-15 09:37:45.183049	2019-06-13 05:28:45.037155	\N	27.1026139999999991	93.63185	\N	3.70000000000000018	Itanagar
1253	Quartz King Restaurant	E Sector, Papum Pare, NH-52A, Itanagar Main Road, Itanagar, Doni colony, Cona, Itanagar, Arunachal Pradesh 791111	097749 90710	2018-05-15 09:37:46.698233	2019-06-13 05:28:45.043164	\N	27.0912420000000012	93.6162889999999948	\N	3.70000000000000018	Itanagar
1254	ABU Restaurant	ESS Sector, Papum Pare, NH-52A, Itanagar Main Road, Itanagar, Cona, Itanagar, Arunachal Pradesh 791111	0360 225 8070	2018-05-15 09:37:48.322167	2019-06-13 05:28:45.051551	\N	27.0931330000000017	93.6185509999999965	\N	\N	Itanagar
1255	Kamrupa Pizza Cafe	banktinali,, Cona, Itanagar, 791111	094366 71775	2018-05-15 09:37:49.223291	2019-06-13 05:28:45.059812	\N	27.1004283000000008	93.6291834000000023	\N	3.20000000000000018	Itanagar
1256	Royal Biryani House	Near Ramakrishna Hospital, Ganga Market, Upper Chimi, Cona, Itanagar, Arunachal Pradesh 791111	098628 95479	2018-05-15 09:37:54.218249	2019-06-13 05:28:45.06818	\N	27.0851289999999985	93.6104760000000056	\N	5	Itanagar
1257	KFC Kentucky Fried Chicken	Itanagar Rd, Cona, Shannan, 791111	\N	2018-05-15 09:37:57.67843	2019-06-13 05:28:45.076504	\N	27.1013140999999997	93.6290857999999986	http://kfc.co.in/	3.70000000000000018	Itanagar
1258	Hotel Mon Yul Family Restaurant	Gohpur Tinali, Papum Pare, NH-52A, Itanagar Road, Itanagar, Cona, Itanagar, Arunachal Pradesh 791113	094368 37316	2018-05-15 09:38:00.010507	2019-06-13 05:28:45.084878	\N	27.0763260000000017	93.593008999999995	\N	3.70000000000000018	Itanagar
1259	Gurung Hotel	Near Nokia Repair Store, Doni colony, Arunachal Pradesh 791111, Doni colony, F - Sector, Cona, Itanagar, 791111	084138 50767	2018-05-15 09:38:03.547465	2019-06-13 05:28:45.093235	\N	27.0904407999999997	93.6146789999999953	\N	3.39999999999999991	Itanagar
1260	MOMOz	NH 52A, Doni colony, F - Sector, Cona, Itanagar, Arunachal Pradesh 791111	089741 31299	2018-05-15 09:38:05.311841	2019-06-13 05:28:45.101555	\N	27.089825900000001	93.6139909999999986	\N	2.60000000000000009	Itanagar
1261	Hillton Restaurant	Vivek Vihar, Papum Pare, NH-52A, Itanagar Road, Itanagar, Cona, Itanagar, Arunachal Pradesh 791113	097749 01581	2018-05-15 09:38:07.177384	2019-06-13 05:28:45.109875	\N	27.0814969999999988	93.6031559999999985	\N	3.70000000000000018	Itanagar
1262	Roof Garden Restaurant	Akash Deep Complex, Upper Chimi, Cona, Itanagar, Arunachal Pradesh 791111	\N	2018-05-15 09:38:08.834298	2019-06-13 05:28:45.118203	\N	27.0881320000000017	93.6140419999999978	\N	3.79999999999999982	Itanagar
1263	Lucky Restaurant	E Sector, Papum Pare, NH-52A, Itanagar Main Road, Itanagar, E- Sector, Cona, Itanagar, Arunachal Pradesh 791111	\N	2018-05-15 09:38:09.472522	2019-06-13 05:28:45.126509	\N	27.0925779999999996	93.6176990000000018	\N	3	Itanagar
1264	Asian Flavours Restaurant	ILPP City Centre, 1st Floor, E-Sector, Opposite icici Bank, Upper Chimi, F - Sector, Cona, Itanagar, Arunachal Pradesh 791111	070058 30015	2018-05-15 09:38:10.419174	2019-06-13 05:28:45.134807	\N	27.0891930000000016	93.6124149999999986	\N	3.70000000000000018	Itanagar
1265	Elegant restaurant	Ken Complex, E Sector, Papum Pare, NH-52A, Itanagar Road, Naharlagun, Cona, Naharlagun, Arunachal Pradesh 791110	094027 55056	2018-05-15 09:38:12.048049	2019-06-13 05:28:45.143175	\N	27.1062939999999983	93.692307999999997	\N	1	Itanagar
1266	RS Eatery Family Restaurant	B Sector, Papum Pare, NH-52A, Itanagar Road, Naharlagun, B Sector, Cona, Naharlagun, Arunachal Pradesh 791110	087949 46832	2018-05-15 09:38:13.180991	2019-06-13 05:28:45.151595	\N	27.1000149999999991	93.691164999999998	\N	3.39999999999999991	Itanagar
1267	Korean Restaurant Caffe Moa	Type, V Colony Road, Cona, Khonsa, Arunachal Pradesh 792130	\N	2018-05-15 09:38:15.667051	2019-06-13 05:28:45.159866	\N	27.083422800000001	93.6065162999999956	\N	3.70000000000000018	Itanagar
1268	NH Restaurant	Bage Tinali, Nirjuli, Papum Pare, NH-52A, Itanagar Road, Naharlagun, Cona, Naharlagun, Arunachal Pradesh 791109	\N	2018-05-15 09:38:17.231965	2019-06-13 05:28:45.168196	\N	27.129563000000001	93.7355029999999942	\N	4.70000000000000018	Itanagar
1269	Suniya Restaurant	Pappu Hill, Papum Pare, NH-52A, Itanagar Road, Naharlagun, Cona, Naharlagun, Arunachal Pradesh 791110	089744 28861	2018-05-15 09:38:17.844086	2019-06-13 05:28:45.176551	\N	27.0974250000000012	93.6775229999999937	\N	3	Itanagar
1270	k-rich restaurants	A sector, near tempo station opp.new Malabar hotel, Cona, Naharlagun, Arunachal Pradesh 791110	089749 71575	2018-05-15 09:38:18.85733	2019-06-13 05:28:45.184884	\N	27.1076189999999997	93.6944050000000033	\N	2.89999999999999991	Itanagar
1271	E&K's Restaurant	J & K Complex, Near lagun Bridge, Cona, Naharlagun, Arunachal Pradesh 791110	087319 38078	2018-05-15 09:38:20.584283	2019-06-13 05:28:45.193231	\N	27.1022555999999994	93.6916513999999978	\N	3.79999999999999982	Itanagar
1272	Green Tree Restaurant	NH-415, D Sector, Near Hati Mata, Papum Pare District, Cona, Naharlagun, Arunachal Pradesh 791110	096124 35585	2018-05-15 09:38:24.793789	2019-06-13 05:28:45.201538	\N	27.100417199999999	93.6902501999999942	\N	3.79999999999999982	Itanagar
1273	Fruit Lyrics	Near Arunachal Pradesh State Transport Service, Arunachal Pradesh, Cona, Naharlagun, 791110	081310 84919	2018-05-15 09:38:26.657211	2019-06-13 05:28:45.209867	\N	27.1061276000000007	93.6936402000000044	\N	4.40000000000000036	Itanagar
1275	Papa Family Restaurant	Nirjuli, Papum Pare, NH-52A, Itanagar Road, Naharlagun, Cona, Naharlagun, Arunachal Pradesh 791109	080146 72439	2018-05-15 09:38:32.698735	2019-06-13 05:28:45.22049	\N	27.1289559999999987	93.7426540000000017	\N	3.60000000000000009	Itanagar
1276	JAT Restaurant	Near Jail Gate, Jail Colony, Kohima, Nagaland 797001, India	0370 224 3524	2018-05-15 09:38:40.433137	2019-06-13 05:28:45.226529	\N	25.6578999000000003	94.0952805000000012	\N	3.5	Kohima
1277	Flavour's Restaurant Pwd Fast Food Kohima Nagaland	P.W.D. Colony, Kohima, Nagaland 797001, India	082589 75445	2018-05-15 09:38:42.559377	2019-06-13 05:28:45.234936	\N	25.6619644999999998	94.1037326000000007	\N	\N	Kohima
1309	Food Station	52/1/1A, College Street, Lalbajar, College Square, Kolkata, West Bengal 700073, India	033 2219 9160	2018-05-15 09:40:01.643765	2018-05-15 09:40:01.643765	ChIJxwdGy1J2AjoR8-i_4xpEAL4	22.5741370000000003	88.3629270999999932	\N	4.09999999999999964	Kolkata
1280	Fifa Cafe	NH 61, Midland Colony, Kohima, Nagaland 797001, India	087947 70546	2018-05-15 09:38:48.226256	2019-06-13 05:28:45.251617	\N	25.6688019999999995	94.1059400000000039	\N	4.29999999999999982	Kohima
1281	Rattle & Hum Lounge, Kohima	National Highway 61, Lower Bayavü Hill, Kohima, Nagaland 797121, India	0370 226 0343	2018-05-15 09:38:50.378794	2019-06-13 05:28:45.259887	\N	25.6886258000000005	94.0986675000000048	\N	3.79999999999999982	Kohima
1282	Where's the food? The Naga Diner	Kuozhii, Kohima View Point Tower, H.no. A/106, New Minister Hill., Aradurah Hill, Kohima, Nagaland 797005, India	081310 90261	2018-05-15 09:38:52.625223	2019-06-13 05:28:45.26825	\N	25.6517589000000008	94.1032969999999978	\N	4.09999999999999964	Kohima
1283	Yaotsu's Veggie-Table Restaurant	Opp Mezhur Secondary School, Near Over Bridge, Midland Colony, Midland Colony, Kohima, Nagaland 797005, India	070053 22100	2018-05-15 09:38:54.527187	2019-06-13 05:28:45.276652	\N	25.6664303999999994	94.1022751	\N	4.29999999999999982	Kohima
1284	The Hut Restaurant	Kohima, Nagaland 797001, India	\N	2018-05-15 09:38:56.429797	2019-06-13 05:28:45.284957	\N	25.6708599	94.1070842999999968	\N	3.89999999999999991	Kohima
1285	U.S.Pizza	Old Minister's Hill, Nr BSNL Telephone Exchange, Minister Hill, Kohima, Nagaland 797001, India	0370 224 1000	2018-05-15 09:38:58.204455	2019-06-13 05:28:45.293296	\N	25.6565446000000001	94.0955813000000063	http://www.uspizza.in/	3.79999999999999982	Kohima
1286	Spanish Family Restaurant	Pezielietsie Tinpati Junction, Kohima, Nagaland 797001, India	090777 50444	2018-05-15 09:39:00.052568	2019-06-13 05:28:45.301618	\N	25.6817902999999994	94.1076417999999961	\N	3.20000000000000018	Kohima
1287	The inroad Cafe	Naga Bazaar, Kohima, Nagaland 797001, India	096126 06112	2018-05-15 09:39:01.830187	2019-06-13 05:28:45.310117	\N	25.6734679999999997	94.1078342999999933	\N	4.70000000000000018	Kohima
1288	De' White Chilli	4th Floor, N.H. 39 Opposite PHQ Besides Mato Complex,, P.R. Hill, Kohima, Nagaland 797001, India	0370 224 2097	2018-05-15 09:39:04.057703	2019-06-13 05:28:45.318342	\N	25.6587730000000001	94.0987980000000022	https://www.facebook.com/dewhitechilli	3.39999999999999991	Kohima
1289	Tashi Delek	Kohima, Nagaland 797001, India	\N	2018-05-15 09:39:05.616932	2019-06-13 05:28:45.326635	\N	25.6700584999999997	94.1065585999999996	\N	3.70000000000000018	Kohima
1290	Ura restaurant	Near Red cross society building Raj Bhavan road, Kohima, Nagaland 797005, India	\N	2018-05-15 09:39:08.030367	2019-06-13 05:28:45.334982	\N	25.6613736999999986	94.1001705000000044	\N	\N	Kohima
1291	New ABC Restaurant	National Highway 61, Naga Bazaar, Kohima, Nagaland 797001, India	\N	2018-05-15 09:39:08.997124	2019-06-13 05:28:45.343265	\N	25.673283399999999	94.1077762999999976	\N	3.60000000000000009	Kohima
1292	FoodCraft	P.R. Hill, Kohima, Nagaland 797001, India	\N	2018-05-15 09:39:10.14417	2019-06-13 05:28:45.35162	\N	25.6602721000000003	94.0994132000000008	\N	4	Kohima
1293	Grapevine	National Highway 61, Kohima, Nagaland 797001, India	\N	2018-05-15 09:39:13.162128	2019-06-13 05:28:45.35996	\N	25.6733836999999987	94.1078554000000054	\N	3.5	Kohima
1294	Relish Takeaway	Kohima, Nagaland 797004, India	\N	2018-05-15 09:39:16.836554	2019-06-13 05:28:45.368298	\N	25.694348999999999	94.103518600000001	\N	1.80000000000000004	Kohima
1295	Popular Bakery	NH 39, P.R. Hill, Kohima, Nagaland 797005, India	\N	2018-05-15 09:39:19.24592	2019-06-13 05:28:45.376666	\N	25.6599076000000004	94.0990055000000041	\N	3.39999999999999991	Kohima
1296	Café Planet Earth	Razhu Point Near Jasokie Place, Ward 5, Kohima, Nagaland 797001, India	096159 82627	2018-05-15 09:39:22.11754	2019-06-13 05:28:45.388856	\N	25.6744969999999988	94.1087250000000068	\N	4	Kohima
1297	Big Bite	Kohima, Nagaland 797005, India	098628 22211	2018-05-15 09:39:24.507765	2019-06-13 05:28:45.393197	\N	25.656817199999999	94.0959638000000069	\N	4	Kohima
1298	Bambusa	Kohima, Nagaland 797121, India	\N	2018-05-15 09:39:26.90512	2019-06-13 05:28:45.401648	\N	25.6892603000000008	94.0986400000000032	\N	3.29999999999999982	Kohima
1301	Vivid Restaurant And Lodging	supply colony near PHQ office, B.O.C, P.R. Hill, Kohima, Nagaland 797005, India	\N	2018-05-15 09:39:32.372661	2019-06-13 05:28:45.435776	\N	25.6583660999999985	94.0991329000000007	\N	4	Kohima
1302	Aurora restaurant&lodging	Kohima, Nagaland 797001, India	0370 229 2260	2018-05-15 09:39:34.105862	2019-06-13 05:28:45.44393	\N	25.6728041000000005	94.1078727999999956	\N	3.70000000000000018	Kohima
1303	Pollitos, Kohima	Opposite Bank Of Baroda, National Highway 61, Kohima, Nagaland 797001, India	097744 06281	2018-05-15 09:39:37.155929	2019-06-13 05:28:45.452313	\N	25.6708128000000002	94.1069961000000035	\N	3.39999999999999991	Kohima
1304	8N8 Cafe	P.W.D. Kohima, Kohima, Nagaland 797001, India	073081 34132	2018-05-15 09:39:39.192795	2019-06-13 05:28:45.46068	\N	25.6606389999999998	94.1027600000000035	http://www.facebook.com/8N8Cafe	3.5	Kohima
1305	The Penthouse Bed & Breakfast	Jail Colony, Kohima, Nagaland 797005, India	\N	2018-05-15 09:39:41.084813	2019-06-13 05:28:45.468981	\N	25.6571442000000012	94.0959270000000032	\N	3.5	Kohima
1306	Keditsu Building	P.R. Hill, Kohima, Nagaland 797005, India	097740 91782	2018-05-15 09:39:45.177321	2019-06-13 05:28:45.47733	\N	25.6584824000000005	94.0986790000000042	\N	4.20000000000000018	Kohima
1307	Abcos Food Plaza	IB 172, Sector 3, Salt lake, behind Columbia Asia Hospital, IB Block, Sector III, Salt Lake City, Kolkata, West Bengal 700106, India	033 2335 8359	2018-05-15 09:39:56.357066	2019-06-13 05:28:45.485687	\N	22.5723459999999996	88.4133728000000048	https://www.facebook.com/AbcosKolkata	4.09999999999999964	Kolkata
1308	Haldiram Food City	24, Ashutosh Chowdary Ave, Ballygunge Park, Ballygunge, Kolkata, West Bengal 700019, India	\N	2018-05-15 09:39:58.972904	2019-06-13 05:28:45.49397	\N	22.532961199999999	88.3648354999999981	http://www.haldirams.com/	4.20000000000000018	Kolkata
1310	Baan Thai Restaurant	15 ,The Oberoi Grand, Ground Floor ,Jawaharlal Nehru Road, New Market Area, Dharmatala, Taltala, Kolkata, West Bengal 700013, India	033 2249 2323	2018-05-15 09:40:04.133855	2019-06-13 05:28:45.504856	\N	22.5618401999999989	88.3516530999999929	https://www.oberoihotels.com/hotels-in-kolkata/restaurants/baan-thai?utm_source=GMBlisting&utm_medium=organic	4.5	Kolkata
1311	Oh! Calcutta	10/3, 4th Floor, Forum Mall, Elgin Rd, Bhawanipur, Sreepally, Bhowanipore, Kolkata, West Bengal 700020, India	093306 27510	2018-05-15 09:40:07.464993	2019-06-13 05:28:45.510615	\N	22.5380544	88.3512707999999947	\N	4.09999999999999964	Kolkata
1312	The Waterside Cafe	Salt Lake City, 1, JA Block, Sector III, JA Block, Sector III, Salt Lake City, Kolkata, West Bengal 700098, India	033 2517 1425	2018-05-15 09:40:09.6499	2019-06-13 05:28:45.519066	\N	22.570805	88.4054569999999984	http://www.hyattrestaurants.com/india/kolkata/restaurants-in-kolkata/continental-in-salt-lake-city-center-waterside-cafe/	4.20000000000000018	Kolkata
1313	Suruchi Veg Restaurant	24, Tarak Dutta Road, Near Kwist Mall, Beck Bagan, Lower Range, Beck Bagan, Ballygunge, Kolkata, West Bengal 700019, India	083349 44444	2018-05-15 09:40:11.519568	2019-06-13 05:28:45.527316	\N	22.5376787999999983	88.3644055999999978	http://suruchirestaurants.com/	4.09999999999999964	Kolkata
1323	Food Villa	BBT Road, Santoshpur Govt Colony, Mollar Gate, Opp, Dutta Kata, Santoshpur Govt Colony, Rampur, Santoshpur, Kolkata, West Bengal 700142, India	070034 86278	2018-05-15 09:40:34.397375	2018-05-15 09:40:34.397375	ChIJAQAAP997AjoRkO-Llgt0VOw	22.5131115999999984	88.2693390999999963	\N	3.29999999999999982	Kolkata
1315	Aaheli	1st Floor, The Peerless Inn, 12, Jawaharlal Nehru Road, New Market Area, Dharmatala, Taltala, Kolkata, West Bengal 700013, India	099030 34456	2018-05-15 09:40:16.342169	2019-06-13 05:28:45.544001	\N	22.5626069999999999	88.3513135000000034	https://www.peerlesshotels.co.in/f-n-b/index.html	4	Kolkata
1316	Crave Food Works	No.122B, Southern Avenue Road, Golpark, Beside Keyatala PB National Bank, Hindustan Park, Keyatala, Kolkata, West Bengal 700029, India	033 4067 0049	2018-05-15 09:40:18.340078	2019-06-13 05:28:45.552372	\N	22.5142564999999983	88.3625501000000071	\N	4.40000000000000036	Kolkata
1317	Peshawri	86C, JBS Haldane Avenue, Seal Lane, Gobra, Tangra, Kolkata, West Bengal 700046, India	033 2345 4545	2018-05-15 09:40:20.939486	2019-06-13 05:28:45.560719	\N	22.5444950000000013	88.3980920000000054	http://www.itchotels.in/hotels/itcsonar/peshawri-restaurant.aspx	4.40000000000000036	Kolkata
1318	Teej	No.2, Russel Street, Park Street area, Kolkata, West Bengal 700071, India	082948 29412	2018-05-15 09:40:23.32483	2019-06-13 05:28:45.569034	\N	22.5527432999999995	88.3507914999999997	\N	4	Kolkata
1319	Food Castle	91, Vivekananda Rd, Azad Hind Bag, Machuabazar, Kolkata, West Bengal 700006, India	033 2241 2757	2018-05-15 09:40:25.554254	2019-06-13 05:28:45.577327	\N	22.5859254999999983	88.3659710999999959	\N	3.70000000000000018	Kolkata
1320	The Oberoi Grand, Kolkata	15, Jawaharlal Nehru Road, New Market Area, Dharmatala, Taltala, New Market Area, Dharmatala, Taltala, Kolkata, West Bengal 700013, India	033 2249 2323	2018-05-15 09:40:27.576915	2019-06-13 05:28:45.585706	\N	22.5612218999999996	88.3512058000000025	https://www.oberoihotels.com/hotels-in-kolkata/?utm_source=GMBlisting&utm_medium=organic	4.59999999999999964	Kolkata
1321	FOOD STREAT	2C,, 86, Topsia Rd, Gobra, Kolkata, West Bengal 700046, India	084200 64444	2018-05-15 09:40:29.616223	2019-06-13 05:28:45.594001	\N	22.5379490000000011	88.379400000000004	\N	3.60000000000000009	Kolkata
1322	FOODPLAZA	112F, Dr. S.C. Banerjee Road,Beliaghata, Kolkata, Kulia, Beleghata, Kolkata, West Bengal 700010, India	086979 85168	2018-05-15 09:40:31.959567	2019-06-13 05:28:45.602364	\N	22.5617429999999999	88.3957060000000041	https://www.facebook.com/Foodplaza-Beliaghata-164054593771557/	3.79999999999999982	Kolkata
1324	Fantastic Food Story	48, Vivekananda Rd, Simla, Machuabazar, Kolkata, West Bengal 700006, India	099030 10575	2018-05-15 09:40:37.241105	2019-06-13 05:28:45.612901	\N	22.5860419999999991	88.3635359999999963	\N	3.89999999999999991	Kolkata
1325	Food King	90/1, Ground Floor, Ripon Street, Taltala, Kolkata, West Bengal 700016, India	083350 85230	2018-05-15 09:40:39.864237	2019-06-13 05:28:45.618986	\N	22.5536500000000011	88.3593228999999951	\N	3.89999999999999991	Kolkata
1326	Blue Sky Cafe	3, Sudder Street, New Market Area, Dharmatala, Taltala, Colootola, New Market Area, Dharmatala, Taltala, Kolkata, West Bengal 700016, India	033 2252 2958	2018-05-15 09:40:42.983746	2019-06-13 05:28:45.627357	\N	22.5581087999999994	88.353088299999996	\N	4.20000000000000018	Kolkata
1327	ITC Sonar, Eden Pavilion - Restaurants In Kolkata	JBS Haldane Avenue, Opp Science City, Tangra, Kolkata, West Bengal 700046, India	033 2345 4545	2018-05-15 09:40:45.253001	2019-06-13 05:28:45.635678	\N	22.544319999999999	88.3980889999999988	https://www.itchotels.in/hotels/kolkata/itcsonar/dining/eden-pavilion.html?utm_source=google&utm_medium=organic%20Search&utm_term=itcsonar%20Restaurants&utm_campaign=listing	4.40000000000000036	Kolkata
1328	Saffron Food Cafe	Sodepur Station Road, Sodepur, No. 3 Deshbondhu Nagar, Sodepur, Kolkata, West Bengal 700110, India	098309 20642	2018-05-15 09:40:48.174373	2019-06-13 05:28:45.644025	\N	22.7008371999999987	88.3780272999999994	\N	4	Kolkata
1329	Gunjan Chinese Food	65, Surya Sen St, College Square, Kolkata, West Bengal 700009, India	098302 14468	2018-05-15 09:40:50.525707	2019-06-13 05:28:45.652371	\N	22.5733256000000004	88.3657829999999933	\N	4.09999999999999964	Kolkata
1330	Teekha	2nd Floor, Haldiram Food City,, 24, Ashutosh Chowdary Ave, Ballygunge Park, Ballygunge, Kolkata, West Bengal 700019, India	093396 92176	2018-05-15 09:40:52.403527	2019-06-13 05:28:45.660722	\N	22.5326829000000011	88.3649652000000003	\N	2.89999999999999991	Kolkata
1331	Arsalan Restaurant	28, Circus Avenue, Lower Range, Beck Bagan, Ballygunge, Kolkata, West Bengal 700017, India	033 2290 0487	2018-05-15 09:40:55.220704	2019-06-13 05:28:45.669053	\N	22.5419911999999982	88.3637726999999984	http://www.arsalanrestaurants.com/	4.29999999999999982	Kolkata
1332	Food Village	144, B.T. Road, Dunlop, Saket Nagar, Bonhooghly Government Colony, Kolkata, West Bengal 700108, India	099039 43648	2018-05-15 09:40:57.111816	2019-06-13 05:28:45.677332	\N	22.6524517000000003	88.3775351000000029	\N	3.79999999999999982	Kolkata
1333	Handi Food Court	12, Roy Bahadur Road, James Long Sarani & Roy Bahadur Road Crossing, Behala, Auddy Bagan Basti, Behala, Kolkata, West Bengal 700034, India	033 2498 9766	2018-05-15 09:40:59.181522	2019-06-13 05:28:45.685653	\N	22.5011064999999988	88.3206732999999957	\N	3.89999999999999991	Kolkata
1334	Grub Fast Food	11, Broad St, Park Circus, Ballygunge, Kolkata, West Bengal 700019, India	033 2281 3150	2018-05-15 09:41:02.428545	2019-06-13 05:28:45.694008	\N	22.530485800000001	88.3683156000000025	\N	4.20000000000000018	Kolkata
1335	Chinese Food Corner	627/2, Diamond Harbour Rd, Opposite Sarat Sadan, Arcadia, Behala, Jadu Colony, Sarada Pally, Kolkata, West Bengal 700034, India	033 2399 1662	2018-05-15 09:41:06.120412	2019-06-13 05:28:45.70235	\N	22.4942487	88.3165469999999999	\N	4.5	Kolkata
1336	Barcelos	1858, Rajdanga Main Road, Shantipally, Rajdanga, East Kolkata Township, Shantipally, Sector B, East Kolkata Twp, Kolkata, West Bengal 700107, India	096814 69511	2018-05-15 09:41:08.736242	2019-06-13 05:28:45.710727	\N	22.5155150999999982	88.3934567000000015	http://www.liveinstyle.com/nightlife/Kolkata/outlet/Barcelos-Kolkata	3.89999999999999991	Kolkata
1337	India Restaurant	34, Karl Marx Sarani, Indian Market, Khidirpur, Khidirpur, Kolkata, West Bengal 700023, India	084205 33005	2018-05-15 09:41:12.079742	2019-06-13 05:28:45.71901	\N	22.5387650999999991	88.3221518999999944	http://india-restaurant-indian-restaurant.business.site/	4.29999999999999982	Kolkata
1338	Golden Joy Restaurant	50/1, Matherswar Tala Road, Gobinda Khatick Road, East Topsia, Topsia, Topsia, Kolkata, West Bengal 700046, India	090518 70888	2018-05-15 09:41:15.48697	2019-06-13 05:28:45.727343	\N	22.5456420000000008	88.3875009000000063	http://www.goldenjoy.in/	4.20000000000000018	Kolkata
1339	Guchhi	JA-1, Sector 3, Salt Lake, JA Block, Sector III, Salt Lake City, Kolkata, West Bengal 700098, India	033 2517 1425	2018-05-15 09:41:18.184147	2019-06-13 05:28:45.73568	\N	22.5706163999999987	88.4055151999999964	http://www.hyattrestaurants.com/india/kolkata/restaurants-in-kolkata/north-indian-in-salt-lake-city-center-guchhi/?src=kolka_GooglePlus_08062016	4.29999999999999982	Kolkata
1340	Public Fast Food Centre	Chandni Chowk St, Chandni Chawk, Bowbazar, Kolkata, West Bengal 700072, India	\N	2018-05-15 09:41:21.6412	2019-06-13 05:28:45.744015	\N	22.5667967999999988	88.3562768999999975	\N	4.20000000000000018	Kolkata
1341	Suruchi Self-Help Group	89, Flliot Road, Flliot Road, Taltala, Kolkata, West Bengal 700016, India	033 2229 0011	2018-05-15 09:41:24.415295	2019-06-13 05:28:45.752364	\N	22.5508352000000016	88.3612052000000006	\N	3.89999999999999991	Kolkata
1343	FOOD ZONE	P-153/1A, CIT Rd, VII-M, CIT - M, Ultadanga, Kolkata, West Bengal 700054, India	033 2355 5575	2018-05-15 09:41:28.18661	2018-05-15 09:41:28.18661	ChIJ2zSSA3B2AjoRMpgap4Q9JaA	22.5897956999999998	88.3927405000000022	\N	3.5	Kolkata
1345	Food Station	12, Ramesh Mitar Road, Bhawanipur, Bakul Bagan, Bhowanipore, Kolkata, West Bengal 700025, India	033 2454 5669	2018-05-15 09:41:32.230518	2018-05-15 09:41:32.230518	ChIJAQAAwDh3AjoRRyTn3c0OTL0	22.5287191	88.3473328000000038	\N	4.20000000000000018	Kolkata
1346	Tamarind Restaurant	177, Sarat Bose Road, Opp. DKS, Deshapriya Park, Manoharpukur, Kalighat, Kolkata, West Bengal 700026, India	033 2463 8799	2018-05-15 09:41:34.223941	2018-05-15 09:41:34.223941	ChIJNcMdvjJ3AjoRDF_PjP294UE	22.5184438	88.3519397999999967	\N	4.29999999999999982	Kolkata
548	THE SQUARE Restaurant	Door No 15-3-22, Beach road, Krishna Nagar, Maharani Peta, Visakhapatnam, Andhra Pradesh 530001, India	077998 84043	2018-05-09 05:17:24.65304	2019-06-13 05:28:39.291353	\N	17.7107272999999985	83.3159050000000008	http://www.novotel.com/	4.29999999999999982	Visakhapatnam
575	New Tandoori Inn	Municipal Complex, Opp Diamond Park, Dwaraka Nagar, Sagar Nagar, Dwaraka Nagar, Visakhapatnam, Andhra Pradesh 530016, India	089127 84785	2018-05-09 05:18:22.427951	2019-06-13 05:28:39.499997	\N	17.7269615000000016	83.3039579999999944	\N	3.39999999999999991	Visakhapatnam
604	Lotus The Food City	D No 13-801, Seethangara Other End Of Prakasam Barrage, Tadepalli Municipality, Sitanagaram Guntur Dt, Sitanagaram, Tadepalli, Andhra Pradesh 520001, India	076708 21871	2018-05-09 05:21:02.900762	2019-06-13 05:28:39.726819	\N	16.5005872999999994	80.6025843999999978	https://www.championsyachtclub.com/	3.89999999999999991	Vijayawada
629	GHIZA FAMILY RESTAURANT	40-7-9, PVP Line, Mogalrajapuram, Beside Jabbar Car World, Jammi Chettu Street, Labbipet, Sidhartha Nagar, Labbipet, Vijayawada, Andhra Pradesh 520010, India	0866 247 3969	2018-05-09 05:21:59.604445	2019-06-13 05:28:39.916591	\N	16.5037653000000013	80.6438253000000032	http://storendoor.com/order/ghiza-restaurant/	4	Vijayawada
654	New NSM Family Restaurant	#26-3-4,Opp : Taluka Office, Gandhi Nagar, Gandhi Nagar, Vijayawada, Andhra Pradesh 520003, India	094911 58511	2018-05-09 05:22:55.861485	2019-06-13 05:28:40.124912	\N	16.5169539999999984	80.6244549999999975	http://new-nsm-family-restaurant.business.site/	3.89999999999999991	Vijayawada
688	Hotel Shankar	Netaji Subhas Road, Dhaleswar, Agartala, Tripura 799001, India	094361 20457	2018-05-14 09:47:36.748212	2019-06-13 05:28:40.374964	\N	23.8270032	91.2789798000000019	\N	3.70000000000000018	Agartala
762	Feedbag Restaurant	MG Rd, Khatla, Aizawl, Mizoram 796001, India	097740 69627	2018-05-14 09:52:15.092179	2019-06-13 05:28:40.96676	\N	23.7207785999999992	92.7169946000000067	\N	4	Aizawl
769	ITC Windsor, Raj Pavilion - Restaurants In Bengaluru	25, Windsor Square, Golf Course Road, Abshot Layout, Vasanth Nagar, Bengaluru, Karnataka 560052, India	080 2226 9898	2018-05-14 09:52:41.523921	2019-06-13 05:28:41.025264	\N	12.993824	77.5861759999999947	https://www.itchotels.in/hotels/bengaluru/itcwindsor/dining/raj-pavilion.html?utm_source=google&utm_medium=organic%20Search&utm_term=itcwindsor%20Restaurants&utm_campaign=listing	4.40000000000000036	Bengaluru
788	Szechwan Court Restaurant	37-39, The Oberoi, Mahatma Gandhi Rd, Halasuru, Yellappa Garden, Yellappa Chetty Layout, Sivanchetti Gardens, Bengaluru, Karnataka 560001, India	080 2558 5858	2018-05-14 09:53:54.127116	2019-06-13 05:28:41.183528	\N	12.9732497000000002	77.6184163000000069	https://www.oberoihotels.com/hotels-in-bengaluru/restaurants/szechwan-court?utm_source=GMBlisting&utm_medium=organic	4	Bengaluru
813	Delhi Food Point	1st block, koramangala, 1st Block Koramangala, Koramangala, Bengaluru, Karnataka 560034, India	098442 99630	2018-05-14 09:56:31.077249	2019-06-13 05:28:41.350341	\N	12.9270169999999993	77.6377925999999974	http://www.swiggy.com/	3.70000000000000018	Bengaluru
839	Vedant Indian & Chinese Fast Food Plaza	B - 24, Prem Nivas Bhavan, 80 Feet Rd, Ashoka Garden, Bhopal, Madhya Pradesh 462023, India	098931 91155	2018-05-14 09:58:00.449865	2019-06-13 05:28:41.692124	\N	23.2574013000000015	77.4296432999999951	\N	3.39999999999999991	Bhopal
1344	Gagan	5, Near Ganesh Cinema Complex Raja Katra,, Kali Krishna Tagore Street, Burrabazar, Bara Bazar, Jorasanko, Kolkata, West Bengal 700007, India	033 2864 1132	2018-05-15 09:41:30.366517	2019-06-13 05:28:45.771038	\N	22.5863338999999996	88.3579328999999944	\N	4.5	Kolkata
1347	Lords Restaurant	P-194, CIT Rd, Ultadanga, Ghose Bagan, Kolkata, West Bengal 700067, India	033 2355 8758	2018-05-15 09:41:36.183333	2019-06-13 05:28:45.781488	\N	22.5919711999999997	88.3926333	\N	3.5	Kolkata
1348	Arsalan Restaurant And Caterer	119A, Muzaffar Ahmed Street, Taltala, Taltala, Kolkata, West Bengal 700016, India	033 2227 7493	2018-05-15 09:41:38.550316	2019-06-13 05:28:45.785659	\N	22.5539525000000012	88.3542300000000012	http://www.arsalanrestaurants.com/	4.20000000000000018	Kolkata
1349	Dum Pukht	ITC Sonar Bangla Sheraton & Tower, Em Bypass, 1, Haldane Avenue, Tangra, Kolkata, West Bengal 700046, India	033 2345 4545	2018-05-15 09:41:40.886665	2019-06-13 05:28:45.794043	\N	22.5441600000000015	88.3978740000000016	http://www.itchotels.in/hotels/itcsonar/dum-pukht-restaurant.aspx	4.5	Kolkata
1350	Athina Food Valley	Neogipara, Ariadaha, Kolkata, West Bengal 700036, India	090515 86537	2018-05-15 09:41:43.145492	2019-06-13 05:28:45.802285	\N	22.6386383000000002	88.3685920000000067	\N	4.09999999999999964	Kolkata
1351	Capsicum Fast Food Center	115/A, Raja Ram Mohan Sarani, Amherst Street, Opp. St Pauls College, College Row, College Street, Kolkata, West Bengal 700009, India	033 2241 3307	2018-05-15 09:41:46.128195	2019-06-13 05:28:45.81064	\N	22.5767375000000001	88.3686720999999977	\N	4	Kolkata
1352	One Step Up	18A, Park Street, Park Street area, Kolkata, West Bengal 700071, India	033 2229 5339	2018-05-15 09:41:49.513047	2019-06-13 05:28:45.819046	\N	22.5528532999999989	88.3524319999999932	http://www.burrp.com/	4.20000000000000018	Kolkata
1353	Bohemian	32/4, Old Ballygunge Place, 1st Lane, Ballygunge Park, Ballygunge, Kolkata, West Bengal 700019, India	033 4001 9005	2018-05-15 09:41:52.364422	2019-06-13 05:28:45.827336	\N	22.5295239000000009	88.3687448999999958	\N	4.29999999999999982	Kolkata
1354	Big Boss Restaurant	54C, Matheswartala Road, Tangra, Kolkata, West Bengal 700046, India	033 2328 2405	2018-05-15 09:41:55.481129	2019-06-13 05:28:45.835714	\N	22.5466727999999996	88.3879950999999977	\N	4.09999999999999964	Kolkata
1355	Kewpie's	No. 2, Elgin Lane, Behind Netaji Bhavan, Sreepally, Bhowanipore, Kolkata, West Bengal 700020, India	033 2486 1600	2018-05-15 09:41:58.658158	2019-06-13 05:28:45.84407	\N	22.5366408000000007	88.3507472999999948	\N	3.79999999999999982	Kolkata
1356	Bar & Restaurant	31, Park St, Taltala, Kolkata, West Bengal 700016, India	\N	2018-05-15 09:42:02.095837	2019-06-13 05:28:45.852345	\N	22.5532250000000012	88.3522976	\N	3	Kolkata
1357	Hakuna Matata Restaurant	12D, Park Street, Opp Park Hotel, Park Street area, Kolkata, West Bengal 700071, India	033 6555 6066	2018-05-15 09:42:05.696815	2019-06-13 05:28:45.860691	\N	22.5534385999999998	88.3517645000000016	http://www.hakunamatata.net.in/	4	Kolkata
1358	Khandani Rajdhani	21, Park Street, Next to Park Hotel, Taltala, Taltala, Kolkata, West Bengal 700016, India	081004 30407	2018-05-15 09:42:08.324281	2019-06-13 05:28:45.869065	\N	22.5535697999999982	88.3520654999999948	http://rajdhani.co.in/	4.09999999999999964	Kolkata
488	The Costa Gril - Multicuisine Restaurant	Domino's Upstairs, Sri Rangarayanam Residency, SriNagar, Bhanugudi Junction, Bhanugudi Junction, Srinagar, Kakinada, Andhra Pradesh 533003, India	091332 02345	2018-05-09 05:13:30.982495	2019-06-13 05:28:38.795682	\N	16.9733909999999995	82.2371579999999938	http://www.thecostagril.in/	4.09999999999999964	kakinada
520	LB RESTAURANT	Indra Palem, Kakinada, Andhra Pradesh 533006, India	070368 88789	2018-05-09 05:14:36.886776	2019-06-13 05:28:39.057943	\N	16.9610860999999993	82.2184969000000052	\N	4.09999999999999964	kakinada
868	Hakeem Hotel	5A, New Market, TT Nagar, New Market, STT Nagar, TT Nagar, Bhopal, Madhya Pradesh 4252181, India	0755 425 2181	2018-05-14 10:03:38.248303	2019-06-13 05:28:41.925468	\N	23.2347500999999994	77.4000867999999969	\N	3.70000000000000018	Bhopal
896	Silver Streak	Plot No. A/103, NH-5, 1st Floor, Mik Nik Mall, Near NB Tower, Nayapalli, Nilakantha Nagar, Nayapalli, Bhubaneswar, Odisha 751012, India	093371 84299	2018-05-14 10:07:12.863345	2019-06-13 05:28:42.14225	\N	20.2864310000000003	85.811397999999997	\N	4.29999999999999982	Bhubaneswar
925	FOOD CITY	67, BMC Keshari Mall, 3rd Floor, Unit-2, Market Building, Ashok Nagar, Unit-2, Ashok Nagar, Bhubaneswar, Odisha 751009, India	098612 06273	2018-05-14 10:11:54.619163	2019-06-13 05:28:42.377744	\N	20.265752599999999	85.8327500999999984	http://www.foodcitybhubaneswar.com/	3	Bhubaneswar
953	Cafe Grey - Best Continental Food In Chandigarh	Coal Depot Complex, Opp. Hotel Mountview, Behind Market, Sector 10 D, 10D, Sector 10, Chandigarh, 160009, India	098760 27868	2018-05-14 10:14:53.127566	2019-06-13 05:28:42.600748	\N	30.7546870000000006	76.7871420000000029	http://facebook.com/grilleindia	4.29999999999999982	Chandigarh
980	New Vivek Restaurant	Near Anurag Chowk, Kanwali Road, Sethi Market, Vasant Vihar Phase 1, Mohit Nagar, Dehradun, Uttarakhand 248001, India	0135 276 3651	2018-05-15 09:28:02.066523	2019-06-13 05:28:42.834087	\N	30.3252650000000017	78.0043509999999998	\N	3.39999999999999991	Dehradun
981	Barbeque Nation - Dehradun - Rajpur Road	Chaudhary Plaza, Rajpur Road, Dehradun,, Uttarakhand 248001, Hathibarkala Salwala, Dehradun, Uttarakhand 248001, India	076699 56060	2018-05-15 09:28:05.139675	2019-06-13 05:28:42.842515	\N	30.3428620000000002	78.0612179999999967	http://www.barbeque-nation.com/	4.40000000000000036	Dehradun
1013	Berco's	World trade tower, 99/445 Rajpur Road, Floor - LG, Hathibarkala Salwala, Dehradun, Uttarakhand 248001, India	072529 99927	2018-05-15 09:29:10.779646	2019-06-13 05:28:43.075849	\N	30.3398800000000008	78.0594645999999983	http://bercos.net.in/	4	Dehradun
1048	RED HOT CHILLI PEPPER	9, RG Baruah Road, Near Ganeshguri Chariali, Dispur, Ganeshguri, Ganeshguri, Guwahati, Assam 781005, India	099574 70860	2018-05-15 09:30:29.071614	2019-06-13 05:28:43.359372	\N	26.1517677999999982	91.784224199999997	http://www.redhotchillipepper.in	4.20000000000000018	Dispur
1080	Banerjee's Alfa Restaurant	Shop - 316/317, Sector - 17, Old M.L.A.Quarters, Sector 17, Gandhinagar, Gujarat 382017, India	079 2322 4240	2018-05-15 09:31:30.871688	2019-06-13 05:28:43.642754	\N	23.2280593999999994	72.6532430000000033	\N	3.89999999999999991	Gandhinagar
1108	Shree Ambica Sweets And Namkeen	Shop GHB Shree Nagar Gandhinagar, Rd Number 5, Shri Nagar Society, Sector 24, Gandhinagar, Gujarat 382024, India	098245 59466	2018-05-15 09:32:22.119328	2019-06-13 05:28:43.876119	\N	23.243406499999999	72.6482527999999945	\N	4.20000000000000018	Gandhinagar
1178	Delhi Restaurant (Broadway Hotel Branch)	195C Serangoon Rd, Singapore 218067	6297 1148	2018-05-15 09:35:02.545307	2019-06-13 05:28:44.434659	\N	1.30919279999999993	103.853144099999994	http://delhi.com.sg/	3	Delhi
1212	Aroma Food Industries	Singjamei Mayengbam Leikai, Lairembi Lampak, Oinam Thingel, Lairembi Lampak, Singjamei, Imphal, Manipur 795008, India	070051 72572	2018-05-15 09:36:23.9138	2019-06-13 05:28:44.718076	\N	24.7760333999999993	93.938914699999998	https://www.facebook.com/AromaFoodIndustries/	4.5	Imphal
1246	HISTORA Cafe & Restaurant	2, Soibam Leikai Road, New Checkon Wangkhei Khunou, Konjeng Poila Leikai,, Ningthemcha Colony, Soibam Leikai, Imphal East, Manipur 795005, India	082588 45547	2018-05-15 09:37:29.640801	2019-06-13 05:28:44.993129	\N	24.8075128000000014	93.9521739000000053	http://kangla-view-kitchen.business.site/	3.79999999999999982	Imphal
1279	Orami	Near NSF Martyrs Park, AH 1 or NH 29, Kohima, Nagaland 797001, India	096155 36788	2018-05-15 09:38:45.695455	2019-06-13 05:28:45.243181	\N	25.661100900000001	94.1013193000000001	\N	3.79999999999999982	Kohima
1299	Rendezvous	Kohima-Mokokchung Rd, Kohima, Nagaland 797001, India	\N	2018-05-15 09:39:30.151585	2019-06-13 05:28:45.410041	\N	25.6706822000000017	94.1069770000000005	\N	3.5	Kohima
1300	Ron-Deepak Ratna	D'block, Upper Circular Road, P.R. Hill, Ward 5, Kohima, Nagaland 797002, India	098569 74717	2018-05-15 09:39:31.928446	2019-06-13 05:28:45.418266	\N	25.6743315999999986	94.1094405000000052	\N	\N	Kohima
1314	Zaranj	No. 26, Jawaharlal Nehru Road,Near Indian Museum, New Market Area, Fire Brigade Head Quarter, New Market Area, Dharmatala, Taltala, Kolkata, West Bengal 700016, India	033 2249 5572	2018-05-15 09:40:13.727143	2019-06-13 05:28:45.535652	\N	22.5586427	88.3507191000000063	http://www.zaranj.in/	4.20000000000000018	Kolkata
1342	Kim Ling kolkata china town	Iswar Mandal Ln, Tangra, Kolkata, West Bengal 700046, India	033 2329 8923	2018-05-15 09:41:26.252406	2019-06-13 05:28:45.760717	\N	22.5478246999999996	88.3897194000000042	\N	4.20000000000000018	Kolkata
494	Yati	National Highway 214, Rama Rao Peta, Kakinada, Andhra Pradesh 533001, India	089852 52972	2018-05-09 05:13:42.818937	2019-06-13 05:28:38.849548	\N	16.9580395000000017	82.2350196000000011	\N	3.70000000000000018	kakinada
495	Dolphin Garden Restaurant	Srinagar, Kakinada, Andhra Pradesh 533001, India	\N	2018-05-09 05:13:45.366134	2019-06-13 05:28:38.85791	\N	16.9699707000000011	82.2398064000000062	\N	3.5	kakinada
496	Unnat Foods	2-1-51, Ground Floor, Shankar Plaza, Bhanugudi Junction, Bhanugudi Junction, Srinagar, Kakinada, Andhra Pradesh 533003, India	0884 237 0899	2018-05-09 05:13:48.490782	2019-06-13 05:28:38.866182	\N	16.9719249999999988	82.2366963000000055	\N	3.60000000000000009	kakinada
499	Kalyani Restaurant	Bhanugudi Junction, Police Quarters, Bhanugudi Junction, Kondayya Palem, Kakinada, Andhra Pradesh 533003, India	093478 77444	2018-05-09 05:13:56.92221	2019-06-13 05:28:38.882882	\N	16.9700921999999998	82.2362916999999953	\N	4.09999999999999964	kakinada
500	Ulavacharu multi cuisine restaurant	Vidya Nagar, Ramanayapeta, Kakinada, Andhra Pradesh 533005, India	\N	2018-05-09 05:13:59.320476	2019-06-13 05:28:38.891215	\N	16.9849676000000009	82.2412846000000002	\N	3.29999999999999982	kakinada
501	E2 Restaurant	NFCL Rd, Vidya Nagar, Ramanayapeta, Kakinada, Andhra Pradesh 533005, India	0884 645 9555	2018-05-09 05:14:01.841199	2019-06-13 05:28:38.899899	\N	16.9844788000000015	82.2427275999999949	\N	3.5	kakinada
502	Amma Fast Food Center	1, Bhaskar Nagar Rd, Bhanugudi Junction, Perrajupeta, Kakinada, Andhra Pradesh 533003, India	\N	2018-05-09 05:14:04.214749	2019-06-13 05:28:38.907831	\N	16.9692447000000008	82.2395613000000054	\N	4.29999999999999982	kakinada
503	Amrutha Food Zone	68-6-6/4, Ashok Nagar, SBI Officers Colony, Kakinada, Andhra Pradesh 533003, India	\N	2018-05-09 05:14:06.13657	2019-06-13 05:28:38.916257	\N	16.9789975999999996	82.228277300000002	\N	4.20000000000000018	kakinada
504	Kokila Restaurant	Bhaskar Nagar Rd, Dwaraka Nagar, Kakinada, Andhra Pradesh 533003, India	089851 00796	2018-05-09 05:14:08.300431	2019-06-13 05:28:38.924537	\N	16.9694162999999989	82.2397952999999973	\N	3.79999999999999982	kakinada
505	Yati Foods	Kakinada, Police Quarters, Bhanugudi Junction, Srinagar, Kakinada, Andhra Pradesh 533003, India	0884 234 2855	2018-05-09 05:14:10.234575	2019-06-13 05:28:38.93288	\N	16.9701778999999995	82.2371425999999985	\N	3.70000000000000018	kakinada
506	Heavens City Central Restaurant	Bhaskar Nagar Rd, Dwaraka Nagar, Kakinada, Andhra Pradesh 533003, India	099080 48999	2018-05-09 05:14:12.45692	2019-06-13 05:28:38.941285	\N	16.970915699999999	82.2401346000000046	\N	3.60000000000000009	kakinada
507	Smart Foods Restaurant and Restocafe	Sarpavaram Junction, Ramanayapeta, Kakinada, Andhra Pradesh 533005, India	096523 28909	2018-05-09 05:14:14.62241	2019-06-13 05:28:38.94965	\N	16.9928781999999998	82.2423916999999989	\N	4	kakinada
508	Bmv Restaurant	J. Rama Roa Peta, Jaganathapuram, Jagannaickpur, Kakinada, Andhra Pradesh 533002, India	096421 18388	2018-05-09 05:14:16.450295	2019-06-13 05:28:38.957938	\N	16.9326763000000007	82.2357058999999992	\N	3	kakinada
509	Haveli Dakshin	Main Road, Opposite Town Hall, Rama Rao Peta, Kakinada, Andhra Pradesh 533001, India	0884 237 2999	2018-05-09 05:14:17.672181	2019-06-13 05:28:38.966223	\N	16.9563622999999986	82.2347939999999937	\N	3.79999999999999982	kakinada
510	Sri Keerthi Sowjanya Restaurant	Pithapuram Road, Anjaneya Nagar, Kakinada, Andhra Pradesh 533005, India	098487 10353	2018-05-09 05:14:19.298117	2019-06-13 05:28:38.976324	\N	17.0081540000000011	82.2476417000000026	\N	2.29999999999999982	kakinada
511	Kokila Restaurent	National Highway 214, Turangi, Kakinada, Andhra Pradesh 533002, India	\N	2018-05-09 05:14:20.259691	2019-06-13 05:28:38.982895	\N	16.9422305999999985	82.2331501999999972	\N	3.79999999999999982	kakinada
512	Varmas Biryani Centre	Bhanugudi Jct, Bhanugudi Junction, Srinagar, Kakinada, Andhra Pradesh 533003, India	098660 94332	2018-05-09 05:14:21.973257	2019-06-13 05:28:38.991259	\N	16.9697536000000007	82.238572199999993	\N	3.89999999999999991	kakinada
518	Yeti Restaurant	Ramanayapeta, Kakinada, Andhra Pradesh 533005, India	\N	2018-05-09 05:14:32.425925	2019-06-13 05:28:39.041255	\N	16.9947090000000003	82.2430810000000037	https://yetidavisrestaurant.com/	3.70000000000000018	kakinada
519	Hotel Ashoka	Ganjam Vari St, Suryanarayana Puram, Kakinada, Andhra Pradesh 533001, India	0884 237 6325	2018-05-09 05:14:34.81763	2019-06-13 05:28:39.049566	\N	16.9506672000000016	82.2343182999999982	\N	4.20000000000000018	kakinada
489	Haveli Restaurant	Anand Theatre Complex, Bhanugudi Junction, G O Colony, Kakinada, Andhra Pradesh 533003, India	099123 88000	2018-05-09 05:13:33.100507	2019-06-13 05:31:20.689017	ChIJbZBozmwoODoRoLXg5OopUCk	16.9689197000000007	82.2370061999999962	http://www.havelikakinada.com/	3.79999999999999982	kakinada
490	Koustubha Veg Restaurant	D.No:13-1-16, Near Venkata narasimha Enterprises, Main Road, National Highway 214, Surya Rao Peta, Kakinada, Andhra Pradesh 533001, India	0884 234 0066	2018-05-09 05:13:35.16795	2019-06-13 05:31:21.50493	ChIJX6KjXAsoODoRL4ITQ_mFmjg	16.9585423999999989	82.2354143000000022	\N	4	kakinada
523	Sri Mahalakshmi Garden Restaurant	Achampeta Junction, Thimmapuram, Kakinada, Andhra Pradesh 533005, India	094923 06111	2018-05-09 05:14:41.889829	2019-06-13 05:28:39.082855	\N	17.0238242	82.2491430999999977	\N	3.70000000000000018	kakinada
524	Sri GOPIKRISHNA RESTAURANT	Bhanugudi Junction, Perrajupeta, Kakinada, Andhra Pradesh 533003, India	\N	2018-05-09 05:14:44.133023	2019-06-13 05:28:39.091241	\N	16.9660869000000005	82.2386608000000052	\N	3.5	kakinada
525	Raj Cosma Restaurant	16-24-25, Water Tank Road, Dairy Farm Center, Opp Deaf And Dumb School, Ayodhya Nagar, Kakinada, Andhra Pradesh 533003, India	099895 14400	2018-05-09 05:14:46.109809	2019-06-13 05:28:39.100381	\N	16.9562750000000015	82.2468465000000037	\N	4.09999999999999964	kakinada
526	Sb Residency	Sambhamurthy Nagar 5th Street, Shanti Nagar, Kakinada, Andhra Pradesh 533003, India	\N	2018-05-09 05:14:48.575393	2019-06-13 05:28:39.107935	\N	16.9567969000000005	82.2449498999999946	\N	3.39999999999999991	kakinada
527	Hotel Bhimas	NH 214, Suryanarayana Puram, Kakinada, Andhra Pradesh 533001, India	093479 77444	2018-05-09 05:14:51.724296	2019-06-13 05:28:39.116281	\N	16.9498192000000003	82.2340638000000013	\N	3.79999999999999982	kakinada
528	RL Grand	20-6A-6, SBI North Street, Opp. Kalyan Jewellers, Near Sree Complex, Surya Rao Peta, Kakinada, Andhra Pradesh 533001, India	0884 234 3999	2018-05-09 05:14:54.42446	2019-06-13 05:28:39.124614	\N	16.9543956999999992	82.2360649999999964	http://hotelrlgrand.com/	3.60000000000000009	kakinada
529	Vijaya Sri Hotel & Restaurant	Nageswara Rao St, Rama Rao Peta, Kakinada, Andhra Pradesh 533004, India	085558 68872	2018-05-09 05:14:57.784093	2019-06-13 05:28:39.132954	\N	16.9610573000000002	82.228138400000006	\N	3.70000000000000018	kakinada
530	Yati Family Restaurant	Ganjam Vari St, Cheediga, Kakinada, Andhra Pradesh 533001, India	\N	2018-05-09 05:14:59.547548	2019-06-13 05:28:39.141309	\N	16.9506781000000011	82.2335716000000048	\N	3.70000000000000018	kakinada
532	AFC (American Fried Chicken)	Bhanugudi Junction, Srinagar, Kakinada, Andhra Pradesh 533003, India	0884 233 3555	2018-05-09 05:15:03.529884	2019-06-13 05:28:39.151557	\N	16.9733929000000003	82.2369924000000054	http://www.smartcityfood.in/afc/meals/afc-chicken-value-meal.html	3.10000000000000009	kakinada
533	Nizam's Kitchen	D.No. 2-27-12, Gokul Street, Bhanugudi Junction, Srinagar, Bhanugudi Junction, Srinagar, Kakinada, Andhra Pradesh 533003, India	096667 37208	2018-05-09 05:15:05.701309	2019-06-13 05:28:39.157956	\N	16.9706296999999999	82.2375356000000011	http://nizamkitchen.com/?page_id=430	3.79999999999999982	kakinada
534	BHIMAS HOTEL KAKINADA	1, Bhaskar Nagar Rd, Bhanugudi Junction, Perrajupeta, Kakinada, Andhra Pradesh 533003, India	\N	2018-05-09 05:15:07.589574	2019-06-13 05:28:39.166274	\N	16.969824899999999	82.2398560999999972	\N	3.79999999999999982	kakinada
535	Amaravathi Hotel	Surya Rao Peta, Kakinada, Andhra Pradesh 533001, India	090141 40276	2018-05-09 05:15:09.933744	2019-06-13 05:28:39.174588	\N	16.9570007999999994	82.2351651999999973	\N	4.20000000000000018	kakinada
536	Srinivasa Varma's Fastfood	Dr.No:2-31-4, A.N Complex, Sri Nagar, Near Padma Priya Theatre, Brindavan Road, Bhanugudi Junction, Bhanugudi Junction, G O Colony, Kakinada, Andhra Pradesh 533003, India	0884 234 7079	2018-05-09 05:15:12.307883	2019-06-13 05:28:39.182925	\N	16.9694341999999985	82.2390898999999962	\N	4.09999999999999964	kakinada
537	Siddhartha Hotel	National Highway 214, Kakinada, Andhra Pradesh 533003, India	\N	2018-05-09 05:15:14.5043	2019-06-13 05:28:39.191264	\N	16.9838982999999999	82.2407776000000013	\N	3.70000000000000018	kakinada
538	3.A.P.S.P Canteen	3 APSP, Rayudupalem, Kakinada, Andhra Pradesh 533005, India	0884 230 6378	2018-05-09 05:15:16.961777	2019-06-13 05:28:39.199892	\N	17.0073948000000001	82.2514495000000068	\N	3.89999999999999991	kakinada
539	Sri Venkata Lavanya Family Restaurant	Sambhamurthy Nagar 5th Street, Shanti Nagar, Kakinada, Andhra Pradesh 533001, India	098482 94744	2018-05-09 05:15:19.257591	2019-06-13 05:28:39.207852	\N	16.9562010000000001	82.2449629000000044	\N	4	kakinada
540	Nawab Biryani House	Near Super Bazar, Nagamalli Thota Junction, Vidya Nagar, Ramanayapeta, Kakinada, Andhra Pradesh 533005, India	098854 14347	2018-05-09 05:15:21.638753	2019-06-13 05:28:39.216272	\N	16.9862676999999991	82.2405435999999952	\N	3.70000000000000018	kakinada
541	Vinayaka Cafe	Vidya Nagar, Ramanayapeta, Vidya Nagar, Ramanayapeta, Kakinada, Andhra Pradesh 533005, India	0884 238 8377	2018-05-09 05:15:24.193579	2019-06-13 05:28:39.224621	\N	16.9846567999999998	82.2437311000000051	http://vinayaka-cafe.business.site/	3.79999999999999982	kakinada
542	Udupi Venus Lodge	D.No:13-6-1,Vallabhai Street, Cinema Road, opposite Kalpana Theatre,Kakinada, Surya Rao Peta, Kakinada, Andhra Pradesh 533001, India	0884 669 0556	2018-05-09 05:15:26.365957	2019-06-13 05:28:39.232965	\N	16.9556418999999998	82.2363222000000036	\N	3.60000000000000009	kakinada
543	South India International Courier Services Kakinada	Kakinada - Draksharama Rd, Bapuji Nagar, Turangi, Kakinada, Andhra Pradesh 533016, India	080992 61113	2018-05-09 05:15:27.963654	2019-06-13 05:28:39.241331	\N	16.9346685000000008	82.2270663000000042	http://southindiainternat.wixsite.com/courier	3.70000000000000018	kakinada
\.


--
-- Data for Name: rpush_apps; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.rpush_apps (id, name, environment, certificate, password, connections, created_at, updated_at, type, auth_key, client_id, client_secret, access_token, access_token_expiration) FROM stdin;
\.


--
-- Data for Name: rpush_feedback; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.rpush_feedback (id, device_token, failed_at, created_at, updated_at, app_id) FROM stdin;
\.


--
-- Data for Name: rpush_notifications; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.rpush_notifications (id, badge, device_token, sound, alert, data, expiry, delivered, delivered_at, failed, failed_at, error_code, error_description, deliver_after, created_at, updated_at, alert_is_json, type, collapse_key, delay_while_idle, registration_ids, app_id, retries, uri, fail_after, processing, priority, url_args, category, content_available, notification, mutable_content, external_device_id) FROM stdin;
1	\N	\N	\N	\N	{"message":"Hai Aparna!"}	86400	f	\N	f	\N	\N	\N	\N	2018-05-10 08:54:35.923894	2018-05-10 08:54:35.923894	f	Rpush::Client::ActiveRecord::Gcm::Notification	\N	f	---\n- 6b2f4503bd30cad4\n	1	0	\N	\N	f	10	\N	\N	t	{"body":"great match!","title":"Portugal vs. Denmark","icon":"myicon","message":"Hai Aparna!"}	f	\N
2	\N	\N	\N	\N	{"message":"Hai !"}	86400	f	\N	f	\N	\N	\N	\N	2018-05-11 05:06:09.840914	2018-05-11 05:06:09.840914	f	Rpush::Client::ActiveRecord::Gcm::Notification	\N	f	---\n- 6b2f4503bd30cad4\n	1	0	\N	\N	f	10	\N	\N	t	{"body":"great match!","title":"Portugal vs. Denmark","icon":"myicon","message":"Hai !"}	f	\N
3	\N	\N	\N	\N	{"message":"Hai Chaitnaya!"}	86400	f	\N	f	\N	\N	\N	\N	2018-05-11 05:40:38.589911	2018-05-11 05:40:38.589911	f	Rpush::Client::ActiveRecord::Gcm::Notification	\N	f	---\n- cO0J4-SlKNU:APA91bGiz9NCYb1WTSKFjXWs5U6j88u4Vw7xftSgnd4nGklE-280iuc66eW1VYkDgNlsKK8P3U5QtxJpz6PXI6VkajW9AlfiBWNNbgqavWmdLKIckOdtLOFJJHuQHnCXqQ9qujfijYjJ\n	2	0	\N	\N	f	10	\N	\N	t	{"body":"great match!","title":"Portugal vs. Denmark","icon":"myicon","message":"Hai Chaitnaya!"}	f	\N
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.schema_migrations (version) FROM stdin;
20160315174130
20160703192512
20160703212415
20160703213908
20160703220801
20160704102529
20160704104040
20160704144625
20160705000102
20160705112709
20160716201157
20160716201713
20160723231122
20160726223614
20160726223618
20160914061322
20160916083851
20160919095041
20160919095042
20160919095043
20160919095044
20160919095045
20160919095046
20160926060817
20161007133949
20161108060353
20161121101620
20170223104748
20170511025745
20170608113955
20170608114251
20170705061128
20170707035427
20170707035544
20170803033308
20170803035040
20170804044634
20170810095750
20171109091018
20171114061222
20171114063521
20171114064626
20171114124920
20171115110347
20171123095914
20171124095425
20180503062421
20180504090258
20180510062852
20180510062853
20180510062854
20180510062855
20180510062856
20180510062857
20180510062858
20180510062859
20180510062900
20180511092900
20180515035707
20180517111303
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.settings (id, share_text, created_at, updated_at, google_places_api, google_maps_api) FROM stdin;
1	Hey, look what we have here...\r\nan amazing app called Foodfie for our Foodies to click & review our favorite restaurant dishes. \r\nJust take a look & know whats there to binge in right near you!	2018-05-04 09:09:23.661783	2018-05-11 09:35:06.491609	AIzaSyAnlTnZZsYzXzAPaITVmpagDysw6K1fwB4	AIzaSyCDQE3TvjnrWGpWwngB6TryWvpFm7RiAAw
\.


--
-- Data for Name: taggings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.taggings (id, tag_id, taggable_id, taggable_type, tagger_id, tagger_type, context, created_at) FROM stdin;
379	5	202	Dish	\N	\N	tags	2018-05-09 04:04:11.590722
380	3	202	Dish	\N	\N	tags	2018-05-09 04:04:11.684173
383	5	204	Dish	\N	\N	tags	2018-05-09 04:04:11.784775
384	3	204	Dish	\N	\N	tags	2018-05-09 04:04:11.792876
385	5	205	Dish	\N	\N	tags	2018-05-09 04:04:11.821683
386	3	205	Dish	\N	\N	tags	2018-05-09 04:04:11.827506
387	5	206	Dish	\N	\N	tags	2018-05-09 04:04:11.855251
388	3	206	Dish	\N	\N	tags	2018-05-09 04:04:11.861736
389	5	207	Dish	\N	\N	tags	2018-05-09 04:04:11.88977
390	3	207	Dish	\N	\N	tags	2018-05-09 04:04:11.894425
391	5	208	Dish	\N	\N	tags	2018-05-09 04:04:11.929028
392	7	208	Dish	\N	\N	tags	2018-05-09 04:04:11.941159
393	5	209	Dish	\N	\N	tags	2018-05-09 04:04:11.966154
394	7	209	Dish	\N	\N	tags	2018-05-09 04:04:11.971692
395	5	210	Dish	\N	\N	tags	2018-05-09 04:04:12.003944
396	7	210	Dish	\N	\N	tags	2018-05-09 04:04:12.010443
397	5	211	Dish	\N	\N	tags	2018-05-09 04:04:12.03399
398	7	211	Dish	\N	\N	tags	2018-05-09 04:04:12.03957
399	5	212	Dish	\N	\N	tags	2018-05-09 04:04:12.064576
400	7	212	Dish	\N	\N	tags	2018-05-09 04:04:12.071044
401	5	213	Dish	\N	\N	tags	2018-05-09 04:04:12.102661
402	7	213	Dish	\N	\N	tags	2018-05-09 04:04:12.107865
405	1	215	Dish	\N	\N	tags	2018-05-09 04:04:12.177374
406	3	215	Dish	\N	\N	tags	2018-05-09 04:04:12.183936
407	1	216	Dish	\N	\N	tags	2018-05-09 04:04:12.214733
408	7	216	Dish	\N	\N	tags	2018-05-09 04:04:12.222131
409	1	217	Dish	\N	\N	tags	2018-05-09 04:04:12.246103
410	7	217	Dish	\N	\N	tags	2018-05-09 04:04:12.252519
413	1	219	Dish	\N	\N	tags	2018-05-09 04:04:12.312476
414	7	219	Dish	\N	\N	tags	2018-05-09 04:04:12.318535
415	1	220	Dish	\N	\N	tags	2018-05-09 04:04:12.347811
416	7	220	Dish	\N	\N	tags	2018-05-09 04:04:12.35597
417	1	221	Dish	\N	\N	tags	2018-05-09 04:04:12.383604
418	7	221	Dish	\N	\N	tags	2018-05-09 04:04:12.392517
419	1	222	Dish	\N	\N	tags	2018-05-09 04:04:12.418178
420	7	222	Dish	\N	\N	tags	2018-05-09 04:04:12.425105
421	1	223	Dish	\N	\N	tags	2018-05-09 04:04:12.458884
422	7	223	Dish	\N	\N	tags	2018-05-09 04:04:12.464172
423	1	224	Dish	\N	\N	tags	2018-05-09 04:04:12.487939
424	7	224	Dish	\N	\N	tags	2018-05-09 04:04:12.493933
425	1	225	Dish	\N	\N	tags	2018-05-09 04:04:12.52761
426	7	225	Dish	\N	\N	tags	2018-05-09 04:04:12.53349
427	1	226	Dish	\N	\N	tags	2018-05-09 04:04:12.562579
428	7	226	Dish	\N	\N	tags	2018-05-09 04:04:12.568997
429	1	227	Dish	\N	\N	tags	2018-05-09 04:04:12.601146
430	7	227	Dish	\N	\N	tags	2018-05-09 04:04:12.606234
431	1	228	Dish	\N	\N	tags	2018-05-09 04:04:12.637218
432	7	228	Dish	\N	\N	tags	2018-05-09 04:04:12.642424
433	1	229	Dish	\N	\N	tags	2018-05-09 04:04:12.665956
434	7	229	Dish	\N	\N	tags	2018-05-09 04:04:12.671839
435	1	230	Dish	\N	\N	tags	2018-05-09 04:04:12.704297
436	3	230	Dish	\N	\N	tags	2018-05-09 04:04:12.711158
437	1	231	Dish	\N	\N	tags	2018-05-09 04:04:12.740723
438	3	231	Dish	\N	\N	tags	2018-05-09 04:04:12.746191
439	1	232	Dish	\N	\N	tags	2018-05-09 04:04:12.77883
440	3	232	Dish	\N	\N	tags	2018-05-09 04:04:12.786872
441	1	233	Dish	\N	\N	tags	2018-05-09 04:04:12.816048
442	3	233	Dish	\N	\N	tags	2018-05-09 04:04:12.821942
443	1	234	Dish	\N	\N	tags	2018-05-09 04:04:12.856452
444	3	234	Dish	\N	\N	tags	2018-05-09 04:04:12.864617
445	1	235	Dish	\N	\N	tags	2018-05-09 04:04:12.893909
446	3	235	Dish	\N	\N	tags	2018-05-09 04:04:12.90018
447	1	236	Dish	\N	\N	tags	2018-05-09 04:04:12.926704
448	3	236	Dish	\N	\N	tags	2018-05-09 04:04:12.933419
449	1	237	Dish	\N	\N	tags	2018-05-09 04:04:12.964708
450	3	237	Dish	\N	\N	tags	2018-05-09 04:04:12.971118
451	1	238	Dish	\N	\N	tags	2018-05-09 04:04:13.001506
452	3	238	Dish	\N	\N	tags	2018-05-09 04:04:13.007493
453	1	239	Dish	\N	\N	tags	2018-05-09 04:04:13.031885
454	3	239	Dish	\N	\N	tags	2018-05-09 04:04:13.038478
455	1	240	Dish	\N	\N	tags	2018-05-09 04:04:13.068105
456	3	240	Dish	\N	\N	tags	2018-05-09 04:04:13.073451
457	1	241	Dish	\N	\N	tags	2018-05-09 04:04:13.098359
458	7	241	Dish	\N	\N	tags	2018-05-09 04:04:13.104391
459	1	242	Dish	\N	\N	tags	2018-05-09 04:04:13.129477
460	7	242	Dish	\N	\N	tags	2018-05-09 04:04:13.136928
461	1	243	Dish	\N	\N	tags	2018-05-09 04:04:13.165407
462	7	243	Dish	\N	\N	tags	2018-05-09 04:04:13.170505
463	1	244	Dish	\N	\N	tags	2018-05-09 04:04:13.217129
464	7	244	Dish	\N	\N	tags	2018-05-09 04:04:13.22272
465	1	245	Dish	\N	\N	tags	2018-05-09 04:04:13.247371
466	7	245	Dish	\N	\N	tags	2018-05-09 04:04:13.253405
467	1	246	Dish	\N	\N	tags	2018-05-09 04:04:13.28383
468	7	246	Dish	\N	\N	tags	2018-05-09 04:04:13.288774
469	1	247	Dish	\N	\N	tags	2018-05-09 04:04:13.311921
470	7	247	Dish	\N	\N	tags	2018-05-09 04:04:13.318967
471	1	248	Dish	\N	\N	tags	2018-05-09 04:04:13.347212
472	7	248	Dish	\N	\N	tags	2018-05-09 04:04:13.354446
473	1	249	Dish	\N	\N	tags	2018-05-09 04:04:13.384571
474	7	249	Dish	\N	\N	tags	2018-05-09 04:04:13.389884
475	1	250	Dish	\N	\N	tags	2018-05-09 04:04:13.416766
476	7	250	Dish	\N	\N	tags	2018-05-09 04:04:13.421754
477	1	251	Dish	\N	\N	tags	2018-05-09 04:04:13.448154
478	7	251	Dish	\N	\N	tags	2018-05-09 04:04:13.454275
479	1	252	Dish	\N	\N	tags	2018-05-09 04:04:13.484032
480	7	252	Dish	\N	\N	tags	2018-05-09 04:04:13.490956
481	1	253	Dish	\N	\N	tags	2018-05-09 04:04:13.521556
482	7	253	Dish	\N	\N	tags	2018-05-09 04:04:13.526812
483	1	254	Dish	\N	\N	tags	2018-05-09 04:04:13.551359
484	7	254	Dish	\N	\N	tags	2018-05-09 04:04:13.557666
485	1	255	Dish	\N	\N	tags	2018-05-09 04:04:13.589984
486	7	255	Dish	\N	\N	tags	2018-05-09 04:04:13.595668
487	1	256	Dish	\N	\N	tags	2018-05-09 04:04:13.62728
488	7	256	Dish	\N	\N	tags	2018-05-09 04:04:13.633224
489	1	257	Dish	\N	\N	tags	2018-05-09 04:04:13.661979
490	7	257	Dish	\N	\N	tags	2018-05-09 04:04:13.66819
491	1	258	Dish	\N	\N	tags	2018-05-09 04:04:13.692594
492	7	258	Dish	\N	\N	tags	2018-05-09 04:04:13.699293
493	1	259	Dish	\N	\N	tags	2018-05-09 04:04:13.728041
494	7	259	Dish	\N	\N	tags	2018-05-09 04:04:13.735108
495	1	260	Dish	\N	\N	tags	2018-05-09 04:04:13.767504
496	7	260	Dish	\N	\N	tags	2018-05-09 04:04:13.773652
497	1	261	Dish	\N	\N	tags	2018-05-09 04:04:13.803795
498	7	261	Dish	\N	\N	tags	2018-05-09 04:04:13.809896
499	1	262	Dish	\N	\N	tags	2018-05-09 04:04:13.833923
500	7	262	Dish	\N	\N	tags	2018-05-09 04:04:13.842505
501	1	263	Dish	\N	\N	tags	2018-05-09 04:04:13.872479
502	7	263	Dish	\N	\N	tags	2018-05-09 04:04:13.881238
503	1	264	Dish	\N	\N	tags	2018-05-09 04:04:13.906704
504	3	264	Dish	\N	\N	tags	2018-05-09 04:04:13.913471
505	1	265	Dish	\N	\N	tags	2018-05-09 04:04:13.943429
506	3	265	Dish	\N	\N	tags	2018-05-09 04:04:13.949637
507	1	266	Dish	\N	\N	tags	2018-05-09 04:04:13.971788
508	3	266	Dish	\N	\N	tags	2018-05-09 04:04:13.979621
509	1	267	Dish	\N	\N	tags	2018-05-09 04:04:14.051397
510	3	267	Dish	\N	\N	tags	2018-05-09 04:04:14.057768
511	1	268	Dish	\N	\N	tags	2018-05-09 04:04:14.086515
512	3	268	Dish	\N	\N	tags	2018-05-09 04:04:14.093018
513	1	269	Dish	\N	\N	tags	2018-05-09 04:04:14.122848
514	3	269	Dish	\N	\N	tags	2018-05-09 04:04:14.129673
515	1	270	Dish	\N	\N	tags	2018-05-09 04:04:14.159577
516	3	270	Dish	\N	\N	tags	2018-05-09 04:04:14.165918
517	1	271	Dish	\N	\N	tags	2018-05-09 04:04:14.18866
518	3	271	Dish	\N	\N	tags	2018-05-09 04:04:14.197087
519	1	272	Dish	\N	\N	tags	2018-05-09 04:04:14.226098
520	3	272	Dish	\N	\N	tags	2018-05-09 04:04:14.234327
521	1	273	Dish	\N	\N	tags	2018-05-09 04:04:14.264838
522	3	273	Dish	\N	\N	tags	2018-05-09 04:04:14.272436
523	1	274	Dish	\N	\N	tags	2018-05-09 04:04:14.301445
524	3	274	Dish	\N	\N	tags	2018-05-09 04:04:14.308151
525	9	275	Dish	\N	\N	tags	2018-05-09 04:04:14.329254
526	3	275	Dish	\N	\N	tags	2018-05-09 04:04:14.336791
527	9	276	Dish	\N	\N	tags	2018-05-09 04:04:14.371978
528	3	276	Dish	\N	\N	tags	2018-05-09 04:04:14.383091
529	9	277	Dish	\N	\N	tags	2018-05-09 04:04:14.415469
530	3	277	Dish	\N	\N	tags	2018-05-09 04:04:14.42133
531	9	278	Dish	\N	\N	tags	2018-05-09 04:04:14.453296
532	3	278	Dish	\N	\N	tags	2018-05-09 04:04:14.459596
533	9	279	Dish	\N	\N	tags	2018-05-09 04:04:14.489582
534	3	279	Dish	\N	\N	tags	2018-05-09 04:04:14.496373
535	9	280	Dish	\N	\N	tags	2018-05-09 04:04:14.527988
536	3	280	Dish	\N	\N	tags	2018-05-09 04:04:14.534027
537	9	281	Dish	\N	\N	tags	2018-05-09 04:04:14.555311
538	3	281	Dish	\N	\N	tags	2018-05-09 04:04:14.562856
539	9	282	Dish	\N	\N	tags	2018-05-09 04:04:14.594791
540	3	282	Dish	\N	\N	tags	2018-05-09 04:04:14.601351
541	9	283	Dish	\N	\N	tags	2018-05-09 04:04:14.631471
542	3	283	Dish	\N	\N	tags	2018-05-09 04:04:14.638186
543	9	284	Dish	\N	\N	tags	2018-05-09 04:04:14.669963
544	3	284	Dish	\N	\N	tags	2018-05-09 04:04:14.675293
545	9	285	Dish	\N	\N	tags	2018-05-09 04:04:14.714281
546	3	285	Dish	\N	\N	tags	2018-05-09 04:04:14.720399
547	9	286	Dish	\N	\N	tags	2018-05-09 04:04:14.743251
548	3	286	Dish	\N	\N	tags	2018-05-09 04:04:14.749546
549	9	287	Dish	\N	\N	tags	2018-05-09 04:04:14.780815
550	3	287	Dish	\N	\N	tags	2018-05-09 04:04:14.786158
551	9	288	Dish	\N	\N	tags	2018-05-09 04:04:14.809193
552	3	288	Dish	\N	\N	tags	2018-05-09 04:04:14.815401
553	9	289	Dish	\N	\N	tags	2018-05-09 04:04:14.837654
554	3	289	Dish	\N	\N	tags	2018-05-09 04:04:14.846738
555	9	290	Dish	\N	\N	tags	2018-05-09 04:04:14.877226
556	3	290	Dish	\N	\N	tags	2018-05-09 04:04:14.8844
557	9	291	Dish	\N	\N	tags	2018-05-09 04:04:14.911712
558	3	291	Dish	\N	\N	tags	2018-05-09 04:04:14.917397
559	9	292	Dish	\N	\N	tags	2018-05-09 04:04:14.94013
560	7	292	Dish	\N	\N	tags	2018-05-09 04:04:14.94774
561	9	293	Dish	\N	\N	tags	2018-05-09 04:04:14.96864
562	7	293	Dish	\N	\N	tags	2018-05-09 04:04:14.973233
563	9	294	Dish	\N	\N	tags	2018-05-09 04:04:15.0002
564	7	294	Dish	\N	\N	tags	2018-05-09 04:04:15.005227
565	9	295	Dish	\N	\N	tags	2018-05-09 04:04:15.029233
566	7	295	Dish	\N	\N	tags	2018-05-09 04:04:15.034563
567	9	296	Dish	\N	\N	tags	2018-05-09 04:04:15.05765
568	7	296	Dish	\N	\N	tags	2018-05-09 04:04:15.064851
569	9	297	Dish	\N	\N	tags	2018-05-09 04:04:15.095853
570	7	297	Dish	\N	\N	tags	2018-05-09 04:04:15.100795
571	9	298	Dish	\N	\N	tags	2018-05-09 04:04:15.124213
572	7	298	Dish	\N	\N	tags	2018-05-09 04:04:15.130618
573	9	299	Dish	\N	\N	tags	2018-05-09 04:04:15.164347
574	7	299	Dish	\N	\N	tags	2018-05-09 04:04:15.170487
575	9	300	Dish	\N	\N	tags	2018-05-09 04:04:15.203794
576	7	300	Dish	\N	\N	tags	2018-05-09 04:04:15.210208
577	9	301	Dish	\N	\N	tags	2018-05-09 04:04:15.23778
578	7	301	Dish	\N	\N	tags	2018-05-09 04:04:15.244936
579	9	302	Dish	\N	\N	tags	2018-05-09 04:04:15.274784
580	7	302	Dish	\N	\N	tags	2018-05-09 04:04:15.280804
581	9	303	Dish	\N	\N	tags	2018-05-09 04:04:15.301513
582	7	303	Dish	\N	\N	tags	2018-05-09 04:04:15.309565
583	9	304	Dish	\N	\N	tags	2018-05-09 04:04:15.340635
584	7	304	Dish	\N	\N	tags	2018-05-09 04:04:15.347526
585	9	305	Dish	\N	\N	tags	2018-05-09 04:04:15.381886
586	7	305	Dish	\N	\N	tags	2018-05-09 04:04:15.389137
587	9	306	Dish	\N	\N	tags	2018-05-09 04:04:15.417797
588	7	306	Dish	\N	\N	tags	2018-05-09 04:04:15.423834
589	9	307	Dish	\N	\N	tags	2018-05-09 04:04:15.453406
590	7	307	Dish	\N	\N	tags	2018-05-09 04:04:15.460752
591	9	308	Dish	\N	\N	tags	2018-05-09 04:04:15.490648
592	7	308	Dish	\N	\N	tags	2018-05-09 04:04:15.496526
593	10	309	Dish	\N	\N	tags	2018-05-09 04:04:15.52015
594	3	309	Dish	\N	\N	tags	2018-05-09 04:04:15.526631
595	10	310	Dish	\N	\N	tags	2018-05-09 04:04:15.557355
596	3	310	Dish	\N	\N	tags	2018-05-09 04:04:15.564154
597	10	311	Dish	\N	\N	tags	2018-05-09 04:04:15.594975
598	3	311	Dish	\N	\N	tags	2018-05-09 04:04:15.601301
599	10	312	Dish	\N	\N	tags	2018-05-09 04:04:15.622925
600	3	312	Dish	\N	\N	tags	2018-05-09 04:04:15.631337
601	10	313	Dish	\N	\N	tags	2018-05-09 04:04:15.661257
602	3	313	Dish	\N	\N	tags	2018-05-09 04:04:15.667252
603	10	314	Dish	\N	\N	tags	2018-05-09 04:04:15.687908
604	7	314	Dish	\N	\N	tags	2018-05-09 04:04:15.695473
605	10	315	Dish	\N	\N	tags	2018-05-09 04:04:15.716101
606	7	315	Dish	\N	\N	tags	2018-05-09 04:04:15.721934
607	10	316	Dish	\N	\N	tags	2018-05-09 04:04:15.74858
608	7	316	Dish	\N	\N	tags	2018-05-09 04:04:15.753979
609	10	317	Dish	\N	\N	tags	2018-05-09 04:04:15.785169
610	7	317	Dish	\N	\N	tags	2018-05-09 04:04:15.791269
611	10	318	Dish	\N	\N	tags	2018-05-09 04:04:15.821626
612	7	318	Dish	\N	\N	tags	2018-05-09 04:04:15.828593
613	10	319	Dish	\N	\N	tags	2018-05-09 04:04:15.856864
614	7	319	Dish	\N	\N	tags	2018-05-09 04:04:15.864801
615	10	320	Dish	\N	\N	tags	2018-05-09 04:04:15.893494
616	7	320	Dish	\N	\N	tags	2018-05-09 04:04:15.898011
617	10	321	Dish	\N	\N	tags	2018-05-09 04:04:15.926634
618	7	321	Dish	\N	\N	tags	2018-05-09 04:04:15.931643
619	10	322	Dish	\N	\N	tags	2018-05-09 04:04:15.954744
620	7	322	Dish	\N	\N	tags	2018-05-09 04:04:15.961564
621	10	323	Dish	\N	\N	tags	2018-05-09 04:04:15.993719
622	7	323	Dish	\N	\N	tags	2018-05-09 04:04:15.999533
623	10	324	Dish	\N	\N	tags	2018-05-09 04:04:16.020028
624	7	324	Dish	\N	\N	tags	2018-05-09 04:04:16.027488
625	10	325	Dish	\N	\N	tags	2018-05-09 04:04:16.049597
626	7	325	Dish	\N	\N	tags	2018-05-09 04:04:16.057874
627	10	326	Dish	\N	\N	tags	2018-05-09 04:04:16.098373
628	7	326	Dish	\N	\N	tags	2018-05-09 04:04:16.103703
629	10	327	Dish	\N	\N	tags	2018-05-09 04:04:16.136523
630	7	327	Dish	\N	\N	tags	2018-05-09 04:04:16.143299
631	11	328	Dish	\N	\N	tags	2018-05-09 04:04:16.171134
632	3	328	Dish	\N	\N	tags	2018-05-09 04:04:16.177528
633	11	329	Dish	\N	\N	tags	2018-05-09 04:04:16.200694
634	7	329	Dish	\N	\N	tags	2018-05-09 04:04:16.207534
635	11	330	Dish	\N	\N	tags	2018-05-09 04:04:16.238064
636	7	330	Dish	\N	\N	tags	2018-05-09 04:04:16.244649
637	11	331	Dish	\N	\N	tags	2018-05-09 04:04:16.265607
638	7	331	Dish	\N	\N	tags	2018-05-09 04:04:16.271848
639	11	332	Dish	\N	\N	tags	2018-05-09 04:04:16.296426
640	7	332	Dish	\N	\N	tags	2018-05-09 04:04:16.300785
641	11	333	Dish	\N	\N	tags	2018-05-09 04:04:16.32532
642	3	333	Dish	\N	\N	tags	2018-05-09 04:04:16.331056
643	11	334	Dish	\N	\N	tags	2018-05-09 04:04:16.360118
644	7	334	Dish	\N	\N	tags	2018-05-09 04:04:16.367513
645	11	335	Dish	\N	\N	tags	2018-05-09 04:04:16.395832
646	7	335	Dish	\N	\N	tags	2018-05-09 04:04:16.403254
647	11	336	Dish	\N	\N	tags	2018-05-09 04:04:16.42923
648	7	336	Dish	\N	\N	tags	2018-05-09 04:04:16.434475
649	11	337	Dish	\N	\N	tags	2018-05-09 04:04:16.460113
650	3	337	Dish	\N	\N	tags	2018-05-09 04:04:16.465946
651	11	338	Dish	\N	\N	tags	2018-05-09 04:04:16.489932
652	7	338	Dish	\N	\N	tags	2018-05-09 04:04:16.496457
653	11	339	Dish	\N	\N	tags	2018-05-09 04:04:16.527812
654	3	339	Dish	\N	\N	tags	2018-05-09 04:04:16.533919
655	11	340	Dish	\N	\N	tags	2018-05-09 04:04:16.564531
656	7	340	Dish	\N	\N	tags	2018-05-09 04:04:16.570611
657	11	341	Dish	\N	\N	tags	2018-05-09 04:04:16.59397
658	7	341	Dish	\N	\N	tags	2018-05-09 04:04:16.599532
659	11	342	Dish	\N	\N	tags	2018-05-09 04:04:16.619226
660	7	342	Dish	\N	\N	tags	2018-05-09 04:04:16.627792
661	12	343	Dish	\N	\N	tags	2018-05-09 04:04:16.657328
662	3	343	Dish	\N	\N	tags	2018-05-09 04:04:16.663144
663	12	344	Dish	\N	\N	tags	2018-05-09 04:04:16.686325
664	7	344	Dish	\N	\N	tags	2018-05-09 04:04:16.692455
665	12	345	Dish	\N	\N	tags	2018-05-09 04:04:16.716047
666	7	345	Dish	\N	\N	tags	2018-05-09 04:04:16.721891
667	12	346	Dish	\N	\N	tags	2018-05-09 04:04:16.747009
668	7	346	Dish	\N	\N	tags	2018-05-09 04:04:16.751559
669	12	347	Dish	\N	\N	tags	2018-05-09 04:04:16.775381
670	3	347	Dish	\N	\N	tags	2018-05-09 04:04:16.781061
671	12	348	Dish	\N	\N	tags	2018-05-09 04:04:16.803211
672	7	348	Dish	\N	\N	tags	2018-05-09 04:04:16.809922
673	12	349	Dish	\N	\N	tags	2018-05-09 04:04:16.831559
674	3	349	Dish	\N	\N	tags	2018-05-09 04:04:16.835951
675	12	350	Dish	\N	\N	tags	2018-05-09 04:04:16.865718
676	7	350	Dish	\N	\N	tags	2018-05-09 04:04:16.876497
677	12	351	Dish	\N	\N	tags	2018-05-09 04:04:16.907273
678	3	351	Dish	\N	\N	tags	2018-05-09 04:04:16.913387
679	12	352	Dish	\N	\N	tags	2018-05-09 04:04:16.934292
680	7	352	Dish	\N	\N	tags	2018-05-09 04:04:16.94086
681	12	353	Dish	\N	\N	tags	2018-05-09 04:04:16.965838
682	7	353	Dish	\N	\N	tags	2018-05-09 04:04:16.971583
683	12	354	Dish	\N	\N	tags	2018-05-09 04:04:16.99508
684	7	354	Dish	\N	\N	tags	2018-05-09 04:04:16.99979
685	1	355	Dish	\N	\N	tags	2018-05-09 04:04:17.025579
686	3	355	Dish	\N	\N	tags	2018-05-09 04:04:17.031246
687	1	356	Dish	\N	\N	tags	2018-05-09 04:04:17.052899
688	7	356	Dish	\N	\N	tags	2018-05-09 04:04:17.060633
689	1	357	Dish	\N	\N	tags	2018-05-09 04:04:17.08978
690	7	357	Dish	\N	\N	tags	2018-05-09 04:04:17.09846
691	1	358	Dish	\N	\N	tags	2018-05-09 04:04:17.128473
692	7	358	Dish	\N	\N	tags	2018-05-09 04:04:17.137146
693	1	359	Dish	\N	\N	tags	2018-05-09 04:04:17.166165
694	7	359	Dish	\N	\N	tags	2018-05-09 04:04:17.173294
695	11	360	Dish	\N	\N	tags	2018-05-09 04:04:17.203969
696	3	360	Dish	\N	\N	tags	2018-05-09 04:04:17.210104
697	11	361	Dish	\N	\N	tags	2018-05-09 04:04:17.230308
698	7	361	Dish	\N	\N	tags	2018-05-09 04:04:17.236789
699	11	362	Dish	\N	\N	tags	2018-05-09 04:04:17.260934
700	7	362	Dish	\N	\N	tags	2018-05-09 04:04:17.265696
701	11	363	Dish	\N	\N	tags	2018-05-09 04:04:17.290749
702	7	363	Dish	\N	\N	tags	2018-05-09 04:04:17.296057
703	12	364	Dish	\N	\N	tags	2018-05-09 04:04:17.31936
704	3	364	Dish	\N	\N	tags	2018-05-09 04:04:17.326088
705	12	365	Dish	\N	\N	tags	2018-05-09 04:04:17.364084
706	7	365	Dish	\N	\N	tags	2018-05-09 04:04:17.372296
707	12	366	Dish	\N	\N	tags	2018-05-09 04:04:17.403912
708	7	366	Dish	\N	\N	tags	2018-05-09 04:04:17.424796
709	8	367	Dish	\N	\N	tags	2018-05-09 04:04:17.448444
710	8	368	Dish	\N	\N	tags	2018-05-09 04:04:17.477833
711	8	369	Dish	\N	\N	tags	2018-05-09 04:04:17.505123
712	8	370	Dish	\N	\N	tags	2018-05-09 04:04:17.534223
713	8	371	Dish	\N	\N	tags	2018-05-09 04:04:17.564715
714	8	372	Dish	\N	\N	tags	2018-05-09 04:04:17.594148
715	6	373	Dish	\N	\N	tags	2018-05-09 04:04:17.620971
716	6	374	Dish	\N	\N	tags	2018-05-09 04:04:17.649381
717	6	375	Dish	\N	\N	tags	2018-05-09 04:04:17.67307
718	6	376	Dish	\N	\N	tags	2018-05-09 04:04:17.701767
719	6	377	Dish	\N	\N	tags	2018-05-09 04:04:17.729231
720	6	378	Dish	\N	\N	tags	2018-05-09 04:04:17.759744
721	6	379	Dish	\N	\N	tags	2018-05-09 04:04:17.789229
722	6	380	Dish	\N	\N	tags	2018-05-09 04:04:17.817727
723	6	381	Dish	\N	\N	tags	2018-05-09 04:04:17.848863
724	6	382	Dish	\N	\N	tags	2018-05-09 04:04:17.880112
725	6	383	Dish	\N	\N	tags	2018-05-09 04:04:17.905399
726	6	384	Dish	\N	\N	tags	2018-05-09 04:04:17.931457
727	9	385	Dish	\N	\N	tags	2018-05-09 04:04:17.962684
728	9	386	Dish	\N	\N	tags	2018-05-09 04:04:17.993157
729	9	387	Dish	\N	\N	tags	2018-05-09 04:04:18.022095
730	9	388	Dish	\N	\N	tags	2018-05-09 04:04:18.048747
731	9	389	Dish	\N	\N	tags	2018-05-09 04:04:18.077636
732	9	390	Dish	\N	\N	tags	2018-05-09 04:04:18.098351
733	9	391	Dish	\N	\N	tags	2018-05-09 04:04:18.130804
734	9	392	Dish	\N	\N	tags	2018-05-09 04:04:18.159062
759	1	203	Dish	\N	\N	tags	2018-05-14 11:54:48.255709
760	3	203	Dish	\N	\N	tags	2018-05-14 11:54:48.435352
779	7	434	Dish	\N	\N	tags	2019-06-13 04:52:50.837071
\.


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tags (id, name, taggings_count, count) FROM stdin;
5	SOUP	11	\N
11	FRIED RICE	19	\N
12	NOODLES	15	\N
8	DRINK	6	\N
6	DESSERT	12	\N
14	VEGAN	0	\N
13	MAIN	0	\N
9	CURRY	42	\N
1	STARTER	66	\N
3	VEGETARIAN	64	\N
10	BIRYANI	19	\N
7	NON-VEGETARIAN	102	\N
\.


--
-- Data for Name: user_fellowships; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_fellowships (id, follower_id, user_id, created_at, updated_at) FROM stdin;
2	5	3	2018-05-11 05:18:40.760436	2018-05-11 05:18:40.760436
7	3	5	2018-05-16 11:49:27.878621	2018-05-16 11:49:27.878621
12	3	2	2018-05-16 12:06:50.033145	2018-05-16 12:06:50.033145
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, username, first_name, last_name, email, password_digest, activation_token, authentication_token, activated, reset_password_token, activated_at, reset_password_token_sent_at, created_at, updated_at, no_of_post, no_of_followers, no_of_following, device_id, fav_restaurant, fav_dish, post_by_follow_user, starts_following) FROM stdin;
5	aparna_facebook	Aparna 2	Sri	aparna16gude@gmail.com	$2a$10$P66hXdbI3BbFve9PxuI3T.V9/QonBlZ0MKQuGRid1BmrOJN75ahR6	cmR6vXE57TY84qzRc7Tq3g	46081bdada2207728e6e1e903774cc09	t	\N	\N	\N	2018-05-10 04:58:04.574027	2018-05-15 11:30:16.095557	\N	\N	\N	dugavdfjLtc:APA91bENxeEvLxT5E92YeykQ7_k-SYaQtXcZNPMxansw6ZSevSe8dVS69qRDU-xzLW3x46sQLAReuSeTC83cHy1GV1NiUSd0cnH8LLTgrF0fYn7ojQhXTYD7ryBA5zz4UvJhmgthC9iZ	t	t	t	t
17	nageswararao_123	Nageswararao	\N	nageswararao.nyros@gmail.com	$2a$10$44VP.zeUZGVROsZRDPdG6O3tyM8SV3dMazh7n0mw6M.wFAivh0aNu	LdUfwMd23k5HS_5VZIuqcQ	001f6dd1e776eea43769309bc513136b	f	\N	\N	\N	2019-06-14 05:26:50.100029	2019-06-14 05:26:50.110453	\N	\N	\N	\N	t	t	t	t
11	foodfie	Foodfie	team	chaitanya_nyros@yahoo.com	$2a$10$ultpDK/LMVUBu1V2JhZ/zO0cos0XfJuM.Ky8HmL8RTsTKrg/LumG2	JtD-8xK_R1iUi1R7ZTgtMg	6e4e357186000f498e3b5cd5994d13f1	t	\N	\N	\N	2018-05-17 06:25:24.034967	2019-06-13 05:31:17.769587	\N	\N	\N	eV4-efbuHvg:APA91bF1BdZMHJ-RZ5OeRqd3lNrQ76qkVFPMcXCZxVoeNJAVJjpKgqpJ4-yd3vyTvKpx44yRghYM-053-218xnjh43Ryak7w6lVHsDw8NcxzXcuCoZyqK4bJSNbyKtEu-AJXsFtG2-PL	t	t	t	t
2	appu_16	aparna	sri	aparna.nyros@gmail.com	$2a$10$P66hXdbI3BbFve9PxuI3T.V9/QonBlZ0MKQuGRid1BmrOJN75ahR6	ywuNryI5q7ChAnOtekFx7w	67052032340d28b6026ce454003dcf71	t	\N	2018-05-03 06:51:06.447502	\N	2018-05-03 06:50:10.443194	2019-06-13 05:31:17.78138	\N	\N	\N	eV4-efbuHvg:APA91bF1BdZMHJ-RZ5OeRqd3lNrQ76qkVFPMcXCZxVoeNJAVJjpKgqpJ4-yd3vyTvKpx44yRghYM-053-218xnjh43Ryak7w6lVHsDw8NcxzXcuCoZyqK4bJSNbyKtEu-AJXsFtG2-PL	t	t	t	t
3	cahitu	chaitu	prabhu	chaitanya.nyros@gmail.com	$2a$10$aNrBn5GqGoJvO8MSpNzXheW58/GwUETufYJKx1GTKpwOquTvoMeDq	AQMEGv1a7WzvCel9pUskKQ	6e4e357186000f498e3b5cd5994d13f9	t	\N	2018-05-11 03:52:14.126309	\N	2018-05-04 12:11:54.514229	2019-06-13 05:31:17.789588	\N	\N	\N	cHXM522t2eA:APA91bEWuQKUF-KQxvDkXrMI-yEdSd8TRgkaVL16mepsZRmzAN7tul90O_pfPbCjEZd3ImkhCij4LBPY7VzegaThvvuhtFWJM85_MdOe57cBuwxRUklucCr-ldGfXBG8fopQJ6L5S5mj	t	t	t	t
12	sai_siva	saisiva	\N	nageswararao@gmail.com	$2a$10$RYY0x.uqhvYl1ExBB8f6AekcZoc7dRPskrcNXzRiruVffcwPcn7ua	EgjshdA9GQ1WG4xtk8Orgg	e25efc0b7eebe166bc66c6334565b2e1	f	\N	\N	\N	2019-06-13 11:06:17.158829	2019-06-13 11:06:17.18336	\N	\N	\N	\N	t	t	t	t
13	raju7	raju	\N	raju@gmail.com	$2a$10$L4Gcv6YgWfoVpDmqLlm.GemgXHpLZ9DXKMc8QeQCF53VBuMPDQ8oe	0eB8LLL59lDIbHnyJVKzWA	f0afafeb17d721480ad57268eb37a5a5	f	\N	\N	\N	2019-06-13 12:58:13.083441	2019-06-13 12:58:13.098698	\N	\N	\N	\N	t	t	t	t
14	saisiva_123	saisiva	\N	saisivaalugolus@gmail.com	$2a$10$4ehi/gttnL9pU1dCWtByV.hVVGx4JxhB.Cd9f0RsOeRLgI1hANBZC	b9iBxIDm5xQJgNPRF9Ftrg	9b13d3700c9d45019d9ef8083c17a63d	f	\N	\N	\N	2019-06-13 13:02:32.904783	2019-06-13 13:02:32.922059	\N	\N	\N	\N	t	t	t	t
\.


--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.active_admin_comments_id_seq', 1, false);


--
-- Name: admin_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.admin_users_id_seq', 4, true);


--
-- Name: authentications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.authentications_id_seq', 1, true);


--
-- Name: badges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.badges_id_seq', 1, false);


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.comments_id_seq', 23, true);


--
-- Name: delayed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.delayed_jobs_id_seq', 69, true);


--
-- Name: dish_affections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dish_affections_id_seq', 66, true);


--
-- Name: dish_likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dish_likes_id_seq', 1, false);


--
-- Name: dishes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dishes_id_seq', 434, true);


--
-- Name: dishes_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dishes_users_id_seq', 429, true);


--
-- Name: images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.images_id_seq', 1655, true);


--
-- Name: ratings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ratings_id_seq', 20, true);


--
-- Name: restaurant_affections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.restaurant_affections_id_seq', 38, true);


--
-- Name: restaurant_fellowships_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.restaurant_fellowships_id_seq', 8, true);


--
-- Name: restaurants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.restaurants_id_seq', 1358, true);


--
-- Name: rpush_apps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.rpush_apps_id_seq', 2, true);


--
-- Name: rpush_feedback_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.rpush_feedback_id_seq', 1, false);


--
-- Name: rpush_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.rpush_notifications_id_seq', 3, true);


--
-- Name: settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.settings_id_seq', 1, true);


--
-- Name: taggings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.taggings_id_seq', 779, true);


--
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tags_id_seq', 14, true);


--
-- Name: user_fellowships_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.user_fellowships_id_seq', 12, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 17, true);


--
-- Name: active_admin_comments active_admin_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_admin_comments
    ADD CONSTRAINT active_admin_comments_pkey PRIMARY KEY (id);


--
-- Name: admin_users admin_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (id);


--
-- Name: authentications authentications_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.authentications
    ADD CONSTRAINT authentications_pkey PRIMARY KEY (id);


--
-- Name: badges badges_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.badges
    ADD CONSTRAINT badges_pkey PRIMARY KEY (id);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: delayed_jobs delayed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.delayed_jobs
    ADD CONSTRAINT delayed_jobs_pkey PRIMARY KEY (id);


--
-- Name: dish_affections dish_affections_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dish_affections
    ADD CONSTRAINT dish_affections_pkey PRIMARY KEY (id);


--
-- Name: dish_likes dish_likes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dish_likes
    ADD CONSTRAINT dish_likes_pkey PRIMARY KEY (id);


--
-- Name: dishes dishes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dishes
    ADD CONSTRAINT dishes_pkey PRIMARY KEY (id);


--
-- Name: dishes_users dishes_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dishes_users
    ADD CONSTRAINT dishes_users_pkey PRIMARY KEY (id);


--
-- Name: images images_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.images
    ADD CONSTRAINT images_pkey PRIMARY KEY (id);


--
-- Name: ratings ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_pkey PRIMARY KEY (id);


--
-- Name: restaurant_affections restaurant_affections_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.restaurant_affections
    ADD CONSTRAINT restaurant_affections_pkey PRIMARY KEY (id);


--
-- Name: restaurant_fellowships restaurant_fellowships_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.restaurant_fellowships
    ADD CONSTRAINT restaurant_fellowships_pkey PRIMARY KEY (id);


--
-- Name: restaurants restaurants_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.restaurants
    ADD CONSTRAINT restaurants_pkey PRIMARY KEY (id);


--
-- Name: rpush_apps rpush_apps_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rpush_apps
    ADD CONSTRAINT rpush_apps_pkey PRIMARY KEY (id);


--
-- Name: rpush_feedback rpush_feedback_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rpush_feedback
    ADD CONSTRAINT rpush_feedback_pkey PRIMARY KEY (id);


--
-- Name: rpush_notifications rpush_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rpush_notifications
    ADD CONSTRAINT rpush_notifications_pkey PRIMARY KEY (id);


--
-- Name: settings settings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);


--
-- Name: taggings taggings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.taggings
    ADD CONSTRAINT taggings_pkey PRIMARY KEY (id);


--
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: user_fellowships user_fellowships_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_fellowships
    ADD CONSTRAINT user_fellowships_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: delayed_jobs_priority; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX delayed_jobs_priority ON public.delayed_jobs USING btree (priority, run_at);


--
-- Name: index_active_admin_comments_on_author_type_and_author_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_active_admin_comments_on_author_type_and_author_id ON public.active_admin_comments USING btree (author_type, author_id);


--
-- Name: index_active_admin_comments_on_namespace; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_active_admin_comments_on_namespace ON public.active_admin_comments USING btree (namespace);


--
-- Name: index_active_admin_comments_on_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_active_admin_comments_on_resource_type_and_resource_id ON public.active_admin_comments USING btree (resource_type, resource_id);


--
-- Name: index_admin_users_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_admin_users_on_email ON public.admin_users USING btree (email);


--
-- Name: index_admin_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_admin_users_on_reset_password_token ON public.admin_users USING btree (reset_password_token);


--
-- Name: index_authentications_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_authentications_on_user_id ON public.authentications USING btree (user_id);


--
-- Name: index_comments_on_commentable_type_and_commentable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_comments_on_commentable_type_and_commentable_id ON public.comments USING btree (commentable_type, commentable_id);


--
-- Name: index_comments_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_comments_on_user_id ON public.comments USING btree (user_id);


--
-- Name: index_dish_affections_on_dish_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_dish_affections_on_dish_id ON public.dish_affections USING btree (dish_id);


--
-- Name: index_dish_affections_on_favouriter_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_dish_affections_on_favouriter_id ON public.dish_affections USING btree (favouriter_id);


--
-- Name: index_dish_affections_on_favouriter_id_and_dish_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_dish_affections_on_favouriter_id_and_dish_id ON public.dish_affections USING btree (favouriter_id, dish_id);


--
-- Name: index_dishes_on_restaurant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_dishes_on_restaurant_id ON public.dishes USING btree (restaurant_id);


--
-- Name: index_dishes_users_on_dish_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_dishes_users_on_dish_id ON public.dishes_users USING btree (dish_id);


--
-- Name: index_dishes_users_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_dishes_users_on_user_id ON public.dishes_users USING btree (user_id);


--
-- Name: index_ratings_on_dish_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ratings_on_dish_id ON public.ratings USING btree (dish_id);


--
-- Name: index_ratings_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ratings_on_user_id ON public.ratings USING btree (user_id);


--
-- Name: index_restaurant_affections_on_favouriter_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_restaurant_affections_on_favouriter_id ON public.restaurant_affections USING btree (favouriter_id);


--
-- Name: index_restaurant_affections_on_favouriter_id_and_restaurant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_restaurant_affections_on_favouriter_id_and_restaurant_id ON public.restaurant_affections USING btree (favouriter_id, restaurant_id);


--
-- Name: index_restaurant_affections_on_restaurant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_restaurant_affections_on_restaurant_id ON public.restaurant_affections USING btree (restaurant_id);


--
-- Name: index_restaurant_fellowships_on_follower_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_restaurant_fellowships_on_follower_id ON public.restaurant_fellowships USING btree (follower_id);


--
-- Name: index_restaurant_fellowships_on_follower_id_and_restaurant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_restaurant_fellowships_on_follower_id_and_restaurant_id ON public.restaurant_fellowships USING btree (follower_id, restaurant_id);


--
-- Name: index_restaurant_fellowships_on_restaurant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_restaurant_fellowships_on_restaurant_id ON public.restaurant_fellowships USING btree (restaurant_id);


--
-- Name: index_rpush_feedback_on_device_token; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_rpush_feedback_on_device_token ON public.rpush_feedback USING btree (device_token);


--
-- Name: index_rpush_notifications_multi; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_rpush_notifications_multi ON public.rpush_notifications USING btree (delivered, failed, processing, deliver_after, created_at) WHERE ((NOT delivered) AND (NOT failed));


--
-- Name: index_taggings_on_context; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_taggings_on_context ON public.taggings USING btree (context);


--
-- Name: index_taggings_on_tag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_taggings_on_tag_id ON public.taggings USING btree (tag_id);


--
-- Name: index_taggings_on_taggable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_taggings_on_taggable_id ON public.taggings USING btree (taggable_id);


--
-- Name: index_taggings_on_taggable_id_and_taggable_type_and_context; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_taggings_on_taggable_id_and_taggable_type_and_context ON public.taggings USING btree (taggable_id, taggable_type, context);


--
-- Name: index_taggings_on_taggable_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_taggings_on_taggable_type ON public.taggings USING btree (taggable_type);


--
-- Name: index_taggings_on_tagger_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_taggings_on_tagger_id ON public.taggings USING btree (tagger_id);


--
-- Name: index_taggings_on_tagger_id_and_tagger_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_taggings_on_tagger_id_and_tagger_type ON public.taggings USING btree (tagger_id, tagger_type);


--
-- Name: index_tags_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_tags_on_name ON public.tags USING btree (name);


--
-- Name: index_user_fellowships_on_follower_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_user_fellowships_on_follower_id ON public.user_fellowships USING btree (follower_id);


--
-- Name: index_user_fellowships_on_follower_id_and_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_user_fellowships_on_follower_id_and_user_id ON public.user_fellowships USING btree (follower_id, user_id);


--
-- Name: index_user_fellowships_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_user_fellowships_on_user_id ON public.user_fellowships USING btree (user_id);


--
-- Name: taggings_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX taggings_idx ON public.taggings USING btree (tag_id, taggable_id, taggable_type, context, tagger_id, tagger_type);


--
-- Name: taggings_idy; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX taggings_idy ON public.taggings USING btree (taggable_id, taggable_type, tagger_id, context);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX unique_schema_migrations ON public.schema_migrations USING btree (version);


--
-- Name: comments fk_rails_03de2dc08c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT fk_rails_03de2dc08c FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: authentications fk_rails_08833fecbe; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.authentications
    ADD CONSTRAINT fk_rails_08833fecbe FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: restaurant_fellowships fk_rails_092b097972; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.restaurant_fellowships
    ADD CONSTRAINT fk_rails_092b097972 FOREIGN KEY (restaurant_id) REFERENCES public.restaurants(id);


--
-- Name: user_fellowships fk_rails_35ed98e53d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_fellowships
    ADD CONSTRAINT fk_rails_35ed98e53d FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: restaurant_affections fk_rails_5d46701847; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.restaurant_affections
    ADD CONSTRAINT fk_rails_5d46701847 FOREIGN KEY (restaurant_id) REFERENCES public.restaurants(id);


--
-- Name: dish_affections fk_rails_9abcbe73de; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dish_affections
    ADD CONSTRAINT fk_rails_9abcbe73de FOREIGN KEY (dish_id) REFERENCES public.dishes(id);


--
-- Name: ratings fk_rails_9f96b27f7c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT fk_rails_9f96b27f7c FOREIGN KEY (dish_id) REFERENCES public.dishes(id);


--
-- Name: ratings fk_rails_a7dfeb9f5f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT fk_rails_a7dfeb9f5f FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

