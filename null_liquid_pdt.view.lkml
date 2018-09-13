view: null_liquid_pdt {
  derived_table: {
    sql:

    SELECT
  sffd_service_calls.unit_type  AS unit_type,
  sffd_service_calls.station_area  AS station_area,
  sffd_service_calls.call_type  AS call_type
FROM sf_thesis.sffd_service_calls AS sffd_service_calls
WHERE {% condition null_liquid_pdt.calltype_filter %} COALESCE(sffd_service_calls.call_type,'') {% endcondition %}
GROUP BY 1,2,3
ORDER BY 1
LIMIT 500
       ;;
  }

  filter: calltype_filter {
    type: string
  }

  measure: count {
    type: count
  }

  dimension: unit_type {
    type: number
    sql: ${TABLE}.unit_type  ;;
  }

  dimension: station_area {
    type: string
    sql: ${TABLE}.station_area ;;
  }

  dimension: call_type {
    type: string
    sql: ${TABLE}.call_type ;;
  }

}
