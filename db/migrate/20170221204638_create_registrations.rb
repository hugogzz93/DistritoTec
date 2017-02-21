class CreateRegistrations < ActiveRecord::Migration[5.0]
  def change
    create_table :registrations do |t|
      t.belongs_to :event_date, null: false
      t.belongs_to :user, null: false

      t.timestamps
    end
  end
end
