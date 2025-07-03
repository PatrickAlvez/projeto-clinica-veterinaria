-- Selecionar todos os clientes
SELECT * FROM Cliente;

-- Selecionar pacientes e seus tutores
SELECT P.nome_paciente, P.especie, C.nome_cliente AS tutor
FROM Paciente P
JOIN Cliente C ON P.id_cliente = C.id_cliente;

-- Selecionar consultas agendadas para um dia específico com detalhes do paciente e veterinário
SELECT
    CO.data_consulta,
    CO.hora_consulta,
    PA.nome_paciente AS Paciente,
    CL.nome_cliente AS Tutor,
    VE.nome_veterinario AS Veterinario,
    CO.motivo_consulta
FROM Consulta CO
JOIN Paciente PA ON CO.id_paciente = PA.id_paciente
JOIN Cliente CL ON PA.id_cliente = CL.id_cliente
JOIN Veterinario VE ON CO.id_veterinario = VE.id_veterinario
WHERE CO.data_consulta = '2025-07-01'
ORDER BY CO.hora_consulta;

-- Ver histórico médico completo de um paciente (Ex: Rex, id_paciente = 1)
SELECT
    HM.data_registro,
    HM.diagnostico,
    HM.tratamento,
    HM.medicamentos,
    HM.observacoes
FROM Historico_Medico HM
WHERE HM.id_paciente = 1
ORDER BY HM.data_registro DESC;

-- Ver serviços realizados em uma consulta (Ex: Consulta id_consulta = 3)
SELECT
    CO.data_consulta,
    PA.nome_paciente,
    VE.nome_veterinario,
    S.nome_servico,
    ISC.quantidade,
    ISC.preco_unitario
FROM Itens_Servico_Consulta ISC
JOIN Consulta CO ON ISC.id_consulta = CO.id_consulta
JOIN Servico S ON ISC.id_servico = S.id_servico
JOIN Paciente PA ON CO.id_paciente = PA.id_paciente
JOIN Veterinario VE ON CO.id_veterinario = VE.id_veterinario
WHERE ISC.id_consulta = 3;