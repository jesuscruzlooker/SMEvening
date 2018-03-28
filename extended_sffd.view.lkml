include: "sffd_service_calls.view.lkml"

view: extended_sffd {
  extends: [sffd_service_calls]

  dimension: testing {
    sql:  "mystring" ;;
  }
  }
