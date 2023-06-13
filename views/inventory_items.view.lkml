# The name of this view in Looker is "Inventory Items"
view: inventory_items {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: demo_db.inventory_items ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Cost" in Explore.

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_cost {
    type: sum
    sql: ${cost} ;;
    link: {
      label: "Drill_cost"
      url:

      #"https://gcpl236.cloud.looker.com/explore/arturo_thelook/order_items?fields=inventory_items.created_date,inventory_items.average_cost,inventory_items.total_cost,orders.status,products.category&f[orders.status]=pending%2Ccomplete&f[products.category]=Jeans%2CAccessories%2CActive%2CDresses&sorts=inventory_items.created_date+desc,orders.status&limit=500&column_limit=50&query_timezone=UTC&vis=%7B%22show_view_names%22%3Afalse%2C%22show_row_numbers%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22size_to_fit%22%3Atrue%2C%22table_theme%22%3A%22white%22%2C%22limit_displayed_rows%22%3Afalse%2C%22enable_conditional_formatting%22%3Afalse%2C%22header_text_alignment%22%3A%22left%22%2C%22header_font_size%22%3A12%2C%22rows_font_size%22%3A12%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22hidden_pivots%22%3A%7B%7D%2C%22type%22%3A%22looker_grid%22%2C%22defaults_version%22%3A1%7D&filter_config=%7B%22orders.status%22%3A%5B%7B%22type%22%3A%22%3D%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22pending%2Ccomplete%22%7D%2C%7B%7D%5D%2C%22id%22%3A14%2C%22error%22%3Afalse%7D%5D%2C%22products.category%22%3A%5B%7B%22type%22%3A%22%3D%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22Jeans%2CAccessories%2CActive%2CDresses%22%7D%2C%7B%7D%5D%2C%22id%22%3A15%2C%22error%22%3Afalse%7D%5D%7D&origin=share-expanded"

      "https://gcpl236.cloud.looker.com/dashboards/322?Status=pending%2Ccomplete&Category=Jeans%2CAccessories%2CActive%2CDresses"
    }
  }

  measure: average_cost {
    type: average
    sql: ${cost} ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

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

  dimension: product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.product_id ;;
  }

  dimension_group: sold {
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
    sql: ${TABLE}.sold_at ;;
  }

  measure: count {
    type: count
    drill_fields: [id, products.id, products.item_name, order_items.count, order_items_vijaya.count]
  }
}
