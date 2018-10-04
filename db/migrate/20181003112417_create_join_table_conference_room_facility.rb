class CreateJoinTableConferenceRoomFacility < ActiveRecord::Migration[5.2]
  def change
    create_join_table :conference_rooms, :facilities do |t|
      # t.index [:conference_room_id, :facility_id]
      # t.index [:facility_id, :conference_room_id]
    end
  end
end
