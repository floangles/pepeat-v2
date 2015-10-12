class AddProAndAmateurToUsers < ActiveRecord::Migration
  def change
    add_column :users, :pro, :boolean
    add_column :users, :amateur, :boolean
  end
end
