scl :: (a -> b -> a) -> a -> [b] -> [a]
scl f z xs = [foldl f z (take n xs) | n<-[0..length xs]]
