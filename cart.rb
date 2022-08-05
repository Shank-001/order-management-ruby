$LOAD_PATH << '.'
require 'product'

class Cart
  CART = []

  attr_accessor :id, :name, :amount, :quantity

  def initialize(name, amount, quantity)
    @id = generate_item_id
    @name = name
    @amount = amount
    @quantity = quantity
  end

  @@item_id = 0
  def generate_item_id
    @@item_id += 1
  end

  class << self
    # Here all methods are Class methods
    
    def adding(name, quantity)
      found_arr = find_in_cart(name) 
      if found_arr.empty?
        result_arr = Product.search_by(name)
        result_arr.find do |item|
          amount = (item.price * quantity)   # Check we can use Product.item.amount
          cart_item = Cart.new(name, amount, quantity)
          CART.push(cart_item)  # push new cart_item_object
        end
      else
        updating(name, quantity)
      end
    end
    
    def reading
      puts "\n--Your Cart--"
      total_amount = 0
      if CART.empty?
        puts "\nYour cart is empty!"
      else
        puts "\nId   | Name     | Amount     | Quantity"
        CART.each do |item|
          puts "-#{item.id}-  | #{item.name}    | Rs.#{item.amount}     | #{item.quantity}"
          total_amount += item.amount
        end
        puts "\nTotal amount: Rs.#{total_amount}"
      end
    end
    
    def updating(name, quantity)
      found_arr = find_in_cart(name) 
      if found_arr.empty?
        puts "\nItem not found in cart!"
      else
        found_arr.find do |cart_item|
          result_arr = Product.search_by(name)
          result_arr.find do |item|
            cart_item.amount += (item.price * quantity)
          end
          cart_item.quantity += quantity
        end
      end
    end
    
    def deleting(name, quantity) 
      found_arr = find_in_cart(name) 
      if found_arr.empty?
        puts "\nItem not found in cart!"
      else
        found_arr.find do |cart_item|
          if cart_item.quantity >= quantity
            result_arr = Product.search_by(name)
            result_arr.find do |item|
              cart_item.amount -= (item.price * quantity)
            end
            cart_item.quantity -= quantity
          else
            puts "\nInvalid Quantity! Only #{item.quantity} #{name} is/are present in cart."
          end
        end
      end
    end

    def find_in_cart(name)
      CART.select { |item| item.name == name }
    end
  end
end
