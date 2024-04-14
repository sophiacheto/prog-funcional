pitagoricos :: Integer -> [(Integer, Integer, Integer)]
pitagoricos num = [(x, y, z) | x<-[1..num], y<-[1..num], z<-[1..num], pitagorico x y z]

pitagorico :: Integer -> Integer -> Integer -> Bool
pitagorico x y z = x*x + y*y == z*z