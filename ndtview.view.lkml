# If necessary, uncomment the line below to include explore_source.
# include: "smevening_project.model.lkml"

view: add_a_unique_name_1522681904 {
  derived_table: {
    explore_source: sffd_service_calls {
      column: latitude {}
      column: incident_number {}
      column: priority {}
    }
  }
  dimension: latitude {
    type: number
  }
  dimension: incident_number {
    type: number
  }
  dimension: priority {}
}
