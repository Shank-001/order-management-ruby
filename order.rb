module Order
  @@no_of_order = 0
  def place_order
    print "\nChoose your order (using key): "
    key = gets.to_i
    set_order_details(key)

    puts 'Do you want to place more order: (Y[es]/N[o])'
    choice1 = gets.chomp
    # if choice1 == ('Y' || 'y')        --Wrong Login/Syntax--
    # if choice1 == 'Y' || choice1 ==  'y'      --Valid Logic/Syntax--
    if %w[Y y].include?(choice1)
      place_order
    else
      puts "Number of Orders: #{@@no_of_order}"
    end
  end

  def cancel_order
    print "\nEnter the product key that you want to cancel: "
    key = gets.to_i
    @@no_of_order -= 1
    puts 'Order cancelled successfully.'
  end

  def set_order_details(key)
    @@no_of_order += 1
    product_detail = $items.each(key) { |item| item }
    $order_details.push(product_detail)
  end

  def get_order_details
    if $order_details.empty?
      puts 'No order found.'
    else
      puts 'My orders: '
      $order_details.each do |product_detail|
        product_detail.each do |key, value|
          puts "#{key} : #{value}"
        end
      end
      puts "Number of Orders: #{@@no_of_order}"
      puts
    end
  end
end
