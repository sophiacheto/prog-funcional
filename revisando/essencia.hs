essencia :: Eq a => [a] -> [a]
essencia xs = helper xs []

helper :: Eq a => [a] -> [a] -> [a]
helper [] resultado = resultado
helper (x:xs) resultado = if x `elem` resultado then helper xs resultado else helper xs (resultado ++ [x])

