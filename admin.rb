# $LOAD_PATH << '.'

module Admin
  $items = []
  $order_details = []

  def select_admin_operation
    puts "\n------Admin Dashboard------"
    puts "\n1. Add item\n2. Remove item\n3. Show items\n4. Order details\n0. Logout"
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
      show_items
      select_admin_operation
    when 4
      get_order_details
      select_admin_operation
    when 0
      # Logout
    else
      puts "Invalid Selection! Please try again."
      select_admin_operation
    end
  end

  @@product_id = 100
  def generate_product_id
    @@product_id += 1
  end

  def add_item
    puts "\nEnter Product Name: "
    item = { generate_product_id => gets.chomp }
    $items.push(item)
    puts 'Product added successfully.'
    puts 'Do you want to add more: (Y[es]/N[o])'
    choice = gets.chomp
    if %w[Y y].include?(choice)
      add_item
    else
      select_admin_operation
    end
  end
  
  # DOUBT: show_method of User module is called instead.
  # def show_items
  #   puts "\nItems list: "
  #   # puts $items
  #   $items.each do |elem|
  #     elem.each do |key, value|
  #       puts "#{key} : #{value}"
  #     end
  #   end
  # end
  
  def remove_item
    print "\nEnter the product key that you want to remove: "
    key = gets.to_i
    $items.each do |item|
      item.delete(key)
    end
    puts "Product removed successfully."
  end
  
  # def get_order_details
  #   # Coming soon...
  # end
  
  def send_order_detail
    # Coming soon...
  end
end
