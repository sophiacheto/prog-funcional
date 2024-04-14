safetail :: [a] -> [a]
safetail [] = []
safetail (x:xs) = xs

safetail2 :: [a] -> [a]
safetail2 [] = []
safetail2 xs = tail xs

safetail3 :: [a] -> [a]
safetail3 xs
        | null xs = []
        | otherwise = tail xs

safetail4 :: [a] -> [a]
safetail4 xs = if not (null xs) then tail xs else []