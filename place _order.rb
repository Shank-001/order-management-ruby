# OBSOLETE
module PlaceOrder
  @@no_of_order = 0
  def placing_order
    print 'Choose your order: '
    # Getting choice from user.
    choice = gets.to_i
    case choice
    when 1
      puts 'Order placed for Shuttlecock.'
      @@no_of_order += 1
    when 2
      puts 'Order placed for Racket.'
      @@no_of_order += 1
    when 3
      puts 'Order placed for Net.'
      @@no_of_order += 1
    when 4
      puts 'Order placed for Gum Shoe.'
      @@no_of_order += 1
    when 5
      puts 'Order placed for Shorts.'
      @@no_of_order += 1
    when 0
      puts "Number of Orders: #{@@no_of_order}"
      puts 'Exited.'
      exit
    else
      puts "Invalid Selection!\nPlease try again."
      placing_order
    end

    puts 'Do you want to place more order: (Y[es]/N[o])'
    choice1 = gets.chomp
    # if choice1 == ('Y' || 'y')        --Invalid Syntax--
    if %w[Y y].include?(choice1)
      placing_order
    else
      puts "Number of Orders: #{@@no_of_order}"
      puts 'Exited.'
      exit
    end
  end
end
