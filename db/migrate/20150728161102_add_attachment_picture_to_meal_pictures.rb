class AddAttachmentPictureToMealPictures < ActiveRecord::Migration
  def self.up
    change_table :meal_pictures do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :meal_pictures, :picture
  end
end
