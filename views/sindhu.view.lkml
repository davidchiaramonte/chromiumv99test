view: sindhu {
  sql_table_name: demo_db.sindhu ;;

  dimension: balance {
    type: number
    sql: ${TABLE}.balance ;;
    drill_fields: [time_ref]
  }

  dimension: balance_lag {
    type: number
    sql: ${TABLE}.balance_lag ;;
  }

  dimension: funding_amount {
    type: number
    sql: ${TABLE}.funding_amount ;;
  }

  dimension_group: funding {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      second
    ]
    sql: ${TABLE}.funding_time ;;
  }

  dimension: time_ref {
    # datatype: timestamp
    datatype: timestamp
    type: date_time
    sql: CAST(${TABLE}.funding_time as DATETIME) ;;
    html: {{rendered_value | date:"%m/%d/%Y %H:%M"}} ;;
  }

  dimension: p_key {
    type: number
    sql: ${TABLE}.p_key ;;
  }

  dimension: purchase_key {
    type: number
    sql: ${TABLE}.purchase_key ;;
  }

  dimension: purchase_key_temp {
    type: number
    sql: ${TABLE}.purchase_key_temp ;;
  }

  dimension_group: purchase {
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
    sql: ${TABLE}.purchase_time ;;
  }

  dimension: spotme_purchase_amount {
    type: number
    sql: ${TABLE}.spotme_purchase_amount ;;
    link: {
      label: "linking"
      url: "{{count._link}}"
    }

    # link: {
    #   label: "linking"
    #   url: "{{count._link}}"
    # }

  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [users.id, users.first_name, users.last_name]
  }

  measure: dummy {
    type: sum
    sql: 0;;
    drill_fields: [users.id, users.first_name, users.last_name]
  }

}
