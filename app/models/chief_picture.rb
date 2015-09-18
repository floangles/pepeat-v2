# == Schema Information
#
# Table name: chief_pictures
#
#  id                        :integer          not null, primary key
#  caption                   :string
#  user_id                   :integer
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  chiefpicture_file_name    :string
#  chiefpicture_content_type :string
#  chiefpicture_file_size    :integer
#  chiefpicture_updated_at   :datetime
#
# Indexes
#
#  index_chief_pictures_on_user_id  (user_id)
#

class ChiefPicture < ActiveRecord::Base
  belongs_to :user

  has_attached_file :chiefpicture,
    styles: { medium: "400x400#", thumb: "100x100>", large: "570x300#" }

  validates_attachment_content_type :chiefpicture,
    content_type: /\Aimage\/.*\z/
end
