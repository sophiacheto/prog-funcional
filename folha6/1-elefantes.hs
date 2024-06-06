elefantes :: Int -> IO ()
elefantes n = do auxiliar 3 n

auxiliar :: Int -> Int -> IO()
auxiliar x y    
        | x == y = do putStrLn ("Se " ++ show (x-1) ++ " elefantes incomodam muita gente,")
                      putStrLn (show x ++ " elefantes incomodam muito mais!")
        | otherwise = do putStrLn ("Se " ++ show (x-1) ++ " elefantes incomodam muita gente,")
                         putStrLn (show x ++ " elefantes incomodam muito mais!")
                         auxiliar (x+1) y