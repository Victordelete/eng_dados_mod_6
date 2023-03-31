{{ config(materialized='table') }}

SELECT 
CASE 
    WHEN customers.customer_state IN ('SP', 'RJ', 'MG', 'ES') THEN 'Sudeste'
    WHEN customers.customer_state IN ('RS', 'ES', 'PR') THEN 'Sul'
    WHEN customers.customer_state IN ('MT', 'MS', 'GO', 'DF') THEN 'Centro-Oeste'
    WHEN customers.customer_state IN ('CE', 'PI', 'MA', 'BA', 'AL', 'PE', 'PB', 'RN') THEN 'Nordeste'
    WHEN customers.customer_state IN ('RR', 'AP', 'PA', 'AM', 'AC', 'RO', 'TO') THEN 'Norte'
    ELSE 'SEM REGIAO'
END AS QUANTIDADE_REGIAO,

count(customers.customer_id) as TOTAL
FROM `shop.customers` as customers 
group by QUANTIDADE_REGIAO
order by QUANTIDADE_REGIAO