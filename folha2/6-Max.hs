import Distribution.Simple.Utils (xargs)
max1, min1 :: Ord a => a -> a -> a -> a
min1 x y z 
        | x<=y && x<=z = x
        | y<=x && y<=z = y
        | otherwise = z

max1 x y z 
        | x>=y && x>=z = x
        | y>=x && y>=z = y
        | otherwise = z


max2, min2 :: Ord a => a -> a -> a -> a
min2 x y z = min x (min y z)
max2 x y z = max x (max y z)