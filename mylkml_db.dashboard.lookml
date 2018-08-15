- dashboard: padawan_dashboard
  title: Padawan Dashboard
  layout: newspaper
  embed_style:
    background_color: "#f6f8fa"
    show_title: true
    title_color: "#3a4245"
    show_filters_bar: true
    tile_text_color: "#3a4245"
    text_tile_text_color: ''
#    show_filters_bar: false
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
    hidden_fields: []
    y_axes: []
    listen:
      Battalion: sffd_service_calls.battalion
    row: 0
    col: 0
    width: 19
    height: 6
  - title: New Tile 2
    name: New Tile 2
    model: smevening_project
    explore: sffd_service_calls
    type: single_value
    fields:
    - sffd_service_calls.battalion
    filters:
      sffd_service_calls.available_timestamp_date: last year
    sorts:
    - sffd_service_calls.battalion
    limit: 500
    column_limit: 50
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
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
    hidden_fields: []
    y_axes: []
    single_value_title: ''
    listen:
      Battalion: sffd_service_calls.battalion
    row: 6
    col: 16
    width: 8
    height: 6
  - name: padawanlook
    title: padawanlook
    model: smevening_project
    explore: sffd_service_calls
    type: table
    fields:
    - sffd_service_calls.count
    - sffd_service_calls.available_timestamp_date
    - sffd_service_calls.battalion
    filters:
      sffd_service_calls.available_timestamp_date: last year
      sffd_service_calls.battalion: ''
    sorts:
    - sffd_service_calls.available_timestamp_date desc
    limit: 500
    column_limit: 50
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    hidden_fields: []
    y_axes: []
    row: 6
    col: 8
    width: 8
    height: 6
  - name: padawanlook 2
    title: padawanlook 2
    model: smevening_project
    explore: sffd_service_calls
    type: table
    fields:
    - sffd_service_calls.count
    - sffd_service_calls.available_timestamp_date
    - sffd_service_calls.battalion
    filters:
      sffd_service_calls.available_timestamp_date: last year
    sorts:
    - sffd_service_calls.available_timestamp_date desc
    limit: 500
    column_limit: 50
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    hidden_fields: []
    y_axes: []
    listen:
      Battalion: sffd_service_calls.battalion
    row: 6
    col: 0
    width: 8
    height: 6
  filters:
  - name: Battalion
    title: Battalion
    type: string_filter
    default_value: ''
    allow_multiple_values: true
    required: false
  - name: Second
    title: Second
    type: string_filter
    default_value: ''
    allow_multiple_values: true
    required: false
