type Letras = (Char,Char)          -- um bloco de letras
type Digitos = (Int,Int)           -- um bloco de algarismos
type Matricula = (Letras, Digitos, Letras)  -- uma matrícula

valida :: Matricula -> Bool
valida (l1, d, l2) = letras l1 && letras l2 && algarismos d 

algarismo :: Int -> Bool
algarismo n = n >= 0 && n <= 9 

algarismos :: Digitos -> Bool
algarismos tuplo = algarismo (fst tuplo) && algarismo (snd tuplo)

letra :: Char -> Bool
letra x = x>='A' && x<='Z'

letras :: Letras -> Bool
letras tuplo = letra (fst tuplo) && letra (snd tuplo)

