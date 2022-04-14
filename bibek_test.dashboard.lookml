- dashboard: new_dashboard
  title: New Dashboard
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  elements:

  - title: Untitled
    name: Untitled
    model: david_c_ecom
    explore: order_items
    type: looker_column
    fields: [users.gender, users.count]
    sorts: [users.count desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    row: 0
    col: 0
    width: 8
    height: 6
  - title: Untitled
    name: Untitled (2)
    model: david_c_ecom
    explore: order_items
    type: looker_grid
    fields: [users.first_name, users.email, users.country, users.city, users.state]
    sorts: [users.first_name]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    defaults_version: 1
    series_types: {}
    row: 0
    col: 8
    width: 8
    height: 6
  - name: add_a_unique_name_1648447730
  title: Untitled Visualization
  model: david_c_ecom
  explore: order_items
  type: looker_grid
  fields: [orders.status, orders.count]
  sorts: [orders.count desc]
  limit: 500
  show_view_names: false
  show_row_numbers: true
  transpose: false
  truncate_text: true
  hide_totals: false
  hide_row_totals: false
  size_to_fit: true
  table_theme: white
  limit_displayed_rows: false
  enable_conditional_formatting: false
  header_text_alignment: left
  header_font_size: 12
  rows_font_size: 12
  conditional_formatting_include_totals: false
  conditional_formatting_include_nulls: false
  series_types: {}
  defaults_version: 1
