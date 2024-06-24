INSERT INTO public.enderecos (endereco_id, logradouro, numero, bairro, cidade, estado, cep)
VALUES
(1, 'Rua das Flores', 100, 'Centro', 'Florianópolis', 'SC', '88000-001'),
(2, 'Avenida Brasil', 500, 'Jardins', 'Joinville', 'SC', '89200-000'),
(3, 'Rua do Comércio', 300, 'Centro', 'Blumenau', 'SC', '89010-000'),
(4, 'Rua das Palmeiras', 200, 'Boa Vista', 'Chapecó', 'SC', '89810-000'),
(5, 'Avenida Principal', 700, 'Industrial', 'Criciúma', 'SC', '88800-000'),
(6, 'Rua das Acácias', 50, 'Jardim América', 'Lages', 'SC', '88500-000'),
(7, 'Rua dos Ipês', 150, 'Centro', 'Itajaí', 'SC', '88300-000'),
(8, 'Avenida Central', 800, 'Centro', 'Jaraguá do Sul', 'SC', '89250-000'),
(9, 'Travessa das Oliveiras', 20, 'Mangabeira', 'Balneário Camboriú', 'SC', '88330-000'),
(10, 'Alameda das Rosas', 300, 'Aldeota', 'São José', 'SC', '88101-000'),
(11, 'Rua das Violetas', 80, 'Jardim das Flores', 'Palhoça', 'SC', '88130-000'),
(12, 'Avenida dos Eucaliptos', 600, 'Jardim Europa', 'Itapema', 'SC', '88220-000'),
(13, 'Rua da Praia', 1, 'Centro', 'Florianópolis', 'SC', '88015-120'),
(14, 'Rua das Gaivotas', 221, 'Barra Sul', 'Balneário Camboriú', 'SC', '88330-560'),
(15, 'Avenida das Palmeiras', 1500, 'Pioneiros', 'Itajaí', 'SC', '88301-800'),
(16, 'Rua dos Girassóis', 700, 'Centro', 'Joinville', 'SC', '89201-001'),
(17, 'Alameda das Acácias', 123, 'Lagoa', 'Florianópolis', 'SC', '88062-210'),
(18, 'Avenida das Flores', 800, 'Centro', 'Chapecó', 'SC', '89801-000'),
(19, 'Travessa das Hortênsias', 50, 'Estrela do Mar', 'Bombinhas', 'SC', '88215-000'),
(20, 'Rua das Magnólias', 300, 'Jurerê Internacional', 'Florianópolis', 'SC', '88053-000');

INSERT INTO public.usuarios (usuario_id, nome_usuario, cpf, cargo, telefone, endereco_id) VALUES
(1, 'Ana Silva', '123.456.789-00', 'Analista de Compras', '(11)9876-5432', 1),
(2, 'Carlos Santos', '987.654.321-00', 'Assistente de Compras', '(22)8765-4321', 2),
(3, 'Maria Oliveira', '234.567.890-00', 'Coordenador de Compras', '(33)7654-3210', 3),
(4, 'Pedro Souza', '876.543.210-00', 'Analista Sênior de Compras', '(44)6543-2109', 4),
(5, 'Juliana Lima', '345.678.901-00', 'Estagiário de Compras', '(55)5432-1098', 5),
(6, 'Fernanda Pereira', '765.432.109-00', 'Gerente de Compras', '(66)4321-0987', 6),
(7, 'Rafaela Costa', '456.789.012-00', 'Analista de Suprimentos', '(77)3210-9876', 7),
(8, 'Lucas Mendes', '987.012.345-00', 'Comprador Técnico', '(88)2109-8765', 8),
(9, 'Gustavo Almeida', '678.901.234-00', 'Auxiliar de Compras', '(99)1098-7654', 9),
(10, 'Patrícia Santos', '012.345.678-00', 'Analista de Planejamento', '(00)0987-6543', 10);

INSERT INTO public.fornecedores (fornecedor_id, nome_fornecedor, cnpj_fornecedor, telefone, endereco_id) VALUES
(1, 'Pharma Distribuidora Ltda', '12.345.678/0001-90', '(51)9999-8888', 11),
(2, 'Central Ltda', '98.765.432/0001-21', '(48)9876-5432', 12),
(3, 'Medicamentos Expresso S.A.', '11.223.344/0001-55', '(47)8765-4321', 13),
(4, 'Remédios do Sul Eireli', '55.666.777/0001-33', '(49)7654-3210', 14),
(5, 'Drogaria Popular Ltda', '33.444.555/0001-99', '(48)6543-2109', 15),
(6, 'FarmaVida Distribuidora', '88.999.000/0001-12', '(47)5432-1098', 16),
(7, 'Bom Preço S.A.', '66.777.888/0001-44', '(48)4321-0987', 17),
(8, 'Distribuidora de Medicamentos do Norte', '09.876.543/0001-76', '(51)2109-8765', 18),
(9, 'PharmaMais Ltda', '12.345.678/0002-90', '(47)9876-5432', 19),
(10, 'São Lucas Eireli', '98.765.432/0002-21', '(48)8765-4321', 20);

