> import Prelude hiding ((+))

Considerando a seguinte declaração de um tipo de números naturais:

> data Nat = Zero | Succ Nat  

As seguintes funções de soma:

> Zero + y = y                  -- soma.0
> Succ x + y = Succ (x + y)     -- soma.1

Queremos provar que 
        x + (y + z) = (x + y) + z, para todo x, y, z 
por indução sobre X



I. Caso Base
    Zero + (y + z) = (Zero + y) + z


[Lado esquerdo]
Zero + (y + z)
{soma.0} 
= y + z


[Lado direito]
(Zero + y) + z
{soma.1}
= (y) + z = y + z


Os dois lados são iguais, logo, está provado para o caso base.



II. Caso Indutivo

Hipótese de indução:
    x + (y + z) = (x + y) + z               -- H.I.
Tese de indução:
    Succ x + (y + z) = (Succ x + y) + z


Simplificando a equação:

[Lado esquerdo]
Succ x + (y + z) 
{soma.1}
= Succ (x + (y + z)) 
{H.I.}
= Succ ((x + y) + z)
{soma.1 invertida}
= Succ (x + y) + z


Assim, saímos do lado esquerdo da equação e conseguimos chegar ao lado direito,
o que conclui a prova.




 