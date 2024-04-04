maxIndex :: (Ord a) => [a] -> (a, Int)
maxIndex xs = maximum (indices xs)
    where indices xs = zip xs [a | a <- [0, 1..]] 