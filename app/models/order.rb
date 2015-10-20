# == Schema Information
#
# Table name: orders
#
#  id           :integer          not null, primary key
#  portion      :integer
#  user_id      :integer
#  meal_id      :integer
#  state        :string
#  payment      :json
#  amount_cents :integer          default(0), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  review       :text
#  charge       :string
#
# Indexes
#
#  index_orders_on_meal_id  (meal_id)
#  index_orders_on_user_id  (user_id)
#

class Order < ActiveRecord::Base

  ratyrate_rateable "qualite"

  monetize :amount_cents

  belongs_to :user
  belongs_to :meal

  validates :portion, presence: true
end
