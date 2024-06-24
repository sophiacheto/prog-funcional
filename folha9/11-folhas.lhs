

Queremos provar que 
        folhas arv = 1 + nos arv
para qualquer arvore arv 

Partindo das definições:

> data Arv a = Folha | No a (Arv a) (Arv a)

> folhas Folha = 1
> folhas (No a esq dir) = folhas esq + folhas dir

> nos Folha = 0
> nos (No a esq dir) = 1 + nos esq + nos dir 


Provando por indução sobre árvores:

I. Caso Base (arv = Folha)
    folhas arv = 1 + nos arv

[Lado esquerdo]
folhas Folha
{folhas.1}
= 1

[Lado direito]
1 + nos Folha
{nos.1}
= 1 + 0 
= 1

Provado.  


II. Caso Indutivo

Hipotese de Indução
        folhas esq = 1 + nos esq 
        folhas dir = 1 + nos dir 
Tese 
        folhas (No a esq dir) = 1 + nos (No a esq dir)


[Lado esquerdo da tese]
folhas (No a esq dir)
{folhas.2}
= folhas esq + folhas dir 
{H.I}
= 1 + nos esq + 1 + nos dir 
= 2 + nos esq + nos dir

[Lado direito]
1 + nos (No a esq dir)
{nos.2}
= 1 + 1 + nos esq + nos dir 
= 2 + nos esq + nos dir

Como queriamos provar.