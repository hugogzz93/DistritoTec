class AddAvatarColumnsToEvents < ActiveRecord::Migration[5.0]
  def change
  	add_attachment :events, :avatar
  end
end
