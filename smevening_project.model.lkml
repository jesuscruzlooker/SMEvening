#adding comment after deleting branch


connection: "mybqtets"
datagroup: mydatagroup {
  max_cache_age: "5 minutes"
  sql_trigger: SELECT 1 ;;
}

# include all the views


#new comment
include: "*.view"

include: "modelbase.base"
#testing

# include all the dashboards
include: "*.dashboard"

#pushing new test via list branch

# #commit test
# explore: testing_date {
#   join: admin_view {
#     relationship: one_to_one
#     sql_on:
#
#     {% if admin_view.sumvalue._in_query %}
#     test
#     {% elsif admin_view.count._in_query %}
#     secondtest
#     {% else %}
#     elsetest
#     {% endif %}
#     ;;
#   }
# }
#
#  explore: admin_view {
#    join: testing_date {
#     relationship: one_to_one
#     sql_on:
#
#       ${admin_view.sffd_service_calls_call_date_year} = ${testing_date.sffd_service_calls_call_date_year}
#
#  ;;
#    }
#  }
#
#
# explore: municipal_sf_requests {
#
#
# }
# explore: testing_extends {
#   view_name: neighborhood_zip
#   from: neighborhood_zip
#   }
#
# explore: neighborhood_pd {}
#
# explore: neighborhood_zip {}
#
# explore: sffd_service_calls {
#   access_filter: {
#     field: sffd_service_calls.battalion
#     user_attribute: battalion
#
#   }
# #   conditionally_filter: {
# #
# #     filters: {
# #       field: call_number
# #       value: "2"
# #     }
# #     filters: {
# #       field: station_area
# #       value: "1"
# #     }
# #
# #     unless: [final_priority]
# #
# #   }
# }
#
# explore: newsffdcalls {
#   from: sffd_service_calls
#   join: sffd_service_calls {
#     fields: [filter_test,call_type]
#     sql_on: ${sffd_service_calls.row_id} = ${newsffdcalls.row_id} ;;
#   }
# }
#
# explore: zipcode_neighborhood_grp {}
#
# explore: sfpd_incidents {
#   fields: [
#     ALL_FIELDS*,
#     -category_blank
#   ]
# }

# explore: sffd_service_calls {
#   extends: [extended_sffd]
#   from: sffd_service_calls
#   view_name: sffd_service_calls
# }

explore: sffd_service_calls {
  extends: [testingbase]
  from: sffd_service_calls
  view_name: sffd_service_calls
}


# explore: extended_sffd_explore {
#   extends: [sffd_service_calls]
# }
#
# explore: extended_sffd {
#
#   join: sffd_service_calls {
#     sql_on: ${extended_sffd.call_number}=${sffd_service_calls.call_number} ;;
#   }
# }
#
# explore: sffd_service_calls {
#   view_name: sffd_service_calls
#   from: sffd_service_calls
#   hidden: yes
# }
