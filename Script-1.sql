select * from co2_emissions_pc;

select co2_pc, country from co2_emissions_pc;

select country,co2_pc from co2_emissions_pc where country="Brazil";

select country,co2_pc from co2_emissions_pc where co2_pc between 0.03 and 0.06 and country="Brazil";

select * from gdp_pc where gdp_pc IS NULL;

select * from child_mortality where tot_deaths  IS NULL;

select * from child_mortality where tot_deaths between 19 and 21;

select * from life_expectancy where ref_year between 2019 and 2023 and country = "Brazil";

select * from population where tot_pop > 200000000 and ref_year = 2023;

select * from co2_emissions_pc where country in ("Brazil","China","USA") and ref_year between 2019 and 2021;

select * from country where eight_regions in ("europe_east","europe_west") and wb4income = "Lower middle income";

select * from co2_emissions_pc where country in ("Brazil","China","USA") and ref_year between 2019 and 2021;

select * from country where eight_regions  in ("europe_east","europe_west") and wb4income = "Lower middle income";

select country, eight_regions, wb_regions from country where eight_regions like "%asia%";

select country, wb_regions from country where wb_regions like "%America%";

select country,ref_year,tot_pop from population where tot_pop > 1000000000 order by country,ref_year;

select country, min(ref_year) as primeiro_ano from population where tot_pop > 1000000000 group by country;

select country,tot_pop,min(ref_year) as primeiro_ano from population where tot_pop > 1000000000 group by country;

select * from gdp_pc where ref_year = 2009 order by gdp_pc;

select country,mean_usd from avg_income where ref_year = 2009 order by mean_usd; 

select country,mean_babies from fertility where ref_year = 2009 order by mean_babies desc;

select country,tot_deaths from child_mortality where ref_year = 2009 order by tot_deaths desc;

select country,mean_years from women_years_at_school where ref_year = 2009 order by mean_years;

select country,gdp_pc from gdp_pc where ref_year = 2009 order by gdp_pc limit 6;

select country,tot_years from life_expectancy where ref_year = 2009 order by tot_years limit 6;

select distinct wb4income from country where wb4income IS NOT NULL;

select distinct country from population order by country desc limit 5;

select gp.country,gp.gdp_pc,f.mean_babies  
from gdp_pc gp 
inner join fertility f on gp.country = f.country 
where gp.ref_year = 2019 and f.ref_year = 2019
order by gp.gdp_pc desc limit 10;

select gp.country,gp.gdp_pc,f.mean_babies,wyas.mean_years
from gdp_pc gp 
inner join fertility f on gp.country = f.country and gp.ref_year = f.ref_year
inner join women_years_at_school wyas on gp.country = wyas.country and gp.ref_year = wyas.ref_year
where gp.ref_year = 2019 
order by gdp_pc desc;

select cep.country,cep.co2_pc, c.wb_regions
from co2_emissions_pc cep 
inner join country c 
on cep.country = c.country
where cep.ref_year = 1970 
order by cep.co2_pc desc limit 5;

select cep.country,cep.co2_pc,c.wb_regions
from co2_emissions_pc cep, country c
where cep.ref_year = 1970 and cep.country = c.country
order by cep.co2_pc desc limit 5;

select country,tot_deaths,gdp_pc from child_mortality
natural join gdp_pc 
where child_mortality.ref_year = 2019 and gdp_pc.ref_year = 2019
order by child_mortality.tot_deaths desc limit 5;

select country,tot_deaths,mean_usd from child_mortality 
natural join avg_income 
where child_mortality.ref_year = 2019 
order by tot_deaths asc
limit 5;

select gp.country,gp.gdp_pc,f.mean_babies from gdp_pc gp
inner join fertility f 
on gp.country = f.country and gp.ref_year = f.ref_year
where gp.ref_year = 2019 and f.ref_year = 2019
order by gdp_pc desc limit 10;

select gp.country,gp.gdp_pc,f.mean_babies
from gdp_pc gp,fertility f 
where gp.country = f.country and gp.ref_year = 2019 and f.ref_year = 2019
order by gp.gdp_pc desc limit 10;

select country,gdp_pc,mean_babies
from gdp_pc
natural join fertility 
where ref_year = 2019
order by gdp_pc desc limit 10;

select gp.country,gp.gdp_pc,f.mean_babies,wyas.mean_years
from gdp_pc gp 
inner join fertility f on gp.country = f.country and gp.ref_year = f.ref_year
inner join women_years_at_school wyas on f.country = wyas.country and f.ref_year = wyas.ref_year
where gp.ref_year = 2019
order by gp.gdp_pc desc
limit 10;

