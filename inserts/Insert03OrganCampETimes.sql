-- Criar pessoa organizador
INSERT INTO Pessoa (idPessoa, nome, cpf, data_nascimento) VALUES (21, 'Organizador 1', '12345678901', '1980-01-01');
INSERT INTO Organizador (Pessoa_idPessoa, login, senha) VALUES (21, 'organizador1', 'senhaorganizador1');

-- Criar campeonato
INSERT INTO Campeonato (idCampeonato, Organizador_Pessoa_idPessoa, nome) VALUES (1, 21, 'Brasileirao serie A');

-- Times participantes
INSERT INTO Time_participa_Campeonato (Time_idTime, Campeonato_idCampeonato) VALUES (1, 1);
INSERT INTO Time_participa_Campeonato (Time_idTime, Campeonato_idCampeonato) VALUES (2, 1);
INSERT INTO Time_participa_Campeonato (Time_idTime, Campeonato_idCampeonato) VALUES (3, 1);
INSERT INTO Time_participa_Campeonato (Time_idTime, Campeonato_idCampeonato) VALUES (4, 1);

-- Estádios do Time 1
INSERT INTO Estadio (idEstadio, nome, Time_idTime) VALUES (1, 'Frasqueirão', 1);
INSERT INTO Endereco_Estadio (Estadio_idEstadio, cep, rua, numero) VALUES (1, '12345678', 'Rua Estádio 1', 100);

-- Estádios do Time 2
INSERT INTO Estadio (idEstadio, nome, Time_idTime) VALUES (2, 'Arena das Dunas', 4);
INSERT INTO Endereco_Estadio (Estadio_idEstadio, cep, rua, numero) VALUES (2, '23456789', 'Rua Estádio 2', 200);

-- Estádios do Time 3
INSERT INTO Estadio (idEstadio, nome, Time_idTime) VALUES (3, 'Curral do mequinha', 2);
INSERT INTO Endereco_Estadio (Estadio_idEstadio, cep, rua, numero) VALUES (3, '34567890', 'Rua Estádio 3', 300);

-- Estádios do Time 4
INSERT INTO Estadio (idEstadio, nome, Time_idTime) VALUES (4, 'Barretão', 3);
INSERT INTO Endereco_Estadio (Estadio_idEstadio, cep, rua, numero) VALUES (4, '45678901', 'Rua Estádio 4', 400);
