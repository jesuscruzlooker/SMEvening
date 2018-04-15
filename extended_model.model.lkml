connection: "mybqtets"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project
include: "model.base.lkml"


explore: testextend_explore {
  extends: [random_view]

  join: myjoin {
    from: sffd_service_calls
    relationship: one_to_one
    sql_on: ${finalchats.incident_number} = ${myjoin.incident_number} ;;
  }

  join: sffd_service_calls {
    relationship: one_to_one
    sql_on: ${sffd_service_calls.incident_number} = ${finalchats.incident_number} ;;
  }

}


# explore: new_explore {
#   from: sfpd_incidents
# }
