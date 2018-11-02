# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  title      :string
#  body       :text
#  user_id    :integer
#

class Post < ApplicationRecord
  validates :title, presence: true
  validates :body,  presence: true

  belongs_to :user
end
