BEGIN;

CREATE TABLE IF NOT EXISTS public.enderecos
(
    endereco_id integer NOT NULL,
    logradouro character(50) COLLATE pg_catalog."default" NOT NULL,
    numero integer,
    bairro character(40) COLLATE pg_catalog."default" NOT NULL,
    cidade character(40) COLLATE pg_catalog."default" NOT NULL,
    estado character(20) COLLATE pg_catalog."default" NOT NULL,
    cep character(9) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT endereco_pkey PRIMARY KEY (endereco_id)
);

CREATE TABLE IF NOT EXISTS public.estoque_insumo
(
    insumo_id integer NOT NULL,
    codigo_lote_insumo character(6) COLLATE pg_catalog."default" NOT NULL,
    data_validade date NOT NULL,
    quantidade double precision NOT NULL,
    CONSTRAINT estoque_insumo_pkey PRIMARY KEY (insumo_id, codigo_lote_insumo)
);

CREATE TABLE IF NOT EXISTS public.fornecedores
(
    fornecedor_id integer NOT NULL,
    nome_fornecedor character(50) COLLATE pg_catalog."default" NOT NULL,
    cnpj_fornecedor character(18) COLLATE pg_catalog."default" NOT NULL,
    telefone character(14) COLLATE pg_catalog."default" NOT NULL,
    endereco_id integer NOT NULL,
    CONSTRAINT fornecedor_pkey PRIMARY KEY (fornecedor_id)
);

CREATE TABLE IF NOT EXISTS public.insumos
(
    insumo_id integer NOT NULL,
    nome_insumo character(50) COLLATE pg_catalog."default" NOT NULL,
    descricao text COLLATE pg_catalog."default",
    unidade character(20) COLLATE pg_catalog."default" NOT NULL,
    quantidade_atual double precision NOT NULL DEFAULT 0,
    CONSTRAINT insumos_pkey PRIMARY KEY (insumo_id)
);

CREATE TABLE IF NOT EXISTS public.itens_nf_entrada
(
    numero_nf_entrada character(44) COLLATE pg_catalog."default" NOT NULL,
    numero_item integer NOT NULL,
    quantidade double precision NOT NULL,
    valor_unitario double precision NOT NULL,
    valor_total_item double precision NOT NULL,
    codigo_lote_insumo character(6) COLLATE pg_catalog."default" NOT NULL,
    data_validade date NOT NULL,
    insumo_id integer NOT NULL,
    CONSTRAINT itens_nf_entrada_pkey PRIMARY KEY (numero_nf_entrada, numero_item)
);

CREATE TABLE IF NOT EXISTS public.itens_nf_servico
(
    numero_nf_servico character(44) COLLATE pg_catalog."default" NOT NULL,
    numero_item integer NOT NULL,
    valor_total double precision NOT NULL,
    servico_id integer NOT NULL,
    CONSTRAINT itens_nf_servico_pkey PRIMARY KEY (numero_nf_servico, numero_item)
);

CREATE TABLE IF NOT EXISTS public.itens_pedido_compra
(
    pedido_compra_id integer NOT NULL,
    numero_item integer NOT NULL,
    quantidade double precision NOT NULL,
    valor_unitario double precision NOT NULL,
    valor_total_item double precision NOT NULL,
    status character(10) COLLATE pg_catalog."default" NOT NULL,
    insumo_id integer NOT NULL,
    CONSTRAINT itens_pedido_compra_pkey PRIMARY KEY (pedido_compra_id, numero_item)
);

CREATE TABLE IF NOT EXISTS public.itens_requisicao_insumo
(
    requisicao_id integer NOT NULL,
    insumo_id integer NOT NULL,
    codigo_lote_insumo character(6) COLLATE pg_catalog."default" NOT NULL,
    quantidade double precision NOT NULL,
    status character(10) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT itens_requisicao_pkey PRIMARY KEY (requisicao_id, insumo_id, codigo_lote_insumo)
);

CREATE TABLE IF NOT EXISTS public.nf_entrada
(
    numero_nf_entrada character(44) COLLATE pg_catalog."default" NOT NULL,
    serie_nf character(6) COLLATE pg_catalog."default" NOT NULL,
    valor_total_nota double precision NOT NULL DEFAULT 0,
    data_emissao date NOT NULL,
    data_cadastro date NOT NULL,
    fornecedor_id integer NOT NULL,
    CONSTRAINT nf_entrada_pkey PRIMARY KEY (numero_nf_entrada)
);

CREATE TABLE IF NOT EXISTS public.nf_servico
(
    numero_nf_servico character(44) COLLATE pg_catalog."default" NOT NULL,
    serie_nf character(6) COLLATE pg_catalog."default" NOT NULL,
    valor_total_nota double precision NOT NULL DEFAULT 0,
    data_emissao date NOT NULL,
    data_cadastro date NOT NULL,
    fornecedor_id integer NOT NULL,
    CONSTRAINT nf_servico_pkey PRIMARY KEY (numero_nf_servico)
);

