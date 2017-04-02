class AddCredentialsToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :credentials, :integer, null: false, default: 0
  end
end
