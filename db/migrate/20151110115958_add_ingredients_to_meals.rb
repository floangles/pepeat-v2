class AddIngredientsToMeals < ActiveRecord::Migration
  def change
    add_column :meals, :ingredients, :text
  end
end
