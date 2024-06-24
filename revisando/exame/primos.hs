primos :: [Integer]
primos = crivo [2..]
  where
    crivo (p:xs) = p : filter (\x -> x`mod`p /= 0) (crivo xs)


listarPrimos :: Integer -> Integer -> [Integer]
listarPrimos a b = takeWhile (<=b) (dropWhile (<a) primos)

gemeos :: [(Integer,Integer)]
gemeos = [(x,y) | (x,y) <- pares, x==y-2]
        where pares = zip primos (tail primos)

