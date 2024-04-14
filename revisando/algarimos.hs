algarismos :: Int -> [Int]
algarismos 0 = []
algarismos n = algarismos (n `div` 10) ++ [n `mod` 10]