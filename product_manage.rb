module ProductManage
  
  def show_item_list
    items = {
      101 => 'Maaza',
      102 => 'Amul Ghee',
      103 => 'Kissan Ketchup',
      104 => 'Parle-G',
      105 => 'Tata Salt'
    }
    puts "Item List: \n"
    items.each { |key, value| puts " #{key} : #{value}" }
  end
end
