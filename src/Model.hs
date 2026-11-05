module Model where

-- | Sinónimos de tipos para clarificação semântica
type Id = Int
type Nome = String
type Cidade = String
type Golos = Int
type Pontos = Int
type Jornada = Int

-- | Tipo algébrico (soma) que representa o desfecho de um jogo
data Resultado
  = VitoriaCasa
  | VitoriaFora
  | Empate
  deriving (Show, Eq)

-- | Tipo soma para escalão / divisão
data Divisao
  = PrimeiraLiga
  | SegundaLiga
  deriving (Show, Eq)

-- | Registo representativo de uma Equipa
data Equipa = Equipa
  { idEquipa     :: Id
  , nomeEquipa   :: Nome
  , cidadeEquipa :: Cidade
  , divisao      :: Divisao
  } deriving (Show, Eq)

-- | Registo que representa um Jogo realizado
data Jogo = Jogo
  { idJogo      :: Id
  , jornada     :: Jornada
  , idCasa      :: Id
  , idFora      :: Id
  , golosCasa   :: Golos
  , golosFora   :: Golos
  } deriving (Show, Eq)

-- | Registo que representa as estatísticas de uma equipa na tabela classificativa
data LinhaTabela = LinhaTabela
  { equipaRef       :: Id
  , jogosDisputados :: Int
  , vitorias        :: Int
  , empates         :: Int
  , derrotas        :: Int
  , golosMarcados   :: Golos
  , golosSofridos   :: Golos
  , diferencaGolos  :: Golos
  , totalPontos     :: Pontos
  } deriving (Show, Eq)

-- | Cria uma linha de tabela inicial com estatísticas a zero para uma equipa
linhaInicial :: Id -> LinhaTabela
linhaInicial eqId = LinhaTabela
  { equipaRef       = eqId
  , jogosDisputados = 0
  , vitorias        = 0
  , empates         = 0
  , derrotas        = 0
  , golosMarcados   = 0
  , golosSofridos   = 0
  , diferencaGolos  = 0
  , totalPontos     = 0
  }
