----QUESTAO 1
CREATE TABLE best_films (
	id serial PRIMARY KEY,
	title varchar(200) NOT NULL,
	description TEXT NOT NULL
);

----QUESTAO 4
--foram encontrados dois resultados estes sendo CODA e Nightmare Alley.

SELECT title FROM best_films WHERE description LIKE '% she %';

----QUESTAO 5
--foram encontrados tres resultados estes sendo CODA, Nightmare Alley e Drive My Car, portanto nao foram os mesmos resultados.

SELECT title FROM best_films WHERE description LIKE '% She %';

----QUESTAO 6
--foram encontrados tres resultados estes sendo CODA, Nightmare Alley e Drive My Car, o que representa a junçao das duas respostas anterirores.

SELECT title FROM best_films WHERE description ILIKE '% she %';

----QUESTAO 7
-- foram encontrados tres titulos Belfast, Drive My Car e Don't Look Up.

SELECT title FROM best_films WHERE to_tsvector('english', description) @@ to_tsquery ('english','directs');

----QUESTAO 8
--analisando os resultados abaixo concluimos que os resultados nao sao iguais para todos os 3, apenas para direct e directed.

--RESP 1: 
--titulos encontrados: Dune
SELECT title FROM best_films WHERE to_tsvector('english', description) @@ to_tsquery ('english','director');

--RESP 2:
--titulos encontrados: Belfast, Drive My Car e Don't Look Up.
SELECT title FROM best_films WHERE to_tsvector('english', description) @@ to_tsquery ('english','direct');

--RESP 3: 
--titulos encontrados: Belfast, Drive My Car e Don't Look Up.
SELECT title FROM best_films WHERE to_tsvector('english', description) @@ to_tsquery ('english','directed');

----QUESTAO 9
--o vetor gerado para cada uma utiliza a palavra caso ela esteja presente no dicionario utilizado, com 'directs', 'direcr' e 'directed' sendo convertido para forma singular
--e 'director' sendo colocado como uma palavra a parte.
SELECT to_tsvector('english', description) FROM best_films WHERE to_tsvector('english', description) @@ to_tsquery ('english','directs');
SELECT to_tsvector('english', description) FROM best_films WHERE to_tsvector('english', description) @@ to_tsquery ('english','direct');
SELECT to_tsvector('english', description) FROM best_films WHERE to_tsvector('english', description) @@ to_tsquery ('english','director');
SELECT to_tsvector('english', description) FROM best_films WHERE to_tsvector('english', description) @@ to_tsquery ('english','directed');

----QUESTAO 10
--o vetor gerado pega todas as palavras que estao presentes na descriçao, desde que elas sejam reconhecidas por algum dicionario, e retorna elas
--ao lado da posiçao em que elas estao presentes no vetor, com espaços, conectivos e caracters nao reconhecidos sendo ignorados e nao entrando na contagem.
SELECT to_tsvector('english', description) FROM best_films WHERE id = 1;

----QUESTAO 11
--analisando os dados abaixo os resultados foram iguais para todos os casos.

--titulos encontrados: Being the Ricardos, Belfast, CODA e Drive My Car.
SELECT title FROM best_films WHERE to_tsvector('english', description) @@ to_tsquery ('english','drama');

--titulos encontrados: Being the Ricardos, Belfast, CODA e Drive My Car.
SELECT title FROM best_films WHERE to_tsvector('english', description) @@ to_tsquery ('english','DraMA');

--titulos encontrados: Being the Ricardos, Belfast, CODA e Drive My Car.
SELECT title FROM best_films WHERE to_tsvector('english', description) @@ to_tsquery ('english','DRAMA');


----QUESTAO 12
--o vetor gerado pega todos os titulos que contem uma variancia da palavra 'drama', indiferente se o query tiver letras maiusculas ou minusculas,
--colocando as descriçoes de todos os filmes separado por palavras e suas posiçoes na descriçao dentro do vetor.
SELECT to_tsvector('english', description) FROM best_films WHERE to_tsvector('english', description) @@ to_tsquery ('english','drama');
SELECT to_tsvector('english', description) FROM best_films WHERE to_tsvector('english', description) @@ to_tsquery ('english','DraMA');
SELECT to_tsvector('english', description) FROM best_films WHERE to_tsvector('english', description) @@ to_tsquery ('english','DRAMA');

----QUESTAO 13
--RESP 1: 
--titulos encontrados: Belfast, CODA.
SELECT title FROM best_films WHERE to_tsvector('english', description) @@ to_tsquery ('english','drama & family');

--RESP 2: 
--titulos encontrados: Belfast, CODA, Being the Ricardos, Drive My Car, Dune e Encanto.
SELECT title FROM best_films WHERE to_tsvector('english', description) @@ to_tsquery ('english','drama | family');

--RESP 3: 
--titulos encontrados: Don't Look Up, Dune, Encanto e Nightmare Alley.
SELECT title FROM best_films WHERE to_tsvector('english', description) @@ to_tsquery ('english','!drama');
