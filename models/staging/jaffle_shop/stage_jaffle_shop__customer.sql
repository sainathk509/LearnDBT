select
        id as customer_id,
        first_name,
        last_name

    from {{source('jaffle_shop','customers')}}
    --raw.jaffle_shop.customers


      /* To fix this, change the name of one of these resources:
  - source.jaffle_shop.jaffle_shop.customers (models/staging/jaffle_shop/_jaffle_shop__sources.yml)
  - source.jaffle_shop.jaffle_shop.customers (models/staging/jaffle_shop/src_jaffle_shop.yml) */ 
  