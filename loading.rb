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
    # check if customer has priority append that to the with array and if they are without then append to the without array
    if customer[3] == 'true'
      customers_with << customer[0]
    else
      customers_without << customer[0]
    end
  end
  customers = customers_with + customers_without
  return customers
end

def function(menu_selection, dispatched_customers) # menu_selection [String]
  customer = []
  dispatched_customers.each do |selected_customer|
    if selected_customer[0] == menu_selection
      customer = selected_customer
    end
  end
  puts "Sam has #{customer[1]} orders"
  input = gets "Do you wish to coninue?"
  return input
    # puts "sam has #{order_num} orders"
    # puts "do you wish to continue?"
end