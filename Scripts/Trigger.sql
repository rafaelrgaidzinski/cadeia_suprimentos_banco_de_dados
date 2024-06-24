CREATE OR REPLACE FUNCTION atualizar_quantidade_insumos()
RETURNS TRIGGER AS $$
BEGIN
    
    UPDATE insumos SET quantidade_atual = quantidade_atual + NEW.quantidade
    WHERE insumo_id = NEW.insumo_id;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_atualizar_quantidade_insumos
AFTER INSERT ON estoque_insumo
FOR EACH ROW
EXECUTE FUNCTION atualizar_quantidade_insumos();
