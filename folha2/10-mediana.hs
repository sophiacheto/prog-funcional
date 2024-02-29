mediana :: (Ord a, Num a) => a -> a -> a -> a
mediana x y z = x + y + z - max2 x y z - min2 x y z

min2 :: Ord a => a -> a -> a -> a
min2 x y z = min x (min y z)
max2 :: Ord a => a -> a -> a -> a
max2 x y z = max x (max y z)