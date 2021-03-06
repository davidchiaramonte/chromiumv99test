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
      hour,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
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
    sql: ${TABLE}.sale_price/950 ;;

    html: @{evol_color} ;;
    value_format_name: percent_format_1
  }

  measure: count {
    type: count
    drill_fields: [id, orders.id, inventory_items.id]
  }

  measure: total_sale_price {
    type: sum
    sql: ${sale_price} ;;
    value_format: "€#,###.00;(€#,###.00)"
  }
  measure: measure_sum {
    type: number
    sql: ${sale_price}+${count}+${evol_sales_amount_wo_vat_eur} ;;
  }
  parameter: timeframe_picker {
    label: "Date Granularity"
    type: string
    allowed_value: { value: "Hour" }
    allowed_value: { value: "Date" }
    allowed_value: { value: "Week" }
    allowed_value: { value: "Month" }
  }

  dimension: dynamic_timeframe {
    type: date_time
    sql:
    CASE
    WHEN {% parameter timeframe_picker %} = 'Hour' THEN ${returned_hour}
    WHEN {% parameter timeframe_picker %} = 'Date' THEN ${returned_date}
    WHEN {% parameter timeframe_picker %} = 'Week' THEN ${returned_week}
    WHEN {% parameter timeframe_picker %} = 'Month' THEN ${returned_month}
    END ;;
  }
}
