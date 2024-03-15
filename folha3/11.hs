myintersperse :: a -> [a] -> [a]
myintersperse s [] = []
myintersperse s (x:[]) = [x]
myintersperse s (x:xs) = [x] ++ [s] ++ myintersperse s xs
