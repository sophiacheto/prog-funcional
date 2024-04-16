{-# OPTIONS_GHC -Wno-incomplete-patterns #-}

primos :: [Integer]
primos = crivo [2..]
crivo :: [Integer] -> [Integer]
crivo (p:xs) = p : crivo [x | x<-xs, x`mod`p/=0]

goldbach :: Integer -> (Integer, Integer)
goldbach n = head [(x,y)| x<-takeWhile (n>) primos, y<-takeWhile (n>) primos, x+y==n]