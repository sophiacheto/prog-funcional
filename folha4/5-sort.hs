sort :: Ord a => [a] -> [a]
sort [] = []
sort (x:xs) = sort menores ++ [x] ++ sort maiores
            where menores = [y | y<-xs, y<x]
                  maiores = [y | y<-xs, y>=x]