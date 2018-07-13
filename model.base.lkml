connection: "mybqtets"

# include all the views
include: "*.view"

# include all the dashboards
#include: "*.dashboard"

explore: random_view {
  view_name: finalchats
  from: sffd_service_calls
}
