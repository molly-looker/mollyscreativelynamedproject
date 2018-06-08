view: orders {
  sql_table_name: demo_db.orders ;;


  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;

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

 dimension: year1 {
   type:  string
  sql: EXTRACT(year from ${TABLE}.created_at)  ;;
  html:  {{ orders.year1._value }} {{ orders.id._value }} ;;
 }


  parameter: label {
    type: string
    default_value: "2018"
  }

  dimension: quarter {
    label: "Quarter {% parameter label %}"
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: customfilter {
    type: yesno
    sql: (${TABLE}.id = 1 or (${TABLE}.id = 2 and ${TABLE}.status = 'cancelled') or ${TABLE}.id = 3)  ;;
  }


  dimension: status {
    label: "Status"
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: is_complete{
    type: yesno
    sql: ${status} = 'complete' ;;
  }

  dimension: user_id {
    type: number
    hidden: yes
    sql: ${TABLE}.user_id ;;
    drill_fields: [users.first_name, users.last_name]
  }

  measure: count {
    type: count
    drill_fields: [id, users.name, order_items.count]
  }

  measure: hardcode {
    type: number
    sql:  '0.03' ;;
  }

  set: my_first_set {
    fields: [
      user_id,
      is_complete,
      hardcode
    ]
  }


}
