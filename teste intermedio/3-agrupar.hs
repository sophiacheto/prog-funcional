agrupar :: Eq a => [a] -> [[a]]
agrupar [] = []
agrupar (x:xs) = iguais : agrupar resto
            where iguais = takeWhile (x ==) (x:xs)
                  resto = dropWhile (x ==) (x:xs)
