CREATE DATABASE SistemaCarcerario;

USE SistemaCarcerario;

CREATE TABLE Prisoes (
    prisao_id INT PRIMARY KEY AUTO_INCREMENT,
    endereco VARCHAR(50),
    N_celas INT,
    descricao VARCHAR(255)
);

CREATE TABLE Celas (
    cela_id INT PRIMARY KEY AUTO_INCREMENT,
    setor VARCHAR(50),
    lotacao INT,
    N_presos INT,
    descricao VARCHAR(255),
    prisao_id INT,
    FOREIGN KEY (prisao_id) REFERENCES Prisoes(prisao_id)
);

CREATE TABLE Presos (
    preso_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    data_nascimento DATE,
    cpf VARCHAR(11),
    sexo CHAR(1),
    endereco VARCHAR(255),
    data_entrada DATE,
    data_prevista_saida DATE,
    cela_id INT,
    FOREIGN KEY (cela_id) REFERENCES Celas(cela_id)
);

CREATE TABLE Crimes (
    crime_id INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(50),
    gravidade VARCHAR(50),
    descricao VARCHAR(255),
    preso_id INT,
    FOREIGN KEY (preso_id) REFERENCES Presos(preso_id)
);

CREATE TABLE Sentencas (
    sentenca_id INT PRIMARY KEY AUTO_INCREMENT,
    duracao VARCHAR(50),
    descricao VARCHAR(255),
    crime_id INT,
    FOREIGN KEY (crime_id) REFERENCES Crimes(crime_id)
);

CREATE TABLE Programa (
    programa_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    tipo VARCHAR(50),
    descricao VARCHAR(255)
);

CREATE TABLE Participacao (
    participacao_id INT PRIMARY KEY AUTO_INCREMENT,
    dt_inicio DATE,
    dt_fim DATE,
    descricao VARCHAR(255),
    preso_id INT,
    programa_id INT,
    FOREIGN KEY (preso_id) REFERENCES Presos(preso_id),
    FOREIGN KEY (programa_id) REFERENCES Programa(programa_id)
);

CREATE TABLE Saude (
    saude_id INT PRIMARY KEY AUTO_INCREMENT,
    complicacao VARCHAR(50),
    condicao VARCHAR(50),
    dt_diagnostico DATE,
    tratamento VARCHAR(255),
    preso_id INT,
    FOREIGN KEY (preso_id) REFERENCES Presos(preso_id)
);

CREATE TABLE Funcionario (
    funcionario_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    cargo VARCHAR(50),
    h_inicio TIME,
    h_fim TIME,
    contato VARCHAR(50),
    prisao_id INT,
    FOREIGN KEY (prisao_id) REFERENCES Prisoes(prisao_id)
);

USE SistemaCarcerario;

INSERT INTO Prisoes (endereco, N_celas, descricao) VALUES
('Rua da Paz, 123', 50, 'Prisão de segurança média localizada na cidade de São Paulo.'),
('Av. Liberdade, 456', 80, 'Prisão de segurança máxima localizada na cidade do Rio de Janeiro.'),
('Rua das Flores, 789', 30, 'Prisão de segurança mínima localizada na cidade de Belo Horizonte.');

INSERT INTO Celas (setor, lotacao, N_presos, descricao, prisao_id) VALUES
('A', 10, 8, 'Cela no setor A, próxima ao refeitório.', 1),
('B', 12, 12, 'Cela no setor B, próxima ao pátio de exercícios.', 1),
('A', 10, 8, 'Cela no setor A, próxima ao refeitório.', 2),
('B', 12, 12, 'Cela no setor B, próxima ao pátio de exercícios.', 2),
('C', 8, 7, 'Cela no setor C, próximo à enfermaria.', 3),
('D', 15, 10, 'Cela no setor D, próximo ao campo de futebol.', 3);

