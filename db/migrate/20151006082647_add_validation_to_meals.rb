class AddValidationToMeals < ActiveRecord::Migration
  def change
    add_column :meals, :validation, :boolean
  end
end
