connection: "mybqtets"


explore: query_kill_test{
  persist_for: "0 seconds"
}


view: query_kill_test {
  derived_table: {
    sql: SELECT sleep(10) as test_sleep  ;;
  }

  dimension: sleep {
    type: number
    sql: ${TABLE}.test_sleep ;;
  }

}
