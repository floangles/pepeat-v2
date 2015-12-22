class AddIntercomItemsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :number_meals_sold, :integer
    add_column :users, :ca, :integer
    add_column :users, :last_meal, :datetime
    add_column :users, :number_orders, :integer
    add_column :users, :last_order, :datetime
  end
end
