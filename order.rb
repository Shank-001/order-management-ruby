$LOAD_PATH << '.'
require 'product'

class Order
  class << self
    def place_order(name, quantity)
      result_arr = Product.search_by(name)
      if result_arr.empty?
        puts 'Item not found!'
      else
        result_arr.find do |item|
          if item.quantity >= quantity
            generate_bill(item.price, quantity)
          else
            puts "Only #{item.quantity} #{name} available in stock"
          end
        end
      end
    end

    def generate_bill(price, quantity)
      if @bill_amount.nil?
        @bill_amount = price * quantity
        puts "Amount to be paid: Rs.#{@bill_amount}"
      else
        @bill_amount += (price * quantity)
        puts "Amount to be paid: Rs.#{@bill_amount}"
      end
      # return bill_amount
    end
  end

  # def self.generate_bill(name, quantity)
  #   if @bill_amount == 0
  #     result_arr = search_by(name)
  #     result_arr.find do |item|
  #       @bill_amount = item.price * quantity
  #     end
  #   else
  #     result_arr = search_by(name)
  #     result_arr.find do |item|
  #       @bill_amount += item.price * quantity
  #     end
  #   end
  #   # return bill_amount
  # end
end
