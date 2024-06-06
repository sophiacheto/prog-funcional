{-
  Um verificador de tautologias em Haskell

  Pedro Vasconcelos, 2010-2013
  Baseado no exemplo de G.Hutton, "Programming in Haskell", 2007, 
  Cambridge University Press
-}

{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use foldr" #-}
{-# HLINT ignore "Use map" #-}


import Data.List (nub)  -- remover repetidos

-- tipo para expressões proposicionais
data Prop = Const Bool        -- constantes
          | Var Char          -- variáveis
          | Neg Prop          -- negação
          | Conj Prop Prop    -- conjunção
          | Disj Prop Prop    -- disjunção
          | Impl Prop Prop    -- implicação
          | Equiv Prop Prop   -- equivalência         --- 7.3
            deriving (Eq,Show)

-- listas de associações
type Assoc ch v = [(ch,v)]

-- encontrar o valor associado a uma chave
-- parcial: erro se a chave não ocorre
find :: Eq ch => ch -> Assoc ch v -> v
find x assocs = head [v | (x',v)<-assocs, x==x']

-- atribuições de valores a variaveis
type Atrib = Assoc Char Bool

-- calcular o valor duma proposição
valor :: Atrib -> Prop -> Bool
valor s (Const b) = b
valor s (Var x)    = find x s
valor s (Neg p)    = not (valor s p)
valor s (Conj p q) = valor s p && valor s q
valor s (Disj p q) = valor s p || valor s q
valor s (Impl p q) = not (valor s p) || valor s q
valor s (Equiv p q) = equiv p q                 --- 7.3

exemplo :: Assoc Char Bool
exemplo = [('a',True), ('b',False), ('x',True)]

prop1 :: Prop
prop1 = Disj (Var 'a') (Neg (Var 'a'))


-- gerar todas sequências de `n' boleanos
bits :: Int -> [[Bool]]
bits 0 = [[]]
bits n = [b:bs | b<-[False,True], bs<-bits (n-1)]

-- todas as atribuições às variáveis duma proposição
atribs :: Prop -> [Atrib]
atribs p = map (zip vs) (bits (length vs))
    where vs = nub (vars p)  -- variáveis sem repetições


-- coleciona todas as variáveis duma proposição
vars :: Prop -> [Char]
vars (Const _)   =  []
vars (Var x)     =  [x]
vars (Neg p)     =  vars p
vars (Conj p q)  =  vars p ++ vars q
vars (Disj p q)  =  vars p ++ vars q
vars (Impl p q)  =  vars p ++ vars q
vars (Equiv p q) = vars p ++ vars q     --- 7.3

prop2 :: Prop
prop2 = Impl (Var 'a') (Impl (Neg (Var 'a')) (Var 'b'))

-- verificar se é taulogia
tautologia :: Prop -> Bool
tautologia p = and [valor s p | s<-atribs p]


taut1 :: Prop
taut1 = Impl (Var 'a') (Var 'a')

notaut1 :: Prop
notaut1 = Impl (Var 'a') (Neg (Var 'a'))


-----------------------------------------------------------


--- QUESTÃO 7.1
satisfaz :: Prop -> Bool
satisfaz p = or [valor s p | s<-atribs p]


--- QUESTÃO 7.2
equiv :: Prop -> Prop -> Bool
equiv p q = tautologia (Conj (Impl p q) (Impl q p))
-- equiv p q = and [valor s p == valor s q | s<-atribs p] 


--- QUESTÃO 7.4
showProp :: Prop -> String
showProp (Const True) = "T"
showProp (Const False) = "F"
showProp (Var ch) = [ch]
showProp (Neg p) = "(~" ++ showProp p ++ ")"
showProp (Conj p q) = "(" ++ showProp p ++ " && " ++ showProp q ++ ")"
showProp (Disj p q) = "(" ++ showProp p ++ " || " ++ showProp q ++ ")"
showProp (Impl p q) = "(" ++ showProp p ++ " -> " ++ showProp q ++ ")"
showProp (Equiv p q) = "(" ++ showProp p ++ " <-> " ++ showProp q ++ ")"


---- QUESTÃO 7.5
tabela :: Prop -> IO ()
tabela p = do
        putStrLn (intercalar ' '  (nub (vars p)) ++ " RESULT")
        putStr (printar (valores p (atribs p)))


intercalar :: a -> [a] -> [a]
intercalar valor [] = []
intercalar valor [x] = [x]
intercalar valor (x:xs) = x : (valor : intercalar valor xs)


printar :: [[Bool]] -> String
printar [] = ""
printar (x:xs) = concat [printBool booleano ++ " " | booleano <- x] ++ "\n" ++ printar xs


printBool :: Bool -> String
printBool True = "T"
printBool False = "F"

-- pega uma proposição, a lista de atribuicoes para p, e retorna uma lista com todas as possiveis atribuicoes e seus respectivos resultados
valores :: Prop -> [Atrib] -> [[Bool]]
valores p [] = []
valores p (x:xs) = ([val | (variavel, val) <- x] ++ [valor x p]) : valores p xs
            -- ++ [(valor s p, s) | s<-atribs p]

-- >>> tautologia notaut1

-- >>> tautologia taut1
-- True
-- >>> tautologia (Disj (Var 'a') (Neg (Var 'a')))
-- True
-- >>> tautologia (Var 'a')
-- False
-- >>> tautologia (Const True)
-- True
-- >>> tautologia (Const False)
-- False

