view: sffd_service_calls {
  sql_table_name: sf_thesis.sffd_service_calls;;

#   (SELECT * ,
#
#   CASE WHEN {% condition filter_test %} sffd_service_calls.station_area {% endcondition %} THEN 1 ELSE NULL END as columntest
#   FROM
#
#
#   sf_thesis.sffd_service_calls
#   LIMIT 100)  ;;

  dimension: address {
    type: string
    sql: 'https://discourse.looker.com/t/custom-drill-using-html-and-query-parameters/770' ;;
    html: <a href="{{ value }}">link text</a> ;;
  }

  filter: filter_test {
    type: string
  }

  dimension: columntest {
    sql: ${TABLE}.columntest ;;
  }
  dimension: als_unit {
    type: yesno
    sql: ${TABLE}.als_unit ;;
  }

  dimension: als_unit02 {
    type:  string
    sql: ${TABLE}.als_unit;;
  }

  dimension: calltype_yn {
    type: yesno
    sql: ${TABLE}.call_type = 'Alarms' ;;
  }

  measure: calltype_Count{
    type: count
    filters: {
      field: calltype_yn
      value: "yes"
    }
  }


  dimension: is_enrollment_measure {
    hidden: yes
    sql: 1 ;;
  }

  dimension: is_rated_measure {
    hidden: yes
    sql: 1 ;;
  }


  measure: member_average_age {
    type: average
    sql:
    {% if  battalion._in_query == true %}
    in_query_true
     {% else %}

    else_condition
    {% endif %}
        ;;
  }

  dimension: member_age {
    type: number
    sql:
    {% if  battalion._in_query == true %}

    in_query_true

    {% else %}

    else_condition
    {% endif %}
      ;;
  }



  measure: member_sum_age {
    type: sum
    sql: CASE WHEN ${battalion} = 'B03' THEN ${dimension_field}
        ELSE NULL
        END ;;
  }



  measure: member_max_age {
    type: max
    sql: CASE WHEN ${battalion} = 'B03' THEN ${dimension_field}
        ELSE NULL
        END ;;
  }


  dimension: dimension_field {
    description: "Member age"
    can_filter: no
    type: number
    sql:
     {% if 1 == 0 %}
     COALESCE(CAST(${TABLE}.call_number AS STRING), ${TABLE}.call_number)

      {% else %}
      ${TABLE}.call_number
        {% endif %} ;;
  }




  dimension: member_age_alternate {

    description: "Member age"
#   can_filter: no
    type: yesno
    sql:
        {% if is_rated_measure._in_query == '1=1' or is_rated_measure._in_query == true %}

     ${battalion} = 'B03'
      {% else %}
      ${battalion} = 'B03'
        {% endif %}

      ;;
  }

  measure: member_average_age_alternate {
    type: average
    sql: ${TABLE}.call_number ;;
    filters: {
      field: member_age_alternate
      value: "yes"
    }
  }



  dimension_group: available_timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.available_timestamp ;;
    datatype: datetime
  }

  parameter: fielddate {
    type: date
  }

  dimension_group: available_timestamp2 {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: DATE(${TABLE}.available_timestamp) ;;
    datatype: date
  }

  dimension: battalion {
    type: string
    sql: ${TABLE}.battalion ;;
  }



  dimension: box {
    type: string
    sql: ${TABLE}.box ;;
  }

  dimension_group: call {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.call_date ;;
  }

  dimension: call_final_disposition {
    type: string
    sql: ${TABLE}.call_final_disposition ;;
  }

  dimension: call_number {
    type: number
    sql: ${TABLE}.call_number ;;
    html:  %{{value | times: 10000000 }} ;;
  }

  dimension: call_type {
    type: string
    sql: ${TABLE}.call_type ;;
  }

