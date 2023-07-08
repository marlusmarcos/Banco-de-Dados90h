INSERT INTO Gol (idGol, Jogador_Pessoa_idPessoa, Partida_idPartida, tempo, gol_contra) VALUES (1, 1, 1, 35, 0); -- Gol do Time 1
INSERT INTO Gol (idGol, Jogador_Pessoa_idPessoa, Partida_idPartida, tempo, gol_contra) VALUES (2, 7, 1, 65, 1); -- Gol contra o Time 2


-- Partida 1: Time 1 x Time 2
INSERT INTO Detalhes_Partida (Partida_idPartida, Time_idTimeCasa, Time_idTimeVisitante, golsCasa, golsVisitante) VALUES (1, 1, 2, 2, 1);

-- Partida 2: Time 3 x Time 4
INSERT INTO Detalhes_Partida (Partida_idPartida, Time_idTimeCasa, Time_idTimeVisitante, golsCasa, golsVisitante) VALUES (2, 3, 4, 0, 0);

-- Partida 3: Time 1 x Time 3
INSERT INTO Detalhes_Partida (Partida_idPartida, Time_idTimeCasa, Time_idTimeVisitante, golsCasa, golsVisitante) VALUES (3, 1, 3, 1, 1);
INSERT INTO Gol (idGol, Jogador_Pessoa_idPessoa, Partida_idPartida, tempo, gol_contra) VALUES (3, 1, 3, 25, 0); -- Gol do Time 1
INSERT INTO Gol (idGol, Jogador_Pessoa_idPessoa, Partida_idPartida, tempo, gol_contra) VALUES (4, 13, 3, 70, 0); -- Gol do Time 3

-- Partida 4: Time 2 x Time 4
INSERT INTO Detalhes_Partida (Partida_idPartida, Time_idTimeCasa, Time_idTimeVisitante, golsCasa, golsVisitante) VALUES (4, 2, 4, 2, 0);
INSERT INTO Gol (idGol, Jogador_Pessoa_idPessoa, Partida_idPartida, tempo, gol_contra) VALUES (5, 6, 4, 10, 0); -- Gol do Time 2
INSERT INTO Gol (idGol, Jogador_Pessoa_idPessoa, Partida_idPartida, tempo, gol_contra) VALUES (6, 18, 4, 60, 0); -- Gol do Time 2

-- Partida 5: Time 1 x Time 4
INSERT INTO Detalhes_Partida (Partida_idPartida, Time_idTimeCasa, Time_idTimeVisitante, golsCasa, golsVisitante) VALUES (5, 1, 4, 0, 2);
INSERT INTO Gol (idGol, Jogador_Pessoa_idPessoa, Partida_idPartida, tempo, gol_contra) VALUES (7, 19, 5, 15, 0); -- Gol do Time 4
INSERT INTO Gol (idGol, Jogador_Pessoa_idPessoa, Partida_idPartida, tempo, gol_contra) VALUES (8, 3, 5, 80, 0); -- Gol do Time 4

-- Partida 6: Time 3 x Time 2
INSERT INTO Detalhes_Partida (Partida_idPartida, Time_idTimeCasa, Time_idTimeVisitante, golsCasa, golsVisitante) VALUES (6, 3, 2, 1, 1);
INSERT INTO Gol (idGol, Jogador_Pessoa_idPessoa, Partida_idPartida, tempo, gol_contra) VALUES (9, 12, 6, 30, 1); -- Gol contra o Time 2
INSERT INTO Gol (idGol, Jogador_Pessoa_idPessoa, Partida_idPartida, tempo, gol_contra) VALUES (10, 7, 6, 55, 0); -- Gol do Time 3




CREATE OR REPLACE VIEW Classificacao AS
SELECT
  t.idTime,
  t.nome AS Time,
  COALESCE(SUM(CASE WHEN dp.Time_idTimeCasa = t.idTime THEN
                       CASE WHEN dp.golsCasa > dp.golsVisitante THEN 3
                            WHEN dp.golsCasa = dp.golsVisitante THEN 1
                            ELSE 0
                       END
                   ELSE
                       CASE WHEN dp.golsCasa < dp.golsVisitante THEN 3
                            WHEN dp.golsCasa = dp.golsVisitante THEN 1
                            ELSE 0
                       END
                   END), 0) AS Pontos,
  COALESCE(SUM(CASE WHEN dp.Time_idTimeCasa = t.idTime THEN dp.golsCasa ELSE dp.golsVisitante END), 0) AS GolsMarcados,
  COALESCE(SUM(CASE WHEN dp.Time_idTimeCasa = t.idTime THEN dp.golsVisitante ELSE dp.golsCasa END), 0) AS GolsSofridos
FROM Time t
LEFT JOIN Detalhes_Partida dp ON dp.Time_idTimeCasa = t.idTime OR dp.Time_idTimeVisitante = t.idTime
GROUP BY t.idTime, t.nome
ORDER BY Pontos DESC, GolsMarcados DESC;



SELECT * FROM Classificacao;

select * from Detalhes_Partida