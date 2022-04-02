def get_customers(table_array, status)
  customer_arr = []
  table_array.each do |order|
    if order[2] == status
      customer_arr << order
    end
  end
  return customer_arr
end

def create_customers(customers_arr)
  customers_with = []
  customers_without = []
  customers_arr.each.map do |customer|
    # check if customer has priority append that to the with array and
    # if they are without then append to the without array
    if customer[3] == 'true'
      customers_with << customer[0]
    else
      customers_without << customer[0]
    end
  end
  customers = customers_with + customers_without
  return customers
end

def orderinf(menu_selection, customers_listed)
  customer = []
  customers_listed.each do |selected_customer|
    if selected_customer[0] == menu_selection
      customer = selected_customer
    end
    # puts "#{name} has #{order_num} orders"
  end
  puts "#{menu_selection} has #{customer[1]} orders."
end

def confirmation
  begin
    puts Rainbow('Do you wish to continue? (Y/N)').red
    # gets in put form user (Y/N)
    input = gets.chomp.upcase
    raise(StandardError) unless %w[Y N].include?(input)
  rescue StandardError => _e
    puts 'Invalid input. Try again'
    retry
  end
  return input
end

def change_status(menu_selection, order_arr)
  # use name from menu_selection & find its postition in the order_arr
  row = order_arr.detect { |aa| aa.include?(menu_selection) }
  name_pos = [order_arr.index(row)].join.to_i
  # change 'status' value
  if order_arr [name_pos][2] == 'Pending'
    order_arr [name_pos][2] = 'Started'
  else
    order_arr [name_pos][2] = 'Dispatched'
  end
end

def save_changes(order_arr)
  # save table_array as new csv
  order_arr.unshift(['Name', 'NumOrders', 'Status', 'Priority'])
  array_to_write = order_arr.map(&:to_csv).join
  File.write('orders.csv', array_to_write)
end

def clear_screen
  system('clear')
  system('cls')
end
