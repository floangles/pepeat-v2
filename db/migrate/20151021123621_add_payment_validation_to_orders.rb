class AddPaymentValidationToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :payment_validation, :boolean
  end
end
