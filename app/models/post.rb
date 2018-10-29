# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  title      :string
#  body       :text
#

class Post < ApplicationRecord
  validates :title, presence: true
  validates :body,  presence: true
end
