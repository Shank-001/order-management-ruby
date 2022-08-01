$LOAD_PATH << '.'
require 'login'

class Main
  puts '------------Welcome to eStuff.com------------'
  extend Login
  Main.check_user
end
