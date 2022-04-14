view: order_items {
  sql_table_name: demo_db.order_items ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension_group: returned {
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
    sql: ${TABLE}.returned_at ;;
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }

# Bug test: Expand tables down render html and value format currently https://gcpm224.cloud.looker.com/dashboards/81
  measure: evol_sales_amount_wo_vat_eur{
    view_label: "2.1 - Supplier Details Measures"
    group_label: "Indicators in value without VAT in EUROS evolution / delta"
    label: "Evolution sales amount in value without VAT euros"
    description: "Sales amount evolution in value without VAT between current and previous period expressed in percent"
    type:number
    # sql:1.0*(${sales_amount_wo_vat_eur_current_period}-${sales_amount_wo_vat_eur_previous_period})/nullif(${sales_amount_wo_vat_eur_previous_period},0);;
    sql: ${TABLE}.sale_price ;;

    html: @{evol_color} ;;
    value_format_name: percent_format_1
  }

  measure: count {
    type: count
    drill_fields: [id, orders.id, inventory_items.id]
  }
}
