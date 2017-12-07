- dashboard: shared_space_dashboard
  title: Shared Space Dashboard
  layout: newspaper
  elements:
  - title: New Tile
    name: New Tile
    model: smevening_project
    explore: sffd_service_calls
    type: table
    fields:
    - sffd_service_calls.available_timestamp_quarter
    - sffd_service_calls.count
    - sffd_service_calls.neighborhood_district
    sorts:
    - sffd_service_calls.available_timestamp_quarter desc
    limit: 500
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    row: 0
    col: 0
    width: 7
    height: 8
  - name: count by battalion
    title: count by battalion
    model: smevening_project
    explore: sffd_service_calls
    type: looker_column
    fields:
    - sffd_service_calls.battalion
    - sffd_service_calls.count
    sorts:
    - sffd_service_calls.battalion
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
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    row: 0
    col: 7
    width: 8
    height: 7
