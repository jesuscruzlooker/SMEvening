connection: "mybqtets"

# datagroup: rebuild_pdts {
#   sql_trigger: SELECT max(sffd_service_calls.incident_number) FROM sf_thesis.sffd_service_calls ;;
# }



#new comment
include: "*.view"

explore: my_derived_table {}

explore: my_ndt {}
