{-# OPTIONS_GHC -Wno-incomplete-patterns #-}

minimo :: Ord a => [a] -> a
minimo [x] = x
minimo [x,y] = min x y
minimo (x:y:xs) = if x<y then minimo (x:xs) else minimo (y:xs)


deletar :: Eq a => a -> [a] -> [a]
deletar valor [] = []
deletar valor (x:xs)
                | x == valor = xs
                | otherwise = x : deletar valor xs

ordenar :: Ord a => [a] -> [a]
ordenar [] = []
ordenar xs = mini : ordenar (deletar mini xs)
            where mini = minimo xs