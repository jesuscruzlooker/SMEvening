connection: "mybqtets"


explore: query_kill_test{
  persist_for: "0 seconds"
}


view: query_kill_test {
  derived_table: {
    sql:select sleep(10) as sleep  ;;
  }

  dimension: sleep {
    type: number
    sql: ${TABLE}.sleep ;;
  }

}
