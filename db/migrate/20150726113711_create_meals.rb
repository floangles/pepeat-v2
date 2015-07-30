class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.string :main
      t.string :starter
      t.string :dessert
      t.integer :price
      t.integer :portion
      t.text :description
      t.datetime :day
      t.datetime :start_hour
      t.datetime :end_hour
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
