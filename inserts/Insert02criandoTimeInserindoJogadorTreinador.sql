-- Inserir Times
INSERT INTO Time (idTime, nome)
VALUES (1, 'ABC'),
       (2, 'America'),
       (3, 'Globo'),
       (4, 'Alecrim');

-- Inserir Treinadores dos Times
INSERT INTO Treinador (Pessoa_idPessoa)
VALUES (22), -- ID do primeiro treinador
       (23), -- ID do segundo treinador
       (24), -- ID do terceiro treinador
       (25); -- ID do quarto treinador

-- Inserir Jogadores
INSERT INTO Jogador (Pessoa_idPessoa, numero_camisa)
VALUES (1, 10),
       (2, 7),
       (3, 9),
       (4, 5),
       (5, 2),
       (6, 10),
       (7, 7),
       (8, 9),
       (9, 5),
       (10, 2),
       (11, 10),
       (12, 7),
       (13, 9),
       (14, 5),
       (15, 2),
       (16, 10),
       (17, 7),
       (18, 9),
       (19, 5),
       (20, 2);

-- Inserir relação Jogador x Time
INSERT INTO Jogador_joga_time (Jogador_Pessoa_idPessoa, Time_idTime, data_inicio)
VALUES (1, 1, '2023-06-01'),
       (2, 1, '2023-06-01'),
       (3, 1, '2023-06-01'),
       (4, 1, '2023-06-01'),
       (5, 1, '2023-06-01'),
       (6, 2, '2023-06-01'),
       (7, 2, '2023-06-01'),
       (8, 2, '2023-06-01'),
       (9, 2, '2023-06-01'),
       (10, 2, '2023-06-01'),
       (11, 3, '2023-06-01'),
       (12, 3, '2023-06-01'),
       (13, 3, '2023-06-01'),
       (14, 3, '2023-06-01'),
       (15, 3, '2023-06-01'),
       (16, 4, '2023-06-01'),
       (17, 4, '2023-06-01'),
       (18, 4, '2023-06-01'),
       (19, 4, '2023-06-01'),
       (20, 4, '2023-06-01');

-- Inserir relação Treinador x Time
INSERT INTO Treinador_treina_time (Treinador_Pessoa_idPessoa, Time_idTime, data_inicio)
VALUES (22, 1, '2023-06-01'),
       (23, 2, '2023-06-01'),
       (24, 3, '2023-06-01'),
       (25, 4, '2023-06-01');

