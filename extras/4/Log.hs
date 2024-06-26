-- 
-- CC1005 Problema 4: AnÃ¡lise de ficheiros log
--
module Log where

-- tipos de mensagem
data MessageType = Info
                 | Warning
                 | Error Int
  deriving (Show, Eq)

-- instante de tempo 
type TimeStamp = Int

-- entrada no ficheiro de log
data LogEntry = LogMessage MessageType TimeStamp String
              | Unknown String
  deriving (Show, Eq)

-- Ã¡rvore binÃ¡ria para mensagens
data MessageTree = Empty
                 | Node LogEntry MessageTree MessageTree
  deriving (Show, Eq)
