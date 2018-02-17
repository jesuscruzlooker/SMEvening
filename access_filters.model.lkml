connection: "mybqtets"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

explore: sffd_service_calls {
  access_filter_fields: [sffd_service_calls.battalion, sffd_service_calls.call_type_group]
}
