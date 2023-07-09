-- Partida 1: ABC x America
INSERT INTO Detalhes_Partida (Partida_idPartida, Time_idTimeCasa, Time_idTimeVisitante, golsCasa, golsVisitante)
VALUES (1, 1, 2, 2, 1);

-- Inserir gols do Time 1
INSERT INTO Gol (idGol, Jogador_Pessoa_idPessoa, Partida_idPartida, tempo, gol_contra)
VALUES (1, 1, 1, 35, 0), -- Gol do Time 1
       (2, 1, 1, 65, 0); -- Gol do Time 1

-- Inserir gol do Time 2
INSERT INTO Gol (idGol, Jogador_Pessoa_idPessoa, Partida_idPartida, tempo, gol_contra)
VALUES (3, 7, 1, 65, 1); -- Gol contra o Time 2

-- Partida 2: Globo x Alecrim
INSERT INTO Detalhes_Partida (Partida_idPartida, Time_idTimeCasa, Time_idTimeVisitante, golsCasa, golsVisitante)
VALUES (2, 3, 4, 0, 0);

-- Partida 3: ABC x Globo
INSERT INTO Detalhes_Partida (Partida_idPartida, Time_idTimeCasa, Time_idTimeVisitante, golsCasa, golsVisitante)
VALUES (3, 1, 3, 1, 1);

-- Inserir gols do Time 1
INSERT INTO Gol (idGol, Jogador_Pessoa_idPessoa, Partida_idPartida, tempo, gol_contra)
VALUES (4, 1, 3, 25, 0); -- Gol do Time 1

-- Inserir gol do Time 3
INSERT INTO Gol (idGol, Jogador_Pessoa_idPessoa, Partida_idPartida, tempo, gol_contra)
VALUES (5, 13, 3, 70, 0); -- Gol do Time 3

-- Partida 4: America x Alecrim
INSERT INTO Detalhes_Partida (Partida_idPartida, Time_idTimeCasa, Time_idTimeVisitante, golsCasa, golsVisitante)
VALUES (4, 2, 4, 0, 2);

-- Inserir gols do Time 4
INSERT INTO Gol (idGol, Jogador_Pessoa_idPessoa, Partida_idPartida, tempo, gol_contra)
VALUES (6, 16, 4, 10, 0), -- Gol do Time 1
       (7, 18, 4, 60, 0); -- Gol do Time 1

-- Partida 5: ABC x Alecrim
INSERT INTO Detalhes_Partida (Partida_idPartida, Time_idTimeCasa, Time_idTimeVisitante, golsCasa, golsVisitante)
VALUES (5, 1, 4, 2, 0);

-- Inserir gols do Time 2
INSERT INTO Gol (idGol, Jogador_Pessoa_idPessoa, Partida_idPartida, tempo, gol_contra)
VALUES (8, 3, 5, 15, 0), -- Gol do Time 2
       (9, 3, 5, 80, 0); -- Gol do Time 2

-- Partida 6: Globo x America
INSERT INTO Detalhes_Partida (Partida_idPartida, Time_idTimeCasa, Time_idTimeVisitante, golsCasa, golsVisitante)
VALUES (6, 3, 2, 1, 0);

-- Inserir gol contra do Time 3
INSERT INTO Gol (idGol, Jogador_Pessoa_idPessoa, Partida_idPartida, tempo, gol_contra)
VALUES (10, 12, 6, 30, 1); -- Gol contra o Time 2






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

create view JogadorTime as
SELECT p.nome AS nome_jogador, j.Pessoa_idPessoa AS id_jogador, t.nome AS nome_time
FROM Jogador_joga_time jjt
JOIN Jogador j ON jjt.Jogador_Pessoa_idPessoa = j.Pessoa_idPessoa
JOIN Time t ON jjt.Time_idTime = t.idTime
JOIN Pessoa p ON j.Pessoa_idPessoa = p.idPessoa;


CREATE VIEW Artilheiro AS
SELECT j.Pessoa_idPessoa, p.nome AS nome_jogador, COUNT(*) AS total_gols, c.nome AS nome_campeonato
FROM Gol g
JOIN Jogador j ON g.Jogador_Pessoa_idPessoa = j.Pessoa_idPessoa
JOIN Pessoa p ON j.Pessoa_idPessoa = p.idPessoa
JOIN Jogador_joga_time jjt ON j.Pessoa_idPessoa = jjt.Jogador_Pessoa_idPessoa
JOIN Time t ON jjt.Time_idTime = t.idTime
JOIN Time_participa_Campeonato tpc ON t.idTime = tpc.Time_idTime
JOIN Campeonato c ON tpc.Campeonato_idCampeonato = c.idCampeonato
WHERE c.idCampeonato = 1 -- Substitua 1 pelo ID do campeonato desejado
GROUP BY j.Pessoa_idPessoa, p.nome, c.nome
ORDER BY total_gols DESC



