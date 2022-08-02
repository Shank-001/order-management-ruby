$LOAD_PATH << '.'
require 'product'
require 'order'

module Admin
  extend Product
  extend Order

  $items = []
  $order_details = []

  def select_admin_operation
    puts "\n------Admin Dashboard------"
    puts "\n1. Add item\n2. Remove item\n3. Show items\n4. Order details\n5. Show user database\n0. Logout"
    print "\nSelect operation: "
    choice = gets.to_i
    case choice
    when 1
      Admin.add_item
      select_admin_operation
    when 2
      Admin.remove_item
      select_admin_operation
    when 3
      Admin.show_items
      select_admin_operation
    when 4
      Admin.get_order_details
      select_admin_operation
    when 5
      show_user_database
      select_admin_operation
    when 0
      # Logout
    else
      puts 'Invalid Selection! Please try again.'
      select_admin_operation
    end
  end

  def show_user_database
    unless $user_database.empty?
      # $user_database.each do |user_detail|
      #   print "* #{user_detail}"
      # end
      puts $user_database
    else
      puts "No user found. Database is empty."
    end
  end
end
