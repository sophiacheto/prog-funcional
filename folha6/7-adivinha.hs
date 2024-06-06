adivinha :: String -> String -> IO ()
adivinha word chutes = do
                    putStrLn ("\ESC[7m" ++ novaTentativa word chutes ++ "\ESC[0m")
                    putStrLn "Novo chute? "
                    tent <- getLine
                    if novaTentativa word (chutes ++ [head tent]) == word then 
                        putStrLn ("Acertou em " ++ show (length chutes + 1) ++ " tentativas!")  
                    else 
                        if head tent `elem` word then
                            do adivinha word (chutes ++ [head tent])
                        else
                            do
                            putStrLn "Nao ocorre" 
                            adivinha word (chutes ++ [head tent])


novaTentativa :: String -> String -> String
novaTentativa palavra chutes = map checar palavra
                        where checar ch
                                    | ch `elem` chutes = ch
                                    | otherwise = '-'

main :: IO()
main = do
    putStrLn "Palavra? "
    palavra <- getLine
    adivinha palavra ""