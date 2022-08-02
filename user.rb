$LOAD_PATH << '.'
require 'product'
require 'order'

module User
  extend Product
  extend Order

  $user_database = []

  def select_user_operation
    puts "\n------User Dashboard------"
    puts "\n1. Show items\n2. Place order\n3. Cancel order\n4. Order details\n0. Logout"
    print "\nSelect operation: "
    choice = gets.to_i
    case choice
    when 1
      User.show_items
      select_user_operation
    when 2
      User.place_order
      select_user_operation
    when 3
      User.cancel_order
      select_user_operation
    when 4
      User.get_order_details
      select_user_operation
    when 0
      # Logout
    else
      puts 'Invalid Selection! Please try again.'
      select_user_operation
    end
  end
end

