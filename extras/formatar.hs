module Main where
import System.IO
-- import Distribution.ModuleName (main)

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


wordsThatFit :: Int -> [String] -> [String]
wordsThatFit _ [] = []
wordsThatFit n (x:xs)
            | n - tamanho < 0 = []
            | otherwise = x : wordsThatFit (n-tamanho-1) xs
            where tamanho = length x

fillWords :: Int -> [String] -> [[String]]
fillWords _ [] = []  
fillWords n str = linha : fillWords n resto
                    where linha = wordsThatFit n str
                          resto = drop (length linha) str


intercalar :: a -> [a] -> [a]
intercalar valor [] = []
intercalar valor [x] = [x]
intercalar valor (x:xs) = x : (valor : intercalar valor xs)


formatar :: String -> String
formatar str =  concat (intercalar "\n" lista_de_linhas)
            where 
                  lista_de_linhas = map unlines lista_de_paragrafos_bem_div
                  lista_de_paragrafos_bem_div = [map unwords paragrafo | paragrafo <- lista_de_palavras_de_paragrafos_bem_divididos]
                  lista_de_palavras_de_paragrafos_bem_divididos = map (fillWords 70) lista_de_palavras_de_lista_de_paragrafos
                  lista_de_palavras_de_lista_de_paragrafos = map words lista_de_paragrafos
                  lista_de_paragrafos = paragraphs str

main :: IO ()
main = do 
    txt <- getContents
    putStr (formatar txt)



-- It was the best of times,\nit was the worst of times.\n\nIt was the age of wisdom,\nit was the age of foolishness.\nIt was the epoch of belief,\nit was the epoch of incredulity.\n\nIt was the season of light,\nit was the season of darkness.\nIt was the spring of hope,\nit was the winter of despair.