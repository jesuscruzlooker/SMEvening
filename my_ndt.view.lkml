# If necessary, uncomment the line below to include explore_source.
 include: "smevening_project.model.lkml"

view: my_ndt {
  derived_table: {
    explore_source: sffd_service_calls {
      column: count {}
      column: day_of_week {}
      column: number_of_alarms {}
      column: original_priority {}
    }
  }
  measure: count {
    type: sum
  }
  dimension: day_of_week {}
  dimension: number_of_alarms {
#     type: tier
  }
  dimension: original_priority {}
}
