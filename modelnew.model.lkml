connection: "mybqtets"



#new comment
include: "sffd_service_calls.view"
include: "mylkml_db.dashboard.lookml"

# include all the dashboards
#include: "*.dashboard.lookml"



explore: sffd_service_calls {}
