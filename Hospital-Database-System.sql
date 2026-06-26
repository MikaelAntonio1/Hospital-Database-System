CREATE TABLE pacientes(
	id serial primary key,
	nome varchar(100) NOT NULL,
	cpf VARCHAR(100) NOT NULL,
	telefone VARCHAR(15) NOT NULL,
	tipo_sanguineo VARCHAR(3) NOT NULL, -- ('A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-')
	Contato_Emergencia VARCHAR(15) NOT NULL
);

CREATE TABLE medicos(
	id serial primary key,
	nome VARCHAR(100) NOT NULL,
	crm VARCHAR(100) NOT NULL,
	especialidade VARCHAR(75) NOT NULL,
	telefone VARCHAR(15) NOT NULL
);

CREATE TABLE consulta(
	id serial primary key,
	idpaciente INT NOT NULL,
	idmedicos INT NOT NULL,

	FOREIGN KEY (idpaciente) REFERENCES pacientes(id),
	FOREIGN KEY (idmedicos) REFERENCES medicos(id),
	dataehora timestamp,
	
	agendamento VARCHAR(15) NOT NULL -- Agendado , Confirmado , Cancelado
);

CREATE TABLE quartos(
	id serial primary key,
	numero_quarto varchar(5) NOT NULL,
	tipo_quarto varchar(40) NOT NULL
);

CREATE TABLE leitos(
	id serial primary key,
	idquarto INT NOT NULL,
	FOREIGN KEY (idquarto) REFERENCES quartos(id),
	ocupacao VARCHAR(15) NOT NULL -- Disponível , Ocupado
);

CREATE TABLE interacao(
	id_paciente INT,
	id_leito INT,
	data_entrada timestamp NOT NULL,
	data_saida timestamp,
	
	FOREIGN KEY (id_paciente) REFERENCES pacientes(id),
	FOREIGN KEY (id_leito) REFERENCES leitos(id)
);

INSERT INTO pacientes (nome, cpf, telefone, tipo_sanguineo, Contato_Emergencia) VALUES
('Fernanda Ribeiro Dias', '34567890122', '11977772222', 'O-', '11966663333'),
('Rodrigo Cardoso Silva', '90123456733', '21966663333', 'A+', '21955554444'),
('Amanda Vieira Ramos', '65432109844', '31955554444', 'B+', '31944445555'),
('Ricardo Teixeira Nunes', '78901234555', '41944445555', 'AB+', '41933336666'),
('Beatriz Fontes Cunha', '21098765466', '81933336666', 'O+', '81922227777'),
('Thiago Malta Castro', '56712389077', '11922227777', 'A-', '11911118888'),
('Julio Cezar Antunes', '89045612388', '21911118888', 'B-', '21900009999'),
('Leticia Neves Rocha', '12389045699', '31900009999', 'AB-', '31988880000'),
('Fabio Assuncao Melo', '45623478911', '71988880000', 'O+', '71977771111'),
('Patricia Pillar Costa', '78956712322', '85977771111', 'A+', '85966662222'),
('Matheus Nachtergaele', '32198745633', '11966662222', 'O-', '11955553333'),
('Renata Sorrah Santos', '98732165444', '21955553333', 'B-', '21944444444'),
('Caio Blat de Oliveira', '65498732155', '31944444444', 'AB+', '31933335555'),
('Deborah Secco Moura', '15926348766', '41933335555', 'A+', '41922226666'),
('Murilo Benicio Ribeiro', '75315948677', '81922226666', 'O+', '81911117777'),
('Giovanna Antonelli Prado', '85296374188', '11911117777', 'B+', '11900008888'),
('Alexandre Nero Silva', '96385274199', '21900008888', 'A-', '21999991111'),
('Flavia Alessandra Costa', '14725836911', '31999991111', 'AB-', '31988882222'),
('Otaviano Costa Neto', '36925814722', '71988882222', 'O-', '71977773333'),
('Paolla Oliveira Souza', '25836914733', '85977773333', 'A+', '85966664444'),
('Reynaldo Gianecchini', '74185296344', '11966664444', 'B+', '11955555555'),
('Carolina Dieckmann', '85274196355', '21955555555', 'O+', '21944446666'),
('Caua Reymond Marques', '96314725866', '31944446666', 'AB+', '31933337777'),
('Alinne Moraes Rego', '15948726377', '41933337777', 'A-', '41922228888'),
('Rafael Cardoso Lemos', '35795148688', '81922228888', 'O-', '81911119999'),
('Isis Valverde Nable', '48625913799', '11911119999', 'B-', '11900000000'),
('Marjorie Estiano Rocha', '26315948711', '21900000000', 'AB-', '21988881112'),
('Lazaro Ramos Araujo', '78451296322', '31988881112', 'O+', '31977772223'),
('Tais Araujo Ramos', '96325874133', '71977772223', 'A+', '71966663334'),
('Wagner Moura Silva', '12354687944', '85966663334', 'B+', '85955554445'),
('Alice Braga Moraes', '98765412355', '11955554445', 'AB+', '11944445556'),
('Selton Mello Reis', '45612378966', '21944445556', 'O-', '21933336667'),
('Danton Mello Reis', '78945612377', '31933336667', 'A-', '31922227778'),
('Leandra Leal Moura', '32145698788', '41922227778', 'B-', '41911118889'),
('Bruno Gagliasso Marques', '65412398799', '81911118889', 'O+', '81900009990'),
('Giovanna Ewbank Baldacconi', '14796325811', '11900009990', 'A+', '11999992222'),
('Thiago Lacerda Santos', '25814736922', '21999992222', 'B+', '21988883333'),
('Grazi Massafera Pinto', '36914725833', '31988883333', 'AB-', '31977774444'),
('Henri Castelli Fernandes', '74196325844', '71977774444', 'O-', '71966665555'),
('Juliana Paes Costa', '85214796355', '85966665555', 'A+', '85955556666');

