class AddAttachmentChiefpictureToChiefPictures < ActiveRecord::Migration
  def self.up
    change_table :chief_pictures do |t|
      t.attachment :chiefpicture
    end
  end

  def self.down
    remove_attachment :chief_pictures, :chiefpicture
  end
end
