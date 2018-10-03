class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.integer :user_id
      t.integer :conference_room_id
      t.datetime :booking_date
      t.time :start_time
      t.time :end_time
      t.string :status
      t.string :description
      t.timestamps
    end
  end
end
