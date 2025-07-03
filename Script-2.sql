/*Questão 1*/
select country,ref_year from co2_emissions_pc where co2_pc = 0.2;

/*Questão 2*/
select four_regions,eight_regions,wb4income from country where country="Brazil";

/*Questão 3*/
select country from country where wb3income="Middle income";

/*Questão 4*/
select country,gdp_pc  from gdp_pc gp where ref_year=2017;

/*Questão 5*/
select country,ref_year from life_expectancy where tot_years=36.5;

/*Questão 6*/
select Close from petrobras where Date="2022-12-08";

/*Questão 7*/
select country from gdp_pc where gdp_pc<400;

/*Questão 8*/
select country from life_expectancy where tot_years>94;

/*Questão 9*/
select Close, Adj_Close, Date from petrobras where Close<>Adj_Close;

