view: pdt_one {
  derived_table: {
    sql: SELECT
        sffd_service_calls.battalion  AS sffd_service_calls_battalion,
        sffd_service_calls.incident_number  AS sffd_service_calls_incident_number
      FROM sf_thesis.sffd_service_calls AS sffd_service_calls

      GROUP BY 1,2
      ORDER BY 1
      LIMIT 500
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: sffd_service_calls_battalion {
    type: string
    sql: ${TABLE}.sffd_service_calls_battalion ;;
  }

  dimension: sffd_service_calls_incident_number {
    type: number
    sql: ${TABLE}.sffd_service_calls_incident_number ;;
  }

  set: detail {
    fields: [sffd_service_calls_battalion, sffd_service_calls_incident_number]
  }
}
