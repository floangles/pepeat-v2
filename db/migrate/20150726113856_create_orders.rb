class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :portion
      t.references :user, index: true, foreign_key: true
      t.references :meal, index: true, foreign_key: true
      t.string :state
      t.json :payment
      t.monetize :amount, currency: { present: false }

      t.timestamps null: false
    end
  end
end
