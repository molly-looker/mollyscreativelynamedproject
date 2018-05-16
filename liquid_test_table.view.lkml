view: liquid_test_table {
  derived_table: {
    sql:
    select * from {% parameter events.db_schema %}.{% parameter events.db_table %}
    ;;
  }

  parameter: db_schema {
    label: "*1. Event Source"
    type: unquoted
    allowed_value: {
      label: "app.clio.com"
      value: "app_clio_com"
    }
  }

  parameter: db_table {
    label: "*2. Event Name"
    type: unquoted
    allowed_value: {
      label: "Exported Activities"
      value: "exported_activities"
    }
    allowed_value: {
      label: "Exported Matters"
      value: "exported_matters"
    }
    allowed_value: {
      label: "Exported Contacts"
      value: "exported_contacts"
    }
  }

  dimension: db_table_name {
# hidden: yes
  type: string
  sql: '{% parameter db_table %}' ;;
}

# dimension: export_format {
#   type: string
#   sql:
#    case
#         when {% parameter db_table %} = 'exported_matters' then ${export_format}
#         when {% parameter db_table %} = 'exported_contacts'  then ${exported_format}
#       end;;
# }
}

#   }
#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }
