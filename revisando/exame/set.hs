data Set a = Empty -- árvore vazia
            | Node a (Set a) (Set a) -- nó com duas sub-árvores
            deriving (Eq, Show)


insert :: Ord a => a -> Set a -> Set a
insert valor Empty = Node valor Empty Empty
insert valor conj = 
member :: Ord a => a -> Set a -> Bool