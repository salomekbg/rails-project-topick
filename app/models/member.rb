class Member < ApplicationRecord
  has_many :posts
  belongs_to :room
  belongs_to :user
end
