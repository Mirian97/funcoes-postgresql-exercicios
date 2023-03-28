--1 - Faça uma query que retorna a quantidade de medicamentos da tabela `farmacia`.
SELECT COUNT(medicamento) FROM farmacia;

--2 - Faça uma query que retorna apenas a idade do usuario mais novo cadastrado na tabela `usuarios`.
SELECT MIN(idade) as idade FROM usuarios;

--3 - Faça uma query que retorna apenas a idade do usuario mais velho cadastrado na tabela `usuarios`.
SELECT MAX(idade) as idade FROM usuarios;

--4 - Faça uma query que retorna a média de idade entre os usuários cadastrados na tabela `usuarios` com idade maior ou igual a 18 anos.
SELECT AVG(idade) FROM usuarios WHERE idade>=18

--5 - Faça uma query que retorna a soma total do estoque de todos os medicamentos das categorias `blue` e `black` na tabela `farmacia`.
select categoria, sum(estoque) as "estoqueTotal" from farmacia 
where categoria = 'black' or categoria = 'blue' 
group by categoria;

--6 - Faça uma query que retorna todas as categorias não nulas e a soma do estoque de todos os medicamentos de cada categoria na tabela `farmacia`.
SELECT categoria, sum(estoque) as "Total por categoria" FROM farmacia WHERE categoria IS NOT NULL GROUP BY categoria;

--7 - Faça uma query que retorna a soma do estoque disponível dos medicamentos sem categoria na tabela `farmacia`.
SELECT categoria, sum(estoque) as "Total por categoria" FROM farmacia WHERE categoria IS NULL GROUP BY categoria;

--8 - Faça uma query que retorna a quantidade de medicamentos sem categoria na tabela `farmacia`.
SELECT count(medicamento) FROM farmacia WHERE categoria IS NULL;

--9 - Faça uma query que retorna uma única coluna com a junção do nome do medicamento e a categoria entre parenteses de todos os registros em que a categoria não seja nula da tabela `farmacia`. Ex.: `Endocet (green)`.
SELECT CONCAT(medicamento, ' (', categoria, ')') as medicamento_categoria 
FROM farmacia WHERE categoria IS NOT NULL;

SELECT medicamento || ' (' || categoria || ')' as medicamento_categoria 
FROM farmacia WHERE categoria IS NOT NULL;

--10 - Faça uma query que retorna uma única coluna com a junção do identificador e o nome do medicamento separado por um hífen e a categoria entre parenteses de todos os registros da tabela `farmacia`. Quando a categoria for nula, substituir por `(sem categoria)`. Ex.: `1 - Endocet (green)` ou `1 - Endocet (sem categoria)`.
SELECT id || ' - '|| medicamento || ' (' || COALESCE(categoria, 'sem categoria') || ')' as id_medicamento_categoria FROM farmacia;
SELECT CONCAT(id, ' - ', medicamento, ' (', COALESCE(categoria, 'sem categoria'), ')') as id_medicamento_categoria FROM farmacia;

--11 - Faça uma query que retorna o nome, a idade e a data de cadastro no formato `AAAA-MM-DD` de todos os cadastros que aconteceram no ano de 2020, na tabela `usuarios`.
SELECT nome, idade, CAST(cadastro as date) FROM usuarios 
WHERE CAST(cadastro as date) >= '2020-01-01' AND CAST(cadastro as date) <= '2020-12-30';

select nome, idade, cast(cadastro as date) from usuarios 
where cadastro::date < '2021-01-01' and cadastro::date > '2019-12-31';

--12 - Faça uma query que retorna o nome, a idade, o email e o tempo que cada usuario menor de 18 anos possui cadastrado na tabela `usuarios`. O tempo precisa ser uma coluna que retorne a quantidade de anos, meses, dias, horas, minutos e segundos em um objeto. Ex.: `{"years":2,"months":2,"days":19,"hours":8,"minutes":22,"seconds":19}`.
SELECT nome, idade, email, AGE(CAST(cadastro as timestamp)) as tempo_de_cadastro FROM usuarios WHERE idade<18;
SELECT nome, idade, email, AGE(cadastro::timestamp) as tempo_de_cadastro FROM usuarios WHERE idade<18;

--13 - Faça uma query que retorna o nome, a idade, o email e o tempo que cada usuario, maior ou igual a 60 anos, possui cadastrado na tabela `usuarios`. O tempo precisa ser uma coluna que retorne apenas a quantidade de anos, meses, dias em um objeto. Ex.: `{"years":2,"months":2,"days":19}`.
SELECT nome, idade, email, AGE(CAST(cadastro as date)) as tempo_de_cadastro FROM usuarios WHERE idade >=60;

--14 - Faça uma query que retorna a categoria e a quantidade de produtos de cada categoria que não seja nula da tabela `farmacia`.
select categoria, count(id) from farmacia where categoria is not null group by categoria;

--15 - Faça uma query que retorna a idade e a quantidade de registros de cada idade, onde a idade seja maior ou igual a 18 anos, na tabela `usuarios`.
SELECT idade, COUNT(*) as "quantidade_por_idade" FROM usuarios WHERE idade>=18 GROUP BY idade;

--16 - Faça uma query que retorna as três categorias e a soma do estoque de todos os medicamentos de cada categoria, na tabela `farmacia`.
SELECT categoria, sum(estoque) as "Total por categoria" FROM farmacia GROUP BY categoria LIMIT 3;