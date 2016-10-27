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
  belongs_to :membership
end
