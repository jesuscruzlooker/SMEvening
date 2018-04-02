view: sfpd_incidents {
  sql_table_name: sf_thesis.sfpd_incidents ;;

  dimension: address {
    type: string
    sql: ${TABLE}.address ;;
  }

  dimension: category {
    type: string
    label: "foo"
    sql: ${TABLE}.category ;;
    html: <p style="color: red; font-size: 10px"> {{ rendered_value }} </p>;;
  }

  dimension: category2 {
    type: string
    label: "foo"
    sql: ${TABLE}.category ;;
    html: <p style="color: red; font-size: 10px"> {{ rendered_value }} </p>;;
  }

  dimension: category3 {
    type: string
    label: "foo"
    sql: ${TABLE}.category ;;
    html: <p style="color: red; font-size: 10px"> {{ rendered_value }} </p>;;
  }

  dimension: category34 {
    type: string
    label: "foo"
    sql: ${TABLE}.category ;;
    html: <p style="color: red; font-size: 10px"> {{ rendered_value }} </p>;;
  }


  dimension: category_blank {
    type: string
    sql: ${TABLE}.category ;;
    html: <font color="blue" size="10">  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;   &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  </font> ;;
  }

  dimension: category_blank_small {
    type: string
    sql: ${TABLE}.category ;;
    html: <font color="blue" size="10">  &nbsp; &nbsp;       </font> ;;
  }

  dimension: filtertest {
    type: string
    sql: ${TABLE}.category;;
    html: {{ _filters['category'] }};;
  }

  dimension: dayofweek {
    type: string
    sql: ${TABLE}.dayofweek ;;
  }

  dimension: descript {
    type: string
    sql: ${TABLE}.descript ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: pddistrict {
    type: string
    sql: ${TABLE}.pddistrict ;;
  }

  dimension: pdid {
    type: number
    value_format_name: id
    sql: ${TABLE}.pdid ;;
  }

  dimension: resolution {
    type: string
    sql: ${TABLE}.resolution ;;
  }

  dimension_group: timestamp {
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
    sql: ${TABLE}.timestamp ;;
  }

  measure: min_date {
    type: date
    sql: MIN(${timestamp_raw}) ;;
  }

  dimension: age {
    type: number
    sql:  DATEDIFF(${timestamp_time}, now())   ;;
  }

  dimension: unique_key {
    type: number
    sql: ${TABLE}.unique_key ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }


  measure: avg {
    type: average
    sql: case when ${category} = 'ASSAULT' then ${unique_key} * 1
          else ${unique_key} * -1 end ;;
  }

  measure: sum {
    type: sum
    sql: ${unique_key};;
    filters: {
      field: category
      value: "ASSAULT"
    }
  }


  measure: sum2 {
    type: sum
    sql: CASE WHEN {% condition category %} category {% endcondition %} THEN ${unique_key} ELSE NULL END;;

  }


  measure: countnum {
    type:  number
    sql: ${count} * .1213  ;;
  }

  measure: conuntnum_case {
    type: number
    sql:  case when ${category} = 'ASSAULT'
            then ${count} * 2.2
            else ${count} * -1.3
            end
    ;;
  }

  measure: addingmeas {
    type: number
    sql: ${sum}*2.1/${avg} ;;
  }

}
