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
#  start_date  :datetime
#  end_date    :datetime
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
  has_many :orders
  has_many :meal_pictures, dependent: :destroy

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :portion, presence: true
  validates :price, presence: true

end
