# == Schema Information
#
# Table name: meals
#
#  id              :integer          not null, primary key
#  main            :string
#  starter         :string
#  dessert         :string
#  price_cents     :integer          default(0), not null
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
#  home            :boolean
#  home_hour       :datetime
#  validation      :boolean
#  ingredients     :text
#  cgu             :boolean          default(FALSE)
#
# Indexes
#
#  index_meals_on_user_id  (user_id)
#

class Meal < ActiveRecord::Base

  monetize :price_cents

  belongs_to :user
  has_many :orders
  has_many :meal_pictures, dependent: :destroy

  validates :takeaway, presence: true, unless: "home?"
  validates :home, presence: true, unless: "takeaway?"
  validates :start_hour, presence: true, if: "takeaway?"
  validates :end_hour, presence: true, if: "takeaway?"
  validates :home_hour, presence: true, if: "home?"
  validates :day, presence: true
  validates :title, presence: true
  validates :cgu, presence: true
  validates :portion, presence: true
  validates :price, presence: true
  validates :ingredients, presence: true

end