#   dimension: case_call {
#     case: {
#       when: {
#         sql: ${call_type} = "Administrative" ;;
#         label: "second label"
#
#       }
#       when: {
#         sql: ${call_type} = "Administrative" ;;
#         label: "first label"
#
#       }
#
#     }
#   }


  dimension: call_type_test {
    type: string
    sql: CASE WHEN {% condition sffd_service_calls.call_type %} sffd_service_calls.call_type {% endcondition %} then sffd_service_calls.call_number  end;;
  }


  dimension: call_type_suggest {
    sql: ${TABLE}.call_type;;
    suggest_explore: sffd_service_calls
    suggest_dimension: sffd_service_calls.call_number
  }

  dimension: call_case {
    type: number
    sql:  ${call_type} ;;
    html:  {% if value == 1 %}
    <p><img src="http://findicons.com/files/icons/573/must_have/48/check.png" height=20 width=20></p>
    {% else %}
    <p><img src="http://findicons.com/files/icons/573/must_have/48/no.png" height=20 width=20></p>
    {% endif %};;
  }

  dimension: testing_filter {
    type: number
    sql: {% if sffd_service_calls.call_number._is_filtered %} ${call_type} {% endif %};;
  }

  dimension: call_type_group {
    type: string
    sql: ${TABLE}.call_type_group ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension_group: dispatch_timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.dispatch_timestamp ;;
  }

  dimension_group: entry_timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.entry_timestamp ;;
  }

  dimension: final_priority {
    type: number
    sql: ${TABLE}.final_priority ;;
  }

  dimension: fire_prevention_district {
    type: string
    sql: ${TABLE}.fire_prevention_district ;;
  }

  dimension_group: hospital_timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.hospital_timestamp ;;
  }

  dimension: incident_number {
    type: number
    sql: ${TABLE}.incident_number ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: neighborhood_district {
    type: string
    sql: ${TABLE}.neighborhood_district ;;
  }

  dimension: number_of_alarms {
    type: number
    sql: ${TABLE}.number_of_alarms ;;
  }

  dimension_group: on_scene_timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.on_scene_timestamp ;;
  }

  dimension: original_priority {
    type: string
    sql: ${TABLE}.original_priority ;;
  }

  dimension: priority {
    type: string
    sql: ${TABLE}.priority ;;
  }

  dimension_group: received_timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.received_timestamp ;;
  }

  dimension_group: response_timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.response_timestamp ;;
  }

  dimension: row_id {
    type: string
    sql: ${TABLE}.row_id ;;
  }

  dimension: station_area {
    type: string
    sql: ${TABLE}.station_area ;;
  }

  dimension: supervisor_district {
    type: string
    sql: ${TABLE}.supervisor_district ;;
  }

  dimension_group: transport_timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.transport_timestamp ;;
  }

  dimension: unit_id {
    type: string
    sql: ${TABLE}.unit_id ;;
  }

  dimension: unit_sequence_in_call_dispatch {
    type: number
    sql: ${TABLE}.unit_sequence_in_call_dispatch ;;
  }

  dimension: unit_type {
    type: string
    sql: ${TABLE}.unit_type ;;
    link: {
      label: "unit label"
      url: "https://localhost:9999/dashboards/9?Unit%20Type={{ _filters['sffd_service_calls.unit_type'] | url_encode }}&Unit%20Type%202={{ value }} "
    }
  }

  dimension_group: watch {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.watch_date ;;
  }

  dimension: zipcode_of_incident {
    type: string
    sql: ${TABLE}.zipcode_of_incident ;;
  }

  measure: yesnotype {
    type: yesno
    sql: ${sum} > 12000 ;;
  }

  measure: sum {
    type:  sum
    sql: ${number_of_alarms} ;;
  }



  measure: testingmeasure {
#type: number
#sql: ${TABLE}.pct_of_tot_sessions_30d_avg / ${TABLE}.pct_of_tot_sessions_30d_avg ;;
  sql: round((.00100*${count}) - (${count}*1.2)/1.2121,3) ;;
  html:
  {% if value > 0 %}
  <p><img src="https://findicons.com/files/icons/1018/pixelicious/32/up.png" height=10 width=10>{{ rendered_value }}</p>
  {% else %}
  <p><img src="https://findicons.com/files/icons/1688/web_blog/48/arrow_down.png" height=20 width=20>{{ rendered_value }}</p>
  {% endif %}
  ;;
}


  measure: count {
    type: count
    drill_fields: []
    filters: {
      field:  calltype_yn
      value: "yes"
    }
    #html:  {{value}} %{{unit_sequence_in_call_dispatch._rendered_value}} ;;

  }

  measure: mysum_test {
    type:  sum
    sql: CASE WHEN ${battalion} = 'B03' THEN ${number_of_alarms} ELSE NULL END ;;

  }

  measure: myavg_test {
    type:  average
    sql: CASE WHEN ${battalion} = 'B03' THEN ${number_of_alarms} ELSE NULL END ;;
    required_fields: [calltype_yn]
  }







}
