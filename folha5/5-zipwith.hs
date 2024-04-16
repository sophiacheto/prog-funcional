import Prelude hiding (zipWith)

zipW :: (a -> b -> c) -> [a] -> [b] -> [c]
zipW f xs ys = [f x y | (x, y) <- zip xs ys]


zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith f [] _ = []
zipWith f _ [] = []
zipWith f (x:xs) (y:ys) = f x y : zipWith f xs ys