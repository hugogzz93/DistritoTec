class AddUserAndRegistrationType < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :special_type, :integer, default: 0
  	add_column :event_registrations, :special_type, :integer, default: 0
  end
end
