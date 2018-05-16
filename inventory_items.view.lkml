view: inventory_items {
  sql_table_name: demo_db.inventory_items ;;

  dimension: id {primary_key: yes  type: number   sql: ${TABLE}.id ;;
  }

  dimension: product_id {
    type:  number
    hidden:  yes
    sql: ${TABLE}.product_id ;;
  }
  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
    value_format_name: usd
  }

  dimension: cost_tier {
    type: tier
    tiers: [0, 10, 30, 50, 80, 100]
    style: relational
    sql: ${cost} ;;
    value_format_name: usd
    drill_fields: [product_id, cost]
  }


  dimension: expensive {
    label: "Cash Money"
    description: "How much will your wallet hurt after this purchase?"
    type:  string
    case: {
      when: {
        sql: ${TABLE}.cost>=100;;
        label:"Ouch"
        }

      when: {
        sql: ${TABLE}.cost<100 and ${TABLE}.cost>=50 ;;
        label: "No Drinks this Week"
      }
      else: "I can haz all the things"
        }
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }


  dimension_group: sold {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.sold_at ;;
  }


  dimension: d1 {
    type: string
    sql: 'd1' ;;
  }

  dimension: d2 {
    type: string
    sql: ${d1} ;;
    html: {% if value == "d1" %} ${expensive._value} {% else %} ${cost._value} {% endif %};;
}


  measure: count {
    type: count
    drill_fields: [products.item_name]
  }


  measure: count_CK {
    type: count
    filters: {
      field: products.brand
      value: "Calvin Klein Jeans"
  }
    drill_fields: [products.product_id, products.item_name]
}


  set: details {
    fields: [id, product_id]
  }
}
