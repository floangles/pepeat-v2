class AddHomeHourToMeals < ActiveRecord::Migration
  def change
    add_column :meals, :home_hour, :datetime
  end
end
