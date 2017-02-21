class CreateEventInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :event_infos do |t|
      t.string :title, null: false
      t.text :description
      t.belongs_to :event, null: false

      t.timestamps
    end
  end
end
