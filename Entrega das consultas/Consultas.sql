use Hospital_BD;

-- Ex 1) Liste o nome e o CPF de todos os pacientes do sexo feminino:
	select nome, cpf from paciente where sexo = 'feminino';

-- Ex 2) Mostre os nomes e cargos de todos os funcionários que sejam do sexo masculino:
	select nome, id_cargo from funcionario where sexo = 'masculino';
    select * from cargo;

-- Ex 3) Exiba o nome e telefone dos pacientes que moram em um determinado estado (UF_paciente = 'SP'):
	select nome, telefone from paciente where UF_paciente = 'RJ';

-- Ex 4) Liste todos os medicamentos e os números dos id's:
	select nome_remedio, id_remedio from remedio;
    
-- Ex 5) Mostre todos os funcionários cujo nome contenha a palavra “Silva”:
	select id_funcionario, nome from funcionario where id_funcionario >= 30;

-- Ex 6) Mostre a quantidade total de pacientes cadastrados:
	select count(*) as pacientes from paciente;

-- Ex 7) Exiba o número de funcionários em cada cargo:
	select id_cargo, count(*) as quantidade_funcionarios from funcionario group by id_cargo;

-- Ex 8) Mostre a quantidade de consultas realizadas por cada médico:
	select id_funcionario, count(*) as total_consultas from consulta group by id_funcionario;

-- Ex 9) Calcule o total de medicamentos cadastrados no estoque:
	select count(*) as total_medicamentos from remedio;

-- Ex 10) Mostre a média de idade dos pacientes:
SELECT 
    ROUND(AVG(TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE())), 0) AS media_idades
FROM Paciente;

-- usar avg para fazer a média e a fórmula para calcular as idade a partir da data de nascimento dentro do parênteses
  
-- Ex 16) Liste os cargos que possuem mais de 3 funcionários:
	

-- Ex 17) Mostre os estados (UF_paciente) com mais de 5 pacientes:

-- Ex 18) Exiba os médicos que realizaram mais de 10 consultas:

-- Ex 19) Mostre o nome dos medicamentos e quantas vezes foram receitados, somente se tiverem sido usados mais de 5 vezes:

-- Ex 20) Liste as salas e a quantidade de consultas realizadas em cada uma:

-- Ex 21) Mostre o nome dos funcionários cujo cargo é o mesmo do funcionário com id_funcionario = 1:

-- Ex 22) Liste os pacientes que têm consultas com o mesmo médico de um paciente específico:

-- Ex 23) Exiba os medicamentos cujo preço é maior que a média de todos os medicamentos:

-- Ex 24) Mostre os pacientes que possuem mais de uma receita médica:

-- Ex 25) Exiba os médicos que nunca realizaram consultas:

-- Ex 26) Atualize o telefone de um paciente específico:

-- Ex 27) Exclua todas as consultas realizadas antes de 2020:

-- Ex 28) Aumente em 10% o preço de todos os medicamentos do tipo “antibiótico”:

-- Ex 29) Remova os funcionários que não têm cargo associado:

-- Ex 30) Atualize o estoque dos medicamentos após o uso em uma receita: