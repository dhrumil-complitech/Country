class CreateCities < ActiveRecord::Migration[7.1]
  def change
    create_table :cities do |t|
      t.references :country, null: false, foreign_key: true
      t.references :state, null: false, foreign_key: true
      t.string :name
      t.string :zip, index: true
      t.integer :population

      t.timestamps
    end
    add_index :cities, :name, unique: true
  end
end
