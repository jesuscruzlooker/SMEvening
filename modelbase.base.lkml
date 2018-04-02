connection: "mybqtets"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

explore: testingbase {
  from: sffd_service_calls
  view_name: sffd_service_calls
}
