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
          \n 5. Place order
          \n 6. Cancel order
          \n 7. Show my orders
          \n 0. Logout"
    print "\nSelect operation: "
    choice = gets.to_i
    case choice
    when 1
      Product.read
    when 2
      Cart.reading
    when 3
      add_to_cart
    when 4
      remove_from_cart
    when 5
      place_order
    when 6
      cancel_order
    when 7
      Order.read_order
    when 0
      Login.new.logout
    else
      puts 'Invalid Selection! Please try again.'
    end
    select_user_operation
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
    Product.update(name, nil, quantity)
    puts "Removed #{quantity} #{name} from cart successfully."
  end

  def place_order
    print "Press 1 to confirm the order or Press any key to exit: "
    choice = gets.to_i
    if choice == 1
      Order.add_order
      puts "Order placed successfully. :)"
    end
  end

  def cancel_order
    # Update order details   # Coming soon...
    Order.delete_order
    puts "Order cancelled successfully."
  end
end
