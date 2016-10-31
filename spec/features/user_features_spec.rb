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

  describe 'Feature Test: Create a Room', :type => :feature do

    it 'creates a new room' do
      room_count = Room.all.count
      visit_signup
      user_signup
      fill_in("room[name]", :with => "this rooms name")
      click_button("Create a Room")
      expect(Room.all.count).to eq(room_count + 1)
    end

    it 'adds a user as a member of the room which they create' do

      visit_signup
      user_signup
      fill_in("room_name", :with => "room")
      # byebug
      # select('Science', :from => 'room_topic_id')
      click_button("Create a Room")
      byebug
      expect(Room.all.last.users.last.username).to include("Amy Poehler")
    end

  

  describe 'Feature Test: join a Room', :type => :feature do

    it 'joins a member with a new room' do
      create_room
      visit_signup
      user_signup
      click_link("Browse Topics")
      click_link("Biology")
      click_button("Join This Room")
      expect(User.all.last.rooms.last.name).to include("Bio")
    end
  end


end