include: "first_pdt.view"

view: second_pdt {
  derived_table: {
    persist_for: "1 hour"
    sql: SELECT
sffd_service_calls_station_area,
sffd_service_calls_supervisor_district

FROM (${first_pdt.SQL_TABLE_NAME})
       ;;
  }

  dimension: sffd_service_calls_station_area_2nd {
    type: string
    sql: ${TABLE}.sffd_service_calls_station_area ;;
  }


}
