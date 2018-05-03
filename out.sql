PGDMP                         v           chews_it    10.3    10.3     �
           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �
           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �
           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            �
           1262    25068    chews_it    DATABASE     �   CREATE DATABASE chews_it WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE chews_it;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �
           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    6            �
           0    0    SCHEMA public    ACL     &   GRANT ALL ON SCHEMA public TO PUBLIC;
                  postgres    false    6                        3079    12924    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �
           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    25305 	   favorites    TABLE     e   CREATE TABLE public.favorites (
    yelp_id character varying(255),
    users_id integer NOT NULL
);
    DROP TABLE public.favorites;
       public         postgres    false    6            �            1259    25286    users    TABLE     �   CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    pin character varying(10) NOT NULL,
    preferences text
);
    DROP TABLE public.users;
       public         postgres    false    6            �            1259    25284    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public       postgres    false    6    197            �
           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
            public       postgres    false    196            s
           2604    25289    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    197    196    197            �
          0    25305 	   favorites 
   TABLE DATA               6   COPY public.favorites (yelp_id, users_id) FROM stdin;
    public       postgres    false    198   /       �
          0    25286    users 
   TABLE DATA               ;   COPY public.users (id, name, pin, preferences) FROM stdin;
    public       postgres    false    197   e       �
           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 8, true);
            public       postgres    false    196            u
           2606    25293    users users_name_key 
   CONSTRAINT     O   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key UNIQUE (name);
 >   ALTER TABLE ONLY public.users DROP CONSTRAINT users_name_key;
       public         postgres    false    197            w
           2606    25291    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public         postgres    false    197            x
           2606    25308 !   favorites favorites_users_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_users_id_fkey FOREIGN KEY (users_id) REFERENCES public.users(id);
 K   ALTER TABLE ONLY public.favorites DROP CONSTRAINT favorites_users_id_fkey;
       public       postgres    false    2679    198    197            �
   &   x�O,+�IIK	0K�H�
)Ir
�)�4����� ���      �
   @   x�3��*MI�P�H�K/��4426���2��J-.N�4111匎����9͌LM@1z\\\ �B     