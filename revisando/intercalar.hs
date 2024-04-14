intercalar :: a -> [a] -> [a]
intercalar valor [] = []
intercalar valor [x] = [x]
intercalar valor (x:xs) = x : (valor : intercalar valor xs)