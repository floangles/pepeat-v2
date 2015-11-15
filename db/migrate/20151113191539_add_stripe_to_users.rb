class AddStripeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :stripe, :boolean
  end
end
