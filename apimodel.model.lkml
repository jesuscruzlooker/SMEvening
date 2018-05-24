connection: "mybqtets"

#new comment
include: "*.view"


# include all the dashboards
include: "*.dashboard.lookml"


explore: testing_extends {
  view_name: neighborhood_zip
  from: neighborhood_zip
}

explore: neighborhood_pd {}

explore: neighborhood_zip {}

explore: sffd_service_calls {}
