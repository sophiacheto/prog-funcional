toBits :: Int -> [Int]
toBits 0 = []
toBits n = toBits (n`div`2) ++ [n`mod`2]

fromBits :: [Int] -> Int
fromBits [] = 0
fromBits xs = last xs + 2*fromBits (init xs)

