import Prelude hiding ((++), concat, reverse, elem)

(++) :: [a] -> [a] -> [a]
xs ++ ys = foldr (:) ys xs

concat :: [[a]] -> [a]
concat = foldr (++) []

-- reverse :: [a] -> [a]
-- reverse [] = []
-- reverse xs = last xs : reverse (init xs)

reverse :: [a] -> [a]
reverse = foldl (flip (:)) []

rev :: [a] -> [a]
rev = foldr (\x xs -> xs ++ [x]) []

elem :: Eq a => a -> [a] -> Bool
elem x = any (x ==)