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
  validates :username, presence: true, uniqueness: true, length: {in: 3..20}
  validates :password, presence: true, length: {in: 6..20}
  validates :password_confirmation, presence: true

  has_many :memberships
  has_many :rooms, through: :memberships
  has_many :posts, through: :memberships
end
