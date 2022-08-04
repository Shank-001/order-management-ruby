$LOAD_PATH << '.'
require 'product'
require 'order'
require 'cart'

module User
  def select_user_operation
    puts "\n------User Dashboard------"
    puts "\n 1. Show items
          \n 2. Show my cart
          \n 3. Add to cart
          \n 4. Remove from cart
          \n 5. Buy Product (Coming soon...)
          \n 6. Cancel order (Coming soon...)
          \n 7. Order details (Coming soon...)
          \n 0. Logout"
    print "\nSelect operation: "
    choice = gets.to_i
    case choice
    when 1
      Product.read
      select_user_operation
    when 2
      Cart.reading
      select_user_operation
    when 3
      add_to_cart
      select_user_operation
    when 4
      remove_from_cart
      select_user_operation
    # when 5
    #   buy_product
    #   select_user_operation
    # when 6
    #   cancel_order
    #   select_user_operation
    # when 7
    #   User.get_order_details
    #   select_user_operation
    when 0
      # Logout
    else
      puts 'Invalid Selection! Please try again.'
      select_user_operation
    end
  end

  def add_to_cart
    print "\nEnter item name you want to add to cart: "
    name = gets.chomp
    print "How many #{name} you want to add to cart: "
    quantity = gets.to_i
    Product.delete(name, quantity)
    Cart.adding(name, quantity)
    puts "Added #{quantity} #{name} to cart successfully. :)"
    puts "\nDo you want to add more items: (Y[es]/N[o])"
    choice = gets.chomp
    # if choice == ('Y' || 'y')        --Wrong Login/Syntax--
    # if choice == 'Y' || choice ==  'y'      --Valid Logic/Syntax--
    add_to_cart if %w[Y y].include?(choice)
  end

  def remove_from_cart
    print "\nEnter item name you want to remove from cart: "
    name = gets.chomp
    print "How many #{name} you want to remove from cart: "
    quantity = gets.to_i
    Cart.deleting(name, quantity)
    Product.update(name, quantity)
    puts "Removed #{quantity} #{name} from cart successfully."
  end

  def buy_product
    print "\nEnter item name you want to buy: "
    name = gets.chomp
    print "How many #{name} you want to buy: "
    quantity = gets.to_i
    Order.place_order(name, quantity)
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
