select * from pizza_sales

//1. Total pizza_order

select SUM(total_price) as TOTAL_PIZZA_ORDER
FROM pizza_sales

//2. Average Order_Value

select AVG(total_price) as AVG_ORDER_VALUE
FROM pizza_sales

//3. Total pizza_sold

select sum(quantity) as TOTAL_PIZZA_SOLD
FROM pizza_sales

//4. Total_Orders

select count(distinct order_id) as TOTAL_ORDERS 
FROM pizza_sales 


//5. Average Pizzas Per_Order

select cast(cast(sum(quantity) as decimal(10,2)) / 
cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2)) 
as AVG_PIZZAS_PER_ORDER 
FROM pizza_sales 


// DAILY TREND FOR_ORDERS

select datename(DW, order_date) AS ORDER_DAY, COUNT(DISTINCT order_id) AS NUM_ORDER
FROM pizza_sales 
group by datename(DW, order_date)


// MONTHLY_ORDER

select datename(MONTH, order_date) AS ORDER_MONTH, COUNT(DISTINCT order_id) AS NUM_ORDER
FROM pizza_sales 
group by datename(MONTH, order_date)


// % _of sales by_pizza_category

select pizza_category, cast(sum(total_price) as decimal(10,2)) as total_revenue,
cast(sum(total_price) * 100 / (select sum(total_price) from pizza_sales) as decimal(10,2)) as PER_PIZZA_CATEGORY
FROM pizza_sales
GROUP BY pizza_category

// % _of sales by_pizza_size

select pizza_size, cast(sum(total_price) as decimal(10,2)) as total_revenue,
cast(sum(total_price) * 100 / (select sum(total_price) from pizza_sales) as decimal(10,2)) as PER_PIZZA_SIZE 
FROM pizza_sales
GROUP BY pizza_size
order by pizza_size

// Total pizza sold by_pizza category

select pizza_category, SUM(quantity) as total_quantity_sold 
from pizza_sales
where month(order_date) = 2
group by pizza_category
order by  total_quantity_sold desc


SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
WHERE MONTH(order_date) = 2
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC


// Top 5 Pizzas by Revenue

select * from pizza_sales

select top 5 pizza_name, sum(total_price) as total_revenue 
from pizza_sales
group by pizza_name
order by total_revenue desc


//H. Bottom 5 Pizzas by Revenue

select top 5 pizza_name, sum(total_price) as total_revenue 
from pizza_sales
group by pizza_name
order by total_revenue asc


//I. Top 5 Pizzas by Quantity

select * from pizza_sales

select top 5 pizza_name, SUM(quantity) as total_pizza_sold 
from pizza_sales
group by pizza_name
order by total_pizza_sold desc 

//J. Bottom 5 Pizzas by Quantity

select top 5 pizza_name, SUM(quantity) as total_pizza_sold 
from pizza_sales
group by pizza_name
order by total_pizza_sold asc 

//K. Top 5 Pizzas by Total Orders

select top 5 pizza_name, COUNT(distinct order_id) as total_orders
from pizza_sales
group by pizza_name
order by total_orders desc


//L. Bottom 5 Pizzas by Total Orders

select top 5 pizza_name, COUNT(distinct order_id) as total_orders
from pizza_sales
group by pizza_name
order by total_orders asc










 























