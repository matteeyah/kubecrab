class CreateCrabs < ActiveRecord::Migration[8.0]
  def change
    create_table :crabs do |t|
      t.string :name, null: false
      t.text :options
      t.integer :status, null: false, default: 0
      t.references :template, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
