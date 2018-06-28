view: users {
  sql_table_name: demo_db.users ;;


  dimension: huge_long_regex {
    type:  string
  sql: regex(regexp_extract(domain, (r"^(([a-z0-9-])+\.(com|net|org|int|edu|gov|mil)$)|([a-z0-9-]+\.(ac|co|gov|judiciary|ltd|me|mod|net|nhs|nic|org|parliament|plc|police|sch)\.uk$)|([a-z0-9-]+\.(ad|ae|af|ag|ai|al|am|ao|aq|ar|as|at|au|aw|ax|az|ba|bb|bd|be|bf|bg|bh|bi|bj|bl|bm|bn|bo|bq|br|bs|bt|bv|bw|by|bz|ca|cc|cd|cf|cg|ch|ci|ck|cl|cm|cn|co|cr|cu|cv|cw|cx|cy|cz|de|dj|dk|dm|do|dz|ec|ee|eg|eh|er|es|et|fi|fj|fk|fm|fo|fr|ga|gb|gd|ge|gf|gg|gh|gi|gl|gm|gn|gp|gq|gr|gs|gt|gu|gw|gy|hk|hm|hn|hr|ht|hu|id|ie|il|im|in|io|iq|ir|is|it|je|jm|jo|jp|ke|kg|kh|ki|km|kn|kp|kr|kw|ky|kz|la|lb|lc|li|lk|lr|ls|lt|lu|lv|ly|ma|mc|md|me|mf|mg|mh|mk|ml|mm|mn|mo|mp|mq|mr|ms|mt|mu|mv|mw|mx|my|mz|na|nc|ne|nf|ng|ni|nl|no|np|nr|nu|nz|om|pa|pe|pf|pg|ph|pk|pl|pm|pn|pr|ps|pt|pw|py|qa|re|ro|rs|ru|rw|sa|sb|sc|sd|se|sg|sh|si|sj|sk|sl|sm|sn|so|sr|ss|st|sv|sx|sy|sz|tc|td|tf|tg|th|tj|tk|tl|tm|tn|to|tr|tt|tv|tw|tz|ua|ug|uk|um|us|uy|uz|va|vc|ve|vg|vi|vn|vu|wf|ws|ye|yt|za|zm|zw))$|([a-z0-9-]+\.[a-z0-9-]+$)|(^[a-z0-9-]+$)))
  ;;
  }

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
    html: {% if  users.age._value  < 20 %}
    <p style="background-color: yellow">{{ value }}</p>
    {% else %}
    {{ value }}
    {% endif %} ;;
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

  dimension_group: created2 {
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

  measure: count_ore {
    label: "Count Oregon"
    description: "Count of Users in Oregon"
    type:  count
    filters: {
      field: users.state
      value: "Oregon"
    }
    drill_fields: [users.id, users.state, users.count]
  }


measure: count_subtract {
  type:  number
  sql:  ${count_cali}-${count_ore} ;;
}


  measure: count_precision {

    type:  number
    #precision:  2
    sql:  555.7793759834793475934 ;;
  }


  measure: count_date {
    type:  count
#     filters: {
#       field: created_date
#       value: ">created2_date"
#     }
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
