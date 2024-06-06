module Main where
import Data.Char (toLower)

readDict :: IO [String]
readDict = do txt <- readFile "/usr/share/dict/words"
              return (lines txt)

checar :: [String] -> [String] -> String
checar dict txt = unwords (map (novaPalavra dict) txt)

novaPalavra :: [String] -> String -> String
novaPalavra dict word
            | map toLower word `elem` dict = word
            | otherwise = bgError ++ word ++ bgDefault
--          | otherwise = replicate (length word) '-'

-- sequencias ANSI
bgError    = "\ESC[7m"   -- reverse video
bgDefault  = "\ESC[0m"   -- normal

main :: IO ()
main = do
    txt <- getContents
    dict <- readDict
    sequence_ [putStrLn (checar dict (words linha)) | linha <- lines txt]