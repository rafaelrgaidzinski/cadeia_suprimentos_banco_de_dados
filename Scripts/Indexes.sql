CREATE INDEX idx_itens_nf_entrada_insumo_id
ON public.itens_nf_entrada (insumo_id);

CREATE INDEX idx_itens_pedido_compra_insumo_id
ON public.itens_pedido_compra (insumo_id);

CREATE INDEX idx_itens_requisicao_insumo_insumo_id
ON public.itens_requisicao_insumo (insumo_id);

SELECT indexname, indexdef FROM pg_indexes;
