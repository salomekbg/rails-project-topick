require 'rails_helper'

RSpec.describe User, type: :model do
	let(:user) { User.create(username: 'bob', password: 'password') }
	let(:topic) { Topic.create(name: 'Art_history') }
	let(:room) {Room.create(name: 'Art_stuff', topic_id: topic.id) }

	describe '#require_password' do
		let(:user_no_password) {User.create(username: 'fred', password: '') }
		it 'does not allow a user to create an account without a password' do
			expect(user_no_password.valid?).to eq(false)
		end
	end

	describe '#unique_username' do
		let(:bob_two) {User.create(username: 'bob', password: 'pass') }
		it 'does not allow a user to create an account without a password' do
		user
			expect(bob_two.valid?).to eq(false)
		end
	end

	describe '#has_room_count' do
		it 'has a method to return the number of rooms a user is a member of' do
		room.users << user
			expect(user.room_count).to eq(1)
		end
	end
end
