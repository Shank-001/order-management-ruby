class Product
  ITEMS = []

  attr_accessor :id, :name, :price, :quantity

  def initialize(name, price, quantity)
    @id = generate_product_id
    @name = name
    @price = price
    @quantity = quantity
    # ITEMS << self
  end

  @@product_id = 0
  def generate_product_id
    @@product_id += 1
  end

  class << self
    def create(name, price, quantity)
      item = Product.new(name, price, quantity)
      ITEMS.push(item)
    end

    def read
      if ITEMS.empty?
        puts 'Item list is empty!'
      else
        puts 'Id   | Name     | Price     | Quantity'
        ITEMS.each do |item|
          puts "-#{item.id}-  | #{item.name}    | Rs.#{item.price}     | #{item.quantity}"
        end
      end
    end

    def update(name, quantity)
      result_arr = search_by(name)
      if result_arr.empty?
        puts 'Item not found!'
      else
        result_arr.find do |item|
          item.quantity += quantity
        end
      end
    end

    def delete(name, quantity)
      result_arr = search_by(name)
      if result_arr.empty?
        puts 'Item not found!'
      else
        result_arr.find do |item|
          if item.quantity >= quantity
            item.quantity -= quantity
          else
            puts "Only #{item.quantity} #{name} is/are present in stock."
          end
        end
      end
    end

    def search_by(name)
      ITEMS.select { |item| item.name == name }
    end
  end
end
