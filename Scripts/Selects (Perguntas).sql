-- 1) Qual o fornecedor que provisionou a maior variedade de insumos?
SELECT fo.fornecedor_id,
	fo.nome_fornecedor, 
	COUNT(DISTINCT inf.insumo_id) as quantidade_itens
	FROM nf_entrada AS nf
	INNER JOIN fornecedores AS fo ON fo.fornecedor_id = nf.fornecedor_id
	INNER JOIN itens_nf_entrada AS inf ON inf.numero_nf_entrada = nf.numero_nf_entrada
	GROUP BY fo.fornecedor_id, fo.nome_fornecedor
	ORDER BY quantidade_itens DESC;
	
INSERT INTO public.itens_nf_entrada VALUES ('NF00000001', 3, 3, 200.00, 600.00, 'L12345', '2024-08-30', 1);
INSERT INTO public.itens_nf_entrada VALUES ('NF00000001',4, 7, 100, 700, 'L78945', '2024-11-25', 5);


-- 2) Qual foi o insumo menos atendido dos pedidos de compras?
SELECT ins.insumo_id,
	ins.nome_insumo,
	SUM(ipc.quantidade) as total
	FROM itens_pedido_compra as ipc 
	INNER JOIN insumos as ins ON ins.insumo_id = ipc.insumo_id
	WHERE ipc.status NOT IN ('Atendido')
	GROUP BY ins.insumo_id, ins.nome_insumo, ipc.insumo_id 
	ORDER BY total DESC;


-- 3) Qual usuário faz mais requisições de insumos?
SELECT us.usuario_id,
	us.nome_usuario,
	SUM(iri.quantidade) as quantidade_insumo
	FROM public.requisicao_insumo AS ri 
	INNER JOIN usuarios as us ON us.usuario_id = ri.usuario_id
	INNER JOIN itens_requisicao_insumo as iri ON iri.requisicao_id = ri.requisicao_id
	GROUP BY us.usuario_id
	ORDER BY SUM(iri.quantidade) DESC;


-- 4) Teve algum insumo do mesmo lote que foi comprado em notas fiscais diferentes?
SELECT infe.insumo_id,
	ins.nome_insumo,
	infe.codigo_lote_insumo,
	COUNT(DISTINCT infe.numero_nf_entrada) as quantidade_notas
	FROM itens_nf_entrada infe
	INNER JOIN insumos AS ins ON ins.insumo_id = infe.insumo_id
	GROUP BY infe.insumo_id, ins.nome_insumo, infe.codigo_lote_insumo
	HAVING COUNT(DISTINCT infe.numero_nf_entrada) > 1
	ORDER BY COUNT(DISTINCT infe.numero_nf_entrada) DESC;

