class CreateChiefPictures < ActiveRecord::Migration
  def change
    create_table :chief_pictures do |t|
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
