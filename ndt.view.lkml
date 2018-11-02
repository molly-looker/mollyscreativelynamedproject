include: "molly_s_creatively_named_project.model.lkml"
view: ndt {
  derived_table: {
    explore_source: users {
      column: created_date {}
      column: gender {}
      column: name {}
      column: age {}
      column: count {}
      filters: {
        field: users.state
        value: "California"
      }
    }
  }
  dimension: created_date {
    label: "California Users Created Date"
    type: date
  }
  dimension: gender {
    label: "California Users Gender"
  }
  dimension: name {
    label: "California Users Full Name"
    description: "First and Last Name"
  }
  dimension: age {
    label: "California Users Age"
    type: number
  }
  dimension: count {
    label: "California Users Count"
    type: number
  }
}

explore: ndt {}
