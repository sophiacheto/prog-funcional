safetail :: [a] -> [a]
safetail xs
    | null xs = []
    | otherwise = tail xs

safetail2 :: [a] -> [a]
safetail2 xs = if null xs then [] else tail xs

safetail3 :: [a] -> [a]
safetail3 [] = []
safetail3 xs = tail xs