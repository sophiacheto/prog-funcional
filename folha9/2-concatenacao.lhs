
> import Prelude hiding ((++))

Tendo em conta a seguinte definição da concatenação de listas:

> (++) :: [a] -> [a] -> [a]
> [] ++ ys = ys                     -- ++.1
> (x:xs) ++ ys = x : (xs ++ ys)     -- ++.2

Queremos provar
    (xs ++ ys) ++ zs = xs ++ (ys ++ zs)
por indução sobre xs


I. Caso Base (xs = [])

[Lado esquerdo]
([] ++ ys) ++ zs 
{++.1}
= (ys) ++ zs 
= ys ++ zs

[Lado direito]
[] ++ (ys ++ zs)
{++.1}
= (ys ++ zs)
= ys ++ zs

Os dois lados são iguais, logo, está provado para o caso base.


II. Caso indutivo

Hipótese de indução:
    (xs ++ ys) ++ zs = xs ++ (ys ++ zs)     -- H.I.
Tese de indução:
    ((x:xs) ++ ys) ++ zs = (x:xs) ++ (ys ++ zs)


Simplificando a equação:
[Lado esquerdo]
{++.2} sobre ((x:xs) ++ ys)
= (x : (xs ++ ys)) ++ zs
{++.2} sobre (x : (xs ++ ys))
= x : ((xs ++ ys) ++ zs)
{H.I.}
= x : (xs ++ (ys ++ zs))

[Lado direito]
{++.2} 
= x : (xs ++ (ys ++ zs))


Os dois lados são iguais, logo, a prova está completa.
