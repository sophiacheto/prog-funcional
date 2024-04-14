divprop :: Integer -> [Integer]
divprop num = [x | x<-[1..num-1], num`mod`x==0]