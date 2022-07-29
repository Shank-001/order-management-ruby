$LOAD_PATH << '.'
require 'admin'
require 'user'

module Login
  @@admin_name = 'Shank'
  @@admin_password = 'Pro@123'

  def login
    puts "\n------Login------"
    print 'Enter Username: '
    username = gets.chomp
    print 'Enter Password: '
    password = gets.chomp
    puts

    if username == @@admin_name && password == @@admin_password
      # Proceed to Admin Dashboard
      include Admin
      Admin.show
    elsif username == @@username && password == @@password
      # Proceed to User Dashboard
      include User
      User.show
    else
      puts 'Authentication Failed! Try again.'
      login
    end
  end

  # def admin_login
  #   puts "\n------Login------"
  #   print 'Enter Admin name: '
  #   username = gets.chomp
  #   print 'Enter Admin password: '
  #   password = gets.chomp
  #   puts

  #   if username == @@admin_name && password == @@admin_password
  #     # Proceed to Admin Dashboard
  #     # include Admin
  #     require 'admin'
  #   else
  #     puts "Authentication Failed! Try again."
  #     admin_login
  #   end
  # end

  def signup
    puts "\n------Signup------"
    print 'Enter Username: '
    @@username = gets.chomp
    print 'Enter Password: '
    @@password = gets.chomp
    puts 'Successfully Signed Up.'
    # Calling user_login method
    login
  end

  # def user_login
  #   puts "\n------Login------"
  #   print 'Enter Username: '
  #   username = gets.chomp
  #   print 'Enter Password: '
  #   password = gets.chomp
  #   puts

  #   if username == @username && password == @password
  #     # Proceed to User Dashboard
  #     # include User
  #     require 'user'
  #   else
  #     puts 'Authentication Failed! Try again.'
  #     user_login
  #   end
  # end

  # Checking type of user.
  def check_user
    puts 'Signup/Login to continue.'
    print "Enter 'a' for Admin or 'b' for User: "
    user_type = gets.chomp

    if user_type == 'a'
      # Admin doesn't need to Signup.
      # Calling admin_login method
      login
    elsif user_type == 'b'
      # Calling Signup
      signup
    else
      puts 'Invalid key entered. Try again.'
      check_user
    end
  end
end
