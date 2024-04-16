import Data.Char

vigenere :: String -> String -> String
vigenere chave mensagem = zipWith saltar mensagem deslocamentos
                    where deslocamentos = map salto (cycle chave)

salto :: Char -> Int
salto ch = ord ch - ord 'A'

saltar :: Char -> Int -> Char
saltar ch saltos = chr ((ord ch + saltos - ord 'A')`mod`26 + ord 'A')