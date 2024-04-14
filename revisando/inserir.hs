inserir :: Ord a => a -> [a] -> [a]
inserir valor [] = [valor]
inserir valor (x:xs) 
                | x < valor = x : inserir valor xs
                | otherwise = valor : (x : xs)