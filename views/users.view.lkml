view: users {
  sql_table_name: demo_db.users ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  parameter: measure_selector {
    type: unquoted
    allowed_value: {
      label: "count"
      value: "count"
    }
    allowed_value: {
      label: "count1"
      value: "count1"
    }
  }
  measure: dynamic_measure {
    label_from_parameter: measure_selector
    type: number
    value_format_name: eur
    sql:
      {% if measure_selector._parameter_value == "count" %} ${count}
      {% else %} ${count1}
      {% endif %};;
    html:
      {% if measure_selector._parameter_value == "count1" %} {{ count1._rendered_value }}
      {% else %} {{ count._rendered_value }}
      {% endif %} ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension_group: created {
    type: time
    view_label: "_PoP"
    timeframes: [
      raw,
      time,
      hour_of_day,
      date,
      day_of_week,
      day_of_week_index,
      day_of_month,
      day_of_year,
      week,
      week_of_year,
      month,
      month_name,
      month_num,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
    convert_tz: no
  }
  measure: date {
    type: date_time
    sql: ${created_time} ;;
    convert_tz: no
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: full_name {
    type: string
    sql: concat(${first_name}," ",${last_name}) ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }
  parameter: choose_breakdown {
    label: "Choose Grouping (Rows)"
    view_label: "_PoP"
    type: unquoted
    default_value: "Month"
    allowed_value: {label: "Month Name" value:"Month"}
    allowed_value: {label: "Day of Year" value: "DOY"}
    allowed_value: {label: "Day of Month" value: "DOM"}
    allowed_value: {label: "Day of Week" value: "DOW"}
    allowed_value: {value: "Date"}
  }

  parameter: choose_comparison {
    label: "Choose Comparison (Pivot)"
    view_label: "_PoP"
    type: unquoted
    default_value: "Year"
    allowed_value: {value: "Year" }
    allowed_value: {value: "Month"}
    allowed_value: {value: "Week"}
  }

  dimension: pop_row  {
    view_label: "_PoP"
    label_from_parameter: choose_breakdown
    type: string
    order_by_field: sort_by1 # Important
    sql:
    {% if choose_breakdown._parameter_value == 'Month' %} ${created_month_name}
    {% elsif choose_breakdown._parameter_value == 'DOY' %} ${created_day_of_year}
    {% elsif choose_breakdown._parameter_value == 'DOM' %} ${created_day_of_month}
    {% elsif choose_breakdown._parameter_value == 'DOW' %} ${created_day_of_week}
    {% elsif choose_breakdown._parameter_value == 'Date' %} ${created_date}
    {% else %}NULL{% endif %} ;;
  }

  dimension: pop_pivot {
    view_label: "_PoP"
    label_from_parameter: choose_comparison
    type: string
    order_by_field: sort_by2 # Important
    sql:
    {% if choose_comparison._parameter_value == 'Year' %} ${created_year}
    {% elsif choose_comparison._parameter_value == 'Month' %} ${created_month_name}
    {% elsif choose_comparison._parameter_value == 'Week' %} ${created_week}
    {% else %}NULL{% endif %} ;;
  }


  # These dimensions are just to make sure the dimensions sort correctly
  dimension: sort_by1 {
    hidden: yes
    type: number
    sql:
    {% if choose_breakdown._parameter_value == 'Month' %} ${created_month_num}
    {% elsif choose_breakdown._parameter_value == 'DOY' %} ${created_day_of_year}
    {% elsif choose_breakdown._parameter_value == 'DOM' %} ${created_day_of_month}
    {% elsif choose_breakdown._parameter_value == 'DOW' %} ${created_day_of_week_index}
    {% elsif choose_breakdown._parameter_value == 'Date' %} ${created_date}
    {% else %}NULL{% endif %} ;;
  }

  dimension: sort_by2 {
    hidden: yes
    type: string
    sql:
    {% if choose_comparison._parameter_value == 'Year' %} ${created_year}
    {% elsif choose_comparison._parameter_value == 'Month' %} ${created_month_num}
    {% elsif choose_comparison._parameter_value == 'Week' %} ${created_week}
    {% else %}NULL{% endif %} ;;
  }


  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }
  measure: count1 {
    type: number
    sql: ${age} ;;
    value_format_name: usd
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      first_name,
      last_name,
      events.count,
      orders.count,
      saralooker.count,
      sindhu.count,
      user_data.count
    ]
  }
}
