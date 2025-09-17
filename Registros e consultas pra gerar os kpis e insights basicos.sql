CREATE TABLE atendimentos_saude_mental (
    id_atendimento INT PRIMARY KEY,
    data_atendimento DATE,
    idade INT,
    sexo VARCHAR(10),
    diagnostico VARCHAR(100),
    status_atendimento VARCHAR(50)
);

INSERT INTO atendimentos_saude_mental (id_atendimento, data_atendimento, idade, sexo, diagnostico, status_atendimento) VALUES
(1, '2023-01-15', 22, 'Feminino', 'Ansiedade', 'Concluído'),
(2, '2023-02-10', 35, 'Masculino', 'Depressão', 'Em andamento'),
(3, '2023-03-05', 17, 'Feminino', 'Crise Suicida', 'Encaminhado'),
(4, '2023-04-12', 41, 'Masculino', 'Ansiedade', 'Concluído'),
(5, '2023-05-20', 29, 'Feminino', 'Depressão', 'Concluído'),
(6, '2023-06-11', 33, 'Masculino', 'Crise Suicida', 'Encaminhado'),
(7, '2023-07-23', 19, 'Feminino', 'Ansiedade', 'Concluído'),
(8, '2023-08-14', 27, 'Masculino', 'Depressão', 'Em andamento'),
(9, '2023-09-07', 38, 'Feminino', 'Crise Suicida', 'Encaminhado'),
(10,'2023-10-02', 45, 'Masculino', 'Ansiedade', 'Concluído'),
(11, '2023-11-05', 24, 'Feminino', 'Depressão', 'Concluído'),
(12, '2023-11-12', 31, 'Masculino', 'Ansiedade', 'Em andamento'),
(13, '2023-11-18', 28, 'Feminino', 'Crise Suicida', 'Encaminhado'),
(14, '2023-12-02', 45, 'Masculino', 'Depressão', 'Concluído'),
(15, '2023-12-10', 19, 'Feminino', 'Ansiedade', 'Concluído'),
(16, '2023-12-15', 37, 'Masculino', 'Crise Suicida', 'Encaminhado'),
(17, '2024-01-03', 22, 'Feminino', 'Depressão', 'Concluído'),
(18, '2024-01-08', 40, 'Masculino', 'Ansiedade', 'Em andamento'),
(19, '2024-01-12', 30, 'Feminino', 'Crise Suicida', 'Encaminhado'),
(20, '2024-01-20', 26, 'Masculino', 'Depressão', 'Concluído'),
(21, '2024-02-02', 21, 'Feminino', 'Ansiedade', 'Concluído'),
(22, '2024-02-10', 34, 'Masculino', 'Crise Suicida', 'Encaminhado'),
(23, '2024-02-18', 29, 'Feminino', 'Depressão', 'Concluído'),
(24, '2024-02-25', 42, 'Masculino', 'Ansiedade', 'Em andamento'),
(25, '2024-03-03', 18, 'Feminino', 'Crise Suicida', 'Encaminhado'),
(26, '2024-03-10', 36, 'Masculino', 'Depressão', 'Concluído'),
(27, '2024-03-15', 23, 'Feminino', 'Ansiedade', 'Concluído'),
(28, '2024-03-20', 39, 'Masculino', 'Crise Suicida', 'Encaminhado'),
(29, '2024-03-25', 27, 'Feminino', 'Depressão', 'Concluído'),
(30, '2024-03-30', 33, 'Masculino', 'Ansiedade', 'Em andamento');

-- Total de atendimentos
select count(*) as total_atendimentos
from atendimentos_saude_mental;

-- atendimentos por diagnosticos
select diagnostico, count(*) as total
from atendimentos_saude_mental
group by diagnostico
order by total desc;

-- Atendimentos por sexo
select sexo, count(*) as total
from atendimentos_saude_mental
group by sexo
order by total desc;

-- atendimentos por faixa etaria
select
	case
		when idade between 10 and 19 then '10-19'
        when idade between 20 and 29 then '20-29'
        when idade between 30 and 39 then '30-39'
        when idade between 40 and 49 then '40-49'
        when idade between 50 and 59 then '50-59'
        else '60+'
	end as faixa_etaria,
    count(*) as total
from atendimentos_saude_mental
group by faixa_etaria
order by total desc;

-- atendimentos por status
select status_atendimento, count(*) as total
from atendimentos_saude_mental
group by status_atendimento
order by total desc;

-- atendimentos por mes/ano 
select
	year(data_atendimento) as ano,
    month(data_atendimento) as mes,
    count(*) as total
from atendimentos_saude_mental
group by year(data_atendimento), month(data_atendimento)
order by ano, mes;































