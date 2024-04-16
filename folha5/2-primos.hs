primo :: Integer -> Bool
primo n = n>1 && all (\x -> n`mod`x/=0) [2..floor (sqrt (fromIntegral n))]