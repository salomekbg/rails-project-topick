class User < ApplicationRecord
  has_many :rooms
  has_many :members
  has_many :posts, through: :members
end
