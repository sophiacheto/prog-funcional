{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
minimumm :: Ord a => [a] -> a
minimumm [x] = x
minimumm (x:xs) = minimo x (minimumm xs)
            where minimo x y = if x>y then y else x
            

delete :: Eq a => a -> [a] -> [a]
delete y [] = []
delete y (x:xs)
            | x==y = xs
            | otherwise = x : delete y xs


ssort :: Ord a => [a] -> [a]
ssort [] = []
ssort xs = minimo : ssort (delete minimo xs)
        where minimo = minimumm xs