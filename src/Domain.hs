module Domain where

import Model

-- ============================================================================
-- PARTE DO RODRIGO: Regras de Domínio Puras e Recursão Estrutural
-- ============================================================================

-- | Determina o resultado desportivo de um jogo com recurso a Guards
resultadoJogo :: Jogo -> Resultado
resultadoJogo j
  | golosCasa j > golosFora j = VitoriaCasa
  | golosCasa j < golosFora j = VitoriaFora
  | otherwise                 = Empate

-- | Calcula os pontos obtidos pela equipa visitada (casa): 3 na vitória, 1 no empate, 0 na derrota
pontosObtidosCasa :: Jogo -> Pontos
pontosObtidosCasa j = case resultadoJogo j of
  VitoriaCasa -> 3
  Empate      -> 1
  VitoriaFora -> 0

-- | Calcula os pontos obtidos pela equipa visitante (fora): 3 na vitória, 1 no empate, 0 na derrota
pontosObtidosFora :: Jogo -> Pontos
pontosObtidosFora j = case resultadoJogo j of
  VitoriaFora -> 3
  Empate      -> 1
  VitoriaCasa -> 0

-- | Soma o total de golos apontados numa partida
totalGolosJogo :: Jogo -> Golos
totalGolosJogo j = golosCasa j + golosFora j

-- | Verifica recursivamente se uma equipa existe na lista pelo seu Id
-- Caso base: lista vazia ([]), a equipa não existe -> False
-- Caso recursivo: se o Id coincidir com a cabeça, termina com True; senão, recursão na cauda
existeEquipaRec :: Id -> [Equipa] -> Bool
existeEquipaRec _ [] = False
existeEquipaRec targetId (e:es)
  | idEquipa e == targetId = True
  | otherwise              = existeEquipaRec targetId es

-- | Procura recursivamente uma equipa pelo seu Id, devolvendo Maybe Equipa
-- Caso base: [] -> Nothing
-- Caso recursivo: (e:es) -> devolve Just e se coincidir, senão continua a pesquisa
procurarEquipaRec :: Id -> [Equipa] -> Maybe Equipa
procurarEquipaRec _ [] = Nothing
procurarEquipaRec targetId (e:es)
  | idEquipa e == targetId = Just e
  | otherwise              = procurarEquipaRec targetId es

-- | Filtra recursivamente todos os jogos em que uma determinada equipa participou (em casa ou fora)
-- Demonstra recursão estrutural de preservação de elementos com cons (:)
jogosDaEquipaRec :: Id -> [Jogo] -> [Jogo]
jogosDaEquipaRec _ [] = []
jogosDaEquipaRec targetId (j:js)
  | idCasa j == targetId || idFora j == targetId = j : jogosDaEquipaRec targetId js
  | otherwise                                    = jogosDaEquipaRec targetId js

-- | Conta recursivamente o número de vitórias que uma determinada equipa alcançou nos jogos disputados
contarVitoriasRec :: Id -> [Jogo] -> Int
contarVitoriasRec _ [] = 0
contarVitoriasRec targetId (j:js)
  | idCasa j == targetId && resultadoJogo j == VitoriaCasa = 1 + contarVitoriasRec targetId js
  | idFora j == targetId && resultadoJogo j == VitoriaFora = 1 + contarVitoriasRec targetId js
  | otherwise                                             = contarVitoriasRec targetId js
