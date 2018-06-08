view: user_facts {

  derived_table: {
    sql: select
          o.user_id,
          count(o.id) as total_number_of_orders,
          min(o.created_at) as first_order,
          max(o.created_at) as last_order,
          datediff(now(),min(o.created_at)) as days_since_first_order,
          case when count(o.id)>1 then 'yes' else 'no' end as repeat_customer,
          count(o.id)/12 as avg_orders_per_month
          from orders o
          GROUP BY o.user_id
   ;;

    sql_trigger_value: SELECT NOW();;
    indexes: ["user_id"]
       }


    dimension: user_id {
      description: "User ID"
      type:  number
      sql:  ${user_id} ;;
    }

    dimension: total_number_of_orders {
      description: "Total Orders"
      type:  number
      sql:  ${total_number_of_orders} ;;
    }


    dimension: first_order {
     description: "First Order Date"
      type:  date
      sql:  ${first_order} ;;
    }

    dimension: last_order {
     description: "Last Order Date"
     type:  date
     sql:  ${last_order} ;;
    }

    dimension: day_since_first_order {
      description: "Since First Order"
      type:  number
      sql:  ${day_since_first_order} ;;
    }

    dimension: repeat_customer {
     description: "Repeat"
      type:  yesno
     sql:  ${repeat_customer} ;;
    }

    dimension: avg_orders_per_month {
      type:  number
      sql:  ${avg_orders_per_month} ;;
    }


}
