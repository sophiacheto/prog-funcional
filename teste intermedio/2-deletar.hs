deletar :: Eq a => a -> [a] -> [a]
deletar c [] = []
deletar c (x:xs) 
            | c == x = xs
            | otherwise = x : deletar c xs