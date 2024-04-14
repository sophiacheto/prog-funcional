moedas :: [Int]
moedas = [200, 100, 50, 20, 10, 5, 2, 1]


maior :: Int -> Int
maior x = head (dropWhile (>x) moedas)


trocos :: Int -> [Int]
trocos 0 = []
trocos x = maior x : trocos (x - maior x)