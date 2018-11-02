view: onetwothree {
  derived_table: {
    sql:SELECT
           1 as one, 2 as two, 3 as three;;
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




    }

    explore: onetwothree {}
