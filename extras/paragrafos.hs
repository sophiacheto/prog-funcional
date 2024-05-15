separar :: String -> [String]
separar [] = [[]]
separar [x] = [[x]]
separar (x:xs)
                | x == '\n' && head xs == '\n' = "\n\n" : separar (tail xs)
                | otherwise = [x] : separar xs



reagrupar :: [String] -> [String]
reagrupar [] = []
reagrupar xs = concat paragrafo : reagrupar resto
            where paragrafo = takeWhile ("\n\n"/=) xs
                  resto = drop 1 (dropWhile ("\n\n"/=) xs)

paragraphs :: String -> [String]
paragraphs str = reagrupar (separar str)
