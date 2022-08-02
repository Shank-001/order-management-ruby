$LOAD_PATH << '.'
require 'login'

class Main < Login
  # extend Login

  puts '------------Welcome to eStuff.com------------'
  def initiate_login
    Main.new.check_user
    # Main.new.login_operations
  end

  Main.new.initiate_login
end
