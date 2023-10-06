--Check for uniques customer_ID
SELECT count(distinct(customer_id)) AS 'uniques customer_ID'
FROM [dbo].['customer_shopping_data II$'];



--Check for Average customer age
SELECT avg(age) AS 'Average customer age' 
FROM [dbo].['customer_shopping_data II$'];



--Male vs Female customer percentage
SELECT Gender, COUNT(*) AS Total,
    (COUNT(*) * 100.0) / (SELECT COUNT(*) FROM [dbo].['customer_shopping_data II$']) AS Percentage_of_total
FROM [dbo].['customer_shopping_data II$']
GROUP BY Gender;



--all payment method
SELECT distinct payment_method
FROM [dbo].['customer_shopping_data II$']



--shopping mall (order by revenue)
SELECT shopping_mall, sum(price) As revenue
FROM [dbo].['customer_shopping_data II$']
group by shopping_mall
order by revenue desc;



--revenue by month
SELECT Datename(month, invoice_date) Month_name, sum(price) As revenue
FROM [dbo].['customer_shopping_data II$']
group by Datename(month, invoice_date)
order by revenue desc;


--Ranking product category by revenue
SELECT product_category, sum(price) As revenue
FROM [dbo].['customer_shopping_data II$']
group by product_category
order by revenue desc;


--/See the average price spend value on each payment method

--alter the datatype to decimal (so now i can execute the avg function)
Alter table [dbo].['customer_shopping_data II$']
Alter column price decimal

SELECT payment_method, avg(price) as avg_spend_value
FROM [dbo].['customer_shopping_data II$']
group by payment_method
order by avg_spend_value desc ;


