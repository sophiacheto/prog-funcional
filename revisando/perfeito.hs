perfeitos :: Integer -> [Integer]
perfeitos num = [x | x<-[1..num], perfeito x]
    
perfeito :: Integer -> Bool
perfeito x = sum (divprop x) == x

divprop :: Integer -> [Integer]
divprop num = [x | x<-[1..num-1], num`mod`x==0]