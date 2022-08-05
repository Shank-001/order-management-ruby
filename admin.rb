$LOAD_PATH << '.'
require 'product'
require 'order'

module Admin
  def select_admin_operation
    puts "\n------Admin Dashboard------"
    puts "\n 1. Add item
          \n 2. Show items
          \n 3. Update item
          \n 4. Remove item
          \n 5. Order details
          \n 0. Logout"
    print "\nSelect operation: "
    choice = gets.to_i
    case choice
    when 1
      add_item
    when 2
      Product.read
    when 3
      update_item
    when 4
      remove_item
    when 5
      Order.read_order
    when 0
      Login.new.logout
    else
      puts 'Invalid Selection! Please try again.'
    end
    select_admin_operation
  end

  def add_item
    print "\nEnter Product Name: "
    name = gets.strip
    print "Enter #{name} price: "
    price = gets.to_i
    print "Enter #{name} quantity: "
    quantity = gets.to_i
    if name.empty? || price == 0 || quantity == 0
      puts "\nInvalid inputs. Please fill valid details."
      add_item
    else
      Product.create(name, price, quantity)
    end
    puts "\nProduct added successfully."
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
    Product.update(name, nil, quantity)
    puts "\nAdded #{quantity} #{name} in stock successfully."
  end
end
