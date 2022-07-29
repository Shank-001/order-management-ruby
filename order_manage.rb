#  OBSOLETE
$LOAD_PATH << '.'

require './place _order'

BEGIN {puts "--------------------Welcome to Sport's Mart!--------------------"}

class OrderManage
  include PlaceOrder
  puts "\nProduct List: "
  puts " 1. Shuttlecock\n 2. Racket\n 3. Net\n 4. Gum Shoe\n 5. Shorts\n 0. exit"
  @@no_of_order = 0

  OrderManage.new.placing_order

end
