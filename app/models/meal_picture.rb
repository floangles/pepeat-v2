# == Schema Information
#
# Table name: meal_pictures
#
#  id                   :integer          not null, primary key
#  caption              :string
#  meal_id              :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  picture_file_name    :string
#  picture_content_type :string
#  picture_file_size    :integer
#  picture_updated_at   :datetime
#
# Indexes
#
#  index_meal_pictures_on_meal_id  (meal_id)
#

class MealPicture < ActiveRecord::Base

  belongs_to :meal

  has_attached_file :picture,
    styles: { medium: "300x400#", thumb: "100x100>", large: "570x300#", extralarge: "628x300#" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/
end
