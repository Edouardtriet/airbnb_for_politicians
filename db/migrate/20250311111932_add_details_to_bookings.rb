class AddDetailsToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :special_requests, :text
  end
end
