# == Schema Information
#
# Table name: chief_pictures
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_chief_pictures_on_user_id  (user_id)
#

class ChiefPicture < ActiveRecord::Base
  belongs_to :user
end
