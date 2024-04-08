{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
minimumm :: Ord a => [a] -> a
minimumm [x] = x
minimumm (x:xs) = minimo x (minimumm xs)
            where minimo x y = if x>y then y else x