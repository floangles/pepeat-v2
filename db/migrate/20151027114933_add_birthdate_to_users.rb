class AddBirthdateToUsers < ActiveRecord::Migration
  def change
    add_column :users, :birth, :date
  end
end
