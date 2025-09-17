Create database Setembro_Amarelo;

-- ALL 
select*from suicidio_10_anos;

-- Total de casos por ano
select Ano, sum(Qtd_Casos) as total_casos
from suicidio
group by Ano
order by Ano;

-- Distribuicao por sexo
select Sexo, Sum(Qtd_casos) as total_casos
from suicidio
group by Sexo
order by total_casos desc;

-- distribuicao por faixa etaria
select faixa_etaria, Sum(Qtd_Casos) as total_casos
from suicidio
group by faixa_etaria
order by total_casos desc;

-- ranking de estado (2013 a 2023(
select estado, sum(Qtd_Casos) as total_casos
from suicidio
group by estado
order by total_casos desc
limit 5;

-- crescimento percentual ano a ano 
select ano,
		sum(qtd_casos) as total_casos,
        round(
			(sum(qtd_casos) - lag(sum(qtd_casos)) over (Order by ano))
            / lag(sum(qtd_casos)) over (order by ano) * 100, 2
		) as variacao_percentual
	from suicidio
    group by ano
    order by ano;

-- media movel de 3 aos
select ano,
		sum(qtd_casos) as total_casos,
        round(avg(sum(qtd_casos)) over (
			order by ano rows between 2 preceding and current row
		), 2) as media_movel_3anos
	from suicidio
    group by ano
    order by ano;

-- top 3 aos com mais casos
select ano, sum(qtd_casos) as total_casos
from suicidio
group by ano
order by total_casos desc
limit 3;

-- top 3 estados em um ano especifico
select estado, sum(qtd_casos) as total_casos
from suicidio
where ano = 2014
group by estado
order by total_casos desc
limit 3;











