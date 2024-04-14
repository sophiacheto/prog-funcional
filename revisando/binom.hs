binom :: Integer -> Integer -> Integer
binom n k = product [1..n] `div` (product [1..k] * product [1..n-k])

pascal :: Integer -> [[Integer]]
pascal num = [linha x | x<-[0..num]]

linha :: Integer -> [Integer]
linha num = [binom num x | x<-[0..num]]