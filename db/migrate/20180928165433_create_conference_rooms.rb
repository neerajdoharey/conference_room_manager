class CreateConferenceRooms < ActiveRecord::Migration[5.2]  
  def change
    create_table :conference_rooms do |t|
      t.string :room_no
      t.integer :capacity
      t.integer :area
      t.string :unit
      t.timestamps
    end
  end
end
