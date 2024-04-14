mediana :: (Num a, Ord a) => a -> a -> a -> a
mediana x y z = x + y + z - min x (min y z) - max x (max y z)

mediana2 :: Ord a => a -> a -> a -> a
mediana2 x y z
        | (y<x && x<z) || (z<x && x<y) = x
        | (x<y && y<z) || (z<y && y<x) = y
        | otherwise = z