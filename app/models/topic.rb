# == Schema Information
#
# Table name: topics
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Topic < ApplicationRecord
  has_many :rooms

  def room_count
    self.rooms.count
  end

  def users_count
    total = 0
    self.rooms.each {|room| total += room.users_count}
    total
  end

  def posts_count
    total = 0
    self.rooms.each {|room| total += room.posts_count}
    total
  end
end
