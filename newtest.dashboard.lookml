-dashboard: add_a_unique_name_1524771148
title: Untitled Visualization
model: km
explore: accounts_type
type: table
fields: [total_accounts.calendar_Month, total_accounts.total_accounts, activations.activation,
  closed.closed, active_Users_30_days.paidusers, open_accounts.open_accounts, deposit_fee_count.deposit_fees,
  instantpay.count, etransfer.count, atm_count.ATM_Count, pos.POS, foreign_exchange.foreign_exchange,
  deposit_fee_count.volume_of_desposit, instantpay.total_instant_paid, atm_revenue_volume.atm_revenue,
  funds_spent_via_pos.funds_spent_via_pos, funds_withdrawn_from_atm.funds_withdrawn_from_atm,
  etransfer.etf_fund, total_funds_loaded.Funds_loaded, total_funds_unloaded.Funds_Unloaded,
  foreign_exchange_volume.foreign_exchange_volume, etransfer.revenue, zoompass_total_purchase_revenue.total_purchase_revenue,
  carta_total_purchase_revenue.Total_Purchase_Revenue, credit_voucher.credit_voucher_count,
  credit_voucher.credit_voucher_fund, total_funds_loaded_daily.amount, total_funds_loaded_daily.count,
  total_funds_loaded_instant.amount, total_funds_loaded_instant.count, funds_pos_return.sumfunds_pos_return]
sorts: [total_accounts.calendar_Month]
limit: 500
column_limit: 50
dynamic_fields:
- table_calculation: calendar_month
  label: Calendar Month
  expression: "${total_accounts.calendar_Month}"
  value_format:
  value_format_name:
  _kind_hint: dimension
  _type_hint: string
- table_calculation: monthly_signup
  label: Monthly Signup
  expression: "${total_accounts.total_accounts}"
  value_format:
  value_format_name: decimal_0
  _kind_hint: dimension
  _type_hint: number
- table_calculation: monthly_activations
  label: Monthly Activations
  expression: "${activations.activation}"
  value_format:
  value_format_name: decimal_0
  _kind_hint: dimension
  _type_hint: number
- table_calculation: monthly_active_earners_30_days
  label: Monthly Active Earners - 30 Days
  expression: "${active_Users_30_days.paidusers}"
  value_format:
  value_format_name: decimal_0
  _kind_hint: dimension
  _type_hint: number
- table_calculation: monthly_closed_accounts
  label: Monthly Closed accounts
  expression: "${closed.closed}"
  value_format:
  value_format_name: decimal_0
  _kind_hint: dimension
  _type_hint: number
- table_calculation: monthly_open_accounts
  label: Monthly Open Accounts
  expression: "${open_accounts.open_accounts}"
  value_format:
  value_format_name: decimal_0
