maxIndex :: (Ord a) => [a] -> (a, Int)
maxIndex xs = maximum (indices xs)
    where indices xs = zip xs [a | a <- [0, 1..]]


hondt :: Int -> [Int] -> [Int]
hondt num votos = rodar num votos [0 | x<-votos]


rodar :: Int -> [Int] -> [Int] -> [Int]
rodar n votos eleitos 
        | n==0 = eleitos 
        | otherwise = rodar (n-1) votos (atribuir votos eleitos)


-- atribuir mais um mandato a um partido
atribuir :: [Int] -> [Int] -> [Int]
atribuir votos eleitos = take indice eleitos ++ [valor + 1] ++ drop (indice + 1) eleitos
        where quociente = [x `div` (1+y)| (x,y) <- zip votos eleitos]
              indice = snd (maxIndex quociente)
              valor = eleitos !! indice