SELECT * FROM pacientes

-- Medicos

INSERT INTO medicos (nome, crm, especialidade, telefone) VALUES
('Dr. Arnaldo Silva Prado', '123456SP', 'Cardiologia', '11987654321'),
('Dra. Beatriz Mendes Rocha', '987654RJ', 'Pediatria', '21998887766'),
('Dr. Carlos Eduardo Costa', '456123MG', 'Ortopedia', '31985554433'),
('Dra. Daniela Albuquerque', '321654PR', 'Dermatologia', '41977776655'),
('Dr. Fernando Justo Neto', '789123PE', 'Ginecologia e Obstetrícia', '81966665544'),
('Dra. Gabriela Fontes Lima', '234567SP', 'Neurologia', '11955554444'),
('Dr. Henrique Souza Melo', '876543RJ', 'Oftalmologia', '21944443333'),
('Dra. Isabela Ramos Vieira', '567890MG', 'Psiquiatria', '31933332222'),
('Dr. Jorge Amado Filho', '432109BA', 'Endocrinologia', '71922221111'),
('Dra. Kátia Cilene Barbosa', '678901CE', 'Otorrinolaringologia', '85911110000'),
('Dr. Leonardo Ribeiro Dias', '345678SP', 'Clínica Médica', '11977772222'),
('Dra. Mariana Cardoso Silva', '901234RJ', 'Urologia', '21966663333'),
('Dr. Nuno Antunes Ramos', '654321MG', 'Infectologia', '31955554444'),
('Dra. Olívia Teixeira Nunes', '789012PR', 'Oncologia', '41944445555'),
('Dr. Paulo Roberto Cunha', '210987PE', 'Gastroenterologia', '81933336666'),
('Dra. Renata Malta Castro', '567123SP', 'Pneumologia', '11922227777'),
('Dr. Samuel Cezar Antunes', '890456RJ', 'Cirurgia Geral', '21911118888'),
('Dra. Tatiana Neves Rocha', '123890MG', 'Dermatologia', '31900009999'),
('Dr. Ulisses Assunção Melo', '456234BA', 'Cardiologia', '71988880000'),
('Dra. Vanessa Pillar Costa', '789567CE', 'Pediatria', '85977771111'),
('Dr. Wagner Nachtergaele', '321987SP', 'Ortopedia', '11966662222'),
('Dra. Yasmin Sorrah Santos', '987321RJ', 'Ginecologia e Obstetrícia', '21955553333'),
('Dr. Zeca Blat de Oliveira', '654987MG', 'Geriatria', '31944444444'),
('Dra. Alice Secco Moura', '159263PR', 'Reumatologia', '41933335555'),
('Dr. Bruno Benício Ribeiro', '753159PE', 'Nefrologia', '81922226666'),
('Dra. Camila Antonelli Prado', '852963SP', 'Neurologia', '11911117777'),
('Dr. Daniel Nero Silva', '963852RJ', 'Psiquiatria', '21900008888'),
('Dra. Eliane Alessandra Costa', '147258MG', 'Oftalmologia', '31999991111'),
('Dr. Fábio Costa Neto', '369258BA', 'Clínica Médica', '71988882222'),
('Dra. Gisele Oliveira Souza', '258369CE', 'Endocrinologia', '85977773333'),
('Dr. Heitor Gianecchini', '741852SP', 'Cirurgia Geral', '11966664444'),
('Dra. Iara Dieckmann', '852741RJ', 'Pediatria', '21955555555'),
('Dr. João Reymond Marques', '963147MG', 'Cardiologia', '31944446666'),
('Dra. Karina Moraes Rego', '159487PR', 'Gastroenterologia', '41933337777'),
('Dr. Luis Cardoso Lemos', '357951PE', 'Ortopedia', '81922228888'),
('Dra. Marta Valverde Nable', '486259SP', 'Otorrinolaringologia', '11911119999'),
('Dr. Nelson Estiano Rocha', '263159RJ', 'Urologia', '21900000000'),
('Dra. Patrícia Ramos Araújo', '784512MG', 'Oncologia', '31988881112'),
('Dr. Ricardo Araújo Ramos', '963258BA', 'Pneumologia', '71977772223'),
('Dra. Sílvia Moura Silva', '123546CE', 'Clínica Médica', '85966663334');

SELECT * FROM medicos

-- Consultas

INSERT INTO consulta (idpaciente, idmedicos, dataehora, agendamento) VALUES
(1, 12, '2026-06-01 09:00:00', 'Confirmado'), -- Fernanda Ribeiro
(2, 5,  '2026-06-01 10:30:00', 'Confirmado'), -- Rodrigo Cardoso
(3, 22, '2026-06-02 14:00:00', 'Cancelado'),  -- Amanda Vieira
(4, 1,  '2026-06-03 08:15:00', 'Confirmado'), -- Ricardo Teixeira
(5, 30, '2026-06-15 11:00:00', 'Agendado'),   -- Beatriz Fontes
(6, 18, '2026-06-16 15:30:00', 'Agendado'),   -- Thiago Malta
(7, 7,  '2026-06-17 16:45:00', 'Agendado'),   -- Julio Cezar
(8, 40, '2026-06-18 10:00:00', 'Confirmado'), -- Leticia Neves
(9, 15, '2026-06-19 13:00:00', 'Cancelado'),  -- Fabio Assuncao
(10, 9, '2026-06-20 09:30:00', 'Agendado'),   -- Patricia Pillar
(11, 2, '2026-06-21 11:15:00', 'Confirmado'), -- Matheus Nachtergaele
(12, 14, '2026-06-21 14:00:00', 'Confirmado'),-- Renata Sorrah
(13, 25, '2026-06-22 08:00:00', 'Cancelado'), -- Caio Blat
(14, 33, '2026-06-22 10:30:00', 'Confirmado'),-- Deborah Secco
(15, 4, '2026-06-23 16:00:00', 'Agendado'),   -- Murilo Benicio
(16, 11, '2026-06-24 09:00:00', 'Confirmado'),-- Giovanna Antonelli
(17, 21, '2026-06-24 15:15:00', 'Agendado'),  -- Alexandre Nero
(18, 36, '2026-06-25 11:30:00', 'Cancelado'), -- Flavia Alessandra
(19, 8, '2026-06-25 14:45:00', 'Confirmado'), -- Otaviano Costa
(20, 19, '2026-06-26 10:00:00', 'Confirmado'),-- Paolla Oliveira
(21, 28, '2026-06-26 13:30:00', 'Agendado'),  -- Reynaldo Gianecchini
(22, 3, '2026-06-27 08:45:00', 'Confirmado'), -- Carolina Dieckmann
(23, 17, '2026-06-27 16:00:00', 'Cancelado'), -- Caua Reymond
(24, 31, '2026-06-28 09:15:00', 'Agendado'),  -- Alinne Moraes
(25, 10, '2026-06-28 11:00:00', 'Confirmado'),-- Rafael Cardoso
(26, 23, '2026-06-29 14:30:00', 'Confirmado'),-- Isis Valverde
(27, 39, '2026-06-29 15:45:00', 'Agendado'),  -- Marjorie Estiano
(28, 6, '2026-06-30 08:00:00', 'Confirmado'), -- Lazaro Ramos
(29, 16, '2026-06-30 10:15:00', 'Cancelado'), -- Tais Araujo
(30, 35, '2026-06-30 13:00:00', 'Agendado'),  -- Wagner Moura
(31, 13, '2026-07-01 09:30:00', 'Confirmado'),-- Alice Braga
(32, 27, '2026-07-01 11:00:00', 'Confirmado'),-- Selton Mello
(33, 32, '2026-07-02 14:15:00', 'Cancelado'), -- Danton Mello
(34, 20, '2026-07-02 16:30:00', 'Agendado'),  -- Leandra Leal
(35, 38, '2026-07-03 10:00:00', 'Confirmado'),-- Bruno Gagliasso
(36, 24, '2026-07-03 15:00:00', 'Confirmado'),-- Giovanna Ewbank
(37, 29, '2026-07-04 08:30:00', 'Agendado'),  -- Thiago Lacerda
(38, 34, '2026-07-04 11:45:00', 'Cancelado'), -- Grazi Massafera
(39, 26, '2026-07-05 13:15:00', 'Confirmado'),-- Henri Castelli
(40, 37, '2026-07-05 14:00:00', 'Agendado');  -- Juliana Paes Costa

