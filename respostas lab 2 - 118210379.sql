----QUESTAO 1
SELECT to_tsvector('english', 'i love my big brother');
SELECT to_tsvector('portuguese', 'i love my big brother');
SELECT to_tsvector('english', 'eu amo meu irmão mais velho');
SELECT to_tsvector('portuguese', 'eu amo meu irmão mais velho');
SELECT to_tsvector('portuguese', 'burning the house down');
SELECT to_tsvector('english', 'burning the house down');

----QUESTAO 2
--os filmes encontrados foram: Belfast e CODA.
--todos os filmes encontrados possuem os lexemas 'family' e 'drama', contudo apenas um deles possuem os lexemas na ordem desejada.
SELECT title FROM best_films WHERE to_tsvector('english', description) @@ to_tsquery ('english','family & drama');


----QUESTAO 3
--os filmes encontrados foram: CODA.
SELECT title FROM best_films WHERE to_tsvector('english', description) @@ to_tsquery ('english','family <-> drama');

----QUESTAO 4
--o resultado da consulta abaixo foi TRUE pois o vetor gerado pelo 'to_tsvector' apenas reconhece os lexemas 'family' e 'drama', enquanto a
--consulta gerada pelo 'to_tsquery' reconhece apenas os termos 'family' e 'drama', com ambos os casos desconsiderando suas respecitivas stop words,
--guardando apenas as palavras chaves na suas formas reconhecidas pelos dicionarios consultados, permitindo que ambos possuam os mesmos valores.
SELECT to_tsvector('english', 'this is a family drama') @@ to_tsquery('english', 'drama & of & a & family');

----QUESTAO 5

----QUESTAO 6

----QUESTAO 7

----QUESTAO 8

----QUESTAO 9
