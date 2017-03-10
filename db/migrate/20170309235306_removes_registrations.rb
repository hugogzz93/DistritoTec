class RemovesRegistrations < ActiveRecord::Migration[5.0]
  def change
  	drop_table :registrations
  end
end
