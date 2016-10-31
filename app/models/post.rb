# == Schema Information
#
# Table name: posts
#
#  id            :integer          not null, primary key
#  membership_id :integer
#  content       :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Post < ApplicationRecord
  validates :content, presence: true, on: :create

  belongs_to :membership
end
