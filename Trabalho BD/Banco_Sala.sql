CREATE DATABASE IF NOT EXISTS Banco_Sala;
Use Banco_Sala;
Drop table if exists Consulta, Receita, Estoque_Remedio, Uso_Remedio, Remedio, Funcionario, Sala, Especialidade_medico, Especialidade_enfermeiro, Cargo, Paciente;

Create table Paciente (
	id_paciente INT NOT NULL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    sexo VARCHAR (20) NOT NULL,
    telefone VARCHAR (15) NOT NULL,
    data_nascimento DATE NOT NULL,
    CPF CHAR (11) NOT NULL,
    CEP CHAR (8) NOT NULL,
    complemento_endereco VARCHAR(10) NOT NULL,
    endereco VARCHAR (120) NOT NULL,
    RG CHAR(9) NOT NULL,
	UF_paciente CHAR(2) NOT NULL
);

Create table Cargo (
	id_cargo INT NOT NULL PRIMARY KEY,
    nome VARCHAR (100) NOT NULL UNIQUE
);

Create table Especialidade_enfermeiro (
	id_especialidade_enfermeiro INT PRIMARY KEY NULL,
    nome VARCHAR(100) NOT NULL
); 

Create table Especialidade_medico (
	id_especialidade_medico INT PRIMARY KEY NULL,
    nome VARCHAR(100) NOT NULL
);

Create table Sala (
	id_sala INT PRIMARY KEY NOT NULl
);

Create table Funcionario (
	id_funcionario INT NOT NULL PRIMARY KEY,
    id_cargo INT NOT NULL,
    id_especialidade_enfermeiro INT NULL,
    id_especialidade_medico INT NULL,
    id_sala INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    sexo VARCHAR (20) NOT NULL,
    telefone VARCHAR (15) NOT NULL,
    data_nascimento DATE NOT NULL,
    CPF CHAR (11) NOT NULL,
    CEP CHAR (8) NOT NULL,
    complemento_endereco VARCHAR(10) NOT NULL,
    endereco VARCHAR (120) NOT NULL,
    RG CHAR(9) NOT NULL,
    UF_funcionario CHAR(2) NOT NULL,
    COREN VARCHAR(20),
    CRM VARCHAR(6),
    foreign key (id_cargo) references Cargo(id_cargo),
    foreign key (id_especialidade_enfermeiro) references Especialidade_enfermeiro(id_especialidade_enfermeiro),
	foreign key (id_especialidade_medico) references Especialidade_medico(id_especialidade_medico),
    foreign key (id_sala) references Sala(id_sala)
);

Create table Remedio (
	id_remedio INT PRIMARY KEY,
	nome_remedio VARCHAR(100) NOT NULL
);

Create table Uso_Remedio (
	id_uso INT PRIMARY KEY,
    id_paciente INT NOT NULL,
    id_remedio INT NOT NULL,
    quantidade_ingerida VARCHAR(50),
    foreign key (id_paciente) references Paciente(id_paciente),
    foreign key (id_remedio) references Remedio(id_remedio)
);

Create table Estoque_Remedio (
	id_estoque INT PRIMARY KEY NOT NULL,
    id_remedio INT NOT NULL,
    id_funcionario INT NOT NULL,
    quantidade INT NOT NULL,
    data_entrada DATE NOT NULL,
    data_validade DATE NOT NULL,
    foreign key (id_remedio) references Remedio(id_remedio),
    foreign key (id_funcionario) references Funcionario(id_funcionario)
    );

Create table Receita (
	id_receita INT NOT NULL PRIMARY KEY ,
	id_remedio INT NOT NULL,
    id_paciente INT NOT NULL,
    id_funcionario INT NOT NULL,
    data_emissao DATE NOT NULL,
    quantidade VARCHAR(50) NOT NULL,
    dosagem VARCHAR(50) NOT NULL,
    periodo_consumo VARCHAR(20) NOT NULL,
	UF_paciente CHAR(2) NOT NULL,
    UF_funcionario CHAR(2) NOT NULL,
    foreign key (id_paciente) references Paciente(id_paciente),
    foreign key (id_remedio) references Remedio(id_remedio),
    foreign key (id_funcionario) references Funcionario(id_funcionario)
);

