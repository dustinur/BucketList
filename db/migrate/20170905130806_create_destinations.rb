class CreateDestinations < ActiveRecord::Migration[5.1]
  def change
    create_table :destinations do |t|
      t.text :body
      t.belongs_to :list, foreign_key: true

      t.timestamps
    end
  end
end