INSERT INTO public.insumos (insumo_id, nome_insumo, descricao, unidade, quantidade_atual) VALUES
(1, 'Paracetamol', 'Analgésico e antipirético', 'kg', 12),
(2, 'Ácido Acetilsalicílico', 'Anti-inflamatório e analgésico', 'kg', 8),
(3, 'Hidróxido de Alumínio', 'Antiácido', 'kg', 0),
(4, 'Sulfato de Neomicina', 'Antibiótico tópico', 'kg', 1),
(5, 'Citrato de Sódio', 'Anticoagulante', 'kg', 2),
(6, 'Ácido Cítrico', 'Acidulante', 'kg', 0),
(7, 'Cloridrato de Propranolol', 'Anti-hipertensivo', 'kg', 1),
(8, 'Cloridrato de Ciprofloxacino', 'Antibiótico', 'kg', 2),
(9, 'Fluoreto de Sódio', 'Agente tópico para prevenção de cáries', 'kg', 2),
(10, 'Cloreto de Sódio', 'Saline solution', 'kg', 0),
(11, 'Ácido Fólico', 'Suplemento vitamínico', 'kg', 0),
(12, 'Vitamina C', 'Ácido ascórbico', 'kg', 0),
(13, 'Ferro Sulfato', 'Suplemento de ferro', 'kg', 0),
(14, 'Cloridrato de Lidocaína', 'Anestésico local', 'kg', 0),
(15, 'Metilcelulose', 'Agente espessante', 'kg', 0);

INSERT INTO public.servicos (servico_id, nome_servico, descricao) VALUES
(1, 'Análise de Controle de Qualidade', 'Realização de testes físico-químicos e microbiológicos para garantir a qualidade dos produtos.'),
(2, 'Estudos de Estabilidade', 'Avaliação da estabilidade dos medicamentos em diferentes condições de armazenamento.'),
(3, 'Inspeção e Auditoria', 'Inspeção e auditoria interna e externa para garantir conformidade com boas práticas de fabricação (GMP).'),
(4, 'Monitoramento Ambiental', 'Monitoramento de condições ambientais nas áreas de produção.'),
(5, 'Treinamento em Boas Práticas de Fabricação (GMP)', 'Capacitação de pessoal em práticas adequadas de fabricação de medicamentos.'),
(6, 'Gerenciamento de Resíduos', 'Manuseio adequado e descarte de resíduos gerados durante a produção.'),
(7, 'Limpeza e Sanitização', 'Procedimentos de limpeza e sanitização de equipamentos e instalações.'),
(8, 'Controle de Documentação', 'Gerenciamento e controle de documentação técnica e regulatória.'),
(9, 'Manutenção de Equipamentos', 'Manutenção preventiva e corretiva de equipamentos utilizados na produção.'),
(10, 'Calibração de Equipamentos', 'Calibração regular de equipamentos de medição e controle.');

INSERT INTO public.pedido_compra (pedido_compra_id, valor_total_pedido, data_pedido, data_conclusao, observacao, fornecedor_id)
VALUES
(1, 1700.00, '2024-06-20', '2024-06-25', 'Urgente: entrega até dia 25/06', 1),
(2, 2810.50, '2024-06-21', NULL, 'Itens adicionais: ver disponibilidade', 2),
(3, 500.00, '2024-06-22', '2024-06-26', 'Pagamento antecipado realizado', 3),
(4, 1225.75, '2024-06-23', NULL, 'Confirmar disponibilidade de cores', 4),
(5, 3500.00, '2024-06-24', NULL, 'Embarque marítimo preferencial', 5),
(6, 815.25, '2024-06-25', '2024-06-28', 'Entrega parcial autorizada', 6),
(7, 3000.80, '2024-06-26', NULL, 'Acompanhar prazo de entrega', 7),
(8, 600.00, '2024-06-27', '2024-07-02', 'Necessário fatura', 8),
(9, 3500.00, '2024-06-28', '2024-07-03', 'Incluir brindes adicionais', 9),
(10, 71.00, '2024-06-29', NULL, 'Pedido regular mensal', 10);

INSERT INTO public.itens_pedido_compra (pedido_compra_id, numero_item, quantidade, valor_unitario, valor_total_item, status, insumo_id)
VALUES
(1, 1, 5, 300.00, 1500.00, 'Atendido', 1),  
(1, 2, 2, 100.00, 200.00, 'Atendido', 2),     
(2, 1, 4, 700.00, 2800.00, 'Aberto', 3),    
(2, 2, 1, 10.50, 10.50, 'Atendido', 4),        
(3, 1, 10, 50.00, 500.00, 'Atendido', 5),     
(4, 1, 3, 400.00, 1200.00, 'Aberto', 6),    
(4, 2, 1, 25.75, 25.75, 'Atendido', 7),         
(5, 1, 7, 500.00, 3500.00, 'Aberto', 8),    
(6, 1, 2, 350.00, 700.00, 'Atendido', 9),   
(6, 2, 1, 115.25, 115.25, 'Cancelado', 10),     
(7, 1, 10, 300.00, 3000.00, 'Aberto', 1),
(8, 1, 6, 100.00, 600.00, 'Atendido', 2),    
(9, 1, 5, 700.00, 3500.00, 'Cancelado', 3),      
(10, 1, 2, 10.50, 21.00, 'Atendido', 4),    
(10, 2, 1, 50.00, 50.00, 'Aberto', 5);           

