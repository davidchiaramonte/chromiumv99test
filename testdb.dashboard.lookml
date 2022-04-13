- dashboard: dbdbd
  title: dbdbd
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: dbdbd
    name: dbdbd
    model: david_c_ecom
    explore: order_items
    type: looker_grid
    fields: [orders.id, orders.created_date, users.id, users.city, users.state, products.count,
      order_items.count]
    sorts: [orders.created_date desc]
    limit: 10
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    truncate_column_names: false
    defaults_version: 1
    series_types: {}
    column_order: ["$$$_row_numbers_$$$", orders.created_date, orders.id, users.city,
      products.count, users.id, users.state, order_items.count]
    listen: {}
    row: 0
    col: 0
    width: 24
    height: 12
