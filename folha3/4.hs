primo :: Integer -> Bool
primo n = divprop n == [1, n]

divprop :: Integer -> [Integer]
divprop n = [x | x <- [1..n], n `mod` x==0]