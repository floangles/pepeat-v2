class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :portion
      t.datetime :start_date
      t.datetime :end_date
      t.references :user, index: true, foreign_key: true
      t.references :meal, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
