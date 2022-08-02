module Product
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
    end
  end

  def show_items
    puts "\nItems list: "
    $items.each do |item|
      item.each do |key, value|
        puts "#{key} : #{value}"
      end
    end
  end

  def remove_item
    print "\nEnter the product key that you want to remove: "
    key = gets.to_i
    $items.each do |item|
      item.delete(key)
    end
    @@product_id -= 1
    puts 'Product removed successfully.'
  end
end
