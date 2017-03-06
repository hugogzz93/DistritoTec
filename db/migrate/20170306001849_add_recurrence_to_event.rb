class AddRecurrenceToEvent < ActiveRecord::Migration[5.0]
  def change
  	add_column :events, :recurrence, :boolean, default: :false, null: false
  end
end