CREATE TABLE IF NOT EXISTS public.pedido_compra
(
    pedido_compra_id integer NOT NULL,
    valor_total_pedido double precision NOT NULL DEFAULT 0,
    data_pedido date NOT NULL,
    data_conclusao date,
    observacao text COLLATE pg_catalog."default",
    fornecedor_id integer NOT NULL,
    CONSTRAINT pedido_compra_pkey PRIMARY KEY (pedido_compra_id)
);

CREATE TABLE IF NOT EXISTS public.requisicao_insumo
(
    requisicao_id integer NOT NULL,
    data_requisicao date NOT NULL,
    data_conclusao date,
    usuario_id integer NOT NULL,
    CONSTRAINT requisicao_insumo_pkey PRIMARY KEY (requisicao_id)
);

CREATE TABLE IF NOT EXISTS public.servicos
(
    servico_id integer NOT NULL,
    nome_servico character(50) COLLATE pg_catalog."default" NOT NULL,
    descricao text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT servicos_pkey PRIMARY KEY (servico_id)
);

CREATE TABLE IF NOT EXISTS public.usuarios
(
    usuario_id integer NOT NULL,
    nome_usuario character(50) COLLATE pg_catalog."default" NOT NULL,
    cpf character(14) COLLATE pg_catalog."default" NOT NULL,
    cargo character(30) COLLATE pg_catalog."default" NOT NULL,
    telefone character(14) COLLATE pg_catalog."default" NOT NULL,
    endereco_id integer NOT NULL,
    CONSTRAINT usuario_pkey PRIMARY KEY (usuario_id)
);

ALTER TABLE IF EXISTS public.estoque_insumo
    ADD CONSTRAINT fk_estoque_insumo_insumo FOREIGN KEY (insumo_id)
    REFERENCES public.insumos (insumo_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.fornecedores
    ADD CONSTRAINT fk_fornecedor_endereco FOREIGN KEY (endereco_id)
    REFERENCES public.enderecos (endereco_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
	
	
ALTER TABLE IF EXISTS public.insumos
	ADD CONSTRAINT ck_unidade CHECK (unidade in ('kg','litros'));


ALTER TABLE IF EXISTS public.itens_nf_entrada
    ADD CONSTRAINT fk_itens_nf_entrada_insumo FOREIGN KEY (insumo_id)
    REFERENCES public.insumos (insumo_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.itens_nf_entrada
    ADD CONSTRAINT fk_itens_nf_entrada_nf_entrada FOREIGN KEY (numero_nf_entrada)
    REFERENCES public.nf_entrada (numero_nf_entrada) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.itens_nf_servico
    ADD CONSTRAINT fk_itens_nf_servico_nf_servico FOREIGN KEY (numero_nf_servico)
    REFERENCES public.nf_servico (numero_nf_servico) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.itens_nf_servico
    ADD CONSTRAINT fk_itens_nf_servico_servico FOREIGN KEY (servico_id)
    REFERENCES public.servicos (servico_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.itens_pedido_compra
    ADD CONSTRAINT fk_itens_pedido_compra_insumo FOREIGN KEY (insumo_id)
    REFERENCES public.insumos (insumo_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.itens_pedido_compra
    ADD CONSTRAINT fk_itens_pedido_compra_pedido_compra FOREIGN KEY (pedido_compra_id)
    REFERENCES public.pedido_compra (pedido_compra_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.itens_pedido_compra
	ADD CONSTRAINT ck_status CHECK (status in ('Aberto','Atendido','Cancelado'));


ALTER TABLE IF EXISTS public.itens_requisicao_insumo
    ADD CONSTRAINT fk_itens_requisicao_insumo_estoque_insumo FOREIGN KEY (insumo_id, codigo_lote_insumo)
    REFERENCES public.estoque_insumo (insumo_id, codigo_lote_insumo) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.itens_requisicao_insumo
    ADD CONSTRAINT fk_itens_requisicao_insumo_requisicao_insumo FOREIGN KEY (requisicao_id)
    REFERENCES public.requisicao_insumo (requisicao_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS public.itens_requisicao_insumo
    ADD CONSTRAINT ck_status CHECK (status in ('Aberto','Atendido','Cancelado'));

ALTER TABLE IF EXISTS public.nf_entrada
    ADD CONSTRAINT fk_nf_entrada_fornecedor FOREIGN KEY (fornecedor_id)
    REFERENCES public.fornecedores (fornecedor_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.nf_servico
    ADD CONSTRAINT fk_nf_servico_fornecedor FOREIGN KEY (fornecedor_id)
    REFERENCES public.fornecedores (fornecedor_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.pedido_compra
    ADD CONSTRAINT fk_pedido_compra_fornecedor FOREIGN KEY (fornecedor_id)
    REFERENCES public.fornecedores (fornecedor_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.requisicao_insumo
    ADD CONSTRAINT fk_requisicao_insumo_usuario FOREIGN KEY (usuario_id)
    REFERENCES public.usuarios (usuario_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.usuarios
    ADD CONSTRAINT fk_usuario_endereco FOREIGN KEY (endereco_id)
    REFERENCES public.enderecos (endereco_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;