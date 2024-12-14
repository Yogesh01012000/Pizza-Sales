-- analyse the cumulative revenue generated over time. 

select order_date,
sum(revenue) over(order by order_date) as cum_revenue
from
(SELECT 
    orders.order_date,
    SUM(orders_details.quantity * pizzas.price) AS revenue
FROM
    orders_details
        JOIN
    pizzas ON orders_details.pizza_id = pizzas.pizza_id
        JOIN
    orders ON orders.order_id = orders_details.order_id
GROUP BY orders.order_date) as sales ;

