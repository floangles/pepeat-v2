class AddDefaultValueToBooleanAttribute < ActiveRecord::Migration
  def up
  change_column :users, :stripe, :boolean, :default => false
  change_column :users, :admin, :boolean, :default => false
  change_column :users, :chief, :boolean, :default => false
  change_column :meals, :cgu, :boolean, :default => false
  change_column :orders, :payment_validation, :boolean, :default => false
  end

  def down
    change_column :users, :stripe, :boolean, :default => nil
    change_column :users, :admin, :boolean, :default => nil
    change_column :users, :chief, :boolean, :default => nil
    change_column :meals, :cgu, :boolean, :default => nil
    change_column :orders, :payment_validation, :boolean, :default => nil
  end
end
