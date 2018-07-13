connection: "mybqtets"

# datagroup: rebuild_pdts {
#   sql_trigger: SELECT max(sffd_service_calls.incident_number) FROM sf_thesis.sffd_service_calls ;;
# }

persist_for: "1 hour"


#new comment
include: "*.view"


# include all the dashboards
#include: "*.dashboard.lookml"


explore: newndt {}

# explore: newndt2 {}
explore: admin_view {
  join: testing_date {
    relationship: one_to_one
    sql_on:

      ${admin_view.sffd_service_calls_call_date_year} = ${testing_date.sffd_service_calls_call_date_year}

  ;;
  }
}


explore: municipal_sf_requests {


}
explore: testing_extends {
  view_name: neighborhood_zip
  from: neighborhood_zip
}

explore: neighborhood_pd {}

explore: neighborhood_zip {}

explore: sffd_service_calls {}

explore: sffd_service_calls_access {
  from: sffd_service_calls
  always_filter: {
    filters: {
      field: battalion
      value: "B03"
    }

  }
}



explore: zipcode_neighborhood_grp {}

explore: sfpd_incidents {
  fields: [
    ALL_FIELDS*,
    -category_blank
  ]
}


explore: extended_sffd {

  join: sffd_service_calls {
    relationship: many_to_one
    sql_on: ${extended_sffd.call_number}=${sffd_service_calls.call_number} ;;
  }
}

explore: testing_pdts {}

explore: link_placement_publishers {}
