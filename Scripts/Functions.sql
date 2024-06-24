CREATE OR REPLACE FUNCTION alterar_status_item_requisicao_para_atendido(id_requisicao integer,
																   id_insumo integer, 
																   lote_insumo "varchar")
RETURNS VOID AS $$
DECLARE status_item varchar(10);
DECLARE quantidade_item float;
BEGIN
	
	SELECT status INTO status_item FROM itens_requisicao_insumo
	WHERE requisicao_id = id_requisicao AND insumo_id = id_insumo AND codigo_lote_insumo = lote_insumo;
	
	if (status_item = 'Aberto') then
    	UPDATE itens_requisicao_insumo SET status = 'Atendido'
    	WHERE requisicao_id = id_requisicao AND insumo_id = id_insumo AND codigo_lote_insumo = lote_insumo; 
		
		SELECT quantidade INTO quantidade_item FROM itens_requisicao_insumo
		WHERE requisicao_id = id_requisicao AND insumo_id = id_insumo AND codigo_lote_insumo = lote_insumo;
		
		UPDATE estoque_insumo SET quantidade = quantidade - quantidade_item
		WHERE insumo_id = id_insumo AND codigo_lote_insumo = lote_insumo; 
    end if;
	  
END;
$$ LANGUAGE plpgsql;

select alterar_status_item_requisicao_para_atendido(1, 2, 'L23456');


CREATE OR REPLACE FUNCTION alterar_status_item_pedido_compra_para_atendido(id_pedido_compra integer,
																   item_numero integer,
																   lote_insumo "varchar",
																   data_validade date)
RETURNS VOID AS $$
DECLARE status_item varchar(10);
DECLARE quantidade_item float;
DECLARE id_insumo integer;
DECLARE quantidade_estoque float;
BEGIN
	
	SELECT status INTO status_item FROM itens_pedido_compra
	WHERE pedido_compra_id = id_pedido_compra AND numero_item = item_numero;
	
	if (status_item = 'Aberto') then
    	UPDATE itens_pedido_compra SET status = 'Atendido'
    	WHERE pedido_compra_id = id_pedido_compra AND numero_item = item_numero; 
		
		SELECT quantidade INTO quantidade_item FROM itens_pedido_compra
		WHERE pedido_compra_id = id_pedido_compra AND numero_item = item_numero;
		
		SELECT insumo_id INTO id_insumo FROM itens_pedido_compra
		WHERE pedido_compra_id = id_pedido_compra AND numero_item = item_numero; 
		
		SELECT quantidade INTO quantidade_estoque FROM estoque_insumo
		WHERE insumo_id = id_insumo and codigo_lote_insumo = lote_insumo;
		
		if (quantidade_estoque > 0) then
			UPDATE estoque_insumo SET quantidade = quantidade + quantidade_item
			WHERE insumo_id = id_insumo AND codigo_lote_insumo = lote_insumo;
		else
			INSERT INTO estoque_insumo VALUES (id_insumo, lote_insumo, data_validade, quantidade_item);
		end if;
		PERFORM concluir_pedido(id_pedido_compra);
    end if;  
END;
$$ LANGUAGE plpgsql;

select alterar_status_item_pedido_compra_para_atendido(7, 1, 'L12345', '2024-10-25');
select alterar_status_item_pedido_compra_para_atendido(2, 1, 'L54896', '2024-06-23');


CREATE OR REPLACE FUNCTION concluir_pedido(id_pedido_compra integer)
RETURNS VOID AS $$
DECLARE
    tem_item_aberto boolean;
BEGIN
   
    SELECT EXISTS (
        SELECT 1
        FROM itens_pedido_compra
        WHERE pedido_compra_id = id_pedido_compra
          AND status = 'Aberto'
    ) INTO tem_item_aberto;

    if (NOT tem_item_aberto) then
        UPDATE pedido_compra
        SET data_conclusao = current_date
        WHERE pedido_compra_id = id_pedido_compra;
    end if;
END;
$$ LANGUAGE plpgsql;

select concluir_pedido(2);
select alterar_status_item_pedido_compra_para_atendido(4, 1, 'L98754', '2024-06-23');