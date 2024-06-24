
> import Prelude hiding (map, length)

Queremos provar que
    length (map f xs) = length xs
para todo xs 

Partimos das definições:

> length [] = 0
> length (x:xs) = 1 + length xs

> map f [] = []
> map f (x:xs) = f x : map f xs



Analisando por indução sobre xs:

I. Caso Base (xs=[])
length (map f []) = length []

[Lado esquerdo]
length (map f [])
{map.1}
= length ([])
{length.1}
= 0

[Lado direito]
length []
{length.1}
= 0

Provado.


II. Caso indutivo

Hipotese de Indução
    length (map f xs) = length xs
Tese    
    length (map f (x:xs)) = length (x:xs)


Simplificando o lado esquerdo da tese:

length (map f (x:xs))
        ````````````
{map.2}
= length (f x : map f xs)
{length.2}
= 1 + length (map f xs) 
{H.I.}
= 1 + length xs


[Lado direito]
length (x:xs)
{length.2}
= 1 + length xs 

Como queríamos provar.