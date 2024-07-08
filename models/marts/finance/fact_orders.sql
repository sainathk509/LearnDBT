with orders as  (
    select * from {{ ref ('stage_jaffle_shop__orders') }} 
),

payments as (
    select * from {{ ref ('stage_stripe__payments' )}}
),
order_payments as (
    select
        orders.order_id,
        sum (case when orders.status = 'completed' then payments.amount end) as amount

    from orders join payments
    group by 1
),

 final as (

    select
        orders.order_id,
        orders.customer_id,
        orders.order_date,
        coalesce (order_payments.amount, 0) as amount

    from orders
    left join order_payments on orders.order_id=order_payments.order_id
)

select * from final