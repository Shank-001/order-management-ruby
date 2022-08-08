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
    # Here all methods are Class methods

    def create(name, price, quantity)
      result_arr = search_by(name)
      if result_arr.empty?
        item = Product.new(name, price, quantity)
        ITEMS.push(item)
      else
        update(name, price, quantity)
      end
    end

    def read
      puts "--Items in stock--"
      if ITEMS.empty?
        puts "\nItem list is empty!"
      else
        puts "\nId   | Name     | Price     | Quantity"
        ITEMS.each do |item|
          puts "-#{item.id}-  | #{item.name}    | Rs.#{item.price}     | #{item.quantity}"
        end
      end
    end

    def update(name, price, quantity)
      result_arr = search_by(name)
      if result_arr.empty?
        puts "\nItem not found!"
      else
        result_arr.find do |item|
          item.price = price unless price.nil?
          item.quantity += quantity
        end
      end
    end

    def delete(name, quantity)
      result_arr = search_by(name)
      if result_arr.empty?
        puts "\nItem not found!"
      else
        result_arr.find do |item|
          if item.quantity >= quantity
            item.quantity -= quantity
          else
            puts "\nSorry! Only #{item.quantity} #{name} is/are present in stock."
          end
        end
      end
    end

    def search_by(name)
      ITEMS.select { |item| item.name == name }
    end
  end

  # Default products
  create('Apple', 100, 51)
  create('Banana', 20, 101)
  create('Mango', 50, 151)
end
