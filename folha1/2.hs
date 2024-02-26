
leftHalf :: [a] -> [a]
leftHalf lista = take (length lista `div` 2) lista

rightHalf :: [a] -> [a]
rightHalf lista = drop (length lista `div` 2) lista