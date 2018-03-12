connection: "mybqtets"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

explore: new_explore {
  from: neighborhood_zip
  join: zipcode_neighborhood_grp {
    view_label: "View Join"
    foreign_key: new_explore.zipcode
    type: full_outer
  }
}

explore: neighborhood_zip {
  join: zipcode_neighborhood_grp {
    sql_on: ${zipcode_neighborhood_grp.zipcode} = ${neighborhood_zip.zipcode} ;;

  }
}

#
# explore: dates {
#   join: dynamic_order_counts {
#     sql_on:
#       ${dynamic_order_counts.period} =
#       {% if dates.reporting_date._in_query %}
#         ${dates.date_string}
#       {% elsif dates.reporting_week._in_query %}
#         ${dates.week_string}
#       {% else %}
#         ${dates.month_string}
#       {% endif %} ;;
#   }
# }
