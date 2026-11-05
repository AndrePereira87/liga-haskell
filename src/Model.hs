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
