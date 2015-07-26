# == Schema Information
#
# Table name: meal_pictures
#
#  id         :integer          not null, primary key
#  meal_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_meal_pictures_on_meal_id  (meal_id)
#

class MealPicture < ActiveRecord::Base
  belongs_to :meal
end