select c.country,myas.mean_years
from country c
inner join men_years_at_school myas on c.country = myas.country
where c.four_regions = "asia" and myas.ref_year = 2009
order by myas.mean_years asc limit 5;

select c.country,c.wb_regions,c.wb3income,ai.mean_usd
from country c
inner join avg_income ai on c.country = ai.country
where ai.ref_year = 1985
order by ai.mean_usd desc limit 10;

select ai.ref_year,ai.mean_usd,gp.gdp_pc,p.tot_pop,cm.tot_deaths,f.mean_babies,le.tot_years
from avg_income ai 
inner join gdp_pc gp on ai.country = gp.country
inner join population p on p.country = gp.country
inner join child_mortality cm on cm.country = p.country
inner join fertility f on f.country = cm.country
inner join life_expectancy le on le.country = f.country
where f.country = "Brazil" and ai.ref_year = gp.ref_year and gp.ref_year = p.ref_year and p.ref_year = cm.ref_year and cm.ref_year = f.ref_year and f.ref_year = le.ref_year and ai.ref_year between 1900 and 2020 and ai.ref_year % 10 = 0
order by ai.ref_year;

select c.country,myas.mean_years from country c
inner join men_years_at_school myas on c.country = myas.country
where c.four_regions = "asia" and myas.ref_year = 2009
order by myas.mean_years limit 5;

select country,mean_years from country 
natural join men_years_at_school  
where four_regions = "asia" and ref_year = 2009
order by mean_years limit 5;

select ai.ref_year,ai.mean_usd,gp.gdp_pc,p.tot_pop,cm.tot_deaths,f.mean_babies,le.tot_years
from avg_income ai 
natural join gdp_pc gp
natural join population p
natural join child_mortality cm 
natural join fertility f 
natural join life_expectancy le 
where ai.country = "Brazil" and ai.ref_year between 1900 and 2020 and ai.ref_year % 10 = 0
order by ai.ref_year;

select p.country,p.tot_pop,f.mean_babies from population p 
inner join fertility f 
on p.country = f.country and p.ref_year = f.ref_year
where p.country in ("Fiji","Nauru","Palau","French Polynesia","Guam") and p.ref_year = 2018;

select f.country,p.tot_pop,f.mean_babies from fertility f 
left join population p 
on p.country = f.country and p.ref_year = f.ref_year
where f.country in ("Fiji","Nauru","Palau","French Polynesia","Guam") and f.ref_year = 2018;

select p.country,p.tot_pop,f.mean_babies from fertility f 
right join population p
on p.country = f.country and p.ref_year = f.ref_year
where p.country in ("Fiji","Nauru","Palau","French Polynesia","Guam") and p.ref_year = 2018;

select p.country,f.country,p.tot_pop,f.mean_babies 
from fertility f
full join population p on f.country = p.country and p.ref_year = f.ref_year
where (f.country in ("Fiji","Nauru","Palau","French Polynesia","Guam") and f.ref_year = 2018) or
	  (p.country in ("Fiji","Nauru","Palau","French Polynesia","Guam") and p.ref_year = 2018);

select cm.country,cm.tot_deaths,f.mean_babies
from child_mortality cm 
left join fertility f on cm.country = f.country and cm.ref_year = f.ref_year
where cm.country in ("Andorra","Liechtenstein","Malta","Monaco","San Marino","Holy See") and cm.ref_year = 2000
order by cm.tot_deaths desc;

select cm.country,cm.tot_deaths,f.mean_babies,p.tot_pop
from child_mortality cm 
left join fertility f on cm.country = f.country and cm.ref_year = f.ref_year
left join population p on cm.country = p.country and cm.ref_year = p.ref_year
where cm.country in ("Andorra","Liechtenstein","Malta","Monaco","San Marino","Holy See") and cm.ref_year = 2000
order by cm.tot_deaths desc;

select cm.country,cm.tot_deaths,f.mean_babies,p.tot_pop
from child_mortality cm 
inner join population p on cm.country = p.country and cm.ref_year = p.ref_year
left join fertility f on cm.country = f.country and cm.ref_year = f.ref_year
where cm.country in ("Andorra","Liechtenstein","Malta","Monaco","San Marino","Holy See") and cm.ref_year = 2000
order by cm.tot_deaths desc;

select cm.country,cm.tot_deaths,f.mean_babies
from fertility f 
right join child_mortality cm on f.country = cm.country and f.ref_year = cm.ref_year
where cm.country in ("Andorra","Liechtenstein","Malta","Monaco","San Marino","Holy See") and cm.ref_year = 2000
order by cm.tot_deaths desc;

