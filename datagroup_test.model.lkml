connection: "mybqtets"

# datagroup: rebuild_pdts {
#   sql_trigger: SELECT max(sffd_service_calls.incident_number) FROM sf_thesis.sffd_service_calls ;;
# }

persist_for: "5 minutes"


#new comment
include: "sffd_service_calls.view"
include: "municipal_sf_requests.view"
include: "neighborhood_zip.view"

# include all the dashboards
#include: "*.dashboard.lookml"



explore: municipal_sf_requests {}

explore: neighborhood_zip {}

explore: sffd_service_calls {}
