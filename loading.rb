def get_pending_customers(table_array)
  # iterate over table and append to a new array all of the customers with the completed attribute.
  pending_customers = []
  table_array.each do |order|
    if order[2] == 'Pending'
      pending_customers << order
    end
  end
  return pending_customers
end

def get_started_customers(table_array)
  # iterate over table and append to a new array all of the customers with the completed attribute.
  started_customers = []
  table_array.each do |order|
    if order[2] == 'Started'
      started_customers << order
    end
  end
  return started_customers
end

def get_dispatched_customers(table_array)
  # iterate over table and append to a new array all of the customers with the completed attribute.
  dispatched_customers = []
  table_array.each do |order|
    if order[2] == 'Dispatched'
      dispatched_customers << order
    end
  end
  return dispatched_customers
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
    puts 'Do you wish to continue? (Y/N)'
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
  # save table_array as new csv
end

def save_changes(order_arr)
  order_arr.unshift(['Name', 'NumOrders', 'Status', 'Priority'])
  array_to_write = order_arr.map(&:to_csv).join
  File.write('orders.csv', array_to_write)
end
