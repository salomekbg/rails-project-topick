# == Schema Information
#
# Table name: rooms
#
#  id         :integer          not null, primary key
#  name       :string
#  topic_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
	let(:user) {User.create(username: 'bob', password: 'password')}
	let(:topic) {Topic.create(name: 'Art_history')}
	let(:room) {Room.create(name: 'Art_stuff', topic_id: topic.id)}

	describe '#require_name' do
		let(:room_no_name) {Room.create(name: '', topic_id: '1') }
		it 'does not allow a user to create a room without a name' do
			expect(room_no_name.valid?).to eq(false)
		end
	end

	describe '#unique_name_per_topic' do
		let(:room_two) {Room.create(name: 'Art_stuff', topic_id: '1') }
		it 'does not allow a user to create a room with the same name as another room in the same topic' do
			expect(room_two.valid?).to eq(false)
		end
	end

	describe '#require_topic_id' do
		let(:room_no_topic_id) {Room.create(name: 'Lobsters', topic_id: '') }
		it 'does not allow a user to create a room without choosing a topic' do
			expect(room_no_topic_id.valid?).to eq(false)
		end
	end

	describe '#has_users_count' do
		it 'has a method to return the number of users a room has' do
		room.users << user
			expect(room.users_count).to eq(1)
		end
	end

	describe '#no_same_users' do
		it 'will not allow the same user to be added more than once to a room' do
		room.users << user
		room.users << user
			expect(room.users_count).to eq(1)
		end
	end
end
