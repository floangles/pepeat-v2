class AddTakeAwayToMeals < ActiveRecord::Migration
  def change
    add_column :meals, :start_hour_home, :datetime
    add_column :meals, :takeaway, :boolean
  end
end
