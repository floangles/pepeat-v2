class CreateMealPictures < ActiveRecord::Migration
  def change
    create_table :meal_pictures do |t|
      t.string :caption
      t.references :meal, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
