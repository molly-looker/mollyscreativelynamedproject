connection: "thelook"
label: "The Look"
include: "*.view.lkml"
#include: "*.dashboard"

datagroup: molly_datagroup {
  max_cache_age: "4 hour"
}


explore: users {
  persist_with: molly_datagroup
  view_label: "California Users"

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

  join: testpdt{
    type:  left_outer
    sql_on:  ${testpdt.id}=${users.id} ;;
    relationship: one_to_one
  }

}

explore: orders {
  #fields: [orders.my_first_set*]
# sql_always_where: ${created_date} = ${2daysago};;
  join: users {
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one

  }

}

explore: inventory_items {
  join: products {
    from: products
    sql_on:  ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
}


explore: error_trends {
  from: products
  view_name: products
  description: "Investigation view. Used to see the 10 events surrounding one particular event pivoted."
  always_filter: {filters: {
      field: products.brand
      value: "Allegra K"
    }}


  }


explore: users2 {
  view_name: users
}

explore: extends_test {
  extends: [error_trends]
  from: products
  view_name: products
}