SELECT 
    pacientes.nome AS "Nome Paciente", 
    medicos.nome AS "Nome Medico",
    medicos.especialidade AS "Especialidade",
    consulta.dataehora AS "Data/Hora",
    consulta.agendamento AS "Status"
FROM consulta
INNER JOIN pacientes ON consulta.idpaciente = pacientes.id
INNER JOIN medicos ON consulta.idmedicos = medicos.id;

-- QUARTOS

INSERT INTO quartos (numero_quarto, tipo_quarto) VALUES
('101', 'Enfermaria Masculina'),
('102', 'Enfermaria Feminina'),
('103', 'Pediatria (Enfermaria)'),
('104', 'Enfermaria Geral'),
('201', 'Apartamento Privativo'),
('202', 'Apartamento Privativo'),
('203', 'Apartamento Privativo'),
('204', 'Suíte Master (Particular)'),
('301', 'UTI Geral'),
('302', 'UTI Coronariana'),
('303', 'UTI Neonatal'),
('401', 'Isolamento'),
('402', 'Isolamento'),
('105', 'Observação Pronto Socorro'),
('106', 'Recuperação Pós-Anestésica');

SELECT * FROM quartos

SELECT 
    leitos.id AS "ID do Leito",
    quartos.numero_quarto AS "Número do Quarto", 
    quartos.tipo_quarto AS "Tipo de Acomodação",
    leitos.ocupacao AS "Status do Leito"
FROM leitos
INNER JOIN quartos ON leitos.idquarto = quartos.id
ORDER BY leitos.id;

-- LEITOS

INSERT INTO leitos (idquarto, ocupacao) VALUES
-- Quartos 101 e 102 (Enfermarias: 3 leitos em cada)
(1, 'Ocupado'),    -- Leito 1 da Enfermaria Masculina
(1, 'Disponível'), -- Leito 2 da Enfermaria Masculina
(1, 'Disponível'), -- Leito 3 da Enfermaria Masculina
(2, 'Ocupado'),    -- Leito 1 da Enfermaria Feminina
(2, 'Ocupado'),    -- Leito 2 da Enfermaria Feminina
(2, 'Disponível'), -- Leito 3 da Enfermaria Feminina

-- Quarto 103 e 104 (Pediatria e Enfermaria Geral: 2 leitos em cada)
(3, 'Ocupado'),    -- Leito 1 da Pediatria
(3, 'Disponível'), -- Leito 2 da Pediatria
(4, 'Ocupado'),    -- Leito 1 da Enfermaria Geral
(4, 'Disponível'), -- Leito 2 da Enfermaria Geral

-- Quartos 201 a 204 (Apartamentos e Suíte: 1 leito por quarto)
(5, 'Ocupado'),    -- Leito do Apartamento 201
(6, 'Disponível'), -- Leito do Apartamento 202
(7, 'Ocupado'),    -- Leito do Apartamento 203
(8, 'Disponível'), -- Leito da Suíte Master 204

-- Quartos 301 a 303 (UTIs: 3 leitos em cada para dar volume)
(9, 'Ocupado'),    -- Leito 1 da UTI Geral
(9, 'Ocupado'),    -- Leito 2 da UTI Geral
(9, 'Disponível'), -- Leito 3 da UTI Geral
(10, 'Ocupado'),   -- Leito 1 da UTI Coronariana
(10, 'Disponível'),-- Leito 2 da UTI Coronariana
(11, 'Ocupado'),   -- Leito 1 da UTI Neonatal
(11, 'Ocupado'),   -- Leito 2 da UTI Neonatal

-- Quartos 401 e 402 (Isolamentos: 1 leito por quarto)
(12, 'Ocupado'),   -- Leito do Isolamento 401
(13, 'Disponível'),-- Leito do Isolamento 402

-- Quartos 105 e 106 (Pronto Socorro e Pós-Anestésica: 2 leitos cada)
(14, 'Ocupado'),   -- Leito 1 da Observação
(14, 'Disponível'),-- Leito 2 da Observação
(15, 'Disponível'),-- Leito 1 da Recuperação
(15, 'Disponível');-- Leito 2 da Recuperação

-- interacao

INSERT INTO interacao (id_paciente, id_leito, data_entrada, data_saida) VALUES
-- Cenário 1: O paciente 1 entrou no leito 1 no dia 20/06/2026 e ainda está lá (alta é NULL)
(1, 1, '2026-06-20 08:30:00', NULL),

-- Cenário 2: O paciente 2 entrou no leito 3 dia 15/06/2026 e recebeu alta dia 22/06/2026
(2, 3, '2026-06-15 14:22:00', '2026-06-22 11:00:00'),

-- Cenário 3: O paciente 4 entrou no leito 4 dia 25/06/2026 e ainda está internado
(4, 4, '2026-06-25 19:45:00', NULL);

