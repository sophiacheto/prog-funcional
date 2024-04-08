insert :: Ord a => a -> [a] -> [a]
insert y xs = [x | x<-xs, x<y] ++ [y] ++ [x | x<-xs, x>=y]
