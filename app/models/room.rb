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

  def self.most_narcissistic
    self.narcissism.sort_by{|k,v| v}.reverse[0][0]
  end

  def self.narcissism
    results = {}
    self.all.map do |room|
      results[room.name] = room.posts.map{|post| post.content}.join(" ").upcase.split(" ").count("I")
    end
    results
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

  def most_active_user
    return "no activity!" if self.posts.length == 0
    results = {}
    self.current_members.map {|member| results[member.username] = member.memberships.find_by(room_id: self.id).posts.count}
    results.sort_by{|k, v| v}.reverse[0][0]
  end
end
