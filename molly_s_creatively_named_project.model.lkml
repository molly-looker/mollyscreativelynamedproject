connection: "thelook"
label: "The Look"
include: "*.view.lkml"
include: "*.dashboard.lookml"

datagroup: molly_datagroup {
  max_cache_age: "4 hour"
}


explore: users {
  persist_with: molly_datagroup
  view_label: "California Users"
  fields: [ALL_FIELDS*, -user_data.id]
  always_filter: {
    filters: {
      field: state
      value: "California"
    }
  }
  join: user_data {
    view_label: "extra user shiz"
    type: inner
    sql_on: ${users.id} = ${user_data.user_id};;
    relationship: one_to_one

  }

  join: allusers {
    from:  users
    view_label: "All Users"
    sql_on: ${users.id} = ${user_data.user_id} ;;
    relationship: one_to_one

  }

}

explore: orders {
  sql_always_where: ${created_date} >= '2017-01-02';;
  join: users {
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

  join: order_items {
    sql_on: ${order_items.order_id} = ${orders.id} ;;
    relationship: one_to_many
  }
}

explore: inventory_items {
  join: products {
    from: products
    sql_on:  ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
}
