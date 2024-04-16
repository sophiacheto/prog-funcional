aproxPi1 :: Int -> Double
aproxPi1 n = sum (take n pi)
            where pi = zipWith (/) (iterate (\n -> -n) 4) [1,3..]
            

aproxPi2 :: Int -> Double
aproxPi2 n = 3 + sum (take (n-1) pi)
            where pi = zipWith (/) num denom
                  num = iterate (\n -> -n) 4
                  denom = [product (take 3 (drop n [0..])) | n<-[2,4..]]