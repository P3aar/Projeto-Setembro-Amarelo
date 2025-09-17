-- ##consultas com kpis avancadas passo a passo

-- KPIs principais do Projeto Setembro Amarelo
SELECT
    -- Total geral de atendimentos
    (SELECT COUNT(*) FROM atendimentos_saude_mental) AS Total_Atendimentos,

    -- Total por diagnóstico
    (SELECT COUNT(*) FROM atendimentos_saude_mental WHERE diagnostico = 'Ansiedade') AS Total_Ansiedade,
    (SELECT COUNT(*) FROM atendimentos_saude_mental WHERE diagnostico = 'Depressão') AS Total_Depressao,
    (SELECT COUNT(*) FROM atendimentos_saude_mental WHERE diagnostico = 'Crise Suicida') AS Total_Crise_Suicida,

    -- Total por sexo
    (SELECT COUNT(*) FROM atendimentos_saude_mental WHERE sexo = 'Masculino') AS Total_Masculino,
    (SELECT COUNT(*) FROM atendimentos_saude_mental WHERE sexo = 'Feminino') AS Total_Feminino,

    -- Total por status
    (SELECT COUNT(*) FROM atendimentos_saude_mental WHERE status_atendimento = 'Concluído') AS Total_Concluido,
    (SELECT COUNT(*) FROM atendimentos_saude_mental WHERE status_atendimento = 'Em andamento') AS Total_Em_Andamento,
    (SELECT COUNT(*) FROM atendimentos_saude_mental WHERE status_atendimento = 'Encaminhado') AS Total_Encaminhado;

-- ==========================================
-- Consultas complementares para tendência temporal
-- ==========================================
-- Total por mês e ano (linha de tendência)
SELECT 
    YEAR(data_atendimento) AS Ano,
    MONTH(data_atendimento) AS Mes,
    COUNT(*) AS Total
FROM atendimentos_saude_mental
GROUP BY YEAR(data_atendimento), MONTH(data_atendimento)
ORDER BY Ano, Mes;

-- Total por faixa etária
SELECT 
    CASE 
        WHEN idade BETWEEN 10 AND 19 THEN '10-19'
        WHEN idade BETWEEN 20 AND 29 THEN '20-29'
        WHEN idade BETWEEN 30 AND 39 THEN '30-39'
        WHEN idade BETWEEN 40 AND 49 THEN '40-49'
        WHEN idade BETWEEN 50 AND 59 THEN '50-59'
        ELSE '60+' 
    END AS Faixa_Etaria,
    COUNT(*) AS Total
FROM atendimentos_saude_mental
GROUP BY Faixa_Etaria
ORDER BY Total DESC;
