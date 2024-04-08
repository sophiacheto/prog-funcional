fromBits :: [Int] -> Int
fromBits [] = 0
fromBits xs = fromBits (init xs) * 2 + last xs

