{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use foldr" #-}

myand :: [Bool] -> Bool -- todos tem q ser True
myand ls = null [x | x <- ls, x == False]

myand2 :: [Bool] -> Bool -- todos tem q ser True
myand2 [] = True
myand2 (x:xs) = x && myand2 xs


myor :: [Bool] -> Bool -- todos tem q ser True
myor ls = not (null [x | x <- ls, x == True])

myor2 :: [Bool] -> Bool -- todos tem q ser True
myor2 [] = False
myor2 (x:xs) = x || myor2 xs



myconcat :: [[a]] -> [a]
myconcat [] = []
myconcat (x:xs) = x ++ myconcat xs



myreplicate :: Int -> a -> [a]
myreplicate 0 _ = []
myreplicate n x = x:myreplicate (n-1) x


ord :: Int -> [a] -> a
ord _ [] = undefined
ord 0 (x:xs) = x
ord n (x:xs) = ord (n-1) xs


myelem :: Eq a => a -> [a] -> Bool
myelem a [] = False
myelem a (x:xs) = (x == a) || myelem a xs