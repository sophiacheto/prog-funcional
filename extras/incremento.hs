import Data.Char
type Letras = (Char,Char)          -- um bloco de letras
type Digitos = (Int,Int)           -- um bloco de algarismos
type Matricula = (Letras, Digitos, Letras)  -- uma matrícula

incrMatricula :: Matricula -> Matricula 
incrMatricula ((charac1, charac2), (alg1, alg2), (charac3, charac4))
    | charac4 /= 'Z' = let novo = chr (ord charac4 + 1) in ((charac1, charac2), (alg1, alg2), (charac3, novo))
    | charac3 /= 'Z' = let novo = chr (ord charac3 + 1) in ((charac1, charac2), (alg1, alg2), (novo, 'A'))
    | alg2 /= 9 = let novo = alg2 + 1 in ((charac1, charac2), (alg1, novo), ('A', 'A'))
    | alg1 /= 9 = let novo = alg1 + 1 in ((charac1, charac2), (novo, 0), ('A', 'A'))
    | charac2 /= 'Z' = let novo = chr (ord charac2 + 1) in ((charac1, novo), (0, 0), ('A', 'A'))
    | charac1 /= 'Z' = let novo = chr (ord charac1 + 1) in ((novo, charac2), (0, 0), ('A', 'A'))
    | otherwise = (('a', 'a'), (0, 0), ('a', 'a'))