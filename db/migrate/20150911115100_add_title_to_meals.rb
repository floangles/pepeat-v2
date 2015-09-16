class AddTitleToMeals < ActiveRecord::Migration
  def change
    add_column :meals, :title, :string
  end
end
