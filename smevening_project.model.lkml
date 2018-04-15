 connection: "mybqtets"

datagroup: rebuild_pdts {
  sql_trigger: SELECT max(sffd_service_calls.incident_number) FROM sf_thesis.sffd_service_calls ;;
}



#new comment
include: "*.view"


# include all the dashboards
include: "*.dashboard"


#commit test
explore: testing_date {
  join: admin_view {
    relationship: one_to_one
    sql_on:

    {% if admin_view.sumvalue._in_query %}
    test
    {% elsif admin_view.count._in_query %}
    secondtest
    {% else %}
    elsetest
    {% endif %}
    ;;
  }
}

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

explore: newsffdcalls {
  from: sffd_service_calls
  join: sffd_service_calls {
    fields: [filter_test,call_type]
    sql_on: ${sffd_service_calls.row_id} = ${newsffdcalls.row_id} ;;
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
    sql_on: ${extended_sffd.call_number}=${sffd_service_calls.call_number} ;;
  }
}

explore: testing_pdts {}
