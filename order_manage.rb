# $LOAD_PATH << '.'

require_relative '/home/rails/order-management/place _order.rb'

# # BEGIN {puts "Welcome to Sport's Mart!"}

class OrderManage
  include PlaceOrder
  puts "\nProduct List: "
  puts " 1. Shuttlecock\n 2. Racket\n 3. Net\n 4. Gum Shoe\n 5. Shorts\n 0. exit"
  @@no_of_order = 0

  puts "Number of Orders: #{@@no_of_order}"
end
