--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4
-- Dumped by pg_dump version 14.4

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
-- Name: cuisine; Type: TABLE; Schema: public; Owner: sonali
--

CREATE TABLE public.cuisine (
    id integer NOT NULL,
    title text NOT NULL
);


ALTER TABLE public.cuisine OWNER TO sonali;

--
-- Name: ingredients; Type: TABLE; Schema: public; Owner: sonali
--

CREATE TABLE public.ingredients (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.ingredients OWNER TO sonali;

--
-- Name: recipe_cuisine; Type: TABLE; Schema: public; Owner: sonali
--

CREATE TABLE public.recipe_cuisine (
    recipe_id integer NOT NULL,
    cuisine_id integer NOT NULL
);


ALTER TABLE public.recipe_cuisine OWNER TO sonali;

--
-- Name: recipe_ingredients; Type: TABLE; Schema: public; Owner: sonali
--

CREATE TABLE public.recipe_ingredients (
    recipe_id integer NOT NULL,
    ingredient_id integer NOT NULL
);


ALTER TABLE public.recipe_ingredients OWNER TO sonali;

--
-- Name: recipes; Type: TABLE; Schema: public; Owner: sonali
--

CREATE TABLE public.recipes (
    id integer NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.recipes OWNER TO sonali;

--
-- Name: all_recipes; Type: VIEW; Schema: public; Owner: sonali
--

CREATE VIEW public.all_recipes AS
 SELECT recipes.description,
    recipes.id,
    cuisine.title,
    ARRAY( SELECT ingredients.name
           FROM (public.recipe_ingredients
             JOIN public.ingredients ON ((ingredients.id = recipe_ingredients.ingredient_id)))
          WHERE (recipe_ingredients.recipe_id = recipes.id)) AS ingredient_list
   FROM ((public.recipes
     JOIN public.recipe_cuisine ON ((recipe_cuisine.recipe_id = recipes.id)))
     JOIN public.cuisine ON ((cuisine.id = recipe_cuisine.cuisine_id)));


ALTER TABLE public.all_recipes OWNER TO sonali;

--
-- Name: cuisine_id_seq; Type: SEQUENCE; Schema: public; Owner: sonali
--

CREATE SEQUENCE public.cuisine_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cuisine_id_seq OWNER TO sonali;

--
-- Name: cuisine_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonali
--

ALTER SEQUENCE public.cuisine_id_seq OWNED BY public.cuisine.id;


--
-- Name: ingredients_id_seq; Type: SEQUENCE; Schema: public; Owner: sonali
--

CREATE SEQUENCE public.ingredients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ingredients_id_seq OWNER TO sonali;

--
-- Name: ingredients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonali
--

ALTER SEQUENCE public.ingredients_id_seq OWNED BY public.ingredients.id;


--
-- Name: recipes_id_seq; Type: SEQUENCE; Schema: public; Owner: sonali
--

CREATE SEQUENCE public.recipes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recipes_id_seq OWNER TO sonali;

--
-- Name: recipes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonali
--

ALTER SEQUENCE public.recipes_id_seq OWNED BY public.recipes.id;


--
-- Name: cuisine id; Type: DEFAULT; Schema: public; Owner: sonali
--

ALTER TABLE ONLY public.cuisine ALTER COLUMN id SET DEFAULT nextval('public.cuisine_id_seq'::regclass);


--
-- Name: ingredients id; Type: DEFAULT; Schema: public; Owner: sonali
--

ALTER TABLE ONLY public.ingredients ALTER COLUMN id SET DEFAULT nextval('public.ingredients_id_seq'::regclass);


--
-- Name: recipes id; Type: DEFAULT; Schema: public; Owner: sonali
--

ALTER TABLE ONLY public.recipes ALTER COLUMN id SET DEFAULT nextval('public.recipes_id_seq'::regclass);


--
-- Data for Name: cuisine; Type: TABLE DATA; Schema: public; Owner: sonali
--

COPY public.cuisine (id, title) FROM stdin;
1	Chinese
2	Indian
3	British
\.


--
-- Data for Name: ingredients; Type: TABLE DATA; Schema: public; Owner: sonali
--

COPY public.ingredients (id, name) FROM stdin;
1	chicken stock
2	ginger
3	onions
4	gelatine
5	pork mince
7	soy sauce
8	sesame oil
9	rice wine
10	sugar
11	salt
12	pepper
13	chives
14	1 pack store-bought dumpling wrappers 
15	eggs
16	chilli oil
17	sesame seeds
18	spring onion
21	3–4 tbsp vegetable or groundnut oil
22	garlic
24	onion
25	broccoli
26	mushrooms
27	½ tsp chilli flakes
29	black bean sauce
30	dry sherry
31	cornflour
32	noodles
33	beansprouts
34	spring onions
35	fresh coriander
36	vegetable oil
37	egg
39	peas
40	rice
41	roast chicken
44	sunflower oil
45	star anise
46	cashew
47	chillies
53	coriander
54	white pepper
56	crabmeat
64	black pepper
65	langoustine
67	self-raising flour
68	caster sugar
69	baking powder
70	milk
71	white wine vinegar
73	pinch fine sea salt
74	chicken thighs
81	harissa
82	vinegar
83	honey
86	sushi rice
89	five-spice powder
91	goji berries
92	sea salt
95	rapeseed oil
96	dried chillies
97	1 tbsp Shaoxing rice wine
98	pineapple
102	freshly ground black pepper
104	pineapple juice
107	lime
109	Sriracha
110	plain flour
112	100ml/3½fl oz boiling water 
114	chicken
120	pak choi
128	vegetable stock
130	rice vinegar
135	aubergines
137	chilli
140	shiitake mushrooms
143	jasmine rice
144	pork belly
145	2 tbsp rapeseed or groundnut oil 
149	Sichuan peppercorns
153	brown sugar
154	pinch salt 
156	stir-fried greens
165	prawns
167	30 shop-bought frozen gyoza dumpling wrappers, defrosted (See Recipe Tip)
172	Sichuan pepper
175	mirin
177	nut
179	pea shoots
181	edible flowers 
184	carrots
185	cucumber
189	grapefruit
190	pomegranate
192	chicken breast
193	smoked salmon
195	50g/1¾oz fried wonton skin pieces (see Recipe Tip for preparation)
197	plum
198	oyster sauce
203	sea bass
233	fish
239	1 tbsp groundnut oil
242	450g/1lb dried or fresh egg noodles
243	3½ tbsp sesame oil 
248	3 tbsp sesame paste
249	1 tbsp chilli bean sauce
252	2 tsp Sichuan peppercorns, roasted and ground
253	1 tsp freshly ground black pepper
254	2 tsp sugar
262	carrot
269	zest
276	chilli sauce
278	1 tbsp groundnut oil 
280	150g/5oz bean sprouts
283	sweet potato
286	chicken wings
287	scallops
288	crab
317	venison
321	100ml/3½fl oz sake
323	hoisin sauce
327	cinnamon
330	olive oil
334	tomatoes
336	3 tbsp water
338	1 pack 22cm/8in banh trang rice paper wrappers
339	iceberg lettuce
340	basil
343	duck
344	cloves
349	2 tbsp hoi sin sauce 
355	water chestnuts
372	Jasmine rice
382	red lentils
383	sweet potatoes
384	turmeric
386	spinach
388	cumin
391	lemon
393	2 tsp salt
396	cassia bark
397	cardamom
399	ghee
401	bay leaves
404	chilli powder
405	100ml/3½fl oz warm water
406	coconut milk
416	rock salt
417	saffron
419	crème fraîche
420	cream
422	nutmeg
423	strawberries
424	potatoes
426	mustard seeds
430	curry powder
431	curry leaves
434	wholemeal flour
436	1 tsp fine sea salt 
437	cauliflower
441	garam masala
443	aubergine
447	red onion
454	butter
455	cherry tomatoes
475	basmati rice
476	chana dal
485	tomato
486	2–3 green chillies (bird’s-eye or finger chillies), chopped
487	fenugreek
489	corn oil
492	black cardamom
493	black peppercorns
495	bay leaf
513	parathas
516	ajwain
517	nigella seeds
519	oil
521	mint
526	yoghurt
530	cashews
531	fennel seeds
545	beef
546	500ml/18fl oz hot water
555	puff pastry
556	flour
557	chicken breasts
566	ground almonds
567	mango chutney
574	lime leaves
582	dried chilli
583	amchoor
587	coconut oil
589	400ml/7fl oz boiling water
590	tomato purée
594	chickpeas
596	parsley
597	green beans
603	desiccated coconut
605	shallot
608	flaked almonds
612	lemon juice
617	paprika
631	double cream
638	red onions
660	paneer
665	gram flour
666	bicarbonate of soda
668	poppy seeds
670	ginger beer
694	wholegrain mustard
696	chickpea flour
699	monkfish
711	stock
722	wild mushrooms
726	samphire
727	pickled
729	coriander seeds
742	sea salt and freshly ground black pepper
748	chopped tomatoes
751	green lentils
753	limes
754	apples
757	rhubarb
761	125g/4½oz caster or light soft brown sugar, plus 1 tbsp for sprinkling
766	haricot beans
767	rosemary
768	sourdough bread
776	sausages
778	Dijon mustard
782	beef mince
786	dried mixed herbs
787	kidney beans
790	salt and pepper 
797	sultanas
798	jam
799	clotted cream
801	oats
802	peanuts
805	maple syrup
810	custard
811	cocoa powder
812	6 tbsp boiling water
819	dark chocolate
821	apricot jam
822	strong white flour
824	mixed spice
828	yeast
833	candied peel
836	golden syrup
842	chestnut mushrooms
843	thyme
844	sherry
845	prosciutto
853	red wine
854	beef stock
855	1 heaped tbsp redcurrant or quince jelly
860	225g/8oz butter at room temperature, plus a little extra to grease the tins
861	raspberry jam
864	pork sausages
865	bacon
872	Worcestershire sauce
873	muscovado sugar
877	100ml/3½fl oz red or white wine (optional)
878	butter beans
880	rice or rustic bread slices, to serve
890	leek
894	braising steak
898	celery
900	leeks
901	swede
908	balsamic vinegar
913	suet
914	water, to make a dough
915	mashed potato
919	beer
920	cheddar
923	English mustard
926	mixed berries
928	gin
930	meringue
932	icing sugar
934	dates
935	150ml/5fl oz boiling water
936	coffee granules
943	walnuts
944	demerara sugar
948	cider
951	smoked paprika
961	egg yolks
964	2–3 tbsp orange or clementine liqueur
965	clementines
966	2 tbsp orange or clementine liqueur
968	marmalade
\.


--
-- Data for Name: recipe_cuisine; Type: TABLE DATA; Schema: public; Owner: sonali
--

COPY public.recipe_cuisine (recipe_id, cuisine_id) FROM stdin;
1	1
2	1
3	1
4	1
5	1
6	1
7	1
8	1
9	1
10	1
11	1
12	1
13	1
14	1
15	1
16	1
17	1
18	1
19	1
20	1
21	2
22	2
23	2
24	2
25	2
26	2
27	2
28	2
29	2
30	2
31	2
32	2
33	2
34	2
35	2
36	2
37	2
38	2
39	2
40	2
41	3
42	3
43	3
44	3
45	3
46	3
47	3
48	3
49	3
50	3
51	3
52	3
53	3
54	3
55	3
56	3
57	3
58	3
59	3
60	3
\.


--
-- Data for Name: recipe_ingredients; Type: TABLE DATA; Schema: public; Owner: sonali
--

COPY public.recipe_ingredients (recipe_id, ingredient_id) FROM stdin;
1	1
1	2
1	3
1	4
1	5
1	1
1	7
1	8
1	9
1	10
1	11
1	12
1	13
1	14
1	15
1	16
1	17
1	18
1	3
1	8
2	21
2	22
2	2
2	24
2	25
2	26
2	27
2	7
2	29
2	30
2	31
2	32
2	33
2	34
2	35
3	36
3	37
3	34
3	39
3	40
3	41
3	8
3	7
4	44
4	45
4	46
4	47
4	2
4	34
4	1
4	7
4	31
4	53
4	54
4	44
4	56
4	37
4	31
4	47
4	18
4	2
4	35
4	7
4	64
4	65
4	31
5	67
5	68
5	69
5	70
5	71
5	44
5	73
5	74
5	7
5	8
5	17
5	35
5	7
5	7
5	81
5	82
5	83
5	8
6	2
6	86
6	1
6	9
6	89
6	54
6	91
6	92
6	74
6	31
6	95
6	96
6	97
6	98
6	12
6	18
6	46
6	102
6	35
6	104
6	7
6	31
6	107
6	83
6	109
7	110
7	11
7	112
7	36
7	114
7	9
7	7
7	8
7	10
7	31
7	120
7	18
7	2
7	7
7	9
7	68
7	8
7	18
8	128
8	7
8	130
8	8
8	68
8	31
8	95
8	135
8	22
8	137
8	2
8	137
8	140
8	34
8	53
8	143
9	144
9	145
9	2
9	30
9	45
9	149
9	47
9	1
9	7
9	153
9	154
9	143
9	156
10	5
10	2
10	30
10	92
10	153
10	128
10	8
10	54
10	165
10	34
10	167
10	22
10	2
10	47
10	53
10	172
10	7
10	130
10	175
10	17
10	177
10	8
10	179
10	53
10	181
11	32
11	8
11	184
11	185
11	12
11	12
11	18
11	189
11	190
11	165
11	192
11	193
11	46
11	195
11	53
11	197
11	198
11	130
11	8
11	175
11	17
12	203
12	54
12	2
12	9
12	31
12	92
12	137
12	128
12	7
12	7
12	130
12	68
12	31
12	95
12	22
12	2
12	47
12	172
12	34
12	95
12	22
12	137
12	120
12	9
12	7
12	31
12	8
12	18
12	53
12	143
13	233
13	11
13	2
13	34
13	7
13	7
13	239
13	8
13	35
13	242
13	243
13	22
13	34
13	7
13	7
13	248
13	249
13	16
13	82
13	252
13	253
13	254
14	36
14	192
14	83
14	22
14	2
14	137
14	34
14	262
14	12
14	120
14	32
14	35
14	7
14	8
14	269
14	46
15	32
15	8
15	192
15	7
15	89
15	276
15	31
15	278
15	12
15	280
15	18
15	64
16	283
16	26
16	140
16	286
16	287
16	288
16	37
16	8
16	11
16	31
16	7
16	9
16	54
16	130
16	34
16	137
16	130
17	32
17	140
17	287
17	22
17	2
17	34
17	36
17	31
17	11
17	25
17	198
17	7
17	9
17	1
17	8
17	64
17	10
18	317
18	36
18	64
18	7
18	321
18	175
18	323
18	22
18	2
18	45
18	327
19	32
19	192
19	330
19	34
19	13
19	35
19	334
19	110
19	336
19	177
19	338
19	339
19	340
19	53
19	12
20	343
20	344
20	2
20	30
20	89
20	83
20	349
20	276
20	7
20	92
20	339
20	36
20	355
20	34
20	2
20	22
20	30
20	198
20	7
20	7
20	8
20	323
20	95
20	15
20	95
20	22
20	2
20	137
20	120
20	372
20	7
20	8
20	54
20	18
20	137
20	47
20	185
20	22
20	175
21	382
21	383
21	384
21	128
21	386
21	44
21	388
21	47
21	64
21	391
22	384
22	393
22	165
22	3
22	396
22	397
22	344
22	399
22	36
22	401
22	2
22	22
22	404
22	405
22	406
22	47
22	68
22	40
22	36
22	47
22	401
22	2
22	98
22	68
22	416
23	417
23	70
23	419
23	420
23	83
23	422
23	423
24	424
24	36
24	426
24	426
24	397
24	388
24	430
24	431
24	83
24	64
25	434
25	44
25	436
25	437
25	2
25	137
25	35
25	441
25	92
25	443
25	44
25	388
25	22
25	447
25	47
25	334
25	35
25	53
25	384
25	11
25	454
26	455
26	12
26	24
26	2
26	22
26	426
26	64
26	53
26	388
26	384
26	404
26	431
26	92
26	36
26	406
26	165
26	386
26	107
26	35
26	137
26	475
27	476
27	11
27	384
27	454
27	44
27	388
27	22
27	2
27	24
27	485
27	486
27	487
27	441
28	489
28	344
28	327
28	492
28	493
28	388
28	495
28	3
28	22
28	114
28	2
28	22
28	11
28	384
28	404
28	137
28	388
28	53
28	334
28	47
28	441
28	487
28	391
28	35
28	513
29	110
29	399
29	516
29	517
29	11
29	519
30	35
30	521
30	34
30	137
30	22
30	391
30	526
30	153
30	64
31	519
31	530
31	531
31	327
31	401
31	397
31	47
31	3
31	22
31	2
31	11
31	334
31	384
31	404
31	388
31	430
31	545
31	546
31	475
31	11
31	492
31	530
31	11
31	47
31	35
31	34
31	555
31	556
32	557
32	44
32	3
32	22
32	137
32	430
32	388
32	397
32	1
32	566
32	567
32	391
32	526
32	64
32	40
32	53
33	431
33	574
33	384
33	388
33	441
33	45
33	327
33	397
33	487
33	582
33	583
33	2
33	22
33	566
33	587
33	74
33	589
33	590
33	334
33	386
33	64
33	594
33	46
33	596
33	597
33	587
33	430
33	327
33	582
33	455
33	603
33	107
33	605
33	64
33	35
33	608
34	74
34	397
34	487
34	612
34	44
34	441
34	388
34	53
34	617
34	92
34	47
34	454
34	22
34	2
34	441
34	388
34	53
34	384
34	487
34	582
34	68
34	590
34	631
34	92
35	36
35	15
35	384
35	404
35	406
35	638
35	2
35	47
35	11
35	10
35	53
35	441
35	475
36	36
36	388
36	24
36	22
36	2
36	487
36	441
36	384
36	404
36	590
36	11
36	10
36	419
36	39
36	660
36	454
36	53
36	190
36	40
37	665
37	666
37	517
37	668
37	516
37	670
37	11
37	391
37	53
37	388
37	404
37	24
37	22
37	597
37	35
37	36
37	35
37	521
37	137
37	24
37	2
37	388
37	53
37	391
37	10
37	11
38	404
38	384
38	22
38	694
38	137
38	696
38	612
38	95
38	699
38	391
38	95
38	492
38	397
38	495
38	137
38	3
38	22
38	694
38	53
38	404
38	711
38	406
38	397
38	11
38	95
38	426
38	388
38	2
38	384
38	137
38	597
38	722
38	430
38	149
38	11
38	726
38	727
38	181
39	729
39	397
39	388
39	344
39	327
39	401
39	454
39	24
39	22
39	384
39	426
39	475
39	128
39	742
40	447
40	430
40	384
40	388
40	2
40	748
40	406
40	594
40	751
40	39
40	753
41	754
41	612
41	68
41	757
41	110
41	327
41	454
41	761
42	330
42	447
42	22
42	748
42	766
42	767
42	768
42	22
42	64
43	110
43	11
43	454
43	612
43	37
43	776
43	531
43	778
44	330
44	24
44	22
44	782
44	137
44	748
44	711
44	786
44	787
44	40
44	526
44	790
45	67
45	69
45	68
45	454
45	15
45	70
45	797
45	798
45	799
46	454
46	801
46	802
46	327
46	10
46	805
46	44
46	454
46	754
46	10
46	810
47	811
47	812
47	15
47	70
47	556
47	69
47	454
47	68
47	819
47	420
47	821
48	822
48	68
48	824
48	327
48	391
48	11
48	828
48	454
48	70
48	37
48	797
48	833
48	519
48	110
48	836
49	317
49	519
49	454
49	447
49	22
49	842
49	843
49	844
49	845
49	110
49	555
49	37
49	64
49	454
49	447
49	110
49	853
49	854
49	855
50	15
50	68
50	67
50	69
50	860
50	861
50	631
51	44
51	864
51	865
51	3
51	22
51	404
51	748
51	1
51	590
51	872
51	873
51	786
51	401
51	843
51	877
51	878
51	64
51	880
52	74
52	44
52	24
52	865
52	26
52	184
52	110
52	843
52	1
52	890
52	64
53	330
53	454
53	894
53	110
53	22
53	3
53	898
53	184
53	900
53	901
53	853
53	854
53	401
53	843
53	596
53	872
53	908
53	64
53	110
53	69
53	11
53	913
53	914
53	915
53	596
54	454
54	110
54	919
54	920
54	872
54	13
54	923
54	22
54	768
55	926
55	68
55	928
55	631
55	930
55	521
55	932
56	454
56	934
56	935
56	936
56	68
56	873
56	15
56	67
56	69
56	11
56	943
56	944
57	454
57	74
57	900
57	948
57	778
57	7
57	951
57	631
57	424
57	920
57	12
58	15
58	68
58	67
58	70
58	631
58	961
58	31
58	68
58	964
58	965
58	966
58	964
58	968
58	631
58	608
59	110
59	11
59	70
59	15
59	454
60	110
60	11
60	15
60	70
60	454
60	68
60	612
60	391
\.


--
-- Data for Name: recipes; Type: TABLE DATA; Schema: public; Owner: sonali
--

COPY public.recipes (id, description) FROM stdin;
1	Pork potsticker dumplings with fried eggs and crispy chilli oil
2	Mushroom and broccoli stir fry
3	Chicken egg-fried rice
4	Crab fritters with a spiced sauce
5	Sticky chicken in quick bao buns
6	Pineapple chicken with guo bao rice
7	Potsticker dumplings with dipping sauce
8	Yuxiang aubergine with shiitake mushrooms
9	Red braised pork belly (Hong Shao Rou)
10	Lunar New Year pork and prawn dumplings 
11	Lunar New Year ‘Yu-sheng' (‘Prosperity toss’)
12	Steamed sea bass in a fragrant spicy sauce
13	Steamed Cantonese-style fish with spicy noodles
14	Chicken and cashew noodle stir-fry
15	Easy chicken chow mein
16	Eight treasures soup
17	Lo mein with scallops and Tenderstem broccoli 
18	Venison char siu
19	Crispy chicken and sun-dried tomato spring rolls
20	Shredded duck & cucumber lettuce wraps
21	Microwave spinach and sweet potato dal
22	Golda chingri malaikari with anaras jhal chutney
23	Strawberry saffron dip (shrikhand)
24	Bombay potatoes
25	Smoky aubergine curry with cauliflower parathas
26	Keralan prawn curry
27	Easy chana dal
28	Jungle curry
29	Triangle parathas
30	Coriander and kefir chutney
31	Beef cashew vindaloo
32	Korma-style chicken curry 
33	Almond chicken curry
34	Easy butter chicken 
35	Egg coconut masala curry (egg moilee)
36	Butter paneer curry
37	Ginger beer onion bhajis
38	Monkfish curry
39	Pilau rice
40	Golden coconut curry
41	Rhubarb and apple crumble
42	Tuscan beans on sourdough toast
43	Homemade sausage rolls 
44	Budget chilli con carne
45	Mary Berry's scones
46	Frying pan apple custard crumble
47	Chocolate sponge cake
48	Mary Berry's hot cross buns
49	Venison Wellington 
50	Mary Berry's easy Victoria sandwich
51	Hairy Bikers' sausage casserole
52	Easy chicken casserole
53	Beef stew
54	Rarebit
55	Boozy berry Eton mess
56	Date and walnut cake
57	Chicken, leek and cider gratin
58	Clementine trifle
59	How to make pancakes
60	Pancakes recipe
\.


--
-- Name: cuisine_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonali
--

SELECT pg_catalog.setval('public.cuisine_id_seq', 3, true);


--
-- Name: ingredients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonali
--

SELECT pg_catalog.setval('public.ingredients_id_seq', 983, true);


--
-- Name: recipes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonali
--

SELECT pg_catalog.setval('public.recipes_id_seq', 60, true);


--
-- Name: cuisine cuisine_pkey; Type: CONSTRAINT; Schema: public; Owner: sonali
--

ALTER TABLE ONLY public.cuisine
    ADD CONSTRAINT cuisine_pkey PRIMARY KEY (id);


--
-- Name: ingredients ingredients_pkey; Type: CONSTRAINT; Schema: public; Owner: sonali
--

ALTER TABLE ONLY public.ingredients
    ADD CONSTRAINT ingredients_pkey PRIMARY KEY (id);


--
-- Name: recipes recipes_pkey; Type: CONSTRAINT; Schema: public; Owner: sonali
--

ALTER TABLE ONLY public.recipes
    ADD CONSTRAINT recipes_pkey PRIMARY KEY (id);


--
-- Name: cuisine unique_cuisine; Type: CONSTRAINT; Schema: public; Owner: sonali
--

ALTER TABLE ONLY public.cuisine
    ADD CONSTRAINT unique_cuisine UNIQUE (title);


--
-- Name: ingredients unique_name; Type: CONSTRAINT; Schema: public; Owner: sonali
--

ALTER TABLE ONLY public.ingredients
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: recipes unique_recipe_desc; Type: CONSTRAINT; Schema: public; Owner: sonali
--

ALTER TABLE ONLY public.recipes
    ADD CONSTRAINT unique_recipe_desc UNIQUE (description);


--
-- Name: recipe_cuisine recipe_cuisine_cuisine_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sonali
--

ALTER TABLE ONLY public.recipe_cuisine
    ADD CONSTRAINT recipe_cuisine_cuisine_id_fkey FOREIGN KEY (cuisine_id) REFERENCES public.cuisine(id);


--
-- Name: recipe_cuisine recipe_cuisine_recipe_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sonali
--

ALTER TABLE ONLY public.recipe_cuisine
    ADD CONSTRAINT recipe_cuisine_recipe_id_fkey FOREIGN KEY (recipe_id) REFERENCES public.recipes(id);


--
-- Name: recipe_ingredients recipe_ingredients_ingredient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sonali
--

ALTER TABLE ONLY public.recipe_ingredients
    ADD CONSTRAINT recipe_ingredients_ingredient_id_fkey FOREIGN KEY (ingredient_id) REFERENCES public.ingredients(id);


--
-- Name: recipe_ingredients recipe_ingredients_recipe_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sonali
--

ALTER TABLE ONLY public.recipe_ingredients
    ADD CONSTRAINT recipe_ingredients_recipe_id_fkey FOREIGN KEY (recipe_id) REFERENCES public.recipes(id);


--
-- PostgreSQL database dump complete
--

