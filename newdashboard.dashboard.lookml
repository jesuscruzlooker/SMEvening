- dashboard: merge_with_sort
  title: Merge with Sort
  layout: newspaper
  elements:
  - name: loook with date
    title: loook with date
    model: testing_bare
    explore: sffd_service_calls
    type: table
    fields:
    - sffd_service_calls.available_timestamp_date
    fill_fields:
    - sffd_service_calls.available_timestamp_date
    sorts:
    - sffd_service_calls.available_timestamp_date desc
    limit: 500
    query_timezone: America/Los_Angeles
    listen:
      field on date: sffd_service_calls.on_scene_timestamp_date
    row: 8
    col: 0
    width: 8
    height: 6
  filters:
  - name: field on date
    title: field on date
    type: field_filter
    default_value: 7 days
    allow_multiple_values: true
    required: false
    model: smevening_project
    explore: sffd_service_calls
    listens_to_filters: []
    field: sffd_service_calls.on_scene_timestamp_date
