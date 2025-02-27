class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.datetime :date_start
      t.datetime :date_end
      t.references :user, null: false, foreign_key: true
      t.references :listing, null: false, foreign_key: true

      t.timestamps
    end
  end
end
