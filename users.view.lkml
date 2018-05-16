view: users {
  sql_table_name: demo_db.users ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: age_tier {
    label: "Age Groupings"
    description: "Ages by Tier"
    type: tier
    sql:  ${TABLE}.age ;;
    tiers: [10, 50, 100]
    style: integer
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      day_of_week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }


  dimension: first_day_of_week {
    type: yesno
    sql: ${created_day_of_week}='Monday' ;;
  }
  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: name {
    label: "Full Name"
    description: "First and Last Name"
    type: string
    sql: CONCAT(${TABLE}.first_name ||" " || ${TABLE}.last_name);;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: state {
    map_layer_name: us_states
    sql: ${TABLE}.state ;;
  }

  dimension: zip {
     type:  zipcode
      sql: lpad(${TABLE}.zip, 5, 0);;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: count_cali {
    label: "Count Cailfornia"
    description: "Count of Users in California"
    type:  count
    filters: {
      field: users.state
      value: "California"
    }
    drill_fields: [users.id, users.state, users.count]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      name,
      events.count,
      orders.count,
      user_data.count
    ]
  }
}
