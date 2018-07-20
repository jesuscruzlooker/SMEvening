# If necessary, uncomment the line below to include explore_source.
# include: "datagroup_test.model.lkml"


view: ndt_with_datagroup {
  derived_table: {
   # datagroup_trigger: 5_minute_datagroup
    explore_source: sffd_service_calls {
      column: supervisor_district {}
      column: station_area {}
      column: basic_count {}
    }
  }
  dimension: supervisor_district {}
  dimension: station_area {}
  dimension: basic_count {
    type: number
  }
}
