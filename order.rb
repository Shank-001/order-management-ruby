$LOAD_PATH << '.'
require 'cart'

class Order
  class << self
    # Here all methods are Class methods

    def add_order
      if Cart::CART.empty?
        puts "\nNothing to order. Your cart is empty!"
      else
        @Orders = Cart::CART.clone
        Cart::CART.clear
      end
    end

    def read_order
      puts "\n--Orders Details--"
      total_amount = 0
      if @Orders.nil? || @Orders.empty?
        puts "\nNo order details found."
      else
        puts "\nId   | Name     | Amount     | Quantity"
        @Orders.each do |item|
          puts "-#{item.id}-  | #{item.name}    | Rs.#{item.amount}     | #{item.quantity}"
          total_amount += item.amount
        end
        puts "\nTotal order amount: Rs.#{total_amount}"
      end
    end

    def delete_order
      if @Orders.empty?
        puts "\nNothing to cancel. You do not have placed any order!"
      else
        @Orders.each do |item|
          Product.update(item.name, nil, item.quantity)
        end
        @Orders.clear
      end
    end

  end
end

# attr_accessor :id, :order_name, :order_amount, :order_quantity

# def initialize(name, amount, quantity)
#   @id = generate_order_id
#   # @user_email = Login.get_user_email
#   @order_name = Cart.name
#   @order_amount = Cart.amount
#   @order_quantity = Cart.quantity
# end

# @@order_id = 0
# def generate_order_id
#   @@order_id += 1
# end

# def generate_bill(price, quantity)
#   if @bill_amount.nil?
#     @bill_amount = price * quantity
#     puts "Amount to be paid: Rs.#{@bill_amount}"
#   else
#     @bill_amount += (price * quantity)
#     puts "Amount to be paid: Rs.#{@bill_amount}"
#   end
# end