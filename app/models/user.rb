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


  def average_post_per_day  
    days_active = ((Time.now - self.created_at)/3600)/24
    (days_active / self.post_count).round(1)
  end


  def room_count
  	self.rooms.count
  end

  def post_count
    self.posts.count
  end

  def most_narcissistic_user
    puts "foo"
  end

  def most_active_user
  end

  def favorite_room
  end

  

end
