connection: "mybqtets"

#persist_with: 5_minute_datagroup

persist_for: "5 minutes"

#Set cache at every 0.08 (5 minutes)
datagroup: 5_minute_datagroup {
  sql_trigger: SELECT FLOOR((TIMESTAMP_DIFF(CURRENT_TIMESTAMP(),'1970-01-01 00:00:00',SECOND)) / (0.08*60*60)) ;;
  max_cache_age: "24 hours"
}

#Set cache at every 0.5 (1/2 hour)
datagroup: 30_minute_datagroup {
  sql_trigger: SELECT FLOOR((TIMESTAMP_DIFF(CURRENT_TIMESTAMP(),'1970-01-01 00:00:00',SECOND)) / (0.5*60*60)) ;;
}

#Set cache at every 0.5 (1/2 hour)
datagroup: 2_hour_datagroup {
  sql_trigger: SELECT FLOOR((TIMESTAMP_DIFF(CURRENT_TIMESTAMP(),'1970-01-01 00:00:00',SECOND)) / (2*60*60)) ;;
}

#new comment
include: "sffd_service_calls.view"
include: "municipal_sf_requests.view"
include: "neighborhood_zip.view"
include: "ndt_with_datagroup.view"



# include all the dashboards
#include: "*.dashboard.lookml"



explore: municipal_sf_requests {

}

explore: neighborhood_zip {}

explore: sffd_service_calls {
  persist_with: 5_minute_datagroup
}

explore: ndt_with_datagroup {}
