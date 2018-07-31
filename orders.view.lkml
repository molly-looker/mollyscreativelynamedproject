view: orders {
  sql_table_name: demo_db.orders ;;

  dimension: id {
    #primary_key: yes
    type: number
    sql: ${TABLE}.id ;;

  }

  dimension: fakeshiz {
  type: number
  sql: 1 ;;
 }
 
  dimension: fakeshiz2 {
	type: number
	sql: 2 ;;
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


  parameter: testparam {
    type: unquoted
    suggest_explore: users
    suggest_dimension: users.gender
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
    #hidden: yes
    sql: ${TABLE}.user_id ;;
    drill_fields: [users.first_name, users.last_name]
  }

  measure: count {
    type: count
    drill_fields: [id, users.name, order_items.count]
  }

  measure: count2 {
    type: count
    drill_fields: [my_first_set*]
    html:
    <div>
    <p style="font-size: 14px;font-weight:600"><a style="color: black" href= {{ value }} target="new" >{{ rendered_value }}</a></p>
    </div>
    ;;
  }

  measure: count_with_0 {
    type: number
    #value_format: "#"
    # drill_fields: [id, streams.id, encounters.id]
    sql: COALESCE(${count}, 0);;
  }

  measure: hardcode {
    type: number
    sql:  '0.03' ;;
  }

  measure: sum {
    type:  sum
  }

  set: my_first_set {
    fields: [
      user_id,
      is_complete,
      hardcode
    ]
  }


}
