import Data.Char ( toLower, toUpper )

camelCase :: String -> String
camelCase frase = concat (normalizar toLower primeira : map (normalizar toUpper) resto)
                where palavras = words frase
                      primeira = head palavras
                      resto = tail palavras


toLow:: String -> String
toLow = map toLower


-- camelCase :: String -> String
-- camelCase frase = concat (toLow primeira : camel resto)
--                 where palavras = words frase
--                       primeira = head palavras
--                       resto = tail palavras

-- camel :: [String] -> [String]
-- camel palavras = [toUpper (head word) : toLow (tail word) | word <- palavras]


normalizar :: (Char -> Char) -> String -> String
normalizar f str = f (head str) : toLow (tail str)