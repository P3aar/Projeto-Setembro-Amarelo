-- Total de casos por ao
select ano, sum(Qtd_Casos) as total_casos
from suicidio
group by Ano
order by Ano;

-- Distribuicao total por sexo
select sexo, sum(Qtd_casos) as total_casos
from suicidio 
group by sexo
order by total_casos desc;

-- Distribuicao por faixa etaria
select Faixa_Etaria, sum(Qtd_Casos) As total_casos
from suicidio
group by Faixa_Etaria
order by Total_Casos desc;

-- ranking de estado (2013-2023)
select Estado, sum(Qtd_Casos) as total_casos
from suicidio
group by Estado
order by total_casos
limit 5; -- pega os 5 estados com mais casos

-- Crescimento percentual ao ano
select Ano,
		sum(Qtd_Casos) as total_casos,
        round(
			(sum(Qtd_Casos) - lag(sum(Qtd_Casos)) over (order by Ano))
            / lag(sum(Qtd_Casos)) over (order by Ano) * 100, 2
            ) as Variacao_Percentual
From suicidio
group by Ano
order by Ano;

-- media de 3 anos
select Ano,
		sum(Qtd_Casos) as total_casos,
        round(avg(sum(Qtd_Casos)) over (
			order by ano rows between 2 preceding and current row 
		), 2) as media_3anos
from suicidio
group by Ano
order by Ano;

-- top 3 anos com mais casos
select Ano, sum(Qtd_Casos) as total_casos
from suicidio
group by ano
order by total_casos desc;

-- top 3 estados em um ano especifico
select Estado, sum(Qtd_Casos) as total_casos
from suicidio 
where Ano = 2013
group by Estado
order by total_casos desc
limit 3;



