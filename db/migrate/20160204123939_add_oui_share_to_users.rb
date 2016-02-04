class AddOuiShareToUsers < ActiveRecord::Migration
  def change
    add_column :users, :ouishare, :boolean
  end
end
