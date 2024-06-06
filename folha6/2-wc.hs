module Main where

-- wc :: String -> IO ()
-- wc str = do
--         print (length (lines str))
--         print (length (words str))
--         print (length str)

-- main :: IO ()
-- main = do
--     txt <- getContents
--     wc txt


main :: IO ()
main = do
    str <- getContents
    print (length (lines str))
    print (length (words str))
    print (length str)