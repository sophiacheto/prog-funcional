module Main where
import Data.Char (ord, chr, isUpper, isLower)


rot13 :: Char -> Char
rot13 ch
        | isUpper ch = chr ((ord ch - ord 'A' + 13)`mod`26 + ord 'A')
        | isLower ch = chr ((ord ch - ord 'a' + 13)`mod`26 + ord 'a')
        | otherwise = ch


cifrar :: String -> String
cifrar = map rot13
-- cifrar str = [rot13 ch | ch <- str]

main :: IO()
main = do
    txt <- getContents
    putStrLn (cifrar txt)