select cm.country,f.country,cm.tot_deaths,f.mean_babies
from child_mortality cm 
full join fertility f on cm.country = f.country and cm.ref_year = f.ref_year
where (cm.country in ("Aruba","Cuba","Dominica","Martinique","Puerto Rico") and cm.ref_year = 2000) or
      (f.country  in ("Aruba","Cuba","Dominica","Martinique","Puerto Rico") and f.ref_year = 2000);

select myas.country,myas.mean_years,"male" as gender
from men_years_at_school myas 
where myas.country in ("Brazil","India","Russia","China","South Africa") and myas.ref_year = 2000
UNION 
select wyas.country,wyas.mean_years,"female" as gender
from women_years_at_school wyas 
where wyas.country in ("Brazil","India","Russia","China","South Africa") and wyas.ref_year = 2000
order by country,gender;

select cm.country from child_mortality cm
EXCEPT 
select f.country from fertility f;

select p.country from population p 
except
select cm.country from child_mortality cm;

select cm.country from child_mortality cm 
EXCEPT 
select p.country from population p;

select p.country from population p 
EXCEPT 
select c.country from country c;

select cep.country,cep.ref_year 
from co2_emissions_pc cep
where cep.country = "Brazil" and cep.ref_year >= 2000
EXCEPT 
select myas.country,myas.ref_year 
from men_years_at_school myas 
where myas.country = "Brazil" and myas.ref_year >= 2000;

select cep.country,cep.ref_year
from co2_emissions_pc cep 
where cep.country = "Brazil" and cep.ref_year >= 2000
intersect
select m.country,m.ref_year
from men_years_at_school m
where m.country = "Brazil" and m.ref_year >= 2000;

select ref_year,tot_deaths, 100 * tot_deaths / 1000 as porcentagem from child_mortality 
where ref_year between 1910 and 2020 and ref_year % 10 = 0 and country = "Brazil"
order by ref_year;

select cep.ref_year,cep.co2_pc 
from co2_emissions_pc cep 
where cep.country = "Portugal" and cep.ref_year between 1972 and 2016 and cep.ref_year % 4 = 0
order by cep.ref_year;

select round(avg(gp.gdp_pc),2) as media
from gdp_pc gp 
inner join country c on gp.country = c.country
where gp.ref_year = 2020 and c.four_regions = "americas";

select sum(ai.mean_usd) as soma, avg(ai.mean_usd) as media, max(ai.mean_usd) as maximo, min(ai.mean_usd) as minimo, count(ai.mean_usd) as contagem 
from avg_income ai
inner join country c on ai.country = c.country
where c.four_regions = "europe" and ai.ref_year = 2020;

select round(avg(cep.co2_pc),2) as media from co2_emissions_pc cep where cep.ref_year > 2005;

select f.country,round(avg(f.mean_babies),2) as media from fertility f group by f.country order by media desc limit 10;

select p.Date ,(p."Close" + p."Open")/2 as mean, (p."Close" - p."Open") as "range" 
from petrobras p
where p.Date between "2020-02-20" and "2020-03-20" and "range" > 0; 

select distinct wyas.country
from women_years_at_school wyas 
inner join men_years_at_school myas on wyas.country = myas.country and wyas.ref_year = myas.ref_year
inner join country c on wyas.country = c.country
where wyas.ref_year between 2001 and 2010 and c.four_regions = "africa" and myas.mean_years + 1 <= wyas.mean_years;

select (100*cm.tot_deaths)/1000 as porcentagem_deaths,cm.ref_year
from child_mortality cm 
where cm.country = "Brazil" and cm.ref_year between 1910 and 2020 and cm.ref_year % 10 = 0;

select min(le.tot_years) as minimo_le,round(avg(le.tot_years),2) as media_le,max(le.tot_years) as max_le
from life_expectancy le
inner join country c on le.country = c.country
where c.wb_regions = "Latin America & Caribbean" and le.ref_year = 1990;

select round(avg(gp.gdp_pc),2) as media_pib, round(avg(ai.mean_usd),2) as media_ai
from gdp_pc gp
inner join avg_income ai on gp.country = ai.country and gp.ref_year = ai.ref_year
where gp.ref_year = 2019;

select avg(myas.mean_years - wyas.mean_years) as diferenca_media
from men_years_at_school myas 
inner join women_years_at_school wyas on myas.country = wyas.country and myas.ref_year = wyas.ref_year
where myas.ref_year = 2000;

