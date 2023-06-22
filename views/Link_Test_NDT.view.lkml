# If necessary, uncomment the line below to include explore_source.
# include: "arturo_thelook.model.lkml"

view: link_test_ndt {
  derived_table: {
    explore_source: users {
      column: id {}
      column: age {}
      column: city {}
      column: first_name {}
      column: average_age {}
    }
  }
  dimension: id {
    primary_key: yes
    description: ""
    type: number
  }
  dimension: age {
    description: ""
    type: string
  }
  dimension: city {
    description: ""
    type: string
  }
  dimension: first_name {
    description: ""
    type: string
  }
  dimension: average_age {
    description: ""
    type: number
  }
  measure: test_link {
    type: number
    label: "Link Test"
    drill_fields: [average_age]
    link: {
      label: "link_to_the_dashboard_with_filters"
      url: "https://gcpl236.cloud.looker.com/dashboards/348?city={{ _filters['link_test_ndt.city'] | url_encode }}"
    }
    link: {
      label: "link_to_the_look_with_filters"
      url: "https://gcpl236.cloud.looker.com/looks/135?&f[link_test_ndt.city]={{ _filters['link_test_ndt.city'] | url_encode }}"
    }
    sql: ${average_age} ;;
  }
}
