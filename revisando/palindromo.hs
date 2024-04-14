checkPalindrome :: String -> Bool
checkPalindrome str 
                | length str <= 1 = True
                | otherwise = (head str == last str) && checkPalindrome resto
                    where resto = init (tail str)

checar :: String -> Bool
checar str = str == reverse str