class AddFieldsToEventRegistration < ActiveRecord::Migration[5.0]
  def change
  	add_column :event_registrations, :business_name, :string
  	add_column :event_registrations, :person_name, :string
  	add_column :event_registrations, :product_name, :string
  	add_column :event_registrations, :phone, :string
  	add_column :event_registrations, :social_media_url, :string
  	add_column :event_registrations, :business_description, :string
  	add_column :event_registrations, :email, :string
  	add_column :event_registrations, :stand, :integer
  end
end
