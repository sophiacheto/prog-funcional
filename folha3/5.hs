binom :: Integer -> Integer -> Integer
binom n k = factorial n `div` (factorial k * factorial (n-k))

factorial :: Integer -> Integer
factorial n = product [1..n]

pascal :: Integer -> [[Integer]]
pascal n = [linha x | x <- [0..n]]

linha :: Integer -> [Integer]
linha n = [binom n x | x <- [0..n]]
