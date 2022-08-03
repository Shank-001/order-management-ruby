$LOAD_PATH << '.'
require 'product'
require 'order'

module User
  # USER_BASE = []

  def select_user_operation
    puts "\n------User Dashboard------"
    puts "\n1. Show items
          \n2. Buy Product
          \n3. Cancel order
          \n4. Order details (Coming soon...)
          \n0. Logout"
    print "\nSelect operation: "
    choice = gets.to_i
    case choice
    when 1
      Product.read
      select_user_operation
    when 2
      buy_product
      select_user_operation
    when 3
      cancel_order
      select_user_operation
    # when 4
    #   User.get_order_details
    #   select_user_operation
    when 0
      # Logout
    else
      puts 'Invalid Selection! Please try again.'
      select_user_operation
    end
  end

  def buy_product
    print "\nEnter item name you want to buy: "
    name = gets.chomp
    print "How many #{name} you want to buy: "
    quantity = gets.to_i
    Order.place_order(name, quantity)
    Product.delete(name, quantity)
    # No of orders += 1
    puts "Order placed for #{quantity} #{name} successfully. :)"
    puts "\nDo you want to place more order: (Y[es]/N[o])"
    choice = gets.chomp
    # if choice == ('Y' || 'y')        --Wrong Login/Syntax--
    # if choice == 'Y' || choice ==  'y'      --Valid Logic/Syntax--
    buy_product if %w[Y y].include?(choice)
  end

  def cancel_order
    print "\nEnter item name you want to cancel: "
    name = gets.chomp
    print "How many #{name} you want to cancel: "
    quantity = gets.to_i
    Product.update(name, quantity)
    # Update order details   # Coming soon...
    Order.generate_bill(price, quantity)
    puts "Order cancelled for #{quantity} #{name} successfully."
  end
end
