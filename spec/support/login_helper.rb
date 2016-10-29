 module LoginHelper

  def visit_signup
    visit '/'
    click_link('Sign Up')
  end

  def user_signup
    fill_in("user[username]", :with => "Amy Poehler")
    fill_in("user[password]", :with => "password")
    fill_in("user[password_confirmation]", :with => "password")
    click_button('Create User')
  end

  def visit_signin
    visit '/'
    click_link('Sign In')
  end

  def user_login
    @mindy = User.create(
      username: "Mindy",
      password: "password",
    )
    fill_in("user[username]", :with => "Mindy")
    fill_in("user[password]", :with => "password")
    click_button('Login')
  end
end