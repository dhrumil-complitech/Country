class CreateCountries < ActiveRecord::Migration[7.1]
  def change
    create_table :countries do |t|
      t.string :name
      t.string :code
      t.boolean :is_active, null: false, index:true, default: true

      t.timestamps
    end
    add_index :countries, :name, unique: true
    add_index :countries, :code, unique: true
  end
end
