require_relative "../rails_helper.rb"

describe 'Feature Test: User Signup', :type => :feature do

  it 'successfully signs up a user' do
    visit_signup
    expect(current_path).to eq('/signup')
    user_signup
    expect(page).to have_content("Amy Poehler")
  end

    it "on sign up, successfully adds a session hash" do
    visit_signup
    user_signup
    expect(page.get_rack_session_key('user_id')).to_not be_nil
  end

  it "on log in, successfully adds a session hash" do
    visit_signin
    user_login
    expect(page.get_rack_session_key('user_id')).to_not be_nil
  end

  it 'prevents user from viewing user show page and redirects to signin page if not logged in' do
    @mindy = User.create(
      username: "Mindy",
      password: "password",
    )
    visit '/users/1'
    expect(current_path).to eq('/signin')
    expect(page).to have_content("Sign In")
  end

end

describe 'Feature Test: User Signout', :type => :feature do

  it 'has a link to log out from the users/show page' do
    visit_signup
    user_signup
    expect(page).to have_button("Logout")
  end

  it 'redirects to home page after logging out' do
    visit_signup
    user_signup
    click_button("Logout")
    expect(current_path).to eq('/')
  end

  it "successfully destroys session hash when 'Logout' is clicked" do
    visit_signup
    user_signup
    click_button("Logout")
    expect(page.get_rack_session).to_not include("user_id")
  end

end