perfeitos :: Integer -> [Integer]
perfeitos n = [x | x <- [1..n], sum (divprop x) == x]


divprop :: Integer -> [Integer]
divprop n = [x | x <- [1..n-1], n `mod` x==0]