INSERT INTO Presos (nome, data_nascimento, cpf, sexo, endereco, data_entrada, data_prevista_saida, cela_id) VALUES
('João Silva', '1985-05-15', '12345678901', 'M', 'Rua A, 123', '2022-01-10', '2025-01-10', 1),
('Maria Souza', '1990-08-22', '23456789012', 'F', 'Rua B, 456', '2021-03-15', '2024-03-15', 2),
('Pedro Oliveira', '1975-11-30', '34567890123', 'M', 'Rua C, 789', '2019-06-20', '2023-06-20', 3),
('Ana Costa', '1980-04-18', '45678901234', 'F', 'Rua D, 101', '2020-09-10', '2023-09-10', 4),
('Lucas Pereira', '1995-12-25', '56789012345', 'M', 'Rua E, 202', '2023-01-01', '2026-01-01', 5),
('Clara Santos', '1987-07-14', '67890123456', 'F', 'Rua F, 303', '2022-02-20', '2025-02-20', 6),
('Paula Souza', '1987-09-05', '73245678901', 'F', 'Rua Z, 2323', '2022-03-10', '2025-03-10', 1),
('Leandro Oliveira', '1984-12-18', '83245678901', 'M', 'Rua AA, 2424', '2021-01-15', '2024-01-15', 2),
('Carla Costa', '1992-03-25', '93245678901', 'F', 'Rua BB, 2525', '2020-04-10', '2023-04-10', 3),
('Vinícius Pereira', '1980-10-12', '04245678901', 'M', 'Rua CC, 2626', '2019-07-20', '2023-07-20', 4),
('Fabiana Santos', '1993-08-22', '14245678901', 'F', 'Rua DD, 2727', '2022-05-15', '2025-05-15', 5),
('Rafael Almeida', '1986-02-10', '24245678901', 'M', 'Rua EE, 2828', '2021-06-10', '2024-06-10', 6),
('Marcelo Oliveira', '1984-12-25', '26245678901', 'M', 'Rua YY, 4848', '2021-01-10', '2024-01-10', 1),
('Roberta Costa', '1990-05-15', '36245678901', 'F', 'Rua ZZ, 4949', '2020-07-20', '2023-07-20', 2),
('Vitor Pereira', '1988-08-18', '46245678901', 'M', 'Rua AA, 5050', '2023-02-15', '2026-02-15', 3),
('Débora Santos', '1985-11-25', '56245678901', 'F', 'Rua BB, 5151', '2022-03-20', '2025-03-20', 4),
('Antônio Almeida', '1991-09-30', '66245678901', 'M', 'Rua CC, 5252', '2021-10-10', '2024-10-10', 5),
('Simone Lima', '1979-07-14', '76245678901', 'F', 'Rua DD, 5353', '2020-11-15', '2023-11-15', 6);

INSERT INTO Crimes (tipo, gravidade, descricao, preso_id) VALUES
('Roubo', 'Alto', 'Roubo à mão armada', 1),
('Tráfico', 'Alto', 'Tráfico de drogas', 2),
('Assassinato', 'Extremo', 'Homicídio doloso', 3),
('Furto', 'Médio', 'Furto de veículo', 4),
('Estelionato', 'Médio', 'Fraude financeira', 5),
('Sequestro', 'Alto', 'Sequestro e cárcere privado', 6),
('Porte Ilegal de Arma', 'Alto', 'Porte ilegal de arma de fogo', 7),
('Violência Doméstica', 'Médio', 'Agressão física a cônjuge', 8),
('Latrocínio', 'Extremo', 'Roubo seguido de morte', 9),
('Corrupção', 'Alto', 'Corrupção ativa', 10),
('Tráfico de Drogas', 'Alto', 'Tráfico internacional de entorpecentes', 11),
('Lavagem de Dinheiro', 'Alto', 'Lavagem de dinheiro', 12),
('Assalto', 'Alto', 'Assalto à mão armada', 13),
('Extorsão', 'Alto', 'Extorsão mediante sequestro', 14),
('Homicídio', 'Extremo', 'Homicídio qualificado', 15),
('Tráfico Humano', 'Extremo', 'Tráfico de pessoas', 16),
('Fraude', 'Médio', 'Fraude bancária', 17),
('Abuso de Menores', 'Extremo', 'Abuso sexual de menores', 18);

INSERT INTO Sentencas (duracao, descricao, crime_id) VALUES
('5 anos', 'Sentença por roubo à mão armada', 1),
('10 anos', 'Sentença por tráfico de drogas', 2),
('25 anos', 'Sentença por homicídio doloso', 3),
('3 anos', 'Sentença por furto de veículo', 4),
('4 anos', 'Sentença por fraude financeira', 5),
('15 anos', 'Sentença por sequestro e cárcere privado', 6),
('7 anos', 'Sentença por porte ilegal de arma de fogo', 7),
('2 anos', 'Sentença por agressão física a cônjuge', 8),
('30 anos', 'Sentença por roubo seguido de morte', 9),
('8 anos', 'Sentença por corrupção ativa', 10),
('20 anos', 'Sentença por tráfico internacional de entorpecentes', 11),
('12 anos', 'Sentença por lavagem de dinheiro', 12),
('6 anos', 'Sentença por assalto à mão armada', 13),
('18 anos', 'Sentença por extorsão mediante sequestro', 14),
('25 anos', 'Sentença por homicídio qualificado', 15),
('20 anos', 'Sentença por tráfico de pessoas', 16),
('5 anos', 'Sentença por fraude bancária', 17),
('30 anos', 'Sentença por abuso sexual de menores', 18);