select gp.ref_year,round(avg(gp.gdp_pc),2) as pib_medio
from gdp_pc gp 
inner join country c on gp.country = c.country
where c.four_regions = "americas" and gp.ref_year in (2018,2019,2020,2021,2022)
group by gp.ref_year;

select c.four_regions,gp.ref_year,round(avg(gp.gdp_pc),2) as media_pib
from gdp_pc gp 
inner join country c on c.country = gp.country
where gp.ref_year in (2018,2019,2020,2021,2022)
group by c.four_regions,gp.ref_year;

select c.four_regions,gp.ref_year,round(avg(gp.gdp_pc),2) as media_pib
from gdp_pc gp 
inner join country c on gp.country = c.country
where gp.ref_year in (2018,2019,2020,2021,2022)
group by c.four_regions,gp.ref_year
having media_pib > 17000;

select c.four_regions,gp.ref_year,round(avg(gp.gdp_pc),2) as pib_medio
from gdp_pc gp 
inner join country c on gp.country = c.country
where gp.ref_year between 2018 and 2022
group by c.four_regions,gp.ref_year
having pib_medio between 17000 and 20000
order by c.four_regions,gp.ref_year;

select count(*) from women_years_at_school wyas;

select distinct country from women_years_at_school;
select count(distinct country) from women_years_at_school;

select count(distinct ref_year) from women_years_at_school;

select count(distinct wyas.ref_year) as anos_unicos,min(wyas.ref_year) as menor_ano,max(wyas.ref_year) as ano_recente from women_years_at_school wyas

select wyas.country,count(wyas.country) as total_linhas from women_years_at_school wyas group by wyas.country;

select wyas.country,count(wyas.country) as total_linhas from women_years_at_school wyas group by wyas.country having total_linhas>35;

select f.ref_year,round(avg(f.mean_babies),2) as media_babies from fertility f group by f.ref_year having f.ref_year > 1900;

select count(*) from women_years_at_school wyas where wyas.mean_years is null;

select ifnull(wyas.mean_years,count(wyas.mean_years)) from women_years_at_school wyas; 

select wyas.ref_year,count(*) as contagem_anual
from women_years_at_school wyas 
group by wyas.ref_year;

select c.wb3income,min(ai.mean_usd) as minimo,round(avg(ai.mean_usd),2) as media,max(ai.mean_usd) as maximo
from avg_income ai 
inner join country c on ai.country = c.country 
where ai.ref_year = 2020
group by c.wb3income
order by minimo desc,media desc,maximo desc;

select c.eight_regions,le.ref_year,round(avg(le.tot_years),2) as expectativa_media
from life_expectancy le 
inner join country c on le.country = c.country
where le.ref_year between 2019 and 2021
group by c.eight_regions,le.ref_year
order by c.eight_regions ,le.ref_year;

select c.wb_regions, round(sum(cep.co2_pc * p.tot_pop /1000000000),2) as emissao_total
from co2_emissions_pc cep 
inner join country c on cep.country = c.country
inner join population p on cep.country = p.country and cep.ref_year = p.ref_year
where cep.ref_year = 2022 
group by c.wb_regions
order by emissao_total desc;

select c.wb_regions,round(avg(cm.tot_deaths),2) as media_cm
from child_mortality cm 
inner join country c on cm.country = c.country
where cm.ref_year = 2010
group by c.wb_regions
having media_cm < 20
order by media_cm desc;

select le.ref_year,min(le.tot_years) as minimo,round(avg(le.tot_years),2) as media,max(le.tot_years) as maximo
from life_expectancy le 
inner join country c on le.country = c.country
where le.ref_year in (1990,2000,2010,2020) and le.ref_year % 10 = 0 and c.wb_regions = "Latin America & Caribbean"
group by le.ref_year
order by le.ref_year,minimo desc;

select c.wb4income,round(avg(gp.gdp_pc),2) as pib_medio,round(avg(ai.mean_usd),2) as renda_media
from gdp_pc gp 
inner join avg_income ai on gp.country = ai.country and gp.ref_year = ai.ref_year
inner join country c  on gp.country = c.country
where gp.ref_year = 2019
group by c.wb4income
order by pib_medio asc;

select c.wb4income,round(avg(myas.mean_years),2) as media_homem,round(avg(wyas.mean_years),2) as media_mulher,round(abs(avg(myas.mean_years) - avg(wyas.mean_years)),2) as diferenca
from men_years_at_school myas 
inner join women_years_at_school wyas on myas.country = wyas.country and myas.ref_year = wyas.ref_year
inner join country c on myas.country = c.country
where myas.ref_year = 2000
group by c.wb4income
order by diferenca;

