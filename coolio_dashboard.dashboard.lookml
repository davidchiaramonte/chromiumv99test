- dashboard: coolio_dashboard
  title: Coolio Dashboard
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  elements:
  - title: Coolio Dashboard
    name: Coolio Dashboard
    model: david_c_ecom
    explore: order_items
    type: looker_grid
    fields: [order_items.total_sale_price]
    limit: 500
    listen:
      Status: orders.status
      Category Name: products.category
    row:
    col:
    width:
    height:
  filters:
  - name: Status
    title: Status
    type: field_filter
    default_value: pending
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
      options: []
    model: david_c_ecom
    explore: order_items
    listens_to_filters: []
    field: orders.status
  - name: Category Name
    title: Category Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: david_c_ecom
    explore: order_items
    listens_to_filters: []
    field: products.category
