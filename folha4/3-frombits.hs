fromBits :: [Int] -> Int
fromBits [] = 0
fromBits xs = fromBits (tail (reverse xs)) * 2 + last xs 

