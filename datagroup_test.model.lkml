connection: "mybqtets"

persist_for: "1 hour"

#Set cache at every 0.5 (1/2 hour)
datagroup: 5_minute_datagroup {
  sql_trigger: SELECT FLOOR((TIMESTAMP_DIFF(CURRENT_TIMESTAMP(),'1970-01-01 00:00:00',SECOND)) / (0.5*60*60)) ;;
}

#new comment
include: "sffd_service_calls.view"
include: "municipal_sf_requests.view"
include: "neighborhood_zip.view"

# include all the dashboards
#include: "*.dashboard.lookml"



explore: municipal_sf_requests {}

explore: neighborhood_zip {}

explore: sffd_service_calls {
  persist_with: 5_minute_datagroup
}
