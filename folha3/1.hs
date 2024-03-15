divprop :: Integer -> [Integer]
divprop n = [x | x <- [1..n-1], n `mod` x==0]