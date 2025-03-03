class RenameTypeColumnInListings < ActiveRecord::Migration[7.1]
  def change
    rename_column :listings, :type, :type_of_event
  end
end
