select order_items.product_id as  PRODUTO, sum(order_items.price) as SOMA_PRODUTOS
FROM `shop.order_items` as order_items group by order_items.product_id;  