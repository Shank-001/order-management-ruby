# $LOAD_PATH << '.'

module User
  def select_user_operation
    puts "\n------User Dashboard------"
    puts "\n1. Show items\n2. Place order\n3. Cancel order\n4. Order details\n0. Logout"
    print "\nSelect operation: "
    choice = gets.to_i
    case choice
    when 1
      show_items
      select_user_operation
    when 2
      place_order
      select_user_operation
    when 3
      cancel_order
      select_user_operation
    when 4
      get_order_details
      select_user_operation
    when 0
      # Logout
    else
      puts "Invalid Selection! Please try again."
      select_user_operation
    end
  end
  
  def show_items
    puts "\nItems list: "
    $items.each do |item|
      item.each do |key, value|
        puts "#{key} : #{value}"
      end
    end
  end
  
  @@no_of_order = 0
  def place_order
    print "\nChoose your order (using key): "
    key = gets.to_i
    set_order_details(key)
    # Getting choice from user.
    # choice = gets.to_i
    # case choice
    # when 1
    #   puts "Order placed for #{$items[0].values}."
    #   @@no_of_order += 1
    # when 2
    #   puts "Order placed for #{$items[1].values}."
    #   @@no_of_order += 1
    # when 3
    #   puts "Order placed for #{$items[2].values}."
    #   @@no_of_order += 1
    # when 4
    #   puts "Order placed for #{$items[3].values}."
    #   @@no_of_order += 1
    # when 5
    #   puts "Order placed for #{$items[4].values}."
    #   @@no_of_order += 1
    # else
    #   puts "Invalid Selection! Please try again."
    #   place_order
    # end
    
    puts 'Do you want to place more order: (Y[es]/N[o])'
    choice1 = gets.chomp
    # if choice1 == ('Y' || 'y')        --Wrong Login/Syntax--
    # if choice1 == 'Y' || choice1 ==  'y'      --Valid Logic/Syntax--
    if %w[Y y].include?(choice1)
      place_order
    else
      puts "Number of Orders: #{@@no_of_order}"
    end
  end
  
  
  def cancel_order
    print "\nEnter the product key that you want to cancel: "
    key = gets.to_i
    @@no_of_order -= 1
    puts "Order cancelled successfully."
  end

  def set_order_details(key)
    @@no_of_order += 1
    product_detail = $items.each(key) {|item| item}
    $order_details.push(product_detail)
  end

  def get_order_details
    puts "My orders: "
    $order_details.each do |product_detail|
      product_detail.each do |key, value|
        puts "#{key} : #{value}"
      end
    end
    puts "Number of Orders: #{@@no_of_order}"
    puts 
  end
end
