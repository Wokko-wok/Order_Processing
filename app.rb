require 'csv'
require 'tty-prompt'
require 'rainbow'
require_relative './loading'

prompt = TTY::Prompt.new(active_color: :cyan)
menu = 'Home'

loop do
  # make csv into an array of hashes
  table = CSV.open('orders.csv', headers: true)
  table_array = []
  table.each do |line|
    table_array << [line['Name'], line['NumOrders'], line['Status'], line['Priority']]
  end

  pending_orders_arr = get_customers(table_array, 'Pending')
  started_orders_arr = get_customers(table_array, 'Started')
  dispatched_orders_arr = get_customers(table_array, 'Dispatched')

  case menu
  when 'Home'
    clear_screen
    menu = prompt.select(
      Rainbow('What would you like to do?').green,
      [
        'View Pending Orders',
        'View Started Orders',
        'View Dispatched Orders',
        'Exit'
      ], cycle: true
    )
  when 'View Pending Orders'
    clear_screen
    create_customers = create_customers(pending_orders_arr)
    menu = prompt.select(
      Rainbow('Select a customer: ').green, create_customers, 'Return', cycle: true
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
    clear_screen
    create_customers = create_customers(started_orders_arr)
    menu = prompt.select(
      Rainbow('Select a customer: ').green, create_customers, 'Return', cycle: true
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
    clear_screen
    create_customers = create_customers(dispatched_orders_arr)
    menu = prompt.select(
      Rainbow('Select a customer: ').green, create_customers, 'Return', cycle: true
    )
    if menu != 'Return'
      orderinf(menu, dispatched_orders_arr)
      printf Rainbow("press any key to continue \n").darkgray
      $stdin.getch
      menu = 'Return'
    end
  when 'Return'
    menu = 'Home'

  when 'Exit'
    break
  end
end
