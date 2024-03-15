mynub :: Eq a => [a] -> [a]
mynub [] = []
mynub (x:xs) = (if x `elem` xs then [] else [x]) ++ mynub xs

chamar :: Eq a => [a] -> [a]
chamar xs = reverse (mynub (reverse xs))

