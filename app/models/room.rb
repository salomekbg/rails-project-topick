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

  def most_narcissistic
    Room.all.map {|room| room.narcissism}.sort.last
  end

  def narcissism
    allposts = self.posts.map{|post| post.content }.join(" ").upcase
    allposts.split(" ").count("I")
  end

  def users_count
    self.users.uniq.count - 1
  end

  def posts_count
    self.posts.count
  end

  def last_post
    self.posts.last
  end

  def current_members
    deleted_user = User.find_by(username: "deleted_user")
    self.users.uniq - [deleted_user]
  end

  def total_posts
    self.posts.count
  end
end
