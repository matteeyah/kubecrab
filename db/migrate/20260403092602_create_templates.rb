class CreateTemplates < ActiveRecord::Migration[8.0]
  def change
    create_table :templates do |t|
      t.string :name, null: false
      t.text :template
      t.integer :status, null: false, default: 0
      t.references :engine, null: false, foreign_key: true
      t.timestamps
    end

    add_index :templates, :name, unique: true
  end
end
