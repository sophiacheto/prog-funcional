{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
data Set a = Node a (Set a) (Set a)
            | Empty
            deriving Show

toList :: Set a -> [a]
toList Empty = []
toList (Node x left right) = toList left ++ [x] ++ toList right

valid :: Ord a => Set a -> Bool
valid conjunto = ordenada (toList conjunto)
                where
                    ordenada :: Ord a => [a] -> Bool
                    ordenada [] = True
                    ordenada [_] = True
                    ordenada (x:y:xs) = x<y && ordenada (y:xs)


union :: (Ord a, Eq a) => Set a -> Set a -> Set a
union Empty b = b
union (Node x left right) b = inserir x (b `union` (left `union` right))

inserir :: Ord a => a -> Set a -> Set a
inserir valor Empty = Node valor Empty Empty
inserir valor (Node x esq dir)
                | valor==x = Node x esq dir -- já ocorre; não insere
                | valor<x = Node x (inserir valor esq) dir -- insere à esquerda
                | valor>x = Node x esq (inserir valor dir) -- insere à direita