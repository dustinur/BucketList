class AddNameColumnToDestinations < ActiveRecord::Migration[5.1]
  def change
    add_column :destinations, :name, :string
  end
end