INSERT INTO Programa (nome, tipo, descricao) VALUES
('Trabalho', 'Reabilitação', 'Duração: 6 meses'),
('Educação', 'Reabilitação', 'Duração: 6 meses'),
('Terapia', 'Reabilitação', 'Duração: 6 meses'),
('Treinamento', 'Reabilitação', 'Duração: 6 meses'),
('Oficinas Culturais', 'Reabilitação', 'Duração: 3 meses'),
('Esportes', 'Reabilitação', 'Duração: 4 meses'),
('Artesanato', 'Reabilitação', 'Duração: 5 meses'),
('Leitura e Escrita', 'Reabilitação', 'Duração: 6 meses'),
('Programação', 'Reabilitação', 'Duração: 8 meses'),
('Música', 'Reabilitação', 'Duração: 4 meses'),
('Teatro', 'Reabilitação', 'Duração: 4 meses'),
('Culinária', 'Reabilitação', 'Duração: 3 meses'),
('Jardinagem', 'Reabilitação', 'Duração: 2 meses'),
('Empreendedorismo', 'Reabilitação', 'Duração: 7 meses'),
('Meditação', 'Reabilitação', 'Duração: 1 mês');

INSERT INTO Participacao (dt_inicio, dt_fim, descricao, programa_id, preso_id) VALUES
('2023-01-01', '2023-06-30', 'Trabalho', 1, 1),
('2023-02-01', '2023-07-31', 'Educação', 2, 2),
('2023-03-01', '2023-08-31', 'Terapia', 3, 3),
('2023-04-01', '2023-09-30', 'Treinamento', 4, 4),
('2023-05-01', '2023-08-31', 'Oficinas Culturais', 5, 5),
('2023-06-01', '2023-09-30', 'Esportes', 6, 6),
('2023-07-01', '2023-11-30', 'Artesanato', 7, 7),
('2023-08-01', '2024-01-31', 'Leitura e Escrita', 8, 8),
('2023-09-01', '2024-04-30', 'Programação', 9, 9),
('2023-10-01', '2024-01-31', 'Música', 10, 10),
('2023-11-01', '2024-02-29', 'Teatro', 11, 11),
('2023-12-01', '2024-02-29', 'Culinária', 12, 12),
('2024-01-01', '2024-02-29', 'Jardinagem', 13, 13),
('2024-02-01', '2024-08-31', 'Empreendedorismo', 14, 14),
('2024-03-01', '2024-03-31', 'Meditação', 15, 15),
('2024-04-01', '2024-09-30', 'Trabalho', 1, 16),
('2024-05-01', '2024-10-31', 'Educação', 2, 17),
('2024-06-01', '2024-11-30', 'Terapia', 3, 18);

INSERT INTO Saude (complicacao, condicao, dt_diagnostico, tratamento, preso_id) VALUES
('Nenhuma', 'Saudável', '2023-01-01', 'Nenhum', 1),
('Hipertensão', 'Controlada', '2023-02-01', 'Medicação diária', 2),
('Diabetes', 'Controlada', '2023-03-01', 'Insulina diária', 3),
('Nenhuma', 'Saudável', '2023-04-01', 'Nenhum', 4),
('Asma', 'Controlada', '2023-05-01', 'Inalação', 5),
('Nenhuma', 'Saudável', '2023-06-01', 'Nenhum', 6),
('Depressão', 'Tratamento', '2023-07-01', 'Terapia semanal', 7),
('Nenhuma', 'Saudável', '2023-08-01', 'Nenhum', 8),
('Hipertensão', 'Controlada', '2023-09-01', 'Medicação diária', 9),
('Nenhuma', 'Saudável', '2023-10-01', 'Nenhum', 10),
('Diabetes', 'Controlada', '2023-11-01', 'Insulina diária', 11),
('Nenhuma', 'Saudável', '2023-12-01', 'Nenhum', 12),
('Asma', 'Controlada', '2024-01-01', 'Inalação', 13),
('Nenhuma', 'Saudável', '2024-02-01', 'Nenhum', 14),
('Depressão', 'Tratamento', '2024-03-01', 'Terapia semanal', 15),
('Nenhuma', 'Saudável', '2024-04-01', 'Nenhum', 16),
('Hipertensão', 'Controlada', '2024-05-01', 'Medicação diária', 17),
('Nenhuma', 'Saudável', '2024-06-01', 'Nenhum', 18);

INSERT INTO Funcionario (nome, cargo, h_inicio, h_fim, contato, prisao_id) VALUES
('Carlos Silva', 'Agente Penitenciário', '08:00:00', '17:00:00', 'carlos.silva@example.com', '1'),
('Ana Paula Souza', 'Assistente Social', '09:00:00', '18:00:00', 'ana.souza@example.com', '2'),
('João Ferreira', 'Psicólogo', '08:00:00', '17:00:00', 'joao.ferreira@example.com', '3'),
('Maria Oliveira', 'Médica', '07:00:00', '16:00:00', 'maria.oliveira@example.com', '1'),
('Pedro Santos', 'Enfermeiro', '08:00:00', '17:00:00', 'pedro.santos@example.com', '2'),
('Fernanda Lima', 'Advogada', '09:00:00', '18:00:00', 'fernanda.lima@example.com', '3'),
('Daniel Rodrigues', 'Agente Penitenciário', '08:00:00', '17:00:00', 'daniel.rodrigues@example.com', '1'),
('Lucas Almeida', 'Professor', '10:00:00', '19:00:00', 'lucas.almeida@example.com', '2'),
('Juliana Costa', 'Coordenadora', '07:00:00', '16:00:00', 'juliana.costa@example.com', '3'),
('Ricardo Pereira', 'Instrutor de Oficinas', '08:00:00', '17:00:00', 'ricardo.pereira@example.com', '1'),
('Beatriz Ramos', 'Nutricionista', '07:00:00', '16:00:00', 'beatriz.ramos@example.com', '2'),
('Gustavo Nunes', 'Agente Penitenciário', '08:00:00', '17:00:00', 'gustavo.nunes@example.com', '3'),
('Carla Mendes', 'Psicóloga', '09:00:00', '18:00:00', 'carla.mendes@example.com', '1'),
('Rafael Lima', 'Advogado', '10:00:00', '19:00:00', 'rafael.lima@example.com', '2'),
('Bruna Souza', 'Enfermeira', '08:00:00', '17:00:00', 'bruna.souza@example.com', '3'),
('Felipe Martins', 'Médico', '07:00:00', '16:00:00', 'felipe.martins@example.com', '1'),
('Renata Silva', 'Assistente Social', '09:00:00', '18:00:00', 'renata.silva@example.com', '2'),
('Marcelo Costa', 'Professor', '10:00:00', '19:00:00', 'marcelo.costa@example.com', '3'),
('Larissa Almeida', 'Nutricionista', '07:00:00', '16:00:00', 'larissa.almeida@example.com', '1'),
('Tiago Santos', 'Instrutor de Oficinas', '08:00:00', '17:00:00', 'tiago.santos@example.com', '2'),
('Camila Pereira', 'Coordenadora', '07:00:00', '16:00:00', 'camila.pereira@example.com', '3');

// Views
USE SistemaCarcerario;

CREATE VIEW Prisioneiros_Crimes AS
SELECT 
    Presos.preso_id,
    Presos.nome AS Nome_Preso,
    Crimes.tipo AS Tipo_Crime,
    Crimes.gravidade AS Gravidade_Crime,
    Crimes.descricao AS Descricao_Crime
FROM 
    Presos
JOIN 
    Crimes ON Presos.preso_id = Crimes.preso_id;
 
SELECT * FROM Prisioneiros_Crimes;

CREATE VIEW Prisioneiros_Sentencas AS
SELECT 
    Presos.preso_id,
    Presos.nome AS Nome_Preso,
    Sentencas.duracao AS Duracao_Sentenca,
    Sentencas.descricao AS Descricao_Sentenca
FROM 
    Presos
JOIN 
    Crimes ON Presos.preso_id = Crimes.preso_id
JOIN 
    Sentencas ON Crimes.crime_id = Sentencas.crime_id;

SELECT * FROM Prisioneiros_Sentencas;

CREATE VIEW Ocupacao_Celas AS
SELECT 
    Celas.cela_id,
    Celas.setor,
    Celas.lotacao,
    Celas.N_presos,
    Prisoes.endereco AS Endereco_Prisao
FROM 
    Celas
JOIN 
    Prisoes ON Celas.prisao_id = Prisoes.prisao_id;

SELECT * FROM Ocupacao_Celas;

CREATE VIEW Prisioneiros_Programas AS
SELECT 
    Presos.preso_id,
    Presos.nome AS Nome_Preso,
    Programa.nome AS Nome_Programa,
    Participacao.dt_inicio,
    Participacao.dt_fim,
    Participacao.descricao AS Descricao_Participacao
FROM 
    Presos
JOIN 
    Participacao ON Presos.preso_id = Participacao.preso_id
JOIN 
    Programa ON Participacao.programa_id = Programa.programa_id;

SELECT * FROM Prisioneiros_Programas;

CREATE VIEW Prisioneiros_Saude AS
SELECT 
    Presos.preso_id,
    Presos.nome AS Nome_Preso,
    Saude.complicacao,
    Saude.condicao,
    Saude.dt_diagnostico,
    Saude.tratamento
FROM 
    Presos
JOIN 
    Saude ON Presos.preso_id = Saude.preso_id;    

SELECT * FROM Prisioneiros_Saude;

CREATE VIEW Funcionarios_Prisao AS
SELECT 
    Funcionario.funcionario_id,
    Funcionario.nome AS Nome_Funcionario,
    Funcionario.cargo,
    Funcionario.h_inicio,
    Funcionario.h_fim,
    Prisoes.endereco AS Endereco_Prisao
FROM 
    Funcionario
JOIN 
    Prisoes ON Funcionario.prisao_id = Prisoes.prisao_id;
    

SELECT * FROM Funcionarios_Prisao;

CREATE VIEW Prisioneiros_Sentencas_Longas AS
SELECT 
    Presos.preso_id,
    Presos.nome AS Nome_Preso,
    Sentencas.duracao,
    Sentencas.descricao
FROM 
    Presos
JOIN 
    Crimes ON Presos.preso_id = Crimes.preso_id
JOIN 
    Sentencas ON Crimes.crime_id = Sentencas.crime_id
WHERE 
    CAST(SUBSTRING_INDEX(Sentencas.duracao, ' ', 1) AS UNSIGNED) >= 10; 

SELECT * FROM Prisioneiros_Sentencas_Longas;

CREATE VIEW Programas_Atuais AS
SELECT 
    Programa.programa_id,
    Programa.nome AS Nome_Programa,
    Programa.tipo,
    Programa.descricao,
    Participacao.dt_inicio,
    Participacao.dt_fim
FROM 
    Programa
JOIN 
    Participacao ON Programa.programa_id = Participacao.programa_id
WHERE 
    Participacao.dt_fim >= CURDATE();

SELECT * FROM Programas_Atuais;

CREATE VIEW Prisioneiros_Complicacoes_Saude AS
SELECT 
    Presos.preso_id,
    Presos.nome AS Nome_Preso,
    Saude.complicacao,
    Saude.condicao,
    Saude.tratamento
FROM 
    Presos
JOIN 
    Saude ON Presos.preso_id = Saude.preso_id
WHERE 
    Saude.complicacao != 'Nenhuma';

SELECT * FROM Prisioneiros_Complicacoes_Saude;

// Stored Procedures
USE SistemaCarcerario;

DELIMITER //
CREATE PROCEDURE InserirPreso(
    IN nome VARCHAR(100),
    IN data_nascimento DATE,
    IN cpf VARCHAR(11),
    IN sexo CHAR(1),
    IN endereco VARCHAR(255),
    IN data_entrada DATE,
    IN data_prevista_saida DATE,
    IN cela_id INT
)
BEGIN
    INSERT INTO Presos (nome, data_nascimento, cpf, sexo, endereco, data_entrada, data_prevista_saida, cela_id)
    VALUES (nome, data_nascimento, cpf, sexo, endereco, data_entrada, data_prevista_saida, cela_id);
END //
DELIMITER ;

SELECT * FROM Presos;
CALL InserirPreso('Jacinto Leite', '1990-01-01', '12345678900', 'M', 'Rua Birinba, 123', '2024-01-01', '2027-01-01', 1);
CALL InserirPreso('inocentiudo da silva', '1780-04-01', '02345078900', 'M', 'Rua Dterra, 9872', '2000-01-01', '2027-01-01', 2);

DELIMITER //
CREATE PROCEDURE AtualizarPreso(
    IN pid INT,
    IN novo_nome VARCHAR(100),
    IN novo_endereco VARCHAR(255)
)
BEGIN
    UPDATE Presos
    SET nome = novo_nome, endereco = novo_endereco
    WHERE preso_id = pid;           # aqui poderia ser desativado o safe mode da tabela, pra fazer o update, mas desse jeito fica mais bonito(usando pid no lugar de preso_id)
END //
DELIMITER ;

SELECT * FROM Presos;
CALL AtualizarPreso(1, 'Jalan bipal', 'Rua Cemsaida, 456');

DELIMITER //
CREATE PROCEDURE DeletarPreso(
    IN pid INT
)
BEGIN
    DELETE FROM Presos WHERE preso_id = pid;
END //
DELIMITER ;

SELECT * FROM Presos;
CALL DeletarPreso(20);

DELIMITER //
CREATE PROCEDURE InserirPrograma(
    IN nome VARCHAR(50),
    IN tipo VARCHAR(50),
    IN descricao VARCHAR(255)
)
BEGIN
    INSERT INTO Programa (nome, tipo, descricao) 
    VALUES (nome, tipo, descricao);
END //
DELIMITER ;

SELECT * FROM Programa;
CALL InserirPrograma('Como ser um otimo professor', 'Reabilitação', 'Basta ser igual o Reni Pinto');

DELIMITER //
CREATE PROCEDURE AtualizarPrograma(
    IN prog INT,
    IN novo_nome VARCHAR(50),
    IN nova_descricao VARCHAR(255)
)
BEGIN
    UPDATE Programa
    SET nome = novo_nome, descricao = nova_descricao
    WHERE programa_id = prog;
END //
DELIMITER ;

CALL AtualizarPrograma(1, 'Roubo', 'Como roubar com excelencia');
SELECT * FROM Programa;
DROP PROCEDURE AtualizarPrograma;

DELIMITER //
CREATE PROCEDURE InserirPrisao(
    IN endereco VARCHAR(50),
    IN N_celas INT,
    IN descricao VARCHAR(255)
)
BEGIN
    INSERT INTO Prisoes (endereco, N_celas, descricao) VALUES (endereco, N_celas, descricao);
END //
DELIMITER ;

CALL InserirPrisao('Rua Novembro, 456', 100, 'Prisão de quem ama demais.');
SELECT * FROM Prisoes;

DELIMITER //
CREATE PROCEDURE InserirFuncionario(
    IN nome VARCHAR(50),
    IN cargo VARCHAR(50),
    IN h_inicio TIME,
    IN h_fim TIME,
    IN contato VARCHAR(50),
    IN prisao_id INT
)
BEGIN
    INSERT INTO Funcionario (nome, cargo, h_inicio, h_fim, contato, prisao_id)
    VALUES (nome, cargo, h_inicio, h_fim, contato, prisao_id);
END //
DELIMITER ;

CALL InserirFuncionario('Tokuku Navara', 'Limpador', '09:00:00', '18:00:00', 'NAVARA@gmail.com', 1);
SELECT *FROM Funcionario;

DELIMITER //
CREATE PROCEDURE AtualizarFuncionario(
    IN fun INT,
    IN novo_cargo VARCHAR(50),
    IN novo_contato VARCHAR(50)
)
BEGIN
    UPDATE Funcionario
    SET cargo = novo_cargo, contato = novo_contato
    WHERE funcionario_id = fun;
END //
DELIMITER ;

CALL AtualizarFuncionario(1, 'Dançarino :)', 'Dançabebe@uiui.com');
SELECT *FROM Funcionario;

DELIMITER //
CREATE PROCEDURE DeletarFuncionario(
    IN fun INT
)
BEGIN
    DELETE FROM Funcionario WHERE funcionario_id = fun;
END //
DELIMITER ;

CALL DeletarFuncionario(1); #demitido por ficar dançando em serviço
SELECT *FROM Funcionario;

DELIMITER //
CREATE PROCEDURE InserirCela(
    IN setor VARCHAR(50),
    IN lotacao INT,
    IN N_presos INT,
    IN descricao VARCHAR(255),
    IN prisao_id INT
)
BEGIN
    INSERT INTO Celas (setor, lotacao, N_presos, descricao, prisao_id)
    VALUES (setor, lotacao, N_presos, descricao, prisao_id);
END //
DELIMITER ;

CALL InserirCela('Setor X-men', 20, 15, 'Jaula do leao.', 1);
SELECT *FROM Celas;

