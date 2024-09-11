PGDMP         (                |            task_manager    14.9    14.9 6    -           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            .           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            /           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            0           1262    21370    task_manager    DATABASE     i   CREATE DATABASE task_manager WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Russian_Russia.1252';
    DROP DATABASE task_manager;
                postgres    false            D           1247    21378    priority    TYPE     M   CREATE TYPE public.priority AS ENUM (
    'low',
    'medium',
    'high'
);
    DROP TYPE public.priority;
       public          postgres    false            A           1247    21372    role    TYPE     ?   CREATE TYPE public.role AS ENUM (
    'admin',
    'viewer'
);
    DROP TYPE public.role;
       public          postgres    false            �            1259    21451    calendarentry    TABLE     �   CREATE TABLE public.calendarentry (
    start_time timestamp without time zone NOT NULL,
    end_time timestamp without time zone NOT NULL,
    id integer NOT NULL,
    task_id integer NOT NULL
);
 !   DROP TABLE public.calendarentry;
       public         heap    postgres    false            �            1259    21450    calendarentry_id_seq    SEQUENCE     �   CREATE SEQUENCE public.calendarentry_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.calendarentry_id_seq;
       public          postgres    false    220            1           0    0    calendarentry_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.calendarentry_id_seq OWNED BY public.calendarentry.id;
          public          postgres    false    219            �            1259    21423    category    TABLE     �   CREATE TABLE public.category (
    title character varying NOT NULL,
    description character varying,
    id integer NOT NULL,
    project_id integer NOT NULL
);
    DROP TABLE public.category;
       public         heap    postgres    false            �            1259    21422    category_id_seq    SEQUENCE     �   CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.category_id_seq;
       public          postgres    false    216            2           0    0    category_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;
          public          postgres    false    215            �            1259    21397    project    TABLE     �   CREATE TABLE public.project (
    title character varying NOT NULL,
    description character varying,
    id integer NOT NULL
);
    DROP TABLE public.project;
       public         heap    postgres    false            �            1259    21396    project_id_seq    SEQUENCE     �   CREATE SEQUENCE public.project_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.project_id_seq;
       public          postgres    false    212            3           0    0    project_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.project_id_seq OWNED BY public.project.id;
          public          postgres    false    211            �            1259    21406    projectuserlink    TABLE     �   CREATE TABLE public.projectuserlink (
    id integer NOT NULL,
    user_id integer NOT NULL,
    project_id integer NOT NULL,
    role public.role NOT NULL
);
 #   DROP TABLE public.projectuserlink;
       public         heap    postgres    false    833            �            1259    21405    projectuserlink_id_seq    SEQUENCE     �   CREATE SEQUENCE public.projectuserlink_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.projectuserlink_id_seq;
       public          postgres    false    214            4           0    0    projectuserlink_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.projectuserlink_id_seq OWNED BY public.projectuserlink.id;
          public          postgres    false    213            �            1259    21437    task    TABLE       CREATE TABLE public.task (
    title character varying NOT NULL,
    description character varying,
    deadline integer,
    priority public.priority NOT NULL,
    approximate_time time without time zone NOT NULL,
    id integer NOT NULL,
    category_id integer NOT NULL
);
    DROP TABLE public.task;
       public         heap    postgres    false    836            �            1259    21436    task_id_seq    SEQUENCE     �   CREATE SEQUENCE public.task_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.task_id_seq;
       public          postgres    false    218            5           0    0    task_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.task_id_seq OWNED BY public.task.id;
          public          postgres    false    217            �            1259    21386    user    TABLE     �   CREATE TABLE public."user" (
    username character varying NOT NULL,
    email character varying NOT NULL,
    hashed_password character varying NOT NULL,
    id integer NOT NULL
);
    DROP TABLE public."user";
       public         heap    postgres    false            �            1259    21385    user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.user_id_seq;
       public          postgres    false    210            6           0    0    user_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;
          public          postgres    false    209            �           2604    21454    calendarentry id    DEFAULT     t   ALTER TABLE ONLY public.calendarentry ALTER COLUMN id SET DEFAULT nextval('public.calendarentry_id_seq'::regclass);
 ?   ALTER TABLE public.calendarentry ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    220    220            ~           2604    21426    category id    DEFAULT     j   ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);
 :   ALTER TABLE public.category ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216            |           2604    21400 
   project id    DEFAULT     h   ALTER TABLE ONLY public.project ALTER COLUMN id SET DEFAULT nextval('public.project_id_seq'::regclass);
 9   ALTER TABLE public.project ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    212    212            }           2604    21409    projectuserlink id    DEFAULT     x   ALTER TABLE ONLY public.projectuserlink ALTER COLUMN id SET DEFAULT nextval('public.projectuserlink_id_seq'::regclass);
 A   ALTER TABLE public.projectuserlink ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    213    214                       2604    21440    task id    DEFAULT     b   ALTER TABLE ONLY public.task ALTER COLUMN id SET DEFAULT nextval('public.task_id_seq'::regclass);
 6   ALTER TABLE public.task ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217    218            {           2604    21389    user id    DEFAULT     d   ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);
 8   ALTER TABLE public."user" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    210    210            *          0    21451    calendarentry 
   TABLE DATA           J   COPY public.calendarentry (start_time, end_time, id, task_id) FROM stdin;
    public          postgres    false    220   �;       &          0    21423    category 
   TABLE DATA           F   COPY public.category (title, description, id, project_id) FROM stdin;
    public          postgres    false    216   @<       "          0    21397    project 
   TABLE DATA           9   COPY public.project (title, description, id) FROM stdin;
    public          postgres    false    212   �<       $          0    21406    projectuserlink 
   TABLE DATA           H   COPY public.projectuserlink (id, user_id, project_id, role) FROM stdin;
    public          postgres    false    214   �<       (          0    21437    task 
   TABLE DATA           i   COPY public.task (title, description, deadline, priority, approximate_time, id, category_id) FROM stdin;
    public          postgres    false    218   <=                  0    21386    user 
   TABLE DATA           F   COPY public."user" (username, email, hashed_password, id) FROM stdin;
    public          postgres    false    210   >       7           0    0    calendarentry_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.calendarentry_id_seq', 8, true);
          public          postgres    false    219            8           0    0    category_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.category_id_seq', 4, true);
          public          postgres    false    215            9           0    0    project_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.project_id_seq', 2, true);
          public          postgres    false    211            :           0    0    projectuserlink_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.projectuserlink_id_seq', 5, true);
          public          postgres    false    213            ;           0    0    task_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.task_id_seq', 4, true);
          public          postgres    false    217            <           0    0    user_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.user_id_seq', 5, true);
          public          postgres    false    209            �           2606    21456     calendarentry calendarentry_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.calendarentry
    ADD CONSTRAINT calendarentry_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.calendarentry DROP CONSTRAINT calendarentry_pkey;
       public            postgres    false    220            �           2606    21430    category category_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.category DROP CONSTRAINT category_pkey;
       public            postgres    false    216            �           2606    21404    project project_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.project
    ADD CONSTRAINT project_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.project DROP CONSTRAINT project_pkey;
       public            postgres    false    212            �           2606    21411 $   projectuserlink projectuserlink_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.projectuserlink
    ADD CONSTRAINT projectuserlink_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.projectuserlink DROP CONSTRAINT projectuserlink_pkey;
       public            postgres    false    214            �           2606    21444    task task_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.task
    ADD CONSTRAINT task_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.task DROP CONSTRAINT task_pkey;
       public            postgres    false    218            �           2606    21393    user user_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pkey;
       public            postgres    false    210            �           2606    21395    user user_username_key 
   CONSTRAINT     W   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key UNIQUE (username);
 B   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_username_key;
       public            postgres    false    210            �           2606    21457 (   calendarentry calendarentry_task_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.calendarentry
    ADD CONSTRAINT calendarentry_task_id_fkey FOREIGN KEY (task_id) REFERENCES public.task(id);
 R   ALTER TABLE ONLY public.calendarentry DROP CONSTRAINT calendarentry_task_id_fkey;
       public          postgres    false    220    218    3212            �           2606    21431 !   category category_project_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.project(id);
 K   ALTER TABLE ONLY public.category DROP CONSTRAINT category_project_id_fkey;
       public          postgres    false    212    3206    216            �           2606    21417 /   projectuserlink projectuserlink_project_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.projectuserlink
    ADD CONSTRAINT projectuserlink_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.project(id);
 Y   ALTER TABLE ONLY public.projectuserlink DROP CONSTRAINT projectuserlink_project_id_fkey;
       public          postgres    false    214    3206    212            �           2606    21412 ,   projectuserlink projectuserlink_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.projectuserlink
    ADD CONSTRAINT projectuserlink_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);
 V   ALTER TABLE ONLY public.projectuserlink DROP CONSTRAINT projectuserlink_user_id_fkey;
       public          postgres    false    3202    214    210            �           2606    21445    task task_category_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.task
    ADD CONSTRAINT task_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.category(id);
 D   ALTER TABLE ONLY public.task DROP CONSTRAINT task_category_id_fkey;
       public          postgres    false    216    3210    218            *   Z   x��ͱ�0�ڞ���D�%�ρ+d�(���tx+&dX�ں+��Hߤ�����A�P.����O��ҳ�m>�\.=/��g�rVf��FV]      &   D   x����M-�/����4�4�r-K�+)񌀼�̒�ǘӈ+$51W��43'%3/$h����� ��      "   S   x���,K-*�,��(��JM.Q(J�I,IMQ(�W(��*�$gsr秕(gg��cӑ�[P�_����P��Ј+F��� �&�      $   5   x�3�4�Ĕ��<.#N# �,3�<��˘��1�4�AT�r��P�=... (o      (   �   x�m���0E�ӯ�/ P��օq�DLܸ�8���L����n�{&wG���$��q��$tod���j	<^��Eƣ|2Ox	$���W���Z�	�1�C���WF����j�~L8+�[݋�y�e���ú��\	�7�#����A�B��$:\��'���gc@�7zF���2��7�e� cǈ1� �Aae          �   x���K
�0 �ur����d����"�-����B��%Po/�3d�/N474?�Гn��P�(
��w�(B�}vؾ ���˺|g����O���խ[]�g~�Q�H���-�k�[˭M�Zn�.]�En1]�򮥔�U�L     