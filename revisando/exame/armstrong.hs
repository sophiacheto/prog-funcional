isArmstrong :: Integer -> Bool
isArmstrong n = sum (map (^ exp) algs) == n
                where exp = length algs
                      algs = algarismos n


algarismos :: Integer -> [Integer]
algarismos 0 = []
algarismos n = algarismos (n`div`10) ++ [n`mod`10]