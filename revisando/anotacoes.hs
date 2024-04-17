-- GHCI

>> ghci -- iniciar o interpretador

>> :l programa.hs -- carregar funções de um programa

>> :r -- refresh do programa já carregado

>> :t x -- retorna o tipo da função ou variável x



-- TIPOS
Bool
Char -- 'c'
String -- "str" ; equivalente a [Char]
Int
Integer
Float
Double
[Int] -- lista de inteiros
(Int, Int) -- tuplo de inteiro e inteiro



-- FUNÇÕES

-- operadores podem ser usados antes dos argumentos quando entre parênteses
soma x y = (+) x y

-- funções podem ser usadas entre argumentos quando entre ``
resto x y = x `mod` y



-- funções do prelúdio
head :: [a] -> a -- retorna o primeiro elemento da lista
tail :: [a] -> [a] -- retorna a lista sem o primeiro elemento
init :: [a] -> [a] -- retorna a lista original sem o último elemento
length :: [a] -> a -- retorna a quantidade de elementos da lista
take :: Int -> [a] -> [a] -- retorna uma lista com os n primeiros elementos da lista original
drop :: Int -> [a] -> [a] -- retorna a lista sem os seus primeiros n elementos
(++) :: [a] -> [a] -> [a] -- l1 ++ l2 (concantena duas listas)
reverse :: [a] -> [a] -- inverte a ordem da lista
(!!) :: [a] -> Int -> a -- lista !! n (retorna o enésimo elemento da lista)
sum :: [Int] -> Int -- retorna a soma de todos os elementos da lista
product :: [Int] -> Int -- retorna o produto de todos os elementos da lista

and :: [Bool] -> Bool -- retorna se todos os elementos da lista são True
or :: [Bool] -> Bool -- retorna se algum elemento da lista é True

null :: [a] -> Bool -- retorna se a lista é vazia
any :: (a->Bool) -> [a] -> Bool -- retorna se algum elemento da lista satisfaz uma condição
all :: (a->Bool) -> [a] -> Bool -- retorna se todos os elementos da lista satisfazem uma condição

fst :: (a, b) -> a -- retorna o primeiro elemento de um tuplo
snd :: (a, b) -> b -- retorna o segundo elemento de um tuplo


-- funções de ordem superior
zip :: [a] -> [b] -> [(a,b)]
map :: (a->b) -> [a] -> [b] -- aplica uma função a cada elemento de uma lista
filter :: (a->Bool) -> [a] -> [a] -- retorna uma lista apenas com os elementos de xs que satisfazem certa condição
takeWhile :: (a->Bool) -> [a] -> [a] -- retorna os primeiros elementos da lista que satisfazem uma condição, até algum não satisfazer
takeWhile :: (a->Bool) -> [a] -> [a] -- retira da lista os primeiros elementos que satisfazem uma condição
foldr :: (a->b->b) -> b -> [a] -> b -- foldr f z (x:xs) : para uma função "func" recursiva, 
                                    -- f é a operação entre "x" e "func xs"
                                    -- z é o resultado para o caso base
foldl :: (b->a->b) -> b -> [a] -> b -- foldl f z (x:xs) : para uma função "func" recursiva,
                                    -- f é a operação entre func "xs" e "x"
                                    -- z é o resultado para o caso base



-- definições locais
funcao a = a+b+c
        where b=1
              c=2

raizes a b c
        | delta>0 = let r = sqrt delta
        in [(-b+r)/(2*a),(-b-r)/(2*a)]
        -- r só está definido na expressão acima
        | delta==0 = [-b/(2*a)]
        | otherwise = []
        where delta = b^2 - 4*a*c


-- conversão explicita
media xs = sum xs / fromIntegral (length xs)


-- if else
sinal :: Int -> Int
sinal x = if x>0 then 1 else
            (if x==0 then 0 else -1)

-- guardas
sinal :: Int -> Int
sinal x | x>0 = 1
| x==0 = 0
| otherwise = -1


-- case
null :: [a] -> Bool
null xs = case xs of
            [] -> True
            (_:_) -> False


-- lambda
(\n -> n*2)

-- secções 
(+1) 2 -- (+1) é a função sucessor

-- composição 
f xs = sum (map (^2) (filter even xs))
f = sum . map (^2) . filter even



-- exemplos uteis

-- retorna os indices de ys em que está x
indices :: Eq a => a -> [a] -> [Int]
indices x ys = [i | (y,i)<-zip ys [0..], x==y]


-- retorna uma lista de pares ordenados de xs
paresConsecutivos :: [a] -> [(a,a)]
paresConsecutivos xs = zip xs (tail xs)



-- DATA.CHAR

import Data.Char

isUpper
isLower
isLetter
toUpper
toLower


