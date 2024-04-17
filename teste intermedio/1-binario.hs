binario :: Int -> [Int]
binario 0 = []
binario n = binario (n`div`2) ++ [n`mod`2]