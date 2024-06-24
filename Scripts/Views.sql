CREATE OR REPLACE VIEW vw_quantidade_entrada_insumos AS
SELECT 
	insumos.nome_insumo,
	COALESCE(SUM(ipc.quantidade), 0)  AS quantidade_entrada,
	COALESCE(SUM(ipc.valor_total_item), 0)  AS valor_total_insumo
FROM
	itens_pedido_compra as ipc
	INNER JOIN insumos ON insumos.insumo_id = ipc.insumo_id
GROUP BY
	ipc.insumo_id, insumos.nome_insumo
ORDER BY
	COALESCE(SUM(ipc.valor_total_item), 0) DESC;
	
select * from vw_quantidade_entrada_insumos;


CREATE OR REPLACE VIEW vw_quantidade_saida_insumos AS
SELECT
    ins.nome_insumo,
    COALESCE(SUM(iri.quantidade), 0) AS quantidade_saida,
    COALESCE(SUM(iri.quantidade * inf.valor_unitario), 0) AS valor_total_insumo
FROM
    itens_requisicao_insumo iri
    INNER JOIN insumos ins ON ins.insumo_id = iri.insumo_id
    LEFT JOIN (
        SELECT
            inf.codigo_lote_insumo,
            inf.valor_unitario
        FROM
            itens_nf_entrada inf
        GROUP BY
            inf.codigo_lote_insumo, inf.valor_unitario
    ) AS inf ON inf.codigo_lote_insumo = iri.codigo_lote_insumo
GROUP BY
    ins.nome_insumo
ORDER BY
    valor_total_insumo DESC;
	
select * from vw_quantidade_saida_insumos;


CREATE OR REPLACE VIEW vw_quantidade_valor_insumos_fornecedor AS
SELECT
    f.nome_fornecedor,
    SUM(i.quantidade) AS quantidade_total,
    SUM(i.valor_total_item) AS valor_total
FROM
    fornecedores f
    INNER JOIN nf_entrada nf ON f.fornecedor_id = nf.fornecedor_id
    INNER JOIN itens_nf_entrada i ON nf.numero_nf_entrada = i.numero_nf_entrada
GROUP BY
    f.nome_fornecedor
ORDER BY
    valor_total DESC;
	
select * from vw_quantidade_valor_insumos_fornecedor;