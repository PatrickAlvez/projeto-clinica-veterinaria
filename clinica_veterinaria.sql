-- 1. Criação do Banco de Dados (se necessário, ou use um existente)
CREATE DATABASE ClinicaVeterinariaDB;
GO
USE ClinicaVeterinariaDB;
GO

-- 2. Tabela Cliente
CREATE TABLE Cliente (
    id_cliente INT IDENTITY(1,1) PRIMARY KEY,
    nome_cliente VARCHAR(255) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(255),
    cpf VARCHAR(14) UNIQUE NOT NULL
);
GO

-- 3. Tabela Paciente
CREATE TABLE Paciente (
    id_paciente INT IDENTITY(1,1) PRIMARY KEY,
    nome_paciente VARCHAR(255) NOT NULL,
    especie VARCHAR(50) NOT NULL,
    raca VARCHAR(50),
    data_nascimento DATE,
    peso_kg DECIMAL(5,2),
    id_cliente INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);
GO

-- 4. Tabela Veterinario
CREATE TABLE Veterinario (
    id_veterinario INT IDENTITY(1,1) PRIMARY KEY,
    nome_veterinario VARCHAR(255) NOT NULL,
    crmv VARCHAR(20) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(255)
);
GO

-- 5. Tabela Servico
CREATE TABLE Servico (
    id_servico INT IDENTITY(1,1) PRIMARY KEY,
    nome_servico VARCHAR(255) NOT NULL,
    descricao VARCHAR(500),
    preco DECIMAL(10,2) NOT NULL
);
GO

-- 6. Tabela Consulta
CREATE TABLE Consulta (
    id_consulta INT IDENTITY(1,1) PRIMARY KEY,
    id_paciente INT NOT NULL,
    id_veterinario INT NOT NULL,
    data_consulta DATE NOT NULL,
    hora_consulta TIME NOT NULL,
    motivo_consulta VARCHAR(500),
    status_consulta VARCHAR(50) NOT NULL DEFAULT 'Agendada', -- Ex: 'Agendada', 'Realizada', 'Cancelada'
    FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente),
    FOREIGN KEY (id_veterinario) REFERENCES Veterinario(id_veterinario)
);
GO

-- 7. Tabela Historico_Medico
CREATE TABLE Historico_Medico (
    id_historico INT IDENTITY(1,1) PRIMARY KEY,
    id_paciente INT NOT NULL,
    data_registro DATETIME NOT NULL DEFAULT GETDATE(),
    diagnostico VARCHAR(MAX),
    tratamento VARCHAR(MAX),
    medicamentos VARCHAR(MAX),
    observacoes VARCHAR(MAX),
    FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente)
);
GO

-- 8. Tabela Itens_Servico_Consulta (para relacionamento N:M entre Consulta e Servico)
CREATE TABLE Itens_Servico_Consulta (
    id_item_servico INT IDENTITY(1,1) PRIMARY KEY,
    id_consulta INT NOT NULL,
    id_servico INT NOT NULL,
    quantidade INT NOT NULL DEFAULT 1,
    preco_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_consulta) REFERENCES Consulta(id_consulta),
    FOREIGN KEY (id_servico) REFERENCES Servico(id_servico)
);
GO