Create table Consulta (
	id_consulta INT PRIMARY KEY NOT NULL,
	id_paciente INT NOT NULL,
    id_funcionario INT NOT NULL,
    id_sala INT NOT NULL,
    id_receita INT NOT NULL,
    temperatura DECIMAL(4,1) NOT NULL,
    pressao_arterial VARCHAR(7) NOT NULL,
    frequencia_cardiaca INT NOT NULL,
    diagnostico VARCHAR(200) NOT NULL,
    data_hora DATETIME NOT NULL,
    foreign key (id_paciente) references Paciente(id_paciente),
    foreign key (id_funcionario) references Funcionario(id_funcionario),
    foreign key (id_sala) references Sala(id_sala),
    foreign key (id_receita) references Receita(id_receita)
);


insert into Paciente (id_paciente, nome, sexo, telefone, data_nascimento, CPF, CEP, complemento_endereco, endereco, RG, UF_paciente) values
(1, 'Leonardo', 'Masculino', '(11)92344-3287', '1976-09-24', '11111111112', '00000001', 'Casa 1', 'Rua José Do Mal', '111111111', 'SP'),
(2, 'Felipe', 'Masculino', '(11)92344-6782', '1980-09-25', '11111111113', '00000002', 'Casa 2', 'Rua José Do Bem', '111111112', 'RJ'),
(3, 'Marcos', 'Masculino', '(11)92344-9990', '1923-07-10', '11111111114', '00000003', 'Casa 3', 'Rua José Do Mau', '111111113', 'SP'),
(4, 'Julia', 'Feminino', '(11)92344-8888', '1955-03-6', '11111111115', '00000004', 'Casa 4', 'Rua José Do Baú', '111111114', 'MG'),
(5, 'David Melquiades', 'Masculino', '(11)92344-4444', '1957-06-11', '11111111116', '00000005', 'Casa 5', 'Rua José Do Casco', '111111115', 'PE'),
(6, 'Fernando', 'Masculino', '(11)92344-2222', '1958-04-26', '11111111117', '00000006', 'Casa 6', 'Rua José Do José', '111111116', 'BA'),
(7, 'Morais', 'Masculino', '(11)92344-6565', '1932-12-25', '11111111118', '00000007', 'Casa 7', 'Rua José Do Galego', '111111117', 'DF'),
(8, 'Bruna', 'Feminino', '(11)92344-2542', '1976-09-24', '11111111119', '00000008', 'Casa 8', 'Rua José Do Joaozin', '111111118', 'RJ'),
(9, 'Sophia', 'Masculino', '(11)92344-3342', '1976-09-24', '11111111123', '00000009', 'Casa 9', 'Rua José Do Marreta', '111111119', 'SP'),
(10, 'Tavares', 'Masculino', '(11)92344-3287', '1976-09-24', '11111111124', '00000010', 'Casa 10', 'Rua José Do Mal', '111111110', 'SP'),
(11, 'Lucas', 'Masculino', '(11)92345-6789', '1988-01-10', '11111111125', '00000011', 'Casa 11', 'Rua José Da Paz', '111111120', 'SP'),
(12, 'Amanda', 'Feminino', '(11)92345-7890', '1992-11-22', '11111111126', '00000012', 'Casa 12', 'Rua José Do Sol', '111111121', 'RJ'),
(13, 'Rafael', 'Masculino', '(11)92345-8765', '1985-03-05', '11111111127', '00000013', 'Casa 13', 'Rua José Do Luar', '111111122', 'MG'),
(14, 'Carla', 'Feminino', '(11)92345-4321', '1990-07-18', '11111111128', '00000014', 'Casa 14', 'Rua José Da Liberdade', '111111123', 'BA'),
(15, 'Gustavo', 'Masculino', '(11)92345-1234', '1993-09-25', '11111111129', '00000015', 'Casa 15', 'Rua José Do Porto', '111111124', 'PR'),
(16, 'Fernanda', 'Feminino', '(11)92345-6781', '1987-10-05', '11111111130', '00000016', 'Casa 16', 'Rua José Da Serra', '111111125', 'PE'),
(17, 'Vitor', 'Masculino', '(11)92345-9876', '1996-04-16', '11111111131', '00000017', 'Casa 17', 'Rua José Da Luz', '111111126', 'RJ'),
(18, 'Lúcia', 'Feminino', '(11)92345-6543', '1989-12-22', '11111111132', '00000018', 'Casa 18', 'Rua José Da Montanha', '111111127', 'MG'),
(19, 'João', 'Masculino', '(11)92345-2345', '1975-05-11', '11111111133', '00000019', 'Casa 19', 'Rua José Da Paz', '111111128', 'SP'),
(20, 'Vanessa', 'Feminino', '(11)92345-6780', '1994-08-14', '11111111134', '00000020', 'Casa 20', 'Rua José Da Alegria', '111111129', 'SP'),
(21, 'Roberta', 'Feminino', '(11)92345-7654', '1991-03-23', '11111111135', '00000021', 'Casa 21', 'Rua José Da Lua', '111111130', 'SP'),
(22, 'Gabriel', 'Masculino', '(11)92345-8765', '1992-07-30', '11111111136', '00000022', 'Casa 22', 'Rua José Do Sol', '111111131', 'RJ'),
(23, 'Tatiane', 'Feminino', '(11)92345-4321', '1984-02-17', '11111111137', '00000023', 'Casa 23', 'Rua José Da Montanha', '111111132', 'MG'),
(24, 'Marcos', 'Masculino', '(11)92345-9876', '1989-10-11', '11111111138', '00000024', 'Casa 24', 'Rua José Do Rio', '111111133', 'SP'),
(25, 'Larissa', 'Feminino', '(11)92345-8764', '1993-06-05', '11111111139', '00000025', 'Casa 25', 'Rua José Da Paz', '111111134', 'BA'),
(26, 'André', 'Masculino', '(11)92345-6543', '1987-11-19', '11111111140', '00000026', 'Casa 26', 'Rua José Do Luar', '111111135', 'RJ'),
(27, 'Simone', 'Feminino', '(11)92345-2345', '1990-04-28', '11111111141', '00000027', 'Casa 27', 'Rua José Da Estrela', '111111136', 'SP'),
(28, 'Tiago', 'Masculino', '(11)92345-5432', '1986-12-15', '11111111142', '00000028', 'Casa 28', 'Rua José Do Mar', '111111137', 'MG'),
(29, 'Cláudia', 'Feminino', '(11)92345-9875', '1988-09-09', '11111111143', '00000029', 'Casa 29', 'Rua José Do Rio', '111111138', 'SP'),
(30, 'Ricardo', 'Masculino', '(11)92345-1111', '1981-05-22', '11111111144', '00000030', 'Casa 30', 'Rua José Do Coração', '111111139', 'SP'),
(31, 'Beatriz', 'Feminino', '(11)92345-6789', '1995-01-10', '11111111145', '00000031', 'Casa 31', 'Rua José Da Serra', '111111140', 'SP'),
(32, 'Eduardo', 'Masculino', '(11)92345-9876', '1987-08-05', '11111111146', '00000032', 'Casa 32', 'Rua José Do Vale', '111111141', 'RJ'),
(33, 'Gustavo', 'Masculino', '(11)92345-5432', '1992-11-16', '11111111147', '00000033', 'Casa 33', 'Rua José Do Sol', '111111142', 'SP'),
(34, 'Caroline', 'Feminino', '(11)92345-6543', '1994-03-09', '11111111148', '00000034', 'Casa 34', 'Rua José Da Paz', '111111143', 'MG'),
(35, 'Felipe', 'Masculino', '(11)92345-2345', '1989-07-14', '11111111149', '00000035', 'Casa 35', 'Rua José Do Horizonte', '111111144', 'SP'),
(36, 'Renata', 'Feminino', '(11)92345-7654', '1993-06-20', '11111111150', '00000036', 'Casa 36', 'Rua José Da Liberdade', '111111145', 'RJ'),
(37, 'Lucas', 'Masculino', '(11)92345-9876', '1991-09-25', '11111111151', '00000037', 'Casa 37', 'Rua José Do Sol Nascente', '111111146', 'SP'),
(38, 'Jéssica', 'Feminino', '(11)92345-1234', '1988-10-18', '11111111152', '00000038', 'Casa 38', 'Rua José Do Céu', '111111147', 'MG'),
(39, 'Fernando', 'Masculino', '(11)92345-6543', '1985-05-28', '11111111153', '00000039', 'Casa 39', 'Rua José Da Esperança', '111111148', 'SP'),
(40, 'Mariana', 'Feminino', '(11)92345-8765', '1990-04-14', '11111111154', '00000040', 'Casa 40', 'Rua José Do Vale', '111111149', 'SP'),
(41, 'Carlos', 'Masculino', '(11)92345-4321', '1992-02-28', '11111111155', '00000041', 'Casa 41', 'Rua José Do Sol Nascente', '111111150', 'SP'),
(42, 'Marina', 'Feminino', '(11)92345-8765', '1996-01-18', '11111111156', '00000042', 'Casa 42', 'Rua José Da Estrela', '111111151', 'RJ'),
(43, 'Ricardo', 'Masculino', '(11)92345-2345', '1985-11-11', '11111111157', '00000043', 'Casa 43', 'Rua José Do Vento', '111111152', 'SP'),
(44, 'Larissa', 'Feminino', '(11)92345-6543', '1993-09-05', '11111111158', '00000044', 'Casa 44', 'Rua José Do Luar', '111111153', 'MG'),
(45, 'Gustavo', 'Masculino', '(11)92345-9876', '1987-04-12', '11111111159', '00000045', 'Casa 45', 'Rua José Da Liberdade', '111111154', 'SP'),
(46, 'Roberta', 'Feminino', '(11)92345-5432', '1990-08-28', '11111111160', '00000046', 'Casa 46', 'Rua José Da Esperança', '111111155', 'RJ'),
(47, 'Vitor', 'Masculino', '(11)92345-1234', '1991-12-14', '11111111161', '00000047', 'Casa 47', 'Rua José Do Horizonte', '111111156', 'SP'),
(48, 'Amanda', 'Feminino', '(11)92345-6789', '1995-06-25', '11111111162', '00000048', 'Casa 48', 'Rua José Da Paz', '111111157', 'MG'),
(49, 'André', 'Masculino', '(11)92345-2345', '1989-03-07', '11111111163', '00000049', 'Casa 49', 'Rua José Do Sol', '111111158', 'RJ'),
(50, 'Simone', 'Feminino', '(11)92345-8765', '1994-09-21', '11111111164', '00000050', 'Casa 50', 'Rua José Do Mar', '111111159', 'SP');




