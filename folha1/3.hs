second :: [a] -> a
second lista = head (drop 1 lista) -- head (tail lista)

lastt :: [a] -> a
lastt lista = head (reverse lista)

lasttt :: [a] -> a
lasttt lista = head (drop (length lista - 1) lista)

initial :: [a] -> [a]
initial lista = reverse (tail (reverse lista))

middle :: [a] -> a
middle lista = head (drop (length lista `div` 2) lista)

checkPalindrome :: String -> Bool
checkPalindrome str = str == reverse(str)
