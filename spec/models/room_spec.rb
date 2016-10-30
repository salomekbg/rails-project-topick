require 'rails_helper'

RSpec.describe User, type: :model do
	let(:user) { User.create(username: 'bob', password: 'password') }
	let(:topic) { Topic.create(name: 'Art_history') }
	let(:room) {Room.create(name: 'Art_stuff', topic_id: topic.id) }

  describe '#unique_name' do
    
  end

#   Room has a unique name
# Room has a maximum of ___ members
# Room can have a maximum of 1 topic
# Room show page only lists last 20 posts
# Room page shows list of all current user

end
