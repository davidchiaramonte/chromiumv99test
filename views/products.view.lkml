view: products {
  sql_table_name: demo_db.products ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }

  dimension: retail_price {
    type: number
    sql: ${TABLE}.retail_price ;;
  }

  # measure: usd {
  #   #hidden: yes
  #   type: average
  #   sql: ${retail_price} ;;
  #   value_format:"$0"
  # }
  # measure: eur {
  #   #hidden: yes
  #   type: average
  #   sql: ${retail_price} ;;
  #   value_format: "€0"
  # }
  measure: value_dec {
    hidden: yes
    type: average
    sql: ${retail_price} ;;
    value_format_name: decimal_0
  }
  measure: jtest {
    type: average
    sql: ${retail_price} ;;
    html: {% if category._value contains 'Socks' %}
    ${{rendered_value}}
    {% elsif category._value contains 'Suits' %}
    €{{rendered_value}}
    {% else %}
    {{value_dec._rendered_value}}
    {% endif %};;
  }



  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }

  measure: count {
    type: count
    drill_fields: [id, item_name, inventory_items.count]
  }
}
