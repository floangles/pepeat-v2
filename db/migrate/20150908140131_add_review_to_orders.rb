class AddReviewToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :review, :text
  end
end
