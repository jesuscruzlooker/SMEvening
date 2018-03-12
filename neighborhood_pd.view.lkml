view: neighborhood_pd {
  sql_table_name: sf_thesis.neighborhood_pd ;;

  dimension: neighborhood_group {
    type: string
    sql: ${TABLE}.neighborhood_group ;;
  }

  dimension: pd_district {
    type: string
    sql: ${TABLE}.pd_district ;;
  }

  dimension: zipcode {
    type: zipcode
    sql: ${TABLE}.zipcode ;;
  }

  measure: count {
    type: count
    drill_fields: []
    link: {
      label: "Why is this important"
      url: "http://support.influitive.com/"
      icon_url: "https://static.influitive.com/favicon.png"
    }
    html:
    {% if 1 == 1 %} <a href ="https://www.google.com">{{rendered_value}}</a>
    {% else %} <a href ="https://www.yahoo.com/">{{rendered_value}}</a>
    {% endif %};;
  }
}
