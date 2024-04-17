-- função para testar equivalencia de funções de um argumento
equivalentes :: Eq b => (a -> b) -> (a -> b) -> [a] -> Bool
equivalentes f g n = map f n == map g n


-- exemplo de uso:
rev1 :: [a] -> [a]
rev1 = foldl (flip (:)) []

rev2 :: [a] -> [a]
rev2 = foldr (\x xs -> xs ++ [x]) []


-- no terminal ghci:
-- >> equivalentes rev1 rev2 [[], [1], [1,2,3], [9,8,7,6,5,4,3,2,1]]