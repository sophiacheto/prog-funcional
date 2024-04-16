palavras :: String -> [String]
palavras [] = []
palavras (' ':str) = palavras str
palavras str = nova : palavras resto
            where nova = takeWhile (' '/=) str
                  resto = dropWhile (' '/=) str