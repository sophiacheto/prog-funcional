delete :: Eq a => a -> [a] -> [a]
delete y [] = []
delete y (x:xs)
            | x==y = xs
            | otherwise = x : delete y xs