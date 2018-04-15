view: testing_pdts {
  derived_table: {
    sql_trigger_value: SELECT CURRENT_DATE() ;;
    sql: SELECT
        FORMAT_TIMESTAMP('%Y-%m', CAST(sffd_service_calls.call_date  AS TIMESTAMP)) AS sffd_service_calls_call_month,
        COUNT(CASE WHEN sffd_service_calls.call_type = 'Alarms'  THEN 1 ELSE NULL END) AS sffd_service_calls_count,
        COALESCE(SUM(sffd_service_calls.number_of_alarms ), 0) AS sffd_service_calls_sum
      FROM sf_thesis.sffd_service_calls AS sffd_service_calls

      GROUP BY 1
      ORDER BY 2 DESC
      LIMIT 500
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: sffd_service_calls_call_month {
    type: string
    sql: ${TABLE}.sffd_service_calls_call_month ;;
  }

  dimension: sffd_service_calls_count {
    type: number
    sql: ${TABLE}.sffd_service_calls_count ;;
  }

  dimension: sffd_service_calls_sum {
    type: number
    sql: ${TABLE}.sffd_service_calls_sum ;;
  }

  set: detail {
    fields: [sffd_service_calls_call_month, sffd_service_calls_count, sffd_service_calls_sum]
  }
}
