class AddHomeToMeals < ActiveRecord::Migration
  def change
    add_column :meals, :home, :boolean
  end
end