select c.wb_regions,round(avg(myas.mean_years),2) as media_homem, round(avg(wyas.mean_years),2) as media_mulher, round(abs(avg(myas.mean_years - wyas.mean_years)),2) as diferenca
from men_years_at_school myas 
inner join women_years_at_school wyas on myas.country = wyas.country and myas.ref_year = wyas.ref_year
inner join country c on myas.country = c.country
where myas.ref_year = 2000
group by c.wb_regions
order by diferenca asc;

select * from life_expectancy le
where le.ref_year = 2000
order by le.tot_years asc
limit 1;

select * from life_expectancy le where le.ref_year = 2000 and le.tot_years = (select min(tot_years) from life_expectancy where ref_year = 2000);

select * from life_expectancy le where le.ref_year = 2000 and (le.tot_years = 
(select max(le2.tot_years) from life_expectancy le2 where le2.ref_year = 2000) or le.tot_years = 
(select min(le3.tot_years) from life_expectancy le3 where le3.ref_year = 2000));

select myas.country,myas.ref_year,myas.ref_year,"male" as gender from men_years_at_school myas where myas.ref_year > 2000
union
select wyas.country,wyas.ref_year,wyas.mean_years,"female" as gender from women_years_at_school wyas where wyas.ref_year > 2000;

select avg(myas.mean_years) as media
from men_years_at_school myas 
inner join country c on myas.country = c.country
where c.four_regions = "africa" and myas.ref_year between 2000 and 2009
union
select avg(wyas.mean_years) as media
from women_years_at_school wyas 
inner join country c on wyas.country = c.country
where c.four_regions = "africa" and wyas.ref_year between 2000 and 2009;

select tab1.country,tab1.gender,round(avg(tab1.mean_years),2) as media_mean_years FROM tab1
inner join country c on tab1.country = c.country
where tab1.ref_year between 2000 and 2009 and c.four_regions = "africa"
group by tab1.country,tab1.gender
order by tab1.gender,media_mean_years;

create view tab1 as select myas.country,myas.mean_years,myas.ref_year,"male" as gender
	from men_years_at_school myas
	union all
	select wyas.country,wyas.mean_years,wyas.ref_year,"female" as gender
	from women_years_at_school wyas;

select * from tab1;

select t.country,t.gender,round(avg(t.mean_years),2) as media from
	(select myas.country,myas.ref_year,myas.mean_years,"male" as gender
	from men_years_at_school myas
	where myas.ref_year between 2000 and 2009
	union all
	select wyas.country,wyas.ref_year,wyas.mean_years,"female" as gender
	from women_years_at_school wyas
	where wyas.ref_year between 2000 and 2009) as t
inner join country c on t.country = c.country
where c.four_regions = "africa" 
group by t.country,t.gender
order by t.gender,media;

select t.country,t.gender,round(avg(t.mean_years),2) as media from
	(select myas.country,myas.mean_years,myas.ref_year,"male" as gender
	from men_years_at_school myas 
	where myas.ref_year between 2000 and 2009
	union all
	select wyas.country,wyas.mean_years,wyas.ref_year,"female" as gender
	from women_years_at_school wyas 
	where wyas.ref_year between 2000 and 2009) as t
inner join country c on t.country = c.country
where c.four_regions = "africa"
group by t.country,t.gender 
order by t.gender,media;

select le.country,le.tot_years,c.four_regions from 
life_expectancy le 
inner join country c on c.country = le.country
where c.four_regions = "africa" and le.ref_year = 2000 and (le.tot_years = (select min(le2.tot_years) from life_expectancy le2 where le2.ref_year = 2000) or 
le.tot_years = (select max(le3.tot_years)from life_expectancy le3 where le3.ref_year = 2000));

select le.country,max(le.tot_years) from life_expectancy le
inner join country c on c.country = le.country
where c.four_regions = "africa" and le.ref_year = 2000
group by le.country limit 1;

select * from life_expectancy le where le.ref_year = 2000 and (le.tot_years = 
(select max(le2.tot_years) from life_expectancy le2 inner join country c on le2.country = c.country where le2.ref_year = 2000 and c.four_regions = "africa") 
or le.tot_years = (select min(le3.tot_years) from life_expectancy le3 inner join country c on c.country = le3.country where le3.ref_year = 2000 and c.four_regions = "africa"));

select * from life_expectancy le 
inner join country c on c.country = le.country
where le.ref_year = 2000 and c.four_regions = "africa"
order by le.tot_years desc;

