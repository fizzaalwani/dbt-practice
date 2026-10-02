with sales as (
    select sales_id,
    product_sk,
    customer_sk,
    gross_amount
    from {{ ref("bronze_sales")}}
),
product as (
    select product_sk,
    category
    from {{ ref("bronze_product")}}
),
customer as (
    select customer_sk,
    gender 
    from 
    {{ ref("bronze_customer")}}
),
joined_query as (
select 
    sales.sales_id , 
    sales.product_sk, 
    sales.customer_sk,
    sales.gross_amount,
    product.category, 
    customer.gender
from sales
inner join product
    on sales.product_sk = product.product_sk
inner join customer
    on sales.customer_sk = customer.customer_sk
)

select gender, category , sum(gross_amount) as amount
from joined_query group by gender , category 
order by category