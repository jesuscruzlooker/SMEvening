connection: "mybqtets"

# datagroup: rebuild_pdts {
#   sql_trigger: SELECT max(sffd_service_calls.incident_number) FROM sf_thesis.sffd_service_calls ;;
# }

datagroup: 5_minute_datagroup {
  sql_trigger: SELECT FLOOR((TIMESTAMP_DIFF(CURRENT_TIMESTAMP(),'1970-01-01 00:00:00',SECOND)) / (0.08*60*60)) ;;
  max_cache_age: "24 hours"
}

#new comment
include: "*my_derived_table.view"

explore: my_derived_table {}

# explore: my_ndt {}
