# == Schema Information
#
# Table name: meals
#
#  id          :integer          not null, primary key
#  main        :string
#  starter     :string
#  dessert     :string
#  price       :integer
#  portion     :integer
#  description :text
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_meals_on_user_id  (user_id)
#

class Meal < ActiveRecord::Base
  belongs_to :user
end
