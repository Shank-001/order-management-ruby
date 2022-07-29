$LOAD_PATH << '.'
require 'login'

class Main
  puts "------------Welcome to eStuff.com------------"
  include Login
  Main.new.check_user
end
