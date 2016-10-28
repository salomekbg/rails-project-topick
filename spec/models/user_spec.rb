require 'rails_helper'

RSpec.describe User, type: :model do
	let(:user) {User.create(username: 'bob', password: 'password') }

	describe '#name' do
		it 'capitalizes the users username' do
			expect(user.username).to eq('Bob')
		end
	end
end