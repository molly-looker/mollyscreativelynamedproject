view: user_data {
  sql_table_name: demo_db.user_data ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: max_num_orders {
    type: number
    sql: ${TABLE}.max_num_orders ;;
  }

  dimension: total_num_orders {
    type: number
    sql: ${TABLE}.total_num_orders ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
    drill_fields: [users.first_name, users.last_name]
  }

  measure: count {
    type: count
    drill_fields: [id, users.first_name, users.last_name, users.id]
  }

  measure: average_max {
    label: "Average Max Orders"
    description: "Average Max Orders per User"
    type:  average
    sql:${TABLE}.max_num_orders ;;
  }
}
