$LOAD_PATH << '.'
require 'admin'
require 'user'

class Login
  @@admin_email = 'admin'
  @@admin_password = '123'
  include Admin
  include User

  def login
    puts "\n------Login------"
    print 'Enter E-mail: '
    email = gets.chomp
    print 'Enter Password: '
    password = gets.chomp

    if email == @@admin_email && password == @@admin_password
      # Proceed to Admin Dashboard
      select_admin_operation
      logout
      elsif email == @email && password == @password
    # elsif $user_database.each {|user| user.include?(email)} && $user_database.each {|user| user.include?(password)}
      # Proceed to User Dashboard
      select_user_operation
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
    print 'Enter E-mail: '
    @email = gets.chomp
    if @email == @@admin_email
      puts 'ID already taken. Try Again.'
      signup
    end
    print 'Enter Password: '
    @password = gets.chomp

    # Saving user details to database.
    user_detail = [@username, @email, @password]
    $user_database.push(user_detail)
    puts 'Successfully Signed Up.'
    logout
  end

  # Checking type of user.
  def check_user
    puts 'Signup/Login to continue.'
    print "\nEnter 'a' for Admin or 'b' for User: "
    user_type = gets.chomp

    if user_type == 'a'
      # Admin doesn't need to Signup.
      login
    elsif user_type == 'b'
      # Calling Signup
      # If already signed up then login.
      if @email.nil?
        signup
      else
        login
      end
    else
      puts 'Invalid key entered. Try again.'
      check_user
    end
  end

  # # Signup Multiple User.
  # def login_operations
  #   puts "\nSignup/Login to continue."
  #   print "Enter 'a' to Signup or 'b' to Login: "
  #   choice = gets.chomp

  #   if choice == 'a'
  #     signup
  #   elsif choice == 'b'
  #     login
  #   else
  #     puts 'Invalid key entered. Try again.'
  #     login_operations
  #   end
  # end

  def logout
    puts "\nDo you want to continue to Home Page: (Y[es]/N[o])"
    choice = gets.chomp
    if %w[Y y].include?(choice)
      Login.new.check_user
      # Login.new.login_operations
    else
      puts "\nThank You. Visit Again :)"
      exit
    end
  end
end