select * from gdp_pc gp 
where gp.ref_year = 2010 and (gp.gdp_pc = (select max(gp2.gdp_pc) from gdp_pc gp2 inner join country c on c.country = gp2.country where gp2.ref_year = 2010 and c.four_regions = "americas") or
gp.gdp_pc = (select min(gp3.gdp_pc) from gdp_pc gp3 inner join country c on c.country = gp3.country where gp3.ref_year = 2010 and c.four_regions = "americas"));

select * from country where four_regions = "americas";

select t.country,t.gender,round(avg(t.mean_years),2) as media from
	(select myas.country,myas.ref_year,myas.mean_years,"male" as gender 
	from men_years_at_school myas 
	where myas.ref_year between 1999 and 2009
	union all
	select wyas.country,wyas.ref_year,wyas.mean_years,"female" as gender
	from women_years_at_school wyas 
	where wyas.ref_year between 1999 and 2009) as t
inner join country c on t.country = c.country
where c.four_regions = "europe"
group by t.country,t.gender 
order by t.gender,media;

select *
from life_expectancy le
where le.ref_year = 2000 and (le.tot_years = (select min(le2.tot_years) from life_expectancy le2 where le2.ref_year = 2000) or le.tot_years = (select max(le3.tot_years) from life_expectancy le3 where le3.ref_year = 2000))

-- maior e menor pib da africa no ano de 2008

select gp.country,gp.ref_year,gp.gdp_pc
from gdp_pc gp 
where gp.ref_year = 2008 and (gp.gdp_pc = (select min(gp2.gdp_pc) from gdp_pc gp2 inner join country c on c.country = gp2.country
									where gp2.ref_year = 2008 and c.four_regions = "africa") or
							  gp.gdp_pc = (select max(gp3.gdp_pc) from gdp_pc gp3 inner join country c on c.country = gp3.country 
									where gp3.ref_year = 2008 and c.four_regions = "africa"));

-- maior e menor mortalidade infantil na asia no ano 2011

select cm.country,cm.ref_year,cm.tot_deaths
from child_mortality cm 
where cm.ref_year = 2011 and (cm.tot_deaths = (select min(cm2.tot_deaths) from child_mortality cm2 inner join country c
											  on c.country = cm2.country where cm2.ref_year = 2011 and c.four_regions = "asia") or
							 cm.tot_deaths = (select max(cm3.tot_deaths) from child_mortality cm3 inner join country c
							 				  on c.country = cm3.country where cm3.ref_year = 2011 and c.four_regions = "asia"));

-- maior e menor renda da asia em 1995

select ai.country,ai.ref_year,ai.mean_usd
from avg_income ai 
where ai.ref_year = 1995 and (ai.mean_usd = (select min(ai2.mean_usd) from avg_income ai2 inner join country c on ai2.country = c.country
											where c.four_regions = "asia" and ai2.ref_year = 1995) or 
							 ai.mean_usd = (select max(ai3.mean_usd) from avg_income ai3 inner join country c on ai3.country = c.country
							 				where c.four_regions = "asia" and ai3.ref_year = 1995));

-- maior e menor emissor de co2 da europa em 2015

select cep.country,cep.ref_year,cep.co2_pc
from co2_emissions_pc cep 
where cep.ref_year = 2015 and (cep.co2_pc = (select min(cep2.co2_pc) from co2_emissions_pc cep2 inner join country c on c.country = cep2.country
											 where cep2.ref_year = 2015 and c.four_regions = "europe") or 
							   cep.co2_pc = (select max(cep3.co2_pc) from co2_emissions_pc cep3 inner join country c on c.country = cep3.country 
							   				 where cep3.ref_year = 2015 and c.four_regions = "europe"));

select * from co2_emissions_pc cep where cep.ref_year = 2000 and exists
(select * from co2_emissions_pc cep2 where cep2.country = "USA" and cep2.ref_year = 2000 and cep.co2_pc > cep2.co2_pc);

select * from co2_emissions_pc cep where cep.ref_year = 2000 and exists
(select * from co2_emissions_pc cep2 where cep2.country = "USA" and cep2.ref_year = 2000 and cep2.co2_pc < cep.co2_pc );

select * from co2_emissions_pc cep where cep.ref_year = 2000 and exists 
(select * from co2_emissions_pc cep2 where cep2.country = "USA" and cep2.ref_year = 2000 and cep2.co2_pc < cep.co2_pc);

-- calcule qual é o país da africa com o maior pib per capita em 2019
select gp.country,gp.gdp_pc 
from gdp_pc gp 
where gp.ref_year = 2019 and gp.gdp_pc = (select max(gp2.gdp_pc) from gdp_pc gp2 inner join country c 
										  on c.country = gp2.country where gp2.ref_year = 2019 and c.four_regions = "africa");

--  Calcule novamente a expectativa de vida mínima, média e máxima dos países da América Latina e do Caribe em 1990 
-- bem como identifique o país com a menor expectativa de vida nessa região no mesmo ano.
select le.country
from life_expectancy le 
inner join country c 
on c.country = le.country
where le.ref_year = 1990 and c.wb_regions = "Latin America & Caribbean" and le.tot_years = (select min(le2.tot_years) 
from life_expectancy le2 inner join country c on c.country = le2.country 
where le2.ref_year = 1990 and c.wb_regions = "Latin America & Caribbean");

-- Repita a consulta para 2010, incluindo também o valor de tot_years. 
-- Indique se o país com a menor expectativa de vida permanece o mesmo. 
-- Além disso, verifique se há alguma explicação para uma queda tão acentuada na expectativa de vida.
select le.country,le.tot_years
from life_expectancy le 
inner join country c on c.country = le.country 
where le.ref_year = 2010 and c.wb_regions = "Latin America & Caribbean" and le.tot_years = (select min(le2.tot_years) from life_expectancy le2 inner join country c on c.country = le2.country where c.wb_regions = "Latin America & Caribbean" and le2.ref_year = 2010);


select tab.wb_regions,round(avg(tab.mean_years),2) as media_mean_years from
	(select m.country,m.ref_year,m.mean_years,"male" as gender,c.wb_regions from men_years_at_school m
	inner join country c on c.country = m.country
	where m.ref_year = 2000
	union all
	select w.country,w.ref_year,w.mean_years,"female" as gender,c.wb_regions from women_years_at_school w
	inner join country c on c.country = w.country
	where w.ref_year = 2000) as tab
group by tab.wb_regions
order by media_mean_years desc;

-- Liste o país com a menor renda média per capita diária da Europa em 2020. 
-- Use a tabela avg_income e o campo four_regions da tabela country igual a europe.

select ai.country,ai.mean_usd
from avg_income ai
inner join country c on c.country = ai.country
where ai.ref_year = 2020 and c.four_regions = "europe" and ai.mean_usd = (select min(ai2.mean_usd) from avg_income ai2 inner join country c on c.country = ai2.country where c.four_regions = "europe" and ai2.ref_year = 2020)

select c.country
from country c 
where c.wb_regions = "Latin America & Caribbean"

select le.country,le.tot_years
from life_expectancy le 
inner join country c on c.country = le.country 
where le.ref_year = 1990 and c.wb_regions = "Latin America & Caribbean" and le.tot_years = 
(select min(le2.tot_years) from life_expectancy le2 inner join country c on c.country = le2.country where c.wb_regions = "Latin America & Caribbean" and le2.ref_year = 1990
or le.tot_years = (select max(le3.tot_years) from life_expectancy le3 inner join country c on c.country = le3.country where c.wb_regions = "Latin America & Caribbean" and le2.ref_year = 1990)
);

select c.wb_regions,le.tot_years
from life_expectancy le 
inner join country c on c.country = le.country
where le.ref_year = 2000 and (le.tot_years = (select min(le2.tot_years) from life_expectancy le2 inner join country c on c.country = le2.country where le2.ref_year = 2000) 
                           or le.tot_years = (select max(le3.tot_years) from life_expectancy le3 inner join country c on c.country = le3.country where le3.ref_year = 2000));

select tab.wb_regions,min(tab.tot_years) as minimo,max(tab.tot_years) as maximo from
	(select c.wb_regions,le.tot_years
	from life_expectancy le 
	inner join country c on c.country = le.country
	where le.ref_year = 2000) as tab
group by tab.wb_regions
order by maximo desc;

select c.wb_regions,min(le.tot_years) as minimo,max(le.tot_years) as maximo
from life_expectancy le 
inner join country c on c.country = le.country
where le.ref_year = 2000
group by c.wb_regions
order by maximo desc;

select * from men_years_at_school;

insert into men_years_at_school(country,ref_year,mean_years) values 
	   ("Brazil",2010,6.7),
	   ("Brazil",2011,6.8),
	   ("Brazil",2012,7.0),
	   ("Brazil",2013,7.1),
	   ("Brazil",2014,7.2),
	   ("Brazil",2015,7.3),
	   ("Brazil",2016,7.5),
	   ("Brazil",2017,7.6),
	   ("Brazil",2018,7.8),
	   ("Brazil",2019,NULL),
	   ("Brazil",2020,NULL),
	   ("Argentina",2010,10.5),
	   ("Argentina",2011,10.6),
	   ("Argentina",2012,10.6),
	   ("Argentina",2013,10.8),
	   ("Argentina",2014,10.7),
	   ("Argentina",2015,10.7),
	   ("Argentina",2016,10.8),
	   ("Argentina",2017,NULL),
	   ("Argentina",2018,10.9),
	   ("Argentina",2019,NULL),
	   ("Argentina",2020,10.9);

select * from men_years_at_school where country = "Brazil" or country = "Argentina" order by country asc;

update men_years_at_school 
set mean_years = 7.8
where country = "Brazil" and ref_year = 2019 or ref_year = 2020;

select * from men_years_at_school where ref_year between 2009 and 2020 and country = "Brazil";

update men_years_at_school 
set	mean_years = (select avg(mean_years) from men_years_at_school where country = "Argentina" and ref_year between 2011 and 2020)
where mean_years IS NULL and country = "Argentina" and ref_year between 2011 and 2020;

select * from men_years_at_school where ref_year between 2010 and 2024;

delete
from men_years_at_school 
where ref_year >= 2019 and country = "Brazil";

select * from men_years_at_school where country = "Brazil";

delete
from men_years_at_school 
where ref_year between 2010 and 2018 and country = "Brazil";

select * from men_years_at_school where country = "Brazil" and (ref_year between 2010 and 2018);

select * from men_years_at_school where country = "Brazil" and ref_year = 2009;

update men_years_at_school 
set mean_years = (select avg(mean_years) from men_years_at_school)
where country = "Brazil" and ref_year = 2000;

begin transaction;

delete 
from men_years_at_school
where ref_year between 2009 and 2020 and country = "Brazil";

select * from men_years_at_school where country = "Brazil" and ref_year between 2000 and 2009;

commit;

rollback;

insert into men_years_at_school (country,ref_year,mean_years)
values ("Brazil",2009,7.8);


begin transaction;

delete
from men_years_at_school 
where country = "Argentina" and ref_year between 2000 and 2008;

select * from men_years_at_school where country = "Argentina" and ref_year between 2000 and 2008;

commit;

create table "uf" (
	"cd_uf" CHAR(2) NOT NULL PRIMARY KEY,
	"descr_uf" varchar(50) not null);

select * from uf;

create table "cidade" (
	"cd_ibge" numeric(8) not null primary key,
	"descr_municipio" varchar(100) not null,
	"cd_uf" char(2) not null, 
	foreign key ("cd_uf") references "uf"("cd_uf")
)
	
select * from cidade;

alter table cidade
add column "nr_habitantes" integer null;

alter table cidade 
add column "area_km2" numeric(15,2) null;

select * from cidade;

create table "relatorio_focus"(
	"ipca" numeric(10,2) not null,
	"pib" numeric(10,2) not null,
	"dolar" numeric(10,2) not null,
	"ref_date" date primary key not null
);

insert into relatorio_focus (ipca,pib,dolar,ref_date) values 
(3.98,2.09,5.15,"2024-06-21"),
(4.00,2.09,5.20,"2024-06-28"),
(4.02,2.10,5.20,"2024-07-05"),
(4.00,2.11,5.22,"2024-07-12"),
(4.05,2.15,5.30,"2024-07-19");

select * from relatorio_focus;

alter table relatorio_focus 
add column "selic" numeric(10,2) null;

update relatorio_focus 
set selic = 10.50
where ref_date between "2024-06-21" and "2024-07-19";

alter table relatorio_focus 
alter column selic numeric(10,2) not null;

drop table relatorio_focus;

create table "relatorio_focus"(
	"ref_date" date primary key not null,
	"ipca" numeric(10,2) not null,
	"pib" numeric(10,2) not null,
	"dolar" numeric(10,2) not null,
	"selic" numeric(10,2) not null
);

insert into relatorio_focus (ref_date,ipca,pib,dolar,selic) values 
("2024-06-21",3.98,2.09,5.15,10.50),
("2024-06-28",4.00,2.09,5.20,10.50),
("2024-07-05",4.02,2.10,5.20,10.50),
("2024-07-12",4.00,2.11,5.22,10.50),
("2024-07-19",4.05,2.15,5.30,10.50);

select * from relatorio_focus;

create table "temp"(
	"ref_date" date primary key not null,
	"ipca" numeric(10,2) not null,
	"pib" numeric(10,2) not null,
	"dolar" numeric(10,2) not null,
	"selic" numeric(10,2) not null
);

select * from temp;

insert into temp select * from relatorio_focus;

alter table relatorio_focus 
rename to "focus_report";

drop table focus_report;

