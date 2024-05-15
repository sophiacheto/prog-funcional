wordsThatFit :: Int -> [String] -> [String]
wordsThatFit _ [] = []
wordsThatFit n (x:xs)
            | n - tamanho < 0 = []
            | otherwise = x : wordsThatFit (n-tamanho-1) xs
            where tamanho = length x


fillWords :: Int -> [String] -> [[String]]
fillWords _ [] = []  
fillWords n str = linha : fillWords n resto
                    where linha = wordsThatFit n str
                          resto = drop (length linha) str

