view: onetwothree {
  derived_table: {
    sql:SELECT
           12345678 as one, 23456789 as two, 34567890 as three;;
          }

  dimension: one {
    type: number
    sql:  ${TABLE}.one ;;
      }

  dimension: two {
    type: number
    sql:  ${TABLE}.two ;;
  }

  dimension: three {
    type: number
    sql:  ${TABLE}.three ;;
  }

#test

measure: count {
  type:  count
}

  measure: sum {
    type:  sum
  }



    }

    explore: onetwothree {}
