class AddTableToUsers < ActiveRecord::Migration
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :surname, :string
    add_column :users, :chief, :boolean
    add_column :users, :description, :text
    add_column :users, :address, :string
  end
end
