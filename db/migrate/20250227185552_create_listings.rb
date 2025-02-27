class CreateListings < ActiveRecord::Migration[7.1]
  def change
    create_table :listings do |t|
      t.string :name
      t.string :type
      t.decimal :price
      t.string :location
      t.datetime :availability_start
      t.datetime :availability_end
      t.string :picture
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
