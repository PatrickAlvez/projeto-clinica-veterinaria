-- Inserir Clientes
INSERT INTO Cliente (nome_cliente, telefone, email, cpf)
VALUES ('Ana Silva', '11987654321', 'ana.silva@email.com', '123.456.789-01');
INSERT INTO Cliente (nome_cliente, telefone, email, cpf)
VALUES ('Bruno Costa', '21998765432', 'bruno.costa@email.com', '987.654.321-09');

-- Inserir Pacientes
INSERT INTO Paciente (nome_paciente, especie, raca, data_nascimento, peso_kg, id_cliente)
VALUES ('Rex', 'Cachorro', 'Labrador', '2018-05-10', 30.5, 1); -- Rex é da Ana Silva
INSERT INTO Paciente (nome_paciente, especie, raca, data_nascimento, peso_kg, id_cliente)
VALUES ('Miau', 'Gato', 'Siamês', '2020-01-15', 4.2, 1); -- Miau também é da Ana Silva
INSERT INTO Paciente (nome_paciente, especie, raca, data_nascimento, peso_kg, id_cliente)
VALUES ('Amora', 'Cachorro', 'Poodle', '2019-03-20', 8.0, 2); -- Amora é do Bruno Costa

-- Inserir Veterinários
INSERT INTO Veterinario (nome_veterinario, crmv, telefone, email)
VALUES ('Dr. João Santos', 'CRMV-SP 12345', '11987651234', 'joao.santos@vet.com');
INSERT INTO Veterinario (nome_veterinario, crmv, telefone, email)
VALUES ('Dra. Maria Oliveira', 'CRMV-RJ 67890', '21998761234', 'maria.oliveira@vet.com');

-- Inserir Serviços
INSERT INTO Servico (nome_servico, descricao, preco)
VALUES ('Consulta Geral', 'Avaliação de rotina', 120.00);
INSERT INTO Servico (nome_servico, descricao, preco)
VALUES ('Vacina V8', 'Vacina polivalente para cães', 80.00);
INSERT INTO Servico (nome_servico, descricao, preco)
VALUES ('Exame de Sangue', 'Hemograma completo', 75.00);

-- Inserir Consultas
INSERT INTO Consulta (id_paciente, id_veterinario, data_consulta, hora_consulta, motivo_consulta)
VALUES (1, 1, '2025-07-01', '10:00:00', 'Check-up anual'); -- Rex com Dr. João
INSERT INTO Consulta (id_paciente, id_veterinario, data_consulta, hora_consulta, motivo_consulta)
VALUES (2, 2, '2025-07-01', '14:30:00', 'Vacinação'); -- Miau com Dra. Maria
INSERT INTO Consulta (id_paciente, id_veterinario, data_consulta, hora_consulta, motivo_consulta)
VALUES (3, 1, '2025-07-02', '09:00:00', 'Dor na pata'); -- Amora com Dr. João

-- Inserir Itens de Serviço para Consultas
INSERT INTO Itens_Servico_Consulta (id_consulta, id_servico, quantidade, preco_unitario)
VALUES (1, 1, 1, 120.00); -- Consulta Geral para Rex
INSERT INTO Itens_Servico_Consulta (id_consulta, id_servico, quantidade, preco_unitario)
VALUES (2, 1, 1, 120.00); -- Consulta Geral para Miau
INSERT INTO Itens_Servico_Consulta (id_consulta, id_servico, quantidade, preco_unitario)
VALUES (2, 2, 1, 80.00);  -- Vacina V8 para Miau
INSERT INTO Itens_Servico_Consulta (id_consulta, id_servico, quantidade, preco_unitario)
VALUES (3, 1, 1, 120.00); -- Consulta Geral para Amora
INSERT INTO Itens_Servico_Consulta (id_consulta, id_servico, quantidade, preco_unitario)
VALUES (3, 3, 1, 75.00);  -- Exame de Sangue para Amora

-- Inserir Histórico Médico (após as consultas)
INSERT INTO Historico_Medico (id_paciente, diagnostico, tratamento, medicamentos, observacoes)
VALUES (1, 'Saudável, check-up ok.', 'Manter rotina de vacinação.', NULL, 'Próximo check-up em 1 ano.');
INSERT INTO Historico_Medico (id_paciente, diagnostico, tratamento, medicamentos, observacoes)
VALUES (2, 'Vacinação em dia.', 'Aplicada vacina V8.', 'Nenhum', 'Agendar reforço em 21 dias.');
INSERT INTO Historico_Medico (id_paciente, diagnostico, tratamento, medicamentos, observacoes)
VALUES (3, 'Suspeita de torção.', 'Repouso, anti-inflamatório.', 'Meloxicam', 'Retorno em 5 dias para reavaliação.');