#adding comment after deleting branch


connection: "mybqtets"
datagroup: mydatagroup {
  max_cache_age: "5 minutes"
  sql_trigger: SELECT 1 ;;
}

# include all the views


#new comment
include: "*.view"

# include all the dashboards
include: "*.dashboard"

#pushing new test via list branch

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

explore: neighborhood_pd {}

explore: neighborhood_zip {}

explore: sffd_service_calls {
  access_filter: {
    field: sffd_service_calls.battalion
    user_attribute: battalion

  }
#   conditionally_filter: {
#
#     filters: {
#       field: call_number
#       value: "2"
#     }
#     filters: {
#       field: station_area
#       value: "1"
#     }
#
#     unless: [final_priority]
#
#   }
}



explore: zipcode_neighborhood_grp {}

explore: sfpd_incidents {
  fields: [
    ALL_FIELDS*,
    -category_blank
  ]
}
