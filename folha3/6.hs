import Data.Char (isUpper, isLower, isDigit)

forte :: String -> Bool
forte x = length x >= 8 && not (null (maiuscula x)) && not (null (minuscula x)) && not (null (algarismo x))

maiuscula :: String -> [Char]
maiuscula str = [x | x<-str, isUpper x]

minuscula :: String -> [Char]
minuscula str = [x | x<-str, isLower x]

algarismo :: String -> [Char]
algarismo str = [x | x<-str, isDigit x]
