
> import Prelude hiding (take, drop, (++))

Queremos provar que:
    take n xs ++ drop n xs = xs
para todo n e para qualquer lista xs.  

Temos as seguintes definições para funções take e drop:

> take 0 xs = [ ]                               -- take.1
> take n [ ] | n > 0 = [ ]                      -- take.2
> take n (x : xs) | n > 0 = x : take (n - 1) xs -- take.3
> drop 0 xs = xs                                -- drop.3
> drop n [ ] | n > 0 = [ ]                      -- drop.2
> drop n (x : xs) | n > 0 = drop (n - 1) xs     -- drop.3

> (++) :: [a] -> [a] -> [a]
> [] ++ ys = ys                           -- ++.1
> (x:xs) ++ ys = x : (xs ++ ys)             -- ++.2


A partir disso, provaremos por indução sobre n:


I. Caso Base (n=0)
        take 0 xs ++ drop 0 xs = xs

[Lado Esquerdo]
take 0 xs ++ drop 0 xs
{take.1}
= [] ++ drop 0 xs
{drop.1}
= [] ++ xs
{++.1}
= xs 

Como partimos de um lado da equação e alcançamos o outro, está provado para o caso base. 


II. Caso indutivo 

Hipotese de Indução
        take n xs ++ drop n xs = xs
Tese 
        take (n+1) xs ++ drop (n+1) xs = xs


Analisaremos para cada caso de xs:


-- xs = []
[Lado esquerdo da tese]
take (n+1) [] ++ drop (n+1) []
{take.2}
= [] ++ drop (n+1) []
{drop.2}
= [] ++ []
{++.1}
= []
{analise de caso}
= xs

Provado. 


-- xs = (x:xs)
[Lado esquerdo da tese]
take (n+1) (x:xs) ++ drop (n+1) (x:xs)
{take.3}
= (x : take n xs) ++ drop (n+1) (x:xs)
{drop.3}
= (x : take n xs) ++ drop n xs
{++2}
= x : (take n xs ++ drop n xs)
{H.I}
= x : xs
{Analise de Caso}
= xs

Como queriamos provar.