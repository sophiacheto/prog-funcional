ordenar :: Ord a => [a] -> [a]
ordenar [] = []
ordenar (x:xs) = inserir x (ordenar xs)

-- ordenar :: Ord a => [a] -> [a]
-- ordenar xs = foldr inserir [] xs


inserir :: Ord a => a -> [a] -> [a]
inserir valor [] = [valor]
inserir valor (x:xs) 
                | x < valor = x : inserir valor xs
                | otherwise = valor : (x : xs)