INSERT INTO public.nf_entrada (numero_nf_entrada, serie_nf, valor_total_nota, data_emissao, data_cadastro, fornecedor_id)
VALUES
('NF00000001', 'S001', 1700.00, '2024-06-25', CURRENT_DATE, 1), 
('NF00000002', 'S012', 10.50, CURRENT_DATE, CURRENT_DATE, 2),  
('NF00000003', 'S015', 500.00, '2024-06-26', CURRENT_DATE, 3),   
('NF00000004', 'S007', 25.75, CURRENT_DATE, CURRENT_DATE, 4),  
('NF00000005', 'S002', 3500.00, CURRENT_DATE, CURRENT_DATE, 5),  
('NF00000006', 'S014', 700.00, '2024-06-28', CURRENT_DATE, 6),   
('NF00000007', 'S006', 3000.00, CURRENT_DATE, CURRENT_DATE, 7),  
('NF00000008', 'S005', 600.00, '2024-07-02', CURRENT_DATE, 8),   
('NF00000010', 'S003', 21.00, CURRENT_DATE, CURRENT_DATE, 10);   

INSERT INTO public.itens_nf_entrada (numero_nf_entrada, numero_item, quantidade, valor_unitario, valor_total_item, codigo_lote_insumo, data_validade, insumo_id)
VALUES
('NF00000001', 1, 5, 300.00, 1500.00, 'L12345', '2024-06-30', 1),
('NF00000001', 2, 2, 100.00, 200.00, 'L23456', '2023-12-31', 2),
('NF00000002', 2, 1, 10.50, 10.50, 'L45678', '2022-07-15', 4),
('NF00000003', 1, 10, 50.00, 500.00, 'L56789', '2023-09-30', 5),
('NF00000004', 2, 1, 25.75, 25.75, 'L78901', '2023-08-10', 7),
('NF00000005', 1, 7, 500.00, 3500.00, 'L89012', '2024-11-28', 8),
('NF00000006', 1, 2, 350.00, 700.00, 'L90123', '2023-10-05', 9),
('NF00000007', 1, 10, 300.00, 3000.00, 'L12345', '2023-07-20', 1),
('NF00000008', 1, 6, 100.00, 600.00, 'L23451', '2024-02-15', 2),
('NF00000010', 1, 2, 10.50, 21.00, 'L45678', '2024-03-01', 4);

INSERT INTO public.estoque_insumo(insumo_id, codigo_lote_insumo, data_validade,quantidade)
VALUES 
(1, 'L12345', '2024-10-05', 12),
(2, 'L23456', '2024-12-15', 2),
(2, 'L23451', '2024-09-25', 6),
(4, 'L45678', '2024-11-07', 1),
(5, 'L56789', '2024-10-23', 2),
(7, 'L78901', '2024-09-17', 1),
(8, 'L89012', '2024-11-30', 2),
(9, 'L90123', '2024-12-14', 2);

INSERT INTO public.requisicao_insumo (requisicao_id, data_requisicao, data_conclusao, usuario_id)
VALUES
(1, '2023-01-15', NULL, 1),
(2, '2023-02-20', '2023-02-25', 2),
(3, '2023-03-10', NULL, 3),
(4, '2023-04-05', NULL, 4),
(5, '2023-05-12', '2023-05-15', 5),
(6, '2023-06-08', NULL, 6),
(7, '2023-07-22', '2023-07-25', 7),
(8, '2023-08-17', NULL, 8),
(9, '2023-09-30', NULL, 9),
(10, '2023-10-25', '2023-10-28', 10);

INSERT INTO public.itens_requisicao_insumo (requisicao_id, insumo_id, codigo_lote_insumo, quantidade, status)
VALUES
(1, 1, 'L12345', 3, 'Atendido'),
(1, 2, 'L23456', 1, 'Aberto'),
(2, 4, 'L45678', 1, 'Atendido'),
(3, 5, 'L56789', 8, 'Aberto'),
(4, 7, 'L78901', 1, 'Aberto'),
(5, 8, 'L89012', 5, 'Atendido'),
(6, 9, 'L90123', 2, 'Aberto'),
(7, 1, 'L12345', 5, 'Cancelado'),
(8, 2, 'L23451', 3, 'Aberto'),
(9, 5, 'L56789', 4, 'Aberto'),
(10, 4, 'L45678', 1, 'Atendido');