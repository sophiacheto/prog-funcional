mdc :: Int -> Int -> Int
mdc a 0 = a
mdc a b = mdc b (a`mod`b) 