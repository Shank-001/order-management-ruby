$LOAD_PATH << '.'
require 'product_manage'
include ProductManage

module User
  def show
    puts '------User Dashboard------'
    Main.new.show_item_list
  end
end
