use Hospital_BD;

-- Ex 1) Liste o nome e o CPF de todos os pacientes do sexo feminino:
	select nome, cpf from paciente where sexo = 'feminino';

-- Ex 2) Exiba o nome e telefone dos pacientes que moram em um determinado estado (UF_paciente = 'SP'):
	select nome, telefone from paciente where UF_paciente = 'RJ';

-- Ex 3) Liste todos os medicamentos e os números dos id's:
	select nome_remedio, id_remedio from remedio;
    
-- Ex 4) Mostre todos os funcionários cujo nome contenha a palavra “Silva”:
	select id_funcionario, nome from funcionario where id_funcionario >= 30;

-- Ex 5) Mostre a quantidade total de pacientes cadastrados:
	select count(*) as pacientes from paciente;

-- Ex 6) Exiba o número de funcionários em cada cargo:
	select id_cargo, count(*) as quantidade_funcionarios from funcionario group by id_cargo;

-- Ex 7) Mostre a quantidade de consultas realizadas por cada médico:
	select id_funcionario, count(*) as total_consultas from consulta group by id_funcionario;

-- Ex 8) Calcule o total de medicamentos cadastrados no estoque:
	select count(*) as total_medicamentos from remedio;

-- Ex 9) Mostre a média de idade dos pacientes:
SELECT 
    ROUND(AVG(TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE())), 0) AS media_idades
FROM Paciente;
