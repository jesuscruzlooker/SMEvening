# If necessary, uncomment the line below to include explore_source.
# include: "bare_testing.model.lkml"

view: newndt {
  derived_table: {
    sql_trigger_value: SELECT CURRENT_DATE() ;;
    explore_source: sffd_service_calls {
      timezone: "America/Phoenix"


      column: call_number {}
      column: call_type {}
      column: call_type_group {}
    }
  }
  dimension: call_number {
    type: number
  }
  dimension: call_type {}
  dimension: call_type_group {}
}


view: newndt2 {
  derived_table: {
    sql_trigger_value: SELECT CURRENT_DATE() ;;
    explore_source: newndt {
      timezone: "query_timezone"


      column: call_number {}
      column: call_type {}
      column: call_type_group {}
    }
  }
  dimension: call_number {
    type: number
  }
  dimension: call_type {}
  dimension: call_type_group {}
}
