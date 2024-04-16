frombits :: [Int] -> Int
frombits = foldl (\x xs -> 2*x + xs) 0