view: first_pdt {
  derived_table: {
    sql: SELECT
        sffd_service_calls.station_area  AS sffd_service_calls_station_area,
        sffd_service_calls.supervisor_district  AS sffd_service_calls_supervisor_district,
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
        sffd_service_calls.incident_number  AS sffd_service_calls_incident_number
      FROM sf_thesis.sffd_service_calls AS sffd_service_calls

      GROUP BY 1,2,3,4
      ORDER BY 3
      LIMIT 500
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: sffd_service_calls_station_area {
    type: string
    sql: ${TABLE}.sffd_service_calls_station_area ;;
  }

  dimension: sffd_service_calls_supervisor_district {
    type: string
    sql: ${TABLE}.sffd_service_calls_supervisor_district ;;
  }

  dimension: sffd_service_calls_number_of_alarms {
    type: string
    sql: ${TABLE}.sffd_service_calls_number_of_alarms ;;
  }

  dimension: sffd_service_calls_incident_number {
    type: number
    sql: ${TABLE}.sffd_service_calls_incident_number ;;
  }

  set: detail {
    fields: [sffd_service_calls_station_area, sffd_service_calls_supervisor_district, sffd_service_calls_number_of_alarms, sffd_service_calls_incident_number]
  }
}
