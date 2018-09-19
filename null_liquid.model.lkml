connection: "mybqtets"

# datagroup: rebuild_pdts {
#   sql_trigger: SELECT max(sffd_service_calls.incident_number) FROM sf_thesis.sffd_service_calls ;;
# }

persist_for: "1 hour"

# include: "*.view"
#
# explore: null_liquid_pdt {}
#
# explore: municipal_sf_requests {}
#
# explore: neighborhood_pd {}
#
# explore: neighborhood_zip {}
#
# explore: sffd_service_calls {}
#
# explore: sffd_service_calls_access {
#   from: sffd_service_calls
#   always_filter: {
#     filters: {
#       field: battalion
#       value: "B03"
#     }
#
#   }
# }
#
#
# explore: zipcode_neighborhood_grp {}
#
# explore: sfpd_incidents {
#   fields: [
#     ALL_FIELDS*,
#     -category_blank
#   ]
# }
