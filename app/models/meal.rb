# == Schema Information
#
# Table name: meals
#
#  id              :integer          not null, primary key
#  main            :string
#  starter         :string
#  dessert         :string
#  price           :integer
#  portion         :integer
#  description     :text
#  day             :datetime
#  start_hour      :datetime
#  end_hour        :datetime
#  user_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  start_hour_home :datetime
#  takeaway        :boolean
#  title           :string
#
# Indexes
#
#  index_meals_on_user_id  (user_id)
#

class Meal < ActiveRecord::Base


  belongs_to :user
  has_many :orders
  has_many :meal_pictures, dependent: :destroy

  validates :start_hour, presence: true
  validates :day, presence: true
  validates :portion, presence: true
  validates :price, presence: true

end
