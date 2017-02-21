class CreateEventDates < ActiveRecord::Migration[5.0]
  def change
    create_table :event_dates do |t|
      t.datetime :date, null: false
      t.belongs_to :event, null: false

      t.timestamps
    end
  end
end
