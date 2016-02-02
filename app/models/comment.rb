# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  commenter  :text
#  meal_id    :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_comments_on_meal_id  (meal_id)
#  index_comments_on_user_id  (user_id)
#

class Comment < ActiveRecord::Base

  belongs_to :meal
  belongs_to :user

  validates :commenter, presence: true, length: {maximum: 2000}

end