insert into Cargo (id_cargo, nome) values
(1, 'Médico'),
(2, 'Enfermeiro'),
(3, 'Estoquista');

insert into Especialidade_enfermeiro (id_especialidade_enfermeiro, nome) values
(1, 'Enfermagem em Clínica Médica'),
(2, 'Enfermagem Cirúrgica'),
(3, 'Enfermagem em Urgência'),
(4, 'Enfermagem em Terapia Intensiva'),
(5, 'Enfermagem Obstétrica'),
(6, 'Enfermagem Pediátrica'),
(7, 'Enfermagem em Saúde Mental'),
(8, 'Enfermagem em Oncologia'),
(9, 'Enfermagem em Nefrologia');

insert into Especialidade_medico (id_especialidade_medico, nome) values
(1, 'Clínica Médica'),
(2, 'Cirurgia Geral'),
(3, 'Pediatria'),
(4, 'Ginecologista'),
(5, 'Ortopedia'),
(6, 'Cardiologia'),
(7, 'Neurologia'),
(8, 'Anestesiologia'),
(9, 'Radiologia'),
(10, 'Emergência');

insert into Sala (id_sala) values
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14),
(15),
(16),
(17),
(18),
(19),
(20);

insert into Funcionario (id_funcionario, id_cargo, id_especialidade_enfermeiro, id_especialidade_medico, id_sala, nome, sexo, telefone, data_nascimento, CPF, CEP, complemento_endereco, endereco, RG, UF_funcionario, COREN, CRM) values
(1, 1, 1, NULL, 1, 'Pablo', 'Masculino', '(11)92344-9898', '2000-11-4', '11111111126', '00000011', 'Casa 11', 'Rua José Do BB', '111111120', 'SP', 'COREN1000', NULL),
(2, 1, 1, NULL, 2, 'Joao', 'Masculino', '(11)92344-3456', '1967-06-23', '11111111127', '00000012', 'Casa 12', 'Rua José Do Bagre', '111111121', 'RJ', 'COREN1001', NULL),
(3, 1, 1, NULL, 3, 'Marcinho', 'Masculino', '(11)92344-3498', '2000-12-6', '11111111128', '00000013', 'Casa 13', 'Rua José Do BB', '111111122', 'MG', 'COREN1002', NULL),
(4, 1, 1, NULL, 4, 'Lucas', 'Masculino', '(11)92344-7890', '1995-03-15', '11111111129', '00000014', 'Casa 14', 'Rua José do Limoeiro', '111111123', 'SP', 'COREN1003', NULL),
(5, 1, 1, NULL, 5,' Ana', 'Feminino', '(21)93456-7890', '1988-07-22', '11111111130', '00000015', 'Casa 15', 'Rua dos Sabiás', '111111124', 'RJ', 'COREN1004', NULL),
(6, 1, 1, NULL, 6, 'Roberta', 'Feminino', '(31)96789-1234', '1992-01-30', '11111111131', '00000016', 'Casa 16', 'Rua São Francisco', '111111125', 'MG', 'COREN1005', NULL),
(7, 1, 1, NULL, 7, 'Carlos', 'Masculino', '(11)92344-5566', '1990-11-18', '11111111132', '00000017', 'Casa 17', 'Rua das Palmeiras', '111111126', 'SP', 'COREN1006', NULL),
(8, 1, 1, NULL, 8, 'Fernanda', 'Feminino', '(41)92344-1122', '1994-09-10', '11111111133', '00000018', 'Casa 18', 'Rua João Pessoa', '111111127', 'PR', 'COREN1007', NULL),
(9, 1, 1, NULL, 9, 'Paula', 'Feminino', '(21)92456-3344', '1985-04-25', '11111111134', '00000019', 'Casa 19', 'Rua do Carmo', '111111128', 'RJ', 'COREN1008', NULL),
(10, 1, 1, NULL, 10, 'Ricardo', 'Masculino', '(61)98765-4321', '1996-02-14', '11111111135', '00000020', 'Casa 20', 'Rua dos Ipês', '111111129', 'DF', 'COREN1009', NULL),
(11, 1, 2, NULL, 11, 'Juliana', 'Feminino', '(81)97456-3210', '1991-08-05', '11111111136', '00000021', 'Casa 21', 'Rua da Paz', '111111130', 'PE', 'COREN1010', NULL),
(12, 1, 2, NULL, 12, 'Marta', 'Feminino', '(85)91234-5678', '1993-12-13', '11111111137', '00000022', 'Casa 22', 'Rua do Sol', '111111131', 'CE', 'COREN1011', NULL),
(13, 1, 2, NULL, 13, 'Leandro', 'Masculino', '(48)99876-5432', '1998-05-21', '11111111138', '00000023', 'Casa 23', 'Rua da Liberdade', '111111132', 'SC', 'COREN1012', NULL),
(14, 1, 2, NULL, 14, 'Julio', 'Masculino', '(11)98123-4567', '1982-02-12', '11111111139', '00000024', 'Casa 24', 'Rua das Acácias', '111111133', 'SP', 'COREN1013', NULL),
(15, 1, 2, NULL, 15, 'Simone', 'Feminino', '(19)93344-6789', '1990-10-01', '11111111140', '00000025', 'Casa 25', 'Rua do Amor', '111111134', 'SP', 'COREN1014', NULL),
(16, 1, 2, NULL, 16, 'Fernando', 'Masculino', '(41)93567-2345', '1994-07-17', '11111111141', '00000026', 'Casa 26', 'Rua Marechal', '111111135', 'PR', 'COREN1015', NULL),
(17, 1, 2, NULL, 17, 'Carolina', 'Feminino', '(85)97654-3210', '1987-05-03', '11111111142', '00000027', 'Casa 27', 'Rua do Horizonte', '111111136', 'CE', 'COREN1016', NULL),
(18, 1, 2, NULL, 18, 'Bruna', 'Feminino', '(11)98765-4321', '1999-09-19', '11111111143', '00000028', 'Casa 28', 'Rua Flor de Laranjeira', '111111137', 'SP', 'COREN1017', NULL),
(19, 1, 2, NULL, 19, 'Tiago', 'Masculino', '(21)91345-6789', '1993-01-25', '11111111144', '00000029', 'Casa 29', 'Rua Santa Rita', '111111138', 'RJ', 'COREN1018', NULL),
(20, 1, 2, NULL, 20, 'Débora', 'Feminino', '(22)97653-2109', '1989-03-22', '11111111145', '00000030', 'Casa 30', 'Rua São João', '111111139', 'RJ', 'COREN1019', NULL),
(21, 1, 3, NULL, 1,  'Gustavo', 'Masculino', '(81)99234-8765', '1992-06-18', '11111111146', '00000031', 'Casa 31', 'Rua das Estrelas', '111111140', 'PE', 'COREN1020', NULL),
(22, 1, 3, NULL, 2, 'Mônica', 'Feminino', '(44)93214-7654', '1986-12-28', '11111111147', '00000032', 'Casa 32', 'Rua da Alegria', '111111141', 'PR', 'COREN1021', NULL),
(23, 1, 3, NULL, 3, 'Vera', 'Feminino', '(11)92367-8901', '1990-10-30', '11111111148', '00000033', 'Casa 33', 'Rua da Liberdade', '111111142', 'SP', 'COREN1022', NULL),
(24, 1, 3, NULL, 4, 'Sérgio', 'Masculino', '(61)98456-1234', '1988-11-11', '11111111149', '00000034', 'Casa 34', 'Rua das Palmeiras', '111111143', 'DF', 'COREN1023', NULL),
(25, 1, 3, NULL, 5, 'Robson', 'Masculino', '(47)92345-6789', '1996-04-28', '11111111150', '00000035', 'Casa 35', 'Rua das Margaridas', '111111144', 'SC', 'COREN1024', NULL),
(26, 1, NULL, 3, 6, 'Mariana', 'Feminino', '(85)91234-6789', '1993-07-17', '11111111151', '00000036', 'Casa 36', 'Rua do Sol Nascente', '111111145', 'CE', NULL, '300026'),
(27, 1, NULL, 3, 7, 'Felipe', 'Masculino', '(31)98765-4321', '1990-05-06', '11111111152', '00000037', 'Casa 37', 'Rua dos Lírios', '111111146', 'MG', NULL, '300027'),
(28, 1, NULL, 3, 8, 'Letícia', 'Feminino', '(21)92345-5678', '1997-10-29', '11111111153', '00000038', 'Casa 38', 'Rua do Rosário', '111111147', 'RJ', NULL, '300028'),
(29, 1, NULL, 3, 9, 'André', 'Masculino', '(62)93567-8910', '1985-09-13', '11111111154', '00000039', 'Casa 39', 'Rua das Águas', '111111148', 'GO', NULL, '300029'),
(30, 1, NULL, 3, 10, 'Tatiane', 'Feminino', '(11)98123-8765', '1991-03-17', '11111111155', '00000040', 'Casa 40', 'Rua dos Pássaros', '111111149', 'SP', NULL, '300030'),
(31, 1, NULL, 4, 11, 'Eduardo', 'Masculino', '(41)92367-4321', '1998-06-02', '11111111156', '00000041', 'Casa 41', 'Rua da Paz', '111111150', 'PR', NULL, '300031'),
(32, 1, NULL, 4, 12, 'Vanessa', 'Feminino', '(21)98765-5432', '1995-08-10', '11111111157', '00000042', 'Casa 42', 'Rua Dona Clara', '111111151', 'RJ', NULL, '300032'),
(33, 1, NULL, 5, 13, 'Ricardo', 'Masculino', '(71)92345-6789', '1992-02-20', '11111111158', '00000043', 'Casa 43', 'Rua do Amor Perfeito', '111111152', 'BA', NULL, '300033'),
(34, 1, NULL, 5, 14, 'Tatiane', 'Feminino', '(31)97543-2109', '1994-01-28', '11111111159', '00000044', 'Casa 44', 'Rua dos Lírios', '111111153', 'MG',NULL, '300034'),
(35, 1, NULL, 6, 15, 'Luiz', 'Masculino', '(48)99123-4567', '1990-12-05', '11111111160', '00000045', 'Casa 45', 'Rua das Acácias', '111111154', 'SC', NULL, '300035'),
(36, 1, NULL, 6, 16, 'Isabela', 'Feminino', '(81)99765-4321', '1998-10-15', '11111111161', '00000046', 'Casa 46', 'Rua dos Corais', '111111155', 'PE', NULL, '300036'),
(37, 1, NULL, 7, 17, 'Carlos', 'Masculino', '(21)93456-7890', '1989-06-10', '11111111162', '00000047', 'Casa 47', 'Rua São Jorge', '111111156', 'RJ', NULL, '300037'),
(38, 1, NULL, 7, 18, 'Aline', 'Feminino', '(11)92345-7654', '1993-02-18', '11111111163', '00000048', 'Casa 48', 'Rua das Flores', '111111157', 'SP', NULL, '300038'),
(39, 1, NULL, 8, 19, 'Ricardo', 'Masculino', '(19)92345-1122', '1996-08-23', '11111111164', '00000049', 'Casa 49', 'Rua da Liberdade', '111111158', 'SP',NULL, '300039'),
(40, 1, NULL, 8, 20, 'Jéssica', 'Feminino', '(44)97654-3210', '1992-11-07', '11111111165', '00000050', 'Casa 50', 'Rua do Céu', '111111159', 'PR', NULL, '300040'),
(41, 1, NULL, 9, 1, 'Vinícius', 'Masculino', '(61)93456-7890', '1986-09-30', '11111111166', '00000051', 'Casa 51', 'Rua das Orquídeas', '111111160', 'DF', NULL, '300041'),
(42, 1, NULL, 6, 2, 'Patrícia', 'Feminino', '(85)92456-9876', '1991-04-09', '11111111167', '00000052', 'Casa 52', 'Rua do Sol', '111111161', 'CE', NULL, '300042'),
(43, 1, NULL, 7, 3, 'Rodrigo', 'Masculino', '(21)93567-4321', '1995-07-12', '11111111168', '00000053', 'Casa 53', 'Rua das Águas', '111111162', 'RJ', NULL, '300043'),
(44, 1, NULL, 8, 4, 'Fabiana', 'Feminino', '(61)92345-6789', '1994-05-22', '11111111169', '00000054', 'Casa 54', 'Rua das Palmeiras', '111111163', 'DF', NULL, '300044'),
(45, 1, NULL, 9, 5, 'José', 'Masculino', '(11)93214-7654', '1987-12-17', '11111111170', '00000055', 'Casa 55', 'Rua do Carmo', '111111164', 'SP', NULL, '300045'),
(46, 1, NULL, 6, 6, 'Carla', 'Feminino', '(44)99345-2109', '1992-03-19', '11111111171', '00000056', 'Casa 56', 'Rua São Luiz', '111111165', 'PR', NULL, '300046'),
(47, 1, NULL, 7, 7, 'Paulo', 'Masculino', '(41)91234-5678', '1993-11-04', '11111111172', '00000057', 'Casa 57', 'Rua das Flores', '111111166', 'PR', NULL, '300047'),
(48, 1, NULL, 8, 8, 'Renata', 'Feminino', '(21)93345-6789', '1986-09-28', '11111111173', '00000058', 'Casa 58', 'Rua São Paulo', '111111167', 'RJ',NULL, '300048'),
(49, 1, NULL, 6, 9, 'Gustavo', 'Masculino', '(85)92345-1234', '1999-06-11', '11111111174', '00000059', 'Casa 59', 'Rua da Esperança', '111111168', 'CE', NULL, '300049'),
(50, 1, NULL, 9, 10,'Simone', 'Feminino', '(71)93765-4321', '1997-02-16', '11111111175', '00000060', 'Casa 60', 'Rua do Campo', '111111169', 'BA', NULL, '300050');

insert into Remedio (id_remedio, nome_remedio) values
(1, 'Ibuprofeno'),
(2, 'Dipirona'),
(3, 'Dramin B6'),
(4, 'Omeprazol'),
(5, 'Pantoprazol'),
(6, 'Dorflex'),
(7, 'Neosaldina');

insert into Uso_Remedio (id_uso, id_paciente, id_remedio, quantidade_ingerida) values
(1, 1, 1,'10Ml'),
(2, 2, 1,'20Ml'),
(3, 3, 1,'10Ml'),
(4, 4, 1,'20Ml'),
(5, 5, 1,'10Ml'),
(6, 6, 1,'20Ml'),
(7, 7, 1,'10Ml'),
(8, 8, 1,'20Ml');

