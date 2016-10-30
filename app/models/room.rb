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

class Room < ApplicationRecord
  validates :name, presence: true, uniqueness: {scope: :topic}, on: :create

  belongs_to :topic
  has_many :memberships
  has_many :posts, through: :memberships
  has_many :users, through: :memberships

  def users_count
    self.users.uniq.count
  end
end
