- dashboard: padawan_dashboard
  title: Padawan Dashboard
  layout: newspaper
  elements:
  - title: New Tile
    name: New Tile
    model: smevening_project
    explore: sffd_service_calls
    type: looker_column
    fields:
    - sffd_service_calls.count
    - sffd_service_calls.available_timestamp_date
    filters:
      sffd_service_calls.available_timestamp_date: last year
    sorts:
    - sffd_service_calls.available_timestamp_date desc
    limit: 500
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    listen:
      Battalion: sffd_service_calls.battalion
    row: 0
    col: 0
    width: 19
    height: 6
  - name: padawanlook
    title: padawanlook
    model: smevening_project
    explore: sffd_service_calls
    type: looker_column
    fields:
    - sffd_service_calls.count
    - sffd_service_calls.available_timestamp_date
    filters:
      sffd_service_calls.available_timestamp_date: last year
      sffd_service_calls.battalion: ''
    sorts:
    - sffd_service_calls.available_timestamp_date desc
    limit: 500
    column_limit: 50
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    row: 6
    col: 0
    width: 8
    height: 6
  - name: padawanlook2
    title: padawanlook2
    model: smevening_project
    explore: sffd_service_calls
    type: looker_column
    fields:
    - sffd_service_calls.count
    - sffd_service_calls.available_timestamp_date
    filters:
      sffd_service_calls.available_timestamp_date: last year
      sffd_service_calls.battalion: ''
    sorts:
    - sffd_service_calls.available_timestamp_date desc
    limit: 500
    column_limit: 50
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    row: 6
    col: 8
    width: 8
    height: 6
  filters:
  - name: Battalion
    title: Battalion
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: smevening_project
    explore: sffd_service_calls
    listens_to_filters: []
    field: sffd_service_calls.battalion
  - name: Second
    title: Second
    type: string_filter
    default_value: ''
    allow_multiple_values: true
    required: false
