# If necessary, uncomment the line below to include explore_source.
# include: "smevening_project.model.lkml"

view: ndt_test {
  derived_table: {
    persist_for: "5 minutes"
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
