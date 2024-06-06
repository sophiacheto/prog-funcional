module Main where

main :: IO ()
main = do
    str <- getContents
    sequence_ [putStrLn (reverse linha) | linha <- lines str]