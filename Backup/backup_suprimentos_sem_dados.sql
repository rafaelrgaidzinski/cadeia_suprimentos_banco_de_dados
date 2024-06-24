PGDMP  "                    |            suprimentos    16.2    16.2 =    T           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            U           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            V           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            W           1262    19100    suprimentos    DATABASE     �   CREATE DATABASE suprimentos WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE suprimentos;
                postgres    false            �            1259    19101 	   enderecos    TABLE       CREATE TABLE public.enderecos (
    endereco_id integer NOT NULL,
    logradouro character(50) NOT NULL,
    numero integer,
    bairro character(40) NOT NULL,
    cidade character(40) NOT NULL,
    estado character(20) NOT NULL,
    cep character(9) NOT NULL
);
    DROP TABLE public.enderecos;
       public         heap    postgres    false            �            1259    19106    estoque_insumo    TABLE     �   CREATE TABLE public.estoque_insumo (
    insumo_id integer NOT NULL,
    codigo_lote_insumo character(6) NOT NULL,
    data_validade date NOT NULL,
    quantidade double precision NOT NULL
);
 "   DROP TABLE public.estoque_insumo;
       public         heap    postgres    false            �            1259    19111    fornecedores    TABLE     �   CREATE TABLE public.fornecedores (
    fornecedor_id integer NOT NULL,
    nome_fornecedor character(50) NOT NULL,
    cnpj_fornecedor character(18) NOT NULL,
    telefone character(14) NOT NULL,
    endereco_id integer NOT NULL
);
     DROP TABLE public.fornecedores;
       public         heap    postgres    false            �            1259    19116    insumos    TABLE     5  CREATE TABLE public.insumos (
    insumo_id integer NOT NULL,
    nome_insumo character(50) NOT NULL,
    descricao text,
    unidade character(20) NOT NULL,
    quantidade_atual double precision DEFAULT 0 NOT NULL,
    CONSTRAINT ck_unidade CHECK ((unidade = ANY (ARRAY['kg'::bpchar, 'litros'::bpchar])))
);
    DROP TABLE public.insumos;
       public         heap    postgres    false            �            1259    19124    itens_nf_entrada    TABLE     p  CREATE TABLE public.itens_nf_entrada (
    numero_nf_entrada character(44) NOT NULL,
    numero_item integer NOT NULL,
    quantidade double precision NOT NULL,
    valor_unitario double precision NOT NULL,
    valor_total_item double precision NOT NULL,
    codigo_lote_insumo character(6) NOT NULL,
    data_validade date NOT NULL,
    insumo_id integer NOT NULL
);
 $   DROP TABLE public.itens_nf_entrada;
       public         heap    postgres    false            �            1259    19129    itens_nf_servico    TABLE     �   CREATE TABLE public.itens_nf_servico (
    numero_nf_servico character(44) NOT NULL,
    numero_item integer NOT NULL,
    valor_total double precision NOT NULL,
    servico_id integer NOT NULL
);
 $   DROP TABLE public.itens_nf_servico;
       public         heap    postgres    false            �            1259    19134    itens_pedido_compra    TABLE     �  CREATE TABLE public.itens_pedido_compra (
    pedido_compra_id integer NOT NULL,
    numero_item integer NOT NULL,
    quantidade double precision NOT NULL,
    valor_unitario double precision NOT NULL,
    valor_total_item double precision NOT NULL,
    status character(10) NOT NULL,
    insumo_id integer NOT NULL,
    CONSTRAINT ck_status CHECK ((status = ANY (ARRAY['Aberto'::bpchar, 'Atendido'::bpchar, 'Cancelado'::bpchar])))
);
 '   DROP TABLE public.itens_pedido_compra;
       public         heap    postgres    false            �            1259    19139    itens_requisicao_insumo    TABLE     c  CREATE TABLE public.itens_requisicao_insumo (
    requisicao_id integer NOT NULL,
    insumo_id integer NOT NULL,
    codigo_lote_insumo character(6) NOT NULL,
    quantidade double precision NOT NULL,
    status character(10) NOT NULL,
    CONSTRAINT ck_status CHECK ((status = ANY (ARRAY['Aberto'::bpchar, 'Atendido'::bpchar, 'Cancelado'::bpchar])))
);
 +   DROP TABLE public.itens_requisicao_insumo;
       public         heap    postgres    false            �            1259    19144 
   nf_entrada    TABLE       CREATE TABLE public.nf_entrada (
    numero_nf_entrada character(44) NOT NULL,
    serie_nf character(6) NOT NULL,
    valor_total_nota double precision DEFAULT 0 NOT NULL,
    data_emissao date NOT NULL,
    data_cadastro date NOT NULL,
    fornecedor_id integer NOT NULL
);
    DROP TABLE public.nf_entrada;
       public         heap    postgres    false            �            1259    19150 
   nf_servico    TABLE       CREATE TABLE public.nf_servico (
    numero_nf_servico character(44) NOT NULL,
    serie_nf character(6) NOT NULL,
    valor_total_nota double precision DEFAULT 0 NOT NULL,
    data_emissao date NOT NULL,
    data_cadastro date NOT NULL,
    fornecedor_id integer NOT NULL
);
    DROP TABLE public.nf_servico;
       public         heap    postgres    false            �            1259    19156    pedido_compra    TABLE     �   CREATE TABLE public.pedido_compra (
    pedido_compra_id integer NOT NULL,
    valor_total_pedido double precision DEFAULT 0 NOT NULL,
    data_pedido date NOT NULL,
    data_conclusao date,
    observacao text,
    fornecedor_id integer NOT NULL
);
 !   DROP TABLE public.pedido_compra;
       public         heap    postgres    false            �            1259    19164    requisicao_insumo    TABLE     �   CREATE TABLE public.requisicao_insumo (
    requisicao_id integer NOT NULL,
    data_requisicao date NOT NULL,
    data_conclusao date,
    usuario_id integer NOT NULL
);
 %   DROP TABLE public.requisicao_insumo;
       public         heap    postgres    false            �            1259    19169    servicos    TABLE     �   CREATE TABLE public.servicos (
    servico_id integer NOT NULL,
    nome_servico character(50) NOT NULL,
    descricao text NOT NULL
);
    DROP TABLE public.servicos;
       public         heap    postgres    false            �            1259    19176    usuarios    TABLE     �   CREATE TABLE public.usuarios (
    usuario_id integer NOT NULL,
    nome_usuario character(50) NOT NULL,
    cpf character(14) NOT NULL,
    cargo character(30) NOT NULL,
    telefone character(14) NOT NULL,
    endereco_id integer NOT NULL
);
    DROP TABLE public.usuarios;
       public         heap    postgres    false            D          0    19101 	   enderecos 
   TABLE DATA           a   COPY public.enderecos (endereco_id, logradouro, numero, bairro, cidade, estado, cep) FROM stdin;
    public          postgres    false    215   yW       E          0    19106    estoque_insumo 
   TABLE DATA           b   COPY public.estoque_insumo (insumo_id, codigo_lote_insumo, data_validade, quantidade) FROM stdin;
    public          postgres    false    216   �W       F          0    19111    fornecedores 
   TABLE DATA           n   COPY public.fornecedores (fornecedor_id, nome_fornecedor, cnpj_fornecedor, telefone, endereco_id) FROM stdin;
    public          postgres    false    217   �W       G          0    19116    insumos 
   TABLE DATA           _   COPY public.insumos (insumo_id, nome_insumo, descricao, unidade, quantidade_atual) FROM stdin;
    public          postgres    false    218   �W       H          0    19124    itens_nf_entrada 
   TABLE DATA           �   COPY public.itens_nf_entrada (numero_nf_entrada, numero_item, quantidade, valor_unitario, valor_total_item, codigo_lote_insumo, data_validade, insumo_id) FROM stdin;
    public          postgres    false    219   �W       I          0    19129    itens_nf_servico 
   TABLE DATA           c   COPY public.itens_nf_servico (numero_nf_servico, numero_item, valor_total, servico_id) FROM stdin;
    public          postgres    false    220   
X       J          0    19134    itens_pedido_compra 
   TABLE DATA           �   COPY public.itens_pedido_compra (pedido_compra_id, numero_item, quantidade, valor_unitario, valor_total_item, status, insumo_id) FROM stdin;
    public          postgres    false    221   'X       K          0    19139    itens_requisicao_insumo 
   TABLE DATA           s   COPY public.itens_requisicao_insumo (requisicao_id, insumo_id, codigo_lote_insumo, quantidade, status) FROM stdin;
    public          postgres    false    222   DX       L          0    19144 
   nf_entrada 
   TABLE DATA              COPY public.nf_entrada (numero_nf_entrada, serie_nf, valor_total_nota, data_emissao, data_cadastro, fornecedor_id) FROM stdin;
    public          postgres    false    223   aX       M          0    19150 
   nf_servico 
   TABLE DATA              COPY public.nf_servico (numero_nf_servico, serie_nf, valor_total_nota, data_emissao, data_cadastro, fornecedor_id) FROM stdin;
    public          postgres    false    224   ~X       N          0    19156    pedido_compra 
   TABLE DATA           �   COPY public.pedido_compra (pedido_compra_id, valor_total_pedido, data_pedido, data_conclusao, observacao, fornecedor_id) FROM stdin;
    public          postgres    false    225   �X       O          0    19164    requisicao_insumo 
   TABLE DATA           g   COPY public.requisicao_insumo (requisicao_id, data_requisicao, data_conclusao, usuario_id) FROM stdin;
    public          postgres    false    226   �X       P          0    19169    servicos 
   TABLE DATA           G   COPY public.servicos (servico_id, nome_servico, descricao) FROM stdin;
    public          postgres    false    227   �X       Q          0    19176    usuarios 
   TABLE DATA           _   COPY public.usuarios (usuario_id, nome_usuario, cpf, cargo, telefone, endereco_id) FROM stdin;
    public          postgres    false    228   �X       �           2606    19105    enderecos endereco_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.enderecos
    ADD CONSTRAINT endereco_pkey PRIMARY KEY (endereco_id);
 A   ALTER TABLE ONLY public.enderecos DROP CONSTRAINT endereco_pkey;
       public            postgres    false    215            �           2606    19110 "   estoque_insumo estoque_insumo_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY public.estoque_insumo
    ADD CONSTRAINT estoque_insumo_pkey PRIMARY KEY (insumo_id, codigo_lote_insumo);
 L   ALTER TABLE ONLY public.estoque_insumo DROP CONSTRAINT estoque_insumo_pkey;
       public            postgres    false    216    216            �           2606    19115    fornecedores fornecedor_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.fornecedores
    ADD CONSTRAINT fornecedor_pkey PRIMARY KEY (fornecedor_id);
 F   ALTER TABLE ONLY public.fornecedores DROP CONSTRAINT fornecedor_pkey;
       public            postgres    false    217            �           2606    19123    insumos insumos_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.insumos
    ADD CONSTRAINT insumos_pkey PRIMARY KEY (insumo_id);
 >   ALTER TABLE ONLY public.insumos DROP CONSTRAINT insumos_pkey;
       public            postgres    false    218            �           2606    19128 &   itens_nf_entrada itens_nf_entrada_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.itens_nf_entrada
    ADD CONSTRAINT itens_nf_entrada_pkey PRIMARY KEY (numero_nf_entrada, numero_item);
 P   ALTER TABLE ONLY public.itens_nf_entrada DROP CONSTRAINT itens_nf_entrada_pkey;
       public            postgres    false    219    219            �           2606    19133 &   itens_nf_servico itens_nf_servico_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.itens_nf_servico
    ADD CONSTRAINT itens_nf_servico_pkey PRIMARY KEY (numero_nf_servico, numero_item);
 P   ALTER TABLE ONLY public.itens_nf_servico DROP CONSTRAINT itens_nf_servico_pkey;
       public            postgres    false    220    220            �           2606    19138 ,   itens_pedido_compra itens_pedido_compra_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.itens_pedido_compra
    ADD CONSTRAINT itens_pedido_compra_pkey PRIMARY KEY (pedido_compra_id, numero_item);
 V   ALTER TABLE ONLY public.itens_pedido_compra DROP CONSTRAINT itens_pedido_compra_pkey;
       public            postgres    false    221    221            �           2606    19143 -   itens_requisicao_insumo itens_requisicao_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.itens_requisicao_insumo
    ADD CONSTRAINT itens_requisicao_pkey PRIMARY KEY (requisicao_id, insumo_id, codigo_lote_insumo);
 W   ALTER TABLE ONLY public.itens_requisicao_insumo DROP CONSTRAINT itens_requisicao_pkey;
       public            postgres    false    222    222    222            �           2606    19149    nf_entrada nf_entrada_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.nf_entrada
    ADD CONSTRAINT nf_entrada_pkey PRIMARY KEY (numero_nf_entrada);
 D   ALTER TABLE ONLY public.nf_entrada DROP CONSTRAINT nf_entrada_pkey;
       public            postgres    false    223            �           2606    19155    nf_servico nf_servico_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.nf_servico
    ADD CONSTRAINT nf_servico_pkey PRIMARY KEY (numero_nf_servico);
 D   ALTER TABLE ONLY public.nf_servico DROP CONSTRAINT nf_servico_pkey;
       public            postgres    false    224            �           2606    19163     pedido_compra pedido_compra_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.pedido_compra
    ADD CONSTRAINT pedido_compra_pkey PRIMARY KEY (pedido_compra_id);
 J   ALTER TABLE ONLY public.pedido_compra DROP CONSTRAINT pedido_compra_pkey;
       public            postgres    false    225            �           2606    19168 (   requisicao_insumo requisicao_insumo_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.requisicao_insumo
    ADD CONSTRAINT requisicao_insumo_pkey PRIMARY KEY (requisicao_id);
 R   ALTER TABLE ONLY public.requisicao_insumo DROP CONSTRAINT requisicao_insumo_pkey;
       public            postgres    false    226            �           2606    19175    servicos servicos_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.servicos
    ADD CONSTRAINT servicos_pkey PRIMARY KEY (servico_id);
 @   ALTER TABLE ONLY public.servicos DROP CONSTRAINT servicos_pkey;
       public            postgres    false    227            �           2606    19180    usuarios usuario_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (usuario_id);
 ?   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuario_pkey;
       public            postgres    false    228            �           2606    19181 '   estoque_insumo fk_estoque_insumo_insumo    FK CONSTRAINT     �   ALTER TABLE ONLY public.estoque_insumo
    ADD CONSTRAINT fk_estoque_insumo_insumo FOREIGN KEY (insumo_id) REFERENCES public.insumos(insumo_id);
 Q   ALTER TABLE ONLY public.estoque_insumo DROP CONSTRAINT fk_estoque_insumo_insumo;
       public          postgres    false    218    216    4753            �           2606    19186 #   fornecedores fk_fornecedor_endereco    FK CONSTRAINT     �   ALTER TABLE ONLY public.fornecedores
    ADD CONSTRAINT fk_fornecedor_endereco FOREIGN KEY (endereco_id) REFERENCES public.enderecos(endereco_id) NOT VALID;
 M   ALTER TABLE ONLY public.fornecedores DROP CONSTRAINT fk_fornecedor_endereco;
       public          postgres    false    215    217    4747            �           2606    19192 +   itens_nf_entrada fk_itens_nf_entrada_insumo    FK CONSTRAINT     �   ALTER TABLE ONLY public.itens_nf_entrada
    ADD CONSTRAINT fk_itens_nf_entrada_insumo FOREIGN KEY (insumo_id) REFERENCES public.insumos(insumo_id) NOT VALID;
 U   ALTER TABLE ONLY public.itens_nf_entrada DROP CONSTRAINT fk_itens_nf_entrada_insumo;
       public          postgres    false    218    4753    219            �           2606    19197 /   itens_nf_entrada fk_itens_nf_entrada_nf_entrada    FK CONSTRAINT     �   ALTER TABLE ONLY public.itens_nf_entrada
    ADD CONSTRAINT fk_itens_nf_entrada_nf_entrada FOREIGN KEY (numero_nf_entrada) REFERENCES public.nf_entrada(numero_nf_entrada) NOT VALID;
 Y   ALTER TABLE ONLY public.itens_nf_entrada DROP CONSTRAINT fk_itens_nf_entrada_nf_entrada;
       public          postgres    false    223    4763    219            �           2606    19202 /   itens_nf_servico fk_itens_nf_servico_nf_servico    FK CONSTRAINT     �   ALTER TABLE ONLY public.itens_nf_servico
    ADD CONSTRAINT fk_itens_nf_servico_nf_servico FOREIGN KEY (numero_nf_servico) REFERENCES public.nf_servico(numero_nf_servico);
 Y   ALTER TABLE ONLY public.itens_nf_servico DROP CONSTRAINT fk_itens_nf_servico_nf_servico;
       public          postgres    false    224    4765    220            �           2606    19207 ,   itens_nf_servico fk_itens_nf_servico_servico    FK CONSTRAINT     �   ALTER TABLE ONLY public.itens_nf_servico
    ADD CONSTRAINT fk_itens_nf_servico_servico FOREIGN KEY (servico_id) REFERENCES public.servicos(servico_id);
 V   ALTER TABLE ONLY public.itens_nf_servico DROP CONSTRAINT fk_itens_nf_servico_servico;
       public          postgres    false    220    227    4771            �           2606    19212 1   itens_pedido_compra fk_itens_pedido_compra_insumo    FK CONSTRAINT     �   ALTER TABLE ONLY public.itens_pedido_compra
    ADD CONSTRAINT fk_itens_pedido_compra_insumo FOREIGN KEY (insumo_id) REFERENCES public.insumos(insumo_id) NOT VALID;
 [   ALTER TABLE ONLY public.itens_pedido_compra DROP CONSTRAINT fk_itens_pedido_compra_insumo;
       public          postgres    false    218    221    4753            �           2606    19217 8   itens_pedido_compra fk_itens_pedido_compra_pedido_compra    FK CONSTRAINT     �   ALTER TABLE ONLY public.itens_pedido_compra
    ADD CONSTRAINT fk_itens_pedido_compra_pedido_compra FOREIGN KEY (pedido_compra_id) REFERENCES public.pedido_compra(pedido_compra_id);
 b   ALTER TABLE ONLY public.itens_pedido_compra DROP CONSTRAINT fk_itens_pedido_compra_pedido_compra;
       public          postgres    false    221    4767    225            �           2606    19223 A   itens_requisicao_insumo fk_itens_requisicao_insumo_estoque_insumo    FK CONSTRAINT     �   ALTER TABLE ONLY public.itens_requisicao_insumo
    ADD CONSTRAINT fk_itens_requisicao_insumo_estoque_insumo FOREIGN KEY (insumo_id, codigo_lote_insumo) REFERENCES public.estoque_insumo(insumo_id, codigo_lote_insumo) NOT VALID;
 k   ALTER TABLE ONLY public.itens_requisicao_insumo DROP CONSTRAINT fk_itens_requisicao_insumo_estoque_insumo;
       public          postgres    false    216    216    4749    222    222            �           2606    19228 D   itens_requisicao_insumo fk_itens_requisicao_insumo_requisicao_insumo    FK CONSTRAINT     �   ALTER TABLE ONLY public.itens_requisicao_insumo
    ADD CONSTRAINT fk_itens_requisicao_insumo_requisicao_insumo FOREIGN KEY (requisicao_id) REFERENCES public.requisicao_insumo(requisicao_id) NOT VALID;
 n   ALTER TABLE ONLY public.itens_requisicao_insumo DROP CONSTRAINT fk_itens_requisicao_insumo_requisicao_insumo;
       public          postgres    false    226    222    4769            �           2606    19234 #   nf_entrada fk_nf_entrada_fornecedor    FK CONSTRAINT     �   ALTER TABLE ONLY public.nf_entrada
    ADD CONSTRAINT fk_nf_entrada_fornecedor FOREIGN KEY (fornecedor_id) REFERENCES public.fornecedores(fornecedor_id) NOT VALID;
 M   ALTER TABLE ONLY public.nf_entrada DROP CONSTRAINT fk_nf_entrada_fornecedor;
       public          postgres    false    223    4751    217            �           2606    19239 #   nf_servico fk_nf_servico_fornecedor    FK CONSTRAINT     �   ALTER TABLE ONLY public.nf_servico
    ADD CONSTRAINT fk_nf_servico_fornecedor FOREIGN KEY (fornecedor_id) REFERENCES public.fornecedores(fornecedor_id);
 M   ALTER TABLE ONLY public.nf_servico DROP CONSTRAINT fk_nf_servico_fornecedor;
       public          postgres    false    224    4751    217            �           2606    19244 )   pedido_compra fk_pedido_compra_fornecedor    FK CONSTRAINT     �   ALTER TABLE ONLY public.pedido_compra
    ADD CONSTRAINT fk_pedido_compra_fornecedor FOREIGN KEY (fornecedor_id) REFERENCES public.fornecedores(fornecedor_id) NOT VALID;
 S   ALTER TABLE ONLY public.pedido_compra DROP CONSTRAINT fk_pedido_compra_fornecedor;
       public          postgres    false    225    4751    217            �           2606    19249 .   requisicao_insumo fk_requisicao_insumo_usuario    FK CONSTRAINT     �   ALTER TABLE ONLY public.requisicao_insumo
    ADD CONSTRAINT fk_requisicao_insumo_usuario FOREIGN KEY (usuario_id) REFERENCES public.usuarios(usuario_id) NOT VALID;
 X   ALTER TABLE ONLY public.requisicao_insumo DROP CONSTRAINT fk_requisicao_insumo_usuario;
       public          postgres    false    4773    226    228            �           2606    19254    usuarios fk_usuario_endereco    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT fk_usuario_endereco FOREIGN KEY (endereco_id) REFERENCES public.enderecos(endereco_id) NOT VALID;
 F   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT fk_usuario_endereco;
       public          postgres    false    215    228    4747            D      x������ � �      E      x������ � �      F      x������ � �      G      x������ � �      H      x������ � �      I      x������ � �      J      x������ � �      K      x������ � �      L      x������ � �      M      x������ � �      N      x������ � �      O      x������ � �      P      x������ � �      Q      x������ � �     