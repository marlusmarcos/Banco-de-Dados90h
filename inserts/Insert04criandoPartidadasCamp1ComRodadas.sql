insert into Status_Partida (idStatus_Partida, descricao) values (1,'para inicar');
insert into Status_Partida (idStatus_Partida, descricao) values (2,'em andamento');
insert into Status_Partida (idStatus_Partida, descricao) values (3,'Finalizada');
-- Criar primeira rodada
INSERT INTO Rodada (idRodada, Campeonato_idCampeonato, numero_rodada, data_inicio, data_fim)
VALUES (1, 1, 1, '2023-07-01', '2023-07-07');

-- Partidas da primeira rodada
-- Partida 1: ABC x América
INSERT INTO Partida (idPartida, Estadio_idEstadio, Rodada_idRodada, Status_Partida_idStatus_Partida, data, hora_inicio, hora_fim)
VALUES (1, 1, 1, 1, '2023-07-01', '15:00:00', '17:00:00');

-- Partida 2: Globo x Alecrim
INSERT INTO Partida (idPartida, Estadio_idEstadio, Rodada_idRodada, Status_Partida_idStatus_Partida, data, hora_inicio, hora_fim)
VALUES (2, 4, 1, 1, '2023-07-01', '17:30:00', '19:30:00');


-- Criar segunda rodada
INSERT INTO Rodada (idRodada, Campeonato_idCampeonato, numero_rodada, data_inicio, data_fim)
VALUES (2, 1, 2, '2023-07-08', '2023-07-14');

-- Partidas da segunda rodada
-- Partida 3: ABC x Alecrim
INSERT INTO Partida (idPartida, Estadio_idEstadio, Rodada_idRodada, Status_Partida_idStatus_Partida, data, hora_inicio, hora_fim)
VALUES (3, 1, 2, 1, '2023-07-08', '15:00:00', '17:00:00');

-- Partida 4: America x Alecrim
INSERT INTO Partida (idPartida, Estadio_idEstadio, Rodada_idRodada, Status_Partida_idStatus_Partida, data, hora_inicio, hora_fim)
VALUES (4, 3, 2, 1, '2023-07-08', '17:30:00', '19:30:00');


-- Criar terceira rodada
INSERT INTO Rodada (idRodada, Campeonato_idCampeonato, numero_rodada, data_inicio, data_fim)
VALUES (3, 1, 3, '2023-07-15', '2023-07-21');

-- Partidas da terceira rodada
-- Partida 5: ABC x Alecrim
INSERT INTO Partida (idPartida, Estadio_idEstadio, Rodada_idRodada, Status_Partida_idStatus_Partida, data, hora_inicio, hora_fim)
VALUES (5, 1, 3, 1, '2023-07-15', '15:00:00', '17:00:00');

-- Partida 6: Globo x America
INSERT INTO Partida (idPartida, Estadio_idEstadio, Rodada_idRodada, Status_Partida_idStatus_Partida, data, hora_inicio, hora_fim)
VALUES (6, 4, 3, 1, '2023-07-15', '17:30:00', '19:30:00');
