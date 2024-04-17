import Prelude hiding (zip3)

pitagorico :: Int -> Int -> Int -> Bool
pitagorico x y z
                | x>y && x>z = y*y+z*z==x*x
                | y>x && y>z = x*x+z*z==y*y
                | otherwise = x*x+y*y==z*z

pit :: Int -> Int -> Int -> Bool
pit x y z = x*x+y*y==z*z || x*x+z*z==y*y || y*y+z*z==x*x

hipotenusa :: Float -> Float -> Float
hipotenusa a b = sqrt(a*a+b*b)

diferentes :: Eq a => [a] -> [a]
diferentes xs = [x | (x,y)<-pares, x/=y]
                where pares = zip xs (tail xs)

dif :: Eq a => [a] -> [a]
dif [] = []
dif [x] = []
dif (x:y:xs) 
            | x==y = dif (y:xs)
            | otherwise = x : dif (y:xs)


zip3 :: [a] -> [b] -> [c] -> [(a,b,c)]
zip3 xs ys zs = [(x,y,z) | (x,(y,z)) <- zip xs (zip ys zs)]


partir :: Eq a => a -> [a] -> ([a], [a])
partir x xs = (takeWhile (x/=) xs, dropWhile (x/=) xs)

partir2 :: Eq a => a -> [a] -> ([a], [a])
partir2 c [] = ([],[])
partir2 c (x:xs)
            | x/=c = (x:primeiro, resto)
            | otherwise = ([], x:xs)
            where (primeiro, resto) = partir2 c xs



-- exame 2022

approxE :: Int -> Double
approxE k = sum [(fromIntegral 1)/(fromIntegral (fatorial n)) | n<-[0..k-1]]

fatorial :: Int -> Int
fatorial n = product [1..n]


approx :: Int -> Double
approx 0 = 1.0
approx k = 1.0/fromIntegral(fatorial k) + approx (k-1)


agrupar :: Eq a => [a] -> [[a]]
agrupar [] = []
agrupar xs = iguais : agrupar resto
            where iguais = takeWhile (head xs ==) xs
                  resto = dropWhile (head xs ==) xs
