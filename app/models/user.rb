# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :password, length: {in: 8..16}, on: :create

  has_many :memberships
  has_many :rooms, through: :memberships
  has_many :posts, through: :memberships

  def room_count
  	self.rooms.count
  end

  def most_narcissistic_user
  end

  def most_active_user
  end

  def favorite_room
  end

  

end
