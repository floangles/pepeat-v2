class AddCguToMeals < ActiveRecord::Migration
  def change
    add_column :meals, :cgu, :boolean
  end
end
