view: testing_date {
  derived_table: {
    sql: SELECT sffd_service_calls.call_date AS sffd_service_calls_call_date,
        COUNT(CASE WHEN sffd_service_calls.call_type = 'Alarms'  THEN 1 ELSE NULL END) AS sffd_service_calls_count,
        COUNT(CASE WHEN sffd_service_calls.call_type = 'Alarms'  THEN 1 ELSE NULL END) AS sffd_service_calls_calltype_count_1
      FROM sf_thesis.sffd_service_calls  AS sffd_service_calls

      GROUP BY 1
      ORDER BY 1 DESC
      LIMIT 500
       ;;
  }

  parameter: date_granularity {
    type: unquoted
    allowed_value: { value: "Day" }
    allowed_value: { value: "Month" }
    allowed_value: { value: "Quarter" }
    allowed_value: { value: "Year" }
  }


  dimension: dyn_date {
    label_from_parameter: date_granularity
    sql:
       CASE
         WHEN '{% parameter date_granularity %}' = 'Day' THEN
          CAST(${sffd_service_calls_call_date_date} as STRING)
         WHEN '{% parameter date_granularity %}' = 'Month' THEN
           CAST(${sffd_service_calls_call_date_month} as STRING)
         WHEN '{% parameter date_granularity %}' = 'Quarter' THEN
          CAST(${sffd_service_calls_call_date_quarter} as STRING)
         WHEN '{% parameter date_granularity %}' = 'Year' THEN
         CAST(${sffd_service_calls_call_date_year} as STRING)
         ELSE
           NULL
       END ;;
      html: {{ testing_date.date_granularity.rendered_value }} 324234;;
  }


  measure: count {
    type: count
#     drill_fields: [detail*]
  }

  measure: sumvalue {
    type: sum
    sql: ${TABLE}.sffd_service_calls_count ;;
  }

  measure: count_value {
    type: count_distinct
    sql: ${TABLE}.sffd_service_calls_count;;
    sql_distinct_key: ${TABLE}.sffd_service_calls_call_date ;;


  }


  dimension_group: sffd_service_calls_call_date {
    type: time
    datatype: date
    timeframes: [date,month,year,quarter]
    sql: ${TABLE}.sffd_service_calls_call_date ;;
  }

  dimension: sffd_service_calls_count {
    type: string
    sql: ${TABLE}.sffd_service_calls_count ;;
  }

  dimension: sffd_service_calls_calltype_count_1 {
    type: string
    sql: ${TABLE}.sffd_service_calls_calltype_count_1 ;;
  }

#   set: detail {
#     fields: [sffd_service_calls_call_date, sffd_service_calls_count, sffd_service_calls_calltype_count_1]
#   }
}
