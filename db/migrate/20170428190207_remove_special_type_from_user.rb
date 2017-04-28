class RemoveSpecialTypeFromUser < ActiveRecord::Migration[5.0]
  def change
  	remove_column :users, :special_type
  end
end
