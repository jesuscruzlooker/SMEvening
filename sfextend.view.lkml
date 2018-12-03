include: "sffd_service_calls.view.lkml"
view: sfextend {
    extends: [sffd_service_calls]
    # The additional things you want to add or change
    # on the new view are added as normal


  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
    html: {{ value }} ;;


  }
  }
