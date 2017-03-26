class AddAvatarColumnsToEventInfo < ActiveRecord::Migration[5.0]
  def up
  	add_column :event_infos, :avatar_file_name, :string
  	add_column :event_infos, :avatar_content_type, :string
  	add_column :event_infos, :avatar_file_size, :integer
  	add_column :event_infos, :avatar_updated_at, :datetime
  end

  def down
  	add_column :event_infos, :avatar_file_name, :string
  	add_column :event_infos, :avatar_content_type, :string
  	add_column :event_infos, :avatar_file_size, :integer
  	add_column :event_infos, :avatar_updated_at, :datetime
  end
end
