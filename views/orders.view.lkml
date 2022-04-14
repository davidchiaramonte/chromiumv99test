view: orders {
  sql_table_name: demo_db.orders ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: sample {
    type: string
    sql: UPPER(RIGHT(${TABLE}.status,3)) ;;
  }



  dimension_group: created {
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
    sql: ${TABLE}.created_at ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }


  dimension: html_legend {
    type: string
    html: <font size=4px>{{ value }}</font>;;
    sql: ${TABLE}.status ;;
  }

  parameter: dynamic_measure_selector {
    type: unquoted
    allowed_value: {
      label: "Sum"
      value: "sum"
    }
    allowed_value: {
      label: "Average"
      value: "average"
    }
    allowed_value: {
      label: "Count"
      value: "count"
    }

  }

  measure: count {
    type: count
    filters: [created_date: "before tomorrow"]
    drill_fields: [detail*]
  }

  measure: sum {
    type: sum
    sql: ${user_id} ;;
  }

  measure: average {
    type: average
    sql: ${user_id} ;;
  }

  measure: dynamic_measure {
    type: number
    description: "Must be used with KPI Selector from Custom Filters. Defaults to Net Sales"
    group_label: "KPI"
    group_item_label: "KPI - CP"
    value_format_name: decimal_0
    # label: "{% if dynamic_measure_selector._parameter_value == 'count' %}Count
    # {% elsif dynamic_measure_selector._parameter_value == 'average' %}Average
    # {% elsif dynamic_measure_selector._parameter_value == 'sum' %}Sum
    # {% endif %}"
    label_from_parameter: dynamic_measure_selector
    sql:
    {% if dynamic_measure_selector._parameter_value == 'count' %} ${count}
    {% elsif dynamic_measure_selector._parameter_value == 'sum' %} ${sum}
    {% elsif dynamic_measure_selector._parameter_value == 'average' %} ${average}
    {% endif %};;
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      users.id,
      users.first_name,
      users.last_name,
      billion_orders.count,
      fakeorders.count,
      hundred_million_orders.count,
      hundred_million_orders_wide.count,
      order_items.count,
      ten_million_orders.count
    ]
  }
}
