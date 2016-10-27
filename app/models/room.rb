class Room < ApplicationRecord
  belongs_to :topic
  has_many :members
  has_many :posts, through: :members
  has_many :users, through: :members
end
