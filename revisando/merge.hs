merge :: Ord a => [a] -> [a] -> [a]
merge xs [] = xs
merge [] ys = ys
merge (x:xs) (y:ys)
            | x<y = x : merge xs (y:ys)
            | otherwise = y : merge (x:xs) ys


msort :: Ord a => [a] -> [a]
msort [] = []
msort [x] = [x]
msort xs = merge (msort um) (msort dois)
            where um = fst (metades xs)
                  dois = snd (metades xs)



metades :: [a] -> ([a], [a])
metades xs = (take n xs, drop n xs)
        where n = length xs`div`2