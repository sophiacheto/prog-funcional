{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
import Log
import Data.Char

insert :: LogEntry -> MessageTree -> MessageTree
insert (Unknown _) tree = tree
insert logMen Empty = Node logMen Empty Empty
insert logMen1 (Node logMen2 esq dir)
                                    | logMen1 `menor` logMen2 = Node logMen2 (insert logMen1 esq) dir
                                    | otherwise = Node logMen2 esq (insert logMen1 dir)


menor :: LogEntry -> LogEntry -> Bool
menor (LogMessage _ time1 _) (LogMessage _ time2 _) = time1 < time2


build :: [LogEntry] -> MessageTree
build = foldr insert Empty
-- construir [] = Vazia
-- construir (x:xs) = inserir x (construir xs)


inOrder :: MessageTree -> [LogEntry]  -- listar mensagens por ordem
inOrder Empty = []
inOrder (Node currLog esq dir) = inOrder esq ++ [currLog] ++ inOrder dir 



