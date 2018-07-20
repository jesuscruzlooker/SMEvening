connection: "mybqtets"

# include all the views
include: "sffd_service_calls.view"

# include all the dashboards
#include: "*.dashboard"

explore: random_view {
  view_name: finalchats
  from: sffd_service_calls
}
