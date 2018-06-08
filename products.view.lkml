view: products {
  sql_table_name: demo_db.products ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: id2 { type: number
    sql: ${TABLE}.id ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: category2 {
    sql: ${TABLE}.category ;;
    html:
      {{ value }}
      [<a href="inventory_items?fields=inventory_items.details*&f[products.category2]={{ value }}">Photos</a>] ;;

    }

    dimension: department {
      type: string
      sql: ${TABLE}.department ;;
    }

    dimension: item_name {
      type: string
      sql: ${TABLE}.item_name ;;
    }

    dimension: rank {
      type: number
      sql: ${TABLE}.rank ;;
    }

    dimension: retail_price {
      type: number
      sql: ${TABLE}.retail_price ;;
    }

    dimension: sku {
      type: string
      sql: ${TABLE}.sku ;;
    }

    measure: count {
      type: count
      drill_fields: [id, item_name]
    }


    set: detail {
      fields: [department
        ,rank
        ,sku
        ,inventory_items.product_id]
    }
  }
