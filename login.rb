$LOAD_PATH << '.'
require 'admin'
require 'user'

module Login
  @@admin_name = 'Shank'
  @@admin_password = 'pro123'
  extend Admin
  extend User

  def login
    puts "\n------Login------"
    print 'Enter Username: '
    username = gets.chomp
    print 'Enter Password: '
    password = gets.chomp
    puts

    if username == @@admin_name && password == @@admin_password
      # Proceed to Admin Dashboard
      Login.select_admin_operation
      logout
    elsif username == @username && password == @password
      # Proceed to User Dashboard
      Login.select_user_operation
      logout
    else
      puts 'Authentication Failed! Try again.'
      login
    end
  end

  def signup
    puts "\n------Signup------"
    print 'Enter Username: '
    @username = gets.chomp
    print 'Enter Password: '
    @password = gets.chomp
    puts 'Successfully Signed Up.'
    # Calling user_login method
    login
  end

  # Checking type of user.
  def check_user
    puts 'Signup/Login to continue.'
    print "\nEnter 'a' for Admin or 'b' for User: "
    user_type = gets.chomp

    if user_type == 'a'
      # Admin doesn't need to Signup.
      # Calling admin_login method
      login
    elsif user_type == 'b'
      # Calling Signup
      # If already signed up then login.
      if @username.nil?
        signup
      else
        login
      end
    else
      puts 'Invalid key entered. Try again.'
      check_user
    end
  end

  def logout
    puts "\nDo you want to continue to Home Page: (Y[es]/N[o])"
      choice = gets.chomp
      if %w[Y y].include?(choice)
        check_user
      else
        puts "\nThank You. Visit Again :)"
        exit
      end
  end
end
