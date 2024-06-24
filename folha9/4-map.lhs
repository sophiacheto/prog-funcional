
> import Prelude hiding (map, (.))

Considerando as seguintes definições da função map e .:

> map f [] = []                         -- map.1
> map f (x : xs) = f x : map f xs       -- map.2
> (f . g) x = f (g x)                   -- comp.1

Queremos provar que 
     map f (map g xs) = map (f . g) xs


I. Caso Base (xs = [])

map f (map g []) = map (f . g) []


Simplificando:
[Lado esquerdo]
map f (map g [])
      ^^^^^^^^^^
{map.1}
= map f []
{map.1}
= []


[Lado direito]
map (f . g) []
{map.1}
= []

Como obtemos o mesmo resultado em ambos os casos,
fica provado o caso base.


II. Caso Indutivo

Hipotese de Indução:
        map f (map g xs) = map (f . g) xs
Tese: 
        map f (map g (x:xs)) = map (f . g) (x:xs)


Começando pelo lado esquerdo da tese:
map f (map g (x:xs))
      ^^^^^^^^^^^^^^
{map.2}
= map f (g x : map g xs)
  ^^^^^
{map.2}
= f (g x) : map f (map g xs)
            ^^^^^^^^^^^^^^^^
{H.I}
= f (g x) : map (f . g) xs 
  ^^^^^^^
{comp.1 invertida}
= (f . g) x : map (f . g) xs 
{map.2 invertida}
= map (f . g) (x:xs)

Como partimos de um lado da equação e alcançamos o outro, está provado o caso indutivo. 
