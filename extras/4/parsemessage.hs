{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
import Log
import Data.Char

parseMessage :: String -> LogEntry
parseMessage str 
                | rightFormat str = LogMessage (getType infos) (getTime infos) (getText infos)
                | otherwise = Unknown str
                where infos = words str


getType :: [String] -> MessageType
getType infos 
            | inicio == "E" = Error numero
            | inicio == "W" = Warning
            | inicio == "I" = Info
            where inicio = head infos
                  numero = read (head (tail infos)) :: Int

withoutType :: [String] -> [String]
withoutType infos
                | inicio == "E" = drop 2 infos
                | otherwise = drop 1 infos
                where inicio = head infos

getTime :: [String] -> TimeStamp
getTime infos = read (head (withoutType infos)) :: Int

getText :: [String] -> String
getText infos = unwords (drop 1 (withoutType infos))

rightFormat :: String -> Bool
rightFormat str = head listaPalavras `elem` ["E", "I", "W"] && isNumeric (head (tail listaPalavras)) 
                where listaPalavras = words str

isNumeric :: String -> Bool
isNumeric = all isDigit

