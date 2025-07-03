-- Prova Final do Curso SQL

-- Questão 1 - PIB Per Capita da Suiça em 2020
select gp.country, gp.ref_year, gp.gdp_pc
from gdp_pc gp 
where gp.ref_year = 2020 and gp.country = "Switzerland";

-- Questão 2 - emissão média per capita de co2 entre 2008 e 2010 dos países da america latina e caribe
select cep.ref_year,round(avg(cep.co2_pc),2) as media_co2
from co2_emissions_pc cep 
inner join country c on cep.country = c.country
where cep.ref_year between 2008 and 2010 and c.wb_regions = "Latin America & Caribbean"
group by cep.ref_year
order by cep.ref_year;

-- Questão 5 - encontrar os valores de fechamento minimo e máximo das ações da petrobras entre 15 de setembro de 2008 e 31 de dezembro
-- de 2009 e as datas em que os valores foram registrados.
select p.Date,p.Close
from petrobras p
where p."Date" between "2008-09-11" and "2009-12-31" and (p."Close" = (select min(p2."Close") from petrobras p2 where p2."Date" between "2008-09-11" and "2009-12-31") or 
														 (p."Close" = (select max(p3."Close") from petrobras p3 where p3."Date" between "2008-09-11" and "2009-12-31")));

-- Questão 7 - encontrar o país com a maior expectativa de vida em 1975 de cada região (wb_regions)
select c.wb_regions,le.country,max(le.tot_years) as maximo
from life_expectancy le 
inner join country c on c.country = le.country 
where le.ref_year = 1975
group by c.wb_regions
order by maximo desc;

-- Questão 8 - média do pib per capita e a média de mortalidade infantil das regiões no ano de 2020, a ordenação deve ser feita pela média de mortes.
select c.wb_regions,round(avg(cm.tot_deaths),2) as media_mortality,round(avg(gp.gdp_pc),2) as media_pib
from child_mortality cm 
inner join gdp_pc gp on cm.country = gp.country and cm.ref_year = gp.ref_year
inner join country c on cm.country = c.country
where cm.ref_year = 2020
group by c.wb_regions
order by media_mortality;

-- Questão 9 -- Selecionar o país com a menor taxa de natalidade de cada uma das 3 classificações de renda (wb3income) em 2018.
-- Order By taxa_natalidade asc
select c.wb3income,f.country,min(f.mean_babies) as minimo
from fertility f 
inner join country c on c.country = f.country
where f.ref_year = 2018
group by c.wb3income
order by minimo;

-- Questão 10 - Liste os países e seus respectivos pib per capita que apresentam a maior e a menor renda média por habitante em 2020
-- usar UNION.

select gp.country,gp.ref_year,gp.gdp_pc,ai.mean_usd
from gdp_pc gp 
inner join avg_income ai on gp.country = ai.country and gp.ref_year = ai.ref_year
where gp.ref_year = 2020 and (ai.mean_usd = (select min(ai2.mean_usd) from avg_income ai2 inner join gdp_pc gp2 on gp2.country = ai2.country and gp2.ref_year = ai2.ref_year where ai2.ref_year = 2020) or 
							  ai.mean_usd = (select max(ai3.mean_usd) from avg_income ai3 inner join gdp_pc gp3 on gp3.country = ai3.country and ai3.ref_year = gp3.ref_year where ai3.ref_year = 2020))
