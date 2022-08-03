$LOAD_PATH << '.'
require 'product'
require 'order'

module Admin
  def select_admin_operation
    puts "\n------Admin Dashboard------"
    puts "\n1. Add item
          \n2. Remove item
          \n3. Show items
          \n4. Update item
          \n5. Order details (Coming soon...)
          \n6. Show user database (Coming soon...)
          \n0. Logout"
    print "\nSelect operation: "
    choice = gets.to_i
    case choice
    when 1
      add_item
      select_admin_operation
    when 2
      remove_item
      select_admin_operation
    when 3
      Product.read
      select_admin_operation
    when 4
      update_item
      select_admin_operation
    # when 5
    #   Order.get_order_details
    #   select_admin_operation
    # when 6
    #   show_user_database
    #   select_admin_operation
    when 0
      # Logout
    else
      puts 'Invalid Selection! Please try again.'
      select_admin_operation
    end
  end

  def add_item
    print "\nEnter Product Name: "
    name = gets.chomp
    print "Enter #{name} price: "
    price = gets.to_i
    print "Enter #{name} quantity: "
    quantity = gets.to_i
    if name.empty? || price == 0 || quantity == 0
      puts "\nInvalid inputs. Please fill valid details."
      add_item
    else
      Product.create(name, price, quantity)
      puts "\nProduct added successfully."
    end
    puts "\nDo you want to add more: (Y[es]/N[o])"
    choice = gets.chomp
    add_item if %w[Y y].include?(choice)
  end

  def remove_item
    print "\nEnter the product name: "
    name = gets.chomp
    print 'Enter the quantity to be removed: '
    quantity = gets.to_i
    Product.delete(name, quantity)
    puts "\nSuccessfully removed #{quantity} #{name}."
  end

  def update_item
    print "\nEnter item name you want to update: "
    name = gets.chomp
    print "How many #{name} you want to add: "
    quantity = gets.to_i
    Product.update(name, quantity)
    puts "Added #{quantity} #{name} in stock successfully."
  end

  # def show_user_database
  #   unless $user_database.empty?
  #     # $user_database.each do |user_detail|
  #     #   print "* #{user_detail}"
  #     # end
  #     puts $user_database
  #   else
  #     puts "No user found. Database is empty."
  #   end
  # end
end
