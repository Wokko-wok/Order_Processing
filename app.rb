require 'csv'
require 'tty-prompt'
require_relative './loading'

prompt = TTY::Prompt.new
menu = 'Home'

loop do
  # make csv into an array of hashes
  table = CSV.open('orders.csv', headers: true)
  table_array = []
  table.each do |line|
    table_array << [line['Name'], line['NumOrders'], line['Status'], line['Priority']]
  end

  pending_orders_arr = get_pending_customers(table_array)
  started_orders_arr = get_started_customers(table_array)
  dispatched_orders_arr = get_dispatched_customers(table_array)

  case menu
  when 'Home'
    menu = prompt.select(
      'What would you like to do?',
      [
        'View Pending Orders',
        'View Started Orders',
        'View Dispatched Orders',
        'Exit'
      ], cycle: true
    )
  when 'View Pending Orders'
    create_customers = create_customers(pending_orders_arr)
    menu = prompt.select(
      'Select a customer', create_customers, 'Return', cycle: true
    )
    if menu != 'Return'
      orderinf(menu, pending_orders_arr)
      if confirmation == 'Y'
        change_status(menu, table_array)
        save_changes(table_array)
      end
      menu = 'Return'
    end
  when 'View Started Orders'
    create_customers = create_customers(started_orders_arr)
    menu = prompt.select(
      'Select a customer', create_customers, 'Return'
    )
    if menu != 'Return'
      orderinf(menu, started_orders_arr)
      if confirmation == 'Y'
        change_status(menu, table_array)
        save_changes(table_array)
      end
      menu = 'Return'
    end
  when 'View Dispatched Orders'
    create_customers = create_customers(dispatched_orders_arr)
    menu = prompt.select(
      'Select a customer', create_customers, 'Return'
    )
    if menu != 'Return'
      orderinf(menu, dispatched_orders_arr)
      menu = 'Return'
    end
  when 'Return'
    menu = 'Home'

  when 'Exit'
    break
  end
end