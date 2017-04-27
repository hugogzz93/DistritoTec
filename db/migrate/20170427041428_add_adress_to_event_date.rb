class AddAdressToEventDate < ActiveRecord::Migration[5.0]
  def change
  	add_column :event_dates, :address, :text
  end
end
