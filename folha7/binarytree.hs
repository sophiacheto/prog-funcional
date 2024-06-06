{-
  Árvores binárias de pesquisa
  Pedro Vasconcelos, 2023
-}
{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
module Arv where
import Distribution.Simple.Utils (xargs)

data Arv a = Vazia
           | No a (Arv a) (Arv a)
           deriving Show

-- construir uma árvore equilibrada
-- pré-condição: a lista dada está por ordem crescente
construir :: [a] -> Arv a
construir [] = Vazia
construir xs = No meio esq dir
  where
    n = length xs `div` 2
    xs' = take n xs
    (meio:xs'') = drop n xs
    esq = construir xs'
    dir = construir xs''

-- procurar um element numa árvore
pertence :: Ord a => a -> Arv a -> Bool
pertence x Vazia = False
pertence x (No y esq dir)
  | x == y = True
  | x < y = pertence x esq
  | otherwise = pertence x dir

-- calcular a altura de uma árvore
altura :: Arv a -> Int
altura Vazia = 0
altura (No _ esq dir) = 1 + max (altura esq) (altura dir)

listar :: Arv a -> [a]
listar Vazia = []
listar (No x esq dir) = listar esq ++ [x] ++ listar dir

-----------------------------------

listarDecr :: Arv a -> [a]
listarDecr Vazia = []
listarDecr (No x esq dir) = listarDecr dir ++ [x] ++ listarDecr esq

sumArv :: Num a => Arv a -> a
sumArv Vazia = 0
sumArv (No x esq dir) = x + sumArv esq + sumArv dir

nivel :: Int -> Arv a -> [a]
nivel _ Vazia = []
nivel 0 (No x esq dir) = [x]
nivel n (No x esq dir) = nivel (n-1) esq ++ nivel (n-1) dir

mapArv :: (a -> b) -> Arv a -> Arv b
mapArv f Vazia = Vazia
mapArv f (No x esq dir) = No (f x) (mapArv f esq) (mapArv f dir)

maisEsq :: Arv a -> a
maisEsq (No x Vazia _) = x
maisEsq (No _ esq _) = maisEsq esq

maisDir :: Arv a -> a
maisDir (No x _ Vazia) = x
maisDir (No _ _ dir) = maisDir dir

remover :: Ord a => a -> Arv a -> Arv a
remover elem Vazia = Vazia
remover elem (No x Vazia dir)
                        | elem==x = dir
remover elem (No x esq Vazia)
                        | elem==x = esq
remover elem (No x esq dir)
                        | elem == x = No substituto (remover substituto esq) dir
                        | elem < x = No x (remover elem esq) dir
                        | elem > x = No x esq (remover elem dir)
                        where substituto = maisDir esq




-------- AVL
-- Para cada sub-árvore duma árvore AVL, o desvio só pode ser 1, 0 ou −1.


data ArvAVL a = VaziaAVL | NoAVL Int a (ArvAVL a) (ArvAVL a)

constroiNo :: a -> ArvAVL a -> ArvAVL a -> ArvAVL a
constroiNo x esq dir = NoAVL h x esq dir
          where h = 1 + max (alturaAVL esq) (alturaAVL dir)

alturaAVL :: ArvAVL a -> Int
alturaAVL VaziaAVL = 0
alturaAVL (NoAVL alt _ _ _) = alt

equilibrada :: ArvAVL a -> Bool
equilibrada VaziaAVL = True
equilibrada (NoAVL _ _ esq dir) = abs (alturaAVL esq - alturaAVL dir)<=1 &&
                              equilibrada esq &&
                              equilibrada dir

desvio :: ArvAVL a -> Int
desvio VaziaAVL = 0
desvio (NoAVL _ _ esq dir) = alturaAVL esq - alturaAVL dir


rodarDir :: ArvAVL a -> ArvAVL a
rodarDir (NoAVL ax x (NoAVL ay y t1 t2) t3) = constroiNo x t1 (constroiNo x t2 t3)
-- rodarDir (NoAVL ax x (NoAVL ay y t1 t2) t3) = NoAVL ax y t1 (NoAVL ay x t2 t3)
rodarDir t = t -- nada a fazer nos outros casos

rodarEsq :: ArvAVL a -> ArvAVL a
rodarEsq (NoAVL ax x t1 (NoAVL ay y t2 t3)) = constroiNo y (constroiNo x t1 t2) t3
rodarEsq t = t -- nada a fazer nos outros casos

corrigeDir :: ArvAVL a -> ArvAVL a
corrigeDir (NoAVL _ x t1 t2)
                | desvio t1 == -1 = rodarDir (constroiNo x (rodarEsq t1) t2)
                | otherwise = rodarDir (constroiNo x t1 t2)
corrigeDir t = t -- nada a fazer noutros casos

corrigeEsq :: ArvAVL a -> ArvAVL a
corrigeEsq (NoAVL _ x t1 t2)
                | desvio t2 == 1 = rodarEsq (constroiNo x t1 (rodarDir t2))
                | otherwise = rodarEsq (constroiNo x t1 t2)
corrigeEsq t = t -- nada a fazer noutros casos


reequilibrar :: ArvAVL a -> ArvAVL a
reequilibrar t
            | d== 2 = corrigeDir t
            | d== -2 = corrigeEsq t
            | otherwise = t
            where d = desvio t

inserirAVL :: Ord a => a -> ArvAVL a -> ArvAVL a
inserirAVL x VaziaAVL = NoAVL 1 x VaziaAVL VaziaAVL
inserirAVL x (NoAVL a y esq dir)
                | x==y -- já ocorre
                    = NoAVL a y esq dir
                | x<y -- inserir à esquerda
                    = reequilibrar (constroiNo y (inserirAVL x esq) dir)
                | x>y -- inserir à direita
                    = reequilibrar (constroiNo y esq (inserirAVL x dir))


removerAVL :: Ord a => a -> ArvAVL a -> ArvAVL a
removerAVL _ VaziaAVL = VaziaAVL
removerAVL valor (NoAVL _ x VaziaAVL dir)
                        | valor==x = reequilibrar dir
removerAVL valor (NoAVL _ x esq VaziaAVL)
                        | valor==x = reequilibrar esq
removerAVL valor (NoAVL _ x esq dir) 
                            | valor<x = reequilibrar (constroiNo x (removerAVL valor esq) dir)
                            | valor>x = reequilibrar (constroiNo x esq (removerAVL valor dir))
                            | valor==x = reequilibrar (constroiNo substituto esq (removerAVL substituto dir))
                            where substituto = maisEsqAVL dir

maisEsqAVL :: ArvAVL a -> a
maisEsqAVL (NoAVL _ x VaziaAVL _) = x
maisEsqAVL (NoAVL _ _ esq _) = maisEsqAVL esq


