SELECT customers.customer_state, count(orders.order_id) as total
FROM `shop.orders` as orders 
INNER JOIN `shop.customers` as customers ON customers.customer_id = orders.customer_id
group by customers.customer_state
