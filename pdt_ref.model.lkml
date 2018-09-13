connection: "mybqtets"

# datagroup: rebuild_pdts {
#   sql_trigger: SELECT max(sffd_service_calls.incident_number) FROM sf_thesis.sffd_service_calls ;;
# }

persist_for: "1 hour"

include: "second_pdt.view"
include: "first_pdt.view"

explore: first_pdt{}
explore: second_pdt{}
