class AddNameColumnToLists < ActiveRecord::Migration[5.1]
  def change
    add_column :lists, :name, :string
  end
end
