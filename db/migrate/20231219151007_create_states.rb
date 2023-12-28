class CreateStates < ActiveRecord::Migration[7.1]
  def change
    create_table :states do |t|
      t.references :country, null: false, foreign_key: true
      t.string :name
      t.string :abbreviation, index: true
      t.string :capital
      t.boolean :is_active, null: false, default: true, index: true

      t.timestamps
    end
    add_index :states, :name, unique: true
    add_index :states, :capital, unique: true
  end
end
