
> import Prelude hiding (reverse, (++))

Considerando a seguinte definição da função reverse:

> reverse :: [a] -> [a]             
> reverse [] = []                       -- rev.1
> reverse (x:xs) = reverse xs ++ [x]    -- rev.2


E a definição da concatenação:

> (++) :: [a] -> [a] -> [a]
> [] ++ ys = ys                     -- ++.1
> (x:xs) ++ ys = x : (xs ++ ys)     -- ++.2


Queremos provar 
    reverse (xs ++ ys) = reverse ys ++ reverse xs
por indução sobre xs



I. Caso Base (xs = [])

[Lado esquerdo]
reverse ([] ++ ys)
{++.1}
= reverse ys

[Lado direito]
reverse ys ++ reverse []
{rev.1}
= reverse ys ++ []
{++.1 comutativo, provado em sala}                      ?
= reverse ys

Os dois lados chegaram a equações iguais, logo, está provado para o caso base.


II. Caso Indutivo 

Hipotese de Indução:
    reverse (xs ++ ys) = reverse ys ++ reverse xs   -- H.I.
Tese de Indução:
    reverse ((x:xs) ++ ys) = reverse ys ++ reverse (x:xs)


Simplificando a tese:

[Lado esquerdo]
reverse ((x:xs) ++ ys)
{++.2}
= reverse (x : (xs ++ ys))
{reverse.2}
= reverse (xs ++ ys) ++ [x]
{H.I.}
= reverse ys ++ reverse xs ++ [x]


[Lado direito]
reverse ys ++ reverse (x:xs)
              ^^^^^^^^^^^^^^
{reverse.2 no sentido contrário}
= reverse ys ++ reverse xs ++ [x]


Chegamos ao mesmo resultado pelos dois lados da equação, logo, está provado.