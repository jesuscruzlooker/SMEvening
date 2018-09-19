view: my_derived_table {
  derived_table: {
    datagroup_trigger: 5_minute_datagroup

    sql: SELECT
        (FORMAT_TIMESTAMP('%A', CAST(DATE(sffd_service_calls.available_timestamp)  AS TIMESTAMP)))  AS sffd_service_calls_day_of_week,
        CASE
      WHEN sffd_service_calls.number_of_alarms  < 0.0 THEN 'T00 (-inf,0.0)'
      WHEN sffd_service_calls.number_of_alarms  >= 0.0 AND sffd_service_calls.number_of_alarms  < 1.0 THEN 'T01 [0.0,1.0)'
      WHEN sffd_service_calls.number_of_alarms  >= 1.0 AND sffd_service_calls.number_of_alarms  < 2.0 THEN 'T02 [1.0,2.0)'
      WHEN sffd_service_calls.number_of_alarms  >= 2.0 AND sffd_service_calls.number_of_alarms  < 3.0 THEN 'T03 [2.0,3.0)'
      WHEN sffd_service_calls.number_of_alarms  >= 3.0 AND sffd_service_calls.number_of_alarms  < 4.0 THEN 'T04 [3.0,4.0)'
      WHEN sffd_service_calls.number_of_alarms  >= 4.0 AND sffd_service_calls.number_of_alarms  < 5.0 THEN 'T05 [4.0,5.0)'
      WHEN sffd_service_calls.number_of_alarms  >= 5.0 AND sffd_service_calls.number_of_alarms  < 6.0 THEN 'T06 [5.0,6.0)'
      WHEN sffd_service_calls.number_of_alarms  >= 6.0 THEN 'T07 [6.0,inf)'
      ELSE 'TXX Undefined'
      END AS sffd_service_calls_number_of_alarms,
        sffd_service_calls.original_priority  AS sffd_service_calls_original_priority,
        COUNT(CASE WHEN sffd_service_calls.call_type = 'Alarms'  THEN 1 ELSE NULL END) AS sffd_service_calls_count
      FROM sf_thesis.sffd_service_calls AS sffd_service_calls

      GROUP BY 1,2,3
      ORDER BY 4 DESC
      LIMIT 500
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: sffd_service_calls_day_of_week {
    type: string
    sql: ${TABLE}.sffd_service_calls_day_of_week ;;
  }

  dimension: sffd_service_calls_number_of_alarms {
    type: string
    sql: ${TABLE}.sffd_service_calls_number_of_alarms ;;
  }

  dimension: sffd_service_calls_original_priority {
    type: string
    sql: ${TABLE}.sffd_service_calls_original_priority ;;
  }

  measure: sffd_service_calls_count {
    type: sum
    sql: ${TABLE}.sffd_service_calls_count ;;
  }

  set: detail {
    fields: [sffd_service_calls_day_of_week, sffd_service_calls_number_of_alarms, sffd_service_calls_original_priority, sffd_service_calls_count]
  }
}
