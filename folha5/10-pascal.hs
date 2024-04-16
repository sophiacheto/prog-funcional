linha :: Int -> [Int]
linha 1 = [1]
linha n = seguinte (linha (n-1))

seguinte :: [Int] -> [Int]
seguinte linha = [1] ++ [x+y | (x,y) <- paresConsecutivos linha] ++ [1]

paresConsecutivos :: [Int] -> [(Int, Int)]
paresConsecutivos linha = zip linha (tail linha)

triangulo = [linha n | n <- [1..]]




-- pascal :: Int -> [[Int]]
-- pascal n = helper 0 n []

-- helper :: Int -> Int -> [[Int]] -> [[Int]]
-- helper cur fim [] = helper (cur+1) fim [[1]]
-- helper cur fim xs 
--                 | cur == fim = xs
--                 | otherwise = helper (cur+1) fim (xs ++ [seguinte (last xs)] )



pascal :: Int -> [[Int]]
pascal n = helper n []

helper :: Int -> [[Int]] -> [[Int]]
helper fim [] = helper (fim-1) [[1]]
helper 0 xs = xs
helper fim xs = helper (fim-1) (xs ++ [seguinte (last xs)